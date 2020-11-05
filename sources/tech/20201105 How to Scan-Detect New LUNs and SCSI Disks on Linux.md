[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Scan/Detect New LUNs and SCSI Disks on Linux)
[#]: via: (https://www.2daygeek.com/scan-detect-luns-scsi-disks-on-redhat-centos-oracle-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

How to Scan/Detect New LUNs and SCSI Disks on Linux
======

When the Linux system has connected to the SAN (Storage Area Network) you need to rescan the iSCSI service to discover new LUNs.

To do so, you must provide the WWN number of the Linux host and required LUN size to the storage team.

The following article will help you [**find the WWN number of a Linux host**][1].

Once the storage team has mapped the LUNs with the given Linux host, they will provide you with the new LUN details.

LUN in storage terms is referred to as serial-hex of LUN.

You need to scan the SCSI host to find new LUNs assigned by the storage team.

This can be done in two ways, scan each scsi host device or run the “rescan-scsi-bus.sh” script to detect new disks.

After scanning they can be found under the “/dev/disk/by-id” directory.

```
# ll /dev/disk/by-id

total 0
lrwxrwxrwx 1 root root 10 Jul 9 17:52 scsi-60a98000486e542d4f5a2f47694d684b -> ../../sdah
lrwxrwxrwx 1 root root 9 Jul 9 17:52 scsi-60a98000486e542d4f5a2f47694d684c -> ../../sdw
.
.
lrwxrwxrwx 1 root root 10 Jul 9 17:52 scsi-60a98000486e542d4f5a2f47694d684d -> ../../sdjk
lrwxrwxrwx 1 root root 10 Jul 9 17:52 scsi-60a98000486e542d4f5a2f47694d684e -> ../../sdaa
lrwxrwxrwx 1 root root 9 Jul 9 17:52 scsi-60a98000486e542d4f5a2f47694d684f -> ../../sdh
```

Also, you can find them using the Multipath command if you already have them configured with Multipath.

Multipath is mostly configured into the Oracle database server for better performance.

```
# multipath -ll

60a98000486e542d4f5a2f47694d684b dm-37 NETAPP,LUN C-Mode
size=512G features='3 queue_if_no_path pg_init_retries 50' hwhandler='1 alua' wp=rw
|-+- policy='round-robin 0' prio=50 status=active
| |- 1:0:4:18 sdoe 128:416 active ready running
| |- 0:0:4:18 sdpq 131:256 active ready running
| |- 0:0:5:18 sdsr 135:496 active ready running
| `- 1:0:5:18 sdsq 135:480 active ready running
`-+- policy='round-robin 0' prio=10 status=enabled
  |- 1:0:1:18 sdfw 131:32 active ready running
  |- 1:0:0:18 sdci 69:96 active ready running
  |- 0:0:1:18 sdbz 68:208 active ready running
  |- 0:0:0:18 sds 65:32 active ready running
  |- 1:0:3:18 sdmd 69:336 active ready running
  |- 1:0:2:18 sdjj 8:464 active ready running
  |- 0:0:3:34 sdjt 65:368 active ready running
  `- 0:0:2:34 sdgi 131:224 active ready running
```

This procedure works on Red Hat 6.x, 7.x and 8.x (RHEL – Red Hat Enterprise Linux) based systems such as CentOS and Oracle Linux.

### Method-1: How to Scan New LUNs and SCSI Disks on Linux Using the “/sys” Class File

The sysfs filesystem is a pseudo-filesystem which provides an interface to kernel data structures.

The files under sysfs provide information about devices, kernel modules, filesystems, and other kernel components.

The sysfs filesystem is commonly mounted at “/sys”. Typically, it is mounted automatically by the system.

You can use the echo command to scan each scsi host device as shown below.

```
# echo "- - -" > /sys/class/scsi_host/host[n]/scan
```

When you run the above command that rescan everything, the three dash (“- – -“) refers the wildcard option. These values would be as follow.

```
# echo "c t l" > /sys/class/scsi_host/host[n]/scan
```

where

  * **c –** Channel on the HBA
  * **t –** SCSI target ID
  * **l –** LUN ID
  * **n –** HBA number



Run the below command to find all the host bus number on your system.

```
# ls /sys/class/scsi_host
host0 host1 host2
```

Once you get the host bus number, run the following command to discover new disks.

```
# echo "- - -" > /sys/class/scsi_host/host0/scan
# echo "- - -" > /sys/class/scsi_host/host1/scan
# echo "- - -" > /sys/class/scsi_host/host2/scan
```

Also, it can be scanned using “for loop” with a single command.

```
# for host in ls /sys/class/scsi_host/;do echo "- - -" >/sys/class/scsi_host/${host}/scan; done
```

You can check them using the **[ls command][2]** as mentioned at the beginning of the article.

```
# ls /dev/disk/by-id | grep -i "serial-hex of LUN"
```

### Method-2: How to Scan New LUNs and SCSI Disks on Linux Using the rescan-scsi-bus.sh Script

Make sure you have already installed the “sg3_utils” package to use this script. Otherwise, run the following command to install it.

For **RHEL/CentOS 6/7** systems, use the **[yum command][3]** to install sg3_utils.

```
# yum install -y sg3_utils
```

For **RHEL/CentOS 8** and Fedora systems, use the **[dnf command][4]** to install sg3_utils.

```
# dnf install -y sg3_utils
```

Now you can rescan the LUNs using the rescan-scsi-bus.sh script.

```
# ./rescan-scsi-bus.sh
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/scan-detect-luns-scsi-disks-on-redhat-centos-oracle-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/how-to-find-wwn-wwnn-wwpn-number-of-hba-card-in-linux/
[2]: https://www.2daygeek.com/linux-unix-ls-command-display-directory-contents/
[3]: https://www.2daygeek.com/linux-yum-command-examples-manage-packages-rhel-centos-systems/
[4]: https://www.2daygeek.com/linux-dnf-command-examples-manage-packages-fedora-centos-rhel-systems/
