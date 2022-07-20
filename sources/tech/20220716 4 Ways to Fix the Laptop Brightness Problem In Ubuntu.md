[#]: subject: "4 Ways to Fix the Laptop Brightness Problem In Ubuntu"
[#]: via: "https://www.debugpoint.com/2-ways-fix-laptop-brightness-problem-ubuntu-linux/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

4 Ways to Fix the Laptop Brightness Problem In Ubuntu
======
This article features four quick ways to fix the everlasting Laptop brightness problem in Ubuntu.

Ubuntu plus most of the [Linux distributions][1] always had issues with Laptop brightness. The default hardware controllers never in the Laptop keyboard worked most of the time after a fresh install.

![brightness-control-keys-dell][2]

![brightness-control-keys-samsung][3]

Follow the below definite steps that worked till now for most laptops based on feedback on this website at our [old article][4].

**The described methods worked for the below models (so far). For the complete list of Laptops/Desktops where either of these four methods worked, refer to the list at the bottom of this article.**

* ASUS G75-VW
* Dell Vostro 3000 Series
* Samsung RV411 Series

### Fix the Laptop Brightness Problem In Ubuntu

#### Method 1: Fix Brightness Enabling Laptop Specific Drivers

* Open the file `/etc/default/grub` using gedit or any other text editor.Find the below line.

```
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
```

* Change the above line to:

```
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash acpi_backlight=vendor"
```

![grub update for brightness control][5]

This would ensure to load of device-specific drivers before default drivers in Linux.

* Save the file and close the text editor.
* Open the terminal and run the below command.

```
update-grub
```

* Reboot.

After rebooting, try adjusting the brightness using laptop’s dedicated control keys.

![brightness-control-via-oem-keys][6]

#### Method 2: Fix Brightness Using a Software

If the above method does not work, you could try the below method using an app.

This app, ‘[Brightness Controller][7]‘, can control the display using a simple GUI. It supports multiple displays as well.

The app is available in PPA. You can run the below command to install Ubuntu 16.10 Yakkety Yak, Ubuntu 16.04 Xenial Xerus, Ubuntu 18.04 LTS, Ubuntu 20.04 LTS or [Ubuntu 22.04 LTS][8].

```
sudo add-apt-repository ppa:apandada1/brightness-controller
sudo apt update
sudo apt install brightness-controller
```

For other download options, you can refer to this [page][9].

![brightness-controller-running][10]

After installation, you can find it under the application menu or search for it in the application menu. Once opened, you can see a bar that controls the display brightness, which you can adjust as per your need.

#### Method 3: Fix Brightness by configuring X11

Follow this method if none of the above fixes works. This should be the last resort.

Open a terminal session. Then browse to the[X11 config file][11] path `/etc/X11/xorg.conf.d`

```
cd /etc/X11/xorg.conf.d
```

**If you do not find any file in the above path**, check the below path for the configuration. This is mainly for those systems where you have logged in as a local user and not a root user.

```
cd  /usr/share/X11/xorg.conf.d
```

Then list the files via `ls`. You can see something like this below.

```
ls
```

![X11 Path][12]

For this example, you can see it has a file named `10-evdev.conf`. For your system, it might be different. So open the file via test editor as root.

```
sudo gedit /etc/X11/xorg.conf.d/10-evdev.conf
```

Add the below lines entirely at the end of this file and save the file.

```
Section "Device"
Identifier "Device0"
Driver "nvidia"
VendorName "NVIDIA Corporation"
Option "RegistryDwords" "EnableBrightnessControl=1"
EndSection
```

Sample file below:

![Editing the conf file][13]

Once you are done, restart the system.

You should be able to control the brightness now using the laptop hardware keys.

#### Method 4: Fix Brightness using xrandr

If none of the above methods gives you hope, try the following method. This uses xrandr’s properties, the official config utility for X server Resize and Rotate.

Open a terminal and find out the name of your display using the below command. In the below screenshot, you can see two outputs because, in my test system, two displays are there.

```
xrandr | grep " connected" | cut -f1 -d " "
```

So, the next is to change the brightness using the display name. So, use the following command by changing the monitor name. In this example, I have used eDP-1, my system’s display. The brightness value range is 0 to 1, where 0 is the dimmest and 1 is the brightest.

![brightness control using xrandr][14]

```
xrandr --output eDP-1 --brightness 0.7
```

To revert, you can use the above command with brightness=1.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2-ways-fix-laptop-brightness-problem-ubuntu-linux/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/category/distributions/
[2]: https://www.debugpoint.com/wp-content/uploads/2016/10/Brightness-Control-Keys-DELL.png
[3]: https://www.debugpoint.com/wp-content/uploads/2016/10/Brightness-Control-Keys-Samsung.png
[4]: http://www.debugpoint.com/2014/10/how-to-fix-brightness-control-in-ubuntu/
[5]: https://www.debugpoint.com/wp-content/uploads/2014/10/grub-update-for-brightness-control.png
[6]: https://www.debugpoint.com/wp-content/uploads/2016/10/Brightness-Control-Via-OEM-Keys.png
[7]: http://lordamit.github.io/Brightness/
[8]: https://www.debugpoint.com/web-stories/ubuntu-22-04-review/
[9]: https://github.com/LordAmit/Brightness
[10]: https://www.debugpoint.com/wp-content/uploads/2016/10/Brightness-Controller-Running.png
[11]: https://www.x.org/releases/current/doc/man/man5/xorg.conf.5.xhtml
[12]: https://www.debugpoint.com/wp-content/uploads/2016/10/X11-Path.png
[13]: https://www.debugpoint.com/wp-content/uploads/2016/10/Editing-the-conf-file.png
[14]: https://www.debugpoint.com/wp-content/uploads/2016/10/brightness-control-using-xrandr.jpeg
