Linux 最好的图片截取和视频截录工具
======
![](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/best-linux-screenshot-and-screencasting-tools_orig.jpg)

这里可能有一个困扰你多时的问题，当你想要获取一张屏幕截图向开发者反馈问题，或是在  _Stack Overflow_ 寻求帮助时，你可能缺乏一个可靠的屏幕截图工具去保存和发送集截图。GNOME 有一些形如程序和 shell 拓展的工具。不必担心，这里有 Linux 最好的屏幕截图工具，供你截取图片或截录视频。

## Linux 最好的图片截取和视频截录工具

### 1. Shutter

 [![shutter Linux 截图工具](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/shutter-linux-screenshot-taking-tools_orig.jpg)][2] 
 
[Shutter][3] 可以截取任意你想截取的屏幕，是 Linux 最好的截屏工具之一。得到截屏之后，它还可以在保存截屏之前预览图片。GNOME 面板顶部有一个 Shutter 拓展菜单，使得用户进入软件变得更人性化。

你可以选择性的截取窗口、桌面、光标下的面板、自由内容、菜单、提示框或网页。Shutter 允许用户直接上传屏幕截图到设置内首选的云服务器中。它同样允许用户在保存截图之前编辑器图片；同样提供可自由添加或移除的插件。

终端内键入下列命令安装此工具：

```
sudo add-apt-repository -y ppa:shutter/ppa
sudo apt-get update && sudo apt-get install shutter
```

### 2. Vokoscreen

 [![vokoscreen Linux 屏幕录制工具](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/vokoscreen-screencasting-tool-for-linux_orig.jpg)][4] 
 
 
[Vokoscreen][5] 是一款允许记录和叙述屏幕活动的一款软件。它有一个简洁的界面，界面的顶端包含有一个简明的菜单栏，方便用户开始录制视频。

你可以选择记录整个屏幕，或是记录一个窗口，抑或是记录一个自由区域，并且自定义保存类型；你甚至可以将屏幕录制记录保存为 gif 文件。当然，你也可以使用网络摄像头记录自己的情况，将自己转换成学习者。一旦你这么做了，你就可以在应用程序中回放视频记录。

 [![vokoscreen preferences](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/vokoscreen-preferences_orig.jpg)][6] 

你可以安装自己仓库的 Vocoscreen 发行版，或者你也可以在 [pkgs.org][7] 选择下载你需要的发行版。

```
sudo dpkg -i vokoscreen_2.5.0-1_amd64.deb
```

### 3. OBS

 [![obs Linux 视频截录](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/obs-linux-screencasting-tool_orig.jpg)][8]
 
[OBS][9] 可以用来录制自己的屏幕亦可用来录制互联网上的数据流。它允许你看到自己所录制的内容或者当你叙述时的屏幕录制。它允许你根据喜好选择录制视频的品质；它也允许你选择文件的保存类型。除了视频录制功能之外，你还可以切换到 Studio 模式，不借助其他软件编辑视频。要在你的 Linux 系统中安装 OBS，你必须确保你的电脑已安装 FFmpeg。ubuntu 14.04 或更早的版本安装 FFmpeg 可以使用如下命令：

```
sudo add-apt-repository ppa:kirillshkrogalev/ffmpeg-next

sudo apt-get update && sudo apt-get install ffmpeg
```

ubuntu 15.04 以及之后的版本，你可以在终端中键入如下命令安装 FFmpeg：

```
sudo apt-get install ffmpeg
```

​如果 GGmpeg 安装完成，在终端中键入如下安装 OBS：

```
sudo add-apt-repository ppa:obsproject/obs-studio

sudo apt-get update

sudo apt-get install obs-studio
```

### 4. Green Recorder

 [![屏幕录制工具](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/green-recording-linux-tool_orig.jpg)][10] 

[Green recorder][11] 是一款基于接口的简单程序，它可以让你记录屏幕。你可以选择包括视频和单纯的音频在内的录制内容，也可以显示鼠标指针，甚至可以跟随鼠标录制视频。同样，你可以选择记录窗口或是自由区域，以便于在自己的记录中保留需要的内容；你还可以自定义保存视频的帧数。如果你想要延迟录制，它提供给你一个选项可以设置出你想要的延迟时间。它还提供一个录制结束的命令运行选项，这样，就可以在视频录制结束后立即运行。​

在终端中键入如下命令来安装 green recorder：

```
sudo add-apt-repository ppa:fossproject/ppa

sudo apt update && sudo apt install green-recorder
```

### 5. Kazam

 [![kazam screencasting tool for linux](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/kazam-screencasting-tool-for-linux_orig.jpg)][12]

[Kazam][13] 在几乎所有使用截图工具的 Linux 用户中，都十分流行。这是一款简单直观的软件，它可以让你做一个屏幕截图或是视频录制也同样允许在屏幕截图或屏幕录制之前设置延时。它可以让你选择录制区域，窗口或是你想要抓取的整个屏幕。Kazam 的界面接口部署的非常好，和其他软件相比毫无复杂感。它的特点，就是让你优雅的截图。Kazam 在系统托盘和菜单中都有图标，无需打开应用本身，你就可以开始屏幕截图。​​

终端中键入如下命令来安装 Kazam：

```
sudo apt-get install kazam
```

​如果没有找到 PPA，你需要使用下面的命令安装它：

```
sudo add-apt-repository ppa:kazam-team/stable-series

sudo apt-get update && sudo apt-get install kazam
```

### 6. GNOME 拓展截屏工具

 [![gnome screenshot extension](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/gnome-screenshot-extension-compressed_orig.jpg)][1] 

GNOME 的一个拓展软件就叫做 screenshot tool，它常驻系统面板，如果你没有设置禁用它。由于它是常驻系统面板的软件，所以它会一直等待你的调用，获取截图，方便和容易获取是它最主要的特点，除非你在系统工具禁用，否则它将一直在你的系统面板中。这个工具也有用来设置首选项的选项窗口。在 extensions.gnome.org 中搜索“_Screenshot Tool_”，在你的 GNOME 中安装它。 

你需要安装 gnome 拓展，chrome 拓展和 GNOME 调整工具才能使用这个工具。

 [![gnome screenshot 拓展选项](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/gnome-screenshot-extension-preferences_orig.jpg)][14] 

当你碰到一个问题，不知道怎么处理，想要在 [the Linux community][15] 或者其他开发社区分享、寻求帮助的的时候， **Linux 截图工具** 尤其合适。学习开发、程序或者其他任何事物都会发现这些工具在分享截图的时候真的很实用。Youtube 用户和教程制作爱好者会发现视频截录工具真的很适合录制可以发表的教程。 

--------------------------------------------------------------------------------

via: http://www.linuxandubuntu.com/home/best-linux-screenshot-screencasting-tools

作者：[linuxandubuntu][a]
译者：[CYLeft](https://github.com/CYLeft)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxandubuntu.com
[1]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/gnome-screenshot-extension-compressed_orig.jpg
[2]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/shutter-linux-screenshot-taking-tools_orig.jpg
[3]:http://shutter-project.org/
[4]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/vokoscreen-screencasting-tool-for-linux_orig.jpg
[5]:https://github.com/vkohaupt/vokoscreen
[6]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/vokoscreen-preferences_orig.jpg
[7]:https://pkgs.org/download/vokoscreen
[8]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/obs-linux-screencasting-tool_orig.jpg
[9]:https://obsproject.com/
[10]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/green-recording-linux-tool_orig.jpg
[11]:https://github.com/foss-project/green-recorder
[12]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/kazam-screencasting-tool-for-linux_orig.jpg
[13]:https://launchpad.net/kazam
[14]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/gnome-screenshot-extension-preferences_orig.jpg
[15]:http://www.linuxandubuntu.com/home/top-10-communities-to-help-you-learn-linux
