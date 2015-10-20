translating---geekpi

Linux FAQs with Answers--How to install Ubuntu desktop behind a proxy
================================================================================
> **Question:** My computer is connected to a corporate network sitting behind an HTTP proxy. When I try to install Ubuntu desktop on the computer from a CD-ROM drive, the installation hangs and never finishes while trying to retrieve files, which is presumably due to the proxy. However, the problem is that Ubuntu installer never asks me to configure proxy during installation procedure. Then how can I install Ubuntu desktop behind a proxy? 

Unlike Ubuntu server, installation of Ubuntu desktop is pretty much auto-pilot, not leaving much room for customization, such as custom disk partitioning, manual network settings, package selection, etc. While such simple, one-shot installation is considered user-friendly, it leaves much to be desired for those users looking for "advanced installation mode" to customize their Ubuntu desktop installation.

In addition, one big problem of the default Ubuntu desktop installer is the absense of proxy settings. If your computer is connected behind a proxy, you will notice that Ubuntu installation gets stuck while preparing to download files.

![](https://c2.staticflickr.com/6/5683/22195372232_cea81a5e45_c.jpg)

This post describes how to get around the limitation of Ubuntu installer and **install Ubuntu desktop when you are behind a proxy**.

The basic idea is as follows. Instead of starting with Ubuntu installer directly, boot into live Ubuntu desktop first, configure proxy settings, and finally launch Ubuntu installer manually from live desktop. The following is the step by step procedure.

After booting from Ubuntu desktop CD/DVD or USB, click on "Try Ubuntu" on the first welcome screen.

![](https://c1.staticflickr.com/1/586/22195371892_3816ba09c3_c.jpg)

Once you boot into live Ubuntu desktop, click on Settings icon in the left.

![](https://c1.staticflickr.com/1/723/22020327738_058610c19d_c.jpg)

Go to Network menu.

![](https://c2.staticflickr.com/6/5675/22021212239_ba3901c8bf_c.jpg)

Configure proxy settings manually.

![](https://c1.staticflickr.com/1/735/22020025040_59415e0b9a_c.jpg)

Next, open a terminal.

![](https://c2.staticflickr.com/6/5642/21587084823_357b5c48cb_c.jpg)

Enter a root session by typing the following:

    $ sudo su

Finally, type the following command as the root.

    # ubiquity gtk_ui

This will launch GUI-based Ubuntu installer as follows.

![](https://c1.staticflickr.com/1/723/22020025090_cc64848b6c_c.jpg)

Proceed with the rest of installation.

![](https://c1.staticflickr.com/1/628/21585344214_447020e9d6_c.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/install-ubuntu-desktop-behind-proxy.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
