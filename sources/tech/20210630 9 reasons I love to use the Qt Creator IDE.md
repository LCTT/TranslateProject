[#]: subject: (9 reasons I love to use the Qt Creator IDE)
[#]: via: (https://opensource.com/article/21/6/qtcreator)
[#]: author: (Stephan Avenwedde https://opensource.com/users/hansic99)
[#]: collector: (lujun9972)
[#]: translator: (hadisi1993)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

9 reasons I love to use the Qt Creator IDE
======
Qt Creator is the glue between Qt's rich set of libraries and the
programmer.
![Business woman on laptop sitting in front of window][1]

Qt Creator is the Qt framework's default integrated development environment (IDE) and hence the glue between Qt's rich set of libraries and the user. In addition to its basic features such as intelligent code completion, debugging, and project administration, Qt Creator offers a lot of nice features that make software development easier.

In this article, I will highlight some of my favorite [Qt Creator][2] features.

### Dark mode

My first question when working with a new application is: _Is there a dark mode?_ Qt Creator answers with: _Which dark mode do you prefer?_

You can activate dark mode in the Options menu. On the top menu bar, go to **Tools**, select **Options**, and go to the **Environment** section. Here is where you can select the general appearance:

![ QT Creator dark mode][3]

(Stephan Avenwedde, [CC BY-SA 4.0][4])

### Custom appearance

Like every Qt application, Qt Creator's appearance is highly customizable with style sheets. Below, you can follow along with my approach to give Qt Creator a fancy look.

Create the file `mycustomstylesheet.css` with the following content:


```
QMenuBar { background-color: olive }
QMenuBar::item { background-color: olive }
QMenu { background-color : beige; color : black }
QLabel { color: green }
```

Then start Qt Creator from the command line and pass the style sheet as a parameter with:


```
`qtcreator -stylesheet=mycustomstylesheet.css`
```

It should look like this:

![QT Creator custom stylesheet][5]

(Stephan Avenwedde, [CC BY-SA 4.0][4])

Read more about style sheets in the [documentation][6].

### Command-line parameters

Qt Creator accepts many command-line options. For example, if you want to automatically load your current project at startup, pass the path to the `*.pro-file`:


```
`qtcreator ~/MyProject/MyQtProject.pro`
```

You can even pass the file and the line number that should be opened by default. This command opens the file `main.cpp` at line 20:


```
`qtcreator ~/MyProject/main.cpp:20`
```

Read more about the Qt Creator-specific command-line options in the [documentation][7].

Qt Creator is an ordinary Qt application, so, in addition to its own command-line arguments, it also accepts the generic arguments for [QApplication][8] and [QGuiApplication][9].

### Cross-compiling

Qt Creator allows you to define several toolchains, called **Kits**. A kit defines the binaries and SDK for building and running an application:

![QT Creator kits][10]

(Stephan Avenwedde, [CC BY-SA 4.0][4])

This allows you to switch between completely different toolchains with just two clicks:

![Switching between Kits in Qt Creator][11]

(Stephan Avenwedde, [CC BY-SA 4.0][4])

Read more about kits in the [manual][12].

### Analyzer

Qt Creator integrates several of the most popular analyzers, such as:

  * [Linux Performance Analyzer][13] (requires a special kernel) 
  * [Valgrind][14] memory profiler
  * [Clang-Tidy and Clazy][15], a linter for C/C++



![Qt Creator analyzer][16]

(Stephan Avenwedde, [CC BY-SA 4.0][4])

### Debugger

When it comes to debugging, Qt Creator has a nice interface for GNU Debugger (GDB). I like its easy way of inspecting container types and creating conditional breakpoints:

![Qt Creator debugger][17]

(Stephan Avenwedde, [CC BY-SA 4.0][4])

### FakeVim

If you like Vim, enable FakeVim in the settings to control Qt Creator like Vim. Go to **Tools** and select **Options**. In the **FakeVim** section, you can find many switches to customize FakeVim's behavior. In addition to the editor functions, you can also map your own functions to custom Vim commands.

For example, you can map the function **Build Project** to the `build` command:

![FakeVim in Qt Creator][18]

(Stephan Avenwedde, [CC BY-SA 4.0][4])

Back in the editor, when you press the colon button and enter `build`, Qt Creator starts a build process with the configured toolchain:

![FakeVim in Qt Creator][19]

(Stephan Avenwedde, [CC BY-SA 4.0][4])

You can find more information about FakeVim [in the docs][20].

### Class inspector

When developing in C++, open the right window by clicking on the button in the bottom-right corner of Qt Creator. Then choose **Outline** from the dropdown menu on the top border. If you have a header file open on the left pane, you get a nice overview of the defined classes or types. If you switch to a source file (`*.cpp`), the right pane will list all defined methods, and you can jump to one by double-clicking on it:

![List of classes in Qt Creator][21]

(Stephan Avenwedde, [CC BY-SA 4.0][4])

### Project configuration

Qt Creator projects are built around the `*.pro-file` in the project's directory. You can add your own custom configuration to the project's `*.pro-file` of your project. I added `my_special_config` to the `*.pro-file`, which adds `MY_SPECIAL_CONFIG` to the compiler defined:


```
QT -= gui

CONFIG += c++11 console
CONFIG -= app_bundle

CONFIG += my_special_config

my_special_config {
DEFINES += MY_SPECIAL_CONFIG
}
```

Qt Creator automatically highlights the code according to the active configuration:

![Special configuration in Qt Creator][22]

(Stephan Avenwedde, [CC BY-SA 4.0][4])

The `*.pro-file` is written in the [qmake language][23].

### Summary

These features are only the tip of the iceberg of what Qt Creator provides. Beginners shouldn't feel overwhelmed by the many features, as Qt Creator is absolutely beginner-friendly. It may even be the easiest way to start developing in C++. To get a complete overview of its features, refer to the [official Qt Creator documentation][24].

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/qtcreator

作者：[Stephan Avenwedde][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
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
