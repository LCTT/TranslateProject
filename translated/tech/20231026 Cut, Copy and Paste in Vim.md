[#]: subject: "Cut, Copy and Paste in Vim"
[#]: via: "https://itsfoss.com/vim-cut-copy-paste/"
[#]: author: "Sagar Sharma https://itsfoss.com/author/sagar/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

在 Vim 中剪切、复制和粘贴
======

剪切、复制和粘贴文本是文本编辑中最基本的任务之一，我们都知道 Vim 有不同的处理方式。

这意味着，在你掌握它之前，你会害怕它，一旦你掌握了它，它就只是一个兔子洞。

虽然我将详细介绍剪切、复制和粘贴，但这里是本教程的基本摘要，以帮助你开始使用：

**动作** | **描述**
---|---
`yiw` | 复制当前单词。
`yy` | 复制整行。
`diw` | 剪切当前单词。
`dd` | 剪掉整行。
`p` | 粘贴文本。

别担心，Vim 为你提供的选项比我上面提到的要多得多。

在本教程中，我将引导你完成以下内容：

   * 如何在 Vim 中复制文本
   * 如何在 Vim 中剪切文本
   * 如何在 Vim 中粘贴文本
   * 如何使用可视模式在 Vim 中剪切和复制文本



那么让我们从第一个开始。

### 如何在 Vim 编辑器中复制文本

虽然我们使用术语“复制”，但 Vim 有一个不同的术语，称为 `yank`，因此从现在开始，我将使用 Yank 而不是“复制”。

正如我之前提到的，你可以使用多种方法在 Vim 中提取文本，以下是一些有用的方法：

命令 | 描述
---|---
`nyy` 或 `nY` | 复制（复制）当前行和接下来的 `n-1` 行。例如，`3yy` 复制当前行及其下面的两行。
`yaw` | yank（复制）光标所在的当前单词。
`yy` 或 `Y` | yank（复制）整个当前行。
`y$` | 将文本从光标复制到行尾。
`y^` 或 `y0` | 将文本从光标复制到行首。

要在 Vim 中复制，请执行以下 3 个简单步骤：

   1. 按 `Esc` 键切换到正常模式
   2. 移动到要复制的行或单词
   3. 按上表中的相关命令，你的文本将被复制



想学习交互式复制行的方式吗？ 跳到本教程的最后一部分。

### 如何在 Vim 编辑器中剪切文本

在 Vim 中，你没有任何删除文本的选项。取而代之的是剪切文本，因此删除和剪切文本与 Vim 中的操作类似。

要在 Vim 中剪切文本，请按 `d`命令。但你永远不会在没有任何意见的情况下使用 `d` 命令。你总是会添加一些东西来从中获得更多。

因此，你可以使用以下一些实用方法使用“d”命令剪切文本：

命令 | 描述
---|---
`dd` | 剪切整个当前行。
`d$` | 将文本从光标剪切到行尾。
`d^` 或 `d0` | 将文本从光标剪切到行首。
`ndd` 或 `dN` | 剪切当前行和接下来的 `n-1` 行。例如，`3dd` 剪切当前行及其下面的两行。
`daw` | 剪切光标所在的当前单词。

假设我想从文件中剪切前 4 行，然后我需要使用 `4dd`，我是这样做的：

![][1]

### 如何在 Vim 编辑器中粘贴文本

在 Vim 中复制或剪切文本后，只需按 `p` 键即可粘贴它。

你可以多次按 `p` 键多次粘贴文本，也可以使用 `np`，其中 `n` 是要粘贴文本的次数。

例如，在这里，我粘贴了之前复制了三遍的行：

![][2]

就是这么简单！

### 如何通过选择文本来剪切和复制文本

如果你使用过 GUI 文本编辑器，那么你肯定习惯于通过选择文本来复制和剪切文本。

让我们从如何通过在 Vim 中选择文本来复制开始。

#### 通过选择文本复制

要在可视模式下复制文本，请执行以下 3 个简单步骤：

   1. 移动到要开始选择的地方
   2. 按 `Ctrl + v` 启用可视模式
   3. 使用箭头键进行选择
   4. 按 `y` 键复制所选文本



例如，在这里，我使用视觉模式复制了 4 行：

![][3]

如果你注意到，当我按下 `y` 键，它就会显示有多少行被 yank（复制）。就我而言，有 4 行被复制。

#### 在 Vim 中选择文本来剪切文本

要在 Vim 中以可视模式剪切文本，你所要做的就是遵循 4 个简单步骤：

   1. 移动到要剪切线的点
   2. 按 `Ctrl + v` 切换到可视模式
   3. 使用箭头键选择要剪切的行
   4. 按 `d` 键剪切选定的行



假设我想剪掉 4 行，那么我会这样做：

![][4]

挺容易。是么？

### 更多关于 Vim 的内容

你知道 Vim 有多种模式吗？ [了解有关 Vim 中不同模式的更多信息][5]

想提高你的 Vim 水平吗？ 请参阅[成为 Vim 专业用户的提示和技巧][7]

我希望本指南对你有所帮助。

--------------------------------------------------------------------------------

via: https://itsfoss.com/vim-cut-copy-paste/

作者：[Sagar Sharma][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sagar/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/content/images/2023/10/Cut-multiple-lines-in-the-Vim-editor.gif
[2]: https://itsfoss.com/content/images/2023/10/paste-lines-in-Vim-editor.gif
[3]: https://itsfoss.com/content/images/2023/10/Copy-lines-in-vim-by-selecting-them.gif
[4]: https://itsfoss.com/content/images/2023/10/Cut-lines-in-Vim-by-selecting-them.gif
[5]: https://linuxhandbook.com/vim-modes/
[7]: https://linuxhandbook.com/pro-vim-tips/
