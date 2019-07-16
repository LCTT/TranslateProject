[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10837-1.html)
[#]: subject: (apt-clone : Backup Installed Packages And Restore Those On Fresh Ubuntu System)
[#]: via: (https://www.2daygeek.com/apt-clone-backup-installed-packages-and-restore-them-on-fresh-ubuntu-system/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

apt-clone：备份已安装的软件包并在新的 Ubuntu 系统上恢复它们
======

当我们在基于 Ubuntu/Debian 的系统上使用 `apt-clone`，包安装会变得更加容易。如果你需要在少量系统上安装相同的软件包时，`apt-clone` 会适合你。

如果你想在每个系统上手动构建和安装必要的软件包，这是一个耗时的过程。它可以通过多种方式实现，Linux 中有许多程序可用。我们过去曾写过一篇关于 [Aptik][1] 的文章。它是能让 Ubuntu 用户备份和恢复系统设置和数据的程序之一。

### 什么是 apt-clone？

[apt-clone][2] 能让你为 Debian/Ubuntu 系统创建所有已安装软件包的备份，这些软件包可以在新安装的系统（或容器）或目录中恢复。

该备份可以在相同操作系统版本和架构的多个系统上还原。

### 如何安装 apt-clone？

`apt-clone` 包可以在 Ubuntu/Debian 的官方仓库中找到，所以，使用 [apt 包管理器][3] 或 [apt-get 包管理器][4] 来安装它。

使用 `apt` 包管理器安装 `apt-clone`。

```
$ sudo apt install apt-clone
```

使用 `apt-get` 包管理器安装 `apt-clone`。

```
$ sudo apt-get install apt-clone
```

### 如何使用 apt-clone 备份已安装的软件包？

成功安装 `apt-clone` 之后。只需提供一个保存备份文件的位置。我们将在 `/backup` 目录下保存已安装的软件包备份。

`apt-clone` 会将已安装的软件包列表保存到 `apt-clone-state-Ubuntu18.2daygeek.com.tar.gz` 中。

```
$ sudo apt-clone clone /backup
```

我们同样可以通过运行 `ls` 命令来检查。

```
$ ls -lh /backup/
total 32K
-rw-r--r-- 1 root root 29K Apr 20 19:06 apt-clone-state-Ubuntu18.2daygeek.com.tar.gz
```

运行以下命令，查看备份文件的详细信息。

```
$ apt-clone info /backup/apt-clone-state-Ubuntu18.2daygeek.com.tar.gz
Hostname: Ubuntu18.2daygeek.com
Arch: amd64
Distro: bionic
Meta: libunity-scopes-json-def-desktop, ubuntu-desktop
Installed: 1792 pkgs (194 automatic)
Date: Sat Apr 20 19:06:43 2019
```

根据上面的输出，备份文件中总共有 1792 个包。

### 如何恢复使用 apt-clone 进行备份的软件包？

你可以使用任何远程复制程序来复制远程服务器上的文件。

```
$ scp /backup/apt-clone-state-ubunt-18-04.tar.gz Destination-Server:/opt
```

复制完成后，使用 `apt-clone` 执行还原。

使用以下命令进行还原。

```
$ sudo apt-clone restore /opt/apt-clone-state-Ubuntu18.2daygeek.com.tar.gz
```

请注意，还原将覆盖现有的 `/etc/apt/sources.list` 并安装/删除包。所以要小心。

如果你要将所有软件包还原到文件夹而不是实际还原，可以使用以下命令。

```
$ sudo apt-clone restore /opt/apt-clone-state-Ubuntu18.2daygeek.com.tar.gz --destination /opt/oldubuntu
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/apt-clone-backup-installed-packages-and-restore-them-on-fresh-ubuntu-system/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/aptik-backup-restore-ppas-installed-apps-users-data/
[2]: https://github.com/mvo5/apt-clone
[3]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[4]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
