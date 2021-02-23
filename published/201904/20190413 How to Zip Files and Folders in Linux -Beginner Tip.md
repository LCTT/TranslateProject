[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10778-1.html)
[#]: subject: (How to Zip Files and Folders in Linux [Beginner Tip])
[#]: via: (https://itsfoss.com/linux-zip-folder/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

初级：如何在 Linux 中 zip 压缩文件和文件夹
======

> 本文向你展示了如何在 Ubuntu 和其他 Linux 发行版中创建一个 zip 文件夹。终端和 GUI 方法都有。

zip 是最流行的归档文件格式之一。使用 zip，你可以将多个文件压缩到一个文件中。这不仅节省了磁盘空间，还节省了网络带宽。这就是为什么你几乎一直会看到 zip 文件的原因。

作为普通用户，大多数情况下你会在 Linux 中解压缩文件夹。但是如何在 Linux 中压缩文件夹？本文可以帮助你回答这个问题。

**先决条件：验证是否安装了 zip**

通常 [zip][1] 已经安装，但验证下也没坏处。你可以运行以下命令来安装 `zip` 和 `unzip`。如果它尚未安装，它将立即安装。

```
sudo apt install zip unzip
```

现在你知道你的系统有 zip 支持，你可以继续了解如何在 Linux 中压缩一个目录。

![][2]

### 在 Linux 命令行中压缩文件夹

`zip` 命令的语法非常简单。

```
zip [option] output_file_name input1 input2
```

虽然有几个选项，但我不希望你将它们混淆。如果你只想要将一堆文件变成一个 zip 文件夹，请使用如下命令：

```
zip -r output_file.zip file1 folder1
```

`-r` 选项将递归目录并压缩其内容。输出文件中的 .zip 扩展名是可选的，因为默认情况下会添加 .zip。

你应该会在 zip 操作期间看到要添加到压缩文件夹中的文件。

```
zip -r myzip abhi-1.txt abhi-2.txt sample_directory
  adding: abhi-1.txt (stored 0%)
  adding: abhi-2.txt (stored 0%)
  adding: sample_directory/ (stored 0%)
  adding: sample_directory/newfile.txt (stored 0%)
  adding: sample_directory/agatha.txt (deflated 41%)
```

你可以使用 `-e` 选项[在 Linux 中创建密码保护的 zip 文件夹][3]。

你并不是只能通过终端创建 zip 归档文件。你也可以用图形方式做到这一点。下面是如何做的！

### 在 Ubuntu Linux 中使用 GUI 压缩文件夹

*虽然我在这里使用 Ubuntu，但在使用 GNOME 或其他桌面环境的其他发行版中，方法应该基本相同。*

如果要在 Linux 桌面中压缩文件或文件夹，只需点击几下即可。

进入到你想将文件（和文件夹）压缩到一个 zip 文件夹的所在文件夹。

在这里，选择文件和文件夹。现在，右键单击并选择“压缩”。你也可以对单个文件执行相同操作。

![Select the files, right click and click compress][4]

现在，你可以使用 zip、tar xz 或 7z 格式创建压缩归档文件。如果你好奇，这三个都是各种压缩算法，你可以使用它们来压缩文件。

输入一个你想要的名字，并点击“创建”。

![Create archive file][5]

这不会花很长时间，你会同一目录中看到一个归档文件。

![][6]

好了，就是这些。你已经成功地在 Linux 中创建了一个 zip 文件夹。

我希望这篇文章能帮助你了解 zip 文件。请随时分享你的建议。

--------------------------------------------------------------------------------

via: https://itsfoss.com/linux-zip-folder/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Zip_(file_format)
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/04/zip-folder-linux.png?resize=800%2C450&ssl=1
[3]: https://itsfoss.com/password-protect-zip-file/
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/04/create-zip-file-ubuntu.jpg?resize=800%2C428&ssl=1
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/04/create-zip-folder-ubuntu-1.jpg?ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/04/zip-file-created-in-ubuntu.png?resize=800%2C277&ssl=1
