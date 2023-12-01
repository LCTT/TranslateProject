[#]: subject: "Change Keyboard Layout in Ubuntu"
[#]: via: "https://itsfoss.com/ubuntu-change-keyboard/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

更改 Ubuntu 中的键盘布局
======

当[你安装Ubuntu][1]时，你可以选择键盘。你可能已经选择了美国英语的默认选择，现在你想将其更改为英国英语或印度英语或你选择的任何其他键盘。

好处是你可以在同一个 Ubuntu 系统中拥有多种键盘布局。这是相当方便的。

在本教程中，你将学习：

   * 在 Ubuntu 桌面中添加新的键盘布局
   * 在可用键盘之间切换
   * 删除额外的键盘
   * 改变键盘布局的命令行方法



### 步骤 1：添加新的键盘布局

要更改键盘布局，你需要先在系统上启用另一个键盘布局。

进入系统设置。按 Ubuntu 中的 Super 键（Windows 符号键）并搜索设置。

![][2]

在系统设置中，在左侧边栏中查找键盘。选择后，你应该会在**输入源** 下看到添加新键盘的选项。单击 + 号。

![Add new keyboard layout][3]

你将看到一些键盘选项，但如果单击三个点，你可以获得更多选项。你可以在此处滚动浏览或搜索。

![There are more keyboard layouts available][4]

单击你想要的键盘。请记住，所选的键盘布局可能有子布局。

例如，当我单击**英语（印度）**时，它会向我显示从丹麦到加纳等的一些英语键。在这里，我选择了**英语（印度，带卢比）**键盘。这是将要添加的键盘布局。

![][5]

你将在“输入源”下看到新添加的键盘布局。

![][6]

这与我之前在 [Ubuntu 中添加印地语键盘][7]时使用的方法相同。

### 步骤 2：切换键盘

这样，你就成功添加了另一个键盘。但它没有被使用。你必须在可用的输入源之间切换。

有两种方法可以做到这一点。

#### 方法 1：同时使用 Super+Space 键

将键盘切换为[在 Ubuntu 中使用键盘快捷键][8]的更快方法。同时按 Super 键（Windows 键）和空格键。它将立即显示所有启用的键盘布局。

![][9]

你可以在按住 Super 键的同时多次按 Space 键在可用选项之间移动。

#### 方法 2：使用鼠标切换键盘

记住所有这些键盘快捷键并不容易，这是可以理解的。

当你在系统上启用多个键盘时，你会注意到键盘名称显示在面板的右上角。单击它，你将看到在布局之间切换或查看所选键盘布局的选项。

![Switch between keyboard layouts][10]

### 额外提示：删除额外的键盘

不喜欢系统中的多个键盘？ 不用担心。你可以轻松删除它们。

如你之前所见，再次进入键盘设置。单击你选择的键盘旁边的三个垂直点符号。你应该在这里看到删除选项。

![][11]

### 使用命令行更改键盘布局（不推荐）

如果你是桌面用户，我强烈推荐上面讨论的图形方法。

如果你在服务器上并且必须使用其他键盘布局，则可以选择命令行。

现在，有多种方法可以更改 Linux 中的键盘布局。但对于 Ubuntu，我更喜欢 [dpkg][12] 方式。

````

     sudo dpkg-reconfigure keyboard-configuration

````

输入你的密码，你将在终端中看到：

![][13]

要在此 TUI（终端用户界面）中导航，请使用箭头键在可用选项之间移动。**使用 Tab 键转至 <OK> 或 <Cancel> 选项**。当你位于其中之一时，请按回车键确认你的选择。

选择你选择的国家/地区，然后你可以选择键盘布局。

![][14]

添加附加键盘后，系统会要求你分配键盘快捷键以在它们之间进行切换。

![][15]

你也可以将新键盘设置为系统中的默认布局和唯一布局。不过，如果你在不相似的语言之间执行此操作，这可能会存在风险。我的意思是，如果你使用英语美国键盘（物理）并将布局切换为匈牙利语，则你将无法使用所有按键。

之后你会看到几个屏幕。

如果你对新的键盘布局不满意，可以再次键入相同的命令，然后重新配置布局。

--------------------------------------------------------------------------------

via: https://itsfoss.com/ubuntu-change-keyboard/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/install-ubuntu/
[2]: https://itsfoss.com/content/images/2023/11/start-system-settings-ubuntu-1.png
[3]: https://itsfoss.com/content/images/2023/11/adding-new-keyboard-layout-ubuntu-1.png
[4]: https://itsfoss.com/content/images/2023/11/adding-keyboard-layout-1-1.png
[5]: https://itsfoss.com/content/images/2023/11/new-keyboard-layout-added-ubuntu-1.png
[6]: https://itsfoss.com/content/images/2023/11/multiple-keyboards-ubuntu.png
[7]: https://itsfoss.com/type-indian-languages-ubuntu/
[8]: https://itsfoss.com/ubuntu-shortcuts/
[9]: https://itsfoss.com/content/images/2023/11/switch-keyboard-layout-using-keyboard-shortcut-in-ubuntu.png
[10]: https://itsfoss.com/content/images/2023/11/switching-keyboard-layout-ubuntu-1.png
[11]: https://itsfoss.com/content/images/2023/11/remove-additional-keyboard-layout-ubuntu-1.png
[12]: https://wiki.debian.org/dpkg
[13]: https://itsfoss.com/content/images/2023/11/changing-keyboard-layout-ubuntu-command-line.png
[14]: https://itsfoss.com/content/images/2023/11/adding-keyboard-ubuntu-command-line-1.png
[15]: https://itsfoss.com/content/images/2023/11/keyboard-switch-option.png
