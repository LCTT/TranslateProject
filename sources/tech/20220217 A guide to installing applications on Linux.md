[#]: subject: "A guide to installing applications on Linux"
[#]: via: "https://opensource.com/article/22/2/installing-applications-desktop-linux"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

A guide to installing applications on Linux
======
Get information on all of the different methods of installing
applications on Linux from our new eBook. 
![Linux packages][1]

When you want to try a new app on your phone, you open your app store and install the app. It's simple, quick, and efficient. In this model of providing applications, phone vendors ensure that you know exactly where to go to get an app, and that developers with apps to distribute know where to put their apps so people can find them.

Before phones used this innovative model of software distribution, Linux was using it in the form of "software repositories." As the term implies, these were places on the Internet where applications were uploaded so Linux users could browse through them, and install them, from a central location. The term got shortened to just "repo" (for "repository," not "reposession"), but whether you call it a _repo_, _app store_, _software center_, _package manager_, or whatever else, it's a good system and has served Linux desktop users well for several decades.

The bottom line is that installing apps on Linux is a lot like installing apps on your phone. If you've done one, you can do the other.

**[ Download our eBook: [A guide to installing applications on Linux][2] ]**

### Software

On the GNOME desktop, your view into your desktop's software repository is an application called, simply, **Software**. You can think of this application as an extremely specific web browser. It's looking at software that's available to install from the Internet, gathering everything available into categories, and displaying it to you on your desktop.

![GNOME Software][3]

(Seth Kenlon, [CC BY-SA 4.0][4])

From the start screen, you have a few options.

  * Search for an application you're already familiar with. To do this, click the magnifying glass icon in the top left corner of the window.
  * Browse by category. These are found at the bottom of the window.
  * Browse by recent and recommendations. These are listed in the animated banner and the icons below it.



When you click on an application that looks interesting to you, a feature page opens so you can see screenshots and read a short description of the software.

### Installing an app

Once you've found software you want to install, click the **Install** button at the top of the application feature page.

![An application page in GNOME Software][5]

(Seth Kenlon, [CC BY-SA 4.0][4])

Once it's installed, the **Install** button changes to a **Launch** button, so you can optionally launch the app you've just installed.

If you don't want to launch the app just now, you can always find it in your **Activities** menu along with all the other applications you already have on your computer.

### Getting more apps from more places

Your Linux desktop has applications packaged specifically for it, but in today's world there's a lot of open source happening all over the place. You can get more applications by adding "third party" repositories to your desktop's app store. Of course, all of these terms aren't exactly correct: what's a "third party" in a world where software is being created by everyone anyway, and what's an app store when nothing costs any money? Terminology aside, one popular third-party repo is [Flathub.org][6].

To add another source of apps to your Linux desktop, you essentially "install" a location into your app store. For Flathub, you download the **Flathub repository file** and install it with **GNOME Software**, just as if it were an app. It's not an app. It's a _source_ of apps, but the process is the same.

### Find out more

It wouldn't be Linux if there weren't a dozen other ways to perform any given task. Flexibility is built into the system with Linux, so while GNOME Software provides one easy way to get apps, there are lots of other ways, including install scripts, install wizards, AppImages, and of course compiling directly from source code. You can get information on all of these install methods from our new eBook, [**Installing Applications on Linux**][2]. It's free, so give it a read.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/2/installing-applications-desktop-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/bitmap_1.png?itok=YkthYzSf (Linux packages)
[2]: https://opensource.com/downloads/installing-linux-applications-ebook
[3]: https://opensource.com/sites/default/files/gnome-software_1.png (GNOME Software)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://opensource.com/sites/default/files/gnome-software-steam.png (An application page in GNOME Software)
[6]: http://flathub.org/setup
