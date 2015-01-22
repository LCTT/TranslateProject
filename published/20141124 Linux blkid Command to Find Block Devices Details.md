用 Linux blkid 命令查找块设备详情
================================================================================
今天我们将会向你展示如何使用 **lsblk** 和 **blkid** 工具来查找关于块设备的信息，我们使用的是一台安装了 CentOS 7.0 的机器。

## lsblk ##

**lsblk** 是一个 Linux 工具，它会显示有关你系统里所有可用块设备的信息。它从 [sysfs 文件系统][1] 中获取信息。默认情况下，这个工具将会以树状格式显示（除了内存虚拟磁盘外的）所有块设备。

### lsblk 默认输出 ###

默认情况下 lsblk 会将块设备输出为树状格式：

- **NAME** —— 设备的名称

- **MAJ:MIN**  —— Linux 操作系统中的每个设备都以一个文件表示，对块（磁盘）设备来说，这里用主次设备编号来描述设备。

- **RM** —— 可移动设备。如果这是一个可移动设备将显示 1，否则显示 0。

- **TYPE** —— 设备的类型

- **MOUNTPOINT** —— 设备挂载的位置

- **RO** —— 对于只读文件系统，这里会显示 1，否则显示 0。

- **SIZE** —— 设备的容量

![](http://blog.linoxide.com/wp-content/uploads/2014/10/lsblk.jpg)

### 显示设备的所有者 ###

若想显示设备所有者相关的信息，包括文件的所属用户、所属组以及文件系统挂载的模式，你可以使用 -m 选项，像这样：

    lsblk -m

![](http://blog.linoxide.com/wp-content/uploads/2014/10/lsblk-m.jpg)

### 列出设备块 ###

如果你只想要列出设备，而不想让他们以树状输出，你可以使用 -l 选项：

    lsblk -l

### 在脚本中使用 ###

高级技巧：如果你想要在脚本中使用而希望剔除表头，你可以这样使用 -n 选项：

    lsblk -ln

![](http://blog.linoxide.com/wp-content/uploads/2014/10/lsblk-ln.jpg)

## blkid ##

**blkid** 命令是一个命令行工具，它可以显示关于可用块设备的信息。它可以识别一个块设备内容的类型（如文件系统、交换区）以及从内容的元数据（如卷标或 UUID 字段）中获取属性（如 tokens 和键值对）。它主要有两类作用：用指定的键值对搜索一个设备，或是显示一个或多个设备的键值对。

### blkid 使用方法 ###

不添加任何参数直接运行 blkid 将会输出所有可用的设备、它们的通用唯一识别码（UUID）、文件系统类型以及卷标（如果有设置过）。

    # blkid

![](http://blog.linoxide.com/wp-content/uploads/2014/10/blkid.jpg)

### 根据名字或 UUID 列出设备 ###

如果你只想显示一个特定设备的信息，你可以将该设备的名字作为选项添加在 blkid 后面：

    # blkid /dev/sda1

如果你知道一个设备的 UUID 而想要知道它的设备名，你可以用 -U 选项，像这样：

    # blkid -U d3b1dcc2-e3b0-45b0-b703-d6d0d360e524

![](http://blog.linoxide.com/wp-content/uploads/2014/10/blkid-uuid.jpg)

### 详细信息 ###

如果你想要获取更多详细信息，你可以使用 -p 和 -o udev 选项来将它们用整齐的格式显示出来，像这样：

    # blkid -po udev /dev/sda1

![](http://blog.linoxide.com/wp-content/uploads/2014/10/blkid-po.jpg)

### 重置缓存 ###

有时候设备列表可能不会更新，如果遇到这种情况你可以使用 -g 选项来清理 blkid 的缓存，从而清除已经不存在的设备。

    # blkid -g

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-command-lsblk-blkid/

作者：[Adrian Dinu][a]
译者：[felixonmars](https://github.com/felixonmars)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/adriand/
[1]:https://www.kernel.org/doc/Documentation/filesystems/sysfs.txt
