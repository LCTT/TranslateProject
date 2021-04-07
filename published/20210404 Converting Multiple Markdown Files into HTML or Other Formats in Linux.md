[#]: subject: "Converting Multiple Markdown Files into HTML or Other Formats in Linux"
[#]: via: "https://itsfoss.com/convert-markdown-files/"
[#]: author: "Bill Dyer https://itsfoss.com/author/bill/"
[#]: collector: "lujun9972"
[#]: translator: "lxbwolf"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13274-1.html"

在 Linux 中把多个 Markdown 文件转换成 HTML 或其他格式
======

![](https://img.linux.net.cn/data/attachment/album/202104/07/095441bztj6cz68j89568u.jpg)

很多时候我与 Markdown 打交道的方式是，先写完一个文件，然后把它转换成 HTML 或其他格式。也有些时候，需要创建一些新的文件。当我要写多个 Markdown 文件时，通常要把他们全部写完之后才转换它们。

我用 `pandoc` 来转换文件，它可以一次性地转换所有 Markdown 文件。

Markdown 格式的文件可以转换成 .html 文件，有时候我需要把它转换成其他格式，如 epub，这个时候 [pandoc][1] 就派上了用场。我更喜欢用命令行，因此本文我会首先介绍它，然而你还可以使用 [VSCodium][2] 在非命令行下完成转换。后面我也会介绍它。

### 使用 pandoc 把多个 Markdown 文件转换成其他格式（命令行方式）

你可以在 Ubuntu 及其他 Debian 系发行版本终端输入下面的命令来快速开始：

```
sudo apt-get install pandoc
```

本例中，在名为 `md_test` 目录下我有四个 Markdown 文件需要转换。

```
[email protected]:~/Documents/md_test$ ls -l *.md
-rw-r--r-- 1 bdyer bdyer 3374 Apr  7  2020 file01.md
-rw-r--r-- 1 bdyer bdyer  782 Apr  2 05:23 file02.md
-rw-r--r-- 1 bdyer bdyer 9257 Apr  2 05:21 file03.md
-rw-r--r-- 1 bdyer bdyer 9442 Apr  2 05:21 file04.md
[email protected]:~/Documents/md_test$
```

现在还没有 HTML 文件。现在我要对这些文件使用 `pandoc`。我会运行一行命令来实现：

  * 调用 `pandoc`
  * 读取 .md 文件并导出为 .html

下面是我要运行的命令：

```
for i in *.md ; do echo "$i" && pandoc -s $i -o $i.html ; done
```

如果你不太理解上面的命令中的 `;`，可以参考 [在 Linux 中一次执行多个命令][3]。

我执行命令后，运行结果如下：

```
[email protected]:~/Documents/md_test$ for i in *.md ; do echo "$i" && pandoc -s $i -o $i.html ; done
file01.md
file02.md
file03.md
file04.md
[email protected]:~/Documents/md_test$
```

让我再使用一次 `ls` 命令来看看是否已经生成了 HTML 文件:

```
[email protected]:~/Documents/md_test$ ls -l *.html
-rw-r--r-- 1 bdyer bdyer  4291 Apr  2 06:08 file01.md.html
-rw-r--r-- 1 bdyer bdyer  1781 Apr  2 06:08 file02.md.html
-rw-r--r-- 1 bdyer bdyer 10272 Apr  2 06:08 file03.md.html
-rw-r--r-- 1 bdyer bdyer 10502 Apr  2 06:08 file04.md.html
[email protected]:~/Documents/md_test$
```

转换很成功，现在你已经有了四个 HTML 文件，它们可以用在 Web 服务器上。

pandoc 功能相当多，你可以通过指定输出文件的扩展名来把 Markdown 文件转换成其他支持的格式。不难理解它为什么会被认为是[最好的写作开源工具][4]。

### 使用 VSCodium 把 Markdown 文件转换成 HTML（GUI 方式）

就像我们前面说的那样，我通常使用命令行，但是对于批量转换，我不会使用命令行，你也不必。VSCode 或 [VSCodium][7] 可以完成批量操作。你只需要安装一个 Markdown-All-in-One 扩展，就可以在一次运行中转换多个 Markdown 文件。

有两种方式安装这个扩展：

  * VSCodium 的终端
  * VSCodium 的插件管理器

通过 VSCodium 的终端安装该扩展：

  1. 点击菜单栏的 `终端`。会打开终端面板
  2. 输入，或[复制下面的命令并粘贴到终端][8]：

```
codium --install-extension yzhang.markdown-all-in-one
```

**注意**：如果你使用的 VSCode 而不是 VSCodium，那么请把上面命令中的 `codium` 替换为 `code`

![][9]

第二种安装方式是通过 VSCodium 的插件/扩展管理器：

  1. 点击 VSCodium 窗口左侧的块区域。会出现一个扩展列表，列表最上面有一个搜索框。
  2. 在搜索框中输入 “Markdown All in One”。在列表最上面会出现该扩展。点击 “安装” 按钮来安装它。如果你已经安装过，在安装按钮的位置会出现一个齿轮图标。

![][10]

安装完成后，你可以打开含有需要转换的 Markdown 文件的文件夹。

点击 VSCodium 窗口左侧的纸张图标。你可以选择文件夹。打开文件夹后，你需要打开至少一个文件。你也可以打开多个文件，但是最少打开一个。

当打开文件后，按下 `CTRL+SHIFT+P` 唤起命令面板。然后，在出现的搜索框中输入 `Markdown`。当你输入时，会出现一列 Markdown 相关的命令。其中有一个是 `Markdown All in One: Print documents to HTML` 命令。点击它：

![][11]

你需要选择一个文件夹来存放这些文件。它会自动创建一个 `out` 目录，转换后的 HTML 文件会存放在 `out` 目录下。从下面的图中可以看到，Markdown 文档被转换成了 HTML 文件。在这里，你可以打开、查看、编辑这些 HTML 文件。

![][12]

在等待转换 Markdown 文件时，你可以更多地集中精力在写作上。当你准备好时，你就可以把它们转换成 HTML —— 你可以通过两种方式转换它们。

--------------------------------------------------------------------------------

via: https://itsfoss.com/convert-markdown-files/

作者：[Bill Dyer][a]
选题：[lujun9972][b]
译者：[lxbwolf](https://github.com/lxbwolf)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/bill/
[b]: https://github.com/lujun9972
[1]: https://pandoc.org/
[2]: https://vscodium.com/
[3]: https://itsfoss.com/run-multiple-commands-linux/
[4]: https://itsfoss.com/open-source-tools-writers/
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2016/10/Best-Markdown-Editors-for-Linux.jpg?fit=800%2C450&ssl=1
[6]: https://itsfoss.com/best-markdown-editors-linux/
[7]: https://itsfoss.com/vscodium/
[8]: https://itsfoss.com/copy-paste-linux-terminal/
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/04/vscodium_terminal.jpg?resize=800%2C564&ssl=1
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/04/vscodium_extension_select.jpg?resize=800%2C564&ssl=1
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/04/vscodium_markdown_function_options.jpg?resize=800%2C564&ssl=1
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/04/vscodium_html_filelist_shown.jpg?resize=800%2C564&ssl=1
