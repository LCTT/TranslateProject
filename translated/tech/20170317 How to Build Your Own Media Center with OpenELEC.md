# 如何通过OpenELEC创建你自己的媒体中心

![](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/03/openelec-media-center.jpg "How to Build Your Own Media Center with OpenELECs") 

你是否曾经想要创建你自己的家庭影院系统？如果是的话，这里有一个为你准备的指南！在本篇文章中，我们将会介绍如何设置一个由OpenELEC以及Kodi驱动的家庭娱乐系统。我们将会介绍如何合适的安装，哪些设备可以运行软件，如何安装它，以及其他一切需要知道的事情。

### 选择一个设备

在开始设定媒体中心的软件前，你需要选择一个设备。OpenELEC支持一系列设备。从一般的桌面设备到树莓派2/3等等。选择好设备以后，考虑一下你怎么访问OpenELEC系统中的媒体，以及准备好使用

**注意: **OpenELEC基于Okdi，有许多方式加载一个可以运行的媒体（像是Samba网络分享，额外的设备，等等）。

### 制作安装磁盘

OpenELEC安装磁盘需要一个USB存储器，且其至少1GB的容量。这是安装软件的唯一方式，因为开发者没有发布ISO文件。取而代之的是一个需要被创建的IMG原始文件。选择与你设备相关的链接并且[下载][10]原始的磁盘镜像。当磁盘镜像下载完毕，打开一个终端，并且使用命令将数据从压缩包中解压出来。

**在Linux/macOS上**

```
cd ~/Downloads
gunzip -d OpenELEC*.img.gz
```

**在Windows上**

下载[7zip][11],安装它，然后解压压缩文件。

当原始的 .IMG 文件被解压后，下载[Etcher USB creation tool][12]，并且依据在界面上的指南来安装它，以及创建USB磁盘。

**注意:** 对于树莓派用户, Etcher也支持将文件写入到SD卡中。

### 安装OpenElEC

OpenELEC安装进程可能是安装流程中最简单的操作系统之一了。将USB设备加入，然后配置设备使其以USB方式启动作为开始。同样，这个过程也可以通过按DEL或者F2来替代。然而并不是所有的BIOS都是一样的， 所以最好的方式就是看看手册什么的。

 ![openelec-installer-selection](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/03/openelec-installer-selection.png "openelec-installer-selection") 

一旦进入BIOS，修改设置使其从USB磁盘中直接加载。这将会允许电脑从USB磁盘中启动，这将会使你从Syslinux boot屏幕中启动。在提示中，进入”installer“，然后按下Enter按键。

 ![openelec-installation-selection-menu](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/03/openelec-installation-selection-menu.png "openelec-installation-selection-menu") 

通常，快速安装选项是被选中的。按Enter来开始安装。这将会使安装器跳转到磁盘选择界面。选择硬盘——那个OpenELEC应该被安装的地方，然后按下Enter按键来开始安装过程。

 ![openelec-installation-in-progress](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/03/openelec-installation-in-progress.png "openelec-installation-in-progress") 

一旦完成安装，重启系统，并且加载OpenELEC。

### 配置 OpenELEC

 ![openelec-wireless-network-setup](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/03/openelec-wireless-network-setup.jpg "openelec-wireless-network-setup") 

在第一次启动时，用户必须配置一些东西。如果你的媒体中心拥有一个无线网卡，OpenELEC将会提示用户将其连接到一个热点上。选择一个列表中的网络并且输入密码。

 ![openelec-sharing-setup](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/03/openelec-sharing-setup.jpg "openelec-sharing-setup") 

在下一步”欢迎来到OpenELEC“屏上，用户必须配置不同的分享设置（SSH以及Samba）。它将会建议你把这些设置开启，因为拥有命令行权限，这将会使得远程传输媒体文件变得很简单。

## 增加媒体

在OpenELEC（Kodi）中增加媒体，首先选择你希望添加的媒体的部分。为照片音乐等添加媒体，是同一个过程。在这个指南中，我们将着重讲解添加视频。

 ![openelec-add-files-to-kodi](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/03/openelec-add-files-to-kodi.jpg "openelec-add-files-to-kodi") 

点击在主页的”视频“选项来进入视频页面。选择”文件“选项，在下一个页面点击“添加视频..."，这将会使得用户进入Kodi的添加媒体页面。在这个页面，你可以随意的添加媒体源了（包括内部和外部的）。

 ![openelec-add-media-source-kodi](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/03/openelec-add-media-source-kodi.jpg "openelec-add-media-source-kodi") 

OpenELEC自动挂载外部的设备（像是USB，DVD信息碟片，等等），并且他可以被添加到浏览文件挂载点。一般情况下，这些设备都会被放在”/run“下，或者，返回你点击”添加视频..."的页面，在那里选择设备。任何外部设备，包括 DVD/CD，将会直接展示那些可以展示的部分。这是一个很好的选择——对于那些不懂如何找到挂载点的用户。

 ![openelec-name-video-source-folder](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/03/openelec-name-video-source-folder.jpg "openelec-name-video-source-folder") 

现在这个设备在Kodi中被选中了，界面将会询问用户去浏览设备上私人文件夹，里面有私人文件——这一切都是在媒体中心文件浏览器工具下执行的。一旦有文件的文件夹被找到阿勒，添加它，给予文件夹一个名字，然后按下OK按钮来保存它。

 ![openelec-show-added-media-kodi](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/03/openelec-show-added-media-kodi.jpg "openelec-show-added-media-kodi") 

当一个用户浏览“视频”，他们将会看到可以点击的文件夹，这个文件夹中带有从外部设备添加的媒体。这些文件夹可以在系统上很简单的播放。

### 使用 OpenELec

当用户登录他们将会看见一个“主界面”，这个主界面有许多部分，用户可以点击他们并且进入，包括：图片，视频，音乐，程序等等。当悬停在这些部分的时候，子部分就会出现。例如，当悬停在“图片”上时，子部分”文件“以及”插件”就会出现。

 ![openelec-navigation-bar](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/03/openelec-navigation-bar.jpg "openelec-navigation-bar") 

Additionally, clicking the files subsection of any section (e.g. Videos) takes the user directly to any available files in that section.
如果一个用户点击了一个部分中的子部分，例如“插件”，Kodi 插件选择就会出现。这个安装器将会允许用户浏览新的插件内容，来安装到这个子部分（像是图片关联插件，等等）或者启动一个已经存在的图片关联插件，当然，这个插件应该已经安装到系统上了。

此外，点击任何部分的文件子部分（例如 视频）将会直接带领用户到任何可用的文件的那个部分。

### 系统设置

 ![openelec-system-settings](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/03/openelec-system-settings.jpg "openelec-system-settings") 

Kodi有许多扩展设置区域。为了获得这些设置，使鼠标在右方悬停，目录选择器将会滚动右方并且显示”系统“。点他来打开全局系统设定区。

任何设置都可以被用户修改，安装插件从Kodi仓库到激活额外的服务，到改变他们，甚至天气。如果想要退出设定区域并且返回主页面，点击右下方角落中的”home“图标。

### 结论

通过OpenELEC的安装和配置，你现在可以随意离开或者使用你自己的Linux支持的家庭影院系统。在所有的家庭影院系统Linux发行版中，这个是最用户有好的。请记住，尽管这个系统是以”OpenELEC“来被熟知的，它运行着Kodi以及它适应任何Kodi的插件，工具以及程序。

------

via: https://www.maketecheasier.com/build-media-center-with-openelec/

作者：[Derrik Diener][a]
译者：[svtter](https://github.com/svtter)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.maketecheasier.com/author/derrikdiener/
[1]: https://www.maketecheasier.com/author/derrikdiener/
[2]: https://www.maketecheasier.com/build-media-center-with-openelec/#comments
[3]: https://www.maketecheasier.com/category/linux-tips/
[4]: http://www.facebook.com/sharer.php?u=https%3A%2F%2Fwww.maketecheasier.com%2Fbuild-media-center-with-openelec%2F
[5]: http://twitter.com/share?url=https%3A%2F%2Fwww.maketecheasier.com%2Fbuild-media-center-with-openelec%2F&amp;text=How+to+Build+Your+Own+Media+Center+with+OpenELEC
[6]: mailto:?subject=How%20to%20Build%20Your%20Own%20Media%20Center%20with%20OpenELEC&amp;body=https%3A%2F%2Fwww.maketecheasier.com%2Fbuild-media-center-with-openelec%2F
[7]: https://www.maketecheasier.com/permanently-disable-windows-defender-windows-10/
[8]: https://www.maketecheasier.com/repair-mac-hard-disk-with-fsck/
[9]: https://support.google.com/adsense/troubleshooter/1631343
[10]: http://openelec.tv/get-openelec/category/1-openelec-stable-releases
[11]: http://www.7-zip.org/
[12]: https://etcher.io/
