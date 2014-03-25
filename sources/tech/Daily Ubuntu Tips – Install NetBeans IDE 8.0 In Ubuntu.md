Daily Ubuntu Tips – Install NetBeans IDE 8.0 In Ubuntu
================================================================================
NetBeans 8.0 has just been released and this brief tutorial is going to show you how to easily install it in Ubuntu if you haven’t already done so. For developers who need help installing NetBeans in Ubuntu, this post will guide you.

For those who don’t know what NetBeans is, it’s an IDE application that allows users to quickly and efficiently develop and build desktop, mobile and web applications.

It’s free and open-source and is supported by a vast community of users and developers.

Some of the features that were released in version 8 are, support for JDK 8 editor and tools enhancements, Tomcat 8.0 support, enhanced CDI integration, a new Maven graph layout switcher, new editor for supporting and creating JQuery widgets and plugins, and HTML 5, PHP 5.5 support.

For more about this release, [check out its release page][1].

There are two primary ways to download and install NetBeans IDE. One is downloading a package file that combines JDK 8 and NetBeans. This combination allows for the development of applications on the Java platform.

To get this package, [download it from here][2].

Another way to get NetBeans is go download and install it directly from its download page. There, you have the option to download the complete package which contains, NetBeans Platform SDK, Java SE, Java FX, Java EE, Java ME, HTML5, C/C++, Groovy, PHP and Apache Tomcat 8.0.

There are five options of the package to download. Choose the package you wish to download and click the Download button.

To get these packages, visit [NetBeans download page][3].

### Install Java JDK first before installing NetBeans ###

Before you can install NetBeans, you must first install Java JDK. Without it, NetBeans won’t install. To lean how to install Java  JDK, read [this post][4].

After installing Java JDK, continue below to install NetBeans.

If you chose the Oracle version, then JDK is already packaged into the file. All you have to do is run the executable to install both JDK and NetBeans.

Once you’ve downloaded the package you want, run the commands below to make the package executable.

    chmod +x ~/Downloads/netbeans-8.0-linux*.sh

the commands above assume that the file was downloaded in your Downloads folder in Ubuntu

Next, run the commands below to begin the installation.

    sh -c " ~/Downloads/netbeans-8.0-linux*.sh"

Follow the wizard until the installation is complete.

![netbeans-ubuntu](http://www.liberiangeek.net/wp-content/uploads/2014/03/netbeansubuntu.png)

Enjoy!

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2014/03/daily-ubuntu-tips-install-netbeans-ide-8-0-in-ubuntu/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://netbeans.org/community/releases/80/index.html
[2]:http://www.oracle.com/technetwork/java/javase/downloads/jdk-netbeans-jsp-142931.html
[3]:https://netbeans.org/downloads/
[4]:http://www.liberiangeek.net/2013/10/netbeans-ide-7-4-released-heres-install-ubuntu/