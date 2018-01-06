Reset Linux Desktop To Default Settings With A Single Command
======
![](https://www.ostechnix.com/wp-content/uploads/2017/10/Reset-Linux-Desktop-To-Default-Settings-720x340.jpg)

A while ago, we shared an article about [**Resetter**][1] - an useful piece of software which is used to reset Ubuntu to factory defaults within few minutes. Using Resetter, anyone can easily reset their Ubuntu system to the state when you installed it in the first time. Today, I stumbled upon a similar thing. No, It's not an application, but a single-line command to reset your Linux desktop settings, tweaks and customization to default state.

### Reset Linux Desktop To Default Settings

This command will reset Ubuntu Unity, Gnome and MATE desktops to the default state. I tested this command on both my **Arch Linux MATE** desktop and **Ubuntu 16.04 Unity** desktop. It worked on both systems. I hope it will work on other desktops as well. I don't have any Linux desktop with GNOME as of writing this, so I couldn't confirm it. But, I believe it will work on Gnome DE as well.

**A word of caution:** Please be mindful that this command will reset all customization and tweaks you made in your system, including the pinned applications in the Unity launcher or Dock, desktop panel applets, desktop indicators, your system fonts, GTK themes, Icon themes, monitor resolution, keyboard shortcuts, window button placement, menu and launcher behaviour etc.

Good thing is it will only reset the desktop settings. It won't affect the other applications that doesn't use dconf. Also, it won't delete your personal data.

Now, let us do this. To reset Ubuntu Unity or any other Linux desktop with GNOME/MATE DEs to its default settings, run:
```
dconf reset -f /
```

This is my Ubuntu 16.04 LTS desktop before running the above command:

[![][2]][3]

As you see, I have changed the desktop wallpaper and themes.

This is how my Ubuntu 16.04 LTS desktop looks like after running that command:

[![][2]][4]

Look? Now, my Ubuntu desktop has gone to the factory settings.

For more details about "dconf" command, refer man pages.
```
man dconf
```

I personally prefer to use "Resetter" over "dconf" command for this purpose. Because, Resetter provides more options to the users. The users can decide which applications to remove, which applications to keep, whether to keep existing user account or create a new user and many. If you're too lazy to install Resetter, you can just use this "dconf" command to reset your Linux system to default settings within few minutes.

And, that's all. Hope this helps. I will be soon here with another useful guide. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/reset-linux-desktop-default-settings-single-command/

作者：[Edwin Arteaga][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com
[1]:https://www.ostechnix.com/reset-ubuntu-factory-defaults/
[2]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]:http://www.ostechnix.com/wp-content/uploads/2017/10/Before-resetting-Ubuntu-to-default-1.png ()
[4]:http://www.ostechnix.com/wp-content/uploads/2017/10/After-resetting-Ubuntu-to-default-1.png ()
