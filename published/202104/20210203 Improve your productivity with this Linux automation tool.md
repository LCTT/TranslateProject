[#]: collector: (lujun9972)
[#]: translator: (stevenzdg988)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13347-1.html)
[#]: subject: (Improve your productivity with this Linux automation tool)
[#]: via: (https://opensource.com/article/21/2/linux-autokey)
[#]: author: (Matt Bargenquast https://opensource.com/users/mbargenquast)

使用 Linux 自动化工具提高生产率
======

> 用 AutoKey 配置你的键盘，纠正常见的错别字，输入常用的短语等等。

![](https://img.linux.net.cn/data/attachment/album/202104/30/111130s7ffji6cmb7rkcfx.jpg)

[AutoKey][2] 是一个开源的 Linux 桌面自动化工具，一旦它成为你工作流程的一部分，你就会想，如何没有它，那该怎么办。它可以成为一种提高生产率的变革性工具，或者仅仅是减少与打字有关的身体压力的一种方式。

本文将研究如何安装和开始使用 AutoKey ，介绍一些可以立即在工作流程中使用的简单方法，并探讨 AutoKey 高级用户可能会感兴趣的一些高级功能。

### 安装并设置 AutoKey

AutoKey 在许多 Linux 发行版中都是现成的软件包。该项目的 [安装指南][3] 包含许多平台的说明，也包括了从源代码进行构建的指导。本文使用 Fedora 作为操作平台。

AutoKey 有两个变体：为像 GNOME 等基于 [GTK][4] 环境而设计的 autokey-gtk 和基于 [QT][5] 的 autokey-qt。

你可以从命令行安装任一变体：

```
sudo dnf install autokey-gtk
```

安装完成后，使用 `autokey-gtk`（或 `autokey-qt`）运行它。

### 探究界面

在将 AutoKey 设置为在后台运行并自动执行操作之前，你首先需要对其进行配置。调出用户界面（UI）配置：

```
autokey-gtk -c
```

AutoKey 提供了一些预设配置的示例。你可能希望在熟悉 UI 时将他们留作备用，但是可以根据需要删除它们。

![AutoKey 用户界面][6]

左侧窗格包含一个文件夹式的短语和脚本的层次结构。“<ruby>短语<rt>Phrases</rt></ruby>” 代表要让 AutoKey 输入的文本。“<ruby>脚本<rt>Scripts</rt></ruby>” 是动态的、程序化的等效项，可以使用 Python 编写，并且获得与键盘击键发送到活动窗口基本相同的结果。

右侧窗格构建和配置短语和脚本。

对配置满意后，你可能希望在登录时自动运行 AutoKey，这样就不必每次都启动它。你可以通过在 “<ruby>首选项<rt>Preferences</rt></ruby>”菜单（“<ruby>编辑 -> 首选项<rt>Edit -> Preferences”</rt></ruby>”）中勾选 “<ruby>登录时自动启动 AutoKey<rt>Automatically start AutoKey at login</rt></ruby>”进行配置。

![登录时自动启动 AutoKey][8]

### 使用 AutoKey 纠正常见的打字排版错误

修复常见的打字排版错误对于 AutoKey 来说是一个容易解决的问题。例如，我始终键入 “gerp” 来代替 “grep”。这里是如何配置 AutoKey 为你解决这些类型问题。

创建一个新的子文件夹，可以在其中将所有“打字排版错误校正”配置分组。在左侧窗格中选择 “My Phrases” ，然后选择 “<ruby>文件 -> 新建 -> 子文件夹<rt>File -> New -> Subfolder</rt></ruby>”。将子文件夹命名为 “Typos”。

在 “<ruby>文件 -> 新建 -> 短语<rt>File -> New -> Phrase</rt></ruby>” 中创建一个新短语。并将其称为 “grep”。

通过高亮选择短语 “grep”，然后在 <ruby>输入短语内容<rt>Enter phrase contents</rt></ruby>部分（替换默认的 “Enter phrase contents” 文本）中输入 “grep” ，配置 AutoKey 插入正确的关键词。

接下来，通过定义缩写来设置 AutoKey 如何触发此短语。点击用户界面底部紧邻 “<ruby>缩写<rt>Abbreviations</rt></ruby>” 的 “<ruby>设置<rt>Set</rt></ruby>”按钮。

在弹出的对话框中，单击 “<ruby>添加<rt>Add</rt></ruby>” 按钮，然后将 “gerp” 添加为新的缩写。勾选 “<ruby>删除键入的缩写<rt>Remove typed abbreviation</rt></ruby>”；此选项让 AutoKey 将任何键入 “gerp” 一词的替换为 “grep”。请不要勾选“<ruby>在键入单词的一部分时触发<rt>Trigger when typed as part of a word</rt></ruby>”，这样，如果你键入包含 “grep”的单词（例如 “fingerprint”），就不会尝试将其转换为 “fingreprint”。仅当将 “grep” 作为独立的单词键入时，此功能才有效。

![在 AutoKey 中设置缩写][9]

### 限制对特定应用程序的更正

你可能希望仅在某些应用程序（例如终端窗口）中打字排版错误时才应用校正。你可以通过设置 <ruby>窗口过滤器<rt>Window Filter</rt></ruby>进行配置。单击 “<ruby>设置<rt>Set</rt></ruby>” 按钮来定义。

设置<ruby>窗口过滤器<rt>Window Filter</rt></ruby>的最简单方法是让 AutoKey 为你检测窗口类型：

  1. 启动一个新的终端窗口。
  2. 返回 AutoKey，单击 “<ruby>检测窗口属性<rt>Detect Window Properties</rt></ruby>”按钮。
  3. 单击终端窗口。

这将自动填充窗口过滤器，可能的窗口类值为 `gnome-terminal-server.Gnome-terminal`。这足够了，因此单击 “OK”。

![AutoKey 窗口过滤器][10]

### 保存并测试

对新配置满意后，请确保将其保存。 单击 “<ruby>文件<rt>File</rt></ruby>” ，然后选择 “<ruby>保存<rt>Save</rt></ruby>” 以使更改生效。

现在进行重要的测试！在你的终端窗口中，键入 “gerp” 紧跟一个空格，它将自动更正为 “grep”。要验证窗口过滤器是否正在运行，请尝试在浏览器 URL 栏或其他应用程序中键入单词 “gerp”。它并没有变化。

你可能会认为，使用 [shell 别名][11] 可以轻松解决此问题，我完全赞成！与别名不同，只要是面向命令行，无论你使用什么应用程序，AutoKey 都可以按规则纠正错误。

例如，我在浏览器，集成开发环境和终端中输入的另一个常见打字错误 “openshfit” 替代为 “openshift”。别名不能完全解决此问题，而 AutoKey 可以在任何情况下纠正它。

### 键入常用短语

你可以通过许多其他方法来调用 AutoKey 的短语来帮助你。例如，作为从事 OpenShift 的站点可靠性工程师（SRE），我经常在命令行上输入 Kubernetes 命名空间名称：

```
oc get pods -n openshift-managed-upgrade-operator
```

这些名称空间是静态的，因此它们是键入特定命令时 AutoKey 可以为我插入的理想短语。

为此，我创建了一个名为 “Namespaces” 的短语子文件夹，并为我经常键入的每个命名空间添加了一个短语条目。

### 分配热键

接下来，也是最关键的一点，我为子文件夹分配了一个 “<ruby>热键<rt>hotkey</rt></ruby>”。每当我按下该热键时，它都会打开一个菜单，我可以在其中选择（要么使用 “方向键”+回车键要么使用数字）要插入的短语。这减少了我仅需几次击键就可以输入这些命令的击键次数。

“My Phrases” 文件夹中 AutoKey 的预配置示例使用 `Ctrl+F7` 热键进行配置。如果你将示例保留在 AutoKey 的默认配置中，请尝试一下。你应该在此处看到所有可用短语的菜单。使用数字或箭头键选择所需的项目。

### 高级自动键入

AutoKey 的 [脚本引擎][12] 允许用户运行可以通过相同的缩写和热键系统调用的 Python 脚本。这些脚本可以通过支持的 API 的函数来完成诸如切换窗口、发送按键或执行鼠标单击之类的操作。

AutoKey 用户非常欢迎这项功能，发布了自定义脚本供其他用户采用。例如，[NumpadIME 脚本][13] 将数字键盘转换为旧的手机样式的文本输入方法，[Emojis-AutoKey][14] 可以通过将诸如: `:smile:` 之类的短语转换为它们等价的表情符号来轻松插入。

这是我设置的一个小脚本，该脚本进入 Tmux 的复制模式，以将前一行中的第一个单词复制到粘贴缓冲区中：

```
from time import sleep

# 发送 Tmux 命令前缀（b 更改为 s）
keyboard.send_keys("<ctr>+s")
# Enter copy mode
keyboard.send_key("[")
sleep(0.01)
# Move cursor up one line
keyboard.send_keys("k")
sleep(0.01)
# Move cursor to start of line
keyboard.send_keys("0")
sleep(0.01)
# Start mark
keyboard.send_keys(" ")
sleep(0.01)
# Move cursor to end of word
keyboard.send_keys("e")
sleep(0.01)
# Add to copy buffer
keyboard.send_keys("<ctrl>+m")
```

之所以有 `sleep` 函数，是因为 Tmux 有时无法跟上 AutoKey 发送击键的速度，并且它们对整体执行时间的影响可忽略不计。

### 使用 AutoKey 自动化

我希望你喜欢这篇使用 AutoKey 进行键盘自动化的探索，它为你提供了有关如何改善工作流程的一些好主意。如果你在使用 AutoKey 时有什么有用的或新颖的方法，一定要在下面的评论中分享。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/linux-autokey

作者：[Matt Bargenquast][a]
选题：[lujun9972][b]
译者：[stevenzdg988](https://github.com/stevenzdg988)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mbargenquast
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/linux_keyboard_desktop.png?itok=I2nGw78_ (Linux keys on the keyboard for a desktop computer)
[2]: https://github.com/autokey/autokey
[3]: https://github.com/autokey/autokey/wiki/Installing
[4]: https://www.gtk.org/
[5]: https://www.qt.io/
[6]: https://opensource.com/sites/default/files/uploads/autokey-defaults.png (AutoKey UI)
[7]: https://creativecommons.org/licenses/by-sa/4.0/
[8]: https://opensource.com/sites/default/files/uploads/startautokey.png (Automatically start AutoKey at login)
[9]: https://opensource.com/sites/default/files/uploads/autokey-set_abbreviation.png (Set abbreviation in AutoKey)
[10]: https://opensource.com/sites/default/files/uploads/autokey-window_filter.png (AutoKey Window Filter)
[11]: https://opensource.com/article/19/7/bash-aliases
[12]: https://autokey.github.io/index.html
[13]: https://github.com/luziferius/autokey_scripts
[14]: https://github.com/AlienKevin/Emojis-AutoKey
