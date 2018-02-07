# 如何在 Ubuntu 上使用 ZFS 文件系统

在 Linux 系统上，有大量的[文件系统][1]可以使用，那么我们为什么还要尝试一个新的文件系统？他们都工作的很好，不是吗？但是他们并不完全相同，其中的一些文件系统具有非常突出的优点，例如 ZFS。

### 为什么选择 ZFS

ZFS 非常的优秀。 这是一个真正现代文件系统，内置的功能对于处理大量的数据很有意义。

现在，如果您正在考虑将 ZFS 用于您的超高速 NVMe SSD，这可能不是一个最佳选择。 它比别的文件系统要慢，不过，这完全没有问题， 它旨在存储大量的数据并保持安全。

ZFS 消除了建立传统 RAID 阵列(译者注：独立磁盘冗余阵列)的需要。 相反，您可以创建 ZFS 池，甚至可以随时将驱动器添加到这些池中。 ZFS 池的行为操作与 RAID 几乎完全相同，但功能内置于文件系统中。

ZFS 也可以替代 LVM (译者注：逻辑盘卷管理)，使您能够动态分区和管理分区，而无需处理较低级别的事务，也不必担心相关的风险。

这也是一个 CoW (译者注：Copy on Write)文件系统。 没有太多的技术性，这意味着 ZFS 可以保护您的数据免受逐渐损坏的影响。 ZFS 创建文件的校验和，并允许您将这些文件回滚到以前的工作版本。

### 安装 ZFS 

![Install ZFS on Ubuntu][2]

在 Ubuntu 上安装 ZFS 非常简单，但对于 Ubuntu LTS (译者注：长时间支持版本)和最新版本来说，这个过程稍有不同。

 **Ubuntu 16.04 LTS**
```
 sudo apt install zfs
```

 **Ubuntu 17.04 and Later**
```
 sudo apt install zfsutils
```

当你安装好程序后，可以使用 ZFS 提供的工具创建 ZFS 驱动器和分区。

### 创建池

![Create ZFS Pool][3]

在 ZFS 中，池大致相当于 RAID 。 他们很灵活且易于操作。

#### RAID0

RAID0 只是把你的硬盘集中到一个巨大的驱动器上。 它可以提高你的驱动器速度，(译者注：数据条带化后，并行访问，提高文件读取速度)但是如果你的驱动器有损坏，你可能会失丢失数据。

要使用 ZFS 实现 RAID0，只需创建一个普通的池。

```
sudo zpool create your-pool /dev/sdc /dev/sdd
```

#### RAID1/MIRROR

您可以在 ZFS 中使用 `mirror` 关键字来实现 RAID1 功能。 RAID1 创建一个 1 对 1 的驱动器副本。 这意味着您的数据不断备份。 它也提高了性能。 当然，你将一半的存储空间用于复制。

```
sudo zpool create your-pool mirror /dev/sdc /dev/sdd
```

#### RAID5/RAIDZ1

ZFS 将 RAID5 功能实现为 RAIDZ1。 RAID5 要求驱动器至少是 3 个。并允许您通过将备份奇偶校验数据写入驱动器空间的 1/3 来保留 2/3 的存储空间。 如果一个驱动器发生故障，阵列将保持联机状态，但应尽快更换发生故障的驱动器(译者注：与原文翻译略有不同，原文是驱动器的数目是三的倍数，根据 wiki， RAID5 至少需要 3 块驱动器，也可以从下面的命令中猜测)。

```
sudo zpool create your-pool raidz1 /dev/sdc /dev/sdd /dev/sde
```

#### RAID6/RAIDZ2

RAID6 与 RAID5 几乎完全相同，但它至少需要四个驱动器。 它将奇偶校验数据加倍，最多允许两个驱动器损坏，而不会导致阵列关闭。(译者注：这里也与原文略有出入，原文是驱动器的数目是四的倍数，根据 wiki ，RAID6 至少需要四个驱动器)

```
sudo zpool create your-pool raidz2 /dev/sdc /dev/sdd /dev/sde /dev/sdf
```

#### RAID10/Striped Mirror

RAID10 旨在通过数据条带化提高存取速度和数据冗余来成为一个两全其美的解决方案。 你至少需要四个驱动器，但只能访问一半的空间。 您可以通过在同一池中创建两个镜像来创建 RAID10 中的池。(译者注：这里也与原文略有出入，原文是驱动器的数目是四的倍数，根据 wiki， RAID10 至少需要四个驱动器)

```
sudo zpool create your-pool mirror /dev/sdc /dev/sdd mirror /dev/sde /dev/sdf
```

### 池的操作

![ZFS pool Status][4]

还有一些管理工具，一旦你创建了你的池，你就必须使用它。 首先，检查你的池的状态。

```
sudo zpool status
```

#### 更新

当你更新 ZFS 时，你也需要更新你的池。 当您检查他们的状态时，您的池会通知您任何更新。 要更新池，请运行以下命令。

```
sudo zpool upgrade your-pool
```

你也可以更新全部池。

```
sudo zpool upgrade -a
```

#### 添加驱动器

您也可以随时将驱动器添加到池中。 告诉 `zpool` 池的名称和驱动器的位置，它会处理好一切。

```
sudo zpool add your-pool /dev/sdx
```

### 其它的一些想法

![ZFS in File Browser][5]

ZFS 在您的池的根文件系统中创建一个目录。 您可以使用 GUI 文件管理器或 CLI (译者注：Command-line interface )按名称浏览它们。

ZFS 非常强大，还有很多其他的东西可以用它来做，但这些都是基础。 这是一个优秀的存储负载文件系统，即使它只是一个用于文件的硬盘驱动器的 RAID 阵列。 ZFS 在 NAS 系统上也非常出色。

无论 ZFS 的稳定性和可靠性如何，在您的硬盘上实施新的功能时，最好备份您的数据。

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/use-zfs-filesystem-ubuntu-linux/

作者：[Nick Congleton][a]
译者：[amwps290](https://github.com/amwps290)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/nickcongleton/
[1]:https://www.maketecheasier.com/best-linux-filesystem-for-ssd/
[2]:https://www.maketecheasier.com/assets/uploads/2017/09/zfs-install.jpg "Install ZFS on Ubuntu"
[3]:https://www.maketecheasier.com/assets/uploads/2017/09/zfs-create-pool.jpg "Create ZFS Pool"
[4]:https://www.maketecheasier.com/assets/uploads/2017/09/zfs-pool-status.jpg "ZFS pool Status"
[5]:https://www.maketecheasier.com/assets/uploads/2017/09/zfs-pool-open.jpg "ZFS in File Browser"
