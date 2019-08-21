[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Map Oracle ASM Disk Against Physical Disk And LUNs In Linux?)
[#]: via: (https://www.2daygeek.com/shell-script-map-oracle-asm-disks-physical-disk-lun-in-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

How To Map Oracle ASM Disk Against Physical Disk And LUNs In Linux?
======

You might already know about ASM, Device Mapper Multipathing (DM-Multipathing) if you are working quit long time as a Linux administrator.

There are multiple ways to check these information. However, you will be getting part of the information when you use the default commands.

It doesn’t show you all together in the single output.

If you want to check all together in the single output then we need to write a small shell script to achieve this.

We have added two shell script to get those information and you can use which one is suitable for you.

Major and Minor numbers can be used to match the physical devices in Linux system.

This tutorial helps you to find which ASM disk maps to which Linux partition or DM Device.

If you want to **[manage Oracle ASM disks][1]** (such as start, enable, stop, list, query and etc) then navigate to following URL.

### What Is ASMLib?

ASMLib is an optional support library for the Automatic Storage Management feature of the Oracle Database.

Automatic Storage Management (ASM) simplifies database administration and greatly reduces kernel resource usage (e.g. the number of open file descriptors).

It eliminates the need for the DBA to directly manage potentially thousands of Oracle database files, requiring only the management of groups of disks allocated to the Oracle Database.

ASMLib allows an Oracle Database using ASM more efficient and capable access to the disk groups it is using.

### What Is Device Mapper Multipathing (DM-Multipathing)?

Device Mapper Multipathing or DM-multipathing is a Linux host-side native multipath tool, which allows us to configure multiple I/O paths between server nodes and storage arrays into a single device by utilizing device-mapper.

### Method-1 : Shell Script To Map ASM Disks To Physical Devices?

In this shell script we are using for loop to achieve the results.

Also, we are not using any ASM related commands.

```
# vi asm_disk_mapping.sh

#!/bin/bash

ls -lh /dev/oracleasm/disks > /tmp/asmdisks1.txt

for ASMdisk in `cat /tmp/asmdisks1.txt | tail -n +2 | awk '{print $10}'`

do

minor=$(grep -i "$ASMdisk" /tmp/asmdisks1.txt | awk '{print $6}')

major=$(grep -i "$ASMdisk" /tmp/asmdisks1.txt | awk '{print $5}' | cut -d"," -f1)

phy_disk=$(ls -l /dev/* | grep ^b | grep "$major, *$minor" | awk '{print $10}')

echo "ASM disk $ASMdisk is associated on $phy_disk [$major, $minor]"

done
```

Set an executable permission to port_scan.sh file.

```
$ chmod +x asm_disk_mapping.sh
```

Finally run the script to achieve this.

```
# sh asm_disk_mapping.sh

ASM disk MP4E6D_DATA01 is associated on /dev/dm-1
3600a0123456789012345567890234q11  [253,  1]
ASM disk MP4E6E_DATA02 is associated on /dev/dm-2
3600a0123456789012345567890234q12  [253,  2]
ASM disk MP4E6F_DATA03 is associated on /dev/dm-3
3600a0123456789012345567890234q13  [253,  3]
ASM disk MP4E70_DATA04 is associated on /dev/dm-4
3600a0123456789012345567890234q14  [253,  4]
ASM disk MP4E71_DATA05 is associated on /dev/dm-5
3600a0123456789012345567890234q15  [253,  5]
ASM disk MP4E72_DATA06 is associated on /dev/dm-6
3600a0123456789012345567890234q16  [253,  6]
ASM disk MP4E73_DATA07 is associated on /dev/dm-7
3600a0123456789012345567890234q17  [253,  7]
```

### Method-2 : Shell Script To Map ASM Disks To Physical Devices?

In this shell script we are using while loop to achieve the results.

Also, we are using ASM related commands.

```
# vi asm_disk_mapping_1.sh

#!/bin/bash

/etc/init.d/oracleasm listdisks > /tmp/asmdisks.txt

while read -r ASM_disk

do

major="$(/etc/init.d/oracleasm querydisk -d $ASM_disk | awk -F[ '{ print $2 }'| awk -F] '{ print $1 }' | cut -d"," -f1)"

minor="$(/etc/init.d/oracleasm querydisk -d $ASM_disk | awk -F[ '{ print $2 }'| awk -F] '{ print $1 }' | cut -d"," -f2)"

phy_disk="$(ls -l /dev/* | grep ^b | grep "$major, *$minor" | awk '{ print $10 }')"

echo "ASM disk $ASM_disk is associated on $phy_disk  [$major, $minor]"

done < /tmp/asmdisks.txt
```

Set an executable permission to port_scan.sh file.

```
$ chmod +x asm_disk_mapping_1.sh
```

Finally run the script to achieve this.

```
# sh asm_disk_mapping_1.sh

ASM disk MP4E6D_DATA01 is associated on /dev/dm-1
3600a0123456789012345567890234q11  [253,  1]
ASM disk MP4E6E_DATA02 is associated on /dev/dm-2
3600a0123456789012345567890234q12  [253,  2]
ASM disk MP4E6F_DATA03 is associated on /dev/dm-3
3600a0123456789012345567890234q13  [253,  3]
ASM disk MP4E70_DATA04 is associated on /dev/dm-4
3600a0123456789012345567890234q14  [253,  4]
ASM disk MP4E71_DATA05 is associated on /dev/dm-5
3600a0123456789012345567890234q15  [253,  5]
ASM disk MP4E72_DATA06 is associated on /dev/dm-6
3600a0123456789012345567890234q16  [253,  6]
ASM disk MP4E73_DATA07 is associated on /dev/dm-7
3600a0123456789012345567890234q17  [253,  7]
```

### How To List Oracle ASM Disks?

If you would like to list only Oracle ASM disk then use the below command to List available/created Oracle ASM disks in Linux.

```
# oracleasm listdisks

ASM_Disk1
ASM_Disk2
ASM_Disk3
ASM_Disk4
ASM_Disk5
ASM_Disk6
ASM_Disk7
```

### How To List Oracle ASM Disks Against Major And Minor Number?

If you would like to map Oracle ASM disks against major and minor number then use the below commands to List available/created Oracle ASM disks in Linux.

```
# for ASMdisk in `oracleasm listdisks`; do /etc/init.d/oracleasm querydisk -d $ASMdisk; done

Disk "ASM_Disk1" is a valid Disk on device [253, 1]
Disk "ASM_Disk2" is a valid Disk on device [253, 2]
Disk "ASM_Disk3" is a valid Disk on device [253, 3]
Disk "ASM_Disk4" is a valid Disk on device [253, 4]
Disk "ASM_Disk5" is a valid Disk on device [253, 5]
Disk "ASM_Disk6" is a valid Disk on device [253, 6]
Disk "ASM_Disk7" is a valid Disk on device [253, 7]
```

Alternatively, we can get the same results using the ls command.

```
# ls -lh /dev/oracleasm/disks

total 0
brw-rw---- 1 oracle oinstall 253,  1 May 19 14:44 ASM_Disk1
brw-rw---- 1 oracle oinstall 253,  2 May 19 14:44 ASM_Disk2
brw-rw---- 1 oracle oinstall 253,  3 May 19 14:44 ASM_Disk3
brw-rw---- 1 oracle oinstall 253,  4 May 19 14:44 ASM_Disk4
brw-rw---- 1 oracle oinstall 253,  5 May 19 14:44 ASM_Disk5
brw-rw---- 1 oracle oinstall 253,  6 May 19 14:44 ASM_Disk6
brw-rw---- 1 oracle oinstall 253,  7 May 19 14:44 ASM_Disk7
```

### How To List Physical Disks Against LUNs?

If you would like to map physical disks against LUNs then use the below command.

```
# multipath -ll | grep NETAPP

3600a0123456789012345567890234q11 dm-1 NETAPP,LUN C-Mode
3600a0123456789012345567890234q12 dm-2 NETAPP,LUN C-Mode
3600a0123456789012345567890234q13 dm-3 NETAPP,LUN C-Mode
3600a0123456789012345567890234q14 dm-4 NETAPP,LUN C-Mode
3600a0123456789012345567890234q15 dm-5 NETAPP,LUN C-Mode
3600a0123456789012345567890234q16 dm-6 NETAPP,LUN C-Mode
3600a0123456789012345567890234q17 dm-7 NETAPP,LUN C-Mode
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/shell-script-map-oracle-asm-disks-physical-disk-lun-in-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/start-stop-restart-enable-reload-oracleasm-service-linux-create-scan-list-query-rename-delete-configure-oracleasm-disk/
