[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11863-1.html)
[#]: subject: (4 cool new projects to try in COPR for January 2020)
[#]: via: (https://fedoramagazine.org/4-cool-new-projects-to-try-in-copr-for-january-2020/)
[#]: author: (Dominik Turecek https://fedoramagazine.org/author/dturecek/)

COPR 仓库中 4 个很酷的新项目（2020.01）
======

![][1]

COPR 是个人软件仓库[集合][2]，它不在 Fedora 中。这是因为某些软件不符合轻松打包的标准；或者它可能不符合其他 Fedora 标准，尽管它是自由而开源的。COPR 可以在 Fedora 套件之外提供这些项目。COPR 中的软件不受 Fedora 基础设施的支持，或者是由项目自己背书的。但是，这是一种尝试新的或实验性的软件的一种巧妙的方式。

本文介绍了 COPR 中一些有趣的新项目。如果你第一次使用 COPR，请参阅 [COPR 用户文档][3]。

### Contrast

[Contrast][4] 是一款小应用，用于检查两种颜色之间的对比度并确定其是否满足 [WCAG][5] 中指定的要求。可以使用十六进制 RGB 代码或使用颜色选择器选择颜色。除了显示对比度之外，Contrast 还以选定的颜色为背景上显示短文本来显示比较。

![][6]

#### 安装说明

[仓库][7]当前为 Fedora 31 和 Rawhide 提供了 Contrast。要安装 Contrast，请使用以下命令：

```
sudo dnf copr enable atim/contrast
sudo dnf install contrast
```

### Pamixer

[Pamixer][8] 是一个使用 PulseAudio 调整和监控声音设备音量的命令行工具。你可以显示设备的当前音量并直接增加/减小它，或静音/取消静音。Pamixer 可以列出所有源和接收器。

#### 安装说明

[仓库][7]当前为 Fedora 31 和 Rawhide 提供了 Pamixer。要安装 Pamixer，请使用以下命令：

```
sudo dnf copr enable opuk/pamixer
sudo dnf install pamixer
```

### PhotoFlare

[PhotoFlare][10] 是一款图像编辑器。它有简单且布局合理的用户界面，其中的大多数功能都可在工具栏中使用。尽管它不支持使用图层，但 PhotoFlare 提供了诸如各种颜色调整、图像变换、滤镜、画笔和自动裁剪等功能。此外，PhotoFlare 可以批量编辑图片，来对所有图片应用相同的滤镜和转换，并将结果保存在指定目录中。

![][11]

#### 安装说明

[仓库][7]当前为 Fedora 31 提供了 PhotoFlare。要安装 PhotoFlare，请使用以下命令：

```
sudo dnf copr enable adriend/photoflare
sudo dnf install photoflare
```

### Tdiff

[Tdiff][13] 是用于比较两个文件树的命令行工具。除了显示某些文件或目录仅存在于一棵树中之外，tdiff 还显示文件大小、类型和内容，所有者用户和组 ID、权限、修改时间等方面的差异。

#### 安装说明

[仓库][7]当前为 Fedora 29-31、Rawhide、EPEL 6-8 和其他发行版提供了 tdiff。要安装 tdiff，请使用以下命令：

```
sudo dnf copr enable fif/tdiff
sudo dnf install tdiff
```

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/4-cool-new-projects-to-try-in-copr-for-january-2020/

作者：[Dominik Turecek][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/dturecek/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2017/08/4-copr-945x400.jpg
[2]: https://copr.fedorainfracloud.org/
[3]: https://docs.pagure.org/copr.copr/user_documentation.html#
[4]: https://gitlab.gnome.org/World/design/contrast
[5]: https://www.w3.org/WAI/standards-guidelines/wcag/
[6]: https://fedoramagazine.org/wp-content/uploads/2020/01/contrast-screenshot.png
[7]: https://copr.fedorainfracloud.org/coprs/atim/contrast/
[8]: https://github.com/cdemoulins/pamixer
[9]: https://copr.fedorainfracloud.org/coprs/opuk/pamixer/
[10]: https://photoflare.io/
[11]: https://fedoramagazine.org/wp-content/uploads/2020/01/photoflare-screenshot.png
[12]: https://copr.fedorainfracloud.org/coprs/adriend/photoflare/
[13]: https://github.com/F-i-f/tdiff
[14]: https://copr.fedorainfracloud.org/coprs/fif/tdiff/
