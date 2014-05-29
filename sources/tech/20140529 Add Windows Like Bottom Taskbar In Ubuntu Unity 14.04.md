Translating by GOLinux ...
Add Windows Like Bottom Taskbar In Ubuntu Unity 14.04
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/05/Windows_Taskbar_ubuntu.jpeg)

Some new users switching to Ubuntu from Windows may find the default Unity interface a little overwhelming. Most of the Windows users as well as some non-Gnome 3, non-Unity Linux users might miss the bottom taskbar in Ubuntu. We all know that [drag and drop in Unity][1] is not very user friendly feature.

Whatever may be your reason, if you want a bottom panel in Ubuntu, [tint2][2] is your man.

### Add bottom taskbar in Ubuntu 14.04 ###

Open a terminal (Ctrl+Alt+T) and use the following command:

    sudo apt-get install tint2

This will install tint2. You can run it by typing tint2 in terminal but that’s not how we are going to use it. That won’t serve the purpose at all. What we need to do here is to add tint2 as a start up program. Which means each time you boot in to Ubuntu, you’ll find the taskbar at the bottom of the desktop.

#### How to run tint2 at start up ####

Open Unity Dash (press Windows key) and search for Startup Applications.

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/01/Startup_Applications_Ubuntu.jpeg)

Open **Startup Applications**. In there click on **Add** to add a new program to start up. You can name it something meaningful, in command type **tint2** and click **Add**. **Close** it to save it. The picture below should be helpful:

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/05/Windows_Like_Taskbar_Ubuntu.jpeg)

That’s it. Logout and login back and you will find the taskbar at the bottom, as shown in the first most picture. Like [Conky][3], tint2 can be configured great deal but for that you’ll have to edit the configuration files. But even if you leave it as it is, it just works. Have you tried it already? How is/was your experience with tint2?

--------------------------------------------------------------------------------

via: http://itsfoss.com/add-windows-like-bottom-taskbar-in-ubuntu-unity-14-04/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://itsfoss.com/drag-drop-files-ubuntu-1404-unity/
[2]:https://code.google.com/p/tint2/
[3]:http://conky.sourceforge.net/
