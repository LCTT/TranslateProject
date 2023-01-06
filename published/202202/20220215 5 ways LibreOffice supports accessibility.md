[#]: subject: "5 ways LibreOffice supports accessibility"
[#]: via: "https://opensource.com/article/22/2/libreoffice-accessibility"
[#]: author: "Don Watkins https://opensource.com/users/don-watkins"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14298-1.html"

LibreOffice 支持无障碍辅助的 5 种方式
======

> 试试 LibreOffice 中的这些无障碍功能之一。你可能会发现更好的或替代的方式来完成日常工作。

![](https://img.linux.net.cn/data/attachment/album/202202/23/121309ow8jcu6f0d60eds8.jpg)

LibreOffice.org 是我首选的生产力套件，我在过去已经介绍了我如何将它作为一个 [图形化办公套件][2] 以及 [终端命令][3] 使用。

在这篇文章中，我想着重介绍 LibreOffice 如何支持使用无障碍辅助技术的人。

### 鼠标

鼠标是一项重要的发明，但它并不是对每个人都同样有效。例如，那些不能在屏幕上看到鼠标指针的人，或者不能在他们的桌子上实际操作鼠标的人，从鼠标中获益不多。

为了考虑到人们与电脑互动方式的不同，你可以在没有鼠标的情况下使用 LibreOffice。与应用中的大多数无障碍功能一样，这个功能对任何人都有帮助。即使你自己是一个鼠标用户，有时你也不想把你的手从键盘上移开。能够在“打字模式”下触发特定的 LibreOffice 动作，对于忙碌的打字员来说真的很方便。

你可以使用 `Alt` 键和菜单名称中的一个触发字母来打开 LibreOffice 主菜单中的每一个项目。在默认情况下，你不会看到这些触发字母，但当你按下 `Alt` 键时，它们就会出现。

![LibreOffice Writer menus with underlines][4]

要打开<ruby>文件<rt>File</rt></ruby>菜单，按住 `ALT+F`。要打开<ruby>格式<rt>Format</rt></ruby>菜单，按住 `ALT+O`。当菜单被打开后，你就可以释放按键。

在你打开一个菜单后，该菜单中的每个项目都有一个触发字母，或者你可以使用键盘上的**箭头**键导航到该项目并按下**回车**。

要关闭一个菜单而不做任何事情，按 `Esc` 键。

### 不用鼠标就能改变一个字体

LibreOffice 界面中的所有东西都可以从菜单中获得，即使你认为它只是工具栏中的一个元素。例如，你通常可能会将鼠标移动到格式化工具栏来改变字体，但你也可以通过选择文本，然后打开<ruby>格式<rt>Format</rt></ruby>菜单并选择<ruby>字符<rt>Character</rt></ruby>来打开字符对话框来改变字体。你可以使用 `Tab`、**箭头** 和 **回车** 键来浏览这个对话框。

这里需要注意的是，你可以在一个应用中使用许多不同的路径来达到同一个目标。每个场景都可能有不同的最佳路径，所以在处理任务时不要想得太线性。

### 常见的快捷方式

这里有一些 LibreOffice Writer 的快捷键：

  * `F2`：公式栏
  * `Ctrl+F2`：插入字段
  * `F3`：自动文本
  * `F5`: 打开/关闭导航
  * `Shift+F5`：将光标移到上次保存文件时的位置
  * `Ctrl+Shift+F5`：打开导航，进入页面
  * `F7`：拼写
  * `F8`：同义词

以下是电子表格的快捷键：

  * `Ctrl+Home`：返回到 A1 单元格
  * `Ctrl+End`：移到最后一个包含数据的单元格
  * `Home`：将光标移到当前行的第一个单元格
  * `End`：将光标移到当前行的最后一个单元格
  * `Shift+Home`：选择从当前单元格到当前行的第一个单元格的单元格

LibreOffice 的文档非常丰富，通过按键盘上的 `Alt+H` 或 `F1` 可以很容易地获取。

### 无障碍设置

关于更多的无障碍设置，请进入<ruby>工具<rt>Tools</rt></ruby>菜单，选择<ruby>选项<rt>Options</rt></ruby>。在选项对话框中，在左边的栏目中展开 LibreOffice 类别，然后点击<ruby>无障碍<rt>Accessibility</rt></ruby>。

选项包括：

  * **在只读文本文件中使用文本选择光标**：这允许你在只读文档中移动，就像你可以编辑它一样，限制了你实际可以做的选择和复制文本。
  * **允许动画图像**：不是每个人都希望在工作时在他们的文档中出现移动的图像。你可以在这里进行调整。
  * **允许动画文本**：与图像一样，动画文本样式对一些人来说是有趣的，而对另一些人来说则是分散注意力或令人困惑的。

也有高对比度主题的选项。如果你在你的操作系统上使用高对比度模式，LibreOffice 会自动检测并改变它的主题来匹配。

### 键盘快捷方式

你可以通过设置自己的键盘快捷键来定制你与 LibreOffice 的交互方式。进入<ruby>工具<rt>Tools</rt></ruby>菜单，选择<ruby>自定义<rt>Customize</rt></ruby>（或者直接按 `Alt+T`，然后按 `C`）。

选择<ruby>键盘<rt>Keyboard</rt></ruby>标签，必要时按**箭头**键或用鼠标点击它（如果你还在使用鼠标）。

### 对所有人开放

让开源的应用无障碍化有利于所有的用户。通过尝试 LibreOffice 中的无障碍功能，你可能会发现更好的或替代性的方法来完成日常任务。无论你是否“需要”该功能，无障碍功能提供了选择。试试其中的一些，因为你可能会发现你喜欢的东西。如果你有一个 LibreOffice（或任何你喜欢的开源应用）似乎没有提供的要求，在其错误跟踪系统中提交一个功能请求来让该项目知道。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/2/libreoffice-accessibility

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_laptop_hack_work.png?itok=aSpcWkcl (Coding on a computer)
[2]: https://opensource.com/article/21/9/libreoffice-tips
[3]: https://opensource.com/article/21/3/libreoffice-command-line
[4]: https://opensource.com/sites/default/files/uploads/libreoffice_menu_with_underlines.jpg (LibreOffice Writer menus with underlines)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
