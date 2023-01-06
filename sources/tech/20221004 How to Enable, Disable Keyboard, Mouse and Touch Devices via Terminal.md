[#]: subject: "How to Enable, Disable Keyboard, Mouse and Touch Devices via Terminal"
[#]: via: "https://www.debugpoint.com/enable-disable-device-terminal/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Enable, Disable Keyboard, Mouse and Touch Devices via Terminal
======
You can do various quick configuration changes such as enable, disable devices using Xinput via Terminal in Linux in general. Here’s how.

[Xinput][1] is a utility that gives you configuration options to control mouse, keyboard, touchpad, and touch screen devices in Linux (applicable for all Linux distributions such as Ubuntu and Fedora). It is part of `xorg-xinput` package, which provides various device services.

### How to enable, and disable devices using Xinput

Open up the terminal. To list all the devices connected to your computer, run the below command. It will list all devices with their device ID. This device ID is necessary because you have to pass it as an argument when enabling or disabling any device.

```
xinput -list
```

The above command should give you a list of devices with ID – something like this (see the below image). You can see all the keyboards (in case you have multiple keyboards attached), touchpads, pointing devices are listed with their device ID.

![xinput-list][2]

You can easily figure out by name which device they represent.

For example, if I want to disable any device, say the touchscreen, simply run:

```
xinput disable 13
```

This will immediately disable a device’s touchscreen (as per the above example). And to enable, simply run:

```
xinput enable 13
```

Before using, make sure you are correctly enabling or disabling based on the device ID.

Be extra cautious while enabling or disabling the keyboard, which might prevent you from typing the command while enabling it (although you can use the onscreen keyboard).

Also, note that the device IDs can vary based on your system, and also they might get changed after every reboot if you plug in any devices. So, be careful while using this command in a shell script for automation.

### Wrapping Up

This trick is convenient when multiple keyboards, mouse(s), or touch devices are attached to the system. You can then disable or enable it as per your need to prevent any accidental use of devices such as a touchpad.

You can do lots of quick configuration with your connected devices, including the touch inputs.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/enable-disable-device-terminal/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://linux.die.net/man/1/xinput
[2]: https://www.debugpoint.com/wp-content/uploads/2020/07/xinput-list.jpg
