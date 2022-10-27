[#]: collector: (lujun9972)
[#]: translator: (qfzy1233)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13005-1.html)
[#]: subject: (Search, Study And Practice Linux Commands On The Fly!)
[#]: via: (https://www.ostechnix.com/search-study-and-practice-linux-commands-on-the-fly/)
[#]: author: (SK https://www.ostechnix.com/author/sk/)

光速！搜索、学习和实践 Linux 命令！！
======

![](https://www.ostechnix.com/wp-content/uploads/2019/01/tldr-720x340.png)

这一标题可能看起来很粗略且吸睛。请允许我解释一下我在本教程中将要阐释的内容。假设你想下载一个压缩文件，将其解压缩，并从命令行中将文件从一个位置移动到另一个位置。根据上面的场景，我们可能需要至少三个 Linux 命令，一个用于下载文件，一个用于提取下载的文件，一个用于移动文件。如果你是中高级 Linux 用户，你可以通过[一行命令][16]或脚本在几秒钟/分钟内轻松完成这一任务。但是，如果你是一个不懂得太多 Linux 命令的菜鸟你可能就需要一些帮助了。

当然，谷歌的快速搜索可能会找到很多结果。或者，你可以使用 [手册页][1]。但是有些手册页实在很长，很全面，但缺少有用的示例。当你在特定的标志/选项上寻找特定的信息时，你可能需要向下检索相当长的时间。值得庆幸的是，有一些 [好的手册页替代品][2]，它们主要关注于实用的命令。一个很好的选择是 **TLDR 手册**。使用 TLDR 手册，我们可以通过实际示例快速轻松地学习一个 Linux 命令。要使用 TLDR 手册，我们需要 TLDR 客户端。有很多客户。今天我们就来了解一个这样的客户端，名为 **“Tldr++”**。

Tldr++ 是一个快速和交互式的 Tldr 客户端，用 **Go** 编程语言编写。与其他 Tldr 客户端不同，它是完全交互式的。这意味着，你可以选择一个命令，读取所有示例，并立即运行任何命令，而不必在终端中重新键入或复制/粘贴每个命令。还是不明白？没有问题。请继续阅读，以便动态学习和实践 Linux 命令。

### 安装 Tldr++

安装 Tldr++ 非常简单。从 [发布页面][3] 下载 Tldr++ 最新版本。解压它并将 Tldr++ 二进制文件移动到你的 `$PATH` 中。

```
$ wget https://github.com/isacikgoz/tldr/releases/download/v0.5.0/tldr_0.5.0_linux_amd64.tar.gz
$ tar xzf tldr_0.5.0_linux_amd64.tar.gz
$ sudo mv tldr /usr/local/bin
$ sudo chmod +x /usr/local/bin/tldr
```

现在，运行 `tldr` 二进制代码将 TLDR 手册部署到本地系统中。

```
$ tldr
```

示例输出：

```
Enumerating objects: 6, done.
Counting objects: 100% (6/6), done.
Compressing objects: 100% (6/6), done.
Total 18157 (delta 0), reused 3 (delta 0), pack-reused 18151
Successfully cloned into: /home/sk/.local/share/tldr
```

![](https://www.ostechnix.com/wp-content/uploads/2019/01/tldr-2.png)

Tldr++ 可以在 AUR 中使用。如果你使用 Arch Linux 上，你可以使用任何 AUR 助手来安装它，例如 [YaY][4]。确保你已经从系统中删除了任何现有的 TLDR 客户端，并运行以下命令安装 Tldr++。

```
$ yay -S tldr++
```

或者，你也可以像下面描述的那样从源代码进行编译。因为 Tldr++ 是用 Go 语言编写的，所以请确保你 Linux 系统中已经安装了 Go 语言。如果还没有安装，请参考下面的指南。

- [如何在 Linux 系统中安装 Go 语言](https://www.ostechnix.com/install-go-language-linux/)

在安装好 Go 语言之后, 运行以下的命令来安装 Tldr++。

```
$ go get -u github.com/isacikgoz/tldr
```

该命令在当前工作目录中下载 `tldr` 代码库中的内容并存储到 `go` 文件夹中。 

现在，运行 `tldr` 二进制代码将 TLDR 手册部署到本地系统中。

```
$ go/bin/tldr
```

示例输出：

![][6]

最后，将 `tldr` 二进制文件复制到你的路径中。

```
$ sudo mv tldr /usr/local/bin
```

现在是时候看一些例子了。

### Tldr++ 用法

输入不带任何选项的 `tldr` 命令，以字母顺序显示所有命令示例。

![][7]

使用 **向上/向下箭头** 来浏览命令，键入任何字母来搜索或键入命令名称来查看相应命令的示例。 `?` 以浏览更多消息，按 `Ctrl+c` 返回/退出。

要显示特定命令的示例命令，例如 `apt`，可以这样做:

```
$ tldr apt
```

![][8]

从列表中选择任意示例命令并按回车键。在选定的命令前会看到一个 `*` 符号。例如，我选择第一个命令即 `sudo apt update`。现在，它会问你是否继续。如果命令正确，只需键入 `y` 继续，并输入 `sudo` 密码运行所选命令。

![][9]

看到了吗？你不需要在终端中复制/粘贴或键入实际的命令。只需从列表中选择它，并极速运行！

Tldr 手册中有数百个 Linux 命令示例。你可以每天选择一个或两个命令，并彻底学习它们。每天坚持这样的练习，尽可能多的掌握。

### 使用 Tldr++ 动态学习和实践 Linux 命令

现在回到我在第一段中提到的场景。你需要下载一个文件，将其解压缩并将其移动到不同的位置，并使其可执行。让我们看看如何使用 Tldr++ 客户端进行交互。

#### 第一步 – 从网上下载文件

要使用命令行下载文件，我们主要使用 `curl` 或 `wget` 命令。让我使用 `wget` 下载文件。要打开 `wget` 命令的 TLDR 页面，只需执行以下命令：

```
$ tldr wget
```

下面是 `wget` 命令的示例。

![](https://www.ostechnix.com/wp-content/uploads/2019/01/wget-tldr.png)

你可以使用 **向上/向下箭头** 来浏览命令列表。一旦你选择了你所选择的命令，按回车键。这里我选择了第一个命令。

现在，输入路径来下载文件。

![](https://www.ostechnix.com/wp-content/uploads/2019/01/tldr-3.png)

然后将要求你确认该命令是否正确。如果命令正确，只需键入 `yes` 或 `y` 就可以开始下载文件。

![][10]

我们已经下载了文件。让我们继续解压这个文件。

#### 第二步 – 解压已下载的文件

我们下载了 tar.gz 文件。所以我将打开 TLDR 手册的 `tar` 页面。

```
$ tldr tar
```

你将看到示例命令列表。浏览这些示例，找出哪个命令适合提取 tar.gz（gzip 格式）文件，按回车键。在我们的例子中，它是第三个命令。

![][11]

现在，系统将提示你输入 tar.gz 文件的路径。只需输入路径并按回车键。Tldr++ 支持智能文件提示。这意味着它会在你键入时自动补全文件名。只需按 `TAB` 键自动完成。

![][12]

如果将文件下载到其他位置，只需键入完整路径，例如 `/home/sk/Downloads/tldr_0.5.0_linux_amd64.tar.gz`。

输入要解压的文件的路径后，按回车键，然后输入 `y` 进行确认。

![][13]

#### 第三步 – 将文件从一个目录移动到另一个目录

我们解压了文件。现在我们需要将文件移动到另一个位置。为了将文件从一个位置移动到另一个位置，我们使用 `mv` 命令。所以，让我们打开 TLDR 手册的 `mv` 命令。

```
$ tldr mv
```

选择正确的命令将文件从一个位置移动到另一个位置。在我们的例子中，第一个命令可以工作，所以让我们选中它。

![][14]

输入要移动的文件路径，并输入目标路径并按回车键。

![][15]

**附注：** 输入 `y!` 或 `yes!` 来以 `sudo` 权限运行命令。

正如你在上面的截图中看到的，我将名为 ``tldr` 的文件移动到 `/usr/local/bin/`。

要了解更多细节，请参考项目最后给出的 GitHub 页面。


### 总结

别误会，毫无疑问 **手册页** 是伟大的！但是，正如我已经说过的，许多手册页都很全面，缺少有用的示例。我不可能记住带有复杂标志的冗长的所有命令。有时，我花了很多时间在手册页上，却还是一窍不通。Tldr 手册帮助我在几分钟内找到了我需要的东西。而且，我们偶尔会使用一些命令，然后就会完全忘记它们。另一方面，Tldr 手册实际上在使用那些使用率很低的命令时很有帮助。Tldr++ 客户端通过智能的用户交互使这个任务变得更容易。试试吧，在下面的评论区告诉我们你对这个工具的看法。

以上，更多的好的分享将会陆续推出，请继续保持关注！

祝好!

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/search-study-and-practice-linux-commands-on-the-fly/

作者：[SK][a]
选题：[lujun9972][b]
译者：[qfzy1233](https://github.com/qfzy1233)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/learn-use-man-pages-efficiently/
[2]: https://www.ostechnix.com/3-good-alternatives-man-pages-every-linux-user-know/
[3]: https://github.com/isacikgoz/tldr/releases
[4]: https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/
[5]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[6]: http://www.ostechnix.com/wp-content/uploads/2019/01/tldr-1.png
[7]: http://www.ostechnix.com/wp-content/uploads/2019/01/tldr-11.png
[8]: http://www.ostechnix.com/wp-content/uploads/2019/01/tldr-12.png
[9]: http://www.ostechnix.com/wp-content/uploads/2019/01/tldr-13.png
[10]: http://www.ostechnix.com/wp-content/uploads/2019/01/tldr-4.png
[11]: http://www.ostechnix.com/wp-content/uploads/2019/01/tldr-6.png
[12]: http://www.ostechnix.com/wp-content/uploads/2019/01/tldr-7.png
[13]: http://www.ostechnix.com/wp-content/uploads/2019/01/tldr-8.png
[14]: http://www.ostechnix.com/wp-content/uploads/2019/01/tldr-9.png
[15]: http://www.ostechnix.com/wp-content/uploads/2019/01/tldr-10.png
[16]: https://ostechnix.com/random-one-liner-linux-commands-part-1/