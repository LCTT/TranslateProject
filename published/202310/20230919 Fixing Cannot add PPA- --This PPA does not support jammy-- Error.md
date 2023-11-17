[#]: subject: "Fixing Cannot add PPA: ''This PPA does not support jammy'' Error"
[#]: via: "https://itsfoss.com/cannot-add-ppa-error/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16246-1.html"

修复无法添加 PPA：“This PPA does not support jammy” 错误
======

![][0]

> 尝试添加一个 PPA，却在 Ubuntu 中收到 “无法添加 PPA： 此 PPA 不支持 xyz” 的错误？下面是解决这一错误的方法。

这是一个场景。你正在尝试使用 PPA 在 Ubuntu 中安装软件。

你使用 `sudo add-apt-repository` 添加 PPA 仓库，当它更新包缓存时，会出现错误：

> Cannot add PPA: "This PPA does not support *xyz*

其中 “xyz” 是 [你正在使用的 Ubuntu 版本的代号][1]。

📋 这就是发生这种情况的原因以及你可以采取的措施：

- PPA 不适用于你正在使用的 Ubuntu 版本
- 你应该寻找其他来源来安装该应用
- 如果绝望了，你可以从 PPA 网页下载 .deb 文件

我将详细讨论以上所有内容。

### 检查 PPA 是否适用于你的 Ubuntu 版本

首先，在终端中使用以下命令获取 Ubuntu 版本和代号的详细信息：

````
lsb_release -a
````

输出将包含详细信息：

![Here, I am using Ubuntu version 23.04 that case codename lunar][2]

现在，访问托管所有 PPA 的 Ubuntu 的 Launchpad 网站：

> **[进入 Launchpad PPA][3]**

在这里，查找困扰你的 PPA。为此，你必须使用 PPA 维护者的名字。

例如，如果 `ppa:jstaf/onedriver` 造成问题，请搜索维护者 `jstaf`。

![Enter the PPA's maintainer name and search for it][4]

一名维护者可能拥有多个软件仓库。单击你要安装的那个。

在里，你应该在 “<ruby>发布于<rt>Published in</rt></ruby>” 旁边的下拉按钮选择 “<ruby>所有系列<rt>Any Series</rt></ruby>”。

![Click on Any series dropdown button to see the supported Ubuntu versions][5]

检查你是否看到你正在使用的 Ubuntu 版本的代号。如果不存在，那么此 PPA 不适用于你的 Ubuntu 版本。

### 如果 PPA 不支持你的 Ubuntu 版本，你该怎么办

你会看到，开发人员（或维护人员）创建一个仓库并使该软件可用于他们正在使用的 Ubuntu 版本。

随着时间的推移，Ubuntu 发布了更新的版本。现在，一位活跃的维护者将发布新 Ubuntu 版本的软件。但情况并非总是如此。如果维护者不再活跃，那么将不会更新。像你这样尝试遵循教程说明的人将会看到此错误。

现在，你有两个选择：

#### 选项 1：在其他地方寻找该软件

这里有几种可能性。

**新版 Ubuntu 可能也可以通过其他 PPA 获得相同的软件。请在 Launchpad 网站或互联网上查找。**

这是怎么发生的？许多原始软件开发人员只是发布源代码，因此一些志愿者创建 Debian 软件包并从 Launchpad 分发它，以便像你这样的 Ubuntu 用户可以轻松安装该软件。不止一名志愿者可以为同一软件创建自己的个人包存档（PPA）。你应该使用活跃的一个。

例如，如果我查找 `onedriver` 包，我可以看到它可能在另一个名为 [Ubuntu deployment][6] 的 PPA 中可用。

![][7]

**另一个方式是查看该包是否以其他格式提供，例如 Snap、Flatpak、AppImage。**

   * [检查 Snap 商店][8]
   * [检查 Flatpak 包][9]
   * [检查 AppImages][10]

在极少数情况下，该软件可能已经在 Ubuntu 仓库中可用。

为此，你必须是一个聪明的用户并在互联网上进行搜索。如果你找到其他包格式，那就太好了。否则，下一步就是绝望。

#### 选项 2：从 PPA 下载 deb 文件

PPA 仓库为你提供 Debian 软件包。添加仓库后，你还可以直接通过系统更新获得更新（如果有）。

如果你的 Ubuntu 版本的 PPA 没有更新，并且你在其他地方找不到该软件，你可以尝试从 PPA Launchpad 页面下载 deb 软件包。

![][11]

在包详细信息页面上，单击展开符号并查找 deb 文件。除非你使用类似树莓派的主板，否则你应该选择 amd64。

![Download deb package from PPA][12]

> 🚧 如果软件太旧，下载的 deb 包可能会因为依赖问题而无法安装成功。此外，你将不会获得已安装软件包的更新（如果已安装）。不过，这个方法还是值得一试。

### 结论

尽管 Canonical 在大力推动 Snap 打包，PPA 仍然是用户在 Ubuntu 中安装第三方应用的最爱。

但 PPA 也有其自身的麻烦，而不能添加 PPA 错误就是其中之一。同样的问题还会导致 “[仓库没有发布文件][13]” 错误。

我希望现在这个问题更加清楚了。如果你仍有疑问，请告诉我。

*（题图：MJ/d1013502-d518-4bc8-896c-d8dddd15ae22）*

--------------------------------------------------------------------------------

via: https://itsfoss.com/cannot-add-ppa-error/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/how-to-know-ubuntu-unity-version/
[2]: https://itsfoss.com/content/images/2023/09/ubuntu-version-details.png
[3]: https://launchpad.net/ubuntu/+ppas
[4]: https://itsfoss.com/content/images/2023/09/search-for-ppa-launchpad.png
[5]: https://itsfoss.com/content/images/2023/09/check-ppa-supported-version.png
[6]: https://launchpad.net/~remiariro/+archive/ubuntu/misc
[7]: https://itsfoss.com/content/images/2023/09/search-ppa.png
[8]: https://snapcraft.io/store
[9]: https://flathub.org/
[10]: https://www.appimagehub.com/
[11]: https://itsfoss.com/content/images/2023/09/ppa-package-details.png
[12]: https://itsfoss.com/content/images/2023/09/download-deb-from-ppa.png
[13]: https://itsfoss.com/repository-does-not-have-release-file-error-ubuntu/
[0]: https://img.linux.net.cn/data/attachment/album/202310/02/112157nf11fpwhwa4u1hvf.jpg