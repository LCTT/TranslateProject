[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10771-1.html)
[#]: subject: (Managing Partitions with sgdisk)
[#]: via: (https://fedoramagazine.org/managing-partitions-with-sgdisk/)
[#]: author: (Gregory Bartholomew https://fedoramagazine.org/author/glb/)

使用 sgdisk 管理分区
======

![][1]

[Roderick W. Smith][2] 的 `sgdisk` 命令可在命令行中管理硬盘的分区。下面将介绍使用它所需的基础知识。

使用 sgdisk 的大多数基本功能只需要了解以下六个参数：

1、`-p` *打印* 分区表：

```
# sgdisk -p /dev/sda
```

2、 `-d x` *删除* 分区 x：

```
# sgdisk -d 1 /dev/sda
```

3、 `-n x:y:z` 创建一个编号 x 的*新*分区，从 y 开始，从 z 结束：

```
# sgdisk -n 1:1MiB:2MiB /dev/sda
```

4、`-c x:y` *更改*分区 x 的名称为 y：

```
# sgdisk -c 1:grub /dev/sda
```

5、`-t x:y` 将分区 x 的*类型*更改为 y：

```
# sgdisk -t 1:ef02 /dev/sda
```

6、`–list-types` 列出分区类型代码：

```
# sgdisk --list-types
```

![The SGDisk Command][3]

如你在上面的例子中所见，大多数命令都要求将要操作的硬盘的[设备文件名][4]指定为最后一个参数。

可以组合上面的参数，这样你可以一次定义所有分区：

```
# sgdisk -n 1:1MiB:2MiB -t 1:ef02 -c 1:grub /dev/sda
```

在值的前面加上 `+` 或 `–` 符号，可以为某些字段指定相对值。如果你使用相对值，`sgdisk` 会为你做数学运算。例如，上面的例子可以写成：

```
# sgdisk -n 1:1MiB:+1MiB -t 1:ef02 -c 1:grub /dev/sda
```

`0` 值对于以下几个字段有特殊意义：

* 对于*分区号*字段，0 表示应使用下一个可用编号（编号从 1 开始）。
* 对于*起始地址*字段，0 表示使用最大可用空闲块的头。硬盘开头的一些空间始终保留给分区表本身。
* 对于*结束地址*字段，0 表示使用最大可用空闲块的末尾。

通过在适当的字段中使用 `0` 和相对值，你可以创建一系列分区，而无需预先计算任何绝对值。例如，如果在一块空白硬盘中，以下 `sgdisk` 命令序列将创建典型 Linux 安装所需的所有基本分区：

```
# sgdisk -n 0:0:+1MiB -t 0:ef02 -c 0:grub /dev/sda
# sgdisk -n 0:0:+1GiB -t 0:ea00 -c 0:boot /dev/sda
# sgdisk -n 0:0:+4GiB -t 0:8200 -c 0:swap /dev/sda
# sgdisk -n 0:0:0 -t 0:8300 -c 0:root /dev/sda
```

上面的例子展示了如何为基于 BIOS 的计算机分区硬盘。基于 UEFI 的计算机上不需要 [grub 分区][5]。由于 `sgdisk` 在上面的示例中为你计算了所有绝对值，因此你可以在基于 UEFI 的计算机上跳过第一个命令，并且可以无需修改即可运行其余命令。同样，你可以跳过创建交换分区，并且不需要修改其余命令。

还有使用一个命令删除硬盘上所有分区的快捷方式：

```
# sgdisk --zap-all /dev/sda
```

关于最新和详细信息，请查看手册页：

```
$ man sgdisk
```

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/managing-partitions-with-sgdisk/

作者：[Gregory Bartholomew][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/glb/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/04/managing-partitions-816x345.png
[2]: https://www.rodsbooks.com/
[3]: https://fedoramagazine.org/wp-content/uploads/2019/04/sgdisk.jpg
[4]: https://en.wikipedia.org/wiki/Device_file
[5]: https://en.wikipedia.org/wiki/BIOS_boot_partition
