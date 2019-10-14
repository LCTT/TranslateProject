[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Unzip a Zip File in Linux [Beginner’s Tutorial])
[#]: via: (https://itsfoss.com/unzip-linux/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

如何在 linux 下解压 Zip 文件
======

_**摘要: 将会向你展示如何在 ubuntu 和其他 linux 发行版本上解压文件 . 终端和图形界面的方法都会被讨论  **_

[Zip][1] 是一种最普通 , 最流行的方法来创建压缩存档文件 . 它也是一种古老的文件归档文件格式，创建于 1989 年 . 自从它被广泛的使用 , 你会经常遇见 zip 文件 .

在更早的一份教程 , 我展示了 [how to zip a folder in Linux][2] . 在这篇快速教程中 , 对于初学者我会展示如何在 linux 上解压文件 .

**先决条件: 检查你是否安装了 unzip**

为了解压 zip 归档文件 , 你必须解压安装包到你的系统 . 大多数现代的的 linux 发行版本提供解压 zip 文件的原生支持 . 校验它来避免以后出现坏的惊喜 .

以 [Unbutu][3] 和 [Debian][4] 为基础的发行版本 , 你能够使用下面的命令来安装 unzip. 如果你已经安装了, 你会被告知已经被安装 .

```
sudo apt install unzip
```

一旦你能够确认你的系统中安装了 unzip, 你就可以通过 unzip 来解压 zip 归档文件.

你也能够使用命令行或者图形工具来达到目的, 我会向你展示两种方法.

  * [Unzip files in Linux terminal][5]
  * [Unzip files in Ubuntu via GUI][6]


### 使用命令行解压文件

在 linux 下使用 unzip 命令是非常简单. 当你向解压 zip 文件, 用下面的命令:

```
unzip zipped_file.zip
```

你可以给 zip 文件提供解压路径而不是当前所在路径 . 你会在终端输出中看到提取的文件:

```
unzip metallic-container.zip -d my_zip
Archive:  metallic-container.zip
  inflating: my_zip/625993-PNZP34-678.jpg
  inflating: my_zip/License free.txt
  inflating: my_zip/License premium.txt
```

上面的命令有一个小问题. 它会提取 zip 文件中所有的内容到现在的文件夹 . 你会在当前文件夹下留下一堆没有组织的文件, 这不是一件很好的事情.

#### 解压到文件夹下

在 linux 命令行下, 对于把文件解压到一个文件夹下是一个好的做法. 这种方式下, 所有的提取文件都会被存储到你所指定的文件夹下. 如果文件夹不存在, 文件夹会被创建.

```
unzip zipped_file.zip -d unzipped_directory
```

现在 zipped_file.zip 中所有的内容都会被提取到 unzipped_directory 中. 

从我们讨论好的做法, 另一个注意点, 我们可以查看压缩文件中的内容而不用真实的解压 .

#### 查看压缩文件中的内容而不解压压缩文件

```
unzip -l zipped_file.zip
```

下面是命令的输出:
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

在 linux 下, 这里还有些其他的 unzip 的用法, 你对在 linux 下使用解压文件有了足够的知识.

### 使用图形界面来解压文件

  如果你使用桌面版 linux , 那你就不必总是使用终端. 在图形化的界面下，我们又要如何解压文件呢? 我使用 [GNOME desktop][7]. 和其他的桌面版 linux 发行版本相同 .
  打开文件管理器，然后跳转到压缩文件所在的文件夹下. 点击鼠标右键, 你会在弹出的窗口中看到 "extract here"，选择它. 

![Unzip File in Ubuntu][8]

与 unzip 命令不同, 提取选项会创建一个和压缩文件名相同的文件夹，并且把压缩文件中的所有内容存储到创建的文件夹下. 相对于 unzip 命令的默认行为是将压缩文件提取到当前所在的文件下，图形界面的解压对于我来说是一件非常好的事情.

这里还有一个选项 "extract to", 你可以悬着特定的文件夹来存储提取文件.

你现在知道如何在 linux 解压文件. 你也许对学习有兴趣 [using 7zip in Linux][9] .

--------------------------------------------------------------------------------

via: https://itsfoss.com/unzip-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[octopus](https://github.com/singledo)
校对：[校对者ID](https://github.com/校对者ID)

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


