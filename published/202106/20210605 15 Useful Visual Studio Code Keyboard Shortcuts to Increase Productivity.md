[#]: subject: (15 Useful Visual Studio Code Keyboard Shortcuts to Increase Productivity)
[#]: via: (https://itsfoss.com/vs-code-shortcuts/)
[#]: author: (Sarvottam Kumar https://itsfoss.com/author/sarvottam/)
[#]: collector: (lujun9972)
[#]: translator: (ywxgod)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13481-1.html)

15 个提高工作效率的 VS Code 键盘快捷键
======

![](https://img.linux.net.cn/data/attachment/album/202106/13/123502pqfi45mgpf8847yf.jpg)

毫无疑问，微软的 [VS Code是最好的开源代码编辑器之一][1]。它与传说中的 Vim 不同，VS Code 不需要你是一个快捷键大师（LCTT 译注：以下都指键盘快捷键），开发者们对它大部分的功能都及其熟悉，且推崇备至。

但这并不意味着你不能成为快捷键大师，或者说你在 VS Code 中不应该使用快捷键。

在敲代码的时候，你可能需要用鼠标去执行其他的动作，比如在 VS Code 编辑器中切换终端，而此时你的代码流程会被打断，这是不是很讨厌？如果是的，那么你应该立即熟记下面这些 VS Code 有用的快捷键。

它不仅能帮助你摆脱鼠标，还能使你的生产力和工作效率得到提高。

那么，让我们来了解一下如何通过使用快捷键快速进行代码导航来进行快速编码。

### 有用的 VS Code 快捷键

免责声明。下面的这些快捷键是我在 VS Code 的使用中发现的较为有用的，你可以根据你的需要来发现更多有用的快捷键。

下面我还给出了 MacOS 用户的键盘快捷键。

#### 1、显示所有命令

Windows/Linux | macOS
---|---
`CTRL + SHIFT + P` 或 `F1` | `SHIFT + ⌘ + P` 或 `F1`

我们从最有用的快捷键开始，这个快捷键能打开命令面板（列表），它提供了对 VS Code 所有功能的访问。

![命令面板][2]

这是一个非常重要的 VS Code 快捷键，因为即使你忘记了或不想记起其他任何快捷键，但你记得这个，那么你仍然可以使用命令面板进行各种操作，如创建新文件、打开设置、改变主题，还可以查看所有快捷键。

#### 2、垂直和水平拆分 VS Code 编辑器

Windows/Linux | macOS
---|---
`CTRL + \` | `⌘ + \`

为了提高效率，但你又没有安装多个显示器，那么你可以通过水平或垂直分割 VS Code 的编辑器来一次查看多个文件的代码。

![分割 VS Code 编辑区][3]

要在多个编辑区间切换焦点，你可以使用数字键或箭头键。

Windows/Linux | macOS
---|---
`CTRL + 1`/`2`/`3` | `⌘ + 1`/`2`/`3`
`CTRL + K` `CTRL + ←`/`→` | `⌘ + K` `⌘ + ←`/`→`

#### 3、切换集成终端

Windows/Linux | macOS
---|---
CTRL + \` | ⌘ + \`

VS Code 中的集成终端是一个非常方便的功能，它可以让你在不切换窗口的情况下快速执行任务。要在编辑器中显示/隐藏终端，下面的快捷键会非常方便。

![集成终端][4]

但是，如果你跟我一样觉得 CTRL + \` 在键盘的角落位置而比较难按到，你可以打开命令面板执行`View: Toggle Terminal` 命令来切换终端。

![使用命令面板切换终端][5]

#### 4、转到文件

Windows/Linux | macOS
---|---
`CTRL + P` | `⌘ + P`

随着项目的壮大，查找文件可能会变得困难。因此，我建议，即使你使用鼠标，这个命令也能为你节省很多搜索和导航到版本库中的文件的时间。

![转到文件][6]

#### 5、转到行

Windows/Linux | macOS
---|---
`CTRL + G` | `^ + G`

当你找到文件，你可能需要去到文件中指定的行增加或编辑代码，而如果这个文件包含了数千行代码，那么滚动代码将会浪费你大量的时间。而 `CTRL + G` 或 `^ + G` 快捷键能让你快速的去掉指定的行。

![转到行][7]

另外，你也可以使用上面的转到文件的快捷键，在输入框中输入冒号 `:` 加行号，结果就跟转到行是一样的。

#### 6、在整个项目中搜索

Windows/Linux | macOS
---|---
`CTRL + SHIFT + F` | `⌘ + SHIFT + F`

很可能你需要在整个项目中搜索一个文本、变量或函数，在这种情况下，上面的命令就非常方便，它会在侧边栏显示一个搜索输入框。

![在项目中搜索][8]

我们还可以在搜索的时候添加一些过滤器，比如使用 `ALT+C` 来启用大写匹配，`ALT+W` 用于匹配整个单词，`ALT+R` 用于启用正则表达式。

#### 7、禅模式

Windows/Linux | macOS
---|---
`CTRL + K Z` | `⌘ + K Z`

想要在不受干扰的环境中工作以保持更专注？ 你可以试试禅模式（先按下 `CTRL + K`，再按下 `Z`），它会隐藏所有 UI（状态栏、活动栏、面板和侧边栏）并仅在全屏上显示编辑器。

![禅模式][9]

要启用禅模式，你可以使用上面的快捷键或者打开命令面板执行 `View: Toggle Zen Mode`，要退出禅模式，你可以按两次 `Esc` 键。

#### 8、将选择添加到下一次匹配中

Windows/Linux | macOS
---|---
`CTRL + D` | `⌘ + D`

这条命令能让你选择所选文本的下一个出现的地方，从而进行编辑。如果下一个匹配出现的位置与第一个相离较远，那这将会很方便处理。

![查找下一个匹配][10]

#### 9、切换行注释

Windows/Linux | macOS
---|---
`CTRL + /` | `⌘ + /`

将光标移到行的开头，然后添加双斜杠进行注释，这种麻烦的操作我们可以用上面的快捷键来代替了。

![注释代码][11]

甚至，如果你想注释多行代码，你可以先通过 `SHIFT+UP`/`Down` 快捷键来选中多行，然后按 `CTRL+/` 快捷键进行注释。

#### 10、转到文件的开头或结尾

Windows/Linux | macOS
---|---
`CTRL + HOME`/`END` | `⌘ + ↑`/`↓`

如果你迷失在文件的中间位置，该命令可以让你快速达到文件的起点或终点。

#### 11、代码折叠或打开

Windows/Linux | macOS
---|---
`CTRL + SHIFT + [`/`]` | `⌥ + ⌘ + [`/`]`

这也是最有用的快捷键之一，它可以帮助你折叠/取消折叠一个区域的代码。通过这种方式，你可以隐藏不必要的代码，每次只查看所需的部分代码，以便更加专注和快速编码。

![折叠一块代码][12]

#### 12、窥视执行

Windows/Linux | macOS
---|---
`CTRL + SHIFT + F12` | `⌘ + SHIFT + F12`

这个快捷键最有可能的作用是帮助你进行代码分析，或修复 bug 时了解函数和变量的运行情况。

![窥视执行][13]

#### 13、删除当前行

Windows/Linux | macOS
---|---
`CTRL + SHIFT + K` | `SHIFT + ⌘ + K`

这是一条可以快速执行，选中当前行并按删除/退格键，这两个任务的简单命令。

#### 14、查找与替换

Windows/Linux | macOS
---|---
`CTRL + F` | `⌘ + F`
`CTRL + H` | `⌥ + ⌘ + F`

用一个新的文本替换文件中所有出现的该文本的最好方法是什么？如果你手动一个一个的通过滚动代码来处理，且如果需要替换的地方又很多，那么你可能会花费大量的时间。

![查找与替换][14]

而使用查找和替换功能我们能在几秒内完成相同的任务。你可以用两个快捷键来打开它，其中一个实际上是打开用于查找文本的输入框，另一个用于输入新的文本。

#### 15、VS Code 的全部键盘快捷键

Windows/Linux | macOS
---|---
`CTRL + K CTRL + S` | `⌘ + K ⌘ + S`

最后，如果你还在为记住上述所有的快捷键而苦恼，你大可不必。因为你可以使用上面的快捷键查看编辑器所有可用的命令。

![快捷键][15]

你还可以根据自己的喜好编辑命令的绑定键。

### 想要为 VS Code 添加更多快捷键？

如果你想对 VS Code 的快捷键有完整的了解，你可以查看 VS Code 的 [文档][16]。

或者，如果你想在纸上将所有快捷键打印出来慢慢看，下面这些是各个系统对应的快捷键速查表： [Linux][17]、[macOS][18] 和 [Windows][19]。

--------------------------------------------------------------------------------

via: https://itsfoss.com/vs-code-shortcuts/

作者：[Sarvottam Kumar][a]
选题：[lujun9972][b]
译者：[ywxgod](https://github.com/ywxgod)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sarvottam/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/best-modern-open-source-code-editors-for-linux/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/05/Command-Palette.jpg?resize=800%2C418&ssl=1
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/05/Split-VS-Code.png?resize=800%2C405&ssl=1
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/05/Integrated-Terminal.png?resize=800%2C221&ssl=1
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/05/Toggle-Terminal-Using-Command-Palette.png?resize=686%2C118&ssl=1
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/05/Go-to-file.jpg?resize=800%2C388&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/05/Go-to-line.jpg?resize=800%2C99&ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/05/Search-project.jpg?resize=381%2C450&ssl=1
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/05/Zen-Mode.png?resize=800%2C450&ssl=1
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/05/Next-find-match.jpg?resize=800%2C313&ssl=1
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/05/Comment-out-code.jpg?resize=800%2C313&ssl=1
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/05/Collapse-a-region-of-code.jpg?resize=800%2C287&ssl=1
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/05/Peek-Implementation.png?resize=800%2C339&ssl=1
[14]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/05/Find-and-replace.png?resize=800%2C223&ssl=1
[15]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/05/Keyboard-Shortcuts.png?resize=800%2C406&ssl=1
[16]: https://code.visualstudio.com/docs/getstarted/keybindings
[17]: https://code.visualstudio.com/shortcuts/keyboard-shortcuts-linux.pdf
[18]: https://code.visualstudio.com/shortcuts/keyboard-shortcuts-macos.pdf
[19]: https://code.visualstudio.com/shortcuts/keyboard-shortcuts-windows.pdf
