[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10577-1.html)
[#]: subject: (Olive is a new Open Source Video Editor Aiming to Take On Biggies Like Final Cut Pro)
[#]: via: (https://itsfoss.com/olive-video-editor)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Olive：一款以 Final Cut Pro 为目标的开源视频编辑器
======

[Olive][1] 是一个正在开发的新的开源视频编辑器。这个非线性视频编辑器旨在提供高端专业视频编辑软件的免费替代品。目标高么？我认为是的。

如果你读过我们的 [Linux 中的最佳视频编辑器][2]这篇文章，你可能已经注意到大多数“专业级”视频编辑器（如 [Lightworks][3] 或 DaVinciResolve）既不免费也不开源。

[Kdenlive][4] 和 Shotcut 也是此类，但它通常无法达到专业视频编辑的标准（这是许多 Linux 用户说的）。

爱好者级和专业级的视频编辑之间的这种差距促使 Olive 的开发人员启动了这个项目。

![Olive Video Editor][5]

*Olive 视频编辑器界面*

Libre Graphics World 中有一篇详细的[关于 Olive 的点评][6]。实际上，这是我第一次知道 Olive 的地方。如果你有兴趣了解更多信息，请阅读该文章。

### 在 Linux 中安装 Olive 视频编辑器

> 提醒你一下。Olive 正处于发展的早期阶段。你会发现很多 bug 和缺失/不完整的功能。你不应该把它当作你的主要视频编辑器。

如果你想测试 Olive，有几种方法可以在 Linux 上安装它。

#### 通过 PPA 在基于 Ubuntu 的发行版中安装 Olive

你可以在 Ubuntu、Mint 和其他基于 Ubuntu 的发行版使用官方 PPA 安装 Olive。

```
sudo add-apt-repository ppa:olive-editor/olive-editor
sudo apt-get update
sudo apt-get install olive-editor
```

#### 通过 Snap 安装 Olive

如果你的 Linux 发行版支持 Snap，则可以使用以下命令进行安装。

```
sudo snap install --edge olive-editor
```

#### 通过 Flatpak 安装 Olive

如果你的 [Linux 发行版支持 Flatpak][7]，你可以通过 Flatpak 安装 Olive 视频编辑器。

- [Flatpak 地址](https://flathub.org/apps/details/org.olivevideoeditor.Olive)

#### 通过 AppImage 使用 Olive

不想安装吗？下载 [AppImage][8] 文件，将其设置为可执行文件并运行它。32 位和 64 位 AppImage 文件都有。你应该下载相应的文件。

- [下载 Olive 的 AppImage](https://github.com/olive-editor/olive/releases/tag/continuous)

Olive 也可用于 Windows 和 macOS。你可以从它的[下载页面][9]获得它。

### 想要支持 Olive 视频编辑器的开发吗？

如果你喜欢 Olive 尝试实现的功能，并且想要支持它，那么你可以通过以下几种方式。

如果你在测试 Olive 时发现一些 bug，请到它们的 GitHub 仓库中报告。

- [提交 bug 报告以帮助 Olive](https://github.com/olive-editor/olive/issues)

如果你是程序员，请浏览 Olive 的源代码，看看你是否可以通过编码技巧帮助项目。

- [Olive 的 GitHub 仓库](https://github.com/olive-editor/olive)

在经济上为项目做贡献是另一种可以帮助开发开源软件的方法。你可以通过成为赞助人来支持 Olive。

- [赞助 Olive](https://www.patreon.com/olivevideoeditor)

如果你没有支持 Olive 的金钱或编码技能，你仍然可以帮助它。在社交媒体或你经常访问的 Linux/软件相关论坛和群组中分享这篇文章或 Olive 的网站。一点微小的口碑都能间接地帮助它。

### 你如何看待 Olive？

评判 Olive 还为时过早。我希望能够持续快速开发，并且在年底之前发布 Olive 的稳定版（如果我没有过于乐观的话）。

你如何看待 Olive？你是否认同开发人员针对专业用户的目标？你希望 Olive 拥有哪些功能？

--------------------------------------------------------------------------------

via: https://itsfoss.com/olive-video-editor

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.olivevideoeditor.org/
[2]: https://itsfoss.com/best-video-editing-software-linux/
[3]: https://www.lwks.com/
[4]: https://kdenlive.org/en/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/01/olive-video-editor-interface.jpg?resize=800%2C450&ssl=1
[6]: http://libregraphicsworld.org/blog/entry/introducing-olive-new-non-linear-video-editor
[7]: https://itsfoss.com/flatpak-guide/
[8]: https://itsfoss.com/use-appimage-linux/
[9]: https://www.olivevideoeditor.org/download.php
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/01/olive-video-editor-interface.jpg?fit=800%2C450&ssl=1
