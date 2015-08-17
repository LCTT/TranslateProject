translation by strugglingyouth
Linux FAQs with Answers--How to fix Wireshark GUI freeze on Linux desktop
================================================================================
> **Question**: When I try to open a pre-recorded packet dump on Wireshark on Ubuntu, its UI suddenly freezes, and the following errors and warnings appear in the terminal where I launched Wireshark. How can I fix this problem?

Wireshark is a GUI-based packet capture and sniffer tool. This tool is popularly used by network administrators, network security engineers or developers for various tasks where packet-level network analysis is required, for example during network troubleshooting, vulnerability testing, application debugging, or protocol reverse engineering. Wireshark allows one to capture live packets and browse their protocol headers and payloads via a convenient GUI.

![](https://farm1.staticflickr.com/722/20584224675_f4d7a59474_c.jpg)

It is known that Wireshark's UI, especially run under Ubuntu desktop, sometimes hangs or freezes with the following errors, while you are scrolling up or down the packet list view, or starting to load a pre-recorded packet dump file.

    (wireshark:3480): GLib-GObject-WARNING **: invalid unclassed pointer in cast to 'GObject'
    (wireshark:3480): GLib-GObject-CRITICAL **: g_object_set_qdata_full: assertion 'G_IS_OBJECT (object)' failed
    (wireshark:3480): GLib-GObject-WARNING **: invalid unclassed pointer in cast to 'GtkRange'
    (wireshark:3480): Gtk-CRITICAL **: gtk_range_get_adjustment: assertion 'GTK_IS_RANGE (range)' failed
    (wireshark:3480): GLib-GObject-WARNING **: invalid unclassed pointer in cast to 'GtkOrientable'
    (wireshark:3480): Gtk-CRITICAL **: gtk_orientable_get_orientation: assertion 'GTK_IS_ORIENTABLE (orientable)' failed
    (wireshark:3480): GLib-GObject-WARNING **: invalid unclassed pointer in cast to 'GtkScrollbar'
    (wireshark:3480): GLib-GObject-WARNING **: invalid unclassed pointer in cast to 'GtkWidget'
    (wireshark:3480): GLib-GObject-WARNING **: invalid unclassed pointer in cast to 'GObject'
    (wireshark:3480): GLib-GObject-CRITICAL **: g_object_get_qdata: assertion 'G_IS_OBJECT (object)' failed
    (wireshark:3480): Gtk-CRITICAL **: gtk_widget_set_name: assertion 'GTK_IS_WIDGET (widget)' failed

Apparently this error is caused by some incompatibility between Wireshark and overlay-scrollbar, and has not been fixed in the latest Ubuntu desktop (e.g., as of Ubuntu 15.04 Vivid Vervet).

A workaround to avoid this Wireshark UI freeze problem is to **temporarily disabling overlay-scrollbar**. There are two ways to disable overlay-scrollbar in Wireshark, depending on how you launch Wireshark on your desktop.

### Command-Line Solution ###

Overlay-scrollbar can be disabled by setting "**LIBOVERLAY_SCROLLBAR**" environment variable to "0".

So if you are launching Wireshark from the command in a terminal, you can disable overlay-scrollbar in Wireshark as follows.

Open your .bashrc, and define the following alias.

    alias wireshark="LIBOVERLAY_SCROLLBAR=0 /usr/bin/wireshark"

### Desktop Launcher Solution ###

If you are launching Wireshark using a desktop launcher, you can edit its desktop launcher file.

    $ sudo vi /usr/share/applications/wireshark.desktop

Look for a line that starts with "Exec", and change it as follows.

    Exec=env LIBOVERLAY_SCROLLBAR=0 wireshark %f

While this solution will be beneficial for all desktop users system-wide, it will not survive Wireshark upgrade. If you want to preserve the modified .desktop file, copy it to your home directory as follows.

    $ cp /usr/share/applications/wireshark.desktop ~/.local/share/applications/ 

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/fix-wireshark-gui-freeze-linux-desktop.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
