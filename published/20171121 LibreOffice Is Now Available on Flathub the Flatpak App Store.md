LibreOffice 上架 Flathub 应用商店
===============

![LibreOffice on Flathub](http://www.omgubuntu.co.uk/wp-content/uploads/2017/11/libroffice-on-flathub-750x250.jpeg)

> LibreOffice 现在可以从集中化的 Flatpak 应用商店 [Flathub][3] 进行安装。

它的到来使任何运行现代 Linux 发行版的人都能只点击一两次即可安装 LibreOffice 的最新稳定版本，而无需搜索 PPA，纠缠于 tar 包或等待发行版将其打包。

自去年 8 月份 [LibreOffice 5.2][6] 发布以来，[LibreOffice Flatpak][5] 已经可供用户下载和安装。

这里“新”的是指发行方法。<ruby>文档基金会<rt>Document Foundation</rt></ruby>选择使用 Flathub 而不是专门的服务器来发布更新。

这对于终端用户来说是一个_很好_的消息，因为这意味着不需要在新安装时担心仓库，但对于 Flatpak 的倡议者来说也是一个好消息：LibreOffice 是开源软件里最流行的生产力套件。它对该格式和应用商店的支持肯定会受到热烈的欢迎。

在撰写本文时，你可以从 Flathub 安装 LibreOffice 5.4.2。新的稳定版本将在发布时添加。

### 在 Ubuntu 上启用 Flathub

要在 Ubuntu 上启动并运行 Flatpak，首先必须安装它：

```
sudo apt install flatpak gnome-software-plugin-flatpak
```

为了能够从 Flathub 安装应用程序，你需要添加 Flathub 远程服务器：

```
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

这就行了。只需注销并重新登录（以便 Ubuntu Software 刷新其缓存），之后你应该能够通过 Ubuntu Software 看到 Flathub 上的任何 Flatpak 程序了。

![](http://www.omgubuntu.co.uk/wp-content/uploads/2017/11/flathub-750x495.png)

*Fedora、Arch 和 Linux Mint 18.3 用户已经安装了 Flatpak，随时可以开箱即用。Mint 甚至预启用了 Flathub remote。*

在本例中，搜索 “LibreOffice” 并在结果中找到下面有 Flathub 提示的结果。（请记住，Ubuntu 已经调整了客户端，来将 Snap 程序显示在最上面，所以你可能需要向下滚动列表来查看它）。

### 从 Flathub 安装 LibreOffice

- [从 Flathub 安装 LibreOffice][7]

从 flatpakref 中[安装 Flatpak 程序有一个 bug][8]，所以如果上面的方法不起作用，你也可以使用命令行从 Flathub 中安装 Flathub 程序。

Flathub 网站列出了安装每个程序所需的命令。切换到“命令行”选项卡来查看它们。

### Flathub 上更多的应用

如果你经常看这个网站，你就会知道我喜欢 Flathub。这是我最喜欢的一些应用（Corebird、Parlatype、GNOME MPV、Peek、Audacity、GIMP 等）的家园。我无需等待就能获得这些应用程序的最新、稳定版本（加上它们需要的所有依赖）。

而且，在我 twiiter 上发布一周左右后，大多数 Flatpak 应用现在看起来有很棒 GTK 主题 - 不再需要[临时方案][9]了！

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2017/11/libreoffice-now-available-flathub-flatpak-app-store

作者：[JOEY SNEDDON][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://plus.google.com/117485690627814051450/?rel=author
[1]:https://plus.google.com/117485690627814051450/?rel=author
[2]:http://www.omgubuntu.co.uk/category/news
[3]:http://www.flathub.org/
[4]:http://www.omgubuntu.co.uk/2017/11/libreoffice-now-available-flathub-flatpak-app-store
[5]:http://www.omgubuntu.co.uk/2016/08/libreoffice-5-2-released-whats-new
[6]:http://www.omgubuntu.co.uk/2016/08/libreoffice-5-2-released-whats-new
[7]:https://flathub.org/repo/appstream/org.libreoffice.LibreOffice.flatpakref
[8]:https://bugs.launchpad.net/ubuntu/+source/gnome-software/+bug/1716409
[9]:http://www.omgubuntu.co.uk/2017/05/flatpak-theme-issue-fix
