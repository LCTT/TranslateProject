[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Screenshot Right Click Context Menu On Linux)
[#]: via: (https://www.ostechnix.com/how-to-screenshot-right-click-context-menu-on-linux/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

How To Screenshot Right Click Context Menu On Linux
======

![How To Screenshot Right Click Context Menu On Linux][1]

Taking screenshots is part of my work. I take a lot of screenshots daily to use them in my guides. The other day, I had to screenshot the right-click context menu while writing a guide to show our readers how to [**add ‘New Document’ option in right click context menu in Ubuntu 18.04 LTS desktop**][2]. Usually, I take screenshots with **Print screen** button in the keyboard and **Deepin Screenshot** application. While trying to screenshot the context menu using Deepin Screenshot app, the context menu automatically disappeared as soon as I clicked the Deepin Screenshot. Printscreen also doesn’t work when the context menu is open. If you happened to be in this situation, here are two simple workarounds to screenshot right click context menu on Linux systems with GNOME DE.

### Screenshot Right-click Context Menu On Linux

If you want to take the screenshot of right click context menu when it is open, simply instruct the screenshot apps to wait for a particular seconds before taking a screenshot.

We can do this in two ways, the CLI way and GUI way. First, we will see the CLI way.

##### 1\. Schedule screenshots using Scrot

As you might already know, [**Scrot**][3] (short for **SCR** eensh **OT** ) is a command-line screenshot tool for taking screenshots in Unix-like operating systems. Scrot comes pre-installed in most Linux distributions. Just in case, if it is not installed already, you can install it using your distribution’s default package manager. For example, run the following command to install Scrot on Ubuntu and its derivatives:

```
$ sudo apt install scrot
```

Now we are going to instruct Scrot to wait for X seconds, for example 5 seconds, before taking a screenshot using command:

```
$ scrot -d 5
```

Now, right click anywhere to open the context menu and wait for 5 seconds. Scrot will take screenshot exactly after 5 seconds.

![][4]

Screenshot Right-click Context Menu On Linux Using Scrot

You can set the timeout value as you wish.

If you’re not comfortable with CLI way, no problem! We can do this in GUI way as well.

##### 2\. Schedule screenshots using Gnome Screenshot

Open Gnome Screenshot application. it comes pre-installed with GNOME desktop. Now, set a time (E.g. 5 seconds) after which the picture has to be taken, click **Take screenshot** button, open the right click context menu and simply wait for 5 seconds. The screenshot will be taken in 5 seconds.

![][5]

Screenshot Right-click Context Menu On Linux Using Gnome screenshot

And, that’s all. This is how we can take screenshots when a menu is open or running. Of course, some advanced screenshot applications like **Shutter** can do this as well. But I find these two ways much easier.

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-screenshot-right-click-context-menu-on-linux/

作者：[sk][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/07/Screenshot-Right-Click-Context-Menu-720x340.png
[2]: https://www.ostechnix.com/how-to-add-new-document-option-in-right-click-context-menu-in-ubuntu-18-04/
[3]: https://www.ostechnix.com/take-screenshots-command-line-using-scrot-linux/
[4]: https://www.ostechnix.com/wp-content/uploads/2019/07/Screenshot-Right-click-Context-Menu-On-Linux.gif
[5]: https://www.ostechnix.com/wp-content/uploads/2019/07/Screenshot-Right-click-Context-Menu-On-Linux-Using-Gnome-screenshot.gif
