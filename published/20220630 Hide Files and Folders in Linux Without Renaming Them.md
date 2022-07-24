[#]: subject: "Hide Files and Folders in Linux Without Renaming Them"
[#]: via: "https://itsfoss.com/hide-files-folders-linux/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lkxed"
[#]: translator: "hanszhao80"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14806-1.html"

在 Linux 中隐藏文件和文件夹的那些事
======

![](https://img.linux.net.cn/data/attachment/album/202207/08/142700yijbiw44bqfpfs4j.jpg)

> 这篇面向初学者的文章探讨了在 Linux 中如何在普通视图中隐藏文件和文件夹。图形用户界面和命令行方法都有所涉猎。

有时你需要在 Linux 中隐藏文件。

不要误会，我不是指那些你不想让你的家人看到的“特殊文件”。尽管你可以隐藏这些特殊文件，但更好的办法还是用密码锁定它们以提供额外的保护。

回到隐藏文件的话题。**名称以 `.` 开头的任何文件或文件夹在 Linux 中是“隐藏的”。**

Linux 有很多这样的文件和文件夹，在普通视图中它们是隐藏的。这些主要是系统和程序所需的配置文件。

用户通常不需要理会它们，因此它们在普通视图中是隐藏的，这样一来你就不会被许多看起来很奇怪的而不是你所创建的文件所淹没。

下图展示了我的主目录中隐藏的文件和文件夹。

![linux 普通视图][1]

![linux 显示隐藏文件][2]

如果你使用的是桌面版 Linux，你可以通过在文件管理器中按 `Ctrl+H` 快捷键来轻松 [查看隐藏文件][3]。在终端中，你可以使用 `ls -a` 命令显示隐藏文件和普通文件。

那么，如何在 Linux 中创建隐藏文件呢？你只需用一个在命名的时候加一个 `.` 前缀。就是这样。

### 在桌面版 Linux 里创建隐藏文件和文件夹（GUI 方法）

如果你使用的是文件管理器，在文件或文件夹上右键并选择重命名选项。现在你所要做的就是在文件名的开头添加一个 `.`。

当你以这种方式创建隐藏文件时，GNOME 的 Nautilus 文件管理器也会显示一个警告。

![ubuntu linux 隐藏文件][4]

你可以以相同的方式隐藏文件夹及其所有内容。

你可以按 `Ctrl+H` 键来显示隐藏文件。哦！我是多么的喜欢 [Ubuntu 中的键盘快捷键][5] 和我使用的任何其他程序或操作系统！

要使隐藏文件变回普通文件，只需再次重命名这些文件删掉文件名前缀的 `.` 即可。

### 在 Linux 终端创建隐藏文件和文件夹（CLI 方法）

如果你热衷于终端，你可以 [使用 mv 命令][6] 重命名文件。你只需在原始文件名的开头添加一个 `.`。

```
mv filename .filename
```

你可以使用以下命令显示隐藏文件：

```
ls -la
```

你也可以使用 `ls -lA`。这条命令不会显示点文件（`.` 和 `..`）。

### 额外提示：用非重命名的方法隐藏文件和文件夹（仅适用于 GUI）

你刚刚学了在 Linux 中隐藏文件。问题是你必须重命名文件，而这种操作不适用于所有的场合。

例如，在 Ubuntu 中，你会在目录中看到一个名为 `snap` 的文件夹。你不会使用它，但如果重命名它，你的 Snap 应用程序将无法按预期工作。类似的情况是，在 Ubuntu 22.04（安装有 Snap 版本的 Firefox）的 `Downloads` 目录下有一个 `firefox.tmp` 文件夹。

有一个巧妙的技巧可以在 Linux 桌面中使用。它应该可以在 Nemo、Thunar、Dolphin 等各种文件管理器下工作，但我不能保证。它确实适用于 GNOME 的 Nautilus 文件管理器。

因此，你在这里所做的是在你想要隐藏的文件或文件所在的目录中创建一个名为 `.hidden` 的新文件。

![在 Linux 中隐藏文件的另一种方法][7]

按 `Ctrl+H` 显示隐藏文件并 **打开 `.hidden` 文件** 进行编辑。**在单独的行中添加文件或文件夹的名称**。注意不能使用绝对或相对路径。你想要隐藏的 **文件和文件夹应与此特殊 `.hidden` 文件** 位于同一路径下。

这是我以不重命名的方式隐藏 `cpufetch` 目录和 `pcloud` 文件的示例：

```
pcloud
cpufetch
```

按 `Ctrl+H` 以再次隐藏 `.hidden` 文件。

现在，**关闭你的文件资源管理器并重新启动它**。你将不会再看到 `.hidden` 文件中提到的文件和目录。

如果你想再次查看它们，请按 `Ctrl+H` 键。

如果你不想再隐藏文件，请从 `.hidden` 文件中删除其名称或完全删除 `.hidden` 文件。

### 额外琐事：隐藏文件“功能”实际上是一个 bug

你知道吗？在文件名的开头添加一个 `.` 来隐藏文件的“功能” [实际上是一个 bug][8]？

在早期的 UNIX 时代，当创建文件系统时，添加了 `.`（当前目录）和 `..`（父目录）文件以方便导航。

由于这些特殊的 `.` 和 `..` 文件中没有实际数据，因此给 `ls` 命令添加了一个新的“功能”：该功能是检查文件名的第一个字符，如果它是一个点（`.`），则不再使用 `ls` 命令显示它。

这对隐藏 `.` 和 `..` 文件有效，但它引入了一个 “bug”：`ls` 命令的输出会隐藏任何文件名以 `.` 开头的文件。

这个 bug 变成了一个功能，因为程序员喜欢它来“隐藏”他们的配置文件。`ls` 命令可能是后来修改添加了一个显示隐藏点文件的选项。

Linux 遵循相同的约定，因为 Linux 是以 UNIX 为原型开发的。

### 结论

我讨论了如何从普通视图中创建隐藏文件。如果要创建让其他人无法访问的机密文件或文件夹，则应对其进行加密。我曾经写过 [在 Linux 中使用密码锁定文件夹][9]。这是一篇有点儿旧的文章，但它可能仍然有效。

我希望你喜欢这个简单的话题并学到新的东西。发布你的评论让我知道你的想法吧。

--------------------------------------------------------------------------------

via: https://itsfoss.com/hide-files-folders-linux/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[hanszhao80](https://github.com/hanszhao80)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/wp-content/uploads/2022/06/linux-normal-view.png
[2]: https://itsfoss.com/wp-content/uploads/2022/06/linux-show-hiiden-files.png
[3]: https://itsfoss.com/hide-folders-and-show-hidden-files-in-ubuntu-beginner-trick/
[4]: https://itsfoss.com/wp-content/uploads/2022/06/hide-files-ubuntu-linux.png
[5]: https://itsfoss.com/ubuntu-shortcuts/
[6]: https://linuxhandbook.com/mv-command/
[7]: https://itsfoss.com/wp-content/uploads/2022/06/alternate-way-of-hiding-files-in-linux.png
[8]: https://linux-audit.com/linux-history-how-dot-files-became-hidden-files/
[9]: https://itsfoss.com/password-protect-folder-linux/
