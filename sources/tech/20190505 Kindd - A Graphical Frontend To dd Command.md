[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Kindd – A Graphical Frontend To dd Command)
[#]: via: (https://www.ostechnix.com/kindd-a-graphical-frontend-to-dd-command/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

Kindd – A Graphical Frontend To dd Command
======

![Kindd - A Graphical Frontend To dd Command][1]

A while ago we learned how to [**create bootable ISO using dd command**][2] in Unix-like systems. Please keep in mind that dd command is one of the dangerous and destructive command. If you’re not sure what you are actually doing, you might accidentally wipe your hard drive in minutes. The dd command just takes bytes from **if** and writes them to **of**. It won’t care what it’s overwriting, it won’t care if there’s a partition table in the way, or a boot sector, or a home folder, or anything important. It will simply do what it is told to do. If you’re beginner, mostly try to avoid using dd command to do stuffs. Thankfully, there is a simple GUI utility for dd command. Say hello to **“Kindd”** , a graphical frontend to dd command. It is free, open source tool written in **Qt Quick**. This tool can be very helpful for the beginners and who are not comfortable with command line in general.

The developer created this tool mainly to provide,

  1. a modern, simple and safe graphical user interface for dd command,
  2. a graphical way to easily create bootable device without having to use Terminal.



### Installing Kindd

Kindd is available in [**AUR**][3]. So if you’re a Arch user, install it using any AUR helper tools, for example [**Yay**][4].

To install Git version, run:

```
$ yay -S kindd-git
```

To install release version, run:

```
$ yay -S kindd
```

After installing, launch Kindd from the Menu or Application launcher.

For other distributions, you need to manually compile and install it from source as shown below.

Make sure you have installed the following prerequisites.

  * git
  * coreutils
  * polkit
  * qt5-base
  * qt5-quickcontrols
  * qt5-quickcontrols2
  * qt5-graphicaleffects



Once all prerequisites installed, git clone the Kindd repository:

```
git clone https://github.com/LinArcX/Kindd/
```

Go to the directory where you just cloned Kindd and compile and install it:

```
cd Kindd

qmake

make
```

Finally run the following command to launch Kindd application:

```
./kindd
```

Kindd uses **pkexec** internally. The pkexec agent is installed by default in most most Desktop environments. But if you use **i3** (or maybe some other DE), you should install **polkit-gnome** first, and then paste the following line into i3 config file:

```
exec /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
```

### Create bootable ISO using Kindd

To create a bootable USB from an ISO, plug in the USB drive. Then, launch Kindd either from the Menu or Terminal.

This is how Kindd default interface looks like:

![][5]

Kindd interface

As you can see, Kindd interface is very simple and self-explanatory. There are just two sections namely **List Devices** which displays the list of available devices (hdd and Usb) on your system and **Create Bootable .iso**. You will be in “Create Bootable .iso” section by default.

Enter the block size in the first column, select the path of the ISO file in the second column and choose the correct device (USB drive path) in third column. Click **Convert/Copy** button to start creating bootable ISO.

![][6]

Once the process is completed, you will see successful message.

![][7]

Now, unplug the USB drive and boot your system with USB to check if it really works.

If you don’t know the actual device name (target path), just click on the List devices and check the USB drive name.

![][8]

* * *

**Related read:**

  * [**Etcher – A Beautiful App To Create Bootable SD Cards Or USB Drives**][9]
  * [**Bootiso Lets You Safely Create Bootable USB Drive**][10]



* * *

Kindd is in its early development stage. So, there would be bugs. If you find any bugs, please report them in its GitHub page given at the end of this guide.

And, that’s all. Hope this was useful. More good stuffs to come. Stay tuned!

Cheers!

**Resource:**

  * [**Kindd GitHub Repository**][11]



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/kindd-a-graphical-frontend-to-dd-command/

作者：[sk][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/04/kindd-720x340.png
[2]: https://www.ostechnix.com/how-to-create-bootable-usb-drive-using-dd-command/
[3]: https://aur.archlinux.org/packages/kindd-git/
[4]: https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/
[5]: http://www.ostechnix.com/wp-content/uploads/2019/04/kindd-interface.png
[6]: http://www.ostechnix.com/wp-content/uploads/2019/04/kindd-1.png
[7]: http://www.ostechnix.com/wp-content/uploads/2019/04/kindd-2.png
[8]: http://www.ostechnix.com/wp-content/uploads/2019/04/kindd-3.png
[9]: https://www.ostechnix.com/etcher-beauitiful-app-create-bootable-sd-cards-usb-drives/
[10]: https://www.ostechnix.com/bootiso-lets-you-safely-create-bootable-usb-drive/
[11]: https://github.com/LinArcX/Kindd
