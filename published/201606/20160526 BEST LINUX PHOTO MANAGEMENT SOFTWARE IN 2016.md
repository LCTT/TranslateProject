2016 年最佳 Linux 图像管理软件
=============================================

![](http://itsfoss.com/wp-content/uploads/2016/05/Best-Linux-Photo-Management-Software.jpg)

通常谈及 Linux 上的应用程序时，我们有很多选择，但有时候选择的余地却很小。

有一些读者要我们做一个合宜的**图像管理软件**列表，来代替 Linux 上已被弃用的 Picasa 应用。

其实 Linux 平台上还是有很多很好的图像管理软件的，你可以根据你图片库的大小选择合适的应用。

这个列表和我们先前的 [最佳图像程序应用][1] 有些差别，上次我们介绍了图像编辑软件，绘图软件等，而这次的介绍主要集中在图像管理软件上。

好，下面我们开始介绍。我会详细说明在 Ubuntu 及其衍生版下的安装命令，我们只需要打开终端运行这些命令。

### [gThumb](https://wiki.gnome.org/Apps/gthumb)

![](http://itsfoss.com/wp-content/uploads/2016/05/gThumb-1-1024x540.jpg)

*gThumb 图像编辑器*

gThumb 是在 GNOME 桌面环境下的一个轻量级的图像管理应用，它涵盖了基本图像管理功能，比如编辑图片以及更加高级的操作等，gThumb 主要功能如下：

- 图片查看：支持所有主流的图片格式（包括 gif）和元数据（EXIF、 XMP 等）。
- 图片浏览：所有基础的浏览操作（缩略图、移动、复制、删除等）以及书签支持。
- 图片管理：使用标签、目录和库来组织图片。从数码相机导入图片，集成了网络相册（Picasa，Flickr，Facebook等）。
- 图片编辑：基本图像编辑操作、滤镜、格式转换等。

更多功能请参考官方 [gThumb 功能][2] 列表。如果你使用的是 GNOME 或者基于 GNOME 的桌面环境（如 MATE），那么你一定要试用一下。

#### gThumb 安装

```
sudo apt-get install gthumb
```


### [digiKam][3]

![](http://itsfoss.com/wp-content/uploads/2016/05/digiKam-1-1024x540.png)

*digiKam*

digiKam 主要为 KDE 而设计，在其他桌面环境下也可以使用。它有很多很好的图像界面功能，主要功能如下所示：

- 图片管理：相册、子相册、标签、评论、元数据、排序支持。
- 图片导入：支持从数码相机、USB设备、网络相册（包括 Picasa 和 Facebook）导入，以及另外一些功能。
- 图片输出：支持输出至很多网络在线平台，以及格式转换。
- 图片编辑：支持很多图像编辑的操作。

毫无疑问，digiKam 如果不是最好的图像管理软件，也是之一。

#### digiKam 安装

```
sudo apt-get install digikam
```

### [Shotwell][4]

![](http://itsfoss.com/wp-content/uploads/2016/05/Shotwell-1-1024x540.png)

*Shotwell*

Shotwell 图像管理也是为 GNOME 桌面环境设计，虽然功能不及 gThumb 多，但满足了基本需求。主要功能如下：

- 从磁盘或数码相机导入图片。
- 事件、标签和基于文件夹的图片管理方式。
- 基本图片编辑功能和格式转换。
- 支持上传至网络平台（Facebook，Flickr，Tumblr 等）。

如果你想要一款功能相对简单的应用，你可以尝试一下这个。

#### Shotwell 安装

```
sudo apt-get install shotwell
```

### [KPhotoAlbum][5]

![](http://itsfoss.com/wp-content/uploads/2016/05/KPhotoAlbum-1-1024x540.png)

*KPhotoAlbum*

KPhotoAlbum 是一款在 KDE 桌面环境下的图像管理应用。它有一些独特的功能：分类和基于时间浏览。你可以基于人物、地点、时间分类；另外在用户图形界面底部会显示时间栏。

KPhotoAlbum 有很多图像管理和编辑功能，主要功能包括：

- 高级图片操作（分类、子分类、标签、元数据、注释等等）。
- 图片导入导出功能（包括主流图片分享平台）。
- 众多编辑功能（包括批量处理）。

这些高级的功能有一些缺点，就是用户大多需要手工操作。但如果你是 KDE 爱好者，这是个好的选择。它完美适用 KDE，但是你也可以在非 KDE 桌面环境下使用 KPhotoAlbum。

#### KPhotoAlbum 安装

```
sudo apt-get install kphotoalbum
```

### [Darktable][7]

![](http://itsfoss.com/wp-content/uploads/2016/05/darktable-1-1024x540.png)

*Darktable*

Darktable 与其说是图像管理工具，不如说是图像编辑软件。Darktable 有良好的用户图形界面，对桌面环境没有特殊的要求，这也不会影响到它的图像编辑功能。它的基本功能如下：

- 基本图片管理。
- 众多高级的图片编辑功能。
- 支持导出至 Picasa 和 Flickr 和格式转换。

如果你喜欢照片编辑和润色，Darktable 是个好的选择。

> 推荐阅读：[怎样在 Ubuntu 下通过 PPA 安装 Darktable 2.0][8]

#### Darktable 安装

```
sudo add-apt-repository ppa:pmjdebruijn/darktable-release
sudo apt-get update
sudo apt-get install darktable
```

### 其它

如果你想要功能简单的应用，比如从便携设备（相机、手机、便携设备等）中导入照片并存入磁盘，毫无疑问该使用 [Rapid Photo Downloader][9]，它很适合从便携设备中导入和备份图片，而且安装配置过程简单。

在 Ubuntu 上安装 Rapid Photo Downloade，打开终端输入命令：

```
sudo apt-get install rapid-photo-downloader
```

如果你想尝试更多的选择：

- [GNOME Photos][10] (GNOME 桌面环境下的图像查看器)
- [Gwenview][11] (KDE 桌面环境下的图像查看器)
- [Picty][12] (开源图像管理器)

那么，你正在使用，或者打算使用其中一款应用吗？在 Ubuntu 或其它 Linux 上你有其它更好的推荐吗？你有最喜欢的 Linux 图像管理软件吗？分享你的观点给我们。

----------
via: http://itsfoss.com/linux-photo-management-software/

作者：[Munif Tanjim][a]
译者：[sarishinohara](https://github.com/sarishinohara)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://itsfoss.com/author/munif/
[1]: http://itsfoss.com/image-applications-ubuntu-linux/
[2]: https://wiki.gnome.org/Apps/gthumb/features
[3]: https://www.digikam.org/
[4]: https://wiki.gnome.org/Apps/Shotwell
[5]: https://www.kphotoalbum.org/
[6]: https://www.kde.org/
[7]: http://www.darktable.org/
[8]: http://itsfoss.com/darktable-20-released-installation-ppa/
[9]: http://www.damonlynch.net/rapid/index.html
[10]: https://wiki.gnome.org/Apps/Photos
[11]: https://userbase.kde.org/Gwenview
[12]: https://github.com/spillz/picty
