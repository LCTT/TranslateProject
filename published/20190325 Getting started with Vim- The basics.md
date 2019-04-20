[#]: collector: (lujun9972)
[#]: translator: (Modrisco)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10752-1.html)
[#]: subject: (Getting started with Vim: The basics)
[#]: via: (https://opensource.com/article/19/3/getting-started-vim)
[#]: author: (Bryant Son https://opensource.com/users/brson)

Vim 入门：基础
======

> 为工作或者新项目学习足够的 Vim 知识。

![Person standing in front of a giant computer screen with numbers, data][1]

我还清晰地记得我第一次接触 Vim 的时候。那时我还是一名大学生，计算机学院的机房里都装着 Ubuntu 系统。尽管我在上大学前也曾接触过不同的 Linux 发行版（比如 RHEL —— Red Hat 在百思买出售它的 CD），但这却是我第一次要在日常中频繁使用 Linux 系统，因为我的课程要求我这样做。当我开始使用 Linux 时，正如我的前辈和将来的后继者们一样，我感觉自己像是一名“真正的程序员”了。

![Real Programmers comic][2]

*真正的程序员，来自 [xkcd][3]*

学生们可以使用像 [Kate][4] 一样的图形文本编辑器，这也安装在学校的电脑上了。对于那些可以使用 shell 但不习惯使用控制台编辑器的学生，最流行的选择是 [Nano][5]，它提供了很好的交互式菜单和类似于 Windows 图形文本编辑器的体验。

我有时会用 Nano，但当我听说 [Vi/Vim][6] 和 [Emacs][7] 能做一些很棒的事情时我决定试一试它们（主要是因为它们看起来很酷，而且我也很好奇它们有什么特别之处）。第一次使用 Vim 时吓到我了 —— 我不想搞砸任何事情！但是，一旦我掌握了它的诀窍，事情就变得容易得多，我就可以欣赏这个编辑器的强大功能了。至于 Emacs，呃，我有点放弃了，但我很高兴我坚持和 Vim 在一起。

在本文中，我将介绍一下 Vim（基于我的个人经验），这样你就可以在 Linux 系统上用它来作为编辑器使用了。这篇文章不会让你变成 Vim 的专家，甚至不会触及 Vim 许多强大功能的皮毛。但是起点总是很重要的，我想让开始的经历尽可能简单，剩下的则由你自己去探索。

### 第 0 步：打开一个控制台窗口

在使用 Vim 前，你需要做一些准备工作。在 Linux 操作系统打开控制台终端。（因为 Vim 也可以在 MacOS 上使用，Mac 用户也可以使用这些说明）。

打开终端窗口后，输入 `ls` 命令列出当前目录下的内容。然后，输入 `mkdir Tutorial` 命令创建一个名为 `Tutorial` 的新目录。通过输入 `cd Tutorial` 来进入该目录。

![Create a folder][8]

这就是全部的准备工作。现在是时候转到有趣的部分了——开始使用 Vim。

### 第 1 步：创建一个 Vim 文件和不保存退出

还记得我一开始说过我不敢使用 Vim 吗？我当时在害怕“如果我改变了一个现有的文件，把事情搞砸了怎么办？”毕竟，一些计算机科学作业要求我修改现有的文件。我想知道：_如何在不保存更改的情况下打开和关闭文件？_

好消息是你可以使用相同的命令在 Vim 中创建或打开文件：`vim <FILE_NAME>`，其中 `<FILE_NAME>` 表示要创建或修改的目标文件名。让我们通过输入 `vim HelloWorld.java` 来创建一个名为 `HelloWorld.java` 的文件。

你好，Vim！现在，讲一下 Vim 中一个非常重要的概念，可能也是最需要记住的：Vim 有多种模式，下面是 Vim 基础中需要知道的的三种：

模式 | 描述
---|---
正常模式 | 默认模式，用于导航和简单编辑
插入模式 | 用于直接插入和修改文本
命令行模式 | 用于执行如保存，退出等命令

Vim 也有其他模式，例如可视模式、选择模式和命令模式。不过上面的三种模式对我们来说已经足够用了。

你现在正处于正常模式，如果有文本，你可以用箭头键移动或使用其他导航键（将在稍后看到）。要确定你正处于正常模式，只需按下 `esc` (Escape）键即可。

> **提示：** `Esc` 切换到正常模式。即使你已经在正常模式下，点击 `Esc` 只是为了练习。 

现在，有趣的事情发生了。输入 `:` （冒号键）并接着 `q!` （完整命令：`:q!`）。你的屏幕将显示如下：

![Editing Vim][9]

在正常模式下输入冒号会将 Vim 切换到命令行模式，执行 `:q!` 命令将退出 Vim 编辑器而不进行保存。换句话说，你放弃了所有的更改。你也可以使用 `ZQ` 命令；选择你认为更方便的选项。

一旦你按下 `Enter` （回车），你就不再在 Vim 中。重复练习几次来掌握这条命令。熟悉了这部分内容之后，请转到下一节，了解如何对文件进行更改。

### 第 2 步：在 Vim 中修改并保存

通过输入 `vim HelloWorld.java` 和回车键来再次打开这个文件。你可以在插入模式中修改文件。首先，通过 `Esc` 键来确定你正处于正常模式。接着输入 `i` 来进入插入模式（没错，就是字母 **i**）。

在左下角，你将看到 `-- INSERT --`，这标志着你这处于插入模式。

![Vim insert mode][10]

写一些 Java 代码。你可以写任何你想写的，不过这也有一份你可以参照的例子。你的屏幕将显示如下：

```
public class HelloWorld {
  public static void main([String][11][] args) {
  }
}
```

非常漂亮！注意文本是如何在 Java 语法中高亮显示的。因为这是个 Java 文件，所以 Vim 将自动检测语法并高亮颜色。

保存文件：按下 `Esc` 来退出插入模式并进入命令行模式。输入 `:` 并接着 `x!` （完整命令：`:x!`），按回车键来保存文件。你也可以输入 `wq` 来执行相同的操作。

现在，你知道了如何使用插入模式输入文本并使用以下命令保存文件：`:x!` 或者 `:wq`。

### 第 3 步：Vim 中的基本导航

虽然你总是可以使用上箭头、下箭头、左箭头和右箭头在文件中移动，但在一个几乎有数不清行数的大文件中，这将是非常困难的。能够在一行中跳跃光标将会是很有用的。虽然 Vim 提供了不少很棒的导航功能，不过在一开始，我想向你展示如何在 Vim 中到达某一特定的行。

单击 `Esc` 来确定你处于正常模式，接着输入 `:set number` 并键入回车。

瞧！你现在可以在每一行的左侧看到行号。

![Showing Line Numbers][12]

好，你也许会说，“这确实很酷，不过我该怎么跳到某一行呢？”再一次的，确认你正处于正常模式。接着输入 `:<LINE_NUMBER>`，在这里 `<LINE_NUMBER>` 是你想去的那一行的行数。按下回车键来试着移动到第二行。

```
:2
```

现在，跳到第三行。

![Jump to line 3][13]

但是，假如你正在处理一个一千多行的文件，而你正想到文件底部。这该怎么办呢？确认你正处于正常模式，接着输入 `:$` 并按下回车。

你将来到最后一行！

现在，你知道如何在行间跳跃了，作为补充，我们来学一下如何移动到一行的行尾。确认你正处于有文本内容的一行，如第三行，接着输入 `$`。

![Go to the last character][14]

你现在来到这行的最后一个字节了。在此示例中，高亮左大括号以显示光标移动到的位置，右大括号被高亮是因为它是高亮的左大括号的匹配字符。

这就是 Vim 中的基本导航功能。等等，别急着退出文件。让我们转到 Vim 中的基本编辑。不过，你可以暂时顺便喝杯咖啡或茶休息一下。

### 第 4 步：Vim 中的基本编辑

现在，你已经知道如何通过跳到想要的一行来在文件中导航，你可以使用这个技能在 Vim 中进行一些基本编辑。切换到插入模式。（还记得怎么做吗？是不是输入 `i` ？）当然，你可以使用键盘逐一删除或插入字符来进行编辑，但是 Vim 提供了更快捷的方法来编辑文件。

来到第三行，这里的代码是 `public static void main(String[] args) {`。双击 `d` 键，没错，就是 `dd`。如果你成功做到了，你将会看到，第三行消失了，剩下的所有行都向上移动了一行。（例如，第四行变成了第三行）。

![Deleting A Line][15]

这就是<ruby>删除<rt>delete</rt></ruby>命令。不要担心，键入 `u`，你会发现这一行又回来了。喔，这就是<ruby>撤销<rt>undo</rt></ruby>命令。

![Undoing a change in Vim][16]

下一课是学习如何复制和粘贴文本，但首先，你需要学习如何在 Vim 中突出显示文本。按下 `v` 并向左右移动光标来选择或反选文本。当你向其他人展示代码并希望标识你想让他们注意到的代码时，这个功能也非常有用。

![Highlighting text in Vim][17]

来到第四行，这里的代码是 `System.out.println("Hello, Opensource");`。高亮这一行的所有内容。好了吗？当第四行的内容处于高亮时，按下 `y`。这就叫做<ruby>复制<rt>yank</rt></ruby>模式，文本将会被复制到剪贴板上。接下来，输入 `o` 来创建新的一行。注意，这将让你进入插入模式。通过按 `Esc` 退出插入模式，然后按下 `p`，代表<ruby>粘贴<rt>paste</rt></ruby>。这将把复制的文本从第三行粘贴到第四行。

![Pasting in Vim][18]

作为练习，请重复这些步骤，但也要修改新创建的行中的文字。此外，请确保这些行对齐工整。

> **提示：** 您需要在插入模式和命令行模式之间来回切换才能完成此任务。

当你完成了，通过 `x!` 命令保存文件。以上就是 Vim 基本编辑的全部内容。

### 第 5 步：Vim 中的基本搜索

假设你的团队领导希望你更改项目中的文本字符串。你该如何快速完成任务？你可能希望使用某个关键字来搜索该行。

Vim 的搜索功能非常有用。通过 `Esc` 键来进入命令模式，然后输入冒号 `:`，我们可以通过输入 `/<SEARCH_KEYWORD>` 来搜索关键词， `<SEARCH_KEYWORD>` 指你希望搜索的字符串。在这里，我们搜索关键字符串 `Hello`。在下面的图示中没有显示冒号，但这是必须输入的。

![Searching in Vim][19]

但是，一个关键字可以出现不止一次，而这可能不是你想要的那一个。那么，如何找到下一个匹配项呢？只需按 `n` 键即可，这代表<ruby>下一个<rt>next</rt></ruby>。执行此操作时，请确保你没有处于插入模式！

### 附加步骤：Vim 中的分割模式

以上几乎涵盖了所有的 Vim 基础知识。但是，作为一个额外奖励，我想给你展示 Vim 一个很酷的特性，叫做<ruby>分割<rt>split</rt></ruby>模式。

退出 `HelloWorld.java` 并创建一个新文件。在控制台窗口中，输入 `vim GoodBye.java` 并按回车键来创建一个名为 `GoodBye.java` 的新文件。

输入任何你想输入的让内容，我选择输入 `Goodbye`。保存文件（记住你可以在命令模式中使用 `:x!` 或者 `:wq`）。

在命令模式中，输入 `:split HelloWorld.java`，来看看发生了什么。

![Split mode in Vim][20]

Wow！快看！ `split` 命令将控制台窗口水平分割成了两个部分，上面是 `HelloWorld.java`，下面是 `GoodBye.java`。该怎么能在窗口之间切换呢？ 按住 `Control` 键（在 Mac 上）或 `Ctrl` 键（在 PC 上），然后按下 `ww` (即双击 `w` 键)。

作为最后一个练习，尝试通过复制和粘贴 `HelloWorld.java` 来编辑 `GoodBye.java` 以匹配下面屏幕上的内容。

![Modify GoodBye.java file in Split Mode][21]

保存两份文件，成功！

> **提示 1：** 如果你想将两个文件窗口垂直分割，使用 `:vsplit <FILE_NAME>` 命令。（代替  `:split <FILE_NAME>` 命令，`<FILE_NAME>` 指你想要使用分割模式打开的文件名）。
>
> **提示 2：** 你可以通过调用任意数量的 `split` 或者 `vsplit` 命令来打开两个以上的文件。试一试，看看它效果如何。

### Vim 速查表

在本文中，您学会了如何使用 Vim 来完成工作或项目，但这只是你开启 Vim 强大功能之旅的开始，可以查看其他很棒的教程和技巧。

为了让一切变得简单些，我已经将你学到的一切总结到了 [一份方便的速查表][22] 中。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/3/getting-started-vim

作者：[Bryant Son][a]
选题：[lujun9972][b]
译者：[Modrisco](https://github.com/Modrisco)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/brson
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_metrics_analytics_desktop_laptop.png?itok=9QXd7AUr (Person standing in front of a giant computer screen with numbers, data)
[2]: https://opensource.com/sites/default/files/uploads/1_xkcdcartoon.jpg (Real Programmers comic)
[3]: https://xkcd.com/378/
[4]: https://kate-editor.org
[5]: https://www.nano-editor.org
[6]: https://www.vim.org
[7]: https://www.gnu.org/software/emacs
[8]: https://opensource.com/sites/default/files/uploads/2_createtestfolder.jpg (Create a folder)
[9]: https://opensource.com/sites/default/files/uploads/4_existingvim.jpg (Editing Vim)
[10]: https://opensource.com/sites/default/files/uploads/6_insertionmode.jpg (Vim insert mode)
[11]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+string
[12]: https://opensource.com/sites/default/files/uploads/10_setnumberresult_0.jpg (Showing Line Numbers)
[13]: https://opensource.com/sites/default/files/uploads/12_jumpintoline3.jpg (Jump to line 3)
[14]: https://opensource.com/sites/default/files/uploads/14_gotolastcharacter.jpg (Go to the last character)
[15]: https://opensource.com/sites/default/files/uploads/15_deletinglines.jpg (Deleting A Line)
[16]: https://opensource.com/sites/default/files/uploads/16_undoingtheline.jpg (Undoing a change in Vim)
[17]: https://opensource.com/sites/default/files/uploads/17_highlighting.jpg (Highlighting text in Vim)
[18]: https://opensource.com/sites/default/files/uploads/19_pasting.jpg (Pasting in Vim)
[19]: https://opensource.com/sites/default/files/uploads/22_searchmode.jpg (Searching in Vim)
[20]: https://opensource.com/sites/default/files/uploads/26_copytonewfiles.jpg (Split mode in Vim)
[21]: https://opensource.com/sites/default/files/uploads/27_exercise.jpg (Modify GoodBye.java file in Split Mode)
[22]: https://opensource.com/downloads/cheat-sheet-vim
