[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11206-1.html)
[#]: subject: (4 cool new projects to try in COPR for August 2019)
[#]: via: (https://fedoramagazine.org/4-cool-new-projects-to-try-in-copr-for-august-2019/)
[#]: author: (Dominik Turecek https://fedoramagazine.org/author/dturecek/)

COPR 仓库中 4 个很酷的新项目（2019.8）
======

![][1]

COPR 是个人软件仓库[集合][2]，它不在 Fedora 中。这是因为某些软件不符合轻松打包的标准；或者它可能不符合其他 Fedora 标准，尽管它是自由而开源的。COPR 可以在 Fedora 套件之外提供这些项目。COPR 中的软件不受 Fedora 基础设施的支持，或者是由项目自己背书的。但是，这是一种尝试新的或实验性的软件的一种巧妙的方式。

这是 COPR 中一组新的有趣项目。

### Duc

[duc][3] 是磁盘使用率检查和可视化工具的集合。Duc 使用索引数据库来保存系统上文件的大小。索引完成后，你可以通过命令行界面或 GUI 快速查看磁盘使用情况。

![][4]

#### 安装说明

该[仓库][5]目前为 EPEL 7、Fedora 29 和 30 提供 duc。要安装 duc，请使用以下命令：

```
sudo dnf copr enable terrywang/duc
sudo dnf install duc
```

### MuseScore

[MuseScore][6] 是一个处理音乐符号的软件。使用 MuseScore，你可以使用鼠标、虚拟键盘或 MIDI 控制器创建乐谱。然后，MuseScore 可以播放创建的音乐或将其导出为 PDF、MIDI 或 MusicXML。此外，它还有一个由 MuseScore 用户创建的含有大量乐谱的数据库。

![][7]

#### 安装说明

该[仓库][5]目前为 Fedora 29 和 30 提供 MuseScore。要安装 MuseScore，请使用以下命令：

```
sudo dnf copr enable jjames/MuseScore
sudo dnf install musescore
```

### 动态墙纸编辑器

[动态墙纸编辑器][9] 是一个可在 GNOME 中创建和编辑随时间变化的壁纸集合的工具。这可以使用 XML 文件来完成，但是，动态墙纸编辑器通过其图形界面使其变得简单，你可以在其中简单地添加图片、排列图片并设置每张图片的持续时间以及它们之间的过渡。

![][10]

#### 安装说明

该[仓库][11]目前为 Fedora 30 和 Rawhide 提供动态墙纸编辑器。要安装它，请使用以下命令：

```
sudo dnf copr enable atim/dynamic-wallpaper-editor
sudo dnf install dynamic-wallpaper-editor
```

### Manuskript

[Manuskript][12] 是一个给作者的工具，旨在让创建大型写作项目更容易。它既可以作为编写文本的编辑器，也可以作为组织故事本身、故事人物和单个情节的注释的工具。

![][13]

#### 安装说明

该[仓库][14]目前为 Fedora 29、30 和 Rawhide 提供 Manuskript。要安装 Manuskript，请使用以下命令：

```
sudo dnf copr enable notsag/manuskript
sudo dnf install manuskript
```

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/4-cool-new-projects-to-try-in-copr-for-august-2019/

作者：[Dominik Turecek][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/dturecek/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2017/08/4-copr-945x400.jpg
[2]: https://copr.fedorainfracloud.org/
[3]: https://duc.zevv.nl/
[4]: https://fedoramagazine.org/wp-content/uploads/2019/07/duc.png
[5]: https://copr.fedorainfracloud.org/coprs/terrywang/duc/
[6]: https://musescore.org/
[7]: https://fedoramagazine.org/wp-content/uploads/2019/07/musescore-1024x512.png
[8]: https://copr.fedorainfracloud.org/coprs/jjames/MuseScore/
[9]: https://github.com/maoschanz/dynamic-wallpaper-editor
[10]: https://fedoramagazine.org/wp-content/uploads/2019/07/dynamic-walppaper-editor.png
[11]: https://copr.fedorainfracloud.org/coprs/atim/dynamic-wallpaper-editor/
[12]: https://www.theologeek.ch/manuskript/
[13]: https://fedoramagazine.org/wp-content/uploads/2019/07/manuskript-1024x600.png
[14]: https://copr.fedorainfracloud.org/coprs/notsag/manuskript/
