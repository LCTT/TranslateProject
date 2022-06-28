[#]: subject: (9 reasons I love to use the Qt Creator IDE)
[#]: via: (https://opensource.com/article/21/6/qtcreator)
[#]: author: (Stephan Avenwedde https://opensource.com/users/hansic99)
[#]: collector: (lujun9972)
[#]: translator: (hadisi1993)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-14767-1.html)

我爱用 Qt Creator IDE 的九个原因
======

> Qt Creator 就是丰富的 Qt 库和程序员之间的粘合剂。

![](https://img.linux.net.cn/data/attachment/album/202206/27/192023otvmu77tl808lltl.jpg)

Qt Creator 是 Qt 框架的默认集成开发环境（IDE），同时也是丰富的 Qt 库和用户之前的粘合剂。除了如智能代码补全、调试、项目管理等基础功能外，Qt Creator 还提供了很多让软件开发变得更简单的特性。

在这篇文章中，我会重点介绍一些我最喜欢的 [Qt Creator][2] 特性。

### 深色模式

当我使用一个新的应用时，我的第一个问题是：_它有深色模式吗？_ Qt Creator 的回答是：_你更喜欢哪一种深色模式呢？_

你可以在“<ruby>选项<rt>Options</rt></ruby>”菜单中激活深色模式。在顶部的菜单栏中，点击“<ruby>工具<rt>Tools</rt></ruby>”，选择“<ruby>选项<rt>Options</rt></ruby>”，然后转到“<ruby>环境<rt>Environment</rt></ruby>”部分。下面是你能选择的常用外观：

![QT Creator 深色模式][3]

### 定制外观

像每一个 Qt 应用一样，借助样式表，Qt Creator 的外观是高度可定制化的。下面，你可以按照我的做法给 Qt Creator一个想要的外观。

将下面这些内容写入 `mycustomstylesheet.css` 文件中：

```
QMenuBar { background-color: olive }
QMenuBar::item { background-color: olive }
QMenu { background-color : beige; color : black }
QLabel { color: green }
```

然后使用命令行开启 Qt Creator，将样式表作为参数传入：

```
qtcreator -stylesheet=mycustomstylesheet.css
```

IDE 现在看上去应该会变成这样：

![QT Creator 定制样式表][5]

在这份 [文档][6] 中可以查阅更多的样式表。

### 命令行参数

Qt Creator 可接受很多命令行选项。例如，如果想在启动时自动加载当前项目，那么你可以将它的路径传入：

```
qtcreator ~/MyProject/MyQtProject.pro
```

你甚至可以将默认应该打开的文件和行数作为参数传递。下面这个命令打开 `main.cpp`  20 行处：

```
qtcreator ~/MyProject/main.cpp:20
```

在这份 [文档][7] 中可以查阅更多 Qt 特有的命令行选项。


Qt Creator 和一般的 Qt 应用无二，所以，除了自己的命令行参数以外，它也接收 [QApplication][8] 和 [QGuiApplication][9] 的一般参数。

### 交叉编译

Qt Creator 允许你定义一些被称为“<ruby>配套<rt>Kit</rt></ruby>”的工具链。 “配套” 定义了构建和运行应用所需要的二进制库和 SDK。

![QT Creator kits][10]

这使得你通过两次点击，就在完全不同的工具链之间切换。

![在 Qt Creator 中切换配套][11]

在这份 [手册][12] 中可以查阅更多关于配套的内容。

### 分析工具

Qt Creator 集成了一些最流行的性能分析工具，例如：

  * [Linux 性能分析器][13]（需要特定的内核） 
  * [Valgrind][14] 内存分析器
  * [Clang-Tidy 和 Clazy][15]，一种检查 C/C++ 的 <ruby>静态分析器<rt>Linter</rt></ruby>

![Qt Creator 分析工具][16]

### 调试器

在调试方面，Qt Creator 为 GNU Debugger（GDB）配备了一个很好的界面。我喜欢它检查容器类型和创建条件断点的方式，很简单。

![Qt Creator 调试器][17]

### FakeVim

如果你喜欢 Vim，你可以在设置中开启 FakeVim，来像 Vim 一样控制 Qt Creator。点击“<ruby>工具<rt>Tools</rt></ruby>”，选择“<ruby>选项<rt>Options</rt></ruby>”。在 “FakeVim” 选项中，你可以找到许多开关来定制 FakeVim。除了编辑器的功能外，你可以将自己设置的功能和命令关联起来，定制 Vim 命令。

举个例子，你可以将“<ruby>构建项目<rt>Build Project</rt></ruby>”的功能和 `build` 命令关联到一起：

![Qt Creator中的FakeVim][18]

回到编辑器中，当你按下冒号（`:`）并输入 `build`，Qt Creator 利用配置的工具链，开始进行构建：

![Qt Creator中的FakeVim][19]

你可以在这份 [文档][20] 中找到 FakeVim 的更多信息。

### 类检测器

当使用 C++ 开发时，点击 Qt Creator 右下角的按钮可打开右边的窗口。然后在窗口顶部拉下的菜单中选择“<ruby>大纲<rt>Outline</rt></ruby>”。如果你在左侧窗体中有头文件打开，你可以很好地纵览定义的类和类型。如果你切换到源文件中（`*.cpp`），右侧窗体会列出所有定义的方法，双击其中一个，你可以跳转到这个方法：

![Qt Creator 中的类列表][21]

### 项目配置

Qt Creator 的项目建立在项目目录里的 `*.pro-file` 之上。你可以为你的项目在 `*.pro-file` 中添加定制的配置。我向 `*.pro-file` 中添加了 `my_special_config`，它向编译器的定义添加 `MY_SPECIAL_CONFIG`。

```
QT -= gui

CONFIG += c++11 console
CONFIG -= app_bundle

CONFIG += my_special_config

my_special_config {
DEFINES += MY_SPECIAL_CONFIG
}
```

Qt Creator 自动根据当前配置设置代码高亮：

![Qt Creator 的特殊配置][22]

`*.pro-file` 使用 [qmake 语言][23] 进行编写。

### 总结

这些特性仅仅是 Qt Creators 所提供的特性的冰山一角。初学者们应该不会感到被其众多的功能所淹没，Qt Creator 是一款对初学者很友好的 IDE。它甚至可能是入门 C++ 开发最简单的方式。如果要获得 QT Creator 特性的全面概述，请参考它的 [官方文档][24]。

*（插图来自 Stephan Avenwedde， [CC BY-SA 4.0][4]）*

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/qtcreator

作者：[Stephan Avenwedde][a]
选题：[lujun9972][b]
译者：[hadisi1993](https://github.com/hadisi1993)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/hansic99
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-concentration-focus-windows-office.png?itok=-8E2ihcF (Woman using laptop concentrating)
[2]: https://www.qt.io/product/development-tools
[3]: https://opensource.com/sites/default/files/uploads/qt_creator_dark_mode.png ( QT Creator dark mode)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://opensource.com/sites/default/files/uploads/qt_creator_custom_stylesheet2.png (QT Creator custom stylesheet)
[6]: https://doc.qt.io/qt-5/stylesheet-reference.html
[7]: https://doc.qt.io/qtcreator/creator-cli.html
[8]: https://doc.qt.io/qt-5/qapplication.html#QApplication
[9]: https://doc.qt.io/qt-5/qguiapplication.html#supported-command-line-options
[10]: https://opensource.com/sites/default/files/uploads/qt_creator_cross_compiling.png (QT Creator kits)
[11]: https://opensource.com/sites/default/files/uploads/qt_creator_select_kits.png (Switching between Kits in Qt Creator)
[12]: https://doc.qt.io/qtcreator/creator-targets.html
[13]: https://doc.qt.io/qtcreator/creator-cpu-usage-analyzer.html
[14]: https://doc.qt.io/qtcreator/creator-valgrind-overview.html
[15]: https://doc.qt.io/qtcreator/creator-clang-tools.html
[16]: https://opensource.com/sites/default/files/uploads/qt_creator_analyzer.png (Qt Creator analyzer)
[17]: https://opensource.com/sites/default/files/uploads/qt_creator_debugger2.png (Qt Creator debugger)
[18]: https://opensource.com/sites/default/files/uploads/qt_creator_fakevim_ex_commands.png (FakeVim in Qt Creator)
[19]: https://opensource.com/sites/default/files/uploads/qt_creator_fakevim_build_commands.png (FakeVim in Qt Creator)
[20]: https://doc.qt.io/qtcreator/creator-editor-fakevim.html
[21]: https://opensource.com/sites/default/files/uploads/qtcreator_class_overview.png (List of classes in Qt Creator)
[22]: https://opensource.com/sites/default/files/uploads/qtcreater_special_config.png (Special configuration in Qt Creator)
[23]: https://doc.qt.io/qt-5/qmake-language.html
[24]: https://doc.qt.io/qtcreator/
