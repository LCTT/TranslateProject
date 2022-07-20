[#]: subject: (How to use the FreeDOS text editor)
[#]: via: (https://opensource.com/article/21/6/freedos-text-editor)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)
[#]: collector: (lujun9972)
[#]: translator: (yjacks)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

如何使用FreeDOS Edit
======
FreeDOS提供了一个叫做 FreeDOS Edit 的用户友好的文本编辑器
![Person using a laptop][1]

在任何操作系统中，编辑文件都是一项常有的任务。当你想去做一个某事的笔记、写封信给朋友或升级一个系统配置——你需要一个文本编辑器。FreeFOS提供了一个用户友好的文本编辑器（也许你难以想象）叫做”FreeDOS Edit。“
### 编辑文件

最简单的启用 FreeDOS Edit 的方式就只是`EDIT`。它提供一个空的编辑器窗口。图案背景显示为一个空的“桌面”——提醒您没有编辑任何文件。

![FreeDOS Edit][2]

FreeDOS Edit未加载任何文件
Jim Hall, CC-BY SA 4.0

就像多数 DOS 程式，你可以轻击你键盘上的 Alt 键一次来启动菜单。这将激活这个菜单。在你轻击 Alt 后，编辑器将转为“menu”并将高亮“File”菜单。如果你想要启用一个别的菜单从菜单栏上，使用左与右方向键。按下下方向键或击打回车键去“进入”菜单。

![FreeDOS Edit menu][3]

高亮菜单
Jim Hall, CC-BY SA 4.0

你注意到所有菜单标题的第一个字母是不同的颜色么？高亮字母显示了一条捷径。例如，"F"在"File"菜单高亮为红色。所以你可以通过按下 Alt+F (Alt 和 F 在同一个瞬间），编辑器会显示“File”菜单。

![File menu][4]

文件菜单
Jim Hall, CC-BY SA 4.0

你可以使用“File”菜单来原则开始一个新（空）文件，或打开一个存在的文件。让我们开始一个新文件使用方向键移动到“New“然后按下回车键。你也可以用 Ctrl+N （Ctrl 和 N 在相同的时间）启动一个新文件。

![new file][5]

编辑一个新的文件
Jim Hall, CC-BY SA 4.0

在那之后编辑文件应该非常简单。大多快捷键都存在于 FreeDOS 中。编辑器：Ctrl+C以复制文本，Ctrl+X 以剪贴文本，和 Ctrl+V 以粘贴复制的或剪贴的文本到新的地方。如果你需要寻找一个特殊文本在一个长文档中，按 Ctrl+F。保存你的工作成果，使用 Ctrl+S 以推送变更回到硬碟。

### 编辑器中的编程

如果你是个程序员，你也许需要寻找 ASCII 拓展表——一个有用的拓展。DOS 系统支援一个”拓展的“ASCII字符集通常援引自“code page 437.”。标准的字符包含字母 A 到 Z(大写与小写）、数字和特殊字符像是标点符号。但是，DOS 拓展字符自编码 128 到编码 255 包含拉丁语言字符和“行绘画”元素。DOS 程序员有时需要使用这些拓展 ASCII 字符，所以 FreeDOS Edit 将它变得简单去检视一个表表示所有 ASCII 码和它们的相关字符。

查看 ASCII 表，请使用“工具”菜单，选择“ASCII表”选项，这将显示一个窗口包含一个表。

![utilities menu - ascii table][6]

找寻 ASCII 表在工具菜单
Jim Hall, CC-BY SA 4.0

沿着左边，这张表显示十六进制值"00"到"F0"，顶部展示值“0”到“F”。这提供一个快速的十六进制码参考予每个字符。例如，在第一行（00）和第一列（0）的东西为值 00+0，或者说 0x00（“NULL”值）。字符在第五行（40）和第二列（1）的值为40+1，或者说0x41（字母“A”）。

![utilities menu - ascii table][7]

ASCII 表提供一个易用的参考予扩展字符
Jim Hall, CC-BY SA 4.0

当你移动光标通过表去高亮不同的字符，你见到值在表的中间变化来展示字符的十进制、十六进制和八进制编码。例如，移动光标以高亮“线路交点”字符在C0行和列5展示拓展的字符值为 197（十进制）、0xc5（十六进制）和 305（八进制）。再一个程序中，你也许参考这些拓展字符以输入十六进值`0xc5`，或者十进制“转译码”`\305`。

![ASCII 0xc5][8]

“线路交点”字符是 197（十进制）、0xc5（十六进制）和 305（八进制）
Jim Hall, CC-BY SA 4.0

请随意浏览Edit中的菜单，以发现其他简洁的功能。例如，“选项”菜单允许您更改编辑的行为和外观。如果您喜欢使用更密集的显示，可以使用“显示”菜单（在“选项”下）将“编辑”设置为 25、43或 50 行。您还可以强制编辑以单色（黑底白字）或反转模式（白底白字）显示。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/freedos-text-editor

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[yjacks](https://github.com/yjacks)
校对：[校对者ID](https://github.com/校对者ID)

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
[8]: https://opensource.com/sites/default/files/uploads/ascii-0xc5.png (The "line intersection" character is 197 (dec), 0xc5 (hex), and 305 (oct))
