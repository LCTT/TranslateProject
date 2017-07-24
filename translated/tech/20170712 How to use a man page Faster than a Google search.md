教你如何更快速有效地利用man来代替google索引
============================================================

### Linux 的 manual page其实拥有很多有用的信息，而且比你想象中更容易使用

![How to use a man page: Faster than a Google search](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/yearbook-haff-rx-linux-file-lead_0.png?itok=48iDNoH8 "How to use a man page: Faster than a Google search")
照片来源于 : 

[Internet Archive Book Images][8]. 修改自 Opensource.com. CC BY-SA 4.0

我们通常通过 google 索引来查询 Linux 中的指令说明，但是其实还有一个更好的办法：那就是通过 Linux 自带的 **man pages**(manual pages 的缩写) 来查询指令详尽完整的使用说明。


man pages 的历史本身比 Linux 还长，可以追溯到 Unix 早期那个年代。 通过[这个 Wikipedia][9]可以知道，Dennis Ritchie 和 Ken Thompson 在 1971 年写了第一个 man pages，那个年代的计算员使用的还是像烤箱一样的计算机，个人电脑还未出世。man pages 也有它自己的一套设计精炼的语法，和 Unix 与 Linux 一样，man pages 也不是一成不变的，它就像 Linux 内核一样不停地发展更新。

Man pages 通过数字标识符来分成不同类型的内容：

1.  一般用户指令

2.  系统调用指令

3.  库函数

4.  特殊的文件和驱动程序

5.  文档格式

6.  游戏和屏保

7.  Miscellanea

8.  系统管理指令和守护进程

尽管如此，用户一般也不需要知道他们想查询的指令是属于哪一个类型的。

这些文件格式化的方式在当今许多用户看来有点古怪。因为最开始他们是用**trooff** 的方式，通过  PostScript 打印机来打印，所以包含了头部和布局方面的格式化信息。在 Linux 中，取而代之使用了一种叫做[**groff**][10]的方法。

在我的 Fedora 系统中，man pages 相关的文件存储在 **/usr/share/man** 目录下，根据文件类型分别存储在类似于 man1(man1 就是存储一般用户指令) 的子目录中。

如果你在 Shell 中输入 man 查询 man page，你查到的将是 **gzip** 格式压缩的 **man.1.gz** 文件，想要查询 man page 的话，需要输入如下指令：

```
man man
```

这个例子会显示 **man** 的 man page，先解压 man page 文件，然后解释这条指令并显示在 Shell 上，也可以输入 **man less**，两者的效果是一样的。

所有的 man pages 都应该显示这些分段消息：**Name**, **Synopsis**, **Description**,**Examples**,**See**,**Also**. 有些还会添加一些额外的分段消息，比如 **Options**, **Exit** **Status**, **Environment**, **Bugs**, **Files**, **Author**, **Reporting** **Bugs**, **History**,**Copyright**。

### 详细说明一个 man page

为了更详细地介绍一个典型的 man page，就用 [**ls**][12] 指令来分析吧，在 **Name** 分段下，我们可以看到如下内容：

```
ls - list directory contents
```

它会简要地告诉我 **ls** 这条指令的作用.

在 **Synopsis** 分段下，我们可以看到如下的内容:

```
ls [OPTION]... [FILE]…
```

任何在中括号中的元素都是可选的。你可以只输入 **ls** 指令，后面不接任何参数。参数后面的省略号表示你可以添加任意多个合法兼容的参数和文件名。对于 [FILE] 参数，你可以指定具体的文件夹名，或者可以使用通配符 *****，比如这个例子，它会显示 Documents 文件夹下的 .txt 文件：

```
ls Documents/*.txt
```

在 **Description** 分段下, 我们可以看到关于这条指令更加详细的信息，还有一列关于这条指令各个参数作用的详细介绍，比如说 **ls** 指令的 **-a** 参数，它的作用是显示包括隐藏文件/目录在内的所有文件：

```
-a, --all 
```

如果我们想用这些参数，要么用他们的别名，比如 **-a** ,要么用他们的全名，比如 **--all**（两条中划线）。然而并不是所有参数都有全名和别名（比如 **--author** 只有一种），而且两者的名字并不总是相互关联的（-**F, --classify**）。当你想用多条参数时，要么以空格隔开，要么共用一个连字符**-**，在连字符后连续输入你需要的参数（不要添加空格）。比如下面两个等价的例子：

```
ls -a -d -l
```

```
ls -adl
```

但是 **tar** 这个指令有些例外，由于一些历史遗留原因，当参数使用别名时可以不用添加连字符**-**,因此以下两种命令都是合法的：

```
tar -cvf filearchive.tar thisdirectory/
```


```
tar cvf filearchive.tar thisdirectory/
```

**ls** 的 **Description** 分段后是 **Author**,**Reporting Bugs**,**Copyright**, **See Also** 字段。

**See Also** 字段会提供一些相关的 man pages, 没事的话可以看看. 毕竟除了指令外还有许多其他类型的 man pages。

这里有一些参考链接：
- [Linux 是什么](1)
- [Linux 容器是什么](2)
- [快下载吧：这里有Linux 命令小抄](3)
- [比楼上更高级的 Linux 命令小抄](4)
- [我们最新的 Linux 相关文章](5)


有一些指令不是系统指令，而是 Bash 特有的，比如 **alias** 和 **cd**。这些 Bash 特有的指令可以在 **BASH_BUILTINS** man page 中查看，和上面的比起来他们的描述更加精炼，不过内容都是类似的。

其实通过 man pages 你可以获得大量有用的信息，特别是当你想用一个已经很久没用过的指令，需要复习下这条指令的作用时。这个时候 man pages 饱受非议的简洁性反而对你来说是更好的。

--------------------------------------------------------------------------------

作者简介：
Greg Pittman - Greg 是住在肯塔基州路易斯维尔的一位退休神经学家，但是却对计算机和编程保持着长久的兴趣，从十九世纪六十年代就开始捣腾 Fortran IV 了。随着 Linux 和开源软件的到来，更加激起了他去学习的兴趣并投身于这项事业中，并成为 Scribus 组织的一员。

via: https://opensource.com/article/17/7/using-man-pages

作者：[ Greg Pittman ][a]
译者：[吴霄/toyijiu](https://github.com/toyijiu)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/greg-p
[1]:https://opensource.com/resources/what-is-linux?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[2]:https://opensource.com/resources/what-are-linux-containers?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[3]:https://developers.redhat.com/promotions/linux-cheatsheet/?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[4]:https://developers.redhat.com/cheat-sheet/advanced-linux-commands-cheatsheet?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[5]:https://opensource.com/tags/linux?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[6]:https://opensource.com/article/17/7/using-man-pages?rate=W0QImEyJK1b4qSGof6I3agtPeTpPQXkaSekp_bI_Rno
[7]:https://opensource.com/user/30666/feed
[8]:https://www.flickr.com/photos/internetarchivebookimages/14803082483/in/photolist-oy6EG4-pZR3NZ-i6r3NW-e1tJSX-boBtf7-oeYc7U-o6jFKK-9jNtc3-idt2G9-i7NG1m-ouKjXe-owqviF-92xFBg-ow9e4s-gVVXJN-i1K8Pw-4jybMo-i1rsBr-ouo58Y-ouPRzz-8cGJHK-85Evdk-cru4Ly-rcDWiP-gnaC5B-pAFsuf-hRFPcZ-odvBMz-hRCE7b-mZN3Kt-odHU5a-73dpPp-hUaaAi-owvUMK-otbp7Q-ouySkB-hYAgmJ-owo4UZ-giHgqu-giHpNc-idd9uQ-osAhcf-7vxk63-7vwN65-fQejmk-pTcLgA-otZcmj-fj1aSX-hRzHQk-oyeZfR
[9]:https://en.wikipedia.org/wiki/Man_page
[10]:https://en.wikipedia.org/wiki/Groff_(software)
[11]:https://en.wikipedia.org/wiki/Less_(Unix)
[12]:http://linuxcommand.org/man_pages/ls1.html
[13]:https://opensource.com/users/greg-p
[14]:https://opensource.com/users/greg-p
[15]:https://opensource.com/article/17/7/using-man-pages#comments
