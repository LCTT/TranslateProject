translating by lujun9972

Vmware Linux Guest Add a New Hard Disk Without Rebooting Guest
======

As a system admin, I need to use additional hard drives for to provide more storage space or to separate system data from user data. This procedure, adding physical block devices to virtualized guests, describes how to add a hard drive on the host to a virtualized guest using VMWare software running Linux as guest.

It is possible to add or remove a SCSI device explicitly, or to re-scan an entire SCSI bus without rebooting a running Linux VM guest. This how to is tested under Vmware Server and Vmware Workstation v6.0 (but should work with older version too). All instructions are tested on RHEL, Fedora, CentOS and Ubuntu Linux guest / hosts operating systems.


## Step # 1: Add a New Disk To Vm Guest

First, you need to add hard disk by visiting vmware hardware settings menu.
Click on VM > Settings

![Fig.01: Vmware Virtual Machine Settings ][1]

Alternatively you can press CTRL + D to bring settings dialog box.

Click on Add+ to add new hardware to guest:

![Fig.02: VMWare adding a new hardware][2]

Select hardware type Hard disk and click on Next
![Fig.03 VMware Adding a new disk wizard ][3]

Select create a new virtual disk and click on Next

![Fig.04: Vmware Wizard Disk ][4]

Set virtual disk type to SCSI and click on Next

![Fig.05: Vmware Virtual Disk][5]

Set maximum disk size as per your requirements and click on Next

![Fig.06: Finalizing Disk Virtual Addition ][6]

Finally, set file location and click on Finish.

## Step # 2: Rescan the SCSI Bus to Add a SCSI Device Without rebooting the VM

A rescan can be issued by typing the following command:

```
echo "- - -" > /sys/class/scsi_host/ **host#** /scan
fdisk -l
tail -f /var/log/message
```

Sample outputs:

![Linux Vmware Rescan New Scsi Disk Without Reboot][7]

Replace host# with actual value such as host0. You can find scsi_host value using the following command:

`# ls /sys/class/scsi_host`

Output:

```
host0
```

Now type the following to send a rescan request:

```
echo "- - -" > /sys/class/scsi_host/ **host0** /scan
fdisk -l
tail -f /var/log/message
```

Sample Outputs:

```
Jul 18 16:29:39 localhost kernel: Vendor: VMware, Model: VMware Virtual S Rev: 1.0
Jul 18 16:29:39 localhost kernel: Type: Direct-Access ANSI SCSI revision: 02
Jul 18 16:29:39 localhost kernel: target0:0:1: Beginning Domain Validation
Jul 18 16:29:39 localhost kernel: target0:0:1: Domain Validation skipping write tests
Jul 18 16:29:39 localhost kernel: target0:0:1: Ending Domain Validation
Jul 18 16:29:39 localhost kernel: target0:0:1: FAST-40 WIDE SCSI 80.0 MB/s ST (25 ns, offset 127)
Jul 18 16:29:39 localhost kernel: SCSI device sdb: 2097152 512-byte hdwr sectors (1074 MB)
Jul 18 16:29:39 localhost kernel: sdb: Write Protect is off
Jul 18 16:29:39 localhost kernel: sdb: cache data unavailable
Jul 18 16:29:39 localhost kernel: sdb: assuming drive cache: write through
Jul 18 16:29:39 localhost kernel: SCSI device sdb: 2097152 512-byte hdwr sectors (1074 MB)
Jul 18 16:29:39 localhost kernel: sdb: Write Protect is off
Jul 18 16:29:39 localhost kernel: sdb: cache data unavailable
Jul 18 16:29:39 localhost kernel: sdb: assuming drive cache: write through
Jul 18 16:29:39 localhost kernel: sdb: unknown partition table
Jul 18 16:29:39 localhost kernel: sd 0:0:1:0: Attached scsi disk sdb
Jul 18 16:29:39 localhost kernel: sd 0:0:1:0: Attached scsi generic sg1 type 0
Jul 18 16:29:39 localhost kernel: Vendor: VMware, Model: VMware Virtual S Rev: 1.0
Jul 18 16:29:39 localhost kernel: Type: Direct-Access ANSI SCSI revision: 02
Jul 18 16:29:39 localhost kernel: target0:0:2: Beginning Domain Validation
Jul 18 16:29:39 localhost kernel: target0:0:2: Domain Validation skipping write tests
Jul 18 16:29:39 localhost kernel: target0:0:2: Ending Domain Validation
Jul 18 16:29:39 localhost kernel: target0:0:2: FAST-40 WIDE SCSI 80.0 MB/s ST (25 ns, offset 127)
Jul 18 16:29:39 localhost kernel: SCSI device sdc: 2097152 512-byte hdwr sectors (1074 MB)
Jul 18 16:29:39 localhost kernel: sdc: Write Protect is off
Jul 18 16:29:39 localhost kernel: sdc: cache data unavailable
Jul 18 16:29:39 localhost kernel: sdc: assuming drive cache: write through
Jul 18 16:29:39 localhost kernel: SCSI device sdc: 2097152 512-byte hdwr sectors (1074 MB)
Jul 18 16:29:39 localhost kernel: sdc: Write Protect is off
Jul 18 16:29:39 localhost kernel: sdc: cache data unavailable
Jul 18 16:29:39 localhost kernel: sdc: assuming drive cache: write through
Jul 18 16:29:39 localhost kernel: sdc: unknown partition table
Jul 18 16:29:39 localhost kernel: sd 0:0:2:0: Attached scsi disk sdc
Jul 18 16:29:39 localhost kernel: sd 0:0:2:0: Attached scsi generic sg2 type 0
```

### How Do I Delete a Single Device Called /dev/sdc?

In addition to re-scanning the entire bus, a specific device can be added or existing device deleted using the following command:

```
# echo 1 > /sys/block/devName/device/delete
# echo 1 > /sys/block/ **sdc** /device/delete
```

### How Do I Add a Single Device Called /dev/sdc?

To add a single device explicitly, use the following syntax:

```
# echo "scsi add-single-device <H> <B> <T> <L>" > /proc/scsi/scsi
```

Where,

  * <H> : Host
  * <B> : Bus (Channel)
  * <T> : Target (Id)
  * <L> : LUN numbers



For e.g. add /dev/sdc with host # 0, bus # 0, target # 2, and LUN # 0, enter:

```
# echo "scsi add-single-device 0 0 2 0">/proc/scsi/scsi
# fdisk -l
# cat /proc/scsi/scsi
```

Sample Outputs:

```
Attached devices:
Host: scsi0 Channel: 00 Id: 00 Lun: 00
 Vendor: VMware, Model: VMware Virtual S Rev: 1.0
 Type: Direct-Access ANSI SCSI revision: 02
Host: scsi0 Channel: 00 Id: 01 Lun: 00
 Vendor: VMware, Model: VMware Virtual S Rev: 1.0
 Type: Direct-Access ANSI SCSI revision: 02
Host: scsi0 Channel: 00 Id: 02 Lun: 00
 Vendor: VMware, Model: VMware Virtual S Rev: 1.0
 Type: Direct-Access ANSI SCSI revision: 02
```

## Step #3: Format a New Disk

Now, you can create partition using [fdisk and format it using mkfs.ext3][8] command:

```
# fdisk /dev/sdc
### [if you want ext3 fs] ###
# mkfs.ext3 /dev/sdc3
### [if you want ext4 fs] ###
# mkfs.ext4 /dev/sdc3
```

## Step #4: Create a Mount Point And Update /etc/fstab

`# mkdir /disk3`

Open /etc/fstab file, enter:

`# vi /etc/fstab`

Append as follows:

```
/dev/sdc3 /disk3 ext3 defaults 1 2
```

For ext4 fs:

```
/dev/sdc3 /disk3 ext4 defaults 1 2
```

Save and close the file.

#### Optional Task: Label the partition

[You can label the partition using e2label command][9]. For example, if you want to label the new partition /backupDisk, enter

`# e2label /dev/sdc1 /backupDisk`

See "[The importance of Linux partitions][10]

## about the author

The author is the creator of nixCraft and a seasoned sysadmin and a trainer for the Linux operating system/Unix shell scripting. He has worked with global clients and in various industries, including IT, education, defense and space research, and the nonprofit sector. Follow him on [Twitter][11], [Facebook][12], [Google+][13].

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/tips/vmware-add-a-new-hard-disk-without-rebooting-guest.html

作者：[Vivek Gite][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://www.cyberciti.biz/media/new/tips/2009/07/virtual-machine-settings-1.png (Vmware Virtual Machine Settings )
[2]:https://www.cyberciti.biz/media/new/tips/2009/07/vmware-add-hardware-wizard-2.png (VMWare adding a new hardware)
[3]:https://www.cyberciti.biz/media/new/tips/2009/07/vmware-add-hardware-anew-disk-3.png (VMware Adding a new disk wizard )
[4]:https://www.cyberciti.biz/media/new/tips/2009/07/vmware-add-hardware-4.png (Vmware Wizard Disk )
[5]:https://www.cyberciti.biz/media/new/tips/2009/07/add-hardware-5.png (Vmware Virtual Disk)
[6]:https://www.cyberciti.biz/media/new/tips/2009/07/vmware-final-disk-file-add-hdd-6.png (Finalizing Disk Virtual Addition)
[7]:https://www.cyberciti.biz/media/new/tips/2009/07/vmware-linux-rescan-hard-disk.png (Linux Vmware Rescan New Scsi Disk Without Reboot)
[8]:https://www.cyberciti.biz/faq/linux-disk-format/
[9]:https://www.cyberciti.biz/faq/linux-modify-partition-labels-command-to-change-diskname/
[10]:https://www.cyberciti.biz/faq/linux-partition-howto-set-labels/>how%20to%20label%20a%20Linux%20partition</a>%E2%80%9D%20for%20more%20info.</p><h2>Conclusion</h2><p>The%20VMware%20guest%20now%20has%20an%20additional%20virtualized%20storage%20device.%20%20The%20procedure%20works%20for%20all%20physical%20block%20devices,%20this%20includes%20CD-ROM,%20DVD%20and%20floppy%20devices.%20Next,%20time%20I%20will%20write%20about%20adding%20an%20additional%20virtualized%20storage%20device%20using%20XEN%20software.</p><h2>See%20also</h2><ul><li><a%20href=
[11]:https://twitter.com/nixcraft
[12]:https://facebook.com/nixcraft
[13]:https://plus.google.com/+CybercitiBiz
