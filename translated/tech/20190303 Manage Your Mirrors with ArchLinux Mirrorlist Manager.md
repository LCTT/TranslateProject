[#]:collector:(lujun9972)
[#]:translator:(lujun9972)
[#]:reviewer:()
[#]:publisher:()
[#]:url:()
[#]:subject:(ManageYourMirrorswithArchLinuxMirrorlistManager)
[#]:via:(https://itsfoss。com/archlinux-mirrorlist-manager)
[#]:author:(JohnPaulhttps://itsfoss.com/author/john/)

使用Arch Linux Mirrorlist Manager管理你的镜像
======

**Arch Linux Mirrorlist Manager时一个简单的图形化程序，它让你可以方便地管理ArchLinux中的镜像。**

对于Linux用户来说，保持好的镜像列表非常重要。今天我们来介绍一个用来管理Arch镜像列表的应用程序。

！[Arch Linux Mirrorlist Manager][1]
Arch Linux Mirrorlist Manager

###什么是镜像?

至新手，Linux操作系统有赖于分布全球的的一系列服务器。这些服务器包含了特定发行版的所有可用的软件包的相同副本。这就是为什么它们被称为“镜像”。

这些服务器的最终目标时让每个国家都有多个镜像。这样就能让当地的用户可以快速升级系统。然而，这并不绝对。有时别国的镜像反而更快。

###Arch Linux Mirrorlist Manager让在ArchLinux中管理镜像更简单

！[Arch Linux Mirrorlist Manager][2]
主界面

在Arch中[管理并对有效镜像进行排序][3]不是个简单的事情。它需要用到很长的命令。还好，有人想出了一个解决方案。

去年，[RizwanHasan][4]用Python编写了一个名为[Arch Linux Mirrorlist Manager][5]的Qt应用程序。你可能对Rizwan这个名字感到眼熟，因为这不是第一次我们在本站介绍他做的玩意了。一年多前，我介绍过一个名为[MagpieOS][6]的基于Arch的新Linux发行版就是Rizwan创造的。我想Rizwan创造MagpieOS的经历激励了他创建了这个程序。

Arch Linux Mirrorlist Manager的功能并不多。它让你根据回应速度对镜像进行排序，并可以根据数量和国家进行过滤。

也就是说，若你在德国，你可以限制只保留在位于德国的最快的3个镜像。

###安装Arch Linux Mirrorlist Manager

```
它仅适用于 Arch Linux 用户

注意! ArchLinux Mirrorlist Manager 只能应用于Arch linux发行版. 不要在其他基于Arch的发行版中使用它,除非你能确定该发行版使用的是Arch镜像. 否则, 你将会遇到我在Manjaro中遇到的问题(在下面章节解释).
```

```
Manjaro的镜像管理器替代者

当使用类Arch的系统时, 我选择了Manjaro. 在开始本文之前, 我在Manjaro及其上安装了 ArchLinux Mirrorlist Manager. 它很快就对有效镜像进行了排序并保存到我的镜像列表中.

然后我尝试进行系统更新却立即遇到了问题. 当 ArchLinux Mirrorlist Manager 对我系统使用的镜像进行排序时, 它使用普通的Arch镜像替换了我的 Manjaro 镜像. (Manjaro 基于Arch, 但却有着自己的镜像,这是因为开发团队会在推送软件包之前对所有这些软件包进行测试以保证不会出现系统崩溃的BUG.) 还好, Manjaro 论坛帮我修复了这个错误.

若你是 Manjaro 用户, 请不要重蹈我的覆辙. ArchLinux Mirrorlist Manager 仅适用于Arch以及使用Arch镜像的衍生版本.

幸运的是, manjaro有一个简单易用的终端程序来管理镜像列表. 那就是 [Pacman-mirrors][7]. 跟 ArchLinux Mirrorlist Manager 一样, 你可以根据回应速度进行排序. 只需要运行 `sudo pacman-mirrors --fasttrack` 即可. 若你像将结果局限在最快的5个镜像, 可以运行 `sudo pacman-mirrors --fasttrack 5`. 要像将结果局限在某个或某几个国家, 运行 `sudo pacman-mirrors --country Germany,Spain,Austria`. 你可以通过运行 `sudo pacman-mirrors --geoip` 来将结果局限在自己国家. 更多关于Pacman-mirrors的信息请参见 [Manjaro wiki][7].

运行Pacman-mirrors后, 你还需要运行 `sudo pacman -Syyu` 来同步软件包数据库并升级系统.

注意: Pacman-mirrors 仅仅适用于 **Manjaro**.
```

Arch Linux Mirrorlist Manager包含在[ArchUserRepository][8]中。高级Arch用户可以直接从[theGitHubpage][9]下载PKGBUILD。

###对Arch Linux Mirrorlist Manager的最后思考

虽然[Arch Linux Mirrorlist Manager][5]对我不太有用，我很高兴有它的存在。这说明Linux用户正在努力让Linux更n加易于使用。正如我之前说过的，在Arch中管理镜像并不容易。Rizwan的小工具可以让Arch对新手更加友好。

你有用过Arch Linux Mirrorlist Manager吗?你是怎么管理Arch镜像的?请在下面的评论告诉我。

如果你觉的本文有趣的话，请花点时间将它分享到社交媒体，HackerNews或[Reddit][10]中去。


--------------------------------------------------------------------------------

via: https://itsfoss.com/archlinux-mirrorlist-manager

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/02/mirrorlist-manager2.png?ssl=1
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/02/mirrorlist-manager4.jpg?ssl=1
[3]: https://wiki.archlinux.org/index.php/Mirrors
[4]: https://github.com/Rizwan-Hasan
[5]: https://github.com/Rizwan-Hasan/ArchLinux-Mirrorlist-Manager
[6]: https://itsfoss.com/magpieos/
[7]: https://wiki.manjaro.org/index.php?title=Pacman-mirrors
[8]: https://aur.archlinux.org/packages/mirrorlist-manager
[9]: https://github.com/Rizwan-Hasan/MagpieOS-Packages/tree/master/ArchLinux-Mirrorlist-Manager
[10]: http://reddit.com/r/linuxusersgroup
