FreeFileSync：在 Ubuntu 中对比及同步文件
============================================================

FreeFileSync 是一个自由、开源以及跨平台的文件夹对比及同步软件，它可以帮助你[同步 Linux、Windows 和 Mac OS 中的文件和文件夹][2]。

它是便携的，也可以被安装在本地系统中，它的功能丰富，旨在节省设置和执行备份操作的时间，同时具有有吸引力的图形界面。

#### FreeFileSync 功能

下面是它的主要功能：

1.  它可以同步网络共享和本地磁盘。
2.  它可以同步 MTP 设备（Android、iPhone、平板电脑、数码相机）。
3.  它也可以通过 [SFTP（SSH 文件传输协议）][1]进行同步。
4.  它可以识别被移动和被重命名的文件和文件夹。
5.  使用目录树显示磁盘空间使用情况。
6.  支持复制锁定文件（卷影复制服务）。
7.  识别冲突并同步删除（propagate deletions）。
8.  支持按内容比较文件。
9.  它可以配置为处理符号链接。
10.  支持批量自动同步。
11.  支持多个文件夹比较。
12.  支持深入详细的错误报告。
13.  支持复制 NTFS 扩展属性，如（压缩、加密、稀疏）。
14.  还支持复制 NTFS 安全权限和 NTFS 备用数据流。
15.  支持超过 260 个字符的长文件路径。
16.  支持免故障的文件复制防止数据损坏。
17.  允许扩展环境变量，例如 `％UserProfile％`。
18.  支持通过卷名访问可变驱动器盘符（U盘）。
19.  支持管理已删除/更新文件的版本。
20.  通过最佳同步序列防止光盘空间问题。
21.  完全支持 Unicode。
22.  提供高度优化的运行时性能。
23.  支持过滤器包含和排除文件等。

### 如何在 Ubuntu 中安装 FreeFileSync

我们会添加官方的 FreeFileSync PPA，这只在 Ubuntu 14.04 和 Ubuntu 15.10 上有，那么像这样更新系统仓库列表并安装它：

```
-------------- 在 Ubuntu 14.04 和 15.10 上 -------------- 
$ sudo apt-add-repository ppa:freefilesync/ffs
$ sudo apt-get update
$ sudo apt-get install freefilesync
```

对于 Ubuntu 16.04 或者更新的版本，进入 [FreeFileSync 的下载页][3]为你的 Ubuntu 和 Debian 获取合适的包。

接下来，进入下载文件夹，如下解压 FreeFileSync_*.tar.gz 到 `/opt` 目录中：

```
$ cd Downloads/
$ sudo tar xvf FreeFileSync_*.tar.gz -C /opt/
$ cd /opt/
$ ls
$ sudo unzip FreeFileSync/Resources.zip -d /opt/FreeFileSync/Resources/
```

下载我们会使用 Gnome 面板创建一个程序启动器（`.desktop` 文件）。要浏览系统中 `.desktop` 文件的例子，列出 `/usr/share/applications` 目录的内容：

```
$ ls /usr/share/applications
```

为防你没有安装 Gnome 面板，输入下面的命令来安装：

```
$ sudo apt-get install --no-install-recommends gnome-panel
```

接下来，运行下面的命令来创建程序启动器：

```
$ sudo gnome-desktop-item-edit /usr/share/applications/ --create-new
```

并定义下面的值：

```
Type: 	   Application 
Name: 	   FreeFileSync
Command:   /opt/FreeFileSync/FreeFileSync		
Comment:   Folder Comparison and Synchronization
```

要为启动器添加一个图标，只需要点击图标选择：`/opt/FreeFileSync/Resources/FreeFileSync.png`。

当你设置完成之后，点击 OK 创建。

[
 ![Create Desktop Launcher](http://www.tecmint.com/wp-content/uploads/2017/03/Create-Desktop-Launcher.png) 
][4]

*创建桌面启动器*

如果你不想要创建桌面启动器，你可以从目录中启动 FreeFileSync。

```
$ ./FreeFileSync
```

### 如何在 Ubuntu 中使用 FreeFileSync

在 Ubuntu 中，在 Unity Dash 中搜索 FreeFileSync，然而在 Linux Mint 中，在 System Menu 中搜索，并点击 FreeFileSync 图标打开。

[
 ![FreeFileSync ](http://www.tecmint.com/wp-content/uploads/2017/03/FreeFileSync-launched.png) 
][5]

*FreeFileSync*

#### 使用 FreeFileSync 比较两个文件夹

在下面的例子中，我们使用：

```
Source Folder:	/home/aaronkilik/bin
Destination Folder:	/media/aaronkilik/J_CPRA_X86F/scripts
```

要比较文件时间以及两个文件夹的大小（默认设置），只要点击比较按钮。

[
 ![Compare Two Folders in Linux](http://www.tecmint.com/wp-content/uploads/2017/03/compare-two-folders.png) 
][6]

*在 Linux 中比较两个文件夹*

通过下面的界面，可以在两个文件夹中按 `F6` 来更改要比较的内容：文件时间和大小、内容或文件大小。请注意，你选择的每个选项的含义也包括在内。

[
 ![File Comparison Settings](http://www.tecmint.com/wp-content/uploads/2017/03/comparison-settings.png) 
][7]

*文件比较设置*

#### 使用 FreeFileSync 同步两个文件夹

你可以开始比较两个文件夹，接着点击 Synchronize 按钮启动同步进程。在之后出现的对话框中点击 Start：

```
Source Folder: /home/aaronkilik/Desktop/tecmint-files
Destination Folder: /media/aaronkilik/Data/Tecmint
```
[
 ![Compare and Synchronize Two Folders](http://www.tecmint.com/wp-content/uploads/2017/03/compare-and-sychronize-two-folders.png) 
][8]

*比较以及同步两个文件夹*

[
 ![Start File Synchronization](http://www.tecmint.com/wp-content/uploads/2017/03/start-sychronization.png) 
][9]

*开始文件同步*

[
 ![File Synchronization Completed](http://www.tecmint.com/wp-content/uploads/2017/03/synchronization-complete.png) 
][10]

*文件同步完成*

在下面的界面中按下 `F8` 设置默认同步选项：two way、mirror、update 或 custom。每个选项的意义不言自明。

[
 ![File Synchronization Settings](http://www.tecmint.com/wp-content/uploads/2017/03/synchronization-setttings.png) 
][11]

*文件同步设置*

要了解更多信息，访问 FreeFileSync 主页：[http://www.freefilesync.org/][12]

就是这样了！在本篇中，我们向你展示了如何在 Ubuntu 以及它的衍生版 Linux Mint、Kubuntu 等等中安装 FreeFileSync。在下面的评论栏中分享你的想法。

--------------------------------------------------------------------------------

作者简介：

Ravi Saive，TecMint 的原创作者。一个喜爱在互联网上分享技巧和提示的计算机 geek 和 Linux 老手。我的大多数服务运行在 Linux 开源平台上。请在 Twitter、Facebook、Google+ 上关注我。

--------------------------------------------------------------------------------


via: http://www.tecmint.com/freefilesync-compare-synchronize-files-in-ubuntu/

作者：[Ravi Saive][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/admin/
[00]:https://twitter.com/ravisaive
[01]:https://www.facebook.com/ravi.saive
[02]:https://plus.google.com/u/0/+RaviSaive

[1]:http://www.tecmint.com/sftp-command-examples/
[2]:http://www.tecmint.com/rsync-local-remote-file-synchronization-commands/
[3]:http://www.freefilesync.org/download.php
[4]:http://www.tecmint.com/wp-content/uploads/2017/03/Create-Desktop-Launcher.png
[5]:http://www.tecmint.com/wp-content/uploads/2017/03/FreeFileSync-launched.png
[6]:http://www.tecmint.com/wp-content/uploads/2017/03/compare-two-folders.png
[7]:http://www.tecmint.com/wp-content/uploads/2017/03/comparison-settings.png
[8]:http://www.tecmint.com/wp-content/uploads/2017/03/compare-and-sychronize-two-folders.png
[9]:http://www.tecmint.com/wp-content/uploads/2017/03/start-sychronization.png
[10]:http://www.tecmint.com/wp-content/uploads/2017/03/synchronization-complete.png
[11]:http://www.tecmint.com/wp-content/uploads/2017/03/synchronization-setttings.png
[12]:http://www.freefilesync.org/
[13]:http://www.tecmint.com/author/admin/
[14]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[15]:http://www.tecmint.com/free-linux-shell-scripting-books/
