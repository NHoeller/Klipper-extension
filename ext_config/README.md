# Extendend Configuration
### for Klipper (https://klipper3d.org)

#### Introduction
This GIT repository is designed to manage a couple of different configuration options in a compilation.
It should be easy to install, to configure and to manage.

#### Content
The extendend configuration contains only a few includes.
Depending on ones printer (controlboard, kinematics, etc) and additional hardware (Raspberry Pi, Pi Pico, Arduino Mega, etc) different parts of the configuration has to be uncommented.

#### Installation
One can just copy this repository manually or following the instructions below.

##### Preparation
connect to your Raspberry Pi, CB1 module, CM4 module or other device running klipper via ssh
```
ssh pi@mainsail.local
```
This will prompt one to enter your password.
```
`#00c000`pi@mainsail.local:`#0000c0`~ $ `#ffffff`cd printer_data/config
```
Changes your current directory to the config directory of one's printer
```
`#00c000`pi@mainsail.local:`#0000c0`~/printer_data/config $ `#ffffff`git clone https://github.com/NHoeller/Klipper-extension.git
```
This clones the github repository to one's into the printer's config folder.

##### Changing moonraker configuration
If one wants to update this compilation within klipper the moonraker.conf needs to be changed.
To do this head to the section MACHINE in the web GUI.
move to the section CONFIG FILES and choose the CONFIG section.
Now one should find the moonraker.conf, click to edit.
The following code should be added at the bottom of this file
```
[update_manager Klipper-extension]
type: git_repo
origin: https://github.com/NHoeller/Klipper-extension.git
path: ~/printer_data/config/Klipper-extension
primary_branch: main
is_system_service: False
managed_services: klipper
```

#### Future features
It is planned to summit some minor and major changes to Klipper, Mainsail, Fluidd and Octoprint.
These are the current options for summiting:
- [ ] variable configurations (see ...)
- [ ] configuration conditions (see ...)
- [ ] configuration assistant (see ...)