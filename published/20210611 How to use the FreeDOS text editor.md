[#]: subject: (How to use the FreeDOS text editor)
[#]: via: (https://opensource.com/article/21/6/freedos-text-editor)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)
[#]: collector: (lujun9972)
[#]: translator: (yjacks)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-14847-1.html)

如何使用 FreeDOS Edit
======

> FreeDOS 提供了一个叫做 FreeDOS Edit 的用户友好的文本编辑器。

![](https://img.linux.net.cn/data/attachment/album/202207/20/173027t6ctk5cwf9u988p9.jpg)

在任何操作系统中，编辑文件都是一项常有的任务。当你想去做一个某事的笔记、写封信给朋友或升级一个系统配置 —— 你需要一个文本编辑器。FreeDOS 提供了一个用户友好的文本编辑器（也许没啥想象力）叫做 “FreeDOS Edit”。

### 编辑文件

最简单的启用 FreeDOS Edit 的方式就就是输入 `EDIT`。它提供一个空的编辑器窗口。图案背景显示为一个空的“桌面”——提醒你没有编辑任何文件。

![FreeDOS Edit：未加载任何文件][2]

就像多数 DOS 应用程序一样，你可以按下你键盘上的 `Alt` 键来访问 Edit 的菜单。这就激活了这个菜单。在你按下 `Alt` 后，Edit 将切换到“菜单”访问方式，并高亮 “<ruby>文件<rt>File</rt></ruby>” 菜单。如果你想要访问菜单栏上的一个不同的菜单，可以使用左右方向键。按向下的方向键并按下回车键来“进入”菜单。

![高亮菜单][3]

你注意到所有菜单标题的第一个字母是不同的颜色么？这种高亮字母显示了一种快捷方式。例如，“<ruby>文件<rt>File</rt></ruby>”菜单的“F”高亮为红色。所以你可以按下 `Alt+F`（`Alt` 和 `F` 同时按下），Edit 会显示“<ruby>文件<rt>File</rt></ruby>”菜单。

![文件菜单][4]

你可以使用“<ruby>文件<rt>File</rt></ruby>”菜单来开始一个新的（空）文件，或打开一个存在的文件。让我们开始一个新文件，使用方向键移动到“<ruby>新建<rt>New</rt></ruby>“然后按下回车键。你也可以用 `Ctrl+N` （`Ctrl` 和 `N` 同时按下）打开一个新文件。

![编辑一个新的文件][5]

此后，编辑文件应该非常简单。大多数熟悉的快捷键都可以在 FreeDOS Edit 中使用：`Ctrl+C` 复制文本，`Ctrl+X` 剪贴文本，和 `Ctrl+V` 将复制的或剪贴的文本粘贴到新的地方。如果你需要在一个长文档中寻找一个特殊文本，按下 `Ctrl+F`。保存你的工作成果，请使用 `Ctrl+S` 以将变更提交到硬盘。

### 在 Edit 中编程

如果你是个程序员，你也许会发现扩展的 ASCII 表是一个有用的工具。DOS 系统支持“拓展的” ASCII字符集，通常被称之为“代码页 437”。0 到 127 的标准字符包括字母 A 到 Z（大写和小写）、数字和特殊字符，如标点符号。但是，从 128 到 255 的 DOS 拓展字符包括其它语言字符和“画线”元素。DOS 程序员有时需要使用这些拓展 ASCII 字符，所以 FreeDOS Edit 可以很容易地查看所有 ASCII 码和它们的相关字符的表格。

要查看这个 ASCII 表，请使用“<ruby>工具<rt>Utilities</rt></ruby>”菜单，选择“<ruby>ASCII 表<rt>ASCII Table</rt></ruby>”菜单项，这将显示一个包含该表格的窗口。

![在工具菜单找到 ASCII 表][6]

沿着左边，这张表显示十六进制值“00”到“F0”，顶部展示了单一值“0”到“F”。这些为每个字符的十六进制代码提供了一个快速参考。例如，第一行（00）和第一列（0）中的项目具有十六进制值 00 + 0，即0x00（“NULL”值）。而第五行（40）和第二列（1）中的字符，其数值为 40 + 1，即 0x41（字母 “A”）。

![ASCII 表提供一个便于参考的扩展字符表][7]

当你在表格内移动光标高亮不同的字符时，你会看到表格底部的值发生变化，展示了字符的十进制、十六进制和八进制编码。例如，移动光标以高亮在 C0 行和第 5 列的“行交叉”字符，显示这个扩展字符的代码为 197（十进制）、0xc5（十六进制）和 305（八进制）。在一个程序中，你可以通过输入十六进制值 0xc5 或八进制“转义代码” \305 来引用这个扩展字符。

![“行交叉”字符是 197（十进制）、0xc5（十六进制）和 305（八进制）][8]

请随意浏览 Edit 中的菜单，以发现其他不错的功能。例如，“<ruby>选项<rt>Options</rt></ruby>”菜单允许你更改 Edit 的行为和外观。如果你喜欢使用更密集的显示，可以使用“<ruby>显示<rt>Display</rt></ruby>”菜单（在“<ruby>选项<rt>Options</rt></ruby>”下）将 Edit
 设置为 25、43 或 50 行。你还可以强制 Edit 以单色（黑底白字）或反转模式（白底黑字）显示。

（文内图片来自 Jim Hall，CC-BY SA 4.0）

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/freedos-text-editor

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[yjacks](https://github.com/yjacks)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: https://opensource.com/sites/default/files/uploads/edit.png (FreeDOS Edit without any files loaded)
[3]: https://opensource.com/sites/default/files/uploads/edit-menu.png (Highlighting the menu)
[4]: https://opensource.com/sites/default/files/uploads/edit-file.png (The File menu)
[5]: https://opensource.com/sites/default/files/uploads/edit-new.png (Editing a new file)
[6]: https://opensource.com/sites/default/files/uploads/utilities-ascii.png (Find the ASCII Table in the Utilities menu)
[7]: https://opensource.com/sites/default/files/uploads/ascii-table-0x00.png (The ASCII Table provides a handy reference for extended characters)
[8]: https://opensource.com/sites/default/files/uploads/ascii-0xc5.png 
