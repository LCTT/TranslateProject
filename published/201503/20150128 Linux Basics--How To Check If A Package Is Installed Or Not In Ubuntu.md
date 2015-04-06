Linux 基础：如何在Ubuntu上检查一个软件包是否安装
================================================================================
![](http://1102047360.rsc.cdn77.org/wp-content/uploads/2014/04/ubuntu-790x558.png)

如果你正在管理Debian或者Ubuntu服务器，你也许会经常使用**dpkg** 或者 **apt-get**命令。这两个命令用来安装、卸载和更新包。

在本篇中，让我们看下如何在基于DEB的系统下检查是否安装了一个包。

要检查特定的包，比如firefox是否安装了，使用这个命令：

    dpkg -s firefox

示例输出：

     Package: firefox
     Status: install ok installed
     Priority: optional
     Section: web
     Installed-Size: 93339
     Maintainer: Ubuntu Mozilla Team <ubuntu-mozillateam@lists.ubuntu.com>
     Architecture: amd64
     Version: 35.0+build3-0ubuntu0.14.04.2
     Replaces: kubuntu-firefox-installer
     Provides: gnome-www-browser, iceweasel, www-browser
     Depends: lsb-release, libasound2 (>= 1.0.16), libatk1.0-0 (>= 1.12.4), libc6 (>= 2.17), libcairo2 (>= 1.2.4), libdbus-1-3 (>= 1.0.2), libdbus-glib-1-2 (>= 0.78), libfontconfig1 (>= 2.9.0), libfreetype6 (>= 2.2.1), libgcc1 (>= 1:4.1.1), libgdk-pixbuf2.0-0 (>= 2.22.0), libglib2.0-0 (>= 2.37.3), libgtk2.0-0 (>= 2.24.0), libpango-1.0-0 (>= 1.22.0), libpangocairo-1.0-0 (>= 1.14.0), libstartup-notification0 (>= 0.8), libstdc++6 (>= 4.6), libx11-6, libxcomposite1 (>= 1:0.3-1), libxdamage1 (>= 1:1.1), libxext6, libxfixes3, libxrender1, libxt6
     Recommends: xul-ext-ubufox, libcanberra0, libdbusmenu-glib4, libdbusmenu-gtk4
     Suggests: ttf-lyx
     Conffiles:
     /etc/firefox/syspref.js 09e457e65435a1a043521f2bd19cd2a1
     /etc/apport/blacklist.d/firefox ee63264f847e671832d42255912ce144
     /etc/apport/native-origins.d/firefox 7c26b75c7c2b715c89cc6d85338252a4
     /etc/apparmor.d/usr.bin.firefox f54f7a43361c7ecfa3874abca2f292cf
     Description: Safe and easy web browser from Mozilla
     Firefox delivers safe, easy web browsing. A familiar user interface,
     enhanced security features including protection from online identity theft,
     and integrated search let you get the most out of the web.
     Xul-Appid: {ec8030f7-c20a-464f-9b0e-13a3a9e97384}

如上所见，firefox已经安装了。

同样，你可以使用**dpkg-query** 命令。这个命令会有一个更好的输出，当然，你可以用通配符。

    dpkg-query -l firefox

示例输出：

    Desired=Unknown/Install/Remove/Purge/Hold
    | Status=Not/Inst/Conf-files/Unpacked/halF-conf/Half-inst/trig-aWait/Trig-pend
    |/ Err?=(none)/Reinst-required (Status,Err: uppercase=bad)
    ||/ Name                                 Version                 Architecture            Description
    +++-====================================-=======================-=======================-=============================================================================
    ii  firefox                              35.0+build3-0ubuntu0.14 amd64                   Safe and easy web browser from Mozilla

要列出你系统中安装的所有包，输入下面的命令：

    dpkg --get-selections

示例输出：

    abiword                        install
    abiword-common                    install
    accountsservice                    install
    acl                        install
    adduser                        install
    alsa-base                    install
    alsa-utils                    install
    anacron                        install
    app-install-data                install
    apparmor                    install
    .
    .
    .
    zeitgeist                    install
    zeitgeist-core                    install
    zeitgeist-datahub                install
    zenity                        install
    zenity-common                    install
    zip                        install
    zlib1g:amd64                    install
    zlib1g:i386                    install

上面的输出可能会非常长，这依赖于你的系统已安装的包。

你同样可以通过**grep**来过滤割到更精确的包。比如，我想要使用**dpkg**命令查看系统中安装的gcc包：

    dpkg --get-selections | grep gcc

示例输出：

    gcc                        install
    gcc-4.8                        install
    gcc-4.8-base:amd64                install
    gcc-4.8-base:i386                install
    gcc-4.9-base:amd64                install
    gcc-4.9-base:i386                install
    libgcc-4.8-dev:amd64                install
    libgcc1:amd64                    install
    libgcc1:i386                    install

此外，你可以使用“**-L**”参数来找出包中文件的位置。

    dpkg -L gcc-4.8

示例输出：

    /.
    /usr
    /usr/share
    /usr/share/doc
    /usr/share/doc/gcc-4.8-base
    /usr/share/doc/gcc-4.8-base/README.Bugs
    /usr/share/doc/gcc-4.8-base/NEWS.html
    /usr/share/doc/gcc-4.8-base/quadmath
    /usr/share/doc/gcc-4.8-base/quadmath/changelog.gz
    /usr/share/doc/gcc-4.8-base/gcc
    .
    .
    .
    /usr/bin/x86_64-linux-gnu-gcc-4.8
    /usr/bin/x86_64-linux-gnu-gcc-ar-4.8
    /usr/bin/x86_64-linux-gnu-gcov-4.8

就是这样了。希望这篇对你有用。

美好的一天！

--------------------------------------------------------------------------------

via: http://www.unixmen.com/linux-basics-check-package-installed-not-ubuntu/

作者：[SK][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/sk/
