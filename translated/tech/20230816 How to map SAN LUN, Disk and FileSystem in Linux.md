[#]: subject: "How to map SAN LUN, Disk and FileSystem in Linux"
[#]: via: "https://www.2daygeek.com/map-san-lun-physical-disk-filesystem-linux/"
[#]: author: "Rasool Cool https://www.2daygeek.com/author/rasool/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

如何在 Linux 中映射 SAN LUN、磁盘和文件系统
======

对于某些需求，你可能需要找到映射到逻辑单元号 (LUN) 和文件系统 (FS) 的块设备，以进行文件系统扩展或灾难恢复 (DR) 活动。

当你管理更大的基础设施时，类似的活动可能会经常发生。假设有超过 1000 台服务器托管各种应用。

**参考以下类似文章：**

  * **[如何在 Linux 中查找 SAN 磁盘 LUN id][1]**
  * **[如何在 Linux 中将 ASM 磁盘映射到物理磁盘][2]**

在本文中，我们将向你展示如何在 Linux 中映射物理磁盘、存储 LUN 和文件系统 (FS)。

### 将物理磁盘映射到 Linux 中的存储 LUN 和文件系统的 Shell 脚本

这个小 shell 脚本可帮助你识别哪些 SAN 磁盘映射到 Linux 上的哪些块设备和文件系统。

```

    vi block_device_mapping_with_LUN_FS.sh

    #!/bin/bash
    for lunmap in `lsblk | grep disk | grep ^s | awk '{print $1}'`
    do
    for mpoint in `lsblk /dev/$lunmpa | grep lvm | awk '{print $NF}'`
    do
    echo "$lunmap --> $mpoint --> $(smartctl -a /dev/$lunmap | grep "Logical Unit id" | awk -F":" '{print $2}')"
    done
    done

```

设置 “block_device_mapping_with_LUN_FS.sh” 文件的可执行权限。

```

    chmod +x block_device_mapping_with_LUN_FS.sh

```

最后运行脚本查看结果。

```

    sh block_device_mapping_with_LUN_FS.sh

```

![][3]

**注意：** 在上面的输出中，设备 sda 不会显示任何 LUN 信息，因为它是从 VMWare 端添加的虚拟磁盘，没有任何 LUN。其他 3 个磁盘是从存储映射的，这就是我们能够看到 LUN 信息的原因。

如果你想即时运行该脚本，请使用下面的一行脚本。

```

    for lunmap in `lsblk | grep disk | grep ^s | awk '{print $1}'`; do for mpoint in `lsblk /dev/$lunmpa | grep lvm | awk '{print $NF}'`; do echo "$lunmap --> $mpoint --> $(smartctl -a /dev/$lunmap | grep "Logical Unit id" | awk -F":" '{print $2}')"; done; done

    sda --> /
    sda --> /usr
    sda --> /opt
    sda --> /tmp
    sda --> /var
    sda --> /home
    sdb --> /data -->      0x3600d0230000000000e1140463955737c
    sdc --> /app -->      0x3600d0230000000000e114046395577cd
    sdd --> /backup -->      0x3600d0230000000000e11404639558cc5

```

##### 总结

在本教程中，我们向你展示了如何在 Linux 上检查 SAN 提供的 LUN 以及底层操作系统磁盘和关联的文件系统。

如果你有任何问题或反馈，请随时在下面发表评论。

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/map-san-lun-physical-disk-filesystem-linux/

作者：[Rasool Cool][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/rasool/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/find-san-disk-lun-id-linux/
[2]: https://www.2daygeek.com/shell-script-map-oracle-asm-disks-physical-disk-lun-in-linux/
[3]: https://www.2daygeek.com/wp-content/uploads/2023/06/map-san-lun-physical-disk-filesystem-linux-1a-1024x364.jpg
