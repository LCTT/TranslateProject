cp 命令两个高效的用法
============================================================

> Linux 中高效的备份拷贝命令
 
![Two great uses for the cp command](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/car-penguin-drive-linux-yellow.png?itok=ueZE5mph "Two great uses for the cp command")

在 Linux 上能使用鼠标点来点去的图形化界面是一件很美妙的事……但是如果你喜欢的开发交互环境和编译器是终端窗口、Bash 和 Vim，那你应该像我一样*经常*和终端打交道。

即使是不经常使用终端的人，如果对终端环境深入了解也能获益良多。举个例子—— `cp` 命令，据 [维基百科][12] 的解释，`cp` （意即 copy）命令是第一个版本的 [Unix][13] 系统的一部分。连同一组其它的命令 `ls`、`mv`、`cd`、`pwd`、`mkdir`、`vi`、`sh`、`sed` 和 `awk` ，还有提到的 `cp` 都是我在 1984 年接触 System V Unix 系统时所学习的命令之一。`cp` 命令最常见的用法是制作文件副本。像这样：

```
cp sourcefile destfile
```

在终端中执行此命令，上述命令将名为 `sourcefile` 的文件复制到名为 `destfile` 的文件中。如果在执行命令之前 `destfile` 文件不存在，那将会创建此文件，如果已经存在，那就会覆盖此文件。

这个命令我不知道自己用了多少次了（我也不想知道），但是我知道在我编写测试代码的时候，我经常用，为了保留当前正常的版本，而且又能继续修改，我会输入这个命令：

```
cp test1.py test1.bak
```

在过去的30多年里，我使用了无数次这个命令。另外，当我决定编写我的第二个版本的测试程序时，我会输入这个命令：

```
cp test1.py test2.py
```

这样就完成了修改程序的第一步。

我通常很少查看 `cp` 命令的参考文档，但是当我在备份我的图片文件夹的时候（在 GUI 环境下使用 “file” 应用），我开始思考“在 `cp` 命令中是否有个参数支持只复制新文件或者是修改过的文件。”果然，真的有！

### 高效用法 1：更新你的文件夹

比如说在我的电脑上有一个存放各种文件的文件夹，另外我要不时的往里面添加一些新文件，而且我会不时地修改一些文件，例如我手机里下载的照片或者是音乐。

假设我收集的这些文件对我而言都很有价值，我有时候会想做个拷贝，就像是“快照”一样将文件保存在其它媒体。当然目前有很多程序都支持备份，但是我想更为精确的将目录结构复制到可移动设备中，方便于我经常使用这些离线设备或者连接到其它电脑上。

 `cp` 命令提供了一个易如反掌的方法。例子如下：

在我的 `Pictures` 文件夹下，我有这样一个文件夹名字为 `Misc`。为了方便说明，我把文件拷贝到 USB 存储设备上。让我们开始吧！

```
me@desktop:~/Pictures$ cp -r Misc /media/clh/4388-D5FE
me@desktop:~/Pictures$
```

上面的命令是我从按照终端窗口中完整复制下来的。对于有些人来说不是很适应这种环境，在我们输入命令或者执行命令之前，需要注意的是 `me@mydesktop:~/Pictures` 这个前缀，`me` 这个是当前用户，`mydesktop` 这是电脑名称，`~/Pictures` 这个是当前工作目录，是 `/home/me/Pictures` 完整路径的缩写。

我输入这个命令 `cp -r Misc /media/clh/4388-D5FE` 并执行后 ，拷贝 `Misc` 目录下所有文件（这个 `-r` 参数，全称 “recursive”，递归处理，意思为本目录下所有文件及子目录一起处理）到我的 USB 设备的挂载目录 `/media/clh/4388-D5FE`。

执行命令后回到之前的提示，大多数命令继承了 Unix 的特性，在命令执行后，如果没有任何异常什么都不显示，在任务结束之前不会显示像 “execution succeeded” 这样的提示消息。如果想获取更多的反馈，就使用 `-v` 参数让执行结果更详细。

下图中是我的 USB 设备中刚刚拷贝过来的文件夹 `Misc` ，里面总共有 9 张图片。

![Image of the new copy of Misc on the USB drive](https://opensource.com/sites/default/files/u128651/cp1_file_structure.png "Image of the new copy of Misc on the USB drive")

假设我要在原始拷贝路径下 `~/Pictures/Misc` 下添加一些新文件，就像这样：

![New files added to the master directory](https://opensource.com/sites/default/files/u128651/cp2_new_files.png "New files added to the master directory")

现在我想只拷贝新的文件到我的存储设备上，我就使用 `cp` 的“更新”和“详细”选项。

```
me@desktop:~/Pictures$ cp -r -u -v Misc /media/clh/4388-D5FE
'Misc/asunder.png' -> '/media/clh/4388-D5FE/Misc/asunder.png'
'Misc/editing tags guayadeque.png' -> '/media/clh/4388-D5FE/Misc/editing tags guayadeque.png'
'Misc/misc on usb.png' -> '/media/clh/4388-D5FE/Misc/misc on usb.png'
me@desktop:~/Pictures$
```
上面的第一行中是 `cp` 命令和具体的参数（`-r` 是“递归”， `-u` 是“更新”，`-v` 是“详细”）。接下来的三行显示被复制文件的信息，最后一行显示命令行提示符。

通常来说，参数 `-r` 也可用更详细的风格 `--recursive`。但是以简短的方式，也可以这么连用 `-ruv`。

### 高效用法 2：版本备份

回到一开始的例子中，我在开发的时候定期给我的代码版本进行备份。然后我找到了另一种更好用的 `cp` 参数。

假设我正在编写一个非常有用的 Python 程序，作为一个喜欢不断修改代码的开发者，我会在一开始编写一个程序简单版本，然后不停的往里面添加各种功能直到它能成功的运行起来。比方说我的第一个版本就是用 Python 程序打印出 “hello world”。这只有一行代码的程序就像这样：

```
print 'hello world'
```

然后我将这个代码保存成文件命名为 `test1.py`。我可以这么运行它：

```
me@desktop:~/Test$ python test1.py
hello world
me@desktop:~/Test$
```

现在程序可以运行了，我想在添加新的内容之前进行备份。我决定使用带编号的备份选项，如下：

```
clh@vancouver:~/Test$ cp --force --backup=numbered test1.py test1.py
clh@vancouver:~/Test$ ls
test1.py  test1.py.~1~
clh@vancouver:~/Test$ 
```

所以，上面的做法是什么意思呢？

第一，这个 `--backup=numbered` 参数意思为“我要做个备份，而且是带编号的连续备份”。所以一个备份就是 1 号，第二个就是 2 号，等等。

第二，如果源文件和目标文件名字是一样的。通常我们使用 `cp` 命令去拷贝成自己，会得到这样的报错信息：

```
cp: 'test1.py' and 'test1.py' are the same file
```

在特殊情况下，如果我们想备份的源文件和目标文件名字相同，我们使用 `--force` 参数。

第三，我使用 `ls` （意即 “list”）命令来显示现在目录下的文件，名字为 `test1.py` 的是原始文件，名字为 `test1.py.~1~` 的是备份文件

假如现在我要加上第二个功能，在程序里加上另一行代码，可以打印 “Kilroy was here.”。现在程序文件 `test1.py` 的内容如下：

```
print 'hello world'
print 'Kilroy was here'
```

看到 Python 编程多么简单了吗？不管怎样，如果我再次执行备份的步骤，结果如下：


```
clh@vancouver:~/Test$ cp --force --backup=numbered test1.py test1.py
clh@vancouver:~/Test$ ls
test1.py test1.py.~1~ test1.py.~2~
clh@vancouver:~/Test$
```
现在我有有两个备份文件： `test1.py.~1~` 包含了一行代码的程序，和 `test1.py.~2~` 包含两行代码的程序。

这个很好用的功能，我考虑做个 shell 函数让它变得更简单。

### 最后总结

第一，Linux 手册页，它在大多数桌面和服务器发行版都默认安装了，它提供了更为详细的使用方法和例子，对于 `cp` 命令，在终端中输入如下命令：

```
man cp
```

对于那些想学习如何使用这些命令，但不清楚如何使用的用户应该首先看一下这些说明，然后我建议创建一个测试目录和文件来尝试使用命令和选项。

第二，兴趣是最好的老师。在你最喜欢的搜索引擎中搜索 “linux shell tutorial”，你会获得很多有趣和有用的资源。

第三，你是不是在想，“为什么我要用这么麻烦的方法，图形化界面中有相同的功能，只用点击几下岂不是更简单？”，关于这个问题我有两个理由。首先，在我们工作中需要中断其他工作流程以及大量使用点击动作时，点击动作可就不简单了。其次，如果我们要完成流水线般的重复性工作，通过使用 shell 脚本和 shell 函数以及 shell 重命名等功能就能很轻松的实现。

你还知道关于 `cp` 命令其他更棒的使用方式吗？请在留言中积极回复哦～

（题图：Opensource.com）

--------------------------------------------------------------------------------

作者简介：

Chris Hermansen - 1978 年毕业于英国哥伦比亚大学后一直从事计算机相关职业，我从 2005 年开始一直使用 Linux、Solaris、SunOS，在那之前我就是 Unix 系统管理员了，在技术方面，我的大量的职业生涯都是在做数据分析，尤其是空间数据分析，我有大量的编程经验与数据分析经验，熟练使用 awk、Python、PostgreSQL、PostGIS 和 Groovy。

---

via: https://opensource.com/article/17/7/two-great-uses-cp-command

作者：[Chris Hermansen][a]
译者：[bigdimple](https://github.com/bigdimple)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/clhermansen
[1]:https://opensource.com/resources/what-is-linux?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[2]:https://opensource.com/resources/what-are-linux-containers?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[3]:https://developers.redhat.com/promotions/linux-cheatsheet/?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[4]:https://developers.redhat.com/cheat-sheet/advanced-linux-commands-cheatsheet?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[5]:https://opensource.com/tags/linux?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[6]:https://opensource.com/file/360601
[7]:https://opensource.com/file/360606
[8]:https://opensource.com/article/17/7/two-great-uses-cp-command?rate=87TiE9faHZRes_f4Gj3yQZXhZ-x7XovYhnhjrk3SdiM
[9]:https://opensource.com/user/37806/feed
[10]:https://www.flickr.com/photos/internetarchivebookimages/14746482994/in/photolist-ot6zCN-odgbDq-orm48o-otifuv-otdyWa-ouDjnZ-otGT2L-odYVqY-otmff7-otGamG-otnmSg-rxnhoq-orTmKf-otUn6k-otBg1e-Gm6FEf-x4Fh64-otUcGR-wcXsxg-tLTN9R-otrWYV-otnyUE-iaaBKz-ovcPPi-ovokCg-ov4pwM-x8Tdf1-hT5mYr-otb75b-8Zk6XR-vtefQ7-vtehjQ-xhhN9r-vdXhWm-xFBgtQ-vdXdJU-vvTH6R-uyG5rH-vuZChC-xhhGii-vvU5Uv-vvTNpB-vvxqsV-xyN2Ai-vdXcFw-vdXuNC-wBMhes-xxYmxu-vdXxwS-vvU8Zt
[11]:https://www.flickr.com/photos/internetarchivebookimages/14774719031/in/photolist-ovAie2-otPK99-xtDX7p-tmxqWf-ow3i43-odd68o-xUPaxW-yHCtWi-wZVsrD-DExW5g-BrzB7b-CmMpC9-oy4hyF-x3UDWA-ow1m4A-x1ij7w-tBdz9a-tQMoRm-wn3tdw-oegTJz-owgrs2-rtpeX1-vNN6g9-owemNT-x3o3pX-wiJyEs-CGCC4W-owg22q-oeT71w-w6PRMn-Ds8gyR-x2Aodm-owoJQm-owtGp9-qVxppC-xM3Gw7-owgV5J-ou9WEs-wihHtF-CRmosE-uk9vB3-wiKdW6-oeGKq3-oeFS4f-x5AZtd-w6PNuv-xgkofr-wZx1gJ-EaYPED-oxCbFP
[12]:https://en.wikipedia.org/wiki/Cp_(Unix)
[13]:https://en.wikipedia.org/wiki/Unix
[14]:https://opensource.com/users/clhermansen
[15]:https://opensource.com/users/clhermansen
[16]:https://opensource.com/article/17/7/two-great-uses-cp-command#comments
