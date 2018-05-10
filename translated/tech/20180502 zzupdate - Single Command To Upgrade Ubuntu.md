zzupdate —— 升级 Ubuntu 的简单命令
======
Ubuntu 18.04 版本已经发布，并得到各个社区的一致好评，因为 Ubuntu 18.04 可能是 Ubuntu 多年来最令人兴奋的版本。

通常情况下，Ubuntu 及其衍生版可以使用命令从一个版本升级到最新版本或者其它版本，这也是官方推荐的升级方式。

### Ubuntu 18.04 特性/亮点

这次更新包含大量改进和新功能，这里只列举的几个主要的。如果您想要更详细的更新信息，请访问 [Ubuntu 18.04 官方][1] 页面。

  - 使用 Linux 4.15 内核，提供了从上游继承的新功能
  - 它具有最新版本的 GNOME 3.28
  - 它提供了与 RHEL 相似的最简安装选项，该选项可安装只包含一个 web 浏览器和核心系统程序的基本桌面环境
  - 对于新安装，交换文件将取代默认的交换分区
  - 您可以启用 Livepatch 安装内核更新而无需重新启动
  - 笔记本电脑在使用电池供电时会在无操作 20 分钟后自动待机
  - 不再提供 32 位的 Ubuntu 桌面安装程序映像


**注意：**
1. 不要忘记备份重要数据。如果升级出现问题，我们将重新安装并恢复数据。
2. 安装所需时间取决于您的网络状况和安装的程序。

### zzupdate 是什么？

我们可以通过使用 [zzupdate][2] 工具中的单个命令将 Ubuntu PC/Server 从一个版本升级到另一个版本。它是一个免费的开源工具，使用它不需要任何脚本知识，因为它只需要配置文件即可运行。

工具中提供两个默认 shell 文件。`setup.sh` 自动安装、更新代码，将脚本转换为一个简单的 zzupdate shell 命令。`zzupdate.sh` 将执行版本间的升级。

### 如何安装 zzipdate？

要安装 zzupdate，只需执行以下命令。
```
$ curl -s https://raw.githubusercontent.com/TurboLabIt/zzupdate/master/setup.sh | sudo sh
.
.
Installing...
-------------
Cloning into 'zzupdate'...
remote: Counting objects: 57, done.
remote: Total 57 (delta 0), reused 0 (delta 0), pack-reused 57
Unpacking objects: 100% (57/57), done.
Checking connectivity... done.
Already up-to-date.

Setup completed!
----------------
See https://github.com/TurboLabIt/zzupdate for the quickstart guide.

```

将 Ubuntu 系统从一个版本升级到另一个版本，您不需要输入很多命令，也不需要重新启动，只需要运行下面的 zzupdate 命令并坐下喝杯咖啡就可以了。

请注意，当您远程升级系统时，建议您使用以下的工具来帮助您在任何断开连接时重新连接会话。

**建议阅读：** [如何让一个进程/命令在 SSH 连接断开后继续运行][3]

### 如何配置 zzupdate（可选）

默认情况下，zzupdate 可以直接使用，不需要配置任何东西。当然，如果您想要自己配置一些内容，可以的。复制提供的实例配置文件 `zzupdate.default.conf` 到 `zzupdate.conf` 并在 `zzupdate.conf` 中配置您的首选项。
```
$ sudo cp /usr/local/turbolab.it/zzupdate/zzupdate.default.conf /etc/turbolab.it/zzupdate.conf

```

打开文件，默认配置如下。
```
$ sudo nano /etc/turbolab.it/zzupdate.conf

REBOOT=1
REBOOT_TIMEOUT=15
VERSION_UPGRADE=1
VERSION_UPGRADE_SILENT=0
COMPOSER_UPGRADE=1
SWITCH_PROMPT_TO_NORMAL=0

```

  * **`REBOOT=1 :`**系统在更新完成后自动重启
  * **`REBOOT_TIMEOUT=15 :`**重启的默认超时值
  * **`VERSION_UPGRADE=1 :`**执行从一个版本到另一个版本的版本升级 
  * **`VERSION_UPGRADE_SILENT=0 :`**禁用自动升级
  * **`COMPOSER_UPGRADE=1 :`**自动升级
  * **`SWITCH_PROMPT_TO_NORMAL=0 :`**如果值为 `0`，将寻找相同种类的版本升级。例如您正在运行 LTS 的版本，那么将寻找 LTS 的版本升级，而不是用于正常版本升级。如果值为 `1`，那么无论您是运行 LTS 还是正常版本，都会查找最新版本



我现在使用 Ubuntu 17.10 并查看详细信息。
```
$ cat /etc/*-release
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=17.10
DISTRIB_CODENAME=artful
DISTRIB_DESCRIPTION="Ubuntu 17.10"
NAME="Ubuntu"
VERSION="17.10 (Artful Aardvark)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 17.10"
VERSION_ID="17.10"
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
VERSION_CODENAME=artful
UBUNTU_CODENAME=artful

```

要升级 Ubuntu 到最新版本，只需要执行以下命令。
```
$ sudo zzupdate

O===========================================================O
 zzupdate - Wed May 2 17:31:16 IST 2018
O===========================================================O

Self-update and update of other zzScript
----------------------------------------
.
.
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.

Updating...
----------
Already up-to-date.

Setup completed!
----------------
See https://github.com/TurboLabIt/zzupdate for the quickstart guide.

Channel switching is disabled: using pre-existing setting
---------------------------------------------------------

Cleanup local cache
-------------------

Update available packages informations
--------------------------------------
Hit:1 https://download.docker.com/linux/ubuntu artful InRelease
Ign:2 http://dl.google.com/linux/chrome/deb stable InRelease
Hit:3 http://security.ubuntu.com/ubuntu artful-security InRelease
Hit:4 http://in.archive.ubuntu.com/ubuntu artful InRelease
Hit:5 http://dl.google.com/linux/chrome/deb stable Release
Hit:6 http://in.archive.ubuntu.com/ubuntu artful-updates InRelease
Hit:7 http://in.archive.ubuntu.com/ubuntu artful-backports InRelease
Hit:9 http://ppa.launchpad.net/notepadqq-team/notepadqq/ubuntu artful InRelease
Hit:10 http://ppa.launchpad.net/papirus/papirus/ubuntu artful InRelease
Hit:11 http://ppa.launchpad.net/twodopeshaggy/jarun/ubuntu artful InRelease
.
.
UPGRADE PACKAGES
----------------
Reading package lists...
Building dependency tree...
Reading state information...
Calculating upgrade...
The following packages were automatically installed and are no longer required:
.
.
Interactively upgrade to a new release, if any
----------------------------------------------

Reading cache

Checking package manager
Reading package lists... Done
Building dependency tree
Reading state information... Done
Ign http://dl.google.com/linux/chrome/deb stable InRelease
Hit https://download.docker.com/linux/ubuntu artful InRelease
Hit http://security.ubuntu.com/ubuntu artful-security InRelease
Hit http://dl.google.com/linux/chrome/deb stable Release
Hit http://in.archive.ubuntu.com/ubuntu artful InRelease
Hit http://in.archive.ubuntu.com/ubuntu artful-updates InRelease
Hit http://in.archive.ubuntu.com/ubuntu artful-backports InRelease
Hit http://ppa.launchpad.net/notepadqq-team/notepadqq/ubuntu artful InRelease
Hit http://ppa.launchpad.net/papirus/papirus/ubuntu artful InRelease
Hit http://ppa.launchpad.net/twodopeshaggy/jarun/ubuntu artful InRelease
Fetched 0 B in 6s (0 B/s)
Reading package lists... Done
Building dependency tree
Reading state information... Done

```

我们需要按下 `Enter` 按钮禁用 `Third Party` 仓库以继续升级。
```
Updating repository information

Third party sources disabled

Some third party entries in your sources.list were disabled. You can
re-enable them after the upgrade with the 'software-properties' tool
or your package manager.

To continue please press [ENTER]
.
.
Get:35 http://in.archive.ubuntu.com/ubuntu bionic-updates/universe i386 Packages [2,180 B]
Get:36 http://in.archive.ubuntu.com/ubuntu bionic-updates/universe Translation-en [1,644 B]
Fetched 38.2 MB in 6s (1,276 kB/s)

Checking package manager
Reading package lists... Done
Building dependency tree
Reading state information... Done

Calculating the changes

Calculating the changes

```

开始下载 `Ubuntu 18.04 LTS` 软件包，所需时间取决于您的网络状况，一般情况下这将需要几分钟。
```
Do you want to start the upgrade?


63 installed packages are no longer supported by Canonical. You can
still get support from the community.

4 packages are going to be removed. 175 new packages are going to be
installed. 1307 packages are going to be upgraded.

You have to download a total of 999 M. This download will take about
12 minutes with your connection.

Installing the upgrade can take several hours. Once the download has
finished, the process cannot be canceled.

Continue [yN] Details [d]y
Fetching
Get:1 http://in.archive.ubuntu.com/ubuntu bionic/main amd64 base-files amd64 10.1ubuntu2 [58.2 kB]
Get:2 http://in.archive.ubuntu.com/ubuntu bionic/main amd64 debianutils amd64 4.8.4 [85.7 kB]
Get:3 http://in.archive.ubuntu.com/ubuntu bionic/main amd64 bash amd64 4.4.18-2ubuntu1 [614 kB]
Get:4 http://in.archive.ubuntu.com/ubuntu bionic/main amd64 locales all 2.27-3ubuntu1 [3,612 kB]
.
.
Get:1477 http://in.archive.ubuntu.com/ubuntu bionic/main amd64 liblouisutdml-bin amd64 2.7.0-1 [9,588 B]
Get:1478 http://in.archive.ubuntu.com/ubuntu bionic/universe amd64 libtbb2 amd64 2017~U7-8 [110 kB]
Get:1479 http://in.archive.ubuntu.com/ubuntu bionic/main amd64 libyajl2 amd64 2.1.0-2build1 [20.0 kB]
Get:1480 http://in.archive.ubuntu.com/ubuntu bionic/main amd64 usb-modeswitch amd64 2.5.2+repack0-2ubuntu1 [53.6 kB]
Get:1481 http://in.archive.ubuntu.com/ubuntu bionic/main amd64 usb-modeswitch-data all 20170806-2 [30.7 kB]
Get:1482 http://in.archive.ubuntu.com/ubuntu bionic/main amd64 xbrlapi amd64 5.5-4ubuntu2 [61.8 kB]
Fetched 999 MB in 6s (721 kB/s)

```

安装新软件包时，很少有服务需要重新启动。 点击 `Yes` 按钮，它会自动重启所需的服务。
```
Upgrading
Inhibiting until Ctrl+C is pressed...
Preconfiguring packages ...
Preconfiguring packages ...
Preconfiguring packages ...
Preconfiguring packages ...
(Reading database ... 441375 files and directories currently installed.)
Preparing to unpack .../base-files_10.1ubuntu2_amd64.deb ...
Warning: Stopping motd-news.service, but it can still be activated by:
 motd-news.timer
Unpacking base-files (10.1ubuntu2) over (9.6ubuntu102) ...
Setting up base-files (10.1ubuntu2) ...
Installing new version of config file /etc/debian_version ...
Installing new version of config file /etc/issue ...
Installing new version of config file /etc/issue.net ...
Installing new version of config file /etc/lsb-release ...
motd-news.service is a disabled or a static unit, not starting it.
(Reading database ... 441376 files and directories currently installed.)
.
.
Progress: [ 80%]

Progress: [ 85%]

Progress: [ 90%]

Progress: [ 95%]

```

现在删除旧版的、系统不再需要的包。点击  `y` 以删除。
```
Searching for obsolete software
 ing package lists... 97%
 ding package lists... 98%
Reading package lists... Done
Building dependency tree
Reading state information... Done
Reading state information... 23%
Reading state information... 47%
Reading state information... 71%
Reading state information... 94%
Reading state information... Done

Remove obsolete packages?


88 packages are going to be removed.

Continue [yN] Details [d]y
.
.
.
done
Removing perlmagick (8:6.9.7.4+dfsg-16ubuntu6) ...
Removing snapd-login-service (1.23-0ubuntu1) ...
Processing triggers for libc-bin (2.27-3ubuntu1) ...
Processing triggers for man-db (2.8.3-2) ...
Processing triggers for dbus (1.12.2-1ubuntu1) ...
Fetched 0 B in 0s (0 B/s)

```

升级成功，需要重启系统。点击 `Y` 以重启系统。
```
System upgrade is complete.

Restart required

To finish the upgrade, a restart is required.
If you select 'y' the system will be restarted.

Continue [yN]y

```

**注意：** 少数情况下，会要求您确认配置文件替换以继续安装。

查看升级后的系统详情。
```
$ cat /etc/*-release
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=18.04
DISTRIB_CODENAME=bionic
DISTRIB_DESCRIPTION="Ubuntu 18.04 LTS"
NAME="Ubuntu"
VERSION="18.04 LTS (Bionic Beaver)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 18.04 LTS"
VERSION_ID="18.04"
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
VERSION_CODENAME=bionic
UBUNTU_CODENAME=bionic

```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/zzupdate-single-command-to-upgrade-ubuntu-18-04/

作者：[PRAKASH SUBRAMANIAN][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[XiatianSummer](https://github.com/XiatianSummer)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/prakash/
[1]:https://wiki.ubuntu.com/BionicBeaver/ReleaseNotes
[2]:https://github.com/TurboLabIt/zzupdate
[3]:https://www.2daygeek.com/how-to-keep-a-process-command-running-after-disconnecting-ssh-session/
