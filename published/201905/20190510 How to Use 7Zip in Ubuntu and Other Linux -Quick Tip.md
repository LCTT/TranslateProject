[#]: collector: (lujun9972)
[#]: translator: (warmfrog)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10855-1.html)
[#]: subject: (How to Use 7Zip in Ubuntu and Other Linux [Quick Tip])
[#]: via: (https://itsfoss.com/use-7zip-ubuntu-linux/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

如何在 Ubuntu 和其他 Linux 发行版上使用 7Zip
==============================================

![](https://img.linux.net.cn/data/attachment/album/201905/14/154515xqy7nbq6eyjzu7qj.jpg)

> 不能在 Linux 中提取 .7z 文件？学习如何在 Ubuntu 和其他 Linux 发行版中安装和使用 7zip。

[7Zip][1]（更适当的写法是 7-Zip）是一种在 Windows 用户中广泛流行的归档格式。一个 7Zip 归档文件通常以 .7z 扩展结尾。它大部分是开源的，除了包含一些少量解压 rar 文件的代码。

默认大多数 Linux 发行版不支持 7Zip。如果你试图提取它，你会看见这个错误：

> 不能打开这种文件类型

> 没有已安装的适用 7-zip 归档文件的命令。你想搜索一个命令来打开这个文件吗？

![][2]

不要担心，你可以轻松的在 Ubuntu 和其他 Linux 发行版中安装 7zip。

一个问题是你会注意到如果你试图用 [apt-get install 命令][3]，你会发现没有以 7zip 开头的候选安装。因为在 Linux 中 7Zip 包的名字是 [p7zip][4]。以字母 “p” 开头而不是预期的数字 “7”。

让我们看一下如何在 Ubuntu 和其他 Linux 发行版中安装 7zip。

### 在 Ubuntu Linux 中安装 7Zip

你需要做的第一件事是安装 p7zip 包。你会在 Ubuntu 中发现 3 个包：p7zip、p7zip-full 和 pzip-rar。

pzip 和 p7zip-full 的不同是 pzip 是一个轻量级的版本，仅仅对 .7z 文件提供支持，而 p7zip-full 提供了更多的 7z 压缩算法（例如音频文件）。

p7zip-rar 包在 7z 中提供了对 [RAR 文件][6] 的支持

在大多数情况下安装 p7zip-full 就足够了，但是你可能想安装 p7zip-rar 来支持 rar 文件的解压。

p7zip 包在 [Ubuntu 的 universe 仓库][7] 因此保证你可以使用以下命令：

```
sudo add-apt-repository universe
sudo apt update
```

在 Ubuntu 和基于 Debian 的发行版中使用以下命令。

```
sudo apt install p7zip-full p7zip-rar
```

这很好。现在在你的系统就有了 7zip 归档的支持。

### 在 Linux 中提取 7Zip 归档文件

安装了 7Zip 后，在 Linux 中，你可以在图形用户界面或者 命令行中提取 7zip 文件。

在图形用户界面，你可以像提取其他压缩文件一样提取 .7z 文件。右击文件来提取它。

在终端中，你可以使用下列命令提取 .7z 归档文件：

```
7z e file.7z
```

### 在 Linux 中压缩文件为 7zip 归档格式

你可以在图形界面压缩文件为 7zip 归档格式。简单的在文件或目录上右击，选择“压缩”。你应该看到几种类型的文件格式选项。选择 .7z。

![7zip Archive Ubuntu][9]

作为替换，你也可以在命令行中使用。这里是你可以用来压缩的命令：

```
7z a 输出的文件名 要压缩的文件
```

默认，归档文件有 .7z 扩展。你可以通过在指定输出文件扩展名为 .zip 以压缩为 zip 格式。

### 总结

就是这样。看，在 Linux 中使用 7zip 多简单？我希望你喜欢这个快速指南。如果你有问题或者建议，请随意在下方评论让我知道。

--------------------------------------------------------------------------------

via: https://itsfoss.com/use-7zip-ubuntu-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[warmfrog](https://github.com/warmfrog)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.7-zip.org/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2015/07/Install_7zip_ubuntu_1.png?ssl=1
[3]: https://itsfoss.com/apt-get-linux-guide/
[4]: https://sourceforge.net/projects/p7zip/
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/05/7zip-linux.png?resize=800%2C450&ssl=1
[6]: https://itsfoss.com/use-rar-ubuntu-linux/
[7]: https://itsfoss.com/ubuntu-repositories/
[8]: https://itsfoss.com/easily-share-files-linux-windows-mac-nitroshare/
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/05/7zip-archive-ubuntu.png?resize=800%2C239&ssl=1
