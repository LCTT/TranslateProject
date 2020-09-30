[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12663-1.html)
[#]: subject: (What's new with rdiff-backup?)
[#]: via: (https://opensource.com/article/20/9/rdiff-backup-linux)
[#]: author: (Patrik Dufresne https://opensource.com/users/patrik-dufresne)

11 年后重新打造的 rdiff-backup 2.0 有什么新功能？
======

> 这个老牌 Linux 备份方案迁移到了 Python 3 提供了添加许多新功能的机会。

![](https://img.linux.net.cn/data/attachment/album/202009/29/094858pb9pa3sppsq9x5z1.jpg)

2020 年 3 月，[rdiff-backup][2] 升级到了 2.0 版，这距离上一个主要版本已经过去了 11 年。2020 年初 Python 2 的废弃是这次更新的动力，但它为开发团队提供了整合其他功能和优势的机会。

大约二十年来，`rdiff-backup` 帮助 Linux 用户在本地或远程维护他们的数据的完整备份，而无需无谓地消耗资源。这是因为这个开源解决方案可以进行反向增量备份，只备份从上一次备份中改变的文件。

这次改版（或者说，重生）得益于一个新的、自组织的开发团队（由来自 [IKUS Software][3] 的 Eric Zolf 和 Patrik Dufresne，以及来自 [Seravo][4] 的 Otto Kekäläinen 共同领导）的努力，为了所有 `rdiff-backup` 用户的利益，他们齐心协力。

### rdiff-backup 的新功能

在 Eric 的带领下，随着向 Python 3 的迁移，项目被迁移到了一个新的、不受企业限制的[仓库][5]，以欢迎贡献。团队还整合了多年来提交的所有补丁，包括对稀疏文件的支持和对硬链接的修复。

#### 用 Travis CI 实现自动化

另一个巨大的改进是增加了一个使用开源 [Travis CI][6] 的持续集成/持续交付（CI/CD）管道。这允许在各种环境下测试 `rdiff-backup`，从而确保变化不会影响方案的稳定性。CI/CD 管道包括集成所有主要平台的构建和二进制发布。

#### 使用 yum 和 apt 轻松安装

新的 `rdiff-backup` 解决方案可以运行在所有主流的 Linux 发行版上，包括 Fedora、Red Hat、Elementary、Debian 等。Frank 和 Otto 付出了艰辛的努力，提供了开放的仓库以方便访问和安装。你可以使用你的软件包管理器安装 `rdiff-backup`，或者按照 GitHub 项目页面上的[分步说明][7]进行安装。

#### 新的主页

团队将网站从 Savannah 迁移到了 GitHub Pages，并对 [rdiff-backup.net][2] 官网进行了改版，加入了新的内容，让外观和感觉更加到位。

### 如何使用 rdiff-backup

如果你是 `rdiff-backup` 的新手，你可能会对它的易用性感到惊讶。备份方案应该让你对备份和恢复过程感到舒适，而不是吓人。

#### 开始备份

要开始备份到本地驱动器，例如通过 USB 连接的驱动器，输入 `rdiff-backup` 命令，然后输入要备份的驱动器和要存储文件的目标目录。

例如，要备份到名为 `my_backup_drive` 的本地驱动器，请输入：

```
$ rdiff-backup /home/tux/ /run/media/tux/my_backup_drive/
```

要将数据备份到异地存储，请使用远程服务器的位置，并在 `::` 后面指向备份驱动器的挂载点：

```
$ rdiff-backup /home/tux/ tux@example.com::/my_backup_drive/
```

你可能需要[设置 SSH 密钥][8]来使这个过程更轻松。

#### 还原文件

做备份的原因是有时文件会丢失。为了使恢复尽可能简单，你甚至不需要 `rdiff-backup` 来恢复文件（虽然使用 `rdiff-backup` 命令提供了一些方便）。

如果你需要从备份驱动器中获取一个文件，你可以使用 `cp` 将其从备份驱动器复制到本地系统，或者对于远程驱动器使用 `scp` 命令。

对于本地驱动器，使用：

```
$ cp _run_media/tux/my_backup_drive/Documents/example.txt ~/Documents
```

或者用于远程驱动器：

```
$ scp tux@example.com::/my_backup_drive/Documents/example.txt ~/Documents
```

然而，使用 `rdiff-backup` 命令提供了其他选项，包括 `--restore-as-of`。这允许你指定你要恢复的文件的哪个版本。

例如，假设你想恢复一个文件在四天前的版本：

```
$ rdiff-backup --restore-as-of 4D /run/media/tux/foo.txt ~/foo_4D.txt
```

你也可以用 `rdiff-backup` 来获取最新版本：

```
$ rdiff-backup --restore-as-of now /run/media/tux/foo.txt ~/foo_4D.txt`
```

就是这么简单。另外，`rdiff-backup` 还有很多其他选项，例如，你可以从列表中排除文件，从一个远程备份到另一个远程等等，这些你可以在[文档][9]中了解。

### 总结

我们的开发团队希望用户能够喜欢这个改版后的开源 `rdiff-backup` 方案，这是我们不断努力的结晶。我们也感谢我们的贡献者，他们真正展示了开源的力量。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/rdiff-backup-linux

作者：[Patrik Dufresne][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/patrik-dufresne
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/yearbook-haff-rx-linux-file-lead_0.png?itok=-i0NNfDC (Hand putting a Linux file folder into a drawer)
[2]: https://rdiff-backup.net/
[3]: https://www.ikus-soft.com/en/
[4]: https://seravo.fi/english
[5]: https://github.com/rdiff-backup/rdiff-backup
[6]: https://en.wikipedia.org/wiki/Travis_CI
[7]: https://github.com/rdiff-backup/rdiff-backup#installation
[8]: https://opensource.com/article/20/8/how-ssh
[9]: https://rdiff-backup.net/docs/examples.html
