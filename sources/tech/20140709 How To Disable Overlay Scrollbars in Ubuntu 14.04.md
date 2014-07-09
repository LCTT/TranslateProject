How To Disable Overlay Scrollbars in Ubuntu 14.04 [Quick Tip]
================================================================================
![](http://180016988.r.cdn77.net/wp-content/uploads/2014/04/Ubuntu-14.042-790x493.jpeg)

Hello Guys,

This is a quick tip on how to disable the over scroll bars in Ubuntu. Note that the overlay feature is NOT removed when this tutorial is followed instead you will be enable or disable.

### Disable ###

Open terminal and run

    gsettings set com.canonical.desktop.interface scrollbar-mode normal

Changes should take effect immediately:

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/Unity_Overlay_off.png)

### Enable ###

    gsettings reset com.canonical.desktop.interface scrollbar-mode

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/Unity_overlay_on.png)

Enjoy!

----------

![](http://0.gravatar.com/avatar/25c00329fd45ff820497f9c8c2d79dd3?s=70&d=monsterid&r=G)

[Enock Seth Nyamador][1]

I wears --[0-0]--, an open source addict. A developing African geek. Am a n00b developer and an aspiring photographer. Feel free to connect with me. Want to offer me something or tips? Am ever ready especially in Software development and Photography. Cheers!

--------------------------------------------------------------------------------

via: http://www.unixmen.com/disable-overlay-scrollbars-ubuntu-14-04-quick-tip/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.unixmen.com/author/seth/