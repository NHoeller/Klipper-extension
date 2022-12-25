#### Klippext - a Klipper Extension
####
#### Written by Nicolas Hoeller <Nicolas.hoeller@gmx.eu>
#### Copyright 2022
#### https://github.com/NHoeller/Klippext
####
#### This File is distributed under GPLv3
####

.PHONY: install updater wizzard

all: help

help:
	@echo "This is intended to install klippext."
	@echo ""
	@echo "Some Parts need 'sudo' privileges."
	@echo "You'll be asked for password, if needed."
	@echo ""
	@echo " Usage: make [action]"
	@echo ""
	@echo "  Available actions:"
	@echo ""
	@echo "   install      Installs klippext"
	@echo "   updater      installs klippext to moonrakers update manager"
	@echo "   wizzard      Runs the Klippext configuration wizzard"
	@echo ""

install:
	@bash -c './install_klippext.sh'

updater:
	@bash -c './install_klippext.sh -u'

wizzard:
	@bash -c './install_klippext.sh -w'

#uninstall