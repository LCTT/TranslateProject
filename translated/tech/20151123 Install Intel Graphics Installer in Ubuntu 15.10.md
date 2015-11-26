在Ubuntu 15.10上安装Intel图形安装器
================================================================================
![Intel graphics installer](http://ubuntuhandbook.org/wp-content/uploads/2015/11/intel_logo.jpg)

Intel最近发布了一个新版本的Linux图型安装器。在新版本中，Ubuntu 15.04将不被支持而必须用Ubuntu 15.10 Wily。


> Linux版Intel®图形安装器可以让你很容易的安装最新版的图形与视频驱动。它能保证你一直使用最新的增强与优化功能，并能够安装到Intel图形堆栈中，来保证你在你的Intel图形硬件下，享受到最佳的用户体验。*现在的Linux版的Intel®图形安装器支持最新版的Ubuntu。*

![intel-graphics-installer](http://ubuntuhandbook.org/wp-content/uploads/2015/11/intel-graphics-installer.jpg)

### 安装 ###

**1.** 从[链接页面][1]中下载安装器。当前支持Ubuntu 15.10的版本是1.2.1版。你可以在**系统设置 -> 详细信息**中检查你的操作系统（32位或64位）的类型。

![download-intel-graphics-installer](http://ubuntuhandbook.org/wp-content/uploads/2015/11/download-intel-graphics-installer.jpg)

**2.** 一旦下载完成，到下载目录中点击.deb安装包用Ubuntu软件中心打开它，然最后点击“安装”按钮。

![install-via-software-center](http://ubuntuhandbook.org/wp-content/uploads/2015/11/install-via-software-center.jpg)

**3.** 为了让系统信任Intel图形安装器，你需要通过下面的命令来为它添加钥匙。

用快捷键Ctrl+Alt+T或者在Unity Dash中的“应用程序启动器”中打开终端。依次粘贴运行下面的命令。

    wget --no-check-certificate https://download.01.org/gfx/RPM-GPG-KEY-ilg -O - | sudo apt-key add -
    
    wget --no-check-certificate https://download.01.org/gfx/RPM-GPG-KEY-ilg-2 -O - | sudo apt-key add -

![trust-intel](http://ubuntuhandbook.org/wp-content/uploads/2015/11/trust-intel.jpg)

注意：在运行第一个命令的过程中，如果钥匙下载完成后光标停住不动并且一直闪烁的话，就像上面图片显示的那样，输入你的密码（输入时不会看到什么有变化）然后回车就行了。

最后通过Unity Dash或应用程序启动器打开Intel图形安装器。

--------------------------------------------------------------------------------

via: http://ubuntuhandbook.org/index.php/2015/11/install-intel-graphics-installer-in-ubuntu-15-10/

作者：[Ji m][a]
译者：[XLCYun](https://github.com/XLCYun)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ubuntuhandbook.org/index.php/about/
[1]:https://01.org/linuxgraphics/downloads
