[#]: subject: (9 reasons I love to use the Qt Creator IDE)
[#]: via: (https://opensource.com/article/21/6/qtcreator)
[#]: author: (Stephan Avenwedde https://opensource.com/users/hansic99)
[#]: collector: (lujun9972)
[#]: translator: (hadisi1993)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

9个我爱用Qt Creator IDE的原因
======
Qt Creator 就是丰富的Qt库和程序员之间的胶水。
![坐在窗前用笔记本电脑的商务女性][1]

Qt Creator 是Ot框架默认的集成开发环境（IDE），同时也是丰富的Qt库和用户之前的胶水。除了如智能代码补全，调试，项目管理等基础功能外，Qt Creator还提供了很多让软件开发变得更简单的特性。

在这篇文章中，我会重点介绍一些我最喜欢的[Qt Creator][2]特性。
### 黑暗模式

当我使用一个新的应用时，我的第一个问题是：_这里有黑暗模式吗？_ Qt Creator的回答是：_你更喜欢哪一种黑暗模式呢？_

你可以在选项菜单中激活黑暗模式。在顶部的菜单栏中，点击**工具**，选择**选项**,然后转到**环境**部分。下面是你能选择的常用外观：

![ QT Creator 黑暗模式][3]

(Stephan Avenwedde, [CC BY-SA 4.0][4])

### 定制外观

像每一个Qt应用一样，借助样式表，Qt Creator的外观是高度可定制化的。下面，你可以按照我的做法给Qt Creator一个想要的外观。

将下面这些内容写入`mycustomstylesheet.css`文件中：

```
QMenuBar { background-color: olive }
QMenuBar::item { background-color: olive }
QMenu { background-color : beige; color : black }
QLabel { color: green }
```

然后使用命令行开启Qt Creator，将样式表作为参数传入：


```
`qtcreator -stylesheet=mycustomstylesheet.css`
```

IDE现在看上去应该会变成这样：

![QT Creator 定制样式表][5]

(Stephan Avenwedde, [CC BY-SA 4.0][4])

在这份[文档][6]中可以查阅更多的样式表

### 命令行参数
Qt Creator 可接受很多命令行选项。例如，如果想在启动时自动加载当前项目，那么你可以将它的路径传递给`*.pro-file`:

```
`qtcreator ~/MyProject/MyQtProject.pro`
```

你甚至可以将默认应该打开的文件和行数作为参数传递。下面这个命令在20行处打开`main.cpp`：

```
`qtcreator ~/MyProject/main.cpp:20`
```

在这份[文档][7]中可以查阅更多Qt特有的命令行选项。


Qt Creator和一般的Qt应用无二，所以，除了自己的命令行参数以外，它也接收[QApplication][8]和[QGuiApplication][9]的一般参数。
### 交叉编译

Qt Creator allows you to define several toolchains, called **Kits**. A kit defines the binaries and SDK for building and running an application:
Qt Creator允许你定义一些被称为**Kits**的toolchains。一个Kit定义构建和运行应用所需要的二进制库和SDK。
![QT Creator kits][10]

(Stephan Avenwedde, [CC BY-SA 4.0][4])

This allows you to switch between completely different toolchains with just two clicks:
这使得你通过两次点击，就在完全不同的toolchains之间切换。

![在Qt Creator中切换Kits][11]

(Stephan Avenwedde, [CC BY-SA 4.0][4])

在这份[手册][12]中可以查阅更多关于Kits的内容。
### 分析工具

Qt Creator集成了一些最流行的性能分析工具，例如：

  * [Linux Performance Analyzer][13] (需要特定的内核) 
  * [Valgrind][14] memory profiler
  * [Clang-Tidy and Clazy][15], 一种检查C/C++的linter


![Qt Creator性能分析工具][16]

(Stephan Avenwedde, [CC BY-SA 4.0][4])

### 调试器

在调试方面，Qt Creator为GNU Debugger（GDB）配备了一个很好的界面。我喜欢它检查容器类型和创建条件断点的方式，很简易。

![Qt Creator 调试器][17]

(Stephan Avenwedde, [CC BY-SA 4.0][4])

### FakeVim

如果你喜欢Vim，你可以开启在设置中开启FakeVim来像Vim一样控制Qt Creator。点击**工具**并选择**选项**。在**FakeVim**选项中，你可以找到许多开关来定制FakeVim。除了编辑器的功能外，你可以将自己设置的功能和命令关联起来，定制Vim命令。

举个例子，你可以将**创建项目**的功能和`build`命令关联到一起去：
For example, you can map the function **Build Project** to the `build` command:

![Qt Creator中的FakeVim][18]

(Stephan Avenwedde, [CC BY-SA 4.0][4])

回到编辑器中，当你按下冒号并输入build，Qt Creator利用配置的toolchain，开始进行构建:

![Qt Creator中的FakeVim][19]

(Stephan Avenwedde, [CC BY-SA 4.0][4])

你可以中这份[文档][20]中找到FakeVim的更多信息。
### 类检测器

当使用C++开发时，点击Qt Creator右下角的按钮可打开右边的窗口。然后在窗口顶部拉下的菜单中选择**轮廓**。如果你在左侧窗体中有头文件打开，你可以很好地纵览定义的类和类型。如果你切换到源文件中(`*.cpp`)，右侧窗体会列出所有定义的方法，双击其中一个，你可以跳转到这个方法：
![Qt Creator中的类列表][21]

(Stephan Avenwedde, [CC BY-SA 4.0][4])

### 项目配置

Qt Creator 的项目建立在项目文件里的`*.pro-file`之上。你可以为你的项目在`*.pro-file`中添加你定制的配置。我向`*.pro-file`中添加了`my_special_config`，它向编译器的定义添加`MY_SPECIAL_CONFIG`。

```
QT -= gui

CONFIG += c++11 console
CONFIG -= app_bundle

CONFIG += my_special_config

my_special_config {
DEFINES += MY_SPECIAL_CONFIG
}
```

Qt Creator 自动根据当前配置设置代码高亮:
![Qt Creator的特殊配置][22]

(Stephan Avenwedde, [CC BY-SA 4.0][4])

`*.pro-file` 使用[qmake语言][23]进行编写
### Summary
这些特性仅仅是Qt Creators提供特性的冰山一角。初学者们应该不会感到被其众多的功能所淹没，Qt Creator是一款对初学者很友好的IDE。它甚至可能是开始C++开发最简单的方式。如果要获得QT Creator特性的全面概述，请参考它的[官方文档][24]。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/qtcreator

作者：[Stephan Avenwedde][a]
选题：[lujun9972][b]
译者：[hadisi1993](https://github.com/hadisi1993)
校对：[校对者ID](https://github.com/校对者ID)

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
