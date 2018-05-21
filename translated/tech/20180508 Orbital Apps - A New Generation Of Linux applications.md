Orbital Apps - 新一代 Linux 程序
======

![](https://www.ostechnix.com/wp-content/uploads/2016/05/orbital-apps-720x340.jpg)

今天，我们要了解 **Orbital Apps** 或 **ORB**（**O**pen **R**unnable **B**undle）**apps**（开放可运行程序包），一个免费、跨平台的开源程序集合。所有 ORB 程序都是可移动的。你可以将它们安装在你的 Linux 系统或 USB 驱动器上，以便你可以在任何系统上使用相同的程序。它们不需要 root 权限，并且没有依赖关系。所有必需的依赖关系都包含在程序中。只需将 ORB 程序复制到 USB 驱动器并将其插入到任何 Linux 系统中就立即开始使用它们。所有设置和配置以及程序的数据都将存储在 USB 驱动器上。由于不需要在本地驱动器上安装程序，我们可以在联机或脱机的计算机上运行应用程序。这意味着我们不需要 Internet 来下载任何依赖。

ORB apps are compressed up to 60% smaller, so we can store and use them even from the small sized USB drives. All ORB apps are signed with PGP/RSA and distributed via TLS 1.2. All Applications are packaged without any modifications, they are not even re-compiled. Here is the list of currently available portable ORB applications.
ORB 程序压缩了 60％，因此我们甚至可以从小型USB驱动器存储和使用它们。所有ORB应用程序都使用PGP / RSA进行签名，并通过TLS 1.2进行分发。所有应用程序打包时都不做任何修改，甚至不会重新编译。以下是当前可用的便携式ORB应用程序列表。

  * abiword
  * audacious
  * audacity
  * darktable
  * deluge
  * filezilla
  * firefox
  * gimp
  * gnome-mplayer
  * hexchat
  * inkscape
  * isomaster
  * kodi
  * libreoffice
  * qbittorrent
  * sound-juicer
  * thunderbird
  * tomahawk
  * uget
  * vlc
  * 未来还有更多。



Orb is open source, so If you’re a developer, feel free to collaborate and add more applications.
Orb 是开源的，所以如果你是开发人员，欢迎协作并添加更多程序。

### 下载并使用可移动 ORB 程序

正如我已经提到的，我们不需要安装可移动 ORB 程序。但是，ORB 团队强烈建议你使用 **ORB 启动器** 来获得更好的体验。 ORB 启动器是一个小的安装程序（小于 5MB），它可帮助你启动 ORB 程序，并获得更好，更流畅的体验。

让我们先安装 ORB 启动器。为此，[**下载 ORB 启动器**][1]。你可以手动下载 ORB 启动器的 ISO 并将其挂载到文件管理器上。或者在终端中运行以下任一命令来安装它：
```
$ wget -O - https://www.orbital-apps.com/orb.sh | bash

```

如果你没有 wget，请运行：
```
$ curl https://www.orbital-apps.com/orb.sh | bash

```

询问时输入 root 用户和密码。

就是这样。Orbit 启动器已安装并可以使用。

现在，进入 [**ORB 可移动程序下载页面**][2]，并下载你选择的程序。在本教程中，我会下载 Firefox。

下载完后，进入下载位置并双击 ORB 程序来启动它。点击 Yes 确认。

![][4]

Firefox ORB 程序能用了！

![][5]

同样，你可以立即下载并运行任何程序。

如果你不想使用 ORB 启动器，请将下载的 .orb 安装程序设置为可执行文件，然后双击它进行安装。不过，建议使用 ORB 启动器，它可让你在使用 ORB 程序时更轻松、更顺畅。

就我测试的 ORB 程序而言，它们打开即可使用。希望这篇文章有帮助。今天就是这些。祝你有美好的一天！

干杯！！


--------------------------------------------------------------------------------

via: https://www.ostechnix.com/orbitalapps-new-generation-ubuntu-linux-applications/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.orbital-apps.com/documentation/orb-launcher-all-installers
[2]:https://www.orbital-apps.com/download/portable_apps_linux/
[3]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[4]:http://www.ostechnix.com/wp-content/uploads/2016/05/orbital-apps-1-2.png
[5]:http://www.ostechnix.com/wp-content/uploads/2016/05/orbital-apps-2.png