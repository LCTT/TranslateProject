How To Recover Default Openbox Config Files On Crunchbang
================================================================================
[CrunchBang][1] is a Debian GNU/Linux based distribution offering a great blend of speed, style and substance. Using the nimble Openbox window manager, it is highly customizable and provides a modern, full-featured GNU/Linux system without sacrificing performance.

As Crunchbang is highly customizable, users tweak it to their liking as much as they can. All this is done via text files (config). As a “Crunchbanger” myself, I recently messed up with my **menu.xml** config file, which is responsible for the menu shown below.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/09/curnchbang_menu_xml.png)

Which removed every code from the menu configuration file. Since I wasn’t having a backup (It’s good to backup config files too) I have to search for the default configuration that comes with Crunchbang out of the box. And here’s how I got it fixed thanks to Crunchbang forums.

It is very interesting to know all default configs were pre-backed up for you and can be found at

    /etc/skel/.config/

So for any default config you just copy them over and restart the appropriate application.

I will use Openbox **menu.xml** as an example here:

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/09/curnchbang_menu_xml_etc.png)

    cp -r /etc/skel/.config/openbox/menu.xml ~/.config/openbox/menu.xml

Then restart openbox.

    openbox --restart

--------------------------------------------------------------------------------

via: http://www.unixmen.com/recover-default-openbox-config-files-crunchbang/

作者：[Enock Seth Nyamador][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/seth/
[1]:http://crunchbang.org/