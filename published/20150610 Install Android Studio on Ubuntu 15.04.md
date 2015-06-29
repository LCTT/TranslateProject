在Ubuntu 15.04下安装Android Studio
================================================================================

![](http://www.ubuntugeek.com/wp-content/uploads/2015/05/23.png)

Android Studio是官方为了Android应用开发者而发布的IDE，它基于IntelliJ的IDEA。

### Android Studio的功能 ###

- 灵活的基于Gradle的建构系统

- 针对不同手机编译多个版本的apk

- 代码模板功能构建出各种常用的应用

- 支持拖动编辑主题的富布局编辑器

- lint工具可以捕捉到应用的性能、可用性、版本冲突或者其他问题

- 代码混淆和应用签名功能

- 内置 Google Cloud Platform 的支持，可以轻易的融入Google Cloud Messaging 和 App Engine支持

- 还有更多

### 在 Ubuntu 15.04 上安装 Android Studio ###

打开terminal，输入以下命令

    sudo apt-add-repository ppa:paolorotolo/android-studio
    sudo apt-get update
    sudo apt-get install android-studio

如果要把Android Studio添加到启动栏，你需要如下操作

打开Android Studio，点击Configure选择Create Desktop Entry，这样Android Studio应该在dash中创建快捷方式了。

### 截图 ###

![](http://www.ubuntugeek.com/wp-content/uploads/2015/05/12.png)

![](http://www.ubuntugeek.com/wp-content/uploads/2015/05/31.png)

![](http://www.ubuntugeek.com/wp-content/uploads/2015/05/41.png)

![](http://www.ubuntugeek.com/wp-content/uploads/2015/05/5.png)

![](http://www.ubuntugeek.com/wp-content/uploads/2015/05/6.png)

![](http://www.ubuntugeek.com/wp-content/uploads/2015/05/7.png)

--------------------------------------------------------------------------------

via: http://www.ubuntugeek.com/install-android-studio-on-ubuntu-15-04.html

作者：[ruchi][a]
译者：[NearTan](https://github.com/NearTan)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.ubuntugeek.com/author/ubuntufix