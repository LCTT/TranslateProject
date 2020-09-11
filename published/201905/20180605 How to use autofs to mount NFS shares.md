[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10830-1.html)
[#]: subject: (How to use autofs to mount NFS shares)
[#]: via: (https://opensource.com/article/18/6/using-autofs-mount-nfs-shares)
[#]: author: (Alan Formy-Duval https://opensource.com/users/alanfdoss)

如何使用 autofs 挂载 NFS 共享
======

> 给你的网络文件系统（NFS）配置一个基本的自动挂载功能。

![](https://img.linux.net.cn/data/attachment/album/201905/08/115328rva7kqw9wqh2qees.jpg)

大多数 Linux 文件系统在引导时挂载，并在系统运行时保持挂载状态。对于已在 `fstab` 中配置的任何远程文件系统也是如此。但是，有时你可能希望仅按需挂载远程文件系统。例如，通过减少网络带宽使用来提高性能，或出于安全原因隐藏或混淆某些目录。[autofs][1] 软件包提供此功能。在本文中，我将介绍如何配置基本的自动挂载。

首先做点假设：假设有台 NFS 服务器 `tree.mydatacenter.net` 已经启动并运行。另外假设一个名为 `ourfiles` 的数据目录还有供 Carl 和 Sarah 使用的用户目录，它们都由服务器共享。

一些最佳实践可以使工作更好：服务器上的用户和任何客户端工作站上的帐号有相同的用户 ID。此外，你的工作站和服务器应有相同的域名。检查相关配置文件应该确认。

```
alan@workstation1:~$ sudo getent passwd carl sarah
[sudo] password for alan:
carl:x:1020:1020:Carl,,,:/home/carl:/bin/bash
sarah:x:1021:1021:Sarah,,,:/home/sarah:/bin/bash

alan@workstation1:~$ sudo getent hosts
127.0.0.1       localhost
127.0.1.1       workstation1.mydatacenter.net workstation1
10.10.1.5       tree.mydatacenter.net tree
```

如你所见，客户端工作站和 NFS 服务器都在 `hosts` 文件中配置。我假设这是一个基本的家庭甚至小型办公室网络，可能缺乏适合的内部域名服务（即 DNS）。

### 安装软件包

你只需要安装两个软件包：用于 NFS 客户端的 `nfs-common` 和提供自动挂载的 `autofs`。

```
alan@workstation1:~$ sudo apt-get install nfs-common autofs
```

你可以验证 autofs 相关的文件是否已放在 `/etc` 目录中：

```
alan@workstation1:~$ cd /etc; ll auto*
-rw-r--r-- 1 root root 12596 Nov 19  2015 autofs.conf
-rw-r--r-- 1 root root   857 Mar 10  2017 auto.master
-rw-r--r-- 1 root root   708 Jul  6  2017 auto.misc
-rwxr-xr-x 1 root root  1039 Nov 19  2015 auto.net*
-rwxr-xr-x 1 root root  2191 Nov 19  2015 auto.smb*
alan@workstation1:/etc$
```

### 配置 autofs

现在你需要编辑其中几个文件并添加 `auto.home` 文件。首先，将以下两行添加到文件 `auto.master` 中：

```
/mnt/tree  /etc/auto.misc
/home/tree  /etc/auto.home
```

每行以挂载 NFS 共享的目录开头。继续创建这些目录：

```
alan@workstation1:/etc$ sudo mkdir /mnt/tree /home/tree
```

接下来，将以下行添加到文件 `auto.misc`：

```
ourfiles        -fstype=nfs     tree:/share/ourfiles
```

该行表示 autofs 将挂载 `auto.master` 文件中匹配 `auto.misc` 的 `ourfiles` 共享。如上所示，这些文件将在 `/mnt/tree/ourfiles` 目录中。

第三步，使用以下行创建文件 `auto.home`：

```
*               -fstype=nfs     tree:/home/&
```

该行表示 autofs 将挂载 `auto.master` 文件中匹配 `auto.home` 的用户共享。在这种情况下，Carl 和 Sarah 的文件将分别在目录 `/home/tree/carl` 或 `/home/tree/sarah`中。星号 `*`（称为通配符）使每个用户的共享可以在登录时自动挂载。`＆` 符号也可以作为表示服务器端用户目录的通配符。它们的主目录会相应地根据 `passwd` 文件映射。如果你更喜欢本地主目录，则无需执行此操作。相反，用户可以将其用作特定文件的简单远程存储。

最后，重启 `autofs` 守护进程，以便识别并加载这些配置的更改。

```
alan@workstation1:/etc$ sudo service autofs restart
```

### 测试 autofs

如果更改文件 `auto.master` 中的列出目录，并运行 `ls` 命令，那么不会立即看到任何内容。例如，切换到目录 `/mnt/tree`。首先，`ls` 的输出不会显示任何内容，但在运行 `cd ourfiles` 之后，将自动挂载 `ourfiles` 共享目录。 `cd` 命令也将被执行，你将进入新挂载的目录中。

```
carl@workstation1:~$ cd /mnt/tree
carl@workstation1:/mnt/tree$ ls
carl@workstation1:/mnt/tree$ cd ourfiles
carl@workstation1:/mnt/tree/ourfiles$
```

为了进一步确认正常工作，`mount` 命令会显示已挂载共享的细节。

```
carl@workstation1:~$ mount

tree:/mnt/share/ourfiles on /mnt/tree/ourfiles type nfs4 (rw,relatime,vers=4.0,rsize=131072,wsize=131072,namlen=255,hard,proto=tcp,timeo=600,retrans=2,sec=sys,clientaddr=10.10.1.22,local_lock=none,addr=10.10.1.5)

```

对于 Carl 和 Sarah，`/home/tree` 目录工作方式相同。

我发现在我的文件管理器中添加这些目录的书签很有用，可以用来快速访问。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/6/using-autofs-mount-nfs-shares

作者：[Alan Formy-Duval][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/alanfdoss
[1]:https://wiki.archlinux.org/index.php/autofs
