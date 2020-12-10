[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12198-1.html)
[#]: subject: (Using Files and Folders on Desktop Screen in Ubuntu)
[#]: via: (https://itsfoss.com/add-files-on-desktop-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

在 Ubuntu 桌面中使用文件和文件夹
======

![](https://img.linux.net.cn/data/attachment/album/202005/08/224609chff5qn5ccah56af.jpg)

> 此初学者教程讨论了 在Ubuntu 桌面上添加文件和文件夹时可能遇到的一些困难。

我认识一些习惯将所有重要/常用文件放在桌面上以便快速访问的人。

![][1]

我不喜欢杂乱的桌面，但是我可以想象它实际上可能对某些人有所帮助。

在过去的几个版本中，很难在 Ubuntu 的默认 GNOME 桌面上添加文件。这并不是 Ubuntu 的错。

[GNOME][2] 的开发者认为，桌面上没有图标和文件的存身之地。当你可以在菜单中轻松搜索文件时，无需将文件放在桌面上。这在部分情况下是事实。

这就是为什么 [GNOME 的文件管理器 Nautilus][3] 的较新版本不能很好地支持桌面上的图标和文件的原因。

也就是说，在桌面上添加文件和文件夹并非没有可能。让我告诉你如何做。

### 在 Ubuntu 的桌面上添加文件和文件夹

![][4]

我在本教程中使用的是 Ubuntu 20.04。对于其他 Ubuntu 版本，步骤可能会有所不同。

#### 将文件和文件夹添加到“桌面文件夹”

如果打开文件管理器，你应该在左侧边栏或文件夹列表中看到一个名为“桌面”的条目。此文件夹（以某种方式）代表你的桌面。

![Desktop folder can be used to add files to the desktop screen][5]

你添加到此文件夹的所有内容都会反映在桌面上。

![Anything added to the Desktop folder will be reflected on the desktop screen][6]

如果你从“桌面文件夹”中删除文件，那么文件也会从桌面中删除。

#### 将文件拖放到桌面不起作用

现在，如果你尝试从文件管理器往桌面上拖放文件，它会不起使用。这不是一个 bug，它是一个使很多人恼火的功能。

一种临时方案是打开两个文件管理器。在其中一个打开“桌面”文件夹，然后将文件拖放到该文件夹​​中，它们将被添加到桌面上。

我知道这并不理想，但是你没有太多选择。

#### 你不能使用 Ctrl+C 和 Ctrl+V 在桌面上复制粘贴，请使用右键单击菜单

更恼人的是，你不能使用 `Ctrl+V`（著名的键盘快捷键）将文件粘贴到桌面上。

但是，你仍然可以使用右键单击，然后选择“粘贴”，将文件复制到桌面上。你甚至可以通过这种方式创建新文件夹。

![Right click menu can be used for copy-pasting files to desktop][7]

是否有意义？对我来说不是，但这就是 Ubuntu 20.04 的方式。

#### 你无法使用 Delete 键删除文件和文件夹，请再次使用右键菜单

更糟糕的是，你无法使用 `Delete` 键或 `Shift+Delete` 键从桌面上删除文件。但是你仍然可以右键单击文件或文件夹，然后选择“移至回收站”来删除文件。

![Delete files from desktop using right click][8]

好了，你现在知道至少有一种方法可以在桌面上添加文件，但有一些限制。不幸的是，这还没有结束。

你无法在桌面上用名称搜索文件。通常，如果你开始输入 “abc”，那么以 “abc” 开头的文件会高亮显示。但是在这里不行。

我不知道为什么在桌面上添加文件受到了如此多的限制。值得庆幸的是，我不会经常使用它，否则我会感到非常沮丧。

如果有兴趣，你也可以阅读[在 Ubuntu 桌面上添加应用快捷方式][9]这篇文章。

--------------------------------------------------------------------------------

via: https://itsfoss.com/add-files-on-desktop-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/files-on-desktop-ubuntu.jpg?ssl=1
[2]: https://www.gnome.org/
[3]: https://wiki.gnome.org/Apps/Files
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/adding-files-desktop-ubuntu.png?ssl=1
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/desktop-folder-ubuntu.png?ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/adding-files-desktop-screen-ubuntu.jpg?ssl=1
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/adding-new-files-ubuntu-desktop.jpg?ssl=1
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/delete-files-from-desktop-ubuntu.jpg?ssl=1
[9]: https://itsfoss.com/ubuntu-desktop-shortcut/
