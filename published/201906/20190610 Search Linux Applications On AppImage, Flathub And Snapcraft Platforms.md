[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10994-1.html)
[#]: subject: (Search Linux Applications On AppImage, Flathub And Snapcraft Platforms)
[#]: via: (https://www.ostechnix.com/search-linux-applications-on-appimage-flathub-and-snapcraft-platforms/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

在 AppImage、Flathub 和 Snapcraft 平台上搜索 Linux 应用
======

![Search Linux Applications On AppImage, Flathub And Snapcraft][1]

Linux 一直在发展。过去，开发人员必须分别为不同的 Linux 发行版构建应用。由于存在多种 Linux 变体，因此为所有发行版构建应用变得很繁琐，而且非常耗时。后来一些开发人员发明了包转换器和构建器，如 [Checkinstall][2]、[Debtap][3] 和 [Fpm][4]。但他们也没有完全解决问题。所有这些工具都只是将一种包格式转换为另一种包格式。我们仍然需要找到应用并安装运行所需的依赖项。

好吧，时代已经变了。我们现在有了通用的 Linux 应用。这意味着我们可以在大多数 Linux 发行版上安装这些应用。无论是 Arch Linux、Debian、CentOS、Redhat、Ubuntu 还是任何流行的 Linux 发行版，通用应用都可以正常使用。这些应用与所有必需的库和依赖项打包在一个包中。我们所要做的就是在我们使用的任何 Linux 发行版上下载并运行它们。流行的通用应用格式有 AppImage、[Flatpak][5] 和 [Snap][6]。

AppImage 由 Simon peter 创建和维护。许多流行的应用，如 Gimp、Firefox、Krita 等等，都有这些格式，并可直接在下载页面下载。只需下载它们，使其可执行并立即运行它。你甚至无需 root 权限来运行 AppImage。

Flatpak 的开发人员是 Alexander Larsson（RedHat 员工）。Flatpak 应用托管在名为 “Flathub” 的中央仓库（商店）中。如果你是开发人员，建议你使用 Flatpak 格式构建应用，并通过 Flathub 将其分发给用户。

Snap 由 Canonical 而建，主要用于 Ubuntu。但是，其他 Linux 发行版的开发人员开始为 Snap 打包格式做出贡献。因此，Snap 也开始适用于其他 Linux 发行版。Snap 可以直接从应用的下载页面下载，也可以从 Snapcraft 商店下载。

许多受欢迎的公司和开发人员已经发布了 AppImage、Flatpak 和 Snap 格式的应用。如果你在寻找一款应用，只需进入相应的商店并获取你选择的应用并运行它，而不用管你使用何种 Linux 发行版。

还有一个名为 “Chob” 的命令行通用应用搜索工具可在 AppImage、Flathub 和 Snapcraft 平台上轻松搜索 Linux 应用。此工具仅搜索给定的应用并在默认浏览器中显示官方链接。它不会安装它们。本指南将解释如何安装 Chob 并使用它来搜索 Linux 上的 AppImage、Flatpak 和 Snap。

### 使用 Chob 在 AppImage、Flathub 和 Snapcraft 平台上搜索 Linux 应用

从[发布页面][7]下载最新的 Chob 二进制文件。在编写本指南时，最新版本为 0.3.5。

```
$ wget https://github.com/MuhammedKpln/chob/releases/download/0.3.5/chob-linux
```

使其可执行：

```
$ chmod +x chob-linux
```

最后，搜索你想要的应用。例如，我将搜索与 Vim 相关的应用。

```
$ ./chob-linux vim
```

Chob 将在 AppImage、Flathub 和 Snapcraft 平台上搜索给定的应用（和相关应用）并显示结果。

![][8]

*使用 Chob 搜索 Linux 应用*

只需要输入你想要应用前面的数字就可在默认浏览器中打开它的官方链接，并可在其中阅读应用的详细信息。

![][9]

在浏览器中查看 Linux 应用的详细信息

有关更多详细信息，请查看下面的 Chob 官方 GitHub 页面。

资源：

  * [Chob 的 GitHub 仓库][10]


--------------------------------------------------------------------------------

via: https://www.ostechnix.com/search-linux-applications-on-appimage-flathub-and-snapcraft-platforms/

作者：[sk][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/05/chob-720x340.png
[2]: https://www.ostechnix.com/build-packages-source-using-checkinstall/
[3]: https://www.ostechnix.com/convert-deb-packages-arch-linux-packages/
[4]: https://www.ostechnix.com/build-linux-packages-multiple-platforms-easily/
[5]: https://www.ostechnix.com/flatpak-new-framework-desktop-applications-linux/
[6]: https://www.ostechnix.com/introduction-ubuntus-snap-packages/
[7]: https://github.com/MuhammedKpln/chob/releases
[8]: http://www.ostechnix.com/wp-content/uploads/2019/05/Search-Linux-applications-Using-Chob.png
[9]: http://www.ostechnix.com/wp-content/uploads/2019/05/View-Linux-applications-Details.png
[10]: https://github.com/MuhammedKpln/chob
