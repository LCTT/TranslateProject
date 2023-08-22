[#]: subject: "Remove Home Folder Icon from Ubuntu Desktop"
[#]: via: "https://itsfoss.com/ubuntu-remove-home-icon/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Remove Home Folder Icon from Ubuntu Desktop
======

Ubuntu uses a customized GNOME version which has a somewhat similar look to the old Unity desktop thanks to the side launcher.

Another difference between the vanilla GNOME and Ubuntu's GNOME is the use of Home folder and tash on the desktop. The icons are there so that you can quickly access them.

![Home folder icon on Ubuntu desktop][1]

If you do not find that aesthetically pleasing, you can remove the home folder from the desktop view.

Let me share both GUI and command line methods for that.

### Hide home folder icon from desktop in Ubuntu

Here's what you have to do.

**Access the desktop** by pressing the Super + D [keyboard shortcut in Ubuntu][2].

Now **right click on an empty space** on the desktop.

From the right-click context menu, **select Desktop Icons Settings**.

![Right click on the desktop and click the Desktop Icons Settings][3]

It will open the Ubuntu Desktop settings option in the Settings application. You could have accessed it by opening Settings app and going to Ubuntu Desktop option in sidebar as well.

Here, you'll see a **toggle option for Show Personal folder**. Toggle it off to disable the home folder icon from the desktop.

![Disable the Show Personal folder button][4]

💡

Want the home folder icon back? Toggle it on again.

### Disable the home folder icon using command line

Yes, you can totally disable the home folder icon from the command line.

Open a terminal and use the following command.

```

    gsettings set org.gnome.shell.extensions.ding show-home false

```

The effects will be immediate.

To bring the home icon back, use the same command but with `true` instead of `false`:

```

    gsettings set org.gnome.shell.extensions.ding show-home true

```

See how simple that was? Similar steps can be taken to remove the trash icon as well.

![][5]

--------------------------------------------------------------------------------

via: https://itsfoss.com/ubuntu-remove-home-icon/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/content/images/2023/08/home-folder-icon-on-ubuntu-desktop.png
[2]: https://itsfoss.com/ubuntu-shortcuts/
[3]: https://itsfoss.com/content/images/2023/08/access-ubuntu-desktop-icon-settings.png
[4]: https://itsfoss.com/content/images/2023/08/disable-home-folder-icon-on-ubuntu-desktop.png
[5]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
