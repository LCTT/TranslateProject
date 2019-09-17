[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to check Linux Operating System (OS) installation Date And Time)
[#]: via: (https://www.2daygeek.com/linux-os-installation-date-time/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

How to check Linux Operating System (OS) installation Date And Time
======

Are you curious to check when the Linux Operating System (OS) was installed on your machine ?

It could be for various reasons. Recently I had a requirement to find out this information.

We need to decommission few of our servers which we built long time back for different project requirements.

Due to some reason those projects didn’t happen but we would like to know when it was built before proceeding the decommission.

However, these commands were not worked for me because the server was built from a template.

Make a note, if you install an operating system from template then it will show you only the template built date and not the actual OS installed date.

If the machine was not installed from template then it will work as expected.

There are three standard ways that we can check this. Let us see one by one.

Also, rpm based systems has their own commands to check this, I will include those as well.

  * **`tune2fs Command:`** adjust tunable filesystem parameters on ext2/ext3/ext4 filesystems.
  * **`dumpe2fs Command:`** dump ext2/ext3/ext4 filesystem information.
  * **`ls Command:`** ls command is used to list the directory contents.
  * **`basesystem Command:`** dump ext2/ext3/ext4 filesystem information.
  * **`setup Command:`** The setup package contains a set of important system configurations and setup files, such as passwd, group, and profile.
  * **`setuptool Command:`** Setuptool is a user-friendly text mode menu utility which allows you to access all of the text mode configuration programs included in the operating system distribution.



### Method-1: To Find Out Linux Operating System (OS) Installation Date And Time Using tune2fs Command

The tune2fs command allows the system administrator to adjust various tunable filesystem parameters on Linux ext2, ext3, or ext4 filesystems.

  * First we need to identify the device name of the **`/`** partition. It can be done in many ways but i prefer to go with df Command.



# df -P / Filesystem 1024-blocks Used Available Capacity Mounted on /dev/mapper/vg_2daygeek-lv_root 27228028 5319516 21630588 20% /

  * Then run the tune2fs command to find out Linux Operating System (OS) Installation Date And Time.



```
# tune2fs -l /dev/mapper/vg_2daygeek-lv_root | grep 'Filesystem created:'

Filesystem created:       Fri Jun 29 22:15:34 2018
```

  * Use the following combination to check Linux Operating System (OS) Installation Date And Time in single command.



```
# baseos=$(df -P / | tail -1 | cut -d" " -f1) && tune2fs -l $baseos | grep 'Filesystem created:'

Filesystem created:       Sat Nov 24 03:15:04 2018
```

### Method-2: To Find Out Linux Operating System (OS) Installation Date And Time Using dumpe2fs Command

The dumpe2fs prints the super block and blocks group information for the filesystem present on device.

  * First we need to identify the device name of the **`/`** partition.



```
# df -P /

Filesystem                      1024-blocks    Used Available Capacity Mounted on
/dev/mapper/vg_2daygeek-lv_root    27228028 5319516  21630588      20% /
```

  * Then run the tune2fs command to find out Linux Operating System (OS) Installation Date And Time.



```
# dumpe2fs /dev/mapper/vg_2daygeek-lv_root | grep 'Filesystem created:'

dumpe2fs 1.41.12 (17-May-2010)
Filesystem created:       Fri Jun 29 22:15:34 2018
```

  * Use the following combination to check Linux Operating System (OS) Installation Date And Time in single command.



```
# baseos=$(df -P / | tail -1 | cut -d" " -f1) && dumpe2fs $baseos | grep 'Filesystem created:'

dumpe2fs 1.45.3 (14-Jul-2019)
Filesystem created:       Sat Nov 24 03:15:04 2018
```

### Method-3: To Find Out Linux Operating System (OS) Installation Date And Time Using ls Command

ls command is used to list the directory contents. It’s a very basic command, which is most frequently used by Linux administrator.

The following combinations will help you to check Linux Operating System (OS) Installation Date And Time.

```
# ls -lact --full-time /etc | tail -1 | awk '{print $6,$7}'
2018-06-29 22:17:15.089000067
```

### Method-4 : To Find Out Linux Operating System (OS) Installation Date And Time Using basesystem Command?

### (It Works only on RPM Based Systems)

Basesystem defines the components of a basic Red Hat Enterprise Linux system (for example, the package installation order to use during bootstrapping). Basesystem should be in every installation of a system, and it should never be removed.

```
# rpm -qi basesystem
Name        : basesystem
Version     : 10.0
Release     : 7.el7.centos
Architecture: noarch
Install Date: Fri 15 Feb 2019 03:20:34 PM CST
Group       : System Environment/Base
Size        : 0
License     : Public Domain
Signature   : RSA/SHA256, Thu 03 Jul 2014 07:46:57 PM CDT, Key ID 24c6a8a7f4a80eb5
Source RPM  : basesystem-10.0-7.el7.centos.src.rpm
Build Date  : Fri 27 Jun 2014 05:37:10 AM CDT
Build Host  : worker1.bsys.centos.org
Relocations : (not relocatable)
Packager    : CentOS BuildSystem <http://bugs.centos.org>
Vendor      : CentOS
Summary     : The skeleton package which defines a simple CentOS Linux system
```

  * If you would like to print only date and time use the following format.



```
# rpm -q basesystem --qf '%{installtime:date}\n'
Fri 15 Feb 2019 03:20:34 PM CST
```

### Method-5 : To Find Out Linux Operating System (OS) Installation Date And Time Using setup Command

### (It Works only on RPM Based Systems)

The setup package contains a set of important system configuration and setup files, such as passwd, group, and profile.

```
# rpm -qi setup
Name        : setup
Version     : 2.8.71
Release     : 10.el7
Architecture: noarch
Install Date: Fri 15 Feb 2019 03:20:33 PM CST
Group       : System Environment/Base
Size        : 696893
License     : Public Domain
Signature   : RSA/SHA256, Mon 12 Nov 2018 09:19:37 AM CST, Key ID 24c6a8a7f4a80eb5
Source RPM  : setup-2.8.71-10.el7.src.rpm
Build Date  : Tue 30 Oct 2018 02:48:11 PM CDT
Build Host  : x86-01.bsys.centos.org
Relocations : (not relocatable)
Packager    : CentOS BuildSystem <http://bugs.centos.org>
Vendor      : CentOS
URL         : https://pagure.io/setup/
Summary     : A set of system configuration and setup files
```

  * If you would like to print only date and time use the following format.



```
# rpm -q setup --qf '%{installtime:date}\n'
Fri 15 Feb 2019 03:20:33 PM CST
```

### Method-6: To Find Out Linux Operating System (OS) Installation Date And Time Using setuptool Command

### (It Works only on RPM Based Systems)

Setuptool is a user-friendly text mode menu utility which allows you to access all of the text mode configuration programs included in the operating system distribution.

```
# rpm -qi setuptool
Name        : setuptool
Version     : 1.19.11
Release     : 8.el7
Architecture: x86_64
Install Date: Fri 15 Feb 2019 03:29:00 PM CST
Group       : Applications/System
Size        : 149266
License     : GPLv2+
Signature   : RSA/SHA256, Thu 03 Jul 2014 11:59:15 PM CDT, Key ID 24c6a8a7f4a80eb5
Source RPM  : setuptool-1.19.11-8.el7.src.rpm
Build Date  : Mon 09 Jun 2014 05:49:28 PM CDT
Build Host  : worker1.bsys.centos.org
Relocations : (not relocatable)
Packager    : CentOS BuildSystem <http://bugs.centos.org>
Vendor      : CentOS
URL         : http://git.fedorahosted.org/git/?p=setuptool.git
Summary     : A text mode system configuration tool
```

If you would like to print only date and time use the following format.

```
# rpm -q setuptool --qf '%{installtime:date}\n'
Fri 15 Feb 2019 03:29:00 PM CST
```
--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-os-installation-date-time/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
