[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (10 Ways to Customize Your Linux Desktop With GNOME Tweaks Tool)
[#]: via: (https://itsfoss.com/gnome-tweak-tool/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

10 Ways to Customize Your Linux Desktop With GNOME Tweaks Tool
======

![GNOME Tweak Tool Icon][1]

There are several ways you can tweak Ubuntu to customize its looks and behavior. The easiest way I find is by using the [GNOME Tweak tool][2]. It is also known as GNOME Tweaks or simply Tweaks.

I have mentioned it numerous time in my tutorials in the past. Here, I list all the major tweaks you can perform with this tool.

I have used Ubuntu here but the steps should be applicable to any Linux distribution using GNOME desktop environment.

### Install GNOME Tweak tool in Ubuntu 18.04 and other versions

Gnome Tweak tool is available in the [Universe repository in Ubuntu][3] so make sure that you have it enabled in your Software &amp; Updates tool:

![Enable Universe Repository in Ubuntu][4]

After that, you can install GNOME Tweak tool from the software center. Just open the Software Center and search for GNOME Tweaks and install it from there:

![Install GNOME Tweaks Tool from Software Center][5]

Alternatively, you may also use command line to install software with [apt command][6]:

```
sudo apt install gnome-tweaks
```

### Customizing GNOME desktop with Tweaks tool

![][7]

GNOME Tweak tool enables you to do a number of settings changes. Some of these changes like wallpaper changes, startup applications etc are also available in the official System Settings tool. I am going to focus on tweaks that are not available in the Settings by default.

#### 1\. Change themes

You can [install new themes in Ubuntu][8] in various ways. But if you want to change to the newly installed theme, you’ll have to install GNOME Tweaks tool.

You can find the theme and icon settings in Appearance section. You can browse through the available themes and icons and set the ones you like. The changes take into effect immediately.

![Change Themes With GNOME Tweaks][9]

#### 2\. Disable animation to speed up your desktop

There are subtle animations for application window opening, closing, maximizing etc. You can disable these animations to speed up your system slightly as it will use slightly fewer resources.

![Disable Animations For Slightly Faster Desktop Experience][10]

#### 3\. Control desktop icons

At least in Ubuntu, you’ll see the Home and Trash icons on the desktop. If you don’t like, you can choose to disable it. You can also choose which icons will be displayed on the desktop.

![Control Desktop Icons in Ubuntu][11]

#### 4\. Manage GNOME extensions

I hope you are aware of [GNOME Extensions][12]. These are small ‘plugins’ for your desktop that extends the functionalities of the GNOME desktop. There are [plenty of GNOME extensions][13] that you can use to get CPU consumption in the top panel, get clipboard history etc.

I have written in detail about [installing and using GNOME extensions][14]. Here, I assume that you are already using them and if that’s the case, you can manage them from within GNOME Tweaks.

![Manage GNOME Extensions][15]

#### 5\. Change fonts and scaling factor

You can [install new fonts in Ubuntu][16] and apply the system wide font change using Tweaks tool. You can also change the scaling factor if you think the icons, text are way too small on your desktop.

![Change Fonts and Scaling Factor][17]

#### 6\. Control touchpad behavior like Disable touchpad while typing, Make right click on touchpad working

The GNOME Tweaks also allows you to disable touchpad while typing. This is useful if you type fast on a laptop. The bottom of your palm may touch the touchpad and the cursor moves away to an undesired location on the screen.

Automatically disabling touchpad while typing fixes this problem.

![Disable Touchpad While Typing][18]

You’ll also notice that [when you press the bottom right corner of your touchpad for right click, nothing happens][19]. There is nothing wrong with your touchpad. It’s a system settings that disables the right clicking this way for any touchpad that doesn’t have a real right click button (like the old Thinkpad laptops). Two finger click gives you the right click.

You can also get this back by choosing Area in under Mouse Click Simulation instead of Fingers.

![Fix Right Click Issue][20]

You may have to [restart Ubuntu][21] in order to take the changes in effect. If you are Emacs lover, you can also force keybindings from Emacs.

#### 7\. Change power settings

There is only one power settings here. It allows you to put your laptop in suspend mode when the lid is closed.

![Power Settings in GNOME Tweaks Tool][22]

#### 8\. Decide what’s displayed in the top panel

The top panel in your desktop gives shows a few important things. You have the calendar, network icon, system settings and the Activities option.

You can also [display battery percentage][23], add date along with day and time and show week numbers. You can also enable hot corners so that if you take your mouse to the top left corner of the screen, you’ll get the activities view with all the running applications.

![Top Panel Settings in GNOME Tweaks Tool][24]

If you have the mouse focus on an application window, you’ll notice that it’s menu is displayed in the top panel. If you don’t like it, you may toggle it off and then the application menu will be available on the application itself.

#### 9\. Configure application window

You can decide if maximize and minimize option (the buttons on the top right corner) will be shown in the application window. You may also change their positioning between left and right.

![Application Window Configuration][25]

There are some other configuration options as well. I don’t use them but feel free to explore them on your own.

#### 10\. Configure workspaces

GNOME Tweaks tool also allows you to configure a couple of things around workspaces.

![Configure Workspaces in Ubuntu][26]

**In the end…**

GNOME Tweaks tool is a must have utility for any GNOME user. It helps you configure looks and functionality of the desktop. I find it surprising that this tool is not even in Main repository of Ubuntu. In my opinion, it should be installed by default. Till then, you’ll have to install GNOME Tweak tool in Ubuntu manually.

If you find some hidden gem in GNOME Tweaks that hasn’t been discussed here, why not share it with the rest of us?

--------------------------------------------------------------------------------

via: https://itsfoss.com/gnome-tweak-tool/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/10/gnome-tweak-tool-icon.png?ssl=1
[2]: https://wiki.gnome.org/action/show/Apps/Tweaks?action=show&redirect=Apps%2FGnomeTweakTool
[3]: https://itsfoss.com/ubuntu-repositories/
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/03/enable-repositories-ubuntu.png?ssl=1
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/10/install-gnome-tweaks-tool.jpg?ssl=1
[6]: https://itsfoss.com/apt-command-guide/
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/10/customize-gnome-with-tweak-tool.jpg?ssl=1
[8]: https://itsfoss.com/install-themes-ubuntu/
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/10/change-theme-ubuntu-gnome.jpg?ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/10/disable-animation-ubuntu-gnome.jpg?ssl=1
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/10/desktop-icons-ubuntu.jpg?ssl=1
[12]: https://extensions.gnome.org/
[13]: https://itsfoss.com/best-gnome-extensions/
[14]: https://itsfoss.com/gnome-shell-extensions/
[15]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/10/manage-gnome-extension-tweaks-tool.jpg?ssl=1
[16]: https://itsfoss.com/install-fonts-ubuntu/
[17]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/10/change-fonts-ubuntu-gnome.jpg?ssl=1
[18]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/10/disable-touchpad-while-typing-ubuntu.jpg?ssl=1
[19]: https://itsfoss.com/fix-right-click-touchpad-ubuntu/
[20]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/10/enable-right-click-ubuntu.jpg?ssl=1
[21]: https://itsfoss.com/schedule-shutdown-ubuntu/
[22]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/10/power-settings-gnome-tweaks-tool.jpg?ssl=1
[23]: https://itsfoss.com/display-battery-ubuntu/
[24]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/10/top-panel-settings-gnome-tweaks-tool.jpg?ssl=1
[25]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/10/windows-configuration-ubuntu-gnome-tweaks.jpg?ssl=1
[26]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/10/configure-workspaces-ubuntu.jpg?ssl=1
