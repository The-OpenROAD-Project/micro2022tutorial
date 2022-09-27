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
provide USB 3.0 drives with virtual machine appliance files (`.ova`) at the tutorial. Internet connections may be
unstable at the tutorial venue, so do not expect to connect to a remote server!

## Toolchain Installation

We provide several methods to install the tool chain. Note that OpenROAD only supports Linux and MacOS, with best
support for Ubuntu 20 and Centos 7.

### Method 1: Install a Virtual Machine
{% include alert.html text="If using this option, be sure you have at least 14 GB free disk space (20 recommended)."
align="center" color="warning" %} 

You may install any virtual machine which supports `.ova` files. Some options include:

* [Oracle VirtualBox](https://www.virtualbox.org)
* [VMWare Workstation Player](https://www.vmware.com/products/workstation-player/workstation-player-evaluation.html)

Virtual machine files and VirtualBox installers will be provided at the tutorial via USB 3.0 drives. We recommend
installing virtual machine software beforehand to save time!

#### Install Virtual Machine Software
**Before the tutorial**: Visit one of the aforementioned sites to download and run an installer.

**At the tutorial**: The flash drive will contain several versions of VirtualBox. Find the one suitable for your OS and
run the installer.

Some OSs may require you to enable hardware virtualization (if not already) and restart your computer.

#### Import Virtual Appliance
1. Open VirtualBox and navigate to *File > Import Appliance...*
2. Select the `openroad-tutorial-micro2022.ova` file from your flash drive
3. Alter any default parameters for your virtual machine. Note: We recommend at least 4 GB RAM and 4 processors, but no
more than 3/4 of your total system RAM or processors. Lubuntu may have trouble booting with only 1 processor.

#### Launch the Virtual Machine
1. Select `openroad-tutorial-micro2022` from your list of virtual machines and press Start.
2. Allow a few minutes for the virtual machine to boot into Lubuntu. Warnings during boot can be ignored.

#### Test the Toolchain
1. Open QTerminal
2. `cd ~/micro2022tutorial/OpenROAD-flow-scripts/flow`
3. `make`

If the flow completes without error, congrats! You are ready to start the tutorial. You should run `make clean_all`
to reset your flow build.

### Method 2: Install from Docker

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

$ cd /OpenROAD-flow-scripts/flow
$ make
```

If the flow completes without error, congrats! You are ready to start the tutorial. You should run `make clean_all`
to reset your flow build.

### Method 3: Install from Source

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
install an Xserver such as [Xming](https://sourceforge.net/projects/xming) so that you can open GUIs.

Alternatively, you can install [Docker for Windows](https://docs.docker.com/desktop/install/windows-install) and follow
the instructions for Docker."

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
$ make
```
If the flow completes without error, congrats! You are ready to start the tutorial. You should run `make clean_all`
to reset your flow build.
