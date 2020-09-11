[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10589-1.html)
[#]: subject: (Getting started with Vim visual mode)
[#]: via: (https://opensource.com/article/19/2/getting-started-vim-visual-mode)
[#]: author: (Susan Lauber https://opensource.com/users/susanlauber)

Vim 可视化模式入门
======

> 可视化模式使得在 Vim 中高亮显示和操作文本变得更加容易。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming_code_keyboard_orange_hands.png?itok=G6tJ_64Y)

Ansible 剧本文件是 YAML 格式的文本文件，经常与它们打交道的人通过他们偏爱的编辑器和扩展插件以使格式化更容易。

当我使用大多数 Linux 发行版中提供的默认编辑器来教学 Ansible 时，我经常使用 Vim 的可视化模式。它可以让我在屏幕上高亮显示我的操作 —— 我要编辑什么以及我正在做的文本处理任务，以便使我的学生更容易学习。

### Vim 的可视化模式

使用 Vim 编辑文本时，可视化模式对于识别要操作的文本块非常有用。

Vim 的可视模式有三个模式：字符、行和块。进入每种模式的按键是：

  * 字符模式: `v` （小写）
  * 行模式: `V` （大写）
  * 块模式: `Ctrl+v`

下面是使用每种模式简化工作的一些方法。

### 字符模式

字符模式可以高亮显示段落中的一个句子或句子中的一个短语，然后，可以使用任何 Vim 编辑命令删除、复制、更改/修改可视化模式识别的文本。

#### 移动一个句子

要将句子从一个地方移动到另一个地方，首先打开文件并将光标移动到要移动的句子的第一个字符。

![](https://opensource.com/sites/default/files/uploads/vim-visual-char1.png)

  * 按下 `v` 键进入可视化字符模式。单词 `VISUAL` 将出现在屏幕底部。
  * 使用箭头来高亮显示所需的文本。你可以使用其他导航命令，例如 `w` 高亮显示至下一个单词的开头，`$` 来包含该行的其余部分。
  * 在文本高亮显示后，按下 `d` 删除文本。
  * 如果你删除得太多或不够，按下 `u` 撤销并重新开始。
  * 将光标移动到新位置，然后按 `p` 粘贴文本。

#### 改变一个短语

你还可以高亮显示要替换的一段文本。

![](https://opensource.com/sites/default/files/uploads/vim-visual-char2.png)

  * 将光标放在要更改的第一个字符处。
  * 按下 `v` 进入可视化字符模式。
  * 使用导航命令（如箭头键）高亮显示该部分。
  * 按下 `c` 可更改高亮显示的文本。
  * 高亮显示的文本将消失，你将处于插入模式，你可以在其中添加新文本。
  * 输入新文本后，按下 `Esc` 返回命令模式并保存你的工作。

![](https://opensource.com/sites/default/files/uploads/vim-visual-char3.png)

### 行模式

使用 Ansible 剧本时，任务的顺序很重要。使用可视化行模式将 Ansible 任务移动到该剧本文件中的其他位置。

#### 操纵多行文本

![](https://opensource.com/sites/default/files/uploads/vim-visual-line1.png)

  * 将光标放在要操作的文本的第一行或最后一行的任何位置。
  * 按下 `Shift+V` 进入行模式。单词 `VISUAL LINE` 将出现在屏幕底部。
  * 使用导航命令（如箭头键）高亮显示多行文本。
  * 高亮显示所需文本后，使用命令来操作它。按下 `d` 删除，然后将光标移动到新位置，按下 `p` 粘贴文本。
  * 如果要复制该 Ansible 任务，可以使用 `y`（yank）来代替 `d`（delete）。

#### 缩进一组行

使用 Ansible 剧本或 YAML 文件时，缩进很重要。高亮显示的块可以使用 `>` 和 `<` 键向右或向左移动。

![](https://opensource.com/sites/default/files/uploads/vim-visual-line2.png)

  * 按下 `>` 增加所有行的缩进。
  * 按下 `<` 减少所有行的缩进。

尝试其他 Vim 命令将它们应用于高亮显示的文本。

### 块模式

可视化块模式对于操作特定的表格数据文件非常有用，但它作为验证 Ansible 剧本文件缩进的工具也很有帮助。

Ansible 任务是个项目列表，在 YAML 中，每个列表项都以一个破折号跟上一个空格开头。破折号必须在同一列中对齐，以达到相同的缩进级别。仅凭肉眼很难看出这一点。缩进 Ansible 任务中的其他行也很重要。

#### 验证任务列表缩进相同

![](https://opensource.com/sites/default/files/uploads/vim-visual-block1.png)

  * 将光标放在列表项的第一个字符上。
  * 按下 `Ctrl+v` 进入可视化块模式。单词 `VISUAL BLOCK` 将出现在屏幕底部。
  * 使用箭头键高亮显示单个字符列。你可以验证每个任务的缩进量是否相同。
  * 使用箭头键向右或向左展开块，以检查其它缩进是否正确。

![](https://opensource.com/sites/default/files/uploads/vim-visual-block2.png)

尽管我对其它 Vim 编辑快捷方式很熟悉，但我仍然喜欢使用可视化模式来整理我想要出来处理的文本。当我在讲演过程中演示其它概念时，我的学生将会在这个“对他们而言很新”的文本编辑器中看到一个可以高亮文本并可以点击删除的工具。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/2/getting-started-vim-visual-mode

作者：[Susan Lauber][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/susanlauber
[b]: https://github.com/lujun9972
