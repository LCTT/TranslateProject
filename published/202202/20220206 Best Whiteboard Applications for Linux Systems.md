[#]: subject: "Best Whiteboard Applications for Linux Systems"
[#]: via: "https://www.debugpoint.com/2022/02/top-whiteboard-applications-linux/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14271-1.html"

适用于 Linux 系统的最佳白板应用
======

![](https://img.linux.net.cn/data/attachment/album/202202/14/162535uomtvutyoo44q3hs.jpg)

> 我们将向你展示几个用于 Linux 的白板应用程序。我相信这些会对你有很大的帮助。

一般来说，数字白板是一种包含一块白板形式的大型互动显示器的工具。白板设备的一些例子，如平板电脑、大屏幕手机、触摸屏笔记本电脑、平面显示器等。

如果教员使用白板，可以使用触摸感应笔、手写笔、手指或鼠标在这些设备屏幕上画、写或操作元素。你可以拖动、点击、擦除、绘制，在白板上做一切可以用笔在纸上完成的事情。

但要做到这些，你需要支持所有这些功能的软件，即在你的触摸和显示器之间架起桥梁。

现在，有许多商业应用程序可用于这项工作。但我们将在本文中谈论一些可用于 Linux 的自由开源的白板应用程序。

### Linux 上的最佳白板应用

#### 1、Xournal++

我们介绍的第一个应用是 [Xournal++][1]。在我看来，这是这份名单上最好的应用。它相当可靠，而且已经出现了一段时间了。

Xournal++ 可以让你写字、画画，做一切你通常在纸上做的事情。它支持手写、带高亮的自定义笔、橡皮擦等。它支持分层、多页功能、添加外部图片、添加音频等功能。

这个应用程序支持几乎所有的压敏平板，包括 Wacom、Huion、XP-Pen。我在一台触摸板笔记本电脑上测试了它，只需稍作设置就能工作。所以，你可以用它使用任何压敏设备。

它是用 C++ 和 GTK3 编写的。

![Xournal++ 白板应用程序（Linux）][2]

对于 Linux 系统，可以安装如下软件包。它是免费的，也可用于 Linux、macOS 和 Windows。如果你想在手机上试用，也可以使用它的测试版。

这个应用程序有 AppImage、Snap、Flatpak 和 deb 包。对于基于 Ubuntu/Debian 的系统，也有 PPA 版本。

此外，还有适用于 Fedora、SUSE 和 Arch 的专用软件包。请点击下面的链接下载 Xournal++，获取你喜欢的可执行文件格式。

  * [主页][1]
  * [文档][4]
  * [源代码][5]
  * [下载 Xournal++][3]

#### 2、OpenBoard

我们想重点介绍的下一个是 [OpenBoard][6]。这个简单的白板绘图应用程序很容易使用，不会有太多的选项让你操心。

这款软件非常适合初学者和初级学生在在线课程中做笔记。

![OpenBoard][7] 

OpenBoard 加载了很多功能。如颜色、画笔、文本、简单的绘图形状、页面支持等。这个应用程序是使用 Qt 技术构建的。

这个应用程序只适用于 Ubuntu，它是一个独立的 deb 包。你可以从下面的链接下载 OpenBoard。

  * [主页][6]
  * [文档][9]
  * [源代码][10]
  * [下载 OpenBoard][8]

#### 3、Notelab

[NoteLab][11] 是上个年代最古老的白板应用程序之一。它是一个自由开源的应用程序，有大量的功能。因此，你可以理解这个应用程序是多么的稳定和流行。

以下是它的一些特点：

  * 这个应用程序支持所有流行的图像格式作为导出选项。例如，SVG、PNG、JPG、BMP 等。
  * 用于定制笔和纸的配置选项。
  * 内置内存管理器，用于自定义分配 NoteLab 使用的内存。
  * 多种样式的纸张。
  * 所有标准的绘图工具。
  * 你可以在笔记的任何部分调整大小、移动、删除、改变颜色和执行其他操作。

![NoteLab][12]

然而，这个应用程序是一个 Java 应用程序，并以一个 .jar 文件分发。因此，你需要 Java 运行时才能工作。你可以参考我们的指南，通过以下链接在 Linux 系统中安装 Java 或 JRE。

  * [如何在基于 Ubuntu的系统中安装 Java/JRE][13] 。
  * [如何在 Arch Linux 中安装 Java/JRE][14] 。

NoteLab 带有一个独立的可执行的 .jar 文件，你可以通过以下链接从 SourceForge 下载。记住，你需要 JRE 来运行这个应用程序。

  * [主页][11]
  * [文档][17]
  * [下载 NoteLab][16]

#### 4、Rnote

我们要介绍的第三个应用程序叫做 [Rnote][18]。Rnote 是一个通过触摸设备进行手写笔记的优秀应用。这个应用程序是基于矢量图像的，可以绘制、注释图片和 PDF 文件。它有原生的 .rnote 文件格式，也支持导入/导出 png、jpeg、svg 和 PDF 的选项。

Rnote 的一个很酷的特点是，它支持 Xournal++ 文件格式（本列表中的第一个应用程序），这使它成为一个必备的工具。

Rnote 使用 GTK4 和 Rust 构建，非常适合 GNOME 桌面和各种类型的 Linux 系统。

这个应用程序目前正在开发中，在使用时请记住这一点。

![Rnote - 基于 GTK4 和 Rust 的 Linux 白板应用程序][19]

这个应用程序是以 Flatpak 包的形式提供的。你可以使用 [这篇指南][20] 为你的 Linux 系统设置 Flatpak，然后点击 [此链接安装][21]。

- [主页和源代码][18]

#### 5、Lorien

[Lorien][22] 是一个完美的数字笔记本软件，可以用于你的构思会议，你可以用它的各种工具创建笔记。Lorien 是一个基于 Godot 游戏引擎的跨平台、自由开源的“无限画布绘画/记事”应用程序。这个应用程序非常适合于为头脑风暴会议做快速笔记。

工具箱相当标准，有自由画笔、橡皮擦、线条工具和选择工具。你可以移动或删除你的笔触的选定部分，这是一个点的集合，在运行时渲染。

![Linux 的 Lorien 白板应用程序][23]

使用 Lorien 不需要安装。可以从下面的链接中下载一个独立的可执行 tar 文件。下载后，解压文件并双击运行。

- [主页和源代码][22]
- [下载 Lorien][24]

#### 6、Rainbow Board

Rainbow Board 是一个基于 Electron 和 React 的自由开源的白板应用。一般来说，因为它们的性能和笨重的性质，人们不喜欢 Electron 应用程序。但是，既然我们要列出这个类别的应用，我认为这个应用是值得一提的。

它有一个标准的画布，支持触摸和手写笔绘制。工具箱包括画笔尺寸、颜色、填充颜色、字体、撤销和重做动作。你可以将你的绘图导出为 PNG 或 SVG 文件。

![Linux 的 Rainbow Board 白板应用程序][25]

这个应用程序有 Snap、Flatpak 和独立的 deb 安装程序。你可以从下面的链接中的页面下载它们。

  * [主页][27]
  * [源代码][28]
  * [下载 Rainbow Board][26]

### 荣誉提名

我想在这里提到的最后两个绘图应用程序是 Vectr 和 Ecxalidraw。这些是基于网络的白板绘图应用程序。我把它们放在一个单独的部分，因为它们不是桌面应用程序。

所以，如果你不愿意再安装一个应用程序；或者使用的是学校或工作系统，没有权限安装，你可以打开网络浏览器，使用这些。以下是它们的网址：

- [Vectr][29]
- [Ecxalidraw][30]

### 总结

这就是一些适用于 Linux 和其他操作系统的现代白板 [绘图][31] 应用程序。由于疫情和在家工作的原因，你们中的许多人可能正在用纸笔为你们的在线课程或课堂做笔记。我相信这些会对你的学习工作有所帮助。

试试这些，你一定会找到最适合你的那一个。请在下面的留言框中告诉我你对这份清单的意见或反馈。

加油！

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/02/top-whiteboard-applications-linux/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://xournalpp.github.io/
[2]: https://www.debugpoint.com/wp-content/uploads/2022/02/Xournal-Whiteboard-Application-for-Linux-1024x576.jpg
[3]: https://xournalpp.github.io/installation/linux/
[4]: https://xournalpp.github.io/guide/overview/
[5]: https://github.com/xournalpp/xournalpp/
[6]: https://openboard.ch/
[7]: https://www.debugpoint.com/wp-content/uploads/2022/02/OpenBoard.jpg
[8]: https://openboard.ch/download.en.html
[9]: https://openboard.ch/support.html
[10]: https://github.com/OpenBoard-org/OpenBoard
[11]: http://java-notelab.sourceforge.net/
[12]: https://www.debugpoint.com/wp-content/uploads/2022/02/NoteLab.jpg
[13]: https://www.debugpoint.com/2016/05/how-to-install-java-jre-jdk-on-ubuntu-linux-mint/
[14]: https://www.debugpoint.com/2021/02/install-java-arch/
[15]: https://www.debugpoint.com/2018/05/gimp-2-10-download-install-linux-ubuntu/
[16]: https://sourceforge.net/projects/java-notelab/files/NoteLab/
[17]: http://java-notelab.sourceforge.net/features.html
[18]: https://github.com/flxzt/rnote
[19]: https://www.debugpoint.com/wp-content/uploads/2022/02/Rnote-Whiteboard-Application-for-Linux-based-on-GTK4-and-Rust-1024x576.jpg
[20]: https://flatpak.org/setup/
[21]: https://dl.flathub.org/repo/appstream/com.github.flxzt.rnote.flatpakref
[22]: https://github.com/mbrlabs/Lorien
[23]: https://www.debugpoint.com/wp-content/uploads/2022/02/Lorien-Whiteboard-Application-for-Linux.jpg
[24]: https://github.com/mbrlabs/Lorien/releases
[25]: https://www.debugpoint.com/wp-content/uploads/2022/02/Rainbow-Board-Whiteboard-application-for-Linux-1024x560.jpg
[26]: https://www.electronjs.org/apps/rainbow-board
[27]: https://harshkhandeparkar.github.io/rainbow-board/
[28]: https://github.com/HarshKhandeparkar/rainbow-board
[29]: https://vectr.com/
[30]: https://excalidraw.com/
[31]: https://www.debugpoint.com/tag/digital-drawing
[32]: https://unsplash.com/photos/doTjbfxrmRw
[33]: https://t.me/debugpoint
[34]: https://twitter.com/DebugPoint
[35]: https://www.youtube.com/c/debugpoint?sub_confirmation=1
[36]: https://facebook.com/DebugPoint
