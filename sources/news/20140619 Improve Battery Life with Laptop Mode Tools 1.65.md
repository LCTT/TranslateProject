translating by owen-carter
Improve Battery Life with Laptop Mode Tools 1.65
================================================================================
![](http://i1-news.softpedia-static.com/images/news2/Improve-Battery-Life-with-Laptop-Mode-Tools-1-65-447397-2.jpg)

Laptop Mode Tools, a power-saving package for Linux systems that allows users to extend the battery life of their laptop in several ways, is now at version 1.65.

The Laptop Mode Tools releases are few and far in between, but the developers have made some very interesting changes and improvements in this latest version, although the update is not as consistent as would like it to be.

According to the changelog, a grep error on missing $device/uevent has been fixed, sysfs/enabled has been replaced by “ip link down”, iwlwifi support has been added, the Runtime Power Managemet Framework is now a lot more robust, and the module usb-autosuspend has been deprecated.

Also, when the laptop is resuming, Laptop Mode Tools is run in force initialization mode, a module for the Intel PState driver has been added, and the suspend/hibernate interface has been implemented. 

Users must not change the autonegotiation settings. Fiddling with auto-negotiation settings can cause more problems and the standards expect them to be always on. Also, pay attention to what every function does because you might do more damage than good.

Check the official [announcement][1] for more details about this released. 

Download Laptop Mode Tools 1.65 right now:

- [http://samwel.tk/laptop_mode/packages][2]

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/Improve-Battery-Life-with-Laptop-Mode-Tools-1-65-447397.shtml

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://launchpad.net/laptop-mode-tools/+announcement/12779
[2]:http://samwel.tk/laptop_mode/packages