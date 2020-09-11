[#]: collector: (lujun9972)
[#]: translator: (qhwdw)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10655-1.html)
[#]: subject: (13 open source backup solutions)
[#]: via: (https://opensource.com/article/19/3/backup-solutions)
[#]: author: (Don Watkins https://opensource.com/users/don-watkins)

13 个开源备份解决方案
======

> 读者们推荐了超过一打的他们喜欢的数据保护解决方案。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/server_data_system_admin.png?itok=q6HCfNQ8)

最近，我发起了一个 [投票][1]，让读者投票选出他们最喜欢的开源备份解决方案。在我们的 [版主社区][2] 上，我们提供了六个推荐的解决方案 —— Cronopete、Deja Dup、Rclone、Rdiff-backup、Restic、和 Rsync，而参与的读者也在评论区分享了一些其它的选择。并且读者提供的这 13 个其它的解决方案，（到目前为止）我们要么是没有想到，要么是没有听说过。

到目前为止，最受欢迎的推荐是 [BorgBackup][3]。它是一个带有压缩和加密特性以用具有数据去重功能的备份解决方案。它基于 BSD 许可证，支持 Linux、MacOS 和 BSD。

第二个是 [UrBackup][4]，它可以做镜像和文件的完整和增量备份；你可以保存整个分区或单个目录。它有 Windows、Linux、和 MacOS 客户端，并且采用 GNU Affero 公共许可证。

第三个是 [LuckyBackup][5]；根据其网站介绍，“它是一个易于使用、快速（只传输变化部分，而不是全部数据）、安全（在做任何数据操作之前，先检查所有需要备份的目录，以确保数据安全）、可靠和完全可定制的备份解决方案。它在 GPL 许可证下发行。

[Casync][6] 是一个可寻址内容的同步解决方案 —— 它设计用于备份、同步、存储和检索大文件系统的多个相关版本。它使用 GNU Lesser 公共许可证。

[Syncthing][7] 是用于在两台计算机之间同步文件。它基于 Mozilla 公共许可证使用，根据其网站介绍，它是安全和私密的。它可以工作于 MacOS、Windows、Linux、FreeBSD、Solaris 和 OpenBSD。

[Duplicati][8] 是一个可工作于 Windows、MacOS 和 Linux 上的、并且支持多种标准协议（比如 FTP、SSH、WebDAV 和云服务）、免费的备份解决方案。它的特性是强大的加密功能，并且它使用 GPL 许可证。

[Dirvish][9] 是一个基于磁盘的虚拟镜像备份系统，它使用 OSL-3.0 许可证。它要求必须安装有 Rsync、Perl5、SSH。

[Bacula][10] 的网站上介绍说：”它是允许系统管理员去管理备份、恢复、和跨网络的不同种类计算机上的多种数据的一套计算机程序“，它支持在 Linux、FreeBSD、Windows、MacOS、OpenBSD 和 Solaris 上运行，并且它的大部分源代码都是基于 AGPLv3 许可证的。

[BackupPC][11] 的网站上介绍说：”它是一个高性能的、企业级的、可以备份 Linux、Windows 和 MacOS 系统的 PC 和笔记本电脑上的数据到服务器磁盘上的备份解决方案“。它是基于 GPLv3 许可证的。

[Amanda][12] 是一个使用 C 和 Perl 写的备份系统，它允许系统管理员去备份整个网络中的客户端到一台服务器上的磁带、磁盘或基于云的系统。它是由马里兰大学于 1991 年开发并拥有版权，并且它有一个 BSD 式的许可证。

[Back in Time][13] 是一个为 Linux 设计的简单的备份实用程序。它提供了命令行和图形用户界面，它们都是用 Python 写的。去执行一个备份，只需要指定存储快照的位置、需要备份的文件夹，和备份频率即可。它使用的是 GPLv2 许可证。

[Timeshift][14] 是一个 Linux 上的备份实用程序，它类似于 Windows 上的系统恢复和 MacOS 上的时间胶囊。它的 GitHub 仓库上介绍说：“Timeshift 通过定期递增的文件系统快照来保护你的系统。这些快照可以在日后用于数据恢复，以撤销某些对文件系统的修改。”

[Kup][15] 是一个能够帮助用户备份它们的文件到 USB 驱动器上的备份解决方案，但它也可以用于执行网络备份。它的 GitHub 仓库上介绍说：”当插入你的外部硬盘时，Kup 将自动启动并复制你的最新的修改。“

感谢大家在我们的投票中分享你们喜爱的开源备份解决方案！如果还有其它的、没有提到的开源备份解决方案，请在下面的评论区分享它们。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/3/backup-solutions

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/article/19/2/linux-backup-solutions
[2]: https://opensource.com/opensourcecom-team
[3]: https://www.borgbackup.org/
[4]: https://www.urbackup.org/
[5]: http://luckybackup.sourceforge.net/
[6]: http://0pointer.net/blog/casync-a-tool-for-distributing-file-system-images.html
[7]: https://syncthing.net/
[8]: https://www.duplicati.com/
[9]: http://dirvish.org/
[10]: https://www.bacula.org/
[11]: https://backuppc.github.io/backuppc/
[12]: http://www.amanda.org/
[13]: https://github.com/bit-team/backintime
[14]: https://github.com/teejee2008/timeshift
[15]: https://github.com/spersson/Kup
