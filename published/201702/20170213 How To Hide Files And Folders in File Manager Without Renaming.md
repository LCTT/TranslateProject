如何不用重命名在文件管理器中隐藏文件和文件夹
============================================================

如果一个系统被多个用户使用，你或许出于个人原因想在文件管理器中隐藏一些文件或文件夹不让其他人看到（绝大多数用户不会对 Linux 系统进行深入了解，所以他们只会看到文件管理器列出的文件和文件夹），我们有三种方法可以来做这件事。此外，（除了隐藏）你还可以使用密码保护文件或文件夹。在这个教程中，我们将讨论如何用非重命名的方法在文件管理器中隐藏文件和文件夹。

我们都知道，通过以 `点`（“.”）前缀重命名一个文件或文件夹的方式，可以在 Linux 中将该文件或文件夹隐藏。但这不是隐藏文件或文件夹的正确/高效方式。一些文件管理器也隐藏文件名以波浪号（“~”）结尾的文件，那些文件被认为是备份文件。

在文件管理器中隐藏文件或文件夹的三种方法：

*   给文件或文件夹名添加一个 `点`（“.”）前缀。
*   创建一个叫做 `.hidden` 的文件，然后把需要隐藏的文件或文件夹加到里面。
*  使用 Nautilus Hide 扩展

### 通过点（“.”）前缀隐藏文件或文件夹

这是每个人都知道的方法，因为默认情况下文件管理器和终端都不会显示以点（“.”）作为前缀的文件或文件夹。要隐藏一个现有文件，我们必须重命名它。这种方法并不总是一个好主意。我不推荐这种方法，在紧急情况下你可以使用这种方法，但不要特意这样做。

为了测试，我将创建一个叫做 `.magi` 的新文件夹。看下面的输出，当我使用 `ls -lh` 命令时，不会显示以`点`（“.”）作为前缀的文件或文件夹。在文件管理器中你也可以看到相同的结果。

```
# mkdir .magi

# ls -lh
total 36K
-rw-r--r-- 1 magi magi  32K Dec 28 03:29 nmon-old
```

文件管理器查看。

[
 ![](http://www.2daygeek.com/wp-content/uploads/2020/08/hide-files-and-folders-in-file-manager-without-renaming-linux-1a.png)
][2]

为了澄清一下，我在 ls 命令后面加上 `-a` 选项来列出被隐藏文件（是的，现在我可以看到文件名 .magi 了）。

```
# ls -la
total 52
drwxr-xr-x  4 magi magi  4096 Feb 12 01:09 .
drwxr-xr-x 24 magi magi  4096 Feb 11 23:41 ..
drwxr-xr-x  2 magi magi  4096 Feb 12 01:09 .magi
-rw-r--r--  1 magi magi 32387 Dec 28 03:29 nmon-old
```

为了查看文件管理器中的被隐藏文件，只需按 `Ctrl+h` 快捷键，再次按 `Ctrl+h` 又可以把这些文件隐藏。

[
 ![](http://www.2daygeek.com/wp-content/uploads/2020/08/hide-files-and-folders-in-file-manager-without-renaming-linux-2a.png)
][3]

### 用非重命名方法，通过 “.hidden” 文件的帮助隐藏文件或文件夹

如果你想用非重命名的方法隐藏一个文件，或者一些应用不允许重命名。在这种情况下，你可以使用 `.hidden` 文件，它可能是最适合你的选择。

一些文件管理器，比如 Nautilus、Nemo、Caja 和 Thunar，提供了一种很原始的方法来隐藏文件，不需要重命名。怎样做？只需在想要隐藏文件的地方创建一个叫做 `.hidden` 的文件，然后把想隐藏的文件和文件夹列表一行一个地加进来。最后，刷新文件夹，那些文件将不显示出来。

为了测试，我将在同一目录下创建一个叫做 `.hidden` 的文件和两个分别叫做 `2g`、`2daygeek` 的文件/文件夹，然后把它们加到 `.hidden` 文件中。

```
# touch 2g
# mkdir 2daygeek

# nano .hidden
2g
2daygeek
```

将两个文件加到 `.hidden` 文件之前。

[
 ![](http://www.2daygeek.com/wp-content/uploads/2020/08/hide-files-and-folders-in-file-manager-without-renaming-linux-5.png)
][4]

将两个文件加到 .hidden 文件之后。

[
 ![](http://www.2daygeek.com/wp-content/uploads/2017/02/hide-files-and-folders-in-file-manager-without-renaming-linux-6.png)
][5]

通过按 `Ctrl+h` 显示所有文件。

[
 ![](http://www.2daygeek.com/wp-content/uploads/2017/02/hide-files-and-folders-in-file-manager-without-renaming-linux-7.png)
][6]

### Nautilus Hide 扩展

[Nautilus Hide][7] 是针对 Nautilus 文件管理器的一个简单的 Python 扩展，它在右键菜单中增加了隐藏或显示被隐藏文件的选项。

要在 Ubuntu 及其衍生版上安装 Nautilus 和 Namo 的 Hide 扩展，我们可以在 Ubuntu 及其衍生版上通过运行下面的命令：

```
$ sudo apt install nautilus-hide
$ nautilus -q

$ sudo apt install nemo-hide
$ nemo -q
```

对于基于 DEB 的系统，可以按照下面的步骤安装 Nautilus Hide 扩展：

```
$ sudo apt install cmake gettext python-nautilus xdotool
$ mkdir build
$ cd build
$ cmake ..
$ sudo make
$ sudo make install
$ nautilus -q
```

对于基于 RPM 的系统，按照下面的步骤安装 Nautilus Hide 扩展：

```
$ sudo [yum|dnf|zypper] install cmake gettext nautilus-python xdotool
$ mkdir build
$ cd build
$ cmake ..
$ sudo make
$ sudo make install
$ nautilus -q
```

这个扩展其实就是简单的使用 `.hidden` 文件来隐藏文件。当你选择隐藏一个文件时，它的名字就加入到 `.hidden` 文件。当你选择对它解除隐藏（为解除隐藏，按 `Ctrl+h` 快捷键来显示包括点（“.”）前缀在内的所有文件，然后选择<ruby>解除隐藏文件<rt>Unhide Files</rt></ruby>）时，它的名字就从 `.hidden` 文件中移除（当把所有列在 `.hidden` 文件中的文件都解除隐藏以后， `.hidden` 文件也就随之消失了）。如果文件没有被隐藏/显示，请按 F5 来刷新文件夹。

你可能会问，方法二也能完成相同的事情，为什么我还要安装 Nautilus Hide 扩展。在方法二中，我需要在要隐藏文件的地方手动创建一个 `.hidden` 文件，然后必须把需要隐藏的文件加到其中，但在这儿一切都是自动的。简单的右键单击，然后选择隐藏或取消隐藏（如果 `.hidden` 文件还不存在，它会自动创建 ）。

使用 Nautilus Hide 扩展来隐藏一个文件。

看下面的屏幕截图，我们使用 Nautilus Hide 扩展来隐藏一个文件。

[
 ![](http://www.2daygeek.com/wp-content/uploads/2017/02/hide-files-and-folders-in-file-manager-without-renaming-linux-3a.png)
][8]

使用 Nautilus Hide 扩展来解除文件隐藏。

看下面的屏幕截图，我们使用 Nautilus Hide 扩展解除对一个文件的隐藏（通过按 `Ctrl+h`， 你可以查看所有的被隐藏文件和文件夹）。

[
 ![](http://www.2daygeek.com/wp-content/uploads/2020/08/hide-files-and-folders-in-file-manager-without-renaming-linux-4.png)
][9]

--------------------------------------------------------------------------------

via: http://www.2daygeek.com/how-to-hide-files-and-folders-in-file-manager-without-renaming/

作者：[MAGESH MARUTHAMUTHU][a]
译者：[ucasFL](https://github.com/ucasFL)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.2daygeek.com/how-to-hide-files-and-folders-in-file-manager-without-renaming/
[1]:http://www.2daygeek.com/author/magesh/
[2]:http://www.2daygeek.com/wp-content/uploads/2020/08/hide-files-and-folders-in-file-manager-without-renaming-linux-1a.png
[3]:http://www.2daygeek.com/wp-content/uploads/2020/08/hide-files-and-folders-in-file-manager-without-renaming-linux-2a.png
[4]:http://www.2daygeek.com/wp-content/uploads/2020/08/hide-files-and-folders-in-file-manager-without-renaming-linux-5.png
[5]:http://www.2daygeek.com/wp-content/uploads/2017/02/hide-files-and-folders-in-file-manager-without-renaming-linux-6.png
[6]:http://www.2daygeek.com/wp-content/uploads/2017/02/hide-files-and-folders-in-file-manager-without-renaming-linux-7.png
[7]:https://github.com/brunonova/nautilus-hide
[8]:http://www.2daygeek.com/wp-content/uploads/2017/02/hide-files-and-folders-in-file-manager-without-renaming-linux-3a.png
[9]:http://www.2daygeek.com/wp-content/uploads/2020/08/hide-files-and-folders-in-file-manager-without-renaming-linux-4.png
