Bat：一种具有语法高亮和 Git 集成的 Cat 类命令
======

![](https://www.ostechnix.com/wp-content/uploads/2018/08/Bat-command-720x340.png)

在类 UNIX 系统中，我们使用 `cat` 命令去打印和连接文件。使用 `cat` 命令，我们能将文件目录打印到到标准输出，合成几个文件为一个目标文件，还有追加几个文件到目标文件中。今天，我偶然发现一个具有相似作用的命令叫做 “Bat” ，它是 `cat` 命令的一个克隆版，具有一些例如语法高亮、 Git 集成和自动分页等非常酷的特性。在这个简略指南中，我们将讲述如何在 Linux 中安装和使用 `bat` 命令。

### 安装

Bat 可以在 Arch Linux 的默认软件源中获取。 所以你可以使用 `pacman` 命令在任何基于 arch 的系统上来安装它。

```
$ sudo pacman -S bat
```

在 Debian、Ubuntu、Linux Mint 等系统中，从其[发布页面][1]下载 **.deb** 文件，然后用下面的命令来安装。

```
$ sudo apt install gdebi
$ sudo gdebi bat_0.5.0_amd64.deb
```

对于其他系统，你也许需要从软件源编译并安装。确保你已经安装了 Rust 1.26 或者更高版本。

然后运行以下命令来安装 Bat：

```
$ cargo install bat
```

或者，你可以从 [Linuxbrew][2] 软件包管理中来安装它。

```
$ brew install bat
```

### bat 命令的使用

`bat` 命令的使用与 `cat` 命令的使用非常相似。

使用 `bat` 命令创建一个新的文件:

```
$ bat > file.txt
```

使用 `bat` 命令来查看文件内容，只需要:

```
$ bat file.txt
```

你能同时查看多个文件:

```
$ bat file1.txt file2.txt
```

将多个文件的内容合并至一个单独文件中:

```
$ bat file1.txt file2.txt file3.txt > document.txt
```

就像我之前提到的那样，除了浏览和编辑文件以外，`bat` 命令有一些非常酷的特性。

`bat` 命令支持大多数编程和标记语言的<ruby>语法高亮<rt>syntax highlighting</rt></ruby>。比如，下面这个例子。我将使用 `cat` 和 `bat` 命令来展示 `reverse.py` 的内容。

![](https://www.ostechnix.com/wp-content/uploads/2018/08/bat-and-cat-command-output-comparison.png)

你注意到区别了吗？ `cat` 命令以纯文本格式显示文件的内容，而 `bat` 命令显示了语法高亮和整齐的文本对齐格式。更好了不是吗？

如果你只想显示行号（而没有表格）使用 `-n` 标记。

```
$ bat -n reverse.py
```

![](https://www.ostechnix.com/wp-content/uploads/2018/08/bat-command-output-3.png)

另一个 `bat` 命令中值得注意的特性是它支持<ruby>自动分页<rt>automatic paging</rt></ruby>。 它的意思是当文件的输出对于屏幕来说太大的时候，`bat` 命令自动将自己的输出内容传输到 `less` 命令中，所以你可以一页一页的查看输出内容。

让我给你看一个例子，使用 `cat` 命令查看跨多个页面的文件的内容时，提示符会快速跳至文件的最后一页，你看不到内容的开头和中间部分。

看一下下面的输出：

![](https://www.ostechnix.com/wp-content/uploads/2018/08/cat-command-output.png)

正如你所看到的，`cat` 命令显示了文章的最后一页。

所以你也许需要去将使用 `cat` 命令的输出传输到 `less` 命令中去从开头一页一页的查看内容。

```
$ cat reverse.py | less
```

现在你可以使用回车键去一页一页的查看输出。然而当你使用 `bat` 命令时这些都是不必要的。`bat` 命令将自动传输跨越多个页面的文件的输出。

```
$ bat reverse.py
```

![](https://www.ostechnix.com/wp-content/uploads/2018/08/bat-command-output-1.png)

现在按下回车键去往下一页。

`bat` 命令也支持 <ruby>Git 集成<rt>**GIT integration**</rt></ruby>，这样您就可以轻松查看/编辑 Git 存储库中的文件。 它与 Git 连接可以显示关于索引的修改。（看左栏）

![](https://www.ostechnix.com/wp-content/uploads/2018/08/bat-command-output-2.png)

### 定制 Bat

如果你不喜欢默认主题，你也可以修改它。Bat 同样有修改它的选项。

若要显示可用主题，只需运行：

```
$ bat --list-themes
1337
DarkNeon
Default
GitHub
Monokai Extended
Monokai Extended Bright
Monokai Extended Light
Monokai Extended Origin
TwoDark
```


要使用其他主题，例如 TwoDark，请运行：

```
$ bat --theme=TwoDark file.txt
```

如果你想永久改变主题，在你的 shells 启动文件中加入 `export BAT_THEME="TwoDark"`。

`bat` 还可以选择修改输出的外观。使用 `--style` 选项来修改输出外观。仅显示 Git 的更改和行号但不显示网格和文件头，请使用 `--style=numbers,changes`。

更多详细信息，请参阅 Bat 项目的 GitHub 库（链接在文末）。

最好，这就是目前的全部内容了。希望这篇文章会帮到你。更多精彩文章即将到来，敬请关注！

干杯！


--------------------------------------------------------------------------------

via: https://www.ostechnix.com/bat-a-cat-clone-with-syntax-highlighting-and-git-integration/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[z52527](https://github.com/z52527)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://github.com/sharkdp/bat/releases
[2]:https://www.ostechnix.com/linuxbrew-common-package-manager-linux-mac-os-x/
