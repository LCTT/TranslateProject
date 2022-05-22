[#]: subject: (5 surprising things you can do with LibreOffice from the command line)
[#]: via: (https://opensource.com/article/21/3/libreoffice-command-line)
[#]: author: (Don Watkins https://opensource.com/users/don-watkins)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13219-1.html)

5 个用命令行操作 LibreOffice 的技巧
======

> 直接在命令行中对文件进行转换、打印、保护等操作。

![](https://img.linux.net.cn/data/attachment/album/202103/20/110200xjkkijnjixbyi4ui.jpg)

LibreOffice 拥有所有你想要的办公软件套件的生产力功能，使其成为微软 Office 或谷歌套件的流行的开源替代品。LibreOffice 的能力之一是可以从命令行操作。例如，Seth Kenlon 最近解释了如何使用 LibreOffice 用全局 [命令行选项将多个文件][2] 从 DOCX 转换为 EPUB。他的文章启发我分享一些其他 LibreOffice 命令行技巧和窍门。

在查看 LibreOffice 命令的一些隐藏功能之前，你需要了解如何使用应用选项。并不是所有的应用都接受选项（除了像 `--help` 选项这样的基本选项，它在大多数 Linux 应用中都可以使用）。

```
$ libreoffice --help
```

这将返回 LibreOffice 接受的其他选项的描述。有些应用没有太多选项，但 LibreOffice 好几页有用的选项，所以有很多东西可以玩。

就是说，你可以在终端上使用 LibreOffice 进行以下五项有用的操作，来让使软件更加有用。

### 1、自定义你的启动选项

你可以修改你启动 LibreOffice 的方式。例如，如果你想只打开 LibreOffice 的文字处理器组件：

```
$ libreoffice --writer  # 启动文字处理器
```

你可以类似地打开它的其他组件：


```
$ libreoffice --calc  # 启动一个空的电子表格
$ libreoffice --draw  # 启动一个空的绘图文档
$ libreoffice --web   # 启动一个空的 HTML 文档
```

你也可以从命令行访问特定的帮助文件：

```
$ libreoffice --helpwriter
```

![LibreOffice Writer help][3]

或者如果你需要电子表格应用方面的帮助：

```
$ libreoffice --helpcalc
```

你可以在不显示启动屏幕的情况下启动 LibreOffice：

```
$ libreoffice --writer --nologo
```

你甚至可以在你完成当前窗口的工作时，让它在后台最小化启动：

```
$ libreoffice --writer --minimized
```

### 2、以只读模式打开一个文件

你可以使用 `--view` 以只读模式打开文件，以防止意外地对重要文件进行修改和保存：

```
$ libreoffice --view example.odt
```

### 3、打开一个模板文档

你是否曾经创建过用作信头或发票表格的文档？LibreOffice 具有丰富的内置模板系统，但是你可以使用 `-n` 选项将任何文档作为模板：

```
$ libreoffice --writer -n example.odt
```

你的文档将在 LibreOffice 中打开，你可以对其进行修改，但保存时不会覆盖原始文件。

### 4、转换文档

当你需要做一个小任务，比如将一个文件转换为新的格式时，应用启动的时间可能与完成任务的时间一样长。解决办法是 `--headless` 选项，它可以在不启动图形用户界面的情况下执行 LibreOffice 进程。

例如，在 LibreOffic 中，将一个文档转换为 EPUB 是一个非常简单的任务，但使用 `libreoffice` 命令就更容易：

```
$ libreoffice --headless --convert-to epub example.odt
```

使用通配符意味着你可以一次转换几十个文档：

```
$ libreoffice --headless --convert-to epub *.odt
```

你可以将文件转换为多种格式，包括 PDF、HTML、DOC、DOCX、EPUB、纯文本等。

### 5、从终端打印

你可以从命令行打印 LibreOffice 文档，而无需打开应用：

```
$ libreoffice --headless -p example.odt
```

这个选项不需要打开 LibreOffice 就可以使用默认打印机打印，它只是将文档发送到你的打印机。

要打印一个目录中的所有文件：

```
$ libreoffice -p *.odt
```

（我不止一次执行了这个命令，然后用完了纸，所以在你开始之前，确保你的打印机里有足够的纸张。）

你也可以把文件输出成 PDF。通常这和使用 `--convert-to-pdf` 选项没有什么区别，但是很容易记住：


```
$ libreoffice --print-to-file example.odt --headless
```

### 额外技巧：Flatpak 和命令选项

如果你是使用 [Flatpak][5] 安装的 LibreOffice，所有这些命令选项都可以使用，但你必须通过 Flatpak 传递。下面是一个例子：

```
$ flatpak run org.libreoffice.LibreOffice --writer
```

它比本地安装要麻烦得多，所以你可能会受到启发 [写一个 Bash 别名][6] 来使它更容易直接与 LibreOffice 交互。

### 令人惊讶的终端选项

通过查阅手册页面，了解如何从命令行扩展 LibreOffice 的功能：

```
$ man libreoffice
```

你是否知道 LibreOffice 具有如此丰富的命令行选项？ 你是否发现了其他人似乎都不了解的其他选项？ 请在评论中分享它们！

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/libreoffice-command-line

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/shortcut_command_function_editing_key.png?itok=a0sEc5vo (hot keys for shortcuts or features on computer keyboard)
[2]: https://opensource.com/article/21/2/linux-workday
[3]: https://opensource.com/sites/default/files/uploads/libreoffice-help.png (LibreOffice Writer help)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://www.libreoffice.org/download/flatpak/
[6]: https://opensource.com/article/19/7/bash-aliases
