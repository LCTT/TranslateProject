[#]: subject: "How to use the Linux sed command"
[#]: via: "https://opensource.com/article/21/3/sed-cheat-sheet"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "MjSeven"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13417-1.html"

使用 sed 命令进行复制、剪切和粘贴
======

> 了解 sed 的基本用法，然后下载我们的备忘单，方便快速地参考 Linux 流编辑器。

![](https://img.linux.net.cn/data/attachment/album/202105/23/181625abgrg4dsbw4y4fue.jpg)

很少有 Unix 命令像 `sed`、[grep][2] 和 [awk][3] 一样出名，它们经常组合在一起，可能是因为它们具有奇怪的名称和强大的文本解析能力。它们还在一些语法和逻辑上有相似之处。虽然它们都能用于文本解析，但都有其特殊性。本文研究 `sed` 命令，它是一个 <ruby>流编辑器<rt>stream editor</rt></ruby>。

我之前写过关于 [sed][4] 以及它的远亲 [ed][5] 的文章。要熟悉 `sed`，对 `ed` 有一点了解是有帮助的，因为这有助于你熟悉缓冲区的概念。本文假定你熟悉 `sed` 的基本知识，这意味着你至少已经运行过经典的 `s/foo/bar` 风格的查找和替换命令。

- 下载我们的免费 [sed 备忘录][6]
 
### 安装 sed

如果你使用的是 Linux、BSD 或 macOS，那么它们已经安装了 GNU 的或 BSD 的 sed。这些是原始 `sed` 命令的独特重新实现。虽然它们很相似，但也有一些细微的差别。本文已经在 Linux 和 NetBSD 版本上进行了测试，所以你可以使用你的计算机上找到的任何 sed，但是对于 BSD sed，你必须使用短选项（例如 `-n` 而不是 `--quiet`）。

GNU sed 通常被认为是功能最丰富的 sed，因此无论你是否运行 Linux，你可能都想要尝试一下。如果在 Ports 树中找不到 GNU sed（在非 Linux 系统上通常称为 gsed），你可以从 GNU 网站 [下载源代码][7]。 安装 GNU sed 的好处是，你可以使用它的额外功能，但是如果需要可移植性，还可以限制它以遵守 sed 的 [POSIX][8] 规范。

MacOS 用户可以在 [MacPorts][9] 或 [Homebrew][10] 上找到 GNU sed。

在 Windows 上，你可以通过 [Chocolatey][12]  来 [安装 GNU sed][11]。

### 了解模式空间和保留空间

sed 一次只能处理一行。因为它没有可视化模式，所以会创建一个 <ruby>模式空间<rt>pattern space</rt></ruby>，这是一个内存空间，其中包含来自输入流的当前行（删除了尾部的任何换行符）。填充模式空间后，sed 将执行你的指令。当命令执行完时，sed 将模式空间中的内容打印到输出流，默认是 **标准输出**，但是可以将输出重定向到文件，甚至使用 `--in-place=.bak` 选项重定向到同一文件。

然后，循环从下一个输入行再次开始。

为了在遍历文件时提供一点灵活性，sed 还提供了<ruby>保留空间<rt>hold space</rt></ruby>（有时也称为 <ruby>保留缓冲区<rt>hold buffer</rt></ruby>），即 sed 内存中为临时数据存储保留的空间。你可以将保留空间当作剪贴板，实际上，这正是本文所演示的内容：如何使用 sed 复制/剪切和粘贴。

首先，创建一个示例文本文件，其内容如下：

```
Line one
Line three
Line two
```

### 复制数据到保留空间

要将内容放置在 sed 的保留空间，使用 `h` 或 `H` 命令。小写的 `h` 告诉 sed 覆盖保留空间中的当前内容，而大写的 `H` 告诉 sed 将数据追加到保留空间中已经存在的内容之后。

单独使用，什么都看不到：

```
$ sed --quiet -e '/three/ h' example.txt
$
```

`--quiet`（缩写为 `-n`）选项禁止显示所有输出，但 sed 执行了我的搜索需求。在这种情况下，sed 选择包含字符串 `three` 的任何行，并将其复制到保留空间。我没有告诉 sed 打印任何东西，所以没有输出。

### 从保留空间复制数据

要了解保留空间，你可以从保留空间复制内容，然后使用 `g` 命令将其放入模式空间，观察会发生什么：

```
$ sed -n -e '/three/h' -e 'g;p' example.txt

Line three
Line three
```

第一个空白行是因为当 sed 第一次复制内容到模式空间时，保留空间为空。

接下来的两行包含 `Line three` 是因为这是从第二行开始的保留空间。

该命令使用两个唯一的脚本（`-e`）纯粹是为了帮助提高可读性和组织性。将步骤划分为单独的脚本可能会很有用，但是从技术上讲，以下命令与一个脚本语句一样有效：

```
$ sed -n -e '/three/h ; g ; p' example.txt

Line three
Line three
```

### 将数据追加到模式空间

`G` 命令会将一个换行符和保留空间的内容添加到模式空间。

```
$ sed -n -e '/three/h' -e 'G;p' example.txt
Line one

Line three
Line three
Line two
Line three
```

此输出的前两行同时包含模式空间（`Line one`）的内容和空的保留空间。接下来的两行与搜索文本（`three`）匹配，因此它既包含模式空间又包含保留空间。第三行的保留空间没有变化，因此在模式空间（`Line two`）的末尾是保留空间（仍然是 `Line three`）。

### 用 sed 剪切和粘贴

现在你知道了如何将字符串从模式空间转到保留空间并再次返回，你可以设计一个 sed 脚本来复制、删除，然后在文档中粘贴一行。例如，将示例文件的 `Line three` 挪至第三行，sed 可以解决这个问题：

```
$ sed -n -e '/three/ h' -e '/three/ d' \
-e '/two/ G;p' example.txt
Line one
Line two
Line three
```

  * 第一个脚本找到包含字符串 `three` 的行，并将其从模式空间复制到保留空间，替换当前保留空间中的任何内容。
  * 第二个脚本删除包含字符串 `three` 的任何行。这样就完成了与文字处理器或文本编辑器中的 _剪切_ 动作等效的功能。
  * 最后一个脚本找到包含字符串 `two` 的行，并将保留空间的内容_追加_到模式空间，然后打印模式空间。

任务完成。

### 使用 sed 编写脚本

再说一次，使用单独的脚本语句纯粹是为了视觉和心理上的简单。剪切和粘贴命令作为一个脚本同样有效：

```
$ sed -n -e '/three/ h ; /three/ d ; /two/ G ; p' example.txt
Line one
Line two
Line three
```

它甚至可以写在一个专门的脚本文件中：

```
#!/usr/bin/sed -nf

/three/h
/three/d
/two/ G
p
```

要运行该脚本，将其加入可执行权限，然后用示例文件尝试：

```
$ chmod +x myscript.sed
$ ./myscript.sed example.txt
Line one
Line two
Line three
```

当然，你需要解析的文本越可预测，则使用 sed 解决问题越容易。发明 sed 操作（例如复制和粘贴）的“配方”通常是不切实际的，因为触发操作的条件可能因文件而异。但是，你对 sed 命令的使用越熟练，就越容易根据需要解析的输入来设计复杂的动作。

重要的事情是识别不同的操作，了解 sed 何时移至下一行，并预测模式和保留空间包含的内容。

### 下载备忘单

sed 很复杂。虽然它只有十几个命令，但它灵活的语法和原生功能意味着它充满了无限的潜力。为了充分利用 sed，我曾经参考过一些巧妙的单行命令，但是直到我开始发明（有时是重新发明）自己的解决方案时，我才觉得自己真正开始学习 sed 了 。如果你正在寻找命令提示和语法方面的有用技巧，[下载我们的 sed 备忘单][6]，然后开始一劳永逸地学习 sed！

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/sed-cheat-sheet

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/linux_penguin_green.png?itok=ENdVzW22 "Penguin with green background"
[2]: https://opensource.com/article/21/3/grep-cheat-sheet
[3]: https://opensource.com/article/20/9/awk-ebook
[4]: https://opensource.com/article/20/12/sed
[5]: https://opensource.com/article/20/12/gnu-ed
[6]: https://opensource.com/downloads/sed-cheat-sheet
[7]: http://www.gnu.org/software/sed/
[8]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[9]: https://opensource.com/article/20/11/macports
[10]: https://opensource.com/article/20/6/homebrew-mac
[11]: https://chocolatey.org/packages/sed
[12]: https://opensource.com/article/20/3/chocolatey