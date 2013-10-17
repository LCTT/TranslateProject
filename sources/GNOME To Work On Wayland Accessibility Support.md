GNOME To Work On Wayland Accessibility Support
================================================================================
Now that GNOME 3.10 has shipped and with it comes initial native Wayland support, GNOME developers are beginning to focus on the GNOME 3.12 release cycle and working on some of the open work items in Wayland enablement.

Matthias Clasen of Red Hat has written to the Wayland developers about improving the accessibility support. In the GNOME Wayland porting, among the accessibility items that will likely need to be implemented within the GNOME Shell Mutter Wayland compositor are input tweaks (slow keys / bounce keys), zoom and color adjustments, text protocol support for on-screen keyboards and the like, and other improvements for properly handling the on-screen keyboard.

In terms of why Clasen is bringing this GNOME work up with Wayland developers, "All of these features violate the careful separation between clients that Wayland maintains, so that probably calls for some privileged interface for ATs. I would appreciate feedback and discussion on this. Has anybody else thought about these problems already?"

The new mailing list thread can be found on [Wayland-devel][1].

--------------------------------------------------------------------------------

via: http://www.phoronix.com/scan.php?page=news_item&px=MTQ4NzI

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

[1]:http://lists.freedesktop.org/archives/wayland-devel/2013-October/011487.html