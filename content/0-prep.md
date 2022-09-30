---
title: Tutorial Preparation
nav: Prep
---

## What to Bring

Please bring a laptop with:

* 1 CPU core (4 recommended)
* 4 GB of RAM (16 recommended)
* 10 GB of free hard disk space (15 recommended)
* Installation of the [tutorial repository](https://github.com/The-OpenROAD-Project/micro2022tutorial)
  * [Installation of a virtual machine](#method-1-install-a-virtual-machine) *or*
  * [Installation in a Docker container](#method-2-install-from-docker) *or*
  * [Installation on your native machine](#method-3-install-from-source)
* *Optional*: your own Verilog RTL designs!

We strongly recommend setting up the tools **before** arriving to the tutorial so you don't miss anything! We will
provide USB 3.0 drives with virtual machine appliance files (`.ova` / `.utm`) at the tutorial. Internet connections may
be unstable at the tutorial venue, so do not expect to connect to a remote server!

## Toolchain Installation

We provide several methods to install the tool chain. Note that OpenROAD only natively supports Linux and MacOS, with
best support for Ubuntu 20 and Centos 7.

### Method 1: Install a Virtual Machine
{% include alert.html text="If using this option, be sure you have at least 20 GB free disk space."
align="center" color="warning" %}

{% include alert.html text="Virtual machine username: **user** password: **openroad**" align="center" color="info" %}

#### x86_64 Hosts (Windows, Linux, MacOS)
##### Install Virtual Machine Software

If setting up **prior to the tutorial**:
1. Visit VirtualBox's [download page](https://www.virtualbox.org/wiki/Downloads) to download and run the installer for
your OS.
2. Download the x86 virtual appliance `openroad-tutorial-micro2022.ova` (6.8 GB):
\[[Mirror 1](https://cornell.box.com/shared/static/j7n2epp4e4cc9326k4tiuljshypudqgn.ova)\]
\[[Mirror 2](https://www.dropbox.com/s/pmga5q6bqbdpcv7/openroad-tutorial-micro2022.ova?dl=1)\]

If setting up **at the tutorial**:
1. Pick up one of the supplied USB 3.0 flash drives. If needed, USB 3.0 to USB-C converters are available for use.
2. Navigate to `x86_64/vm_installer` on the flash drive and run the VirtualBox installer for your OS.

Some OSs may require you to enable hardware virtualization (if not already) and restart your computer.

##### Import Virtual Appliance
1. Start VirtualBox and navigate to *File > Import Appliance...*
2. If using a flash drive, navigate to the flash drive and select `x86_64/vm_image/openroad-tutorial-micro2022.ova`.
Otherwise, select your downloaded `.ova` file. Then, select *Next*.
3. Alter any default parameters for your virtual machine. We recommend at least 4 GB RAM and 4 processors, but no
more than 3/4 of your total system RAM or 3/4 of your processors. Please use at least 2 processors or the VM OS
(Lubuntu) may not boot.

4. Select *Import* and wait for the process to finish (~5-10 minutes).

##### Launch the Virtual Machine
1. Select `openroad-tutorial-micro2022` from your list of virtual machines and press *Start*.
2. Wait for the virtual machine to boot into Lubuntu (~1-3 minutes). Warnings during boot can be ignored.
3. If needed, the username is **user** and the password is **openroad**.

#### arm64 Hosts (MacOS)
##### Install Virtual Machine Software

If setting up **prior to the tutorial**:
1. Visit UTM's [download page](https://mac.getutm.app) and select *Download*. (The App Store version is non-free and
supports open-source development).
2. Download the arm64 virtual appliance `openroad-tutorial-micro2022.utm.bz2` (4.0 GB):
\[[Mirror 1](https://cornell.box.com/shared/static/ext60zr3wcr5994fq9lcq1eb1cnjgl1m.bz2)\]
\[[Mirror 2](https://www.dropbox.com/s/vcx737j5d59bkkl/openroad-tutorial-micro2022.utm.bz2?dl=1)\]

If setting up **at the tutorial**:
1. Pick up one of the supplied USB 3.0 flash drives. If needed, USB 3.0 to USB-C converters are available for use.
2. Navigate to `arm64/vm_installer/osx/UTM.dmg` on your flash drive and run the installer.

##### Import Virtual Appliance
1. If using a flash drive, copy `arm64/vm_image/openroad-tutorial-micro2022.utm.bz2` to your local disk.
2. Extract the file (~3-8 minutes). In terminal, you can use `tar -xf openroad-tutorial-micro2022.utm.bz2`.
3. Start UTM, select *File > Open...*, and select the extracted file (`openroad-tutorial-micro2022.utm`).

##### Launch the Virtual Machine
1. Press the "play" icon on the openroad-tutorial-micro2022 virtual machine
2. Wait for the virtual machine to boot into Lubuntu (~1 minute). Warnings during boot can be ignored.
3. If needed, the username is **user** and the password is **openroad**.

#### Test the Toolchain
Inside the virtual machine:
1. Open QTerminal
2. `cd ~/micro2022tutorial/OpenROAD-flow-scripts/flow`
3. `make`

If the flow completes without error, congrats! You are ready to start the tutorial. You should run `make clean_all`
to reset your flow build.

### Method 2: Install from Docker
{% include alert.html text="For advanced users only. Build times can take up to an hour."
align="center" color="warning" %}

See the [OpenROAD docs](https://openroad.readthedocs.io/en/latest/user/BuildWithDocker.html) on how to build from
sources and test using Docker.

**Note**:
* OpenROAD-flow-scripts is already included in the micro2022tutorial repo.
* The tools will only be accessible inside the installed docker container.


#### Test the Toolchain
```
# Start an interactive shell inside the Docker container
# Must be run from the micro2022tutorial directory
$ docker run -it -u $(id -u ${USER}):$(id -g ${USER}) -v $(pwd)/OpenROAD-flow-scripts/flow/platforms:/OpenROAD-flow-scripts/flow/platforms:ro -v $(pwd):/micro2022tutorial openroad/flow-scripts

# The following lines will be executed inside the Docker container
$ cd /OpenROAD-flow-scripts/flow
$ make
```

If the flow completes without error, congrats! You are ready to start the tutorial. You should run `make clean_all`
to reset your flow build.

### Method 3: Install from Source

{% include alert.html text="For advanced users only. Build times can take up to an hour." align="center" color="warning" %}

This method will build OpenROAD-flow-scripts components (OpenROAD and Yosys) from source. Package managers are used to
install (most) dependencies.

### Download the Repository

```
$ git clone --recursive https://github.com/The-OpenROAD-Project/micro2022tutorial
```
Cloning recursively is important to download and initialize all git submodules.

#### Install Dependencies

{% include accordion.html
title1="Windows"
text1="OpenROAD cannot run on Windows natively. We recommend installing [Windows Subsystem for Linux
(WSL)](https://docs.microsoft.com/en-us/windows/wsl/install) and following the instructions for Linux. Be sure to
install an Xserver such as [Xming](https://sourceforge.net/projects/xming) so that you can open GUIs."

title2="MacOS"
text2="OpenROAD has preliminary support for MacOS. You can use the OpenROAD dependency installer script (requires
[Homebrew](https://brew.sh)):

```
micro2022tutorial/OpenROAD-flow-scripts/tools/OpenROAD/etc/DependencyInstaller.sh
```
Then, install additional dependencies for OpenROAD-flow-scripts:
```
brew install libffi pkg-config klayout
```
The OS may identify KLayout as an untrusted app - you will need to mark it as trusted in order to run it.
"

title3="Linux"
text3="
If you use Ubuntu or CentOS, you can use the OpenROAD dependency installer script:
```
sudo micro2022tutorial/OpenROAD-flow-scripts/tools/OpenROAD/etc/DependencyInstaller.sh
```
Using a different distribution is not recommended, however you may view the script and identify how to manually install
the required packages for your distribution.

KLayout must be installed separately. See the [KLayout download page](https://www.klayout.de/build.html) to install it for your distribution.
"
%}

#### Build

Run the install script. This step may take up to an hour, depending on your internet connection and CPU performance.
```
# This script uses all available cores to build. Use --threads N to use N threads
# Use --help to see all build options
$ micro2022tutorial/OpenROAD-flow-scripts/build_openroad.sh
```

#### Test the Toolchain

To quickly verify that your installation is correct, run
```
$ cd micro2022tutorial/OpenROAD-flow-scripts/flow
$ source ../setup_env.sh
# Make sure that KLayout is in your PATH before running make
$ make
```
If the flow completes without error, congrats! You are ready to start the tutorial. You should run `make clean_all`
to reset your flow build.
