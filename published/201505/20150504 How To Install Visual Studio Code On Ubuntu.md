在Ubuntu中安装Visual Studio Code
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/05/Install-Visual-Studio-Code-in-Ubuntu.jpeg)

微软令人意外地[发布了Visual Studio Code][1]，并支持主要的桌面平台，当然包括linux。如果你是一名需要在ubuntu工作的web开发人员，你可以**非常轻松的安装Visual Studio Code**。

我将要使用[Ubuntu Make][2]来安装Visual Studio Code。Ubuntu Make，就是以前的Ubuntu开发者工具中心，是一个命令行工具，帮助用户快速安装各种开发工具、语言和IDE。也可以使用Ubuntu Make轻松[安装Android Studio][3] 和其他IDE，如Eclipse。本文将展示**如何在Ubuntu中使用Ubuntu Make安装Visual Studio Code**。（译注：也可以直接去微软官网下载安装包）

###  安装微软Visual Studio Code ###

开始之前，首先需要安装Ubuntu Make。虽然Ubuntu Make存在Ubuntu15.04官方库中，**但是需要Ubuntu Make 0.7以上版本才能安装Visual Studio**。所以，需要通过官方PPA更新到最新的Ubuntu Make。此PPA支持Ubuntu 14.04, 14.10 和 15.04。

注意，**仅支持64位版本**。

打开终端，使用下列命令，通过官方PPA来安装Ubuntu Make：

    sudo add-apt-repository ppa:ubuntu-desktop/ubuntu-make
    sudo apt-get update
    sudo apt-get install ubuntu-make

安装Ubuntu Make完后，接着使用下列命令安装Visual Studio Code：

    umake web visual-studio-code

安装过程中，将会询问安装路径，如下图：

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/05/Visual_Studio_Code_Ubuntu_1.jpeg)

在抛出一堆要求和条件后，它会询问你是否确认安装Visual Studio Code。输入‘a’来确定：

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/05/Visual_Studio_Code_Ubuntu_2.jpeg)

确定之后，安装程序会开始下载并安装。安装完成后，你可以发现Visual Studio Code 图标已经出现在了Unity启动器上。点击图标开始运行！下图是Ubuntu 15.04 Unity的截图：

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/05/Visual_Studio_Code_Ubuntu.jpeg)

### 卸载Visual Studio Code###

卸载Visual Studio Code，同样使用Ubuntu Make命令。如下：

    umake web visual-studio-code --remove

如果你不打算使用Ubuntu Make，也可以通过微软官方下载安装文件。

- [下载Visual Studio Code Linux版][4]

怎样！是不是超级简单就可以安装Visual Studio Code，这都归功于Ubuntu Make。我希望这篇文章能帮助到你。如果您有任何问题或建议，欢迎给我留言。

--------------------------------------------------------------------------------

via: http://itsfoss.com/install-visual-studio-code-ubuntu/

作者：[Abhishek][a]
译者：[Vic020/VicYu](http://vicyu.net)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:https://linux.cn/article-5376-1.html
[2]:https://wiki.ubuntu.com/ubuntu-make
[3]:http://itsfoss.com/install-android-studio-ubuntu-linux/
[4]:https://code.visualstudio.com/Download
