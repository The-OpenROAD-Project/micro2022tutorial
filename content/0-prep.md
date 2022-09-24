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
  * Installation on your native machine *or*
  * Installation in a Docker container *or*
  * Installation of a virtual machine
* *Optional*: your own Verilog RTL designs!

We strongly recommend setting up the tools **before** arriving to the tutorial so you don't miss anything! We will provide
USB 2.0 drives with virtual machine images (`.vmdk`) at the tutorial, however installing before arriving is strongly
preferred. Internet connections may be unstable at the tutorial venue, so do not expect to connect to a remote server!

## Toolchain Installation

We provide several methods to install the tool chain. Note that OpenROAD only supports Linux and MacOS, with best
support for Ubuntu 20 and Centos 7.

### Method 1: Install from Source

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
text1="OpenROAD cannot run on Windows natively. We recommend installing [Windows Subsystem for Linux (WSL)](https://docs.microsoft.com/en-us/windows/wsl/install)
and following the instructions for Linux.

Alternatively, you can install [Docker for Windows](https://docs.docker.com/desktop/install/windows-install/) and follow the instructions for Docker."

title2="MacOS" 
text2="OpenROAD has preliminary support for MacOS. You can use the OpenROAD dependency installer script:

```
micro2022tutorial/OpenROAD-flow-scripts/tools/OpenROAD/etc/DependencyInstaller.sh
```
Then, install additional dependencies for OpenROAD-flow-scripts:
```
brew install pkg-config libffi
brew install klayout
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

### Method 2: Install from Docker

See the [OpenROAD docs](https://openroad.readthedocs.io/en/latest/user/BuildWithDocker.html) on how to build from
sources and test using Docker.

**Note**:
* OpenROAD-flow-scripts is already included in the micro2022tutorial repo.
* The tools will only be accessible inside the installed docker container.

### Method 3: Install a Virtual Machine

You may install any virtual machine which supports `.vmdk` files. Some options include:

* [Oracle VirtualBox](https://www.virtualbox.org)
* [VMWare Workstation Player](https://www.vmware.com/products/workstation-player/workstation-player-evaluation.html)
* [Microsoft Windows Hyper-V](https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/enable-hyper-v)

Virtual machine images will be provided at the tutorial via USB 2.0 drives.

## Test the Toolchain

To quickly verify that your installation is correct, run
```
$ cd micro2022tutorial/OpenROAD-flow-scripts/flow
$ source ../setup_env.sh
$ make
```
If the flow completes without error, congrats! The flow was installed successfully.

