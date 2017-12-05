Linux 用户的逻辑卷管理指南
============================================================ 

![Logical Volume Management (LVM)](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003499_01_other11x_cc.png?itok=I_kCDYj0 "Logical Volume Management (LVM)")
Image by : opensource.com

管理磁盘空间对系统管理员来说是一件重要的日常工作。因为磁盘空间耗尽而去启动一系列的耗时而又复杂的任务，来提升磁盘分区中可用的磁盘空间。它会要求系统离线。通常会涉及到安装一个新的硬盘、引导至恢复模式或者单用户模式、在新硬盘上创建一个分区和一个文件系统、挂载到临时挂载点去从一个太小的文件系统中移动数据到较大的新位置、修改 /etc/fstab 文件内容去反映出新分区的正确设备名、以及重新引导去重新挂载新的文件系统到正确的挂载点。

我想告诉你的是，当 LVM （逻辑卷管理）首次出现在 Fedora Linux 中时，我是非常抗拒它的。我最初的反应是，我并不需要在我和我的设备之间有这种额外的抽象层。结果是我错了，逻辑卷管理是非常有用的。

LVM 让磁盘空间管理非常灵活。它提供的功能诸如在文件系统已挂载和活动时，很可靠地增加磁盘空间到一个逻辑卷和它的文件系统中，并且，它允许你将多个物理磁盘和分区融合进一个可以分割成逻辑卷的单个卷组中。

卷管理也允许你去减少分配给一个逻辑卷的磁盘空间数量，但是，这里有两个要求，第一，卷必须是未挂载的。第二，在卷空间调整之前，文件系统本身的空间大小必须被减少。

有一个重要的提示是，文件系统本身必须允许重新调整大小的操作。当重新提升文件系统大小的时候，EXT2、3、和 4 文件系统都允许离线（未挂载状态）或者在线（挂载状态）重新调整大小。你应该去认真了解你打算去调整的文件系统的详细情况，去验证它们是否可以完全调整大小，尤其是否可以在线调整大小。

### 在使用中扩展一个文件系统

在我安装一个新的发行版到我的生产用机器中之前，我总是喜欢在一个 VirtualBox 虚拟机中运行这个新的发行版一段时间，以确保它没有任何的致命的问题存在。在几年前的一个早晨，我在我的主要使用的工作站上的虚拟机中安装一个新发行的 Fedora 版本。我认为我有足够的磁盘空间分配给安装虚拟机的主文件系统。但是，我错了，大约在第三个安装时，我耗尽了我的文件系统的空间。幸运的是，VirtualBox 检测到了磁盘空间不足的状态，并且暂停了虚拟机，然后显示了一个明确指出问题所在的错误信息。

请注意，这个问题并不是虚拟机磁盘太小造成的，而是由于宿主机上空间不足，导致虚拟机上的虚拟磁盘在宿主机上的逻辑卷中没有足够的空间去扩展。

因为许多现在的发行版都缺省使用了逻辑卷管理，并且在我的卷组中有一些可用的空余空间，我可以分配额外的磁盘空间到适当的逻辑卷，然后在使用中扩展宿主机的文件系统。这意味着我不需要去重新格式化整个硬盘，以及重新安装操作系统或者甚至是重启机器。我不过是分配了一些可用空间到适当的逻辑卷中，并且重新调整了文件系统的大小 — 所有的这些操作都在文件系统在线并且运行着程序的状态下进行的，虚拟机也一直使用着宿主机文件系统。在调整完逻辑卷和文件系统的大小之后，我恢复了虚拟机的运行，并且继续进行安装过程，就像什么问题都没有发生过一样。

虽然这种问题你可能从来也没有遇到过，但是，许多人都遇到过重要程序在运行过程中发生磁盘空间不足的问题。而且，虽然许多程序，尤其是 Windows 程序，并不像 VirtualBox 一样写的很好，且富有弹性，Linux 逻辑卷管理可以使它在不丢失数据的情况下去恢复，也不需要去进行耗时的安装过程。

### LVM 结构

逻辑卷管理的磁盘环境结构如下面的图 1 所示。逻辑卷管理允许多个单独的硬盘和/或磁盘分区组合成一个单个的卷组（VG）。卷组然后可以再划分为逻辑卷（LV）或者被用于分配成一个大的单一的卷。普通的文件系统，如EXT3 或者 EXT4，可以创建在一个逻辑卷上。

在图 1 中，两个完整的物理硬盘和一个第三块硬盘的一个分区组合成一个单个的卷组。在这个卷组中创建了两个逻辑卷，和一个文件系统，比如，可以在每个逻辑卷上创建一个 EXT3 或者 EXT4 的文件系统。

![lvm.png](https://opensource.com/sites/default/files/resize/images/life-uploads/lvm-520x222.png)

 _图 1: LVM 允许组合分区和整个硬盘到卷组中_ 

在一个主机上增加磁盘空间是非常简单的，在我的经历中，这种事情是很少的。下面列出了基本的步骤。你也可以创建一个完整的新卷组或者增加新的空间到一个已存在的逻辑卷中，或者创建一个新的逻辑卷。

### 增加一个新的逻辑卷

有时候需要在主机上增加一个新的逻辑卷。例如，在被提示包含我的 VirtualBox 虚拟机的虚拟磁盘的 /home 文件系统被填满时，我决定去创建一个新的逻辑卷，用于去存储虚拟机数据，包含虚拟磁盘。这将在我的 /home 文件系统中释放大量的空间，并且也允许我去独立地管理虚拟机的磁盘空间。

增加一个新的逻辑卷的基本步骤如下：

1.  如有需要，安装一个新硬盘。

2.  可选 1： 在硬盘上创建一个分区

3.  在硬盘上创建一个完整的物理卷（PV）或者一个分区。

4.  分配新的物理卷到一个已存在的卷组（VG）中，或者创建一个新的卷组。

5.  从卷空间中创建一个新的逻辑卷（LV）。

6.  在新的逻辑卷中创建一个文件系统。

7.  在 /etc/fstab 中增加适当的条目以挂载文件系统。

8.  挂载文件系统。

为了更详细的介绍，接下来将使用一个示例作为一个实验去教授关于 Linux 文件系统的知识。

### 示例

这个示例展示了怎么用命令行去扩展一个已存在的卷组，并给它增加更多的空间，在那个空间上创建一个新的逻辑卷，然后在逻辑卷上创建一个文件系统。这个过程一直在运行和挂载的文件系统上执行。

警告：仅 EXT3 和 EXT4 文件系统可以在运行和挂载状态下调整大小。许多其它的文件系统，包括 BTRFS 和 ZFS 是不能这样做的。

### 安装硬盘

如果在系统中现有硬盘上的卷组中没有足够的空间去增加，那么可能需要去增加一块新的硬盘，然后去创建空间增加到逻辑卷中。首先，安装物理硬盘，然后，接着执行后面的步骤。

### 从硬盘上创建物理卷

首先需要去创建一个新的物理卷（PV）。使用下面的命令，它假设新硬盘已经分配为 /dev/hdd。

```
pvcreate /dev/hdd
```

在新硬盘上创建一个任意分区并不是必需的。创建的物理卷将被逻辑卷管理器识别为一个新安装的未处理的磁盘或者一个类型为 83 的Linux 分区。如果你想去使用整个硬盘，创建一个分区并没有什么特别的好处，以及另外的物理卷部分的元数据所使用的磁盘空间。

### 扩展已存在的卷组

在这个示例中，我将扩展一个已存在的卷组，而不是创建一个新的；你可以选择其它的方式。在物理磁盘已经创建之后，扩展已存在的卷组（VG）去包含新 PV 的空间。在这个示例中，已存在的卷组命名为：MyVG01。

```
vgextend /dev/MyVG01 /dev/hdd
```

### 创建一个逻辑卷

首先，在卷组中从已存在的空余空间中创建逻辑卷。下面的命令创建了一个 50 GB 大小的 LV。这个卷组的名字为 MyVG01，然后，逻辑卷的名字为 Stuff。

```
lvcreate -L +50G --name Stuff MyVG01
```

### 创建文件系统

创建逻辑卷并不会创建文件系统。这个任务必须被单独执行。下面的命令在新创建的逻辑卷中创建了一个 EXT4 文件系统。

```
mkfs -t ext4 /dev/MyVG01/Stuff
```

### 增加一个文件系统卷标

增加一个文件系统卷标，更易于在文件系统以后出现问题时识别它。

```
e2label /dev/MyVG01/Stuff Stuff
```

### 挂载文件系统

在这个时候，你可以创建一个挂载点，并在 /etc/fstab 文件系统中添加合适的条目，以挂载文件系统。

你也可以去检查并校验创建的卷是否正确。你可以使用 **df**、**lvs**、和 **vgs** 命令去做这些工作。

### 提示

过去几年来，我学习了怎么去做让逻辑卷管理更加容易的一些知识，希望这些提示对你有价值。

*   除非你有一个明确的原因去使用其它的文件系统外，推荐使用可扩展的文件系统。除了 EXT2、3、和 4 外，并不是所有的文件系统都支持调整大小。EXT 文件系统不但速度快，而且它很高效。在任何情况下，如果默认的参数不能满足你的需要，它们（指的是文件系统参数）可以通过一位知识丰富的系统管理员来调优它。

*   使用有意义的卷和卷组名字。

*   使用 EXT 文件系统标签

我知道，像我一样，大多数的系统管理员都抗拒逻辑卷管理。我希望这篇文章能够鼓励你至少去尝试一个 LVM。如果你能那样做，我很高兴；因为，自从我使用它之后，我的硬盘管理任务变得如此的简单。


### 关于作者

 [![](https://opensource.com/sites/default/files/styles/profile_pictures/public/david-crop.jpg?itok=oePpOpyV)][10]
 
 David Both - 是一位 Linux 和开源软件的倡导者，住在 Raleigh, North Carolina。他在 IT 行业工作了 40 多年，在 IBM 工作了 20 多年。在 IBM 期间，他在 1981 年为最初的  IBM PC 编写了第一个培训课程。他曾教授红帽的 RHCE 课程，并在 MCI Worldcom、Cisco和 North Carolina 工作。他已经使用 Linux 和开源软件工作了将近 20 年。... [more about David Both][7][More about me][8]

--------------------------------------------------------------------------------

via: https://opensource.com/business/16/9/linux-users-guide-lvm

作者：[David Both](a)
译者：[qhwdw](https://github.com/qhwdw)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/dboth
[1]:https://opensource.com/resources/what-is-linux?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[2]:https://opensource.com/resources/what-are-linux-containers?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[3]:https://developers.redhat.com/promotions/linux-cheatsheet/?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[4]:https://developers.redhat.com/cheat-sheet/advanced-linux-commands-cheatsheet?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[5]:https://opensource.com/tags/linux?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[6]:https://opensource.com/business/16/9/linux-users-guide-lvm?rate=79vf1js7A7rlp-I96YFneopUQqsa2SuB-g-og7eiF1U
[7]:https://opensource.com/users/dboth
[8]:https://opensource.com/users/dboth
[9]:https://opensource.com/user/14106/feed
[10]:https://opensource.com/users/dboth
[11]:https://opensource.com/users/dboth
[12]:https://opensource.com/users/dboth
[13]:https://opensource.com/business/16/9/linux-users-guide-lvm#comments
[14]:https://opensource.com/tags/business
[15]:https://opensource.com/tags/linux
[16]:https://opensource.com/tags/how-tos-and-tutorials
[17]:https://opensource.com/tags/sysadmin
