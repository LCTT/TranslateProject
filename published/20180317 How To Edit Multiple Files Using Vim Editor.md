如何使用 Vim 编辑多个文件
======

![](https://www.ostechnix.com/wp-content/uploads/2018/03/Edit-Multiple-Files-Using-Vim-Editor-720x340.png)

有时候，您可能需要修改多个文件，或要将一个文件的内容复制到另一个文件中。在图形用户界面中，您可以在任何图形文本编辑器（如 gedit）中打开文件，并使用 `CTRL + C` 和 `CTRL + V` 复制和粘贴内容。在命令行模式下，您不能使用这种编辑器。不过别担心，只要有 `vim` 编辑器就有办法。在本教程中，我们将学习使用 `vim` 编辑器同时编辑多个文件。相信我，很有意思哒。

### 安装 Vim

Vim 编辑器可在大多数 Linux 发行版的官方软件仓库中找到，所以您可以用默认的软件包管理器来安装它。例如，在 Arch Linux 及其变体上，您可以使用如下命令：

```
$ sudo pacman -S vim
```

在 Debian 和 Ubuntu 上：

```
$ sudo apt-get install vim
```

在 RHEL 和 CentOS 上：

```
$ sudo yum install vim
```

在 Fedora 上：

```
$ sudo dnf install vim
```

在 openSUSE 上：

```
$ sudo zypper install vim
```

### 使用 Linux 的 Vim 编辑器同时编辑多个文件

现在让我们谈谈正事，我们可以用两种方法做到这一点。

#### 方法一

有两个文件，即 `file1.txt` 和 `file2.txt`，带有一堆随机单词：

```
$ cat file1.txt
ostechnix
open source
technology
linux
unix

$ cat file2.txt
line1
line2
line3
line4
line5
```

现在，让我们同时编辑这两个文件。请运行：

```
$ vim file1.txt file2.txt
```

Vim 将按顺序显示文件的内容。首先显示第一个文件的内容，然后显示第二个文件，依此类推。

![][2]

##### 在文件中切换

要移至下一个文件，请键入：

```
:n
```

![][3]

要返回到前一个文件，请键入：

```
:N
```

如果有任何未保存的更改，Vim 将不允许您移动到下一个文件。要保存当前文件中的更改，请键入：

```
ZZ
```

请注意，是两个大写字母 `ZZ`（`SHIFT + zz`）。

要放弃更改并移至上一个文件，请键入：

```
:N!
```

要查看当前正在编辑的文件，请键入：

```
:buffers
```

![][4]

您将在底部看到加载文件的列表。

![][5]

要切换到下一个文件，请输入 `:buffer`，后跟缓冲区编号。例如，要切换到第一个文件，请键入：

```
:buffer 1
```

![][6]

##### 打开其他文件进行编辑

目前我们正在编辑两个文件，即 `file1.txt` 和 `file2.txt`。我想打开另一个名为 `file3.txt` 的文件进行编辑。

您会怎么做？这很容易。只需键入 `:e`，然后输入如下所示的文件名即可：

```
:e file3.txt
```

![][7]

现在你可以编辑 `file3.txt` 了。

要查看当前正在编辑的文件数量，请键入：

```
:buffers
```

![][8]

请注意，对于使用 `:e` 打开的文件，您无法使用 `:n` 或 `:N` 进行切换。要切换到另一个文件，请输入 `:buffer`，然后输入文件缓冲区编号。

##### 将一个文件的内容复制到另一个文件中

您已经知道了如何同时打开和编辑多个文件。有时，您可能想要将一个文件的内容复制到另一个文件中。这也是可以做到的。切换到您选择的文件，例如，假设您想将 `file1.txt` 的内容复制到 `file2.txt` 中：


首先，请切换到 `file1.txt`：

```
:buffer 1
```

将光标移动至在想要复制的行的前面，并键入`yy` 以抽出（复制）该行。然后，移至 `file2.txt`：

```
:buffer 2
```

将光标移至要从 `file1.txt` 粘贴复制行的位置，然后键入 `p`。例如，您想要将复制的行粘贴到 `line2` 和 `line3` 之间，请将鼠标光标置于行前并键入 `p`。

输出示例：

```
line1
line2
ostechnix
line3
line4
line5
```

![][9]

要保存当前文件中所做的更改，请键入：

```
ZZ
```

再次提醒，是两个大写字母 ZZ（`SHIFT + z`）。

保存所有文件的更改并退出 vim 编辑器，键入：

```
:wq
```

同样，您可以将任何文件的任何行复制到其他文件中。

##### 将整个文件内容复制到另一个文件中

我们知道如何复制一行，那么整个文件的内容呢？也是可以的。比如说，您要将 `file1.txt` 的全部内容复制到 `file2.txt` 中。

先打开 `file2.txt`：

```
$ vim file2.txt
```

如果文件已经加载，您可以通过输入以下命令切换到 `file2.txt`：

```
:buffer 2
```

将光标移动到您想要粘贴 `file1.txt` 的内容的位置。我想在 `file2.txt` 的第 5 行之后粘贴 `file1.txt` 的内容，所以我将光标移动到第 5 行。然后，键入以下命令并按回车键：

```
:r file1.txt
```

![][10]

这里，`r` 代表 “read”。

现在您会看到 `file1.txt` 的内容被粘贴在 `file2.txt` 的第 5 行之后。

```
line1
line2
line3
line4
line5
ostechnix
open source
technology
linux
unix
```

![][11]

要保存当前文件中的更改，请键入：

```
ZZ

```

要保存所有文件的所有更改并退出 vim 编辑器，请输入：

```
:wq
```

#### 方法二

另一种同时打开多个文件的方法是使用 `-o` 或 `-O` 标志。

要在水平窗口中打开多个文件，请运行：

```
$ vim -o file1.txt file2.txt
```

![][12]

要在窗口之间切换，请按 `CTRL-w w`（即按 `CTRL + w` 并再次按 `w`）。或者，您可以使用以下快捷方式在窗口之间移动：

  * `CTRL-w k` – 上面的窗口
  * `CTRL-w j` – 下面的窗口

要在垂直窗口中打开多个文件，请运行：

```
$ vim -O file1.txt file2.txt file3.txt
```

![][13]

要在窗口之间切换，请按 `CTRL-w w`（即按 `CTRL + w` 并再次按 `w`）。或者，使用以下快捷方式在窗口之间移动：

  * `CTRL-w l` – 左面的窗口
  * `CTRL-w h` – 右面的窗口

其他的一切都与方法一的描述相同。

例如，要列出当前加载的文件，请运行：

```
:buffers
```

在文件之间切换：

```
:buffer 1
```

打开其他文件，请键入：

```
:e file3.txt
```

将文件的全部内容复制到另一个文件中：

```
:r file1.txt

```

方法二的唯一区别是，只要您使用 `ZZ` 保存对当前文件的更改，文件将自动关闭。然后，您需要依次键入 `:wq` 来关闭文件。但是，如果您按照方法一进行操作，输入 `:wq` 时，所有更改将保存在所有文件中，并且所有文件将立即关闭。

有关更多详细信息，请参阅手册页。

```
$ man vim
```


### 建议阅读

您现在掌握了如何在 Linux 中使用 vim 编辑器编辑多个文件。正如您所见，编辑多个文件并不难。Vim 编辑器还有更强大的功能。我们接下来会提供更多关于 Vim 编辑器的内容。

再见！


--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-edit-multiple-files-using-vim-editor/

作者：[SK][a]
译者：[jessie-pang](https://github.com/jessie-pang)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]:http://www.ostechnix.com/wp-content/uploads/2018/03/edit-multiple-files-1-1.png
[3]:http://www.ostechnix.com/wp-content/uploads/2018/03/edit-multiple-files-2.png
[4]:http://www.ostechnix.com/wp-content/uploads/2018/03/edit-multiple-files-5.png
[5]:http://www.ostechnix.com/wp-content/uploads/2018/03/edit-multiple-files-6.png
[6]:http://www.ostechnix.com/wp-content/uploads/2018/03/edit-multiple-files-7.png
[7]:http://www.ostechnix.com/wp-content/uploads/2018/03/edit-multiple-files-8.png
[8]:http://www.ostechnix.com/wp-content/uploads/2018/03/edit-multiple-files-10-1.png
[9]:http://www.ostechnix.com/wp-content/uploads/2018/03/edit-multiple-files-11.png
[10]:http://www.ostechnix.com/wp-content/uploads/2018/03/edit-multiple-files-12.png
[11]:http://www.ostechnix.com/wp-content/uploads/2018/03/edit-multiple-files-13.png
[12]:http://www.ostechnix.com/wp-content/uploads/2018/03/Edit-multiple-files-16.png
[13]:http://www.ostechnix.com/wp-content/uploads/2018/03/Edit-multiple-files-17.png