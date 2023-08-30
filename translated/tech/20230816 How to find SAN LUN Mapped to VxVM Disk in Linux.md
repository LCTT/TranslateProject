[#]: subject: "How to find SAN LUN Mapped to VxVM Disk in Linux"
[#]: via: "https://www.2daygeek.com/find-san-lun-mapping-with-vxvm-disk-veritas-linux/"
[#]: author: "Prakash Subramanian https://www.2daygeek.com/author/prakash/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

如何在 Linux 中查找映射到 VxVM 磁盘的 SAN LUN
======

我们过去写过几篇文章来查找映射到块设备/磁盘的 LUN ID，但是当你管理 **[VCS 集群][1]**时，在某些情况下你可能需要映射 LUN 用于 VxFS 文件系统扩展的 VxVM (Veritas Volume Manager) 磁盘的 ID。

这篇短文介绍了如何在 Linux 中查找与 VxVM 磁盘关联的 LUN 号。

**推荐阅读：**

  * **[如何在 Linux 中查找 SAN 磁盘 LUN id][2]**
  * **[如何在 Linux 中将 ASM 磁盘映射到物理磁盘][3]**
  * **[如何在 Linux 中映射 SAN LUN、磁盘和文件系统][4]**
  * **[如何在 Linux 中映射 LUN、磁盘、LVM 和文件系统][5]**



### 在 Linux 中查找映射到 VxVM 磁盘的 LUN 号的 Shell 脚本

这个方便的 shell 脚本可帮助你识别哪个存储 LUN 与 Linux 上的哪个 VxVM 磁盘关联。

#### 这个脚本是如何工作的

该脚本按照以下步骤收集和打印这些信息。

  * 它收集系统上活动**“磁盘组”(DG)**的列表
  * 查找与相应 DG 关联的**“设备名称”**。
  * 接下来，它列出了与各个设备映射的**“块设备”**。
  * 最后收集与这些块设备关联的 **LUN ID** 并将它们全部打印在一起，如 DG 名称、块设备名称和 LUN 编号。



```

    vi VxVM_disk_mapping_with_LUN_number.sh

    #!/bin/bash
    ###########################################################
    # Purpose: Mapping LUN Number to VxVM Disk in Linux
    # Author: 2DayGeek
    # Version: v1.0
    ###########################################################

    echo "DG_Name           Block_Device            LUN_Number"
    echo "-------------------------------------------------------------------"
    for dg_name in `vxdg list | awk '{print $1}' | grep -v NAME`
    do
     for d_name in `vxdisk -e list | grep -i $dg_name | awk '{print $1}'
      do
        for b_device in `vxdisk list $d_name | grep -w state=enabled | awk '{print $1}' | head -1`
        do
         echo "$dg_name --> $b_device --> $(lsscsi --scsi | grep $b_device | awk '{print $NF}'"
        done
      done
    done | column -t

```

设置shell脚本文件的可执行权限。

```

    chmod +x VxVM_disk_mapping_with_LUN_number.sh

```

最后执行脚本查看结果。

```

    sh VxVM_disk_mapping_with_LUN_number.sh

```

你的输出将类似于此。但是，DG 名称、块设备和 LUN 会与此不同。

![][6]

如果你想即时运行上述脚本，请使用下面的单行脚本。

```

    # for dg_name in `vxdg list | awk '{print $1}' | grep -v NAME`; do for d_name in `vxdisk -e list | grep -i $dg_name | awk '{print $1}'; do for b_device in `vxdisk list $d_name | grep -w state=enabled | awk '{print $1}' | head -1`; do echo "$dg_name --> $b_device --> $(lsscsi --scsi | grep $b_device | awk '{print $NF}'"; done; done; done | column -t

    apachedg   -->  sde -->  3600d0230000000000e11404639558823
    apachedg   -->  sdf -->  3600d0230000000000e11404639558824
    apachedg   -->  sdg -->  3600d0230000000000e11404639558825
    sftpdg     -->  sdh -->  3600d0230000000000e11404639558826
    sftpdg     -->  sdi -->  3600d0230000000000e11404639558827

```

##### 总结

在本教程中，我们向你展示了如何在 Linux 中查找与 VxVM (Veritas Volume Manager) 磁盘映射的 LUN 号。

如果你有任何问题或反馈，请随时在下面发表评论。

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/find-san-lun-mapping-with-vxvm-disk-veritas-linux/

作者：[Prakash Subramanian][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/prakash/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/category/veritas-cluster/
[2]: https://www.2daygeek.com/find-san-disk-lun-id-linux/
[3]: https://www.2daygeek.com/shell-script-map-oracle-asm-disks-physical-disk-lun-in-linux/
[4]: https://www.2daygeek.com/map-san-lun-physical-disk-filesystem-linux/
[5]: https://www.2daygeek.com/map-san-lun-physical-disk-filesystem-lvm-info-linux/
[6]: https://www.2daygeek.com/wp-content/uploads/2023/07/find-san-lun-mapping-with-vxvm-disk-veritas-linux-1024x298.jpg
