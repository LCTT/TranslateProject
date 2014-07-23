The Native Dropbox Linux Client Debuts New Qt Interface
================================================================================
**The latest experimental build of the native Dropbox Linux client has debuted with an all new Qt interface.**

Dropbox say that the UI rewrite, which will be used on both Windows and Linux, will fix a ‘large number’ of long-standing bugs, issues and glitches. The cross-platform toolkit is also set to improve general performance.

Alongside an all new setup wizard and login screen (see below) is a handful of redesigned splash screens.

![Login Screen ](http://www.omgubuntu.co.uk/wp-content/uploads/2014/07/dropbox-qt-login.jpg)
Login Screen

![Setup Screen](http://www.omgubuntu.co.uk/wp-content/uploads/2014/07/dropbox-qt-set-up.jpg)
Setup Screen

![Congratulations Screen ](http://www.omgubuntu.co.uk/wp-content/uploads/2014/07/dropbox-qt-finished.jpg)
Congratulations Screen

### Not Stable Yet ###

Dropbox developers caution that since much of the new interface “is still rough around the edges” testers should expect to encounter various visual bugs while using it. The new UI does not yet work with accessibility tools like screen readers.

![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/07/dropbox-linux-clients-old-and-new.jpg)

The new UI uses (for now) the stock Qt theme. This isn’t ugly per se, but it does look a little out of place on the Ubuntu desktop, especially compared to previous builds. Memory usage is also reportedly higher, in some cases jumping from 60MB when idle to more than 178MB. Those on low-end devices should resist the temptation to try this build — at least until this particular bug has been addressed.

Full change log for Dropbox 2.11.0 (Experimental) for Linux:

- Rewrite of the Windows & Linux UI in Qt
- File identifiers detect when files have been moved/renamed
- New setup/login experience
- Faster uploads for small files
- New splash screens

### Download Dropbox Linux Build 2.11.x ###

To try the experimental builds just download the correct archive for your system using the links below.

- [Dropbox Experimental (64bit) Offline Linux Installer][1]
- [Dropbox Experimental (32bit) Offline Linux Installer][2]

Once downloaded, extract the archive to your Home folder. It’s hidden by default, so using the Terminal, ‘`cd`‘ into the ‘`.dropbox-dist/dropbox-lnx`‘ folder and run ‘`./dropbox start`‘.

Dropbox terminal navigation gif:

![](http://i.imgur.com/5TeYXEm.gif)

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2014/07/dropbox-experimental-linux-build-qt-rewrite

原文作者：[Joey-Elijah Sneddon][a]

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://plus.google.com/117485690627814051450/?rel=author
[1]:https://d1ilhw0800yew8.cloudfront.net/client/dropbox-lnx.x86_64-2.11.0.tar.gz
[2]:https://d1ilhw0800yew8.cloudfront.net/client/dropbox-lnx.x86-2.11.0.tar.gz