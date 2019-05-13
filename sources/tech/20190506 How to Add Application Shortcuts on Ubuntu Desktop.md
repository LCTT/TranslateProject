[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Add Application Shortcuts on Ubuntu Desktop)
[#]: via: (https://itsfoss.com/ubuntu-desktop-shortcut/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

How to Add Application Shortcuts on Ubuntu Desktop
======

_**In this quick tutorial, you’ll learn how to add application shortcuts on desktop in Ubuntu and other distributions that use GNOME desktop.**_

A classic desktop operating systems always have icons on the ‘desktop screen’. These desktop icons could include the file manager, the trash bin and the shortcut to applications.

While installing applications in Windows, some of the programs ask if you want to create a shortcut on the desktop. That’s not the case in Linux though.

But if you are a fan of this feature, let me show you how you can add desktop shortcuts to your favorite applications in [Ubuntu][1] and other Linux distributions.

![Application Shortcuts on Desktop in Ubuntu with GNOME desktop][2]

In case you are wondering about the looks of my desktop, I am using Ant theme with Tela icons. You can also get some [GTK themes][3] and [icons for Ubuntu][4] and change them as you like.

### Adding desktop shortcut in Ubuntu

![][5]

Personally I prefer the Ubuntu launcher for application shortcuts. If I use a program frequently, I add it to the launcher. But I know not everyone has the same preference and a few people prefer the shortcuts on the desktop.

Let’s see the simplest way of creating an application shortcut on the desktop.

Disclaimer

This tutorial has been tested on Ubuntu 18.04 LTS with [GNOME desktop][6]. It may work in other distributions and desktop environments but you have to try it on your own. Some GNOME specific steps may change so please pay attention while trying it on [other desktop environments][7].

[Subscribe to our YouTube Channel for More Linux Videos][8]

#### Prerequisite

First and foremost thing is to make sure that you have icons allowed on the GNOME desktop.

If you followed the Ubuntu 18.04 customization tips, you know how to install GNOME Tweaks tool. In this tool, make sure that you have ‘Show Icons’ option enabled.

![Allow icons on desktop in GNOME][9]

Once you have made sure of that, it’s time to add some application shortcuts on the desktop.

[][10]

Suggested read How to Replace One Linux Distribution With Another From Dual Boot [Keeping Home Partition]

#### Step 1: Locate the .desktop files of applications

Go to Files -> Other Location -> Computer.

![Go to Other Locations -> Computer][11]

From here, go to the directory usr -> share -> applications. You’ll see icons of several [Ubuntu applications][12] you have installed here. Even if you don’t see the icons, you should see the .desktop files that are named as application.desktop.

![Application Shortcuts][13]

#### Step 2: Copy the .desktop file to desktop

Now all you have to do here is to look for the application icon (or its desktop file). When you find it, either drag-drop the file to the desktop or copy the file (using Ctrl+C shortcut) and paste it on the desktop (using Ctrl+V shortcut).

![Add .desktop file to the desktop][14]

#### Step 3: Run the desktop file

When you do that, you should see a text file kind of icon on the desktop instead of the logo of the application. Don’t worry, things will be different in a moment.

What you have to do is to double click on that file on the desktop. It will warn you that it’s an ‘untrusted application launcher’ so click on Trust and Launch.

![Launch Desktop Shortcut][15]

The application will launch as usual but the good thing that you’ll notice that the .desktop file has now turned into the application icon. I believe you like the application shortcuts this way, don’t you?

![Application shortcut on the desktop][16]

#### Troubleshoot for Ubuntu 19.04 or GNOME 3.32 users

If you use Ubuntu 19.04 or GNOME 3.32, you the .desktop file may not launch at all. You should right click on the .desktop file and select “Allow Launching”.

After this, you should be able to launch the application and the application shortcut should be displayed properly on the desktop.

**Conclusion**

If you don’t like a certain application launcher on the desktop, just select it and delete it. It will delete the shortcut but the application will remain safely in your system.

I hope you found this quick tip helpful and now you can enjoy the application shortcuts on Ubuntu desktop.

[][17]

Suggested read How to Install and Make Nemo the Default File Manager in Ubuntu

If you have questions or suggestions, please let me know in the comments below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/ubuntu-desktop-shortcut/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.ubuntu.com/
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/05/app-shortcut-on-ubuntu-desktop.jpeg?resize=800%2C450&ssl=1
[3]: https://itsfoss.com/best-gtk-themes/
[4]: https://itsfoss.com/best-icon-themes-ubuntu-16-04/
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/05/add-ubuntu-desktop-shortcut.jpeg?resize=800%2C450&ssl=1
[6]: https://www.gnome.org/
[7]: https://itsfoss.com/best-linux-desktop-environments/
[8]: https://www.youtube.com/c/itsfoss?sub_confirmation=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/05/allow-icons-on-desktop-gnome.jpg?ssl=1
[10]: https://itsfoss.com/replace-linux-from-dual-boot/
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/05/Adding-desktop-shortcut-Ubuntu-gnome-1.png?resize=800%2C436&ssl=1
[12]: https://itsfoss.com/best-ubuntu-apps/
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/05/application-shortcuts-in-ubuntu.png?resize=800%2C422&ssl=1
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/05/add-desktop-file-to-desktop.jpeg?resize=800%2C458&ssl=1
[15]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/05/launch-desktop-shortcut-.jpeg?resize=800%2C349&ssl=1
[16]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/05/app-shortcut-on-desktop-ubuntu-gnome.jpeg?resize=800%2C375&ssl=1
[17]: https://itsfoss.com/install-nemo-file-manager-ubuntu/
