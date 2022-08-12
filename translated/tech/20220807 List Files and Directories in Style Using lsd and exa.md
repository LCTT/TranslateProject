[#]: subject: "List Files and Directories in Style Using lsd and exa"
[#]: via: "https://www.debugpoint.com/list-files-directories-style/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

使用 lsd 和 exa 以样式列出文件和目录
======
使用两个 ls 程序： lsd 和 exa 来重新想象和设计你的文件和目录列表。

![][0]

Linux 中的 ls 命令是最常用的命令。此命令列出终端中的文件和目录。因此，如你所见，它非常流行，也许每个人都在使用。

但该命令输出的信息量很大，有时用彩色的方式查看它们会更方便。

例如，如果你以最基本的方式运行 ls 命令，它应该看起来有点像这样。

![The default list files and directories view via ls command][1]

这似乎有点乏味，不是吗？如果你可以对其进行一些样式设置，以便在看起来不错的同时变得更具可读性如何？

### 以样式列出文件和目录

#### lsd

我想向你展示的第一个应用叫做 “lsd”，也就是 “LSDeluxe”。它是对 GNU `ls` 命令的重写，具有列标题、各种项目的颜色、字体和图标支持等附加功能。

这是安装后的样子。

```
lsd -l --header
```

![lsd command showing list of files][2]

正如你所看到的，它看起来非常漂亮，用不同的颜色代码表示权限、文件类型和文件夹，甚至在文件名旁边添加图标。

该应用充满了诸如树视图（见下文）之类的功能，它甚至可以在单个命令中为你提供文件夹内的文件列表。

```
lsd -l --header --tree
```

![lsd command showing a tree view][3]

你可以在[官方 GitHub 页面][4]上了解有关其功能的更多信息。

我相信你很兴奋。让我们看看如何安装它。

你可以从此处下载用于 Ubuntu 和相关发行版的 deb 文件。之后，只需运行 dpkg 即可安装。

```
sudo dpkg -i lsd_vvvv_amd64.deb
```

对于 Fedora Linux，使用以下命令。

```
sudo dnf install lsd
```

Arch Linux 用户可以使用以下命令获取它。

```
pacman -S lsd
```

该应用也可用于其他发行版、macOS、BSD 和 Windows。对于这些说明，你可以[在此处找到它们][5]。

为了获得更好的体验，请将其与[装有 Oh My Zsh 的 Zsh shell][6] 一起使用。

#### exa

下一个程序是 `exa`，类似于 `lsd` 但具有更多功能。 `exa` 命令可以为你的 ls 输出着色，检测 Unix 系统中的各种文件类型、标题、树视图等更多功能。

Exa 是一个单一的二进制文件，占用的资源很小。以下是一些示例命令。

```
exa -al
```

```
exa -abghHliS
```

```
exa -abghHliS --long --tree
```

![Various exa commands][7]

你可以在 [GitHub][8] 上了解有关 exa 参数和选项的更多信息。

exa 的安装很简单，只需要一个命令。对于 Ubuntu 和相关发行版，你可以使用以下命令安装它。

```
sudo apt install exa
```

对于 Fedora 和 Arch Linux，分别使用以下命令。

```
sudo dnf install exa
```

```
pacman -S exa
```

同样，各种操作系统的所有其他安装说明都可以[在此处找到][9]。

### 从终端复制为 HTML

一个有趣的技巧是，以上所有彩色列表都可以通过默认的 Ubuntu 终端复制为 HTML。你可以将它用于你的网页或文档。

例如，我将上面的示例复制到 LibreOffice Writer 文档中。

它是最好的功能之一，尽管它取决于终端程序而不是上面的程序。

![Exporting the command output as HTML][10]

### 总结

我解释了两个程序的内部工作 – ls 和 exa 以样式列出文件和目录。我希望你能将它们用于不同的需求。

如果你喜欢它们，或者如果你知道任何此类程序，请在评论栏中告诉我。

干杯。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/list-files-directories-style/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[0]: https://www.debugpoint.com/wp-content/uploads/2022/08/cool-ls.jpg
[1]: https://www.debugpoint.com/wp-content/uploads/2022/08/The-default-list-files-and-directories-view-via-ls-command.jpg
[2]: https://www.debugpoint.com/wp-content/uploads/2022/08/lsd-command-showing-list-of-files-2.jpg
[3]: https://www.debugpoint.com/wp-content/uploads/2022/08/lsd-command-showing-a-tree-view.jpg
[4]: https://github.com/Peltoche/lsd
[5]: https://github.com/Peltoche/lsd#installation
[6]: https://www.debugpoint.com/install-use-zsh/
[7]: https://www.debugpoint.com/wp-content/uploads/2022/08/Various-exa-commands.jpg
[8]: https://github.com/ogham/exa#command-line-options
[9]: https://github.com/ogham/exa#installation
[10]: https://www.debugpoint.com/wp-content/uploads/2022/08/Exporting-the-command-output-as-HTML.jpg
