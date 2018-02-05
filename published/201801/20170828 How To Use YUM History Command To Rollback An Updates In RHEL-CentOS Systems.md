在 RHEL/CentOS 系统上使用 YUM history 命令回滚升级操作
======

为服务器打补丁是 Linux 系统管理员的一项重要任务，为的是让系统更加稳定，性能更加优化。厂商经常会发布一些安全/高危的补丁包，相关软件需要升级以防范潜在的安全风险。

Yum （Yellowdog Update Modified） 是 CentOS 和 RedHat 系统上用的 RPM 包管理工具，`yum history` 命令允许系统管理员将系统回滚到上一个状态，但由于某些限制，回滚不是在所有情况下都能成功，有时 `yum` 命令可能什么都不做，有时可能会删掉一些其他的包。

我建议你在升级之前还是要做一个完整的系统备份，而 `yum history` 并不能用来替代系统备份的。系统备份能让你将系统还原到任意时候的节点状态。

**推荐阅读：**

- [在 RHEL/CentOS 系统上使用 YUM 命令管理软件包][1]
- [在 Fedora 系统上使用 DNF （YUM 的一个分支）命令管理软件包 ][2]
- [如何让 history 命令显示日期和时间][3]

某些情况下，安装的应用程序在升级了补丁之后不能正常工作或者出现一些错误（可能是由于库不兼容或者软件包升级导致的），那该怎么办呢？

与应用开发团队沟通，并找出导致库和软件包的问题所在，然后使用 `yum history` 命令进行回滚。

**注意：**

* 它不支持回滚 selinux，selinux-policy-*，kernel，glibc （以及依赖 glibc 的包，比如 gcc）。
* 不建议将系统降级到更低的版本（比如 CentOS 6.9 降到 CentOS 6.8），这会导致系统处于不稳定的状态

让我们先来看看系统上有哪些包可以升级，然后挑选出一些包来做实验。

```
# yum update
Loaded plugins: fastestmirror, security
Setting up Update Process
Loading mirror speeds from cached hostfile
epel/metalink | 12 kB 00:00
 * epel: mirror.csclub.uwaterloo.ca
base | 3.7 kB 00:00
dockerrepo | 2.9 kB 00:00
draios | 2.9 kB 00:00
draios/primary_db | 13 kB 00:00
epel | 4.3 kB 00:00
epel/primary_db | 5.9 MB 00:00
extras | 3.4 kB 00:00
updates | 3.4 kB 00:00
updates/primary_db | 2.5 MB 00:00
Resolving Dependencies
--> Running transaction check
---> Package git.x86_64 0:1.7.1-8.el6 will be updated
---> Package git.x86_64 0:1.7.1-9.el6_9 will be an update
---> Package httpd.x86_64 0:2.2.15-60.el6.centos.4 will be updated
---> Package httpd.x86_64 0:2.2.15-60.el6.centos.5 will be an update
---> Package httpd-tools.x86_64 0:2.2.15-60.el6.centos.4 will be updated
---> Package httpd-tools.x86_64 0:2.2.15-60.el6.centos.5 will be an update
---> Package perl-Git.noarch 0:1.7.1-8.el6 will be updated
---> Package perl-Git.noarch 0:1.7.1-9.el6_9 will be an update
--> Finished Dependency Resolution

Dependencies Resolved

=================================================================================================
 Package Arch Version Repository Size
=================================================================================================
Updating:
 git x86_64 1.7.1-9.el6_9 updates 4.6 M
 httpd x86_64 2.2.15-60.el6.centos.5 updates 836 k
 httpd-tools x86_64 2.2.15-60.el6.centos.5 updates 80 k
 perl-Git noarch 1.7.1-9.el6_9 updates 29 k

Transaction Summary
=================================================================================================
Upgrade 4 Package(s)

Total download size: 5.5 M
Is this ok [y/N]: n
```

你会发现 `git` 包可以被升级，那我们就用它来实验吧。运行下面命令获得软件包的版本信息（当前安装的版本和可以升级的版本）。

```
# yum list git
Loaded plugins: fastestmirror, security
Setting up Update Process
Loading mirror speeds from cached hostfile
 * epel: mirror.csclub.uwaterloo.ca
Installed Packages
git.x86_64 1.7.1-8.el6 @base
Available Packages
git.x86_64 1.7.1-9.el6_9 updates
```

运行下面命令来将 `git` 从 `1.7.1-8` 升级到 `1.7.1-9`。

```
# yum update git
Loaded plugins: fastestmirror, presto
Setting up Update Process
Loading mirror speeds from cached hostfile
 * base: repos.lax.quadranet.com
 * epel: fedora.mirrors.pair.com
 * extras: mirrors.seas.harvard.edu
 * updates: mirror.sesp.northwestern.edu
Resolving Dependencies
--> Running transaction check
---> Package git.x86_64 0:1.7.1-8.el6 will be updated
--> Processing Dependency: git = 1.7.1-8.el6 for package: perl-Git-1.7.1-8.el6.noarch
---> Package git.x86_64 0:1.7.1-9.el6_9 will be an update
--> Running transaction check
---> Package perl-Git.noarch 0:1.7.1-8.el6 will be updated
---> Package perl-Git.noarch 0:1.7.1-9.el6_9 will be an update
--> Finished Dependency Resolution

Dependencies Resolved

=================================================================================================
 Package Arch Version Repository Size
=================================================================================================
Updating:
 git x86_64 1.7.1-9.el6_9 updates 4.6 M
Updating for dependencies:
 perl-Git noarch 1.7.1-9.el6_9 updates 29 k

Transaction Summary
=================================================================================================
Upgrade 2 Package(s)

Total download size: 4.6 M
Is this ok [y/N]: y
Downloading Packages:
Setting up and reading Presto delta metadata
Processing delta metadata
Package(s) data still to download: 4.6 M
(1/2): git-1.7.1-9.el6_9.x86_64.rpm | 4.6 MB 00:00
(2/2): perl-Git-1.7.1-9.el6_9.noarch.rpm | 29 kB 00:00
-------------------------------------------------------------------------------------------------
Total 5.8 MB/s | 4.6 MB 00:00
Running rpm_check_debug
Running Transaction Test
Transaction Test Succeeded
Running Transaction
 Updating : perl-Git-1.7.1-9.el6_9.noarch 1/4
 Updating : git-1.7.1-9.el6_9.x86_64 2/4
 Cleanup : perl-Git-1.7.1-8.el6.noarch 3/4
 Cleanup : git-1.7.1-8.el6.x86_64 4/4
 Verifying : git-1.7.1-9.el6_9.x86_64 1/4
 Verifying : perl-Git-1.7.1-9.el6_9.noarch 2/4
 Verifying : git-1.7.1-8.el6.x86_64 3/4
 Verifying : perl-Git-1.7.1-8.el6.noarch 4/4

Updated:
 git.x86_64 0:1.7.1-9.el6_9

Dependency Updated:
 perl-Git.noarch 0:1.7.1-9.el6_9

Complete!
```

验证升级后的 `git` 版本.

```
# yum list git
Installed Packages
git.x86_64 1.7.1-9.el6_9 @updates

或
# rpm -q git
git-1.7.1-9.el6_9.x86_64
```

现在我们成功升级这个软件包，可以对它进行回滚了。步骤如下。

### 使用 YUM history 命令回滚升级操作

首先，使用下面命令获取 yum 操作的 id。下面的输出很清晰地列出了所有需要的信息，例如操作 id、谁做的这个操作（用户名）、操作日期和时间、操作的动作（安装还是升级）、操作影响的包数量。

```
# yum history
或
# yum history list all
Loaded plugins: fastestmirror, presto
ID | Login user | Date and time | Action(s) | Altered
-------------------------------------------------------------------------------
 13 | root | 2017-08-18 13:30 | Update | 2
 12 | root | 2017-08-10 07:46 | Install | 1
 11 | root | 2017-07-28 17:10 | E, I, U | 28 EE
 10 | root | 2017-04-21 09:16 | E, I, U | 162 EE
 9 | root | 2017-02-09 17:09 | E, I, U | 20 EE
 8 | root | 2017-02-02 10:45 | Install | 1
 7 | root | 2016-12-15 06:48 | Update | 1
 6 | root | 2016-12-15 06:43 | Install | 1
 5 | root | 2016-12-02 10:28 | E, I, U | 23 EE
 4 | root | 2016-10-28 05:37 | E, I, U | 13 EE
 3 | root | 2016-10-18 12:53 | Install | 1
 2 | root | 2016-09-30 10:28 | E, I, U | 31 EE
 1 | root | 2016-07-26 11:40 | E, I, U | 160 EE
```

上面命令显示有两个包受到了影响，因为 `git` 还升级了它的依赖包 `perl-Git`。 运行下面命令来查看关于操作的详细信息。

```
# yum history info 13
Loaded plugins: fastestmirror, presto
Transaction ID : 13
Begin time : Fri Aug 18 13:30:52 2017
Begin rpmdb : 420:f5c5f9184f44cf317de64d3a35199e894ad71188
End time : 13:30:54 2017 (2 seconds)
End rpmdb : 420:d04a95c25d4526ef87598f0dcaec66d3f99b98d4
User : root
Return-Code : Success
Command Line : update git
Transaction performed with:
 Installed rpm-4.8.0-55.el6.x86_64 @base
 Installed yum-3.2.29-81.el6.centos.noarch @base
 Installed yum-plugin-fastestmirror-1.1.30-40.el6.noarch @base
 Installed yum-presto-0.6.2-1.el6.noarch @anaconda-CentOS-201207061011.x86_64/6.3
Packages Altered:
 Updated git-1.7.1-8.el6.x86_64 @base
 Update 1.7.1-9.el6_9.x86_64 @updates
 Updated perl-Git-1.7.1-8.el6.noarch @base
 Update 1.7.1-9.el6_9.noarch @updates
history info

```

运行下面命令来回滚 `git` 包到上一个版本。

```
# yum history undo 13
Loaded plugins: fastestmirror, presto
Undoing transaction 53, from Fri Aug 18 13:30:52 2017
 Updated git-1.7.1-8.el6.x86_64 @base
 Update 1.7.1-9.el6_9.x86_64 @updates
 Updated perl-Git-1.7.1-8.el6.noarch @base
 Update 1.7.1-9.el6_9.noarch @updates
Loading mirror speeds from cached hostfile
 * base: repos.lax.quadranet.com
 * epel: fedora.mirrors.pair.com
 * extras: repo1.dal.innoscale.net
 * updates: mirror.vtti.vt.edu
Resolving Dependencies
--> Running transaction check
---> Package git.x86_64 0:1.7.1-8.el6 will be a downgrade
---> Package git.x86_64 0:1.7.1-9.el6_9 will be erased
---> Package perl-Git.noarch 0:1.7.1-8.el6 will be a downgrade
---> Package perl-Git.noarch 0:1.7.1-9.el6_9 will be erased
--> Finished Dependency Resolution

Dependencies Resolved

=================================================================================================
 Package Arch Version Repository Size
=================================================================================================
Downgrading:
 git x86_64 1.7.1-8.el6 base 4.6 M
 perl-Git noarch 1.7.1-8.el6 base 29 k

Transaction Summary
=================================================================================================
Downgrade 2 Package(s)

Total download size: 4.6 M
Is this ok [y/N]: y
Downloading Packages:
Setting up and reading Presto delta metadata
Processing delta metadata
Package(s) data still to download: 4.6 M
(1/2): git-1.7.1-8.el6.x86_64.rpm | 4.6 MB 00:00
(2/2): perl-Git-1.7.1-8.el6.noarch.rpm | 29 kB 00:00
-------------------------------------------------------------------------------------------------
Total 3.4 MB/s | 4.6 MB 00:01
Running rpm_check_debug
Running Transaction Test
Transaction Test Succeeded
Running Transaction
 Installing : perl-Git-1.7.1-8.el6.noarch 1/4
 Installing : git-1.7.1-8.el6.x86_64 2/4
 Cleanup : perl-Git-1.7.1-9.el6_9.noarch 3/4
 Cleanup : git-1.7.1-9.el6_9.x86_64 4/4
 Verifying : git-1.7.1-8.el6.x86_64 1/4
 Verifying : perl-Git-1.7.1-8.el6.noarch 2/4
 Verifying : git-1.7.1-9.el6_9.x86_64 3/4
 Verifying : perl-Git-1.7.1-9.el6_9.noarch 4/4

Removed:
 git.x86_64 0:1.7.1-9.el6_9 perl-Git.noarch 0:1.7.1-9.el6_9

Installed:
 git.x86_64 0:1.7.1-8.el6 perl-Git.noarch 0:1.7.1-8.el6

Complete!
```

回滚后，使用下面命令来检查降级包的版本。

```
# yum list git
或
# rpm -q git
git-1.7.1-8.el6.x86_64
```

### 使用YUM downgrade 命令回滚升级

此外，我们也可以使用 YUM `downgrade` 命令回滚升级。

```
# yum downgrade git-1.7.1-8.el6 perl-Git-1.7.1-8.el6
Loaded plugins: search-disabled-repos, security, ulninfo
Setting up Downgrade Process
Resolving Dependencies
--> Running transaction check
---> Package git.x86_64 0:1.7.1-8.el6 will be a downgrade
---> Package git.x86_64 0:1.7.1-9.el6_9 will be erased
---> Package perl-Git.noarch 0:1.7.1-8.el6 will be a downgrade
---> Package perl-Git.noarch 0:1.7.1-9.el6_9 will be erased
--> Finished Dependency Resolution

Dependencies Resolved

=================================================================================================
 Package Arch Version Repository Size
=================================================================================================
Downgrading:
 git x86_64 1.7.1-8.el6 base 4.6 M
 perl-Git noarch 1.7.1-8.el6 base 29 k

Transaction Summary
=================================================================================================
Downgrade 2 Package(s)

Total download size: 4.6 M
Is this ok [y/N]: y
Downloading Packages:
(1/2): git-1.7.1-8.el6.x86_64.rpm | 4.6 MB 00:00
(2/2): perl-Git-1.7.1-8.el6.noarch.rpm | 28 kB 00:00
-------------------------------------------------------------------------------------------------
Total 3.7 MB/s | 4.6 MB 00:01
Running rpm_check_debug
Running Transaction Test
Transaction Test Succeeded
Running Transaction
 Installing : perl-Git-1.7.1-8.el6.noarch 1/4
 Installing : git-1.7.1-8.el6.x86_64 2/4
 Cleanup : perl-Git-1.7.1-9.el6_9.noarch 3/4
 Cleanup : git-1.7.1-9.el6_9.x86_64 4/4
 Verifying : git-1.7.1-8.el6.x86_64 1/4
 Verifying : perl-Git-1.7.1-8.el6.noarch 2/4
 Verifying : git-1.7.1-9.el6_9.x86_64 3/4
 Verifying : perl-Git-1.7.1-9.el6_9.noarch 4/4

Removed:
 git.x86_64 0:1.7.1-9.el6_9 perl-Git.noarch 0:1.7.1-9.el6_9

Installed:
 git.x86_64 0:1.7.1-8.el6 perl-Git.noarch 0:1.7.1-8.el6

Complete!
```

注意： 你也需要降级依赖包，否则它会删掉当前版本的依赖包而不是对依赖包做降级，因为 `downgrade` 命令无法处理依赖关系。

### 至于 Fedora 用户

命令是一样的，只需要将包管理器名称从 `yum` 改成 `dnf` 就行了。

```
# dnf list git
# dnf history
# dnf history info
# dnf history undo
# dnf list git
# dnf downgrade git-1.7.1-8.el6 perl-Git-1.7.1-8.el6
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/rollback-fallback-updates-downgrade-packages-centos-rhel-fedora/

作者：[2daygeek][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/2daygeek/
[1]:https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[2]:https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[3]:https://www.2daygeek.com/display-date-time-linux-bash-history-command/
