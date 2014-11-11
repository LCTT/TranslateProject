[Quick Tip] How To Fix Docky Compositing Error In Lubuntu
================================================================================
As you may know, **Docky** a is light weight application launcher in Unix/Linux like systems. I am a big fan of Lubuntu and Docky, because it doesn’t swallow all my system resources, so that I can use more application simultaneously. I use Docky application launcher in my production Laptop, powered by Lubuntu 14.04.

If you’re using LXDE distros, you may definitely encounter with composting error while using Docky. See the following screenshot.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/11/Docky.png)

If you didn’t enable compositing feature, you can’t use some of Docky’s features such as 3D background and Auto-hide. If you want to enable this features on Docky, you need to enable the Compositing feature in your LXDE systems.

To do that, first install the **xcompmgr** package.

    sudo apt-get install xcompmgr

Then, go to **Menu -> Preferences -> Default applications for LXSession**. Navigate to the Autostart tab. Type “**@xcompmgr -n**” without quotes in the box that says **+Add**. Then, click Add button.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/11/LXSession-configuration_002.png)

That’s it. Close the LXSession configuration window and log off or reboot your system. Now, you’ll see that Compositing feature has been enabled.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/11/unknown_006.png)

Also, you can use 3D background and hiding features such as Auto-hide, Intellihide or Window dodge etc.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/11/Docky-Settings_003.png)

Cheers!

--------------------------------------------------------------------------------

via: http://www.unixmen.com/quick-tip-fix-docky-compositing-error-lubuntu/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/sk/