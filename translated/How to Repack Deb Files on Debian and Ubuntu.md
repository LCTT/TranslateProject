如何在Debian和Ubuntu下重新打包Deb文件

================================================================================

**以下教程会教导Ubuntu,Linux Mint和Debian GUN/Linux用户，如何在它们基于Debian的Linux操作系统上轻松的解开和重建.deb文件。**

![](http://i1-news.softpedia-static.com/images/news2/How-to-Repack-Deb-Files-on-Debian-and-Ubuntu-404930-2.jpg)

有时候你会碰到这样或那样的问题，你想要修改.deb文件的部分内容，然后重新打包。但是，也只有你真正的进入计算机世界之中。

下面的例子是刚发生在我身上真实的经历。一位Linux的开发者为一个软件构建了一个Debian包（.deb）,我也成功得将它安装在我的装载Ubuntu的电脑上。

当我试图从一个Git库中检索一些文件时，它总是卡顿，佷显然，该软件并没有正常工作。我知道安装的文件在哪里（/opt目录），所以，我搜查了代码并适当的将部分问题修复。之后，当程序试图检索需要的包时不再卡顿。

所以，长话短说，我要将.deb文件解包，替换上我的补丁文件，然后再重新打包回来。这样我可以其他电脑上安装，或者将有效的包文件给我的朋友。我要怎么做呢？

在网络上搜索问题的答案，我发现一个名叫[ailoo.net][1]的小型博客，类似这样解释：

    mkdir -p extract/DEBIAN

    dpkg-deb -x package.deb extract/

    dpkg-deb -e package.deb extract/DEBIAN [...do something, e.g. edit the control file...]

    mkdir build

    dpkg-deb -b extract/ build/

这五个命令像一个魔法来完成工作。让我向你解释：第一条命令创建了一个名为“extract”文件夹和一个名为“DEBIAN”的子文件夹；第二条命令会从你的.deb包提取程序文件到“extract”文件夹；第三条命令会解压.deb包的控制文件到“DEBIAN”子文件夹，在那里你就可以 修改／补丁 你想要的文件；第四条命令建立一个名为“build”的文件夹；而第五条命令会将修改后的文件重新构建到一个新的.deb包中，并在 “build” 文件夹中生成。

这就是本次的教程！牢牢地记住上面的命令吧，在你执行第三条命令后，可以通过你默认的文件管理器用一个图形化的文本编辑器，可视化的修改文件。如果你在这个教程上遇到问题，你可以毫不犹豫的评论给我们。

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/How-to-Repack-Deb-Files-on-Debian-and-Ubuntu-404930.shtml

译者：[Luoxcat](https://github.com/Luoxcat) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://ailoo.net/2009/06/repack-a-deb-archive-with-dpkg-deb/ 
[2]:
[3]:
[4]:
[5]:
[6]:
[7]:
[8]:
[9]:
[10]:
[11]:
[12]:
