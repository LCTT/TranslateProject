Vito

Embedded Terminal – A Gedit Plugin To Access The Command Line Terminal From Within The Editor Window
================================================================================
Sometimes while working with GUI based programs in Linux, you have to hop between the program window and the command line window. This consumes a bit of time. A terminal window embedded inside the program window is the best solution to this problem. I am not sure about all the other programs but if you are looking for such a solution for gedit, then there is a plug-in — **Embedded Terminal** — that lets you access command line terminal from within the gedit window.

**Gedit Embedded Terminal Plugin**

**NOTE** – Ubuntu 13.04 was used for all the examples presented in this article.

**A Brief Tutorial**

Once the plug-in is installed, it becomes very easy for the user to edit files and access command line simultaneously.

Here is a screen shot of gedit window with this plug-in enabled:

![](http://mylinuxbook.com/wp-content/uploads/2013/09/gedit-embedded-terminal-colored.png)

So you can see that command line operations can now be done easily along with editing text files in gedit window.

**Download/Install**

Following steps are required to properly download-install-configure embedded terminal plug-in in gedit:

**Step-1**

Install the gedit plug-ins through the following command :

    sudo apt-get install gedit-plugins

**Step-2**

Now, in the gedit window, go to Edit->Preferences->Plugins and enable the Embedded Terminal Plug-in

![](http://mylinuxbook.com/wp-content/uploads/2013/09/gedit-embedded-terminal-enable.png)

**Step-3**

Now, click View->Bottom Panel in the gedit window

![](http://mylinuxbook.com/wp-content/uploads/2013/09/gedit-view-bottom-panel.png)

And you will see that an embedded terminal appears at the bottom panel of the gedit window.

![](http://mylinuxbook.com/wp-content/uploads/2013/09/gedit-default-embedded-terminal.png)

The only problem here is that the colour scheme is not good i.e., white prompt on light grey background makes it almost impossible to work. To change the colour scheme follow the next series of steps.

**Step-4**

Open dconf-editor. If it is not installed, install it through the following command :

    sudo apt-get install dconf-tools

Once installed, execute it using the following command :

    dconf-editor

In the dconf editor window, go to org->gnome->gedit->plugins->terminal and deselect the use-theme-colors option.

![](http://mylinuxbook.com/wp-content/uploads/2013/09/gedit-dconf-settings.png)

**Step-5**

Now restart the gedit program.

![](http://mylinuxbook.com/wp-content/uploads/2013/09/gedit-embedded-terminal-colored.png)

Observe that a colour scheme of black prompt over light background is now active.

**Pros**

- Ease of accessing a terminal from within the gedit window
- Being a plug-in, it can be deleted any-time.

**Cons**

- The colour scheme problem is the major hurdle in initial configuration.`

**Conclusion**

No matter how hard you try, it’s difficult to avoid command line while working on Linux. So, It’s always good to have an embedded terminal in the program window you use the most. This plug-in for gedit is a nice little tool that helps you to save some time. Try it, it’s worth installing.


via: http://mylinuxbook.com/embedded-terminal-a-gedit-plugin/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[译者ID][] 校对：[校对者ID][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[译者ID]:http://linux.cn/space/译者ID
[校对者ID]:http://linux.cn/space/校对者ID