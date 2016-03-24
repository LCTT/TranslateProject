删除重复文件的神器：dupeGuru
================================================================================
最近，我需要清理我父亲的文件和文件夹。有一个难题是，里面存在很多不正确的名字的重复文件。有移动硬盘的备份，同时还为同一个文件编辑了多个版本，甚至改变的目录结构，同一个文件被复制了好几次，名字改变，位置改变等，这些文件挤满了磁盘空间。追踪每一个文件成了一个最大的问题。万幸的是，有一个小巧的软件可以帮助你省下很多时间来找到删除你系统中重复的文件：[dupeGuru][1]。它用Python写成，这个去重软件几个小时前切换到了GPLv3许可证。因此是时候用它来清理你的文件了！

### dupeGuru的安装 ###

在Ubuntu上， 你可以加入如下硬编码的软件PPA：

    $ sudo apt-add-repository ppa:hsoft/ppa
    $ sudo apt-get update 

接着用下面的命令安装：

    $ sudo apt-get install dupeguru-se 

在ArchLinux中，这个包在[AUR][2]中。

如果你想自己编译，源码在[GitHub][3]上。

### dupeGuru的基本使用 ###

DupeGuru的构想是既快又安全。这意味着程序不会在你的系统上疯狂地运行。它很少会删除你不想要删除的文件。然而，既然在讨论文件删除，保持谨慎和小心总是好的：备份总是需要的。

你看完注意事项后，你可以用下面的命令运行duprGuru了：

    $ dupeguru_se 

你应该看到要你选择文件夹的欢迎界面，在这里加入你你想要扫描的重复文件夹。

![](https://farm9.staticflickr.com/8596/16199976251_f78b042fba.jpg)

一旦你选择完文件夹并启动扫描后，dupeFuru会以列表的形式显示重复文件的组：

![](https://farm9.staticflickr.com/8600/16016041367_5ab2834efb_z.jpg)

注意的是默认上dupeGuru基于文件的内容匹配，而不是他们的名字。为了防止意外地删除了重要的文件，匹配列列出了其使用的匹配算法。在这里，你可以选择你想要删除的匹配文件，并按下“Action” 按钮来看到可用的操作。

![](https://farm8.staticflickr.com/7516/16199976361_c8f919b06e_b.jpg)

可用的选项相当广泛。简而言之，你可以删除重复、移动到另外的位置、忽略它们、打开它们、重命名它们甚至用自定义命令运行它们。如果你希望删除重复文件，你可能会像我一样非常意外竟然有这么多种删除方式。

![](https://farm8.staticflickr.com/7503/16014366568_54f70e3140.jpg)

你不仅可以将删除的文件移到垃圾箱或者永久删除，还可以选择留下指向原文件的链接（软链接或者硬链接）。也就是说，重复文件将会删除文件存储，但是会保留下一个指向原文件的链接。这将会省下大量的磁盘空间。如果你将这些文件导入到工作空间或者它们有一些依赖时很有用。

还有一个奇特的选项：你可以用HTML或者CSV文件导出结果。我不确定你会不会需要这么做，但是我假设你想追踪重复文件而不是想让dupeGuru处理它们时会有用。

最后但并不是最不重要的是，偏好菜单可以让你按照你的想法来操作去重这件事。

![](https://farm8.staticflickr.com/7493/16015755749_a9f343b943_z.jpg)

这里你可以选择扫描的标准，基于内容还是基于名字，并且有一个阈值来控制结果的数量。这里同样可以定义自定义在执行中可以选择的命令。混在其他那些小的选项中，要注意的是dupeGuru默认忽略小于10KB的文件。

要了解更多的信息，我建议你到[官方网站][4]看下，这里有很多文档、论坛支持和其他好东西。

总结一下，dupeGuru是我无论何时准备备份或者释放空间时所想到的软件。我发现这对高级用户而言也足够强大了，对新人而言也很直观。锦上添花的是：dupeGuru是跨平台的，这意味着你可以在Mac或者在Windows PC上都可以使用。如果你有特定的需求，想要清理音乐或者图片。这里有两个变种：[dupeguru-me][5]和 [dupeguru-pe][6]， 相应地可以清理音频和图片文件。与常规版本的不同是它不仅比较文件格式还比较特定的媒体数据像质量和码率。

你觉得dupeGuru怎么样？你会考虑使用它么？或者你有任何可以替代的软件的建议么？让我在评论区知道你们的想法。

--------------------------------------------------------------------------------

via: http://xmodulo.com/dupeguru-deduplicate-files-linux.html

作者：[Adrien Brochard][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/adrien
[1]:http://www.hardcoded.net/dupeguru/
[2]:https://aur.archlinux.org/packages/dupeguru-se/
[3]:https://github.com/hsoft/dupeguru
[4]:http://www.hardcoded.net/dupeguru/
[5]:http://www.hardcoded.net/dupeguru_me/
[6]:http://www.hardcoded.net/dupeguru_pe/