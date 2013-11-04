Daily Ubuntu Tips–Update To LibreOffice Latest In Ubuntu Via PPA
================================================================================
For every new Ubuntu you install, you’ll also have LibreOffice, the office productivity tool that allows you to create and manage documents. Most people are aware of Microsoft Word, Excel, PowerPoint and Outlook but few know about LibreOffice.

LibreOffice is made available by volunteers around the world and is backed by a charitable foundation. It is the primary office productivity tool in the Linux community and it’s free. It can be installed on Windows, Mac OS X and Linux computers.

Just today, a new release was made available to the public. Windows, Mac OS X and Linux users can go directly to the download page and download the latest release.

An advantage Ubuntu users have is they can add LibreOffice’s software repository to your their computer to install the latest releases. This is useful if you wish to quickly get every latest release when it’s made available.

The current release family of LibreOffice is 4.1. Every subsequent release will be available instantly in the 4.1 repository until a new mainline is launched which maybe version 4.2.

So, to always upgrade automatically in Ubuntu, add the software repository below.

    sudo add-apt-repository ppa:libreoffice/ppa

Next, run the commands below to upgrade to the latest version LibreOffice.

    sudo apt-get update && sudo apt-get dist-upgrade

That’s it. When you add the repository above and update your system, Ubuntu will automatically download and install LibreOffice latest releases.

Windows and Mac OS X users may upgrade directly from within the program suite or download it directly from the web. 

![](http://www.liberiangeek.net/wp-content/uploads/2013/11/libreoffice-upgrade-ubuntu.png)

Enjoy!

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2013/11/daily-ubuntu-tipsupdate-to-libreoffice-latest-in-ubuntu-via-ppa/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出