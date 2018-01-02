translating by lujun9972
How To Use YUM History Command To Rollback An Updates In RHEL/CentOS Systems
======
Server patching is one of the important task of Linux system administrator to make the system more stable and better performance. All the vendors used to release security/vulnerabilities patches very often, the affected package must be updated in order to limit any potential security risks.

Yum (Yellowdog Update Modified) is RPM Package Management utility for CentOS and Red Hat systems, Yum history command allows administrator to rollback the system to a previous state but due to some limitations, rollbacks do not work in all situations, or The yum command may simply do nothing, or it may remove packages you do not expect.

I advise you to take a full system backup prior to performing any update/upgrade is always recommended, and yum history is NOT meant to replace systems backups. This will help you to restore the system to previous state at any point of time.

**Suggested Read :**
**(#)** [YUM Command To Manage Packages on RHEL/CentOS Systems][1]
**(#)** [DNF (Fork of YUM) Command To Manage Packages on Fedora System][2]
**(#)** [How To Display Date And Time In History Command][3]

In some cases, the hosted applications might not work properly or through some error due to recent patch updates (It could be some library incompatibility or package upgrade), what will be the solution in this case?

Get in touch with App Dev team and figure it out an issue creating library's and packages then do the rollback with help of yum history command.
**Note :**

  * Rollback of selinux, selinux-policy-*, kernel, glibc (dependencies of glibc such as gcc) packages to older version is not supported.
  * Downgrading a system to minor version is not recommended (CentOS 6.9 to CentOS 6.8) which leads to make the system in undesired state



Let's first verify an available updates on system and pick any of the package for this experiment.
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

As you can see in the above output `git` package update is available, so we are going to take that. Run the following command to know the version information about the package (current installed version and available update version).
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

Run the following command to update `git` package from `1.7.1-8` to `1.7.1-9`.
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

Verify updated version of `git` package.
```
# yum list git
Installed Packages
git.x86_64 1.7.1-9.el6_9 @updates

or
# rpm -q git
git-1.7.1-9.el6_9.x86_64

```

As of now, we have successfully completed package update and got a package for rollback. Just follow below steps for rollback mechanism.

First get the yum transaction id using following command. The below output clearly shows all the required information such transaction id, who done the transaction (i mean username), date and time, Actions (Install or update), how many packages altered in this transaction.
```
# yum history
or
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

The above command shows two packages has been altered because git updated it's dependence package too **perl-Git**. Run the following command to view detailed information about the transaction.
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

Fire the following command to Rollback the `git` package to the previous version.
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

After rollback, use the following command to re-check the downgraded package version.
```
# yum list git
or
# rpm -q git
git-1.7.1-8.el6.x86_64

```

### Rollback Updates using YUM downgrade command

Alternatively we can rollback an updates using YUM downgrade command.
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

**Note :** You have to downgrade a dependence packages too, otherwise this will remove the current version of dependency packages instead of downgrade because the downgrade command cannot satisfy the dependency.

### For Fedora Users

Use the same above commands and change the package manager command to DNF instead of YUM.
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

作者：[][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com
[1]:https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[2]:https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[3]:https://www.2daygeek.com/display-date-time-linux-bash-history-command/
