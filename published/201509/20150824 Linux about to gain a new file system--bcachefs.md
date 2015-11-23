Linux 上将出现一个新的文件系统：bcachefs
================================================================================

这个有 5 年历史，由 Kent Oberstreet 创建，过去属于谷歌的文件系统，最近完成了全部关键组件。Bcachefs 文件系统自称其性能和稳定性与 ext4 和 xfs 相同，而其他方面的功能又可以与 btrfs 和 zfs 相媲美。主要特性包括校验、压缩、多设备支持、缓存、快照与其他“漂亮”的特性。

Bcachefs 来自 **bcache**，这是一个块级缓存层。从 bcaceh 到一个功能完整的[写时复制][1]文件系统，堪称是一项质的转变。

对自己的问题“为什么要出一个新的文件系统”中，Kent Oberstreet 自问自答道：当我还在谷歌的时候，我与其他在 bcache 上工作的同事在偶然的情况下意识到我们正在使用的东西可以成为一个成熟文件系统的功能块，我们可以用 bcache 创建一个拥有干净而优雅设计的文件系统，而最重要的一点是，bcachefs 的主要目的就是在性能和稳定性上能与 ext4 和 xfs 匹敌，同时拥有 btrfs 和 zfs 的特性。

Overstreet 邀请人们在自己的系统上测试 bcachefs，可以通过邮件列表[通告]获取 bcachefs 的操作指南。

Linux 生态系统中文件系统几乎处于一家独大状态，Fedora 在第 16 版的时候就想用 btrfs 换掉 ext4 作为其默认文件系统，但是到现在（LCTT：都出到 Fedora 22 了）还在使用 ext4。而几乎所有 Debian 系的发行版（Ubuntu、Mint、elementary OS 等）也使用 ext4 作为默认文件系统，并且这些主流的发行版都没有替换默认文件系统的意思。

--------------------------------------------------------------------------------

via: http://www.linuxveda.com/2015/08/22/linux-gain-new-file-system-bcachefs/

作者：[Paul Hill][a]
译者：[bazz2](https://github.com/bazz2)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxveda.com/author/paul_hill/
[1]:https://en.wikipedia.org/wiki/Copy-on-write
[2]:https://lkml.org/lkml/2015/8/21/22
