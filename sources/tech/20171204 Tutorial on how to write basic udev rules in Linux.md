Translating by qhwdw
# Tutorial on how to write basic udev rules in Linux

Contents

*   *   [1. Objective][4]

    *   [2. Requirements][5]

    *   [3. Difficulty][6]

    *   [4. Conventions][7]

    *   [5. Introduction][8]

    *   [6. How rules are organized][9]

    *   [7. The rules syntax][10]

    *   [8. A test case][11]

    *   [9. Operators][12]
        *   *   [9.1.1. == and != operators][1]

            *   [9.1.2. The assignment operators: = and :=][2]

            *   [9.1.3. The += and -= operators][3]

    *   [10. The keys we used][13]

### Objective

Understanding the base concepts behind udev, and learn how to write simple rules

### Requirements

*   Root permissions

### Difficulty

MEDIUM

### Conventions

*   **#** - requires given command to be executed with root privileges either directly as a root user or by use of `sudo` command

*   **$** - given command to be executed as a regular non-privileged user

### Introduction

In a GNU/Linux system, while devices low level support is handled at the kernel level, the management of events related to them is managed in userspace by `udev`, and more precisely by the `udevd` daemon. Learning how to write rules to be applied on the occurring of those events can be really useful to modify the behavior of the system and adapt it to our needs.

### How rules are organized

Udev rules are defined into files with the `.rules` extension. There are two main locations in which those files can be placed: `/usr/lib/udev/rules.d` it's the directory used for system-installed rules, `/etc/udev/rules.d/`is reserved for custom made rules. 

The files in which the rules are defined are conventionally named with a number as prefix (e.g `50-udev-default.rules`) and are processed in lexical order independently of the directory they are in. Files installed in `/etc/udev/rules.d`, however, override those with the same name installed in the system default path.

### The rules syntax

The syntax of udev rules is not very complicated once you understand the logic behind it. A rule is composed by two main sections: the "match" part, in which we define the conditions for the rule to be applied, using a series of keys separated by a comma, and the "action" part, in which we perform some kind of action, when the conditions are met. 

### A test case

What a better way to explain possible options than to configure an actual rule? As an example, we are going to define a rule to disable the touchpad when a mouse is connected. Obviously the attributes provided in the rule definition, will reflect my hardware. 

We will write our rule in the `/etc/udev/rules.d/99-togglemouse.rules` file with the help of our favorite text editor. A rule definition can span over multiple lines, but if that's the case, a backslash must be used before the newline character, as a line continuation, just as in shell scripts. Here is our rule:
```
ACTION=="add" \
, ATTRS{idProduct}=="c52f" \
, ATTRS{idVendor}=="046d" \
, ENV{DISPLAY}=":0" \
, ENV{XAUTHORITY}="/run/user/1000/gdm/Xauthority" \
, RUN+="/usr/bin/xinput --disable 16"
```
Let's analyze it.

### Operators

First of all, an explanation of the used and possible operators:

#### == and != operators

The `==` is the equality operator and the `!=` is the inequality operator. By using them we establish that for the rule to be applied the defined keys must match, or not match the defined value respectively.

#### The assignment operators: = and :=

The `=` assignment operator, is used to assign a value to the keys that accepts one. We use the `:=` operator, instead, when we want to assign a value and we want to make sure that it is not overridden by other rules: the values assigned with this operator, in facts, cannot be altered.

#### The += and -= operators

The `+=` and `-=` operators are used respectively to add or to remove a value from the list of values defined for a specific key.

### The keys we used

Let's now analyze the keys we used in the rule. First of all we have the `ACTION` key: by using it, we specified that our rule is to be applied when a specific event happens for the device. Valid values are `add`, `remove` and `change` 

We then used the `ATTRS` keyword to specify an attribute to be matched. We can list a device attributes by using the `udevadm info` command, providing its name or `sysfs` path:
```
udevadm info -ap /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.1/0003:046D:C52F.0010/input/input39

Udevadm info starts with the device specified by the devpath and then
walks up the chain of parent devices. It prints for every device
found, all possible attributes in the udev rules key format.
A rule to match, can be composed by the attributes of the device
and the attributes from one single parent device.

  looking at device '/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.1/0003:046D:C52F.0010/input/input39':
    KERNEL=="input39"
    SUBSYSTEM=="input"
    DRIVER==""
    ATTR{name}=="Logitech USB Receiver"
    ATTR{phys}=="usb-0000:00:1d.0-1.2/input1"
    ATTR{properties}=="0"
    ATTR{uniq}==""

  looking at parent device '/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.1/0003:046D:C52F.0010':
    KERNELS=="0003:046D:C52F.0010"
    SUBSYSTEMS=="hid"
    DRIVERS=="hid-generic"
    ATTRS{country}=="00"

  looking at parent device '/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.1':
    KERNELS=="2-1.2:1.1"
    SUBSYSTEMS=="usb"
    DRIVERS=="usbhid"
    ATTRS{authorized}=="1"
    ATTRS{bAlternateSetting}==" 0"
    ATTRS{bInterfaceClass}=="03"
    ATTRS{bInterfaceNumber}=="01"
    ATTRS{bInterfaceProtocol}=="00"
    ATTRS{bInterfaceSubClass}=="00"
    ATTRS{bNumEndpoints}=="01"
    ATTRS{supports_autosuspend}=="1"

  looking at parent device '/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2':
    KERNELS=="2-1.2"
    SUBSYSTEMS=="usb"
    DRIVERS=="usb"
    ATTRS{authorized}=="1"
    ATTRS{avoid_reset_quirk}=="0"
    ATTRS{bConfigurationValue}=="1"
    ATTRS{bDeviceClass}=="00"
    ATTRS{bDeviceProtocol}=="00"
    ATTRS{bDeviceSubClass}=="00"
    ATTRS{bMaxPacketSize0}=="8"
    ATTRS{bMaxPower}=="98mA"
    ATTRS{bNumConfigurations}=="1"
    ATTRS{bNumInterfaces}==" 2"
    ATTRS{bcdDevice}=="3000"
    ATTRS{bmAttributes}=="a0"
    ATTRS{busnum}=="2"
    ATTRS{configuration}=="RQR30.00_B0009"
    ATTRS{devnum}=="12"
    ATTRS{devpath}=="1.2"
    ATTRS{idProduct}=="c52f"
    ATTRS{idVendor}=="046d"
    ATTRS{ltm_capable}=="no"
    ATTRS{manufacturer}=="Logitech"
    ATTRS{maxchild}=="0"
    ATTRS{product}=="USB Receiver"
    ATTRS{quirks}=="0x0"
    ATTRS{removable}=="removable"
    ATTRS{speed}=="12"
    ATTRS{urbnum}=="1401"
    ATTRS{version}==" 2.00"

    [...]
```
Above is the truncated output received after running the command. As you can read it from the output itself, `udevadm` starts with the specified path that we provided, and gives us information about all the parent devices. Notice that attributes of the device are reported in singular form (e.g `KERNEL`), while the parent ones in plural form (e.g `KERNELS`). The parent information can be part of a rule but only one of the parents can be referenced at a time: mixing attributes of different parent devices will not work. In the rule we defined above, we used the attributes of one parent device: `idProduct` and `idVendor`. 

The next thing we have done in our rule, is to use the `ENV` keyword: it can be used to both set or try to match environment variables. We assigned a value to the `DISPLAY` and `XAUTHORITY` ones. Those variables are essential when interacting with the X server programmatically, to setup some needed information: with the `DISPLAY` variable, we specify on what machine the server is running, what display and what screen we are referencing, and with `XAUTHORITY` we provide the path to the file which contains Xorg authentication and authorization information. This file is usually located in the users "home" directory. 

Finally we used the `RUN` keyword: this is used to run external programs. Very important: this is not executed immediately, but the various actions are executed once all the rules have been parsed. In this case we used the `xinput` utility to change the status of the touchpad. I will not explain the syntax of xinput here, it would be out of context, just notice that `16` is the id of the touchpad. 

Once our rule is set, we can debug it by using the `udevadm test` command. This is useful for debugging but it doesn't really run commands specified using the `RUN` key:
```
$ udevadm test --action="add" /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.1/0003:046D:C52F.0010/input/input39
```
What we provided to the command is the action to simulate, using the `--action` option, and the sysfs path of the device. If no errors are reported, our rule should be good to go. To run it in the real world, we must reload the rules:
```
# udevadm control --reload
```
This command will reload the rules files, however, will have effect only on new generated events. 

We have seen the basic concepts and logic used to create an udev rule, however we only scratched the surface of the many options and possible settings. The udev manpage provides an exhaustive list: please refer to it for a more in-depth knowledge.

--------------------------------------------------------------------------------

via: https://linuxconfig.org/tutorial-on-how-to-write-basic-udev-rules-in-linux

作者：[Egidio Docile ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://disqus.com/by/egidiodocile/
[1]:https://linuxconfig.org/tutorial-on-how-to-write-basic-udev-rules-in-linux#h9-1-1-and-operators
[2]:https://linuxconfig.org/tutorial-on-how-to-write-basic-udev-rules-in-linux#h9-1-2-the-assignment-operators-and
[3]:https://linuxconfig.org/tutorial-on-how-to-write-basic-udev-rules-in-linux#h9-1-3-the-and-operators
[4]:https://linuxconfig.org/tutorial-on-how-to-write-basic-udev-rules-in-linux#h1-objective
[5]:https://linuxconfig.org/tutorial-on-how-to-write-basic-udev-rules-in-linux#h2-requirements
[6]:https://linuxconfig.org/tutorial-on-how-to-write-basic-udev-rules-in-linux#h3-difficulty
[7]:https://linuxconfig.org/tutorial-on-how-to-write-basic-udev-rules-in-linux#h4-conventions
[8]:https://linuxconfig.org/tutorial-on-how-to-write-basic-udev-rules-in-linux#h5-introduction
[9]:https://linuxconfig.org/tutorial-on-how-to-write-basic-udev-rules-in-linux#h6-how-rules-are-organized
[10]:https://linuxconfig.org/tutorial-on-how-to-write-basic-udev-rules-in-linux#h7-the-rules-syntax
[11]:https://linuxconfig.org/tutorial-on-how-to-write-basic-udev-rules-in-linux#h8-a-test-case
[12]:https://linuxconfig.org/tutorial-on-how-to-write-basic-udev-rules-in-linux#h9-operators
[13]:https://linuxconfig.org/tutorial-on-how-to-write-basic-udev-rules-in-linux#h10-the-keys-we-used
