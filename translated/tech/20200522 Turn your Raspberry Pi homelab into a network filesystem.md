[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Turn your Raspberry Pi homelab into a network filesystem)
[#]: via: (https://opensource.com/article/20/5/nfs-raspberry-pi)
[#]: author: (Chris Collins https://opensource.com/users/clcollins)

把你的树莓派家庭实验室变成一个网络文件系统
======

> 使用 NFS 服务器将共享文件系统添加到你的家庭实验室。

![Blue folders flying in the clouds above a city skyline][1]

共享文件系统是为家庭实验室增加通用性和功能性的好方法。在实验室中为客户端共享一个集中的文件系统，使得组织数据、进行备份和共享数据变得相当容易。这对于在多个服务器上进行负载均衡的网络应用和 [Kubernetes][2] 使用的持久化卷来说，尤其有用，因为它允许在任何数量的节点上用持久化数据来轮转 Pod。

无论你的家庭实验室是由普通计算机、多余的企业服务器，还是树莓派或其他单板计算机（SBC）组成，共享文件系统都是一种有用的资产，而网络文件系统（NFS）服务器是创建共享文件系统的好方法。

我之前写过关于[建立“家庭私有云”][3]的文章，一个由树莓派或其他 SBC 组成的家庭实验室，也许还有其他一些消费类硬件或台式 PC。NFS 服务器是这些组件之间共享数据的理想方式。由于大多数 SBC 的操作系统（OS）是通过 SD 卡运行的，所以存在一些挑战。尤其是在用作计算机的操作系统磁盘时，SD 卡的故障率会增加，它们并不是用来不断地读写的。你真正需要的是一个真正的硬盘：它们通常比 SD 卡每 GB 价格便宜，特别是对于较大的磁盘，而且它们不太可能持续发生故障。树莓派 4 的现在带有 USB 3.0 接口，而 USB 3.0 硬盘无处不在，价格也很实惠。这是一个完美的搭配。在这个项目中，我将使用一个 2TB 的 USB 3.0 外置硬盘插入运行 NFS 服务器的树莓派 4 中。

![Raspberry Pi with a USB hard disk][4]

### 安装 NFS 服务器软件

我在树莓派上运行 Fedora 服务器，但这个项目也可以在其他发行版上运行。要在 Fedora 上运行 NFS 服务器，你需要 `nfs-utils` 包，幸运的是它已经安装好了（至少在 Fedora 31 中是这样）。如果你打算运行 NFSv3 服务，你还需要 `rpcbind` 包，但它不是 NFSv4 的严格要求。

如果你的系统中还没有这些软件包，请使用 `dnf` 命令安装它们。

```
# Intall nfs-utils and rpcbind
$ sudo dnf install nfs-utils rpcbind
```

Raspbian 是另一个流行的操作系统，与树莓派一起使用，设置几乎完全相同。软件包名称不同，但这是唯一的主要区别。要在运行 Raspbian 的系统上安装 NFS 服务器，你需要以下软件包。

  * `nfs-common`：这些文件是 NFS 服务器和客户端的通用文件。
  * `nfs-kernel-server`：主要的 NFS 服务器软件包。

Raspbian 使用 `apt-get` 来管理软件包（而不是像 Fedora 那样使用 `dnf`），所以用它来安装软件包。

```
# For a Raspbian system, use apt-get to install the NFS packages
$ sudo apt-get install nfs-common nfs-kernel-server
```

### 准备一个 USB 硬盘作为存储设备

正如我上面提到的，USB 硬盘是为树莓派或其他 SBC 提供存储的好选择，尤其是用于操作系统磁盘镜像的 SD 卡并不适合这个用途。对于家里的私有云，你可以使用廉价的 USB 3.0 硬盘进行大规模存储。插入磁盘，使用 `fdisk` 找出分配给它的设备 ID，就可以使用它工作了。

```
# Find your disk using fdisk
# Unrelated disk content omitted
$ sudo fdisk -l

Disk /dev/sda: 1.84 TiB, 2000398933504 bytes, 3907029167 sectors
Disk model: BUP Slim BK
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0xe3345ae9

Device     Boot Start        End    Sectors  Size Id Type
/dev/sda1        2048 3907028991 3907026944  1.8T 83 Linux
```

为了清楚起见，在上面的例子输出中，除了我感兴趣的那个磁盘，我省略了所有的磁盘的信息。你可以看到我想使用的 USB 磁盘被分配了设备 `/dev/sda`，你可以看到一些关于型号的信息（`Disk model: BUP Slim BK`），这有助于我识别正确的磁盘。该磁盘已经有了一个分区，它的大小也证实了它就是我要找的磁盘。

注意：请确保正确识别你的设备的磁盘和分区。它可能与上面的例子不同。

在驱动器上创建的每个分区都有一个特殊的通用唯一标识符（UUID）。计算机使用 UUID 来确保它使用 `/etc/fstab` 配置文件将正确的分区挂载到正确的位置。你可以使用 `blkid` 命令检索分区的 UUID。

```
# Get the block device attributes for the partition
# Make sure to use the partition that applies in your case.  It may differ.
$ sudo blkid /dev/sda1

/dev/sda1: LABEL="backup" UUID="bd44867c-447c-4f85-8dbf-dc6b9bc65c91" TYPE="xfs" PARTUUID="e3345ae9-01"
```

在这里，`/dev/sda1` 的 UUID 是 `bd44867c-447c-4f85-8dbf-dc6b9bc65c91`。你的 UUID 会有所不同，所以要记下来。

### 配置树莓派在启动时挂载这个磁盘，然后挂载它

现在你已经确定了要使用的磁盘和分区，你需要告诉计算机如何挂载它，每次启动时都要这样做。现在就去挂载它。因为这是一个 USB 磁盘，可能会被拔掉，所以你还要配置树莓派在启动时如果磁盘没有插入或有其它不可用情况时不要等待。

在 Linux 中，通过将分区添加到 `/etc/fstab` 配置文件中，包括你希望它被挂载的位置和一些参数来告诉计算机如何处理它。这个例子将把分区挂载到 `/srv/nfs`，所以先创建这个路径。

```
# Create the mountpoint for the disk partition
$ sudo mkdir -p /srv/nfs
```

接下来，使用以下语法格式修改 `/etc/fstab` 文件：

```
<disk id>     <mountpoint>      <filesystem type>     <options>     <fs_freq> <fs_passno>
```

使用你之前确定的 UUID 作为磁盘 ID。正如我在上一步提到的，挂载点是 `/srv/nfs`。对于文件系统类型，通常最好选择实际的文件系统，但是因为这是一个 USB 磁盘，所以使用 `auto`。

对于选项值，使用 `nosuid,nodev,nofail`。

#### 关于手册页的一个旁白

也就是说，有*很多*可能的选项，手册（`man`）页是查看它们的最好方法。查看 `fstab` 的手册页是一个很好的开始。

```
# Open the man page for fstab
$ man fstab
```

这将打开与 `fstab` 命令相关的手册/文档。在手册页中，每个选项都被分解成了不同的内容，以显示它的作用和常用的选择。例如，“第四个字段（`fs_mntopts`）”给出了该字段中可用的选项的一些基本信息，并引导你到 `man (8) mount` 中获取更深入的 `mount` 选项描述。这是有道理的，因为 `/etc/fstab` 文件，本质上是告诉计算机如何自动挂载磁盘，就像你手动使用 `mount` 命令一样。

你可以从 `mount` 的手册页中获得更多关于你将使用的选项的信息。括号中的数字 8 表示手册页的章节。在这里，第 8 节是*系统管理工具和守护进程*。

你可以从 `man` 的手册页中得到标准章节的列表。

回到挂载磁盘，让我们看看 `man (8) mount`。

```
# Open Section 8 of the man pages for mount
$ man (8) mount
```

在这个手册页中，你可以查看上面列出的选项的作用。

  * `nosuid`：不理会 suid/guid 位。不允许放在 U 盘上的任何文件以 root 身份执行。这是一个良好的安全实践。
  * `nodev`：不识别文件系统中的字符或块特殊设备，即不理会在 U 盘上的任何设备节点。另一个良好的安全实践。
  * `nofail`：如果设备不存在，不要记录任何错误。这是一个 U 盘，可能没有插入，所以在这种情况下，它将被忽略。

回到你正在添加到 `/etc/fstab` 文件的那一行，最后还有两个选项：`fs_freq` 和 `fs_passno`。它们的值与一些老旧的选项有关，*大多数*现代系统对这两个选项都只用 `0`，特别是对 USB 磁盘上的文件系统而言。`fs_freq` 的值与 `dump` 命令和文件系统的转储有关。`fs_passno` 的值定义了启动时要 `fsck` 的文件系统及其顺序。如果设置了这个值，通常根分区是 `1`，其他文件系统是 `2`。将该值设置为 `0` 以跳过在该分区上使用 `fsck`。

在你喜欢的编辑器中，打开 `/etc/fstab` 文件，添加 U 盘上分区的条目，将这里的值替换成前面步骤中得到的值。

```
# With sudo, or as root, add the partition info to the /etc/fstab file
UUID="bd44867c-447c-4f85-8dbf-dc6b9bc65c91"    /srv/nfs    auto    nosuid,nodev,nofail,noatime 0 0
```

### 启用并启动 NFS 服务器

安装好软件包，并将分区添加到你的 `/etc/fstab` 文件中，现在你可以开始启动 NFS 服务器了。在 Fedora 系统中，你需要启用和启动两个服务：`rpcbind` 和 `nfs-server`。使用 `systemctl` 命令来完成这项工作。

```
# Start NFS server and rpcbind
$ sudo systemctl enable rpcbind.service
$ sudo systemctl enable nfs-server.service
$ sudo systemctl start rpcbind.service
$ sudo systemctl start nfs-server.service
```

在 Raspbian 或其他基于 Debian 的发行版上，你只需要使用 `systemctl` 命令启用并启动 `nfs-kernel-server` 服务即可，方法同上。

#### RPCBind

rpcbind 工具用于将远程过程调用（RPC）服务映射到其监听的端口。根据 rpcbind 手册页：

> “当一个 RPC 服务启动时，它会告诉 rpcbind 它正在监听的地址，以及它准备服务的 RPC 程序号。当客户机想对给定的程序号进行 RPC 调用时，它首先与服务器机器上的 rpcbind 联系，以确定 RPC 请求应该发送到哪里的地址。”

在 NFS 服务器这个案例中，rpcbind 会将 NFS 的协议号映射到 NFS 服务器监听的端口上。但是，NFSv4 不需要使用 rpcbind。如果你*只*使用 NFSv4 （通过从配置中删除版本 2 和版本 3），则不需要使用 rpcbind。我把它放在这里是为了向后兼容 NFSv3。

### 导出挂载的文件系统

NFS 服务器根据另一个配置文件 `/etc/exports` 来决定与哪些远程客户端共享（导出）哪些文件系统。这个文件只是一个 IP（或子网）与要共享的文件系统的映射，以及一些选项（只读或读写、root 去除等）。该文件的格式是：

```
<目录>     <主机>(选项)
```

在这个例子中，你将导出挂载到 `/srv/nfs` 的分区。这是“目录”部分。

第二部分，主机，包括你要导出这个分区的主机。这些主机可以指定为具有完全限定域名（FQDN）或主机名的单个主机、主机的 IP 地址、一组使用通配符字符来匹配域（如 *.example.org）、IP 网络（如无类域间路由 CIDR 标识）或网组表示的主机。

第三部分包括应用于导出的选项。

  * `ro/rw`：将文件系统导出为只读或读写。
  * `wdelay`：如果即将进行另一次写入，则推迟对磁盘的写入，以提高性能（如果你使用的是固态 USB 磁盘，这*可能*没有那么有用）
  * `root_squash`：防止客户机上的任何 root 用户在主机上有 root 权限，并将 root UID 设置为 `nfsnobody` 作为安全防范措施。

测试导出你挂载在 `/srv/nfs` 处的分区到一个客户端 —— 例如，一台笔记本电脑。确定你的客户机的 IP 地址（我的笔记本是 `192.168.2.64`，但你的可能会不同）。你可以把它共享到一个大的子网，但为了测试，请限制在单个 IP 地址上。这个 IP 的 CIDR 标识是 `192.168.2.64/32`；`/32` 子网代表一个 IP。

使用你喜欢的编辑器，编辑 `/etc/exports` 文件，写上你的目录、主机 CIDR 以及 `rw` 和 `root_squash` 选项。

```
# Edit your /etc/exports file like so, substituting the information from your systems
/srv/nfs    192.168.2.64/32(rw,root_squash)
```

注：如果你从另一个地方复制了 `/etc/exports` 文件，或者用副本覆盖了原文件，你可能需要恢复该文件的 SELinux 上下文。你可以使用 `restorecon` 命令来恢复。

```
# Restore the SELinux context of the /etc/exports file
$ sudo restorecon /etc/exports
```

完成后，重新启动 NFS 服务器，以接收对 `/etc/exports` 文件的更改。

```
# Restart the nfs server
$ sudo systemctl restart nfs-server.service
```

### 给 NFS 服务打开防火墙

有些系统，默认不运行[防火墙服务][6]。比如 Raspbian，默认是开放 iptables 规则，不同服务打开的端口在机器外部立即就可以使用。相比之下，Fedora 服务器默认运行的是 firewalld 服务，所以你必须为 NFS 服务器（以及 rpcbind，如果你将使用 NFSv3）打开端口。你可以通过 `firewall-cmd` 命令来实现。

检查 firewalld 使用的区域并获取默认区域。对于 Fedora 服务器，这是 `FedoraServer` 区域。

```
# List the zones
# Output omitted for brevity
$ sudo firewall-cmd --list-all-zones

# Retrieve just the default zone info
# Make a note of the default zone
$ sudo firewall-cmd --get-default-zone

# Permanently add the nfs service to the list of allowed ports
$ sudo firewall-cmd --add-service=nfs --permanent

# For NFSv3, we need to add a few more ports, nfsv3, rpc-mountd, rpc-bind
$ sudo firewall-cmd --add-service=(nfs3,mountd,rpc-bind)

# Check the services for the zone, substituting the default zone in use by your system
$ sudo firewall-cmd --list-services --zone=FedoraServer

# If all looks good, reload firewalld
$ sudo firewall-cmd --reload
```

就这样，你已经成功地将 NFS 服务器与你挂载的 U 盘分区配置在一起，并将其导出到你的测试系统中进行共享。现在你可以在你添加到导出列表的系统上测试挂载它。

### 测试 NFS 导出

首先，从 NFS 服务器上，在 `/srv/nfs` 目录下创建一个文件来读取。

```
# Create a test file to share
echo "Can you see this?" >> /srv/nfs/nfs_test
```

现在，在你添加到导出列表中的客户端系统上，首先确保 NFS 客户端包已经安装好。在 Fedora 系统上，这是 `nfs-utils` 包，可以用 `dnf` 安装。Raspbian 系统有 `libnfs-utils` 包，可以用 `apt-get` 安装。

安装 NFS 客户端包：

```
# Install the nfs-utils package with dnf
$ sudo dnf install nfs-utils
```

一旦安装了客户端包，你就可以测试 NFS 的导出了。同样在客户端，使用带有 NFS 服务器 IP 和导出路径的 `mount` 命令，并将其挂载到客户端的一个位置，在这个测试中是 `/mnt` 目录。在这个例子中，我的 NFS 服务器的 IP 是 `192.168.2.109`，但你的可能会有所不同。

```
# Mount the export from the NFS server to the client host
# Make sure to substitute the information for your own hosts
$ sudo mount 192.168.2.109:/srv/nfs /mnt

# See if the nfs_test file is visible:
$ cat /mnt/nfs_test
Can you see this?
```

成功了！你现在已经有了一个可以工作的 NFS 服务器，可以与多个主机共享文件，允许多个读/写访问，并为你的数据提供集中存储和备份。家庭实验室的共享存储有很多选择，但 NFS 是一种古老的、高效的、可以添加到你的“家庭私有云”家庭实验室中的好选择。本系列未来的文章将扩展如何在客户端上自动挂载 NFS 共享，以及如何将 NFS 作为 Kubernetes 持久卷的存储类。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/5/nfs-raspberry-pi

作者：[Chris Collins][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clcollins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003499_01_cloud21x_cc.png?itok=5UwC92dO (Blue folders flying in the clouds above a city skyline)
[2]: https://opensource.com/resources/what-is-kubernetes
[3]: https://linux.cn/article-12277-1.html
[4]: https://opensource.com/sites/default/files/uploads/raspberrypi_with_hard-disk.jpg (Raspberry Pi with a USB hard disk)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://opensource.com/article/18/9/linux-iptables-firewalld
