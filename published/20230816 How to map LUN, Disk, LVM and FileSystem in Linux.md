[#]: subject: "How to map LUN, Disk, LVM and FileSystem in Linux"
[#]: via: "https://www.2daygeek.com/map-san-lun-physical-disk-filesystem-lvm-info-linux/"
[#]: author: "Rasool Cool https://www.2daygeek.com/author/rasool/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16160-1.html"

如何在 Linux 中映射 LUN、磁盘、LVM 和文件系统
======

![][0]

在某些情况下，你需要映射存储 LUN（逻辑单元号）、块设备、LVM（LV 和 VG 名称）和文件系统（FS）信息以进行文件系统扩展或灾难恢复（DR）操作。

这是大多数 Linux 管理员的例行活动，我们通常使用一些脚本来显示针对 SAN LUN 的块设备映射，然后我们将手动添加 LVM 和文件系统信息来完成操作。

今后，你无需手动干预此活动，因为这些信息可以通过 Shell 脚本进行映射，如下所示。

参考以下类似文章：

  * [如何在 Linux 中查找 SAN 磁盘 LUN id][1]
  * [如何在 Linux 中将 ASM 磁盘映射到物理磁盘][2]
  * [如何在 Linux 中映射 SAN LUN、磁盘和文件系统][3]

### 在 Linux 中映射 LUN、磁盘、LVM 和文件系统的 Shell 脚本

这个 Shell 脚本可帮助你识别哪些 SAN 磁盘映射到 Linux 上的哪些块设备、LV、VG 和文件系统。

**请注意：** 我们排除了 `sda` 磁盘，因为这是操作系统（OS）盘，它有多个分区。

```
vi block_device_mapping_with_LUN_FS_LVM.sh
```

```
#!/bin/bash
for bdevice in `lsblk | grep disk | awk '{print $1}' | grep -v 'sda'`; do
    for mpoint in `lsblk /dev/$bdevice | grep lvm | awk '{print $NF}'`; do
        LVM_INFO=`lvs -o +devices | grep -i $bdevice | awk '{print $1,$2}'`
        LUN_ID=`lsscsi --scsi | grep $bdevice | awk '{print $NF}'`
        echo "$bdevice --> $mpoint --> $LVM_INFO --> $LUN_ID"
    done
done

```

设置 `block_device_mapping_with_LUN_FS_LVM.sh` 文件的可执行权限。

```
chmod +x block_device_mapping_with_LUN_FS_LVM.sh
```

最后运行脚本查看结果。

```
sh block_device_mapping_with_LUN_FS_LVM.sh
```

![][4]

**注意：** 在上面的输出中，设备 `sdb` 不会显示任何 LUN 信息，因为它是从 VMWare 端添加的虚拟磁盘，没有任何 LUN。其他 3 块磁盘是从存储映射的，这就是为什么可以看到 LUN 信息。

如果你想即时运行上述脚本，请使用下面的一行脚本。

```
for bdevice in `lsblk | grep disk | awk '{print $1}' | grep -v 'sda'`; do for mpoint in `lsblk /dev/$bdevice | grep lvm | awk '{print $NF}'`; do LVM_INFO=`lvs -o +devices | grep -i $bdevice | awk '{print $1,$2}'`; LUN_ID=`lsscsi --scsi | grep $bdevice | awk '{print $NF}'`; echo "$bdevice --> $mpoint --> $LVM_INFO --> $LUN_ID"; done; done
```

```
sdb --> [SWAP] --> swap2lv swapvg --> -
sdc --> /appserver --> appserver_lv appserver_vg --> 360000670000415600477312020662021
sdd --> /data --> data_lv data_vg --> 360000670000415600477312020662022
sde --> /backup --> backup_lv backup_vg --> 360000670000415600477312020662023
```

### 总结

在本教程中，我们向你展示了如何在 Linux 上检查 SAN 提供的 LUN 以及底层操作系统磁盘、LV 名称、VG 名称和关联的文件系统。

如果你有任何问题或反馈，请随时在下面发表评论。

*（题图：MJ/f5da2270-4e5a-4b2c-8998-fae974214384）*

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/map-san-lun-physical-disk-filesystem-lvm-info-linux/

作者：[Rasool Cool][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/rasool/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/find-san-disk-lun-id-linux/
[2]: https://www.2daygeek.com/shell-script-map-oracle-asm-disks-physical-disk-lun-in-linux/
[3]: https://www.2daygeek.com/map-san-lun-physical-disk-filesystem-linux/
[4]: https://www.2daygeek.com/wp-content/uploads/2023/06/map-san-lun-physical-disk-filesystem-lvm-info-linux-1024x155.jpg
[0]: https://img.linux.net.cn/data/attachment/album/202309/05/150634a78yslwka2lilnvr.jpg