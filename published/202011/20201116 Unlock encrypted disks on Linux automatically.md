[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12851-1.html)
[#]: subject: (Unlock encrypted disks on Linux automatically)
[#]: via: (https://opensource.com/article/20/11/nbde-linux)
[#]: author: (Curt Warfield https://opensource.com/users/rcurtiswarfield)

自动解锁 Linux 上的加密磁盘
======

> 通过使用网络绑定磁盘加密（NBDE），无需手动输入密码即可打开加密磁盘。

![](https://img.linux.net.cn/data/attachment/album/202011/23/104735lmx18sxxs18f4xcc.jpg)

从安全的角度来看，对敏感数据进行加密以保护其免受窥探和黑客的攻击是很重要的。<ruby>Linux 统一密钥设置<rt>Linux Unified Key Setup</rt></ruby>（[LUKS][2]）是一个很好的工具，也是 Linux 磁盘加密的通用标准。因为它将所有相关的设置信息存储在分区头部中，所以它使数据迁移变得简单。

要使用 LUKS 配置加密磁盘或分区，你需要使用 [cryptsetup][3] 工具。不幸的是，加密磁盘的一个缺点是，每次系统重启或磁盘重新挂载时，你都必须手动提供密码。

然而，<ruby>网络绑定磁盘加密<rt>Network-Bound Disk Encryption</rt></ruby>（NBDE） 可以在没有任何用户干预的情况下自动安全地解锁加密磁盘。它可以在一些 Linux 发行版中使用，包括从 Red Hat Enterprise Linux 7.4、CentOS 7.4 和 Fedora 24 开始，以及之后的后续版本。

NBDE 采用以下技术实现：

* [Clevis 框架][4]：一个可插拔的框架工具，可自动解密和解锁 LUKS 卷
* [Tang 服务器][5]：用于将加密密钥绑定到网络状态的服务

Tang 向 Clevis 客户端提供加密密钥。据 Tang 的开发人员介绍，这为密钥托管服务提供了一个安全、无状态、匿名的替代方案。

由于 NBDE 使用客户端-服务器架构，你必须同时配置客户端和服务器。你可以在你的本地网络上使用一个虚拟机作为 Tang 服务器。

### 服务器安装

用 sudo 安装 Tang：

```
sudo yum install tang -y
```

启用 Tang 服务器：

```
sudo systemctl enable tangd.socket --now
```

Tang 服务器工作在 80 端口，需加入到 firewalld 防火墙。添加相应的 firewalld 规则：


```
sudo  firewall-cmd --add-port=tcp/80 --perm
sudo firewall-cmd --reload
```

现在安装好了服务器。

### 客户端安装

在本例中，假设你已经添加了一个名为 `/dev/vdc` 的新的 1GB 磁盘到你的系统中。

使用 `fdisk` 或 `parted` 创建主分区：

```
sudo fdisk /dev/vdc
```

完成以下步骤来安装客户端：

```
Welcome to fdisk (util-linux 2.23.2).

Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.

Device does not contain a recognized partition table
Building a new DOS disklabel with disk identifier 0x4a6812d4.

Command (m for help):
```

输入 `n` 来创建新的分区：

```
Partition type:
   p   primary (0 primary, 0 extended, 4 free)
   e   extended  
Select (default p):
```

按下**回车**键选择主分区：


```
Using default response p
Partition number (1-4, default 1):
```

按下回车键选择默认分区号：

```
First sector (2048-2097151, default 2048):
Using default value 2048
Last sector, +sectors or +size{K,M,G} (2048-2097151, default 2097151):
```

按回车键选择最后一个扇区：

```
Using default value 2097151
Partition 1 of type Linux and of size 1023 MiB is set

Command (m for help): wq
```

输入 `wq` 保存更改并退出 `fdisk`：

```
The partition table has been altered!

Calling ioctl() to re-read partition table.
Syncing disks.
```

运行 `partprobe` 通知系统分区表的变化：

```
sudo partprobe
```

使用 `sudo` 安装 cryptsetup 软件包：

```
sudo yum install cryptsetup -y
```

使用 `cryptsetup luksFormat` 命令对磁盘进行加密。当提示时，你需要输入大写的 `YES`，并输入密码来加密磁盘：

```
sudo cryptsetup luksFormat /dev/vdc1
WARNING!
========
This will overwrite data on /dev/vdc1 irrevocably.

Are you sure? (Type uppercase yes):

Enter passphrase for /dev/vdc1:
Verify passphrase:
```

使用 `cryptsetup luksOpen` 命令将加密的分区映射到一个逻辑设备上。例如，使用 `encryptedvdc1` 作为名称。你还需要再次输入密码：

```
sudo cryptsetup luksOpen /dev/vdc1 encryptedvdc1
Enter passphrase for /dev/vdc1:
```

加密分区现在在 `/dev/mapper/encryptedvdc1` 中可用。

在加密的分区上创建一个 XFS 文件系统：

```
sudo mkfs.xfs /dev/mapper/encryptedvdc1
```

创建一个挂载加密分区的目录：

```
sudo mkdir /encrypted
```

使用 `cryptsetup luksClose` 命令锁定分区：

```
cryptsetup luksClose encryptedvdc1
```

使用 `sudo` 安装 Clevis 软件包：

```
sudo yum install clevis clevis-luks clevis-dracut -y
```

修改 `/etc/crypttab`，在启动时打开加密卷：

```
sudo vim /etc/crypttab
```

增加以下一行：

```
encryptedvdc1       /dev/vdc1  none   _netdev
```

修改 `/etc/fstab`，在重启时或启动时自动挂载加密卷：

```
sudo vim /etc/fstab
```

增加以下一行：

```
/dev/mapper/encryptedvdc1   /encrypted       xfs    _netdev        1 2
```

在这个例子中，假设 Tang 服务器的 IP 地址是 `192.168.1.20`。如果你喜欢，也可以使用主机名或域名。

运行以下 `clevis` 命令：

```
sudo clevis bind luks -d /dev/vdc1 tang '{"url":"http://192.168.1.20"}'
The advertisement contains the following signing keys:

rwA2BAITfYLuyNiIeYUMBzkhk7M

Do you wish to trust these keys? [ynYN] Y
Enter existing LUKS password:
```

输入 `Y` 接受 Tang 服务器的密钥，并提供现有的 LUKS 密码进行初始设置。

通过 `systemctl` 启用 `clevis-luks-askpass.path`，以防止非根分区被提示输入密码。

```
sudo systemctl enable clevis-luks-askpass.path
```

客户端已经安装完毕。现在，每当你重启服务器时，加密后的磁盘应该会自动解密，并通过 Tang 服务器取回密钥进行挂载。

如果 Tang 服务器因为任何原因不可用，你需要手动提供密码，才能解密和挂载分区。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/nbde-linux

作者：[Curt Warfield][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/rcurtiswarfield
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/security-lock-password.jpg?itok=KJMdkKum (Lock)
[2]: https://en.wikipedia.org/wiki/Linux_Unified_Key_Setup
[3]: https://gitlab.com/cryptsetup/cryptsetup
[4]: https://github.com/latchset/clevis
[5]: https://github.com/latchset/tang