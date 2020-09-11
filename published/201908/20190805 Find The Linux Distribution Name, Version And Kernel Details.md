[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11270-1.html)
[#]: subject: (Find The Linux Distribution Name, Version And Kernel Details)
[#]: via: (https://www.ostechnix.com/find-out-the-linux-distribution-name-version-and-kernel-details/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

查找 Linux 发行版名称、版本和内核详细信息
======

![Find The Linux Distribution Name, Version And Kernel Details][1]

本指南介绍了如何查找 Linux 发行版名称、版本和内核详细信息。如果你的 Linux 系统有 GUI 界面，那么你可以从系统设置中轻松找到这些信息。但在命令行模式下，初学者很难找到这些详情。没有问题！我这里给出了一些命令行方法来查找 Linux 系统信息。可能有很多，但这些方法适用于大多数 Linux 发行版。

### 1、查找 Linux 发行版名称、版本

有很多方法可以找出 VPS 中运行的操作系统。

#### 方法 1：

打开终端并运行以下命令：

```
$ cat /etc/*-release
```

CentOS 7 上的示例输出：

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

Ubuntu 18.04 上的示例输出：

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

#### 方法 2：

以下命令也能获取你发行版的详细信息。

```
$ cat /etc/issue
```

Ubuntu 18.04 上的示例输出：

```
Ubuntu 18.04.2 LTS \n \l
```

#### 方法 3：

以下命令能在 Debian 及其衍生版如 Ubuntu、Linux Mint 上获取发行版详细信息。

```
$ lsb_release -a
```

示例输出：

```
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 18.04.2 LTS
Release:    18.04
Codename:   bionic
```

### 2、查找 Linux 内核详细信息

#### 方法 1：

要查找 Linux 内核详细信息，请在终端运行以下命令。

```
$ uname -a
```

CentOS 7 上的示例输出：

```
Linux server.ostechnix.lan 3.10.0-123.9.3.el7.x86_64 #1 SMP Thu Nov 6 15:06:03 UTC 2014 x86_64 x86_64 x86_64 GNU/Linux
```

Ubuntu 18.04 上的示例输出：

```
Linux ostechnix 4.18.0-25-generic #26~18.04.1-Ubuntu SMP Thu Jun 27 07:28:31 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux
```

或者，

```
$ uname -mrs
```

示例输出：

```
Linux 4.18.0-25-generic x86_64
```

这里，

  * `Linux` – 内核名
  * `4.18.0-25-generic` – 内核版本
  * `x86_64` – 系统硬件架构（即 64 位系统）

有关 `uname` 命令的更多详细信息，请参考手册页。

```
$ man uname
```

#### 方法2：

在终端中，运行以下命令：

```
$ cat /proc/version
```

CentOS 7 上的示例输出：

```
Linux version 3.10.0-123.9.3.el7.x86_64 ([email protected]) (gcc version 4.8.2 20140120 (Red Hat 4.8.2-16) (GCC) ) #1 SMP Thu Nov 6 15:06:03 UTC 2014
```

Ubuntu 18.04 上的示例输出：

```
Linux version 4.18.0-25-generic ([email protected]) (gcc version 7.4.0 (Ubuntu 7.4.0-1ubuntu1~18.04.1)) #26~18.04.1-Ubuntu SMP Thu Jun 27 07:28:31 UTC 2019
```

这些是查找 Linux 发行版的名称、版本和内核详细信息的几种方法。希望你觉得它有用。

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/find-out-the-linux-distribution-name-version-and-kernel-details/

作者：[sk][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2015/08/Linux-Distribution-Name-Version-Kernel-720x340.png
