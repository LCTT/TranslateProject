How To Install Numix Icon Theme In Fedora 20
================================================================================
[Numix Themes][1] have been around for a while now and I think most of us know about it. In a previous post, I’ve written about [how to install Numix theme and other community forks on Manjaro Linux][2].

Today we’re going to do same on Fedora 20.

First of we need to install **fedy** which will help us in this installation. If you currently don’t have Fedy installed on your Fedora system, [follow our previous tutorial on how to install it][3].

### Installing Numix themes ###

Open Terminal and run the command below (Make sure you have installed fedy).

    sudo fedy -e numix_themes

![sudo fedy -e numix_themes](http://180016988.r.cdn77.net/wp-content/uploads/2014/06/sudo-fedy-e-numix_themes.png)

### Install Gnome Tweak Tool ###

    sudo yum install gnome-tweak-tool

Launch Gnome Tweak Tools:

![Gnome_Tweak_tool_launch](http://180016988.r.cdn77.net/wp-content/uploads/2014/06/Gnome_Tweak_tool_launch.png)

Now change all the settings under Appearance to point Numix as shown in the Fig. below.

![Numix_apply_done](http://180016988.r.cdn77.net/wp-content/uploads/2014/06/Numix_apply_done.png)

You’re done!

![Fedora 20 Numix Enock Seth](http://180016988.r.cdn77.net/wp-content/uploads/2014/06/Fedora-20-Numix-Enock-Seth.png)

Enjoy!

--------------------------------------------------------------------------------

via: http://www.unixmen.com/install-numix-icon-theme-fedora-20/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://numixproject.org/
[2]:http://www.unixmen.com/install-numix-icon-theme-manjaro-linux/
[3]:http://www.unixmen.com/tweak-fedora-system-using-fedy/