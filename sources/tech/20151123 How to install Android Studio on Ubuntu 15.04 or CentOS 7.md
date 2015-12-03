How to install Android Studio on Ubuntu 15.04 / CentOS 7
================================================================================
With the advancement of smart phones in the recent years, Android has become one of the biggest phone platforms and all the tools required to build Android applications are also freely available. Android Studio is an Integrated Development Environment (IDE) for developing Android applications based on [IntelliJ IDEA][1].  It is a free and open source software by Google released in 2014 and succeeds Eclipse as the main IDE.

In this article, we will learn how to install Android Studio on Ubuntu 15.04 and CentOS 7.

### Installation on Ubuntu 15.04 ###

We can install Android Studio in two ways. One is to set up the required repository and install it; other is to download it from the official Android site and install it locally.  In the following example,  we will be setting up the repo using command line and install it.  Before proceeding, we need to make sure that we have JDK  version1.6 or greater installed.

Here, I'm installing JDK 1.8.

    $ sudo add-apt-repository ppa:webupd8team/java

    $ sudo apt-get update

    $ sudo apt-get install oracle-java8-installer oracle-java8-set-default

Verify if java installation was successful:

    poornima@poornima-Lenovo:~$ java  -version

Now,  setup the repo for installing Android Studio

    $ sudo apt-add-repository ppa:paolorotolo/android-studio

![Android-Studio-repo](http://blog.linoxide.com/wp-content/uploads/2015/11/Android-studio-repo.png)

    $ sudo apt-get update

    $ sudo apt-get install android-studio

Above install command will install android-studio in the directory /opt.

Now, run the following command to start the setup wizard:

    $ /opt/android-studio/bin/studio.sh

This will invoke the setup screen. Following are the screen shots that follow to set up Android studio:

![Android Studio setup](http://blog.linoxide.com/wp-content/uploads/2015/11/Studio-setup.png)

![Install-type](Android Studio setup)

![Emulator Settings](http://blog.linoxide.com/wp-content/uploads/2015/11/Emulator-settings.png)

Once you press the Finish button, Licence agreement will be displayed. After you accept the licence, it starts downloading the required components.

![Download components](http://blog.linoxide.com/wp-content/uploads/2015/11/Download.png)

Android studio installation will be complete after this step. When you relaunch Android studio, you will be shown the following welcome screen from where you will be able to start working with your Android Studio.

![Welcome screen](http://blog.linoxide.com/wp-content/uploads/2015/11/Welcome-screen.png)

### Installation on CentOS 7 ###

Let us now learn how to install Android Studio on CentOS 7. Here also, you need to install JDK 1.6 or later.  Remember to use 'sudo' before the commands if you are not a root user.  You can download the [latest version][2] of JDK. In case you already have an older version installed, remove the same before installing the new one. In the below example, I will be installing JDK version 1.8.0_65 by downloading the required rpm.

    [root@li1260-39 ~]# rpm -ivh jdk-8u65-linux-x64.rpm
    Preparing... ################################# [100%]
    Updating / installing...
    1:jdk1.8.0_65-2000:1.8.0_65-fcs ################################# [100%]
    Unpacking JAR files...
    tools.jar...
    plugin.jar...
    javaws.jar...
    deploy.jar...
    rt.jar...
    jsse.jar...
    charsets.jar...
    localedata.jar...
    jfxrt.jar...

If Java path is not set properly, you will get error messages. Hence, set the correct path:

    export JAVA_HOME=/usr/java/jdk1.8.0_25/
    export PATH=$PATH:$JAVA_HOME

Check if the correct version has been installed:

    [root@li1260-39 ~]# java -version
    java version "1.8.0_65"
    Java(TM) SE Runtime Environment (build 1.8.0_65-b17)
    Java HotSpot(TM) 64-Bit Server VM (build 25.65-b01, mixed mode)

If you notice any error message of the sort  "unable-to-run-mksdcard-sdk-tool:" while trying to install Android Studio, you might also have to install the following packages on CentOS 7 64-bit:

    glibc.i686

    glibc-devel.i686

    libstdc++.i686

    zlib-devel.i686

    ncurses-devel.i686

    libX11-devel.i686

    libXrender.i686

    libXrandr.i686

Let us know install studio by downloading the ide file from [Android site][3] and unzipping the same.

    [root@li1260-39 tmp]# unzip android-studio-ide-141.2343393-linux.zip

Move android-studio directory to /opt directory

    [root@li1260-39 tmp]# mv /tmp/android-studio/ /opt/

You can create a simlink to the studio executable to quickly start it whenever you need it.

    [root@li1260-39 tmp]# ln -s /opt/android-studio/bin/studio.sh /usr/local/bin/android-studio

Now launch the studio from a terminal:

    [root@localhost ~]#studio

The screens that follow for completing the installation are same as the ones shown above for Ubuntu.  When the installation completes, you can start creating your own Android applications.

### Conclusion ###

Within a year of its release, Android Studio has taken over as the primary IDE for Android development by eclipsing Eclipse.  It is the only official IDE tool that will  support future  Android SDKs and other Android features that will be provided by Google. So, what are you waiting for? Go install Android Studio and have fun developing Android apps.

--------------------------------------------------------------------------------

via: http://linoxide.com/tools/install-android-studio-ubuntu-15-04-centos-7/

作者：[B N Poornima][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/bnpoornima/
[1]:https://www.jetbrains.com/idea/
[2]:http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html
[3]:http://developer.android.com/sdk/index.html