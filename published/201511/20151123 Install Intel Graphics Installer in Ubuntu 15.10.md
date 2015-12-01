在 Ubuntu 15.10 上安装 Intel Graphics 安装器
================================================================================
![Intel graphics installer](http://ubuntuhandbook.org/wp-content/uploads/2015/11/intel_logo.jpg)

Intel 最近发布了一个新版本的 Linux Graphics 安装器。在新版本中，将不支持 Ubuntu 15.04，而必须用 Ubuntu 15.10 Wily。

> Linux 版 Intel® Graphics 安装器可以让你很容易的为你的 Intel Graphics 硬件安装最新版的图形与视频驱动。它能保证你一直使用最新的增强与优化功能，并能够安装到 Intel Graphics Stack 中，来保证你在你的 Intel 图形硬件下，享受到最佳的用户体验。*现在 Linux 版的 Intel® Graphics 安装器支持最新版的 Ubuntu。*

![intel-graphics-installer](http://ubuntuhandbook.org/wp-content/uploads/2015/11/intel-graphics-installer.jpg)

### 安装 ###

**1.** 从[这个链接页面][1]中下载该安装器。当前支持 Ubuntu 15.10 的版本是1.2.1版。你可以在**系统设置 -> 详细信息**中检查你的操作系统（32位或64位）的类型。

![download-intel-graphics-installer](http://ubuntuhandbook.org/wp-content/uploads/2015/11/download-intel-graphics-installer.jpg)

**2.** 一旦下载完成，到下载目录中点击 .deb 安装包，用 Ubuntu 软件中心打开它，然最后点击“安装”按钮。

![install-via-software-center](http://ubuntuhandbook.org/wp-content/uploads/2015/11/install-via-software-center.jpg)

**3.** 为了让系统信任 Intel Graphics 安装器，你需要通过下面的命令来为它添加密钥。

用快捷键`Ctrl+Alt+T`或者在 Unity Dash 中的“应用程序启动器”中打开终端。依次粘贴运行下面的命令。

    wget --no-check-certificate https://download.01.org/gfx/RPM-GPG-KEY-ilg -O - | sudo apt-key add -
    
    wget --no-check-certificate https://download.01.org/gfx/RPM-GPG-KEY-ilg-2 -O - | sudo apt-key add -

![trust-intel](http://ubuntuhandbook.org/wp-content/uploads/2015/11/trust-intel.jpg)

注意：在运行第一个命令的过程中，如果密钥下载完成后，光标停住不动并且一直闪烁的话，就像上面图片显示的那样，输入你的密码（输入时不会看到什么有变化）然后回车就行了。

最后通过 Unity Dash 或应用程序启动器打开 Intel Graphics 安装器。

--------------------------------------------------------------------------------

via: http://ubuntuhandbook.org/index.php/2015/11/install-intel-graphics-installer-in-ubuntu-15-10/

作者：[Ji m][a]
译者：[XLCYun](https://github.com/XLCYun)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ubuntuhandbook.org/index.php/about/
[1]:https://01.org/linuxgraphics/downloads
