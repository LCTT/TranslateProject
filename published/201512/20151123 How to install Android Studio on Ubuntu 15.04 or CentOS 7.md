如何在 Ubuntu 15.04 / CentOS 7 上安装 Android Studio
================================================================================
随着最近几年智能手机的进步，安卓成为了最大的手机平台之一，在开发安卓应用中所用到的所有工具也都可以免费得到。Android Studio 是基于 [IntelliJ IDEA][1] 用于开发安卓应用的集成开发环境（IDE）。它是 Google 2014 年发布的免费开源软件，继 Eclipse 之后成为主要的 IDE。

在这篇文章，我们一起来学习如何在 Ubuntu 15.04 和 CentOS 7 上安装 Android Studio。

### 在 Ubuntu 15.04 上安装 ###

我们可以用两种方式安装 Android Studio。第一种是配置所需的库然后再安装它；另一种是从 Android 官方网站下载然后在本地编译安装。在下面的例子中，我们会使用命令行设置库并安装它。在继续下一步之前，我们需要确保我们已经安装了 JDK 1.6 或者更新版本。

这里，我打算安装 JDK 1.8。

    $ sudo add-apt-repository ppa:webupd8team/java
    $ sudo apt-get update
    $ sudo apt-get install oracle-java8-installer oracle-java8-set-default

验证 java 是否安装成功：

    poornima@poornima-Lenovo:~$ java  -version

现在，设置安装 Android Studio 需要的库

    $ sudo apt-add-repository ppa:paolorotolo/android-studio

![Android-Studio-repo](http://blog.linoxide.com/wp-content/uploads/2015/11/Android-studio-repo.png)

    $ sudo apt-get update
    $ sudo apt-get install android-studio

上面的安装命令会在 /opt 目录下面安装 Android Studio。

现在，运行下面的命令启动安装向导：

    $ /opt/android-studio/bin/studio.sh

这会激活安装窗口。下面的截图展示了安装 Android Studio 的过程。

![安装 Android Studio](http://blog.linoxide.com/wp-content/uploads/2015/11/Studio-setup.png)

![安装类型](http://blog.linoxide.com/wp-content/uploads/2015/11/Install-type.png)

![设置模拟器](http://blog.linoxide.com/wp-content/uploads/2015/11/Emulator-settings.png)

你点击了 Finish 按钮之后，就会显示同意协议页面。当你接受协议之后，它就开始下载需要的组件。

![下载组件](http://blog.linoxide.com/wp-content/uploads/2015/11/Download.png)

这一步完成之后就结束了 Android Studio 的安装。当你重启 Android Studio 时，你会看到下面的欢迎界面，从这里你可以开始用 Android Studio 工作了。

![欢迎界面](http://blog.linoxide.com/wp-content/uploads/2015/11/Welcome-screen.png)

### 在 CentOS 7 上安装 ###

现在再让我们来看看如何在 CentOS 7 上安装 Android Studio。这里你同样需要安装 JDK 1.6 或者更新版本。如果你不是 root 用户，记得在命令前面使用 ‘sudo’。你可以下载[最新版本][2]的 JDK。如果你已经安装了一个比较旧的版本，在安装新的版本之前你需要先卸载旧版本。在下面的例子中，我会通过下载需要的 rpm 包安装 JDK 1.8.0_65。

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

如果没有正确设置 Java 路径，你会看到错误信息。因此，设置正确的路径：

    export JAVA_HOME=/usr/java/jdk1.8.0_25/
    export PATH=$PATH:$JAVA_HOME

检查是否安装了正确的版本：

    [root@li1260-39 ~]# java -version
    java version "1.8.0_65"
    Java(TM) SE Runtime Environment (build 1.8.0_65-b17)
    Java HotSpot(TM) 64-Bit Server VM (build 25.65-b01, mixed mode)

如果你安装 Android Studio 的时候看到任何类似 “unable-to-run-mksdcard-sdk-tool:” 的错误信息，你可能要在 CentOS 7 64 位系统中安装以下软件包：

 -  glibc.i686
 -  glibc-devel.i686
 - libstdc++.i686
 - zlib-devel.i686
 - ncurses-devel.i686
 - libX11-devel.i686
 - libXrender.i686
 - libXrandr.i686

通过从 [Android 网站][3] 下载 IDE 文件然后解压安装 studio 也是一样的。

    [root@li1260-39 tmp]# unzip android-studio-ide-141.2343393-linux.zip

移动 android-studio 目录到 /opt 目录

    [root@li1260-39 tmp]# mv /tmp/android-studio/ /opt/

需要的话你可以创建一个到 studio 可执行文件的符号链接用于快速启动。

    [root@li1260-39 tmp]# ln -s /opt/android-studio/bin/studio.sh /usr/local/bin/android-studio

现在在终端中启动 studio：

    [root@localhost ~]#studio

之后用于完成安装的截图和前面 Ubuntu 安装过程中的是一样的。安装完成后，你就可以开始开发你自己的 Android 应用了。

### 总结 ###

虽然发布不到一年，但是 Android Studio 已经替代 Eclipse 成为了 Android 的开发最主要的 IDE。它是唯一能支持 Google 之后将要提供的 Android SDK 和其它 Android 特性的官方 IDE 工具。那么，你还在等什么呢？赶快安装 Android Studio 来体验开发 Android 应用的乐趣吧。

--------------------------------------------------------------------------------

via: http://linoxide.com/tools/install-android-studio-ubuntu-15-04-centos-7/

作者：[B N Poornima][a]
译者：[ictlyh](http://mutouxiaogui.cn/blog/)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/bnpoornima/
[1]:https://www.jetbrains.com/idea/
[2]:http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html
[3]:http://developer.android.com/sdk/index.html
