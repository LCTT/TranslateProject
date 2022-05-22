如何使用 SSHFS 通过 SSH 挂载远程的 Linux 文件系统或者目录
============================

写这篇文章的主要目的就是提供一步一步的指导，关于如何使用 SSHFS 通过 SSH 挂载远程的 Linux 文件系统或目录。

这篇文章对于那些无论出于什么目的，希望在他们本地的系统中挂载远程的文件系统的用户或者系统管理员有帮助。我们通过 Linux 系统中的一个安装了 SSHFS 客户端进行实际测试，并且成功的挂载了远程的文件系统。

在我们进一步安装之前，让我们了解一下 SSHFS 的相关内容，以及它是如何工作的。

![](http://www.tecmint.com/wp-content/uploads/2012/08/Sshfs-Mount-Remote-Linux-Filesystem-Directory.png)
*Sshfs 挂载远程的 Linux 文件系统或者目录*

### 什么是 SSHFS？

SSHFS（Secure SHell FileSystem）是一个客户端，可以让我们通过 SSH 文件传输协议（SFTP）挂载远程的文件系统并且在本地机器上和远程的目录和文件进行交互。 

SFTP 是一种通过 SSH 协议提供文件访问、文件传输和文件管理功能的安全文件传输协议。因为 SSH 在网络中从一台电脑到另一台电脑传输文件的时候使用数据加密通道，并且 SSHFS 内置在 FUSE（用户空间的文件系统）内核模块，允许任何非特权用户在不修改内核代码的情况下创建他们自己的文件系统。

在这篇文章中，我们将会向你展示在任意 Linux 发行版上如何安装并且使用 SSHFS 客户端，在本地 Linux 机器上挂载远程的 Linux 文件系统或者目录。

#### 步骤1：在 Linux 系统上安装 SSHFS

默认情况下，sshfs 包不存在所有的主流 Linux 发行版中，你需要在你的 Linux 系统中启用 [epel 仓库][1]，在 Yum 命令行的帮助下安装 SSHFS 及其依赖。

```
# yum install sshfs
# dnf install sshfs              【在 Fedora 22+ 发行版上】
$ sudo apt-get install sshfs     【基于 Debian/Ubuntu 的系统】
```

#### 步骤2：创建 SSHFS 挂载目录

当你安装 SSHFS 包之后，你需要创建一个挂载点目录，在这儿你将要挂载你的远程文件系统。例如，我们在 /mnt/tecmint 下创建挂载目录。

```
# mkdir /mnt/tecmint
$ sudo mkdir /mnt/tecmint     【基于 Debian/Ubuntu 的系统】
```

### 步骤 3：使用 SSHFS 挂载远程的文件系统

当你已经创建你的挂载点目录之后，现在使用 root 用户运行下面的命令行，在 /mnt/tecmint 目录下挂载远程的文件系统。视你的情况挂载目录可以是任何目录。

下面的命令行将会在本地的 /mnt/tecmint 目录下挂载一个叫远程的一个 /home/tecmint 目录。（不要忘了使用你的 IP 地址和挂载点替换 x.x.x.x）。

```
# sshfs tecmint@x.x.x.x:/home/tecmint/ /mnt/tecmint
$ sudo sshfs -o allow_other tecmint@x.x.x.x:/home/tecmint/ /mnt/tecmint      【基于 Debian/Ubuntu 的系统】
```

如果你的 Linux 服务器配置为基于 SSH 密钥授权，那么你将需要使用如下所示的命令行指定你的公共密钥的路径。

```
# sshfs -o IdentityFile=~/.ssh/id_rsa tecmint@x.x.x.x:/home/tecmint/ /mnt/tecmint
$ sudo sshfs -o allow_other,IdentityFile=~/.ssh/id_rsa tecmint@x.x.x.x:/home/tecmint/ /mnt/tecmint     【基于 Debian/Ubuntu 的系统】
```

#### 步骤 4：验证远程的文件系统挂载成功

如果你已经成功的运行了上面的命令并且没有任何错误，你将会看到挂载在 /mnt/tecmint 目录下的远程的文件和目录的列表

```
# cd /mnt/tecmint
# ls
[root@ tecmint]# ls
12345.jpg                       ffmpeg-php-0.6.0.tbz2                Linux                                           news-closeup.xsl     s3.jpg
cmslogs                         gmd-latest.sql.tar.bz2               Malware                                         newsletter1.html     sshdallow
epel-release-6-5.noarch.rpm     json-1.2.1                           movies_list.php                                 pollbeta.sql
ffmpeg-php-0.6.0                json-1.2.1.tgz                       my_next_artical_v2.php                          pollbeta.tar.bz2
```

#### 步骤 5：使用 df -hT 命令检查挂载点

如果你运行 df -hT命令，你将会看到远程文件系统的挂载点。

```
# df -hT
```

样本输出：

```
Filesystem                          Type        Size  Used Avail Use% Mounted on
udev                                devtmpfs    730M     0  730M   0% /dev
tmpfs                               tmpfs       150M  4.9M  145M   4% /run
/dev/sda1                           ext4         31G  5.5G   24G  19% /
tmpfs                               tmpfs       749M  216K  748M   1% /dev/shm
tmpfs                               tmpfs       5.0M  4.0K  5.0M   1% /run/lock
tmpfs                               tmpfs       749M     0  749M   0% /sys/fs/cgroup
tmpfs                               tmpfs       150M   44K  150M   1% /run/user/1000
tecmint@192.168.0.102:/home/tecmint fuse.sshfs  324G   55G  253G  18% /mnt/tecmint
```

#### 步骤 6：永久挂载远程文件系统

为了永久的挂载远程的文件系统，你需要修改一个叫 `/etc/fstab` 的文件。照着做，使用你最喜欢的编辑器打开文件。

```
# vi /etc/fstab
$ sudo vi /etc/fstab     【基于 Debian/Ubuntu 的系统】         
```

移动到文件的底部并且添加下面的一行，保存文件并退出。下面条目表示使用默认的设置挂载远程的文件系统。

```
sshfs#tecmint@x.x.x.x:/home/tecmint/ /mnt/tecmint fuse.sshfs defaults 0 0
```

确保服务器之间允许 [SSH 无密码登录][2]，这样系统重启之后才能自动挂载文件系统。

如果你的服务器配置为基于 SSH 密钥的认证方式，请加入如下行：

```
sshfs#tecmint@x.x.x.x:/home/tecmint/ /mnt/tecmint fuse.sshfs IdentityFile=~/.ssh/id_rsa defaults 0 0
```

接下来，你需要更新 fstab 文件使修改生效。

```
# mount -a
$ sudo mount -a   【基于 Debian/Ubuntu 的系统】
```

#### 步骤 7：卸载远程的文件系统

为了卸载远程的文件系统，只需要发出以下的命令即可。

```
# umount /mnt/tecmint
```

目前为止就这样了，如果你在挂载远程文件系统的时候遇到任何问题或者需要任何帮助，请通过评论联系我们，如果你感觉这篇文章非常有用，请分享给你的朋友们。


-------------------------------------------------------------------------------

via: http://www.tecmint.com/sshfs-mount-remote-linux-filesystem-directory-using-ssh/

作者：[Ravi Saive][a]
译者：[yangmingming](https://github.com/yangmingming)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/admin/
[1]: https://linux.cn/article-2324-1.html
[2]: https://linux.cn/article-5444-1.html
