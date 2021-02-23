[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Unlock your Chromebook's hidden potential with Linux)
[#]: via: (https://opensource.com/article/21/2/chromebook-linux)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Unlock your Chromebook's hidden potential with Linux
======
Chromebooks are amazing tools, but by unlocking the Linux inside them,
you can make them even more impressive.
![Working from home at a laptop][1]

Google Chromebooks run on Linux, but normally the Linux they run isn't particularly accessible to the user. Linux is used as a backend technology for an environment based on the open source [Chromium OS][2], which Google then transforms into Chrome OS. The interface most users experience is a desktop that can run Chrome browser apps and the Chrome browser itself. And yet underneath all that, there's Linux to be found. If you know how, you can enable Linux on your Chromebook and turn a computer that was probably relatively cheap and basic into a serious laptop with access to hundreds of applications and all the power you need to make it an all-purpose computer.

### What are Chromebooks?

Chromebooks are laptops created especially for Chrome OS, which itself is designed for specific laptop models. Chrome OS isn't a general-purpose operating system like Linux or Windows, but instead has more in common with Android or iOS. Should you decide to purchase a Chromebook, you'll find models available from many different manufacturers, including HP, Asus, and Lenovo (among others). Some are built for school children, while others are intended for a home or business user. The main difference usually focusing on battery power or processing power, respectively.

Regardless of what you decide upon, a Chromebook runs Chrome OS and provides you with the basic functions you'd expect from a modern computer. There's a network manager to connect to the Internet, Bluetooth, volume control, a file manager, a desktop, and so on.

![Chrome OS desktop][3]

Chrome OS desktop

To get more out of this unassuming OS, though, all you have to do is activate Linux.

### Enable developer mode on a Chromebook

If I've made enabling Linux sound deceptively simple, that's because it is both deceptive and simple. It's deceptive because you _do_ have to backup your data before enabling Linux.

The process is simple, but it does reset your computer back to its factory defaults. You'll have to sign back into your laptop and, if you have data stored on your account's Google Drive, then you'll have to let it resynchronize back onto your computer. Enabling Linux also requires that you reserve space just for Linux, so whatever amount of storage your Chromebook has will be cut in half or a quarter (your choice).

Interfacing with Linux on your Chromebook is still considered a beta feature by Google, so you have to opt in to Developer Mode. The intent of Developer Mode is to allow software developers to test new features, to install a new build of the OS, and so on, but what it will do for you is unlock special features considered to be still in development.

To enable Developer Mode, first turn off your Chromebook. This assumes you've already backed up any important information you have on your device.

Next, press the **ESC** and refresh buttons on your keyboard and power on your Chromebook.

![ESC and refresh buttons][4]

ESC and refresh

When prompted to start recovery, press **Ctrl+D** on your keyboard.

Your Chromebook is reset to factory settings, but without the default restrictions.

### Booting into Developer Mode

Running in Developer Mode means that every time you boot your Chromebook, you'll be reminded that you're in Developer Mode. You can press **Ctrl+D** to skip the boot delay. Some Chromebooks beep after a few seconds to remind you about Developer Mode, making **Ctrl+D** almost mandatory. Theoretically, this is annoying, but in practice, I don't boot my Chromebook as often as I just wake it up, and when I do, **Ctrl+D** is a simple routine to incorporate into the process.

The first time you boot after enabling Developer Mode, you must set up your device as if it were brand new. This is the only time you have to do that (unless you deactivate Developer Mode at some point in the future).

### Enable Linux on a Chromebook

Now that you're running in Developer Mode, you can activate the **Linux Beta** feature in Chrome OS. To do that, open **Settings** and click on **Linux Beta** in the left column.

Activate **Linux Beta** and allot some hard drive space for your Linux system and applications. Linux is pretty lightweight at the worst of times, so you don't really need much space, but it obviously depends on how much you intend to do with Linux. 4 GB is enough for Linux plus a few hundred terminal commands and two dozen graphical applications. Because my Chromebook has a 64 GB memory chip, I gave 30 GB over to Linux because most of what I do on my Chromebook is in Linux.

Once your Linux Beta environment is ready, you can launch a terminal by pressing the **Search** button on your keyboard and typing `terminal`. If you're new to Linux, you may not know what to install now that you have access. This, of course, depends on what you want to do with Linux. If you're interested in Linux for programming, then you might start with Bash (that's already installed and running in the terminal) and Python. If you're interested in Linux for all of its amazing open source applications, you might try applications like GIMP, MyPaint, LibreOffice, or Inkscape.

The Linux Beta mode of Chrome OS lacks a graphical installer for software, but [applications can be installed from the terminal][5]. Install applications with the `sudo apt install` command.

  * The `sudo` command grants you permission to run commands as an administrator (called `root` in Linux).
  * `apt` is an application installer.
  * `install` is what you want `apt` to do.



You must also give `apt` the name of a package you want installed along with that command. For instance, to install LibreOffice:


```
`sudo apt install libreoffice`
```

When prompted to continue, type **y** (for "yes") and then press **Enter**.

Once an application has been installed, you can launch it the same way you launch any application on Chrome OS: Type it into your application launcher.

Learning the names and package names of Linux applications takes time, but you can also search using the `apt search` command. For instance, here is a good way to find out about useful photo applications:


```
`apt search photo`
```

There are many applications out there, so browse through articles here on [opensource.com][6] and find something that interests you, and then try it out!

### Share files and devices with Linux

The Linux Beta environment runs in a [container][7], so Chrome OS needs permission to access your Linux files. To grant Chrome OS permission to interact with files you create on Linux, right-click on any folder you want to share and select **Manage Linux sharing**.

![Chrome OS Manage Linux sharing interface][8]

Chrome OS Managing Linux Sharing interface

You can manage these settings and many others through the **Settings** application of Chrome OS.

![Chrome OS Settings menu][9]

Chrome OS Settings menu

### Learning Linux

If you take the time to learn Linux, you'll not only be able to unlock the hidden potential in your Chromebook, but you'll also end up learning a lot about computers in general. Linux is a valuable tool, a really fun toy, and the gateway to something much more exciting than routine computing. Get to know it. It might surprise you to know what you and your Chromebook are capable of.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/chromebook-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/wfh_work_home_laptop_work.png?itok=VFwToeMy (Working from home at a laptop)
[2]: https://www.chromium.org/chromium-os
[3]: https://opensource.com/sites/default/files/chromeos.png
[4]: https://opensource.com/sites/default/files/esc-refresh.png
[5]: https://opensource.com/article/18/1/how-install-apps-linux
[6]: https://opensource.com/tags/linux
[7]: https://opensource.com/resources/what-are-linux-containers
[8]: https://opensource.com/sites/default/files/chromeos-manage-linux-sharing.png
[9]: https://opensource.com/sites/default/files/chromeos-beta-linux.png
