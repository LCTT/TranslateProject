[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12373-1.html)
[#]: subject: (Missing Photoshop on Linux? Use PhotoGIMP and Convert GIMP into Photoshop)
[#]: via: (https://itsfoss.com/photogimp/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

在 Linux 上缺少 Photoshop？使用 PhotoGIMP 将 GIMP 变为 Photoshop
======

[Adobe Photoshop][1] 不适用于桌面 Linux。GIMP 是 [Linux 上 Adobe Photoshop 的最佳替代品][2]。

如果你使用过 Photoshop，那么你会注意到 [GIMP][3] 和 Photoshop 相比有不同的设置、键盘快捷键和布局。

这没有错。毕竟，它们都是两种不同的软件，而且它们不必看起来相同。

但是，习惯了 Photoshop 的人们发现在切换到 GIMP 的时很难忘记他们反复学习的肌肉记忆。这可能会使某些人感到沮丧，因为使用新的界面意味着要学习大量的键盘快捷键，并花时间在查找工具位于何处。

为了帮助从 Photoshop 切换到 GIMP 的人，[Diolinux][4] 推出了一个在 GIMP 中模仿 Adobe Photoshop 的工具。

### PhotoGIMP：在 Linux 中为 GIMP 提供 Adobe Photoshop 的外观

![][5]

[PhotoGIMP][6] 不是独立的图形软件。它是 GIMP 2.10 的补丁。你需要在系统上安装 GIMP 才能使用 PhotoGIMP。

当你应用 PhotoGIMP 补丁时，它将更改 GIMP 布局以模仿 Adobe Photoshop。

  * 默认安装数百种新字体
  * 安装新的 Python 过滤器，例如 “heal selection”
  * 添加新的启动画面
  * 添加新的默认设置以最大化画布空间
  * 添加类似于 Adobe Photoshop 的键盘快捷键

PhotoGIMP 还在自定义 `.desktop` 文件中添加新的图标和名称。让我们看看如何使用它。

### 在 Linux 上安装 PhotoGIMP （适合中级到专业用户）

PhotoGIMP 本质是一个补丁。在 Linux 中下载并[解压 zip 文件][7]。你将在解压的文件夹中找到以下隐藏的文件夹：

  * `.icons`：其中包含新的 PhotoGIMP 图标
  * `.local`：包含个性化的 `.desktop` 文件，以便你在系统菜单中看到的是 PhotoGIMP 而不是 GIMP
  * `.var`：包含 GIMP 补丁的主文件夹

你应该[使用 Ctrl+H 快捷键在 Ubuntu 中显示隐藏文件][8]。

警告：建议你备份 GIMP 配置文件，以便在不喜欢 PhotoGIMP 时可以还原。只需将 GIMP 配置文件复制到其他位置即可备份。

目前，PhotoGIMP 主要与通过 [Flatpak][9] 安装的 GIMP 兼容。如果你使用 Flatpak 安装了 GIMP，那么只需将这些隐藏的文件夹复制粘贴到家目录中，它将 GIMP 转换为 Adobe Photoshop 类似的设置。

但是，如果你通过 apt、snap 或发行版的包管理器安装了 GIMP，那么必须找到 GIMP 的配置文件夹，然后粘贴 PhotoGIMP 的 `.var` 目录的内容。当出现询问时，请选择合并选项并替换同名的现有文件。

我[使用 apt 在 Ubuntu 20.04 中安装了 GIMP][10]。对我来说，GIMP 配置文件在 `~/.config/GIMP/2.10`。我复制了 `.var/app/org.gimp.GIMP/config/GIMP/2.10` 目录，并启动 GIMP 查看 PhotoGIMP 的启动页。

这是打了 PhotoGIMP 补丁后的 GIMP 界面：

![][11]

我尝试了几个 Photoshop 快捷键来检查它所做的更改，一切似乎可以正常工作。

- [下载 PhotoGIMP][12]

我还找到了 [Snap 包形式的 PhotoGIMP][13]，但它是 2019 年的，我不确定它是否可以在所有地方使用，或者仅适用于 snap 安装。

### 总结

这不是类似的第一个项目。几年前，我们有一个类似的项目叫 Gimpshop。Gimpshop 项目在过去的几年中没有任何进展，可以肯定地认为该项目已经死亡。有一个名为 Gimpshop 的网站，但该网站来自冒名者试图以 Gimpshop 的名义获利。

我不是 Adobe Photoshop 用户。我甚至不是 GIMP 专家，这就是为什么我们的 [GIMP 教程][14] 用 Dimitrios 的原因。

因此，我无法评论 PhotoGIMP 项目的实用性。如果你熟悉这两种软件，那么应该能够比我更好地进行判断。

如果你尝试使用 PhotoGIMP，请与他人分享你的经验，并告诉我们是否值得安装。

--------------------------------------------------------------------------------

via: https://itsfoss.com/photogimp/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.adobe.com/in/products/photoshop.html
[2]: https://itsfoss.com/open-source-photoshop-alternatives/
[3]: https://www.gimp.org/
[4]: https://diolinux.com.br/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/06/photogimp-feature.jpg?ssl=1
[6]: https://github.com/Diolinux/PhotoGIMP
[7]: https://itsfoss.com/unzip-linux/
[8]: https://itsfoss.com/hide-folders-and-show-hidden-files-in-ubuntu-beginner-trick/
[9]: https://flatpak.org/
[10]: https://itsfoss.com/gimp-2-10-release/
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/photogimp-editor-interface.jpg?resize=800%2C538&ssl=1
[12]: https://github.com/Diolinux/PhotoGIMP/releases
[13]: https://snapcraft.io/photogimp
[14]: https://itsfoss.com/tag/gimp-tips/
