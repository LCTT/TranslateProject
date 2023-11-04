[#]: subject: "How to Install the Latest LibreOffice on Ubuntu"
[#]: via: "https://itsfoss.com/install-libreoffice-ubuntu/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16349-1.html"

如何在 Ubuntu 上安装最新的 LibreOffice
======

![][0]

> 想在 Ubuntu 上使用最新、最好的 LibreOffice？这里有一个简单的方法。

LibreOffice 已预装在 Ubuntu 中。

不过，如果你选择了最小化的 Ubuntu 安装，或者卸载它并安装了其他办公套件，你可以使用此命令轻松安装：

````
sudo apt install libreoffice
````

这没问题。但 Ubuntu 仓库提供的 LibreOffice 版本可能不是最新的。

如果你听说有新的 LibreOffice 版本发布，很可能你不会获得该新版本。这是因为 Ubuntu 将其保持在稳定版本上。

这对大多数用户来说都很好。但是，如果你不是“大多数用户”，并且你想在 Ubuntu 中获取最新的 LibreOffice，那么你完全可以这样做。

有两种方法可以做到这一点：

   * 使用官方 PPA（推荐）
   * 从 LibreOffice 下载 deb 文件

让我们来看看。

### 方法 1：通过官方 PPA 安装最新的 LibreOffice（推荐）

你可以使用官方 “LibreOffice Fresh” PPA 在基于 Ubuntu 的发行版上安装 LibreOffice 的最新稳定版本。

PPA 提供了 LibreOffice 的最新稳定版本，而不是开发版本。因此，这使其成为在 Ubuntu 上获取较新 LibreOffice 版本的理想选择。

你甚至不需要使用此方法卸载以前的版本。它将把现有的 LibreOffice 更新到新版本。

````
sudo add-apt-repository ppa:libreoffice/ppa
sudo apt update
sudo apt install libreoffice
````

由于你要添加 PPA，因此你还将获得以这种方式安装的新版本的更新。

### 方法 2：从网站获取二进制文件（如果需要）

你可以随时前往 [LibreOfiice 网站的下载页面][1] 下载最新版本的 deb 文件。你还会看到下载较旧但 LTS 稳定版本的选项。

![][2]

我相信你已经 [知道如何从 deb 文件安装应用][3]。右键单击 deb 文件，选择使用软件中心打开它。进入软件中心后，你可以单击安装按钮进行安装。

### 结论

第二种方法的缺点是，如果有更新，你必须再次下载 deb 文件，删除以前的 LibreOffice 版本，然后使用新下载的 deb 文件安装新版本。

相比之下，PPA 会随着系统更新而自动更新。这就是我推荐 PPA 的原因，特别是当它由 LibreOffice 团队自己维护时。

顺便说一句，这里有一些 [充分利用 LibreOffice 的技巧][4]：

> **[提高 LibreOffice 生产力的技巧][4]**

我希望这个快速技巧可以帮助你在基于 Ubuntu 的发行版上获取最新的 LibreOffice。如果你有疑问，请告诉我。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-libreoffice-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.libreoffice.org/download/download-libreoffice
[2]: https://itsfoss.com/content/images/2023/10/download-libreoffice.png
[3]: https://itsfoss.com/install-deb-files-ubuntu/
[4]: https://linux.cn/article-15530-1.html
[5]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[0]: https://img.linux.net.cn/data/attachment/album/202311/04/170549qzsfnygzhtzsn0uo.jpg