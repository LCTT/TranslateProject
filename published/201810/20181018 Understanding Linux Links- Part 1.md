理解 Linux 链接（一）
======
> 链接是可以将文件和目录放在你希望它们放在的位置的另一种方式。

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/linux-link-498708.jpg?itok=DyVEcEsc)

除了 `cp` 和 `mv` 这两个我们在[本系列的前一部分][1]中详细讨论过的，链接是可以将文件和目录放在你希望它们放在的位置的另一种方式。它的优点是可以让你同时在多个位置显示一个文件或目录。

如前所述，在物理磁盘这个级别上，文件和目录之类的东西并不真正存在。文件系统是为了方便人类使用，将它们虚构出来。但在磁盘级别上，有一个名为<ruby>分区表<rt>partition table</rt></ruby>的东西，它位于每个分区的开头，然后数据分散在磁盘的其余部分。

虽然有不同类型的分区表，但是在分区开头的那个表包含的数据将映射每个目录和文件的开始和结束位置。分区表的就像一个索引：当从磁盘加载文件时，操作系统会查找表中的条目，分区表会告诉文件在磁盘上的起始位置和结束位置。然后磁盘头移动到起点，读取数据，直到它到达终点，您看：这就是你的文件。

### 硬链接

硬链接只是分区表中的一个条目，它指向磁盘上的某个区域，表示该区域**已经被分配给文件**。换句话说，硬链接指向已经被另一个条目索引的数据。让我们看看它是如何工作的。

打开终端，创建一个实验目录并进入：

```
mkdir test_dir
cd test_dir
```

使用 [touch][1] 创建一个文件：

```
touch test.txt
```

为了获得更多的体验（？），在文本编辑器中打开 `test.txt` 并添加一些单词。

现在通过执行以下命令来建立硬链接：

```
ln test.txt hardlink_test.txt
```

运行 `ls`，你会看到你的目录现在包含两个文件，或者看起来如此。正如你之前读到的那样，你真正看到的是完全相同的文件的两个名称： `hardlink_test.txt` 包含相同的内容，没有填充磁盘中的任何更多空间（可以尝试使用大文件来测试），并与 `test.txt` 使用相同的 inode：

```
$ ls -li *test*
16515846 -rw-r--r-- 2 paul paul 14 oct 12 09:50 hardlink_test.txt
16515846 -rw-r--r-- 2 paul paul 14 oct 12 09:50 test.txt
```

`ls` 的 `-i` 选项显示一个文件的 “inode 数值”。“inode” 是分区表中的信息块，它包含磁盘上文件或目录的位置、上次修改的时间以及其它数据。如果两个文件使用相同的 inode，那么无论它们在目录树中的位置如何，它们在实际上都是相同的文件。

### 软链接

软链接，也称为<ruby>符号链接<rt>symlink</rt></ruby>，它与硬链接是不同的：软链接实际上是一个独立的文件，它有自己的 inode 和它自己在磁盘上的小块地方。但它只包含一小段数据，将操作系统指向另一个文件或目录。

你可以使用 `ln` 的 `-s` 选项来创建一个软链接：

```
ln -s test.txt softlink_test.txt
```

这将在当前目录中创建软链接 `softlink_test.txt`，它指向 `test.txt`。

再次执行 `ls -li`，你可以看到两种链接的不同之处：

```
$ ls -li
total 8
16515846 -rw-r--r-- 2 paul paul 14 oct 12 09:50 hardlink_test.txt
16515855 lrwxrwxrwx 1 paul paul 8 oct 12 09:50 softlink_test.txt -> test.txt
16515846 -rw-r--r-- 2 paul paul 14 oct 12 09:50 test.txt
```

`hardlink_test.txt` 和 `test.txt` 包含一些文本并且*字面上*占据相同的空间。它们使用相同的 inode 数值。与此同时，`softlink_test.txt` 占用少得多，并且具有不同的 inode 数值，将其标记为完全不同的文件。使用 `ls` 的 `-l` 选项还会显示软链接指向的文件或目录。

### 为什么要用链接？

它们适用于**带有自己环境的应用程序**。你的 Linux 发行版通常不会附带你需要应用程序的最新版本。以优秀的 [Blender 3D][2] 设计软件为例，Blender 允许你创建 3D 静态图像以及动画电影，人人都想在自己的机器上拥有它。问题是，当前版本的 Blender 至少比任何发行版中的自带的高一个版本。

幸运的是，[Blender 提供可以开箱即用的下载][3]。除了程序本身之外，这些软件包还包含了 Blender 需要运行的复杂的库和依赖框架。所有这些数据和块都在它们自己的目录层次中。

每次你想运行 Blender，你都可以 `cd` 到你下载它的文件夹并运行：

```
./blender
```

但这很不方便。如果你可以从文件系统的任何地方，比如桌面命令启动器中运行 `blender` 命令会更好。

这样做的方法是将 `blender` 可执行文件链接到 `bin/` 目录。在许多系统上，你可以通过将其链接到文件系统中的任何位置来使 `blender` 命令可用，就像这样。

```
ln -s /path/to/blender_directory/blender /home/<username>/bin
```

你需要链接的另一个情况是**软件需要过时的库**。如果你用 `ls -l` 列出你的 `/usr/lib` 目录，你会看到许多软链接文件一闪而过。仔细看看，你会看到软链接通常与它们链接到的原始文件具有相似的名称。你可能会看到 `libblah` 链接到 `libblah.so.2`，你甚至可能会注意到 `libblah.so.2` 相应链接到原始文件 `libblah.so.2.1.0`。

这是因为应用程序通常需要安装比已安装版本更老的库。问题是，即使新版本仍然与旧版本（通常是）兼容，如果程序找不到它正在寻找的版本，程序将会出现问题。为了解决这个问题，发行版通常会创建链接，以便挑剔的应用程序**相信**它找到了旧版本，实际上它只找到了一个链接并最终使用了更新的库版本。

有些是和**你自己从源代码编译的程序**相关。你自己编译的程序通常最终安装在 `/usr/local` 下，程序本身最终在 `/usr/local/bin` 中，它在 `/usr/local/bin` 目录中查找它需要的库。但假设你的新程序需要 `libblah`，但 `libblah` 在 `/usr/lib` 中，这就是所有其它程序都会寻找到它的地方。你可以通过执行以下操作将其链接到 `/usr/local/lib`：

```
ln -s /usr/lib/libblah /usr/local/lib
```

或者如果你愿意，可以 `cd` 到 `/usr/local/lib`：

```
cd /usr/local/lib
```

然后使用链接：

```
ln -s ../lib/libblah
```

还有几十个案例证明软链接是有用的，当你使用 Linux 更熟练时，你肯定会发现它们，但这些是最常见的。下一次，我们将看一些你需要注意的链接怪异。

通过 Linux 基金会和 edX 的免费 [“Linux 简介”][4]课程了解有关 Linux 的更多信息。


--------------------------------------------------------------------------------

via: https://www.linux.com/blog/intro-to-linux/2018/10/linux-links-part-1

作者：[Paul Brown][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/bro66
[b]: https://github.com/lujun9972
[1]: https://www.linux.com/blog/2018/8/linux-beginners-moving-things-around
[2]: https://www.blender.org/
[3]: https://www.blender.org/download/
[4]: https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
