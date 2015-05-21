Translating by ictlyh
Linux FAQs with Answers--How to install Unity Tweak Tool on Ubuntu desktop
================================================================================
> **Question**: I am trying to customize fresh Ubuntu desktop that I just installed. For that, I want to use Unity Tweak Tool. How can I install Unity Tweak Tool on Ubuntu? 

[Unity Tweak Tool][1] is a popular Unity desktop customization tool. As the name implies, this tool is applicable to Ubuntu's default desktop environment only (i.e., Unity-based GNOME desktop). This versatile tool allows you to customize a wide variety of Unity desktop features and configurations via extremely intuitive and easy-to-use GUI. Its menu looks similar to Ubuntu's official System Settings, but its desktop customization capabilities far exceed those of the default System Settings. Using Unity Tweak Tool, you can customize appearance, behaviors and configurations for a plethora of desktop components, such as workspace, windows, icons, themes, cursors, fonts, scrolling, hot corners, etc. If you are a Unity desktop user, Unity Tweak Tool is definitely a must-have app.

![](https://farm6.staticflickr.com/5463/17684020389_25dc7f0db2_b.jpg)

While Unity Tweak Tool is an essential tool for Ubuntu desktop, it does not come pre-installed on stock Ubuntu desktop. For those of you to customize Unity desktop, here is how to install Unity Tweak Tool on Ubuntu desktop.

### Install Unity Tweak Tool on Ubuntu 13.04 and higher ###

Starting with Ubuntu 13.04, Unity Tweak Tool is available in the Ubuntu's base repositories. So its installation is as straightforward as:

    $ sudo apt-get install unity-tweak-tool 

To launch Unity Tweak Tool:

    $ unity-tweak-tool 

If you want to try the latest version of Unity Tweak Tool, you can install it from its daily PPA (as describe below).

### Install Unity Tweak Tool on Ubuntu 12.10 ###

Note that Unity Tweak Tool works on Ubuntu 12.10 and higher. If you want to install it on Ubuntu 12.10, you can use its PPA repository as follows. This PPA repository is also useful when you want to test the latest developments of the tool.

    $ sudo add-apt-repository ppa:freyja-dev/unity-tweak-tool-daily
    $ sudo apt-get update
    $ sudo apt-get install unity-tweak-tool 

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/install-unity-tweak-tool-ubuntu-desktop.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
[1]:https://launchpad.net/unity-tweak-tool