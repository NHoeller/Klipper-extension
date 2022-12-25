# Klipper Extension (Klippext)

### Introduction
I made this repository, because i wanted to create a universal configuration system for Klipper that i can use for my current and future printers. In the first step i am going to create a folder structure with main options like
- [ ] folder structure
- [ ] neopixel
- [ ] resonance-tester
- [ ] door-lock-controls
- [ ] temperature-controls
- [ ] mini-display (if 2nd dispplay is implemented in klipper)
- [ ] start-pause-resume-end macros
- [ ] bed-leveling-controls
These features will be placed in several seperat files and one or more master files.
To do changes one needs only to access the master files.

In the next step i will try to make suggestions to the Klipper-, Mainsail-, Fluidd- and Octoprint-community to bring some minor and major upgrades so a configuration with dependencies and/or a variable-based configuration can be implemented in klipper.

In the last step i will try to suggest additional functions, so one can do almost every change in the configuration guided by a webUI integrated in the mainsail-, fluidd- and octoprint webGUI.

For further details follow this repository and check this README.md


### Installation
For making the installation and configuration as simple as possible i decided to create an installer shell script, so one
only needs to follow the instructions below.

connect to your Raspberry Pi, CB1 module, CM4 module or other device running klipper via ssh
```
ssh pi@mainsail.local
```
this will prompt one to enter your password.

```
pi@mainsail.local:~ $ git clone https://github.com/NHoeller/klippext.git
```
This clones the github repository to one's into the printer's 'home' folder.

```
pi@mainsail.local:~ $ install_klippext.sh
```
this script will check all requirements and then copy some files, create some symlinks and do some other stuff
##### available options for the installer script:
- [-u] add this repository to moonraker update manager
- [-w] will start an installation wizzard (future feature)
- [-k (alternative klipper path)] will set an alternativ e klipper directory

### Klipper, Mainsail, Fluidd and Octoprint
This repository contains configurations and macro files that can be integrated into a klipper environment for 3d printing
using the mainsail, fluidd or octoprint webGUI.

#### Klipper3d
see https://www.klipper3d.org or https://github.com/Klipper3d for more details

#### Mainsail
see https://docs.mainsail.xyz/ or https://github.com/mainsail-crew/mainsail for more details

#### Fluidd
see https://docs.fluidd.xyz or https://github.com/fluidd-core/fluidd for more details

#### Octoprint
see https://docs.fluidd.xyz or https://github.com/OctoPrint/OctoPrint for more details


### License and documentation
This repository is published under [GNU public license](https://github.com/NHoeller/Klipper-extension/LICENSE.md).
The complete Documentation will be published in this repository inside the [README section](https://github.com/NHoeller/Klipper-extension/README/DOCUMENTAION.md)