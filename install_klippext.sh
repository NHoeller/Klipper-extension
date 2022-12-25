#!/bin/bash
KLIPPER_PATH="${HOME}/klipper"
SYSTEMDDIR="/etc/systemd/system"
UPDATER=0
WIZZARD=0

#
# check startup
#
startup()
{
    # check for root user
    if [ "$EUID" -eq 0 ]; then
        echo "This script must not run as root"
        exit -1
    fi
    # verify that Klipper has been installed
    if [ "$(sudo systemctl list-units --full -all -t service --no-legend | grep -F "klipper.service")" ]; then
        echo "Klipper service found!"
    else
        echo "Klipper service not found, please install Klipper first"
        exit -1
    fi

}

#
# restart Klipper
#
restart_klipper()
{
    echo "Restarting Klipper..."
#    sudo systemctl restart klipper
}

#
# add update manager (moonraker.conf)
# webcamd to moonraker.conf
#
update_manager()
{
    echo -e "Adding update manager to moonraker.conf"

    update_section=$(grep -c '# Klippext update_manager entry\[update_manager klippext\]' \
    ${HOME}/klipper_config/moonraker.conf || true)
    if [ "${update_section}" -eq 0 ]; then
        echo -e "\n" >> ${HOME}/klipper_config/moonraker.conf
        while read -r line; do
            echo -e "${line}" >> ${HOME}/klipper_config/moonraker.conf
            done < "${HOME}/klippext/moonraker_update.txt"
        echo -e "\n" >> ${HOME}/klipper_config/moonraker.conf
        else
        echo -e "[update_manager klippext] already exist in moonraker.conf [SKIPPED]"
    fi
}

#
#
#
install_wizzard()
{
HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
BACKTITLE="Backtitle here"
TITLE="Title here"
MENU="Choose one of the following options:"

OPTIONS=(1 "Option 1"
         2 "Option 2"
         3 "Option 3")

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        1)
            echo "You chose Option 1"
            ;;
        2)
            echo "You chose Option 2"
            ;;
        3)
            echo "You chose Option 3"
            ;;
esac

#    echo "future feature - not available yet"
#    items=(1 "Item 1"
#       2 "Item 2")
#
#while choice=$(dialog --title "$TITLE" \
#                 --menu "Please select" 10 40 3 "${items[@]}")
#    do
#    case $choice in
#        1) ;; # some action on 1
#        2) ;; # some action on 2
#        *) ;; # some action on other
#    esac
#done
#clear # clear after user pressed Cancel
}

#
# copy configurations to klipper and make additional changes
#
install_ext()
{
    echo "Linking extension to Klipper..."
    #ln -sf "${SRCDIR}/led_effect.py" "${KLIPPER_PATH}/klippy/extras/led_effect.py"
}

################################################################################
## main script
################################################################################

# force script to exit if an error occurs
set -e

# output some text
echo "Klippext installation started"
echo "options:"

# check for options
while getopts 'uwk:' OPTION; do
  case "$OPTION" in
    u)
      echo "adding update manager to moonraker.conf"
      UPDATER=1
      ;;
    w)
      echo "use install wizard (future feature)"
      WIZZARD=1
      ;;
    k)
      echo "use alternative klipper path"
      KLIPPER_PATH=$OPTARG
      ;;
    ?)
      echo "script usage: $(basename \$0)"
      echo " -u | add update manager to moonraker"
      echo " -w | use installation wizzard"
      echo " -k [klipper-path] | use alternative klipper path"
      exit 1
      ;;
  esac
done
shift "$(($OPTIND -1))"

# find SRCDIR from the pathname of this script
SRCDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/ && pwd )"

# run scripts
startup
install_ext
if [ "${UPDATER}" == 1 ]; then
    update_manager
fi
if [ "${WIZZARD}" == 1 ]; then
    install_wizzard
fi
restart_klipper

## eof