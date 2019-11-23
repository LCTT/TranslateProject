[#]: collector: (lujun9972)
[#]: translator: (singledo)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11470-1.html)
[#]: subject: (How to Unzip a Zip File in Linux [Beginner’s Tutorial])
[#]: via: (https://itsfoss.com/unzip-linux/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

新手教程：如何在 Linux 下解压 Zip 文件
======

> 本文将会向你展示如何在 Ubuntu 和其他 Linux 发行版本上解压文件。终端和图形界面的方法都会讨论。

[Zip][1] 是一种创建压缩存档文件的最普通、最流行的方法。它也是一种古老的文件归档文件格式，这种格式创建于 1989 年。由于它的广泛使用，你会经常遇见 zip 文件。

在更早的一份教程里，我介绍了[如何在 Linux 上用 zip 压缩一个文件夹][2]。在这篇面向初学者的快速教程中，我会介绍如何在 Linux 上解压文件。

先决条件：检查你是否安装了 `unzip`。

为了解压 zip 归档文件，你必须在你的系统上安装了 unzip 软件包。大多数现代的的 Linux 发行版本提供了解压 zip 文件的支持，但是对这些 zip 文件进行校验以避免以后出现损坏总是没有坏处的。

在基于 [Unbutu][3] 和 [Debian][4] 的发行版上，你能够使用下面的命令来安装 `unzip`。如果你已经安装了，你会被告知已经被安装。

```
sudo apt install unzip
```

一旦你能够确认你的系统中安装了 `unzip`，你就可以通过 `unzip` 来解压 zip 归档文件。

你也能够使用命令行或者图形工具来达到目的，我会向你展示两种方法：

### 使用命令行解压文件

在 Linux 下使用 `unzip` 命令是非常简单的。在你放 zip 文件的目录，用下面的命令:

```
unzip zipped_file.zip
```

你可以给 zip 文件提供解压路径而不是解压到当前所在路径。你会在终端输出中看到提取的文件:

```
unzip metallic-container.zip -d my_zip
Archive:  metallic-container.zip
  inflating: my_zip/625993-PNZP34-678.jpg
  inflating: my_zip/License free.txt
  inflating: my_zip/License premium.txt
```

上面的命令有一个小问题。它会提取 zip 文件中所有的内容到现在的文件夹。你会在当前文件夹下留下一堆没有组织的文件，这不是一件很好的事情。

#### 解压到文件夹下

在 Linux 命令行下，对于把文件解压到一个文件夹下是一个好的做法。这种方式下，所有的提取文件都会被存储到你所指定的文件夹下。如果文件夹不存在，会创建该文件夹。

```
unzip zipped_file.zip -d unzipped_directory
```

现在 `zipped_file.zip` 中所有的内容都会被提取到 `unzipped_directory` 中。

由于我们在讨论好的做法，这里有另一个注意点，我们可以查看压缩文件中的内容而不用实际解压。

#### 查看压缩文件中的内容而不解压压缩文件

```
unzip -l zipped_file.zip
```

下面是该命令的输出:

```
unzip -l metallic-container.zip
Archive:  metallic-container.zip
  Length      Date    Time    Name
---------  ---------- -----   ----
  6576010  2019-03-07 10:30   625993-PNZP34-678.jpg
     1462  2019-03-07 13:39   License free.txt
     1116  2019-03-07 13:39   License premium.txt
---------                     -------
  6578588                     3 files
```

在 Linux 下，还有些 `unzip` 的其它用法，但我想你现在已经对在 Linux 下使用解压文件有了足够的了解。

### 使用图形界面来解压文件

如果你使用桌面版 Linux，那你就不必总是使用终端。在图形化的界面下，我们又要如何解压文件呢? 我使用的是 [GNOME 桌面][7]，不过其它桌面版 Linux 发行版也大致相同。

打开文件管理器，然后跳转到 zip 文件所在的文件夹下。在文件上点击鼠标右键，你会在弹出的窗口中看到 “提取到这里”，选择它。

![Unzip File in Ubuntu][8]

与 `unzip` 命令不同，这个提取选项会创建一个和压缩文件名相同的文件夹（LCTT 译注：文件夹没有 `.zip` 扩展名），并且把压缩文件中的所有内容存储到创建的文件夹下。相对于 `unzip` 命令的默认行为是将压缩文件提取到当前所在的文件下，图形界面的解压对于我来说是一件非常好的事情。

这里还有一个选项“提取到……”，你可以选择特定的文件夹来存储提取的文件。

你现在知道如何在 Linux 解压文件了。你也许还对学习[在 Linux 下使用 7zip][9] 感兴趣？

--------------------------------------------------------------------------------

via: https://itsfoss.com/unzip-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[octopus](https://github.com/singledo)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Zip_(file_format)
[2]: https://itsfoss.com/linux-zip-folder/
[3]: https://ubuntu.com/
[4]: https://www.debian.org/
[5]: tmp.eqEocGssC8#terminal
[6]: tmp.eqEocGssC8#gui
[7]: https://gnome.org/
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/10/unzip-files-ubuntu.jpg?ssl=1
[9]: https://itsfoss.com/use-7zip-ubuntu-linux/


