[#]: collector: (lujun9972)
[#]: translator: (dianbanjiu)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10438-1.html)
[#]: subject: (An Easy Way To Remove Programs Installed From Source In Linux)
[#]: via: (https://www.ostechnix.com/an-easy-way-to-remove-programs-installed-from-source-in-linux/)
[#]: author: (SK https://www.ostechnix.com/author/sk/)

在 Linux 中移除从源代码安装的程序的一种简单的方法  
======

![](https://www.ostechnix.com/wp-content/uploads/2018/12/stow-1-720x340.jpg)

不是所有的程序都可以在官方或者第三方库中找到，因此你不能使用常规的包管理来安装它们。有时你不得不从源代码中手动构建这些程序。就如你已经知道的一样，当你从源代码中安装一个程序的时候，这个软件包所包含的文件将会复制到本地的多个位置，例如 `/usr/local/bin`、`/usr/local/etc/`。如果从源代码中安装的程序没有内置的卸载程序，当你不再需要这个程序的时候，卸载它就会很麻烦。你可能会花费双倍（甚至更多）的时间找出这些文件然后手动删除它们。我以前一直是这样做的，直到我发现了 GNU Stow。谢天谢地，Stow 有一个很棒的方法可以轻松管理从源代码安装的程序。   

引用官方网站里的一段介绍，  

> GNU Stow 是一个符号链接归集管理器，它可以收集文件系统上不同目录中的不同软件和/或数据包，使它们看起来像是一个整体。

简单来说，Stow 帮助你把这些程序文件以一种容易管理的方式组织在了一起。在这个方法中，文件将不会被复制到多个位置。所有的这些文件都会被保存在一个特定的文件夹中，通常是以程序名命名的，然后 Stow 会在一个合适的位置为所有的程序文件创建符号连接。比如 `/usr/local/bin` 中会包含 `/usr/local/stow/vim/bin`、`/usr/local/stow/python/bin` 中文件的符号链接。并且同样递归地用于其他的任何的子目录，例如 `.../share`、`.../man`，等等。在这篇教程中，我将会举例教你如何轻松地使用 Stow 管理从源中安装的程序。  

### 安装 GNU Stow  

GNU Stow 在流行 Linux 操作系统的默认库中都可用。  

在 Arch Linux 及它的衍生版本中，运行下面的命令安装 Stow。  

```
$ sudo pacman -S stow
```

在 Debian、Ubuntu、Linux Mint 上：  

```
$ sudo apt install stow
```

在 Fedora 上： 

```
$ sudo dnf install stow
```

在 RHEL/CentOS 上：  

```
$ sudo yum install epel-release
$ sudo yum install stow
```

### 在 Linux 上轻松移除从源代码安装的程序  

就像我之前提到的，所有包的程序文件都将被保存在位于 `/usr/local/stow/` 的一个根文件夹。在这个根文件夹或者父目录之下，每个包都将保存在对应的子目录中。例如，如果我们从源代码中安装了 Vim 编辑器，所有关联到 Vim 的程序文件和目录都将保存在 `/usr/local/stow/vim` 文件夹之下。如果你从源代码中安装了 Python，所有关联到 python 的文件都会保存在 `/usr/local/stow/python` 之下。  

我现在从源代码中来安装一个叫做 hello 的程序。  

首先下载 hello 程序的压缩包。  

```
$ wget http://ftp.gnu.org/gnu/hello/hello-2.10.tar.gz
```

使用下面的命令解压压缩包：  

```
$ tar -zxvf hello-2.10.tar.gz
```

上面的命令将会在当前工作目录下创建一个叫做 `hello-2.10` 的目录，并且提取压缩包中的所有内容到其中去。  

切换到这个目录当中：  

```
$ cd hello-2.10/
```

运行下面的命令，并且添加 `-prefix` 选项。  

```
$ ./configure --prefix=/usr/local/stow/hello
```

上面的命令将会保存构建文件到一个指定位置，在这个例子中是 `/usr/local/stow/hello`。  

最后，使用下面的命令构建并安装 hello 这个程序：  

```
$ make
$ sudo make install
```

就这样。hello 这个程序就已经安装在 `/usr/local/stow/hello/` 这个位置了。你可以使用下面的 `ls` 命令确认一下。  

```
$ ls /usr/local/stow/hello/
bin share
```

最后，进入 `/usr/local/stow/` 目录，运行下面的命令来生成必要的符号链接。  

```
$ cd /usr/local/stow/
$ sudo stow hello
```

大功告成！  

刚才那一步是将包含在 hello 这个程序中的所有文件或者目录创建了链接到 `/usr/local/` 目录中。换一种说法， `/usr/local/stow/hello/bin` 链接到 `/usr/local/share`，以及 `/usr/local/stow/hello/share/man` 链接到 `/usr/local/share`，还有 `/usr/local/stow/hello/share/man` 链接到 `/usr/local/share/man`。  

你可以使用 `ls` 命令来确认一下：  

```
$ ls /usr/local/bin/
hello
```

可以使用下面的命令来确认 hello 这个程序是否可以正常工作了：  

```
$ hello
Hello, world!
```

很好，它已经开始工作了！！  

类似地，你可以像上面描述的那样安装程序到它对应的子目录下。  

下面是 Stow 根目录包含的内容：  

```
$ tree /usr/local/stow/
```

![][2]

看，hello 这个程序已经安装在 `/usr/local/stow/hello/` 下。同样地，所有的包都将保存在它们对应的目录之下。  

下面进入主要环节，移除 hello 这个程序。首先进入 `/usr/local/stow/` 目录：  

```
$ cd /usr/local/stow/
```

然后运行下面的命令：  

```
$ sudo stow --delete hello
```

hello 这个程序就会被移除了。你可以使用下面的命令确认它是否真的被移除了：  

```
$ hello
-bash: /usr/local/bin/hello: No such file or directory
```

![][3]

看， Hello 已经被移除了！  

请注意 Stow 仅仅只移除了符号链接。所有与 hello 这个程序相关的文件或者目录还保存在 `/usr/local/stow/hello` 目录下。所以你无需再次下载源文件就可以再次安装 hello 这个程序。如果你不再需要它了，直接删除这个文件夹即可。  

```
$ sudo rm -fr /usr/local/stow/hello/
```

想了解更多 Stow 的细节，请参阅 man 手册。  

```
$ man stow
```

Stow 可以像安装程序一样轻松地帮你移除它。如果你想知道如何高效的管理很多从源代码中安装的程序，GNU Stow 就是一个使得这个任务更加轻松的一个选择，尝试一下，你一定不会失望的。  

这就是所有的内容了，希望对你有所帮助。还有更多干活即将到来，可以期待一下的！  

祝近祺！  

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/an-easy-way-to-remove-programs-installed-from-source-in-linux/

作者：[SK][a]
选题：[lujun9972][b]
译者：[dianbanjiu](https://github.com/dianbanjiu)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]: http://www.ostechnix.com/wp-content/uploads/2018/12/tree-command.png
[3]: http://www.ostechnix.com/wp-content/uploads/2018/12/hello-world.png
