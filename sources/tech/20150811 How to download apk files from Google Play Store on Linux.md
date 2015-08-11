How to download apk files from Google Play Store on Linux
================================================================================
Suppose you want to install an Android app on your Android device. However, for whatever reason, you cannot access Google Play Store on the Android device. What can you do then? One way to install the app without Google Play Store access is to download its APK file using some other means, and then [install the APK][1] file on the Android device manually.

There are several ways to download official APK files from Google Play Store on non-Android devices such as regular computers and laptops. For example, there are browser plugins (e.g., for [Chrome][2] or [Firefox][3]) or online APK archives that allow you to download APK files using a web browser. If you do not trust these closed-source plugins or third-party APK repositories, there is yet another way to download official APK files manually, and that is via an open-source Linux app called [GooglePlayDownloader][4].

GooglePlayDownloader is a Python-based GUI application that enables you to search and download APK files from Google Play Store. Since this is completely open-source, you can be assured while using it. In this tutorial, I am going to show how to download an APK file from Google Play Store using GooglePlayDownloader in Linux environment.

### Python requirement ###

GooglePlayDownloader requires Python with SNI (Server Name Indication) support for SSL/TLS communication. This feature comes with Python 2.7.9 or higher. This leaves out older distributions such as Debian 7 Wheezy or earlier, Ubuntu 14.04 or earlier, or CentOS/RHEL 7 or earlier. Assuming that you have a Linux distribution with Python 2.7.9 or higher, proceed to install GooglePlayDownloader as follows.

### Install GooglePlayDownloader on Ubuntu ###

On Ubuntu, you can use the official deb build. One catch is that you may need to install one required dependency manually.

#### On Ubuntu 14.10 ####

Download [python-ndg-httpsclient][5] deb package, which is a missing dependency on older Ubuntu distributions. Also download GooglePlayDownloader's official deb package.

    $ wget http://mirrors.kernel.org/ubuntu/pool/main/n/ndg-httpsclient/python-ndg-httpsclient_0.3.2-1ubuntu4_all.deb
    $ wget http://codingteam.net/project/googleplaydownloader/download/file/googleplaydownloader_1.7-1_all.deb 

We are going to use [gdebi command][6] to install those two deb files as follows. The gdebi command will automatically handle any other dependencies.

    $ sudo apt-get install gdebi-core
    $ sudo gdebi python-ndg-httpsclient_0.3.2-1ubuntu4_all.deb
    $ sudo gdebi googleplaydownloader_1.7-1_all.deb

#### On Ubuntu 15.04 or later ####

Recent Ubuntu distributions ship all required dependencies, and thus the installation is straightforward as follows.

    $ wget http://codingteam.net/project/googleplaydownloader/download/file/googleplaydownloader_1.7-1_all.deb
    $ sudo apt-get install gdebi-core
    $ sudo gdebi googleplaydownloader_1.7-1_all.deb 

### Install GooglePlayDownloader on Debian ###

Due to its Python requirement, GooglePlayDownloader cannot be installed on Debian 7 Wheezy or earlier unless you upgrade its stock Python.

#### On Debian 8 Jessie and higher: ####

    $ wget http://codingteam.net/project/googleplaydownloader/download/file/googleplaydownloader_1.7-1_all.deb
    $ sudo apt-get install gdebi-core
    $ sudo gdebi googleplaydownloader_1.7-1_all.deb 

### Install GooglePlayDownloader on Fedora ###

Since GooglePlayDownloader was originally developed for Debian based distributions, you need to install it from the source if you want to use it on Fedora.

First, install necessary dependencies.

    $ sudo yum install python-pyasn1 wxPython python-ndg_httpsclient protobuf-python python-requests 

Then install it as follows.

    $ wget http://codingteam.net/project/googleplaydownloader/download/file/googleplaydownloader_1.7.orig.tar.gz
    $ tar -xvf googleplaydownloader_1.7.orig.tar.gz
    $ cd googleplaydownloader-1.7
    $ chmod o+r -R .
    $ sudo python setup.py install
    $ sudo sh -c "echo 'python /usr/lib/python2.7/site-packages/googleplaydownloader-1.7-py2.7.egg/googleplaydownloader/googleplaydownloader.py' > /usr/bin/googleplaydownloader"

### Download APK Files from Google Play Store with GooglePlayDownloader ###

Once you installed GooglePlayDownloader, you can download APK files from Google Play Store as follows.

First launch the app by typing:

    $ googleplaydownloader 

![](https://farm1.staticflickr.com/425/20229024898_105396fa68_b.jpg)

At the search bar, type the name of the app you want to download from Google Play Store.

![](https://farm1.staticflickr.com/503/20230360479_925f5da613_b.jpg)

Once you find the app in the search list, choose the app, and click on "Download selected APK(s)" button. You will find the downloaded APK file in your home directory. Now you can move the APK file to the Android device of your choice, and install it manually.

Hope this helps.

--------------------------------------------------------------------------------

via: http://xmodulo.com/download-apk-files-google-play-store.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:http://xmodulo.com/how-to-install-apk-file-on-android-phone-or-tablet.html
[2]:https://chrome.google.com/webstore/detail/apk-downloader/cgihflhdpokeobcfimliamffejfnmfii
[3]:https://addons.mozilla.org/en-us/firefox/addon/apk-downloader/
[4]:http://codingteam.net/project/googleplaydownloader
[5]:http://packages.ubuntu.com/vivid/python-ndg-httpsclient
[6]:http://xmodulo.com/how-to-install-deb-file-with-dependencies.html