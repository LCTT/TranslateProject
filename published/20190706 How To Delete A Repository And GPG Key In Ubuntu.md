[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11115-1.html)
[#]: subject: (How To Delete A Repository And GPG Key In Ubuntu)
[#]: via: (https://www.ostechnix.com/how-to-delete-a-repository-and-gpg-key-in-ubuntu/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

如何在 Ubuntu 中删除仓库及其 GPG 密钥
======

![Delete A Repository And GPG Key In Ubuntu][1]

前几天我们讨论了如何在基于 RPM 和 DEB 的系统中[列出已安装的仓库][2]。今天，我们将学习如何在 Ubuntu 中删除仓库及其 GPG 密钥。对于不知道仓库的人，仓库（简称 repo）是开发人员存储软件包的地方。仓库的软件包经过全面测试，并由 Ubuntu 开发人员专门为每个版本构建。用户可以使用 Apt 包管理器在他们的 Ubuntu 系统上下载和安装这些包。Ubuntu 有四个官方仓库，即 Main、Universe、Restricted 和 Multiverse。

除了官方仓库外，还有许多由开发人员（或软件包维护人员）维护的非官方仓库。非官方仓库通常有官方仓库中不可用的包。所有包都由包维护者用一对密钥（公钥和私钥）签名。如你所知，公钥是发给用户的，私钥必须保密。每当你在源列表中添加新的仓库时，如果 Apt 包管理器想要信任新添加的仓库，你还应该添加仓库密钥（公钥）。使用仓库密钥，你可以确保从正确的人那里获得包。到这里希望你对软件仓库和仓库密钥有了一个基本的了解。现在让我们继续看看如果在 Ubuntu 系统中不再需要仓库及其密钥，那么该如何删除它。

### 在 Ubuntu 中删除仓库

每当使用 `add-apt-repository` 命令添加仓库时，它都将保存在 `/etc/apt/sources.list` 中。

要从 Ubuntu 及其衍生版中删除软件仓库，只需打开 `/etc/apt/sources.list` 文件并查找仓库名字并将其删除即可。

```
$ sudo nano /etc/apt/sources.list
```

正如你在下面的截图中看到的，我在我的 Ubuntu 系统中添加了 [Oracle Virtualbox][3] 仓库。

![][4]

*virtualbox 仓库*

要删除此仓库，只需删除该条目即可。保存并关闭文件。

如果你已添加 PPA 仓库，请查看 `/etc/apt/sources.list.d/` 目录并删除相应的条目。

或者，你可以使用 `add-apt-repository` 命令删除仓库。例如，我要删除 [Systemback][5] 仓库，如下所示。

```
$ sudo add-apt-repository -r ppa:nemh/systemback
```

最后，使用以下命令更新软件源列表：

```
$ sudo apt update
```

### 删除仓库密钥

我们使用 `apt-key` 命令添加仓库密钥。首先，让我们使用命令列出添加的密钥：

```
$ sudo apt-key list
```

此命令将列出所有添加的仓库密钥。

```
/etc/apt/trusted.gpg
--------------------
pub rsa1024 2010-10-31 [SC]
3820 03C2 C8B7 B4AB 813E 915B 14E4 9429 73C6 2A1B
uid [ unknown] Launchpad PPA for Kendek


pub rsa4096 2016-04-22 [SC]
B9F8 D658 297A F3EF C18D 5CDF A2F6 83C5 2980 AECF
uid [ unknown] Oracle Corporation (VirtualBox archive signing key) <[email protected]>
sub rsa4096 2016-04-22 [E]


/etc/apt/trusted.gpg.d/ubuntu-keyring-2012-archive.gpg
------------------------------------------------------
pub rsa4096 2012-05-11 [SC]
790B C727 7767 219C 42C8 6F93 3B4F E6AC C0B2 1F32
uid [ unknown] Ubuntu Archive Automatic Signing Key (2012) <[email protected]>


/etc/apt/trusted.gpg.d/ubuntu-keyring-2012-cdimage.gpg
------------------------------------------------------
pub rsa4096 2012-05-11 [SC]
8439 38DF 228D 22F7 B374 2BC0 D94A A3F0 EFE2 1092
uid [ unknown] Ubuntu CD Image Automatic Signing Key (2012) <[email protected]>


/etc/apt/trusted.gpg.d/ubuntu-keyring-2018-archive.gpg
------------------------------------------------------
pub rsa4096 2018-09-17 [SC]
F6EC B376 2474 EDA9 D21B 7022 8719 20D1 991B C93C
uid [ unknown] Ubuntu Archive Automatic Signing Key (2018) <[email protected]>
```

正如你在上面的输出中所看到的，那串长的（40 个字符）十六进制值是仓库密钥。如果你希望 APT 包管理器停止信任该密钥，只需使用以下命令将其删除：

```
$ sudo apt-key del "3820 03C2 C8B7 B4AB 813E 915B 14E4 9429 73C6 2A1B"
```

或者，仅指定最后 8 个字符：

```
$ sudo apt-key del 73C62A1B
```

完成！仓库密钥已被删除。运行以下命令更新仓库列表：

```
$ sudo apt update
```

资源：

  * [软件仓库 – Ubuntu 社区 Wiki][6]

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-delete-a-repository-and-gpg-key-in-ubuntu/

作者：[sk][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/07/Delete-a-repository-in-ubuntu-720x340.png
[2]: https://www.ostechnix.com/find-list-installed-repositories-commandline-linux/
[3]: https://www.ostechnix.com/install-oracle-virtualbox-ubuntu-16-04-headless-server/
[4]: https://www.ostechnix.com/wp-content/uploads/2019/07/virtualbox-repository.png
[5]: https://www.ostechnix.com/systemback-restore-ubuntu-desktop-and-server-to-previous-state/
[6]: https://help.ubuntu.com/community/Repositories/Ubuntu
