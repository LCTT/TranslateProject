[#]: subject: (Use the Linux terminal to see what files are on your computer)
[#]: via: (https://opensource.com/article/21/8/linux-list-files)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (piaoshi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13669-1.html)

使用 Linux 终端查看你的电脑上有哪些文件
======

> 通过这个 Linux 教程学习如何使用 ls 命令在终端中列出文件。

![](https://img.linux.net.cn/data/attachment/album/202108/11/142450etebpqtp7bl4kupt.jpg)

要在有图形界面的计算机上列出文件，你通常可以打开一个文件管理器（Linux 上的 “文件”，MacOS 上的 “访达”，Windows 上的 “文件资源管理器”）来查看文件。

要在终端中列出文件，你可以使用 `ls` 命令来列出当前目录中的所有文件。而 `pwd` 命令可以告诉你当前所在的目录：

```
$ pwd
/home/tux
$ ls
example.txt
Documents
Downloads
Music
Pictures
Templates
Videos
```

你可以通过 `--all`（简写为 `-a`） 选项看到隐藏文件：

```
$ pwd
/home/tux
$ ls --all
.               Downloads
..              .local
.bashrc         Music
.config         Pictures
example.txt     Templates
Documents       Videos
```

如你所见，列出的前两项是点。单个点（`.`）实际上是一个元位置，代表 _你当前所在的文件夹_ 。两个点（`..`）表示你可以从当前位置返回的上级目录。也就是说，当前目录在另一个文件夹中。当你在计算机目录间移动时，你就可以利用这些元位置为自己创建快捷方式，或者增加你的路径的独特性。

### 文件和文件夹以及如何区分它们

你可能会注意到，文件和文件夹是很难区分的。一些 Linux 发行版有一些漂亮的颜色设置，比如所有的文件夹都是蓝色的，文件是白色的，二进制文件是粉色或绿色的，等等。如果你没有看到这些颜色，你可以试试 `ls --color`。如果你有色盲症或者使用的不是彩色显示器，你可以使用 `--classify` 选项替代：

```
$ pwd
/home/tux/Downloads
$ ls --classify
android-info.txt
cheat/
test-script.sh*
```

你会发现，文件夹末尾加了一个斜杠（`/`），以表示它们是文件系统中的某一级目录。而二进制文件，如压缩文件和可执行程序，用星号（`*`）标记。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/linux-list-files

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[piaoshi](https://github.com/piaoshi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/ch01.svg__0.png?itok=98wPcbAc (List files on your computer)
