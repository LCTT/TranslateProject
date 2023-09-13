[#]: subject: "How I use the attr command with my Linux filesystem"
[#]: via: "https://opensource.com/article/22/6/linux-attr-command"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lkxed"
[#]: translator: "wznmickey"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "
我是怎样在 Linux 文件系统中使用 attr 的
======
我使用开源的 XFS 文件系统为了其扩展属性的不易察觉的便捷性。扩展属性是一种增加我数据上下文环境的独特方式。
![为什么操作系统在2017年更加重要了][1]
![Why the operating system matters even more in 2017][1]
图片来自 Internet Archive Book Images，由 Opensource.com 修改。CC BY-SA 4.0

术语*文件系统*是一个描述你的电脑怎样跟踪所有你创建的文件的完美词语。你的电脑存储有大量的数据，不管是文档、配置文件还是数以千计的照片。这需要一种对人和机器都好的方式。诸如 Ext4, XFS, JFS, BtrFS 的文件系统是你的电脑跟踪文件的“语言”。

你的桌面或终端可以帮助你快速找到文件。例如，你的文件管理器可能有过滤功能让你快速在家目录内浏览图片，它也可能带有搜索功能以让你使用文件名定位文件。这些特性被称作*文件属性*，正如其名，由文件头或者文件系统代码定义的文件对象的属性。大多数的文件系统记录标准的文件属性，例如文件名、文件大小、文件类型、创建时间、上次访问时间。

我在电脑上使用开源的 XFS 文件系统，不是为了其的稳定性和高性能，而是为了其不易察觉的扩展属性的便捷性。

### 常见的文件属性

当你保存一个文件，有关其的文件也会随同保存。常见的属性告诉操作系统是否更新访问时间，什么时间同步数据到硬盘等逻辑细节。哪些属性被保存取决于底层文件系统的功能和特性。

在标准文件属性（如果有标准属性的话）之外，XFS, Ext4 和 BtrFS 文件系统都可以使用扩展文件系统。

### 扩展属性

XFS, Ext4 和 BtrFs 允许你创建自己任意的文件属性。由于你是自制标签，操作系统不会有内建支持，不过我像图片的 EXIF 数据一样以“标签”的方式使用。开发者们也许会选择使用扩展属性去开发应用内的自定义的功能。

XFS 中有2种“命名空间”， **user** 和 **root** 。当创建属性时，你必须将其加入一个命名空间。你需要`sudo`或以`root`登录以将属性加入`root`命名空间。

### 增加一个属性

你可以使用`attr`和`setfattr`命令在 XFS 文件系统中为文件增加属性。

`attr`命令默认在`user`命名空间下进行，所以你只需要使用`-s`设置名字，`-V`在其后设置值。

```
$ attr -s flavor -V vanilla example.txt
Attribute "flavor" set to a 7 byte value for example.txt:
vanilla
```

`setfattr` 命令需要你指定目标命名空间：

```
$ setfattr --name user.flavor --value chocolate example.txt
```
### 列出扩展文件属性

使用`attr`或者`getfattr`命令去看你加到文件上的扩展属性。`attr`命令默认是**user**空间，使用`-g`以*获取*扩展属性：

```
$ attr -g flavor example.txt
Attribute "flavor" had a 9 byte value for example.txt:
chocolate
```
`getfattr`命令需要用户空间和属性名字：

```
$ getfattr --name user.flavor example.txt 
# file: example.txt
user.flavor="chocolate"
```
### 列出所有扩展属性
为了看一个文件的所有扩展属性，你可以使用`attr -l`：

```
$ attr -l example.txt
Attribute "md5sum" has a 32 byte value for example.txt
Attribute "flavor" has a 9 byte value for example.txt
```
或者，你也可以使用`getfattr -d`：

```
$ getfattr -d example.txt
# file: example.txt
user.flavor="chocolate"
user.md5sum="969181e76237567018e14fe1448dfd11"
```
扩展文件属性可以使用`attr`和`setfattr`更新，就像你创建这些属性一样：

```
$ setfattr --name user.flavor --value strawberry example.txt

$ getfattr -d example.txt
# file: example.txt
user.flavor="strawberry"
user.md5sum="969181e76237567018e14fe1448dfd11"
```
### 其他文件系统上的属性

使用扩展属性最大的风险是忘记这些属性是对特定文件系统的。这意味着当你复制文件从一个磁盘或分区到另外一个时，这些属性都会丢失，**即使**目标位置的文件系统支持扩展属性。

为了避免丢失扩展属性，你需要使用支持保存属性的工具，例如`rsync`命令。

```
$ rsync --archive --xattrs ~/example.txt /tmp/
```
不关你使用什么工具，如果你传输文件到一个不知道如何处理扩展属性的文件系统，这些属性都会被丢弃。

### 搜索属性

没有很多与扩展属性交互的机制，所以你使用添加的文件属性的选择是有限的。我使用扩展属性作为标签机制，这让我能联系起来没有明显关系的文件。例如，假设我需要在工作中的一个项目中用知识共享的图形。假如我预见性地创建了 **license** 属性在我收集的图形中，我就可以使用`find`和`getfattr`在图形文件夹中寻找：

```
find ~/Graphics/ -type f \
-exec getfattr \
--name user.license \
-m cc-by-sa {} \; 2>/dev/null

# file: /home/tux/Graphics/Linux/kde-eco-award.png
user.license="cc-by-sa"
user.md5sum="969181e76237567018e14fe1448dfd11"
```
### 你的文件系统的秘密

文件系统通常不是能引起你注意的东西。他们实际是定义文件的系统。这不是电脑做的最让人兴奋的任务也不是想让用户关注的东西。但是有些文件系统可以给你有趣安全且特殊的功能，扩展文件属性就是一个好例子。其的使用可能有限制，但是扩展属性是你增加数据中上下文环境的独特方法。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/6/linux-attr-command

作者：[Seth Kenlon][a]
选题：[lkxed][b]
译者：[wznmickey](https://github.com/wznmickey)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/yearbook-haff-rx-linux-file-lead_0.png
