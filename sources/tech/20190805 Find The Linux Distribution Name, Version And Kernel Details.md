[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Find The Linux Distribution Name, Version And Kernel Details)
[#]: via: (https://www.ostechnix.com/find-out-the-linux-distribution-name-version-and-kernel-details/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

Find The Linux Distribution Name, Version And Kernel Details
======

![Find The Linux Distribution Name, Version And Kernel Details][1]

This guide explains how to find the Linux distribution name, version and Kernel details. If your Linux system has GUI mode, you can find these details easily from the System’s Settings. But in CLI mode, it is bit difficult for beginners to find out such details. No problem! Here I have given a few command line methods to find the Linux system information. There could be many, but these methods will work on most Linux distributions.

### 1\. Find Linux distribution name, version

There are many methods to find out what OS is running on in your VPS.

##### Method 1:

Open your Terminal and run the following command:

```
$ cat /etc/*-release
```

**Sample output from CentOS 7:**

```
CentOS Linux release 7.0.1406 (Core)
NAME="CentOS Linux"
VERSION="7 (Core)"
ID="centos"
ID_LIKE="rhel fedora"
VERSION_ID="7"
PRETTY_NAME="CentOS Linux 7 (Core)"
ANSI_COLOR="0;31"
CPE_NAME="cpe:/o:centos:centos:7"
HOME_URL="https://www.centos.org/"
BUG_REPORT_URL="https://bugs.centos.org/"

CentOS Linux release 7.0.1406 (Core)
CentOS Linux release 7.0.1406 (Core)
```

**Sample output from Ubuntu 18.04:**

```
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=18.04
DISTRIB_CODENAME=bionic
DISTRIB_DESCRIPTION="Ubuntu 18.04.2 LTS"
NAME="Ubuntu"
VERSION="18.04.2 LTS (Bionic Beaver)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 18.04.2 LTS"
VERSION_ID="18.04"
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
VERSION_CODENAME=bionic
UBUNTU_CODENAME=bionic
```

##### Method 2:

The following command will also get your distribution details.

```
$ cat /etc/issue
```

**Sample output from Ubuntu 18.04:**

```
Ubuntu 18.04.2 LTS \n \l
```

##### Method 3:

The following command will get you the distribution details in Debian and its variants like Ubuntu, Linux Mint etc.

```
$ lsb_release -a
```

**Sample output:**

```
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 18.04.2 LTS
Release:    18.04
Codename:   bionic
```

### 2\. Find Linux Kernel details

##### Method 1:

To find out your Linux kernel details, run the following command from your Terminal.

```
$ uname -a
```

**Sample output in CentOS 7:**

```
Linux server.ostechnix.lan 3.10.0-123.9.3.el7.x86_64 #1 SMP Thu Nov 6 15:06:03 UTC 2014 x86_64 x86_64 x86_64 GNU/Linux
```

**Sample output in Ubuntu 18.04:**

```
Linux ostechnix 4.18.0-25-generic #26~18.04.1-Ubuntu SMP Thu Jun 27 07:28:31 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux
```

Or,

```
$ uname -mrs
```

**Sample output:**

```
Linux 4.18.0-25-generic x86_64
```

Where,

  * **Linux** – Kernel name
  * **4.18.0-25-generic** – Kernel version
  * **x86_64** – System hardware architecture (i.e 64 bit system)



For more details about uname command, refer the man page.

```
$ man uname
```

##### Method 2:

From your Terminal, run the following command:

```
$ cat /proc/version
```

**Sample output from CentOS 7:**

```
Linux version 3.10.0-123.9.3.el7.x86_64 ([email protected]) (gcc version 4.8.2 20140120 (Red Hat 4.8.2-16) (GCC) ) #1 SMP Thu Nov 6 15:06:03 UTC 2014
```

**Sample output from Ubuntu 18.04:**

```
Linux version 4.18.0-25-generic ([email protected]) (gcc version 7.4.0 (Ubuntu 7.4.0-1ubuntu1~18.04.1)) #26~18.04.1-Ubuntu SMP Thu Jun 27 07:28:31 UTC 2019
```

* * *

**Suggested read:**

  * [**How To Find Linux System Details Using inxi**][2]
  * [**Neofetch – Display Linux system Information In Terminal**][3]
  * [**How To Find Hardware And Software Specifications In Ubuntu**][4]



* * *

These are few ways to find find out a Linux distribution’s name, version and Kernel details. Hope you find it useful.

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/find-out-the-linux-distribution-name-version-and-kernel-details/

作者：[sk][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2015/08/Linux-Distribution-Name-Version-Kernel-720x340.png
[2]: https://www.ostechnix.com/how-to-find-your-system-details-using-inxi/
[3]: https://www.ostechnix.com/neofetch-display-linux-systems-information/
[4]: https://www.ostechnix.com/getting-hardwaresoftware-specifications-in-linux-mint-ubuntu/
