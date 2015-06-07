translating----geekpi

Here's How to Install the Beautiful Arc GTK+ Flat Theme on Linux
================================================================================
> Step-by-step tutorial with easy-to-follow instructions

**Today we're introducing you to a newly released GTK+ theme that features transparent and flat elements and is compatible with multiple desktop environments and Linux distributions. [The theme is called Arc][1].**

Before going into detail, we suggest that you take a quick look at the gallery attached below, so you have a basic idea of what the theme looks like. Also, you should be aware that it currently works with GTK+ 2.x, GTK+ 3.x, GNOME-Shell, Budgie, Unity, and Pantheon user interfaces, all of them using the GNOME Stack.

Also, the developer of the Arc theme informs us that it has been successfully tested on the Ubuntu 15.04 (Vivid Vervet), Arch Linux, elementary OS 0.3 Freya, Fedora 21, Fedora 22, Debian GNU/Linux 8.0 (Jessie), Debian Testing, Debian Unstable, openSUSE 13.2, openSUSE Tumbleweed, and Gentoo Linux operating systems.

### Requirements and installation instructions ###

To build the Arc theme, you will need to first install some packages, such as autoconf, automake, pkg-config (pkgconfig for Fedora), libgtk-3-dev for Debian/Ubuntu-based distros or gtk3-devel for RPM-based ones, git, gtk2-engines-pixbuf, and gtk-engine-murrine (gtk-murrine-engine for Fedora).

The Arc theme does not yet have binary packages, so you will need to grab the latest source code from the project's Git repository and compile it. Therefore, open a Terminal app and run the following commands, one by one, hitting the Enter key after each one and waiting for the previous command to finish before adding the next.

    git clone https://github.com/horst3180/arc-theme --depth 1 && cd arc-theme
    git fetch --tags
    git checkout $(git describe --tags `git rev-list --tags --max-count=1`)
    ./autogen.sh --prefix=/usr
    sudo make install

That's it! At this moment, the Arc theme is currently installed on your GNU/Linux distribution and you can activate it using either the GNOME Tweak Tool utility if you're using GNOME or the Unity Tweak Tool software if you are running Ubuntu's Unity desktop. Have fun and don't forget to drop a screenshot with your setup in the comments section below.

![](http://i1-news.softpedia-static.com/images/news2/Here-s-How-to-Install-the-Beautiful-Arc-GTK-plus-Flat-Theme-on-Linux-483143-2.jpg)

![](http://i1-news.softpedia-static.com/images/news2/Here-s-How-to-Install-the-Beautiful-Arc-GTK-plus-Flat-Theme-on-Linux-483143-3.jpg)

![](http://i1-news.softpedia-static.com/images/news2/Here-s-How-to-Install-the-Beautiful-Arc-GTK-plus-Flat-Theme-on-Linux-483143-4.jpg)

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/Here-s-How-to-Install-the-Beautiful-Arc-GTK-plus-Flat-Theme-on-Linux-483143.shtml

作者：[Marius Nestor][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://news.softpedia.com/editors/browse/marius-nestor
[1]:https://github.com/horst3180/Arc-theme
[2]:
[3]:
[4]:
[5]:
[6]:
[7]:
[8]:
[9]:
[10]:
[11]:
[12]:
[13]:
[14]:
[15]:
[16]:
[17]:
[18]:
[19]:
[20]:
