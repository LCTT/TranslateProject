[#]: subject: (How to archive files on FreeDOS)
[#]: via: (https://opensource.com/article/21/6/archive-files-freedos)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13567-1.html)

如何在 FreeDOS 上归档文件
======

> 虽然有一个 FreeDOS 版的 tar，但 DOS 上事实上的标准归档工具是 Zip 和 Unzip。

![](https://img.linux.net.cn/data/attachment/album/202107/10/063340wp088ozz1fo9f1e1.jpg)

在 Linux 上，你可能熟悉标准的 Unix 归档命令：`tar`。FreeDOS 上也有 `tar` 的版本（还有其他一些流行的归档程序），但 DOS 上事实上的标准归档程序是 Zip 和 Unzip。Zip 和 Unzip 都默认安装在 FreeDOS 1.3 RC4 中。

Zip 文件格式最初是由 PKWARE 的 Phil Katz 在 1989 年为 PKZIP 和 PKUNZIP 这对 DOS 归档工具构思的。Katz 将 Zip 文件的规范作为一个开放标准发布，因此任何人都可以创建 Zip 档案。作为开放规范的结果，Zip 成为 DOS 上的一个标准归档格式。[Info-ZIP][2] 项目实现了一套开源的 `ZIP` 和 `UNZIP` 程序。

### 对文件和目录进行压缩

你可以在 DOS 命令行中使用 `ZIP` 来创建文件和目录的归档。这是一个方便的方法，可以为你的工作做一个备份，或者发布一个“包”，在未来的 FreeDOS 发布中使用。例如，假设我想为我的项目源码做一个备份，其中包含这些源文件：

![dir][3]

*我想把这些文件归档*

`ZIP` 有大量的命令行选项来做不同的事情，但我最常使用的命令行选项是 `-r` 来处理目录和子目录 _递归_，以及使用 `-9` 来提供可能的最大压缩。`ZIP` 和 `UNZIP` 使用类似 Unix 的命令行，所以你可以在破折号后面组合选项：`-9r` 将提供最大压缩并在 Zip 文件中包括子目录。

![zip][5]

*压缩一个目录树*

在我的例子中，`ZIP` 能够将我的源文件从大约 33KB 压缩到大约 22KB，为我节省了 11KB 的宝贵磁盘空间。你可能会得到不同的压缩率，这取决于你给 `ZIP` 的选项，或者你想在 Zip 文件中存储什么文件（以及有多少）。一般来说，非常长的文本文件（如源码）会产生良好的压缩效果，而非常小的文本文件（如只有几行的 DOS “批处理”文件）通常太短，无法很好地压缩。

### 解压文件和目录

将文件保存到 Zip 文件中是很好的，但你最终会需要将这些文件解压到某个地方。让我们首先检查一下我们刚刚创建的 Zip 文件里有什么。为此，使用 `UNZIP `命令。你可以在 `UNZIP`中使用一堆不同的选项，但我发现我只使用几个常用的选项。

要列出一个 Zip 文件的内容，使用 `-l` （“list”） 选项。

![unzip -l][6]

*用 unzip 列出归档文件的内容*

该输出允让我看到 Zip 文件中的 14 个条目：13 个文件加上 `SRC` 目录。

如果我想提取整个 Zip 文件，我可以直接使用 `UNZIP` 命令并提供 Zip 文件作为命令行选项。这样就可以从我当前的工作目录开始提取 Zip 文件了。除非我正在恢复某个东西的先前版本，否则我通常不想覆盖我当前的文件。在这种情况下，我希望将 Zip 文件解压到一个新的目录。你可以用 `-d` （“destination”） 命令行选项指定目标路径。

![unzip -d temp][7]

*你可以用 -d 来解压到目标路径*

有时我想从一个 Zip 文件中提取一个文件。在这个例子中，假设我想提取一个 DOS 可执行程序 `TEST.EXE`。要提取单个文件，你要指定你想提取的 Zip 文件的完整路径。默认情况下，`UNZIP` 将使用 Zip 文件中提供的路径解压该文件。要省略路径信息，你可以添加 `-j`（“junk the path”） 选项。

你也可以组合选项。让我们从 Zip 文件中提取 `SRC\TEST.EXE` 程序，但省略完整路径并将其保存在 `TEMP` 目录下：

![unzip -j][8]

*unzip 组合选项*

因为 Zip 文件是一个开放的标准，所以我们会今天继续看到 Zip 文件。每个 Linux 发行版都可以通过 Info-ZIP 程序支持 Zip 文件。你的 Linux 文件管理器可能也支持 Zip 文件。在 GNOME 文件管理器中，你应该可以右击一个文件夹并从下拉菜单中选择“压缩”。你可以选择创建一个包括 Zip 文件在内的新的归档文件。

创建和管理 Zip 文件是任何 DOS 用户的一项关键技能。你可以在 Info-ZIP 网站上了解更多关于 `ZIP` 和 `UNZIP` 的信息，或者在命令行上使用 `h`（“帮助”）选项来打印选项列表。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/archive-files-freedos

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/files_documents_organize_letter.png?itok=GTtiiabr (Filing cabinet for organization)
[2]: http://infozip.sourceforge.net/
[3]: https://opensource.com/sites/default/files/uploads/dir.png (I'd like to archive these files)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://opensource.com/sites/default/files/uploads/zip-9r.png (Zipping a directory tree)
[6]: https://opensource.com/sites/default/files/uploads/unzip-l.png (Listing the archive file contents with unzip)
[7]: https://opensource.com/sites/default/files/uploads/unzip-d.png (You can unzip into a destination path with -d)
[8]: https://opensource.com/sites/default/files/uploads/unzip-j.png (Combining options with unzip)
