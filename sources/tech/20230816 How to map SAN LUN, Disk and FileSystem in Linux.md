[#]: subject: "How to map SAN LUN, Disk and FileSystem in Linux"
[#]: via: "https://www.2daygeek.com/map-san-lun-physical-disk-filesystem-linux/"
[#]: author: "Rasool Cool https://www.2daygeek.com/author/rasool/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to map SAN LUN, Disk and FileSystem in Linux
======

For some requirements, you may need to find a block device mapped against a logical unit number (LUNs) and filesystem (FS) for FS expansion or disaster recovery (DR) activity.

Similar activity may happens frequently when you are managing the bigger infrastructure. Let’s say, more than 1000+ servers hosting various applications.

**Refer the following articles similar to this:**

  * **[How to Find SAN disk LUN id in Linux][1]**
  * **[How to map ASM disks to Physical disks in Linux][2]**



In this article, we will show you how to map physical disk, Storage LUN and FileSystem (FS) in Linux.

### Shell Script to map Physical disks to Storage LUNs and FileSystem in Linux

This small shell script helps you to identify which SAN disks are mapped to which Block devices and Filesystem on Linux.

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

Set an executable permission to ‘block_device_mapping_with_LUN_FS.sh’ file.

```

    chmod +x block_device_mapping_with_LUN_FS.sh

```

Finally run the script to view the results.

```

    sh block_device_mapping_with_LUN_FS.sh

```

![][3]

**Make a Note:** In the above output, device sda won’t show any LUN info because it’s a virtual disk added from VMWare end, which doesn’t have any LUN. Other 3 disks are mapped from Storage that’s why we are able to see LUN info.

If you would like to run the script on the fly, use the following one liner script.

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

##### Wrapping Up

In this tutorial, we’ve shown you how to check LUN presented from SAN with underlying OS disk and associated Filesystem on Linux.

If you have any questions or feedback, feel free to comment below.

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/map-san-lun-physical-disk-filesystem-linux/

作者：[Rasool Cool][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/rasool/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/find-san-disk-lun-id-linux/
[2]: https://www.2daygeek.com/shell-script-map-oracle-asm-disks-physical-disk-lun-in-linux/
[3]: https://www.2daygeek.com/wp-content/uploads/2023/06/map-san-lun-physical-disk-filesystem-linux-1a-1024x364.jpg
