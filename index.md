---
title: Home
layout: default
---

# OpenROAD tutorial: Open-Source ASIC Design for Computer Architects

{% include figure.html img="ibexGui.webp" alt="Ibex RISC-V core" caption="OpenROAD implementation of a RISC-V Ibex core"
width="80%" %}

{% include alert.html text="This tutorial was hosted from 1 - 5 PM CST on Saturday, October 1, 2022."
align="center" color="success" %}

{% include alert.html text="Be sure to install and test the [tutorial repo](https://github.com/The-OpenROAD-Project/micro2022tutorial)!
See [Workshop Prep](./content/0-prep.html)." align="center" color="warning" %}

## Introduction

The [OpenROAD Project](https://theopenroadproject.org/) was founded in 2018 under the DARPA IDEA program to address the
issue of hardware design requiring too much effort, cost, and time. Since then, the project has shown great success in
providing free, open-source implementation for ASIC designs in technology nodes as small as 7nm. Notably, OpenROAD has
enabled first-time chip designers, hobbyists, and students to fabricate chips through the [Google/Efabless/Skywater
130nm free shuttle program](https://efabless.com/open_shuttle_program). Over 100 designs have been silicon-tested on the
first two shuttle runs and [hundreds more have been taped out](https://opensource.googleblog.com/2022/07/SkyWater-and-Google-expand-open-source-program-to-new-90nm-technology.html).

OpenROAD provides a tremendous opportunity for researchers to perform design space exploration, collaborate, and
construct real chips in a free and open-source manner. This tutorial will aim to:
* Introduce researchers to implementation tools, specifically the [OpenROAD flow toolchain](https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts)
* Motivate the use of open-source designs, tools, and platform development kits (PDKs) in research and teaching
* Provide a demonstration of OpenROAD’s features and example uses for both computer architecture research and teaching
* Demonstrate a clear path for attendees to turn their RTL designs into silicon through commercial fabs or the free
  Google/Efabless/Skywater 130nm Shuttle

## Goals

This tutorial will cover using OpenROAD for both cutting-edge nodes (e.g. ASAP 7nm) and older nodes (e.g. Skywater 130nm).

In this tutorial, we will present:
* What is an implementation flow?
  * How does a design get from register-transfer level (RTL) code to a real chip?
  * What is The OpenROAD Project?
  * What are the benefits of open-source hardware flows?
* How do I use OpenROAD?
  * How do I generate a chip from my RTL or example RTL?
  * How do I debug common design problems?
  * How can I collect design data such as power, frequency, and area?
  * How can I model complex designs?
* What are OpenROAD's limitations?
* What is OpenROAD's roadmap?
* How can I contribute to OpenROAD?

For a more detailed overview, please see the [program](./content/1-program.html).

## What's Not Covered

This tutorial is intended to introduce ASIC implementation to those already conceptually familiar with RTL design
(undergraduate level or equivalent). We do not cover RTL design techniques or RTL validation.

------

{% include template/credits.html %}
