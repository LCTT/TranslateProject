Linux 系统的成长之路：试用 1993-2003 年之间的 Linux 老版本系统
============================================================

> 让我们一起来回顾 Linux 早期版本的美好时光

![How Linux got to be Linux: Test driving 1993-2003 distros](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/car-penguin-drive-linux-yellow.png?itok=ueZE5mph "How Linux got to be Linux: Test driving 1993-2003 distros") 

*图片来源：互联网档案馆[书籍][7][图片][8]。 Opensource.com. CC BY-SA 4.0 编辑引用。*

开源软件最具独特性的一点就是它永远不会真正的走到 EOL（生命的终点）。它们的磁盘镜像文件大都可以一直在网上找到，并且它们的许可证也不会过期，因此，我们可以返回去找到那些老版本的 Linux 系统，并在虚拟机中安装它们，这都是很容易做到的。通过回顾那些珍贵的系统画面，让我们来回顾 Linux 系统这么多年来所发生的翻天覆地的变化。

我们从 Slackware 1.01 版本来开始这段旅程，在二十多年前它就发布在 **comp.os.linux.announce** 新闻组上了。

### Slackware 1.01 版本系统 （1993 年）

![slackware 1.0 screenshot](https://opensource.com/sites/default/files/slack1.png "slackware 1.0 screenshot") 

*Slackware 1.01*

体验 Slackware 1.01 系统最爽的是在 Qemu 模拟器软件 [2014 免费镜像系列][9]中有一个预先制作好的镜像文件，因此你可以不用手动去执行安装任务（真不习惯这种“奢华”待遇）。其引导启动命令如下：

```
$ qemu-kvm -m 16M -drive if=ide,format=qcow2,file=slackware.qcow2 \
 -netdev user,id=slirp -device ne2k_isa,netdev=slirp \
 -serial stdio -redir tcp:22122::22
```

在 1993 年那个版本的 Linux 系统中，很多东西都跟我们所想像的一样。所有常用的基本命令，比如 `ls` 和 `cd` 命令的使用方式，以及所有的基本工具（`gawk` ， `cut` ， `diff` ， `perl`，当然还有 [Volkerding][10] 最喜欢的 `elvis` 工具）现在都在使用，而且也包含在如今的 Linux 系统中，但是仍然有一小部分东西让我感到惊讶。当你尝试使用 tab 补全命令方式来列出上百个文件时， BASH 会非常友好的提示用户确认，并且那些查看压缩文件的工具（比如 `zless` 和 `zmore` 以及 `zcat`）都已经出现了。很多方面都超乎我的预计，总之，该系统给人的感觉就是超级现代化。

不过，该系统没有软件包管理的相关概念。所有软件的安装和卸载都得手动完成，也不能查询出已安装的软件包。

总的来说，Slackware 1.01 系统感觉更像是一个非常现代化的 UNIX 系统，或者更恰当的是，它给人的感觉就是一个 Linux 用户在操作一个现代化的 UNIX 系统。很多东西都非常熟悉，但是也不尽相同。这个在 1993 年发布的操作系统中，并不是所有东西都跟你想像中的一样。

### Debian 0.91 版本系统（1994 年）

为了尝试 Debian 0.91 版本系统，我使用的是 [Ibiblio 数字档案][11] 网站下载的软盘镜像文件，该系统最初发表在 1994 年。启动命令如下：

```
$ gunzip bootdsk.gz basedsk1.gz basedsk2.gz
$ qemu-system-i386 -M pc -m 64 -boot order=ac,menu=on \
   -drive file=bootdisk,if=floppy,format=raw \
   -drive file=debian.raw,if=ide,format=raw \
   -device ne2k_isa,netdev=slirp \
   -serial msmouse -vga std \
   -redir tcp:22122::22 \
   -netdev user,id=slirp
```

从 Debian 0.91 的启动磁盘启动后进入到一个简洁的 shell 界面，有很清晰的提示信息告诉你下一步将要执行的操作。

安装过程进行得非常顺利。从磁盘分区，写入 ext2 文件系统到分区，到显示图形菜单操作界面要经过七个步骤，之后开始复制 `basedsk` 镜像文件。这里使用的是以最小化方式来安装 Debian 系统，跟大家在安装自己的 Linux 系统过程中的很多步骤都非常相似。

Debian 系统因其自身的包管理器而出名，但是在早期的版本中只是有一些提示功能而已。有 `dpkg` 命令，但它是一个基于交互式菜单的系统——一种古老的 `aptitude`，有多个层次的可选菜单，并且自然地附带了几个可用软件包。

尽管如此，你也可以感受到其简便的设计理念。你只需下载三个软盘镜像文件，最后合成一个可启动的系统，然后就可以使用一个简单的文本菜单来安装更多的东西。我由衷的明白了为什么 Debian 系统如此受欢迎的原因。

### Jurix/S.u.S.E. 系统（1996 年）

![Jurix install screen](https://opensource.com/sites/default/files/jurix_install.png "Jurix install screen") 

*安装 Jurix 系统*

Jurix 系统是 SUSE 系统的前身， Jurix 带有的二进制的 `.tgz` 软件包会被组织到类似 Slackware 安装包结构的目录中，其安装包本身也跟 Slackware 的安装包很相似。

```
 $ qemu-system-i386 -M pc -m 1024 \
   -boot order=ac,menu=on \
   -drive \
    file=jurix/install,if=floppy,format=raw \
   -drive file=jurix.img,if=ide \
   -drive file=pkg.raw,if=ide,format=raw \
   -device ne2k_isa,netdev=slirp \
   -serial msmouse -vga std \
   -redir tcp:22122::22 \
   -netdev user,id=slirp
```


因为我不是刻意去寻找最早期的版本， Jurix 系统是找到的第一个真正’感觉‘像是打算给用户使用的有图形界面的 Linux 发行版。 [XFree86][12] 图形桌面环境已默认安装了，如果你不打算使用该工具，选择退出该环境即可。

比如 `/usr/lib/X11/XF86Config` （该文件后来变成 `Xorg.conf` ）这个配置文件已经存在了，这让我在使用 GUI 前完成了 90% 的工作，但是我花费了一整个周末的时间来调试 `vsync` ，`hsync`，和 `ramdac` 颜色表重写，最后我完全放弃了。

在 Jurix 系统上安装软件包也非常简单；找到源路径下的 `.tgz` 文件，然后运行一个常用的 `tar` 命令： ` $ su -c 'tar xzvf foo.tgz -C /'` 该软件包就会被解压到 root 分区，并准备好使用了。我刚开始的时候安装了几个之前未安装过的软件包，发现操作也很简单、快速且非常可靠。

### SUSE 5.1 版本系统（1998 年）

 ![suse install](https://opensource.com/sites/default/files/suse5fvwm.png "suse install") 

*在 SuSE 5.1 系统上运行 FVWM 窗口管理器*

我是使用 1998 年在马里兰州的一家软件商店里买的 InfoMagic CD-ROM 来安装 SUSE 5.1 系统的。其引导启动命令如下：

```
 $ qemu-system-i386 -M pc-0.10 -m 64 \
   -boot order=ad,menu=on \
   -drive file=floppy.raw,if=floppy,format=raw \
   -cdrom /dev/sr0 \
   -drive file=suse5.raw,if=ide,format=raw \
   -vga cirrus -serial msmouse
```

安装过程相对于前边几次来说要复杂得多。 YasT 工具在软盘和 CD-ROM 光驱之间搞乱了配置文件和设置，还需要重启好多次，在重启了好几次后我才反应过来是我操作顺序不当导致的问题。在安装过程中，我就犯了两次同样的错，我只是习惯了 YasT 工具的安装方式，到第三次才顺利的安装成功，这对于一个 Linux 用户将来的成长来说是一个很大的教训及经验。

我使用 SUSE 5.1 的主要目的就是体验其 GUI 桌面环境。配置的过程已经很熟悉了，使用几个漂亮的图形界面工具（包括一个很好用的 `XF86Setup` 前端界面配置工具）来测试和调试鼠标及显示器问题。我用了一个小时不到的时间就调试好 GUI 界面，并正常运行起来，其中大部分时间是耽搁在研究 Qemu 的虚拟显卡可以提供哪种分辨率和颜色方案。

可选用的桌面环境包括 fvwm、fvwm2 和 ctwm。我使用的是 fvwm，并且运行得也正常。我发现 tkDesk 这个 dock 式的文件管理器跟 Ubuntu 系统的 Unity 的启动栏非常的相似。

使用该系统总的来说还是非常令人愉快的，一旦成功安装了桌面环境并正常运行起来，SUSE 5.1 可以说是取得了令人瞩目的成功。

### Red Hat 6.0 版本系统（1999 年）

![Red Hat 1999](https://opensource.com/sites/default/files/redhat6_gimp_0.png "Red Hat 1999") 

*在 Red Hat 6 系统上运行 GIMP 1.x 图像处理程序*

下一个系统 Red Hat 6.0 安装盘我刚好家里有。不是 RHEL 6.0 —— 而是 Red Hat 6.0，这是一个在 RHEL 或 Fedora 系统出现之前商店里就有卖的桌面版系统。这个安装盘是我在 1999 年 6 月份买的。

其引导启动命令如下：

```
 $ qemu-system-i386 -M pc-0.10 -m 512 \
   -boot order=ad,menu=on \
   -drive file=redhat6.raw,if=ide,format=raw \
   -serial msmouse -netdev user,id=slirp \
   -vga cirrus -cdrom /dev/sr0
```

整个安装过程由完全由安装向导指引的，并且速度非常快。无论是选择要安装什么包（按**工作站**， **服务器**， 及**自定义**进行分组 ），磁盘分区，或者是启动安装，你都不会出现进行不下去的问题。

Red Hat 6 包括一个 `xf86config` 应用程序来一步步指导你完成 X 配置工作，尽管它有一些之后的 X 不认的奇怪的鼠标模拟选项。它比手动修改 Xf86Config 配置文件要容易得多，但是要正确无误的配置好 X 环境显然不是一个简单的工作。

Red Hat 6 绑定的桌面环境是 GNOME ，没错就是它，但是窗口管理器是早期的 [Enlightenment][13] ，它同样也提供了主要的声卡服务进程。Xdm 和 gdm 都作为登录管理器包含在其中，以便普通用户没有权限也可以登录到系统中并启动或者关闭 X 桌面进程，这在多用户系统中是非常重要的。

它缺少一些主要的应用程序；还没有 gedit 工具，没有重要的统一办公应用程序，更没有软件包管理器。有 GnoRPM 工具，这是一个图形界面的 RPM 包管理工具，用于查看及删除软件包，这个工具跟 yum 或 PackageKit 工具非常类似，还有基于图形界面的文件编辑器 gnotepad+ （尽管没有 Emacs 工具）。

总的来说，桌面环境在使用上也是非常直观的。跟后期实现的 GNOME 桌面环境不同，这个早期版本的在屏幕底部有个面板，其中有一个应用程序菜单和启动器图标，在中间位置有个虚拟桌面控制器。我无法想象其它操作系统的用户在使用这个桌面环境时会有多么的不习惯。

Red Hat 6 对于 Linux 系统来说是一个巨大的进步，很明显 Linux 系统正向着成为一个适用的桌面系统方向发展。

### Mandrake 8.0 版本系统（2001 年）

![Mandrake 8.0 installer](https://opensource.com/sites/default/files/mandrake8.png "Mandrake 8.0 installer") 

*Mandrake: Linux 系统的一个转折点*

Mandrake 8.0 于 2001 年发布，这已经可以跟 Apple OS 9.2 和 Windows ME 系统相提并论了。

我反而觉得老版本的系统才更安全一些。

其引导启动命令如下：

```
 $ qemu-system-i386 \
   -M pc-0.10 -m 2048 \
   -boot order=ad,menu=on \
   -drive file=mandrake8.qcow2 \
   -usb -net nic,model=rtl8139 \
   -netdev user,id=slirp \
   -vga cirrus \
   -cdrom mandrake-8.0-i386.iso
```

我一直觉得 Red Hat 系统的安装过程非常棒了，但是 Mandrake 的安装过程更是让人喜出望外。它非常友好，并且在继续下一步之前还给用户一个测试配置文件的机会，易用高效，使用起来像魔法一样。我也不用导入自己的 `XF86Config` 配置文件，因为 Mandrake 的安装程序会自动完成该任务。

![Mandrake install](https://opensource.com/sites/default/files/mandrake8install_new.png "Mandrake install") 

*Mandrake 8.0 系统的安装程序*

实际上，使用 Mandrake 系统跟使用其它的桌面环境系统的感受基本相同。让我很惊奇是的它们在操作体验上如此的相似。我相信，即使这个时候我在使用 Mandrake 系统的过程中遇到一些问题，以我自己的技术能力甚至是一个技术水平一般的年轻人也很容易解决。它的界面非常直观，帮助文档也很有用，并且软件包管理起来也很容易，只是那个时候人们还不习惯直接到网上下载他们需要的任何软件包来安装。

### Fedora 1 版本系统（2003 年）

![Fedora Core install](https://opensource.com/sites/default/files/fedora1.png "Fedora Core install") 

*基于 Red Hat 的 Fedora 系统 *

2003 年，新的 Fedora Core 版本系统发布了。 Fedora Core 基于 Red Hat 系统，它的主要目的是在 Red Hat 企业版（RHEL）成为该公司旗舰产品之前继续带动 Linux 桌面版系统的发展。

启动老版本的 Fedora Core 1 系统也没啥特别的地方：

```
 $ qemu-system-i386 -M pc \
   -m 2048 -boot order=ac,menu=on \
   -drive file=fedora1.qcow2 -usb \
   -net nic,model='rtl8139' -netdev user \
   -vga cirrus -cdrom fedora-1-i386-cd1.iso
```

安装 Fedora Core 同样简单容易； Fedora 和 Red Hat 系统在之后的 9 年中使用同样的安装器。它同样使用简单易用的图形化界面。

![Fedora Anaconda](https://opensource.com/sites/default/files/fedora1anaconda.png "Fedora Anaconda") 

*Anaconda GUI 界面*

使用 Fedora Core 系统的体验跟 Red Hat 6 或 7 版本没多少区别。 GNOME 图形界面很漂亮，有各种独立的配置程序助手，并且界面展示都非常的整洁和专业。

桌面上的 “Start Here” 图标指导用户前往三个位置：应用程序目录，首选项面板和系统设置。 一个红帽的图标表示应用程序菜单，而下边的 GNOME 面板里包括所有最新的 Linux 应用程序启动器，包括 OpenOffice 办公套件和 mozilla 浏览器。

### 展望未来

在 2000 左右， Linux 系统已经发展得很好并取得了巨大的进步。桌面环境前所未有的更加精致美观，有各种可用的应用程序，安装过程比其它操作操作更简易更高效。事实上，从 2000 年以来，用户和系统之间的关系更加紧密，即使到现在也没发生根本上的改变。当然还有一些更新和改善，以及数量惊人的创新方面的变化。

让我们来了解一下各个 Linux 系统项目上的演变:

*   Mandrake 系统后来更名为 Mandriva，如今为 [Mageia][1] ；
*   Fedora Core 随后改为 [Fedora][2] ；
*   [Ubuntu][3] 脱胎于 [Debian][4] 并且，它让 “Linux” 成为一个家喻户晓的词汇；
*   Valve 公司开发的 [SteamOS][5] 成为其官方游戏平台；
*   [Slackware][6] 现如今仍在平稳发展。

无论你是一个 Linux 新手，还是一个技术精湛的 Linux 老用户，上面的大多数截图都构成了让 Linux 系统被记入历史的一本传记。很高兴今天我们能够回顾成为世界上最大的开源项目之一的 Linux 系统是如何发展壮大起来的。更重要的是，每一次想到自己也是 Linux 开源世界中的一员我们就无比激动，把握现在，展望未来。

--------------------------------------------------------------------------------

作者简介：

![](https://opensource.com/sites/default/files/styles/profile_pictures/public/penguinmedallion200x200.png?itok=ROQSR50J)

Seth Kenlon —— Seth Kenlon 是一位独立多媒体艺术家，开源文化倡导者， Unix 极客。他还是 Slackware 多媒体产品项目的维护人员之一，官网：http://slackermedia.ml 。


--------------------------------------------------------------------------------

via: https://opensource.com/article/16/12/yearbook-linux-test-driving-distros

作者：[Seth Kenlon][a]
译者：[rusking](https://github.com/rusking)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/seth
[1]:http://mageia.org/
[2]:http://fedoraproject.org/
[3]:http://ubuntu.com/
[4]:http://debian.org/
[5]:http://store.steampowered.com/steamos
[6]:http://slackware.com/
[7]:https://www.flickr.com/photos/internetarchivebookimages/14746482994/in/photolist-ot6zCN-odgbDq-orm48o-otifuv-otdyWa-ouDjnZ-otGT2L-odYVqY-otmff7-otGamG-otnmSg-rxnhoq-orTmKf-otUn6k-otBg1e-Gm6FEf-x4Fh64-otUcGR-wcXsxg-tLTN9R-otrWYV-otnyUE-iaaBKz-ovcPPi-ovokCg-ov4pwM-x8Tdf1-hT5mYr-otb75b-8Zk6XR-vtefQ7-vtehjQ-xhhN9r-vdXhWm-xFBgtQ-vdXdJU-vvTH6R-uyG5rH-vuZChC-xhhGii-vvU5Uv-vvTNpB-vvxqsV-xyN2Ai-vdXcFw-vdXuNC-wBMhes-xxYmxu-vdXxwS-vvU8Zt
[8]:https://www.flickr.com/photos/internetarchivebookimages/14774719031/in/photolist-ovAie2-otPK99-xtDX7p-tmxqWf-ow3i43-odd68o-xUPaxW-yHCtWi-wZVsrD-DExW5g-BrzB7b-CmMpC9-oy4hyF-x3UDWA-ow1m4A-x1ij7w-tBdz9a-tQMoRm-wn3tdw-oegTJz-owgrs2-rtpeX1-vNN6g9-owemNT-x3o3pX-wiJyEs-CGCC4W-owg22q-oeT71w-w6PRMn-Ds8gyR-x2Aodm-owoJQm-owtGp9-qVxppC-xM3Gw7-owgV5J-ou9WEs-wihHtF-CRmosE-uk9vB3-wiKdW6-oeGKq3-oeFS4f-x5AZtd-w6PNuv-xgkofr-wZx1gJ-EaYPED-oxCbFP
[9]:http://www.qemu-advent-calendar.org/2014
[10]:http://www.slackware.com/~volkerdi/
[11]:https://ibiblio.org/pub/historic-linux/distributions/debian-0.91/debian-0.91/dist
[12]:http://www.xfree86.org/
[13]:http://enlightenment.org/