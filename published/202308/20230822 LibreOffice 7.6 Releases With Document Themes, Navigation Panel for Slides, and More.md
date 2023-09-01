[#]: subject: "LibreOffice 7.6 Releases With Document Themes, Navigation Panel for Slides, and More"
[#]: via: "https://news.itsfoss.com/libreoffice-7-6/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16123-1.html"

LibreOffice 7.6 发布，下一个版本 24.2
=====

![][0]

> LibreOffice 7.6 版本已经到来，这个版本为我们带来了众多优秀的改进。

LibreOffice 7.6 是这款优秀的开源办公套件的最新重要升级。

在其上一次的 [LibreOffice 7.5 版本发布][1] 中，开发者们发布了新的应用图标和一系列的功能提升。而这一次，它为我们带来了一套全新的功能组合。

> 📋 从 **2024** 年开始，文档基金会将实行基于日历的版本编号，意即，计划于 2024 年 2 月发布的下一个版本将以 **LibreOffice 24.2** 的形式呈现给大家。

让我们看一下这次发布的新版本有哪些新添的亮点。

### LibreOffice 7.6：有哪些亮点？

保持一贯的预期，所有工具都带来了显著的改良，对 Writer、Calc 和 Impress 的改进更是明显，包括以下几点：

  * 对文档主题的全面支持
  * 对帮助功能的升级改进
  * 在兼容性上进行的改善
  * 新的页码向导功能（Writer）
  * 幻灯片的导航面板功能（Impress）
  * 色彩排序的自动过滤器支持（Calc）

#### 对于 Writer 的优化

此次更新中的主要亮点是提供了对文档主题的支持。简单来说，当需要的时候，你可以为你的文档标题、正文和副标题挑选一套预设的颜色搭配。

![][2]

你可以通过菜单 “<ruby>格式<rt>Format</rt></ruby> → <ruby>主题<rt>Themes</rt></ruby>” 来找到这项功能。

一个细微但重大的改进是在 “<ruby>插入<rt>Insert</rt></ruby>” 菜单中新增了一个向导，可以使用它在页眉/页脚添加页码。

新增了一个选项，使你能够通过聚光灯功能在文本中高亮显示段落样式或直接格式。

![][3]

在面向用户体验的改进方面，你在编辑文档时可以从侧边栏方便快捷地找 到 “<ruby>无障碍检查<rt>Accesbility Check</rt></ruby>” 选项。

![][4]

其他改动包括：

  * 依靠段落样式，现可以更加灵活地创建图表了
  * 现在能够直接在关联表格中编辑参考文献条目了
  * 如果你无意间试图删除文档中的隐藏部分，Writer 会发出警告提醒
  * Writer 现在接受用于短语检查的自定义词典了

#### Calc 的改进

![][5]

新的颜色排序功能使得排序变得更为容易。

除此之外，还有一个用于数据透视表的紧凑的新布局。其他细微和技术层面的改进包括：

  * 复制到另一个文件的电子表格保留了用户定义的打印范围
  * 可以自定义新注释的默认外观
  * 会保存求解器设置
  * 如果表格为空，则在删除时不会显示确认
  * 超链接格式已经进行改善，使其看起来更为醒目

#### Impress 与 Draw 的改进

现在，当你播放一个演示文稿时，会出现便于快速浏览的导航按钮。这是个小改动，但是应该可以帮助你轻松地在幻灯片之间进行导航。

其他的改进包括：

  * 增加了对多图片 tiff 文件的支持
  * 可以在导航器中按照从前到后的顺序列出对象

#### 其他变化

![][6]

除了之前的亮点，你还可以得到一个已有所改进的 “<ruby>帮助<rt>Help</rt></ruby>” 部分。这里将展示关于改变布局或快速完成许多任务所需的命令/快捷键信息。

如果你想深入了解, 可以查阅 [LibreOffice 7.6 发行备注][7]。

### 如何升级/安装？

对于大部分用户来说，LibreOffice 可能已经预安装好了。如果是这样的话，你应该等待来自你的系统仓库、LibreOffice 的 PPA，或者 Flathub 的更新。这通常需要几天时间。

> 🚧 你也可以选择从你的系统中卸载 LibreOffice，并通过以下步骤获取新版本。但如果你能等待，我们建议你等待。

如果你还没有安装它并想要获取新版本，只需要根据你的需求（DEB/RPM）简单地 [下载 tar 包][8]。

![][9]

接下来，解压这个包，并在 `DEBS` 或 `RPMS` 文件夹下找到所有 .deb/.rpm 文件。

![][10]

当你进入这个文件夹，在终端中使用右键菜单打开它（如图所示）并根据你的包输入以下命令之一（适用于 Fedora 和基于 Debian 的发行版）：

![][11]

```
sudo dnf install *.rpm
sudo dpkg -i *.deb
```

💬 你对最新的 LibreOffice 发行版本有什么想法？请在下方的评论区分享你的看法。

*（题图：MJ/1afe80f6-a7dd-4e9e-ac77-f8581492b08a）*

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/libreoffice-7-6/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：ChatGPT
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/libreoffice-7-5-release/
[2]: https://news.itsfoss.com/content/images/2023/08/document-themes.png
[3]: https://news.itsfoss.com/content/images/2023/08/highlighting-spotlight.png
[4]: https://news.itsfoss.com/content/images/2023/08/accessibility-check-writer.jpg
[5]: https://news.itsfoss.com/content/images/2023/08/sort-by-color.png
[6]: https://news.itsfoss.com/content/images/2023/08/HelpCommands.png
[7]: https://wiki.documentfoundation.org/ReleaseNotes/7.6
[8]: https://www.libreoffice.org/download/download-libreoffice/
[9]: https://news.itsfoss.com/content/images/2023/08/extracted-libreoffice.png
[10]: https://news.itsfoss.com/content/images/2023/08/terminal-libreoffice.png
[11]: https://news.itsfoss.com/content/images/2023/08/libreoffice-terminal.png
[12]: https://linuxhandbook.com/tag/bash-beginner/
[13]: https://itsfoss.community/
[14]: https://itsfoss.com/newsletter/
[0]: https://img.linux.net.cn/data/attachment/album/202308/24/115300zf7jjse8k7hjdbm8.jpg