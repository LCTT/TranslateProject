[#]: subject: "AppImage Pool is an App Store to Help You Find & Manage AppImages"
[#]: via: "https://itsfoss.com/appimagepool/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14124-1.html"

AppImage Pool：一个帮助你寻找和管理 AppImage 的应用商店
======

> 这是一个管理和寻找 AppImage 应用的有趣的 GUI 前端。让我们来了解一下它！

我们有很多关于 [AppImage 的历史和制作它][1] 的信息。如果你是 Linux 的新手，你也应该看看我们的 [AppImage 使用指南][2]。

AppImage 使应用可以很容易地在不同的发行版上运行，而不需要安装依赖关系或任何东西。

然而，与 [Flatpak][3] 的 Flathub 不同，你可能找不到一个浏览 AppImage 应用的门户。

[Nitrux OS][4] 中的 NX 软件中心做了类似的工作，但它不能轻易安装在其他发行版上。因此，AppImage Pool 作为 AppImage 应用的应用商店上场了，你可以安装在任何 Linux 发行版上。

### AppImage Pool：一个管理和寻找 AppImage 应用的 GUI 前端

![][5]

AppImage Pool 是一个使用 Flutter 构建的 GUI 前端，它从 [AppImageHub][6] 获取应用数据，并让你快速搜索、下载和管理 AppImage 应用。

它并不托管任何 AppImage 文件，但它可以让你从项目的 GitHub 页面下载可用的 AppImage 文件。

当你试图下载一个 AppImage 文件时，它会从应用的 GitHub 发布页列出所有下载方式。

我不确定它是否仅限于来自 GitHub 的项目，但你可以在 [AppImageHub 门户][6] 中找到各种不同方式。

### AppImage Pool 的特点

![][7]

AppImage 是一个简单直白的应用商店，可以让你搜索、下载和管理 AppImage 文件。

其中一些功能包括：

  * 能够下载特定版本的 AppImage 文件
  * 按类别过滤应用
  * 下载进度图标
  * 管理所有已安装的 AppImages
  * 查看下载历史

考虑到该应用是使用 Flutter 构建的，它给人带来了快捷的用户体验。

如果你是一个开发者，这鼓励了你使用它制作一个应用的话，你也可以 [在 Linux 中安装 Flutter][8]。

![][9]

### 在 Linux 中安装 AppImage Pool

由于明显的原因，开发者提供了一个可供下载的 AppImage 文件。

你也可以选择从 [Flathub][11] 中 [安装它的 Flatpak 包][10]。如果你想测试它即将发布的任何版本，也有一个每夜构建的 AppImage 版本。

在其 [GitHub 页面][12] 上可以了解关于它的更多信息。

- [AppImage Pool 下载][13]

### 使用 AppImage Pool 的感受

![][14]

该应用可以如预期的工作。然而，我注意到，列出的一些应用没有下载链接或任何相关信息。

毕竟，这些数据是来自于 AppImageHub 的。

另外，你可能会觉得奇怪，有些应用只列出了预发布的 AppImage 文件，比如 Blender。

![][15]

虽然这也是可以选择项目发布分支的一个优势，但我认为我不会下载预发布包。

总的来说，找到一个能让人轻松下载和管理 AppImages 的东西是件好事。

我建议你试一试，并在下面的评论区告诉我你的想法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/appimagepool/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/appimage-interview/
[2]: https://itsfoss.com/use-appimage-linux/
[3]: https://itsfoss.com/what-is-flatpak/
[4]: https://nxos.org
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/12/appimagepool.png?resize=800%2C450&ssl=1
[6]: https://www.appimagehub.com
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/appimagepool-gimp.png?resize=800%2C571&ssl=1
[8]: https://itsfoss.com/install-flutter-linux/
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/appimagepool-categories.png?resize=800%2C575&ssl=1
[10]: https://itsfoss.com/flatpak-guide/
[11]: https://flathub.org/apps/details/io.github.prateekmedia.appimagepool
[12]: https://github.com/prateekmedia/appimagepool
[13]: https://github.com/prateekmedia/appimagepool/releases
[14]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/12/appimagepool-main.png?resize=800%2C543&ssl=1
[15]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/12/appimagepool-blender.png?resize=800%2C440&ssl=1
