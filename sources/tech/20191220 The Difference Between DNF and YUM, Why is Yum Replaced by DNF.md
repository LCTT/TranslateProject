[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (The Difference Between DNF and YUM, Why is Yum Replaced by DNF?)
[#]: via: (https://www.2daygeek.com/comparison-difference-between-dnf-vs-yum/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

The Difference Between DNF and YUM, Why is Yum Replaced by DNF?
======

**[Yum Package Manager][1]** has been replaced by **[DNF Package Manager][2]** since many long-standing issues in Yum remain unresolved.

These problems include poor performance, excessive memory usage, slowdown for dependency resolution.

DNF uses “libsolv” for dependency resolution, developed and maintained by SUSE to improve performance.

It was written mostly in python, and it has its own way of coping with dependency resolution.

Its API is not fully documented, and its extension system only allows Python plugins.

Yum is a front-end tool for rpm that manages dependencies and repositories, and then uses RPM to install, download, and remove packages.

Why would they want to build a new tool instead of fixing existing problems?

Ales Kozamblak explained that the fixing was not technically feasible and that the yum team was not ready to accept the changes immediately.

Also, the big challenge is that there are 56K lines for yum, but only 29K lines for DNF.

So there is no way to fix it, except the fork.

However yum was working fine.

S.No | DNF (Dandified YUM) | YUM (Yellowdog Updater, Modified)
---|---|---
1 | DNF uses libsolv for dependency resolution, developed and maintained by SUSE. | YUM uses the public API for dependency resolution
2 | API is fully documented | API is not fully documented
3 | It is written in C, C++, Python | It is written only in Python
4 | DNF is currently used in Fedora, Red Hat Enterprise Linux 8 (RHEL), CentOS 8, OEL 8 and Mageia 6/7. | YUM is currently used in Red Hat Enterprise Linux 6/7 (RHEL), CentOS 6/7, OEL 6/7.
5 | DNf supports various extensions | Yum supports only Python based extension
6 | The API is well documented so it's easy to create new features | It is very difficult to create new features because the API is not properly documented.
7 | The DNF uses less memory when synchronizing the metadata of the repositories. | The YUM uses excessive memory when synchronizing the metadata of the repositories.
8 | DNF uses a satisfiability algorithm to solve dependency resolution (It's using a dictionary approach to store and retrieve package and dependency information). | Yum dependency resolution gets sluggish due to public API.
9 | All performance is good in terms of memory usage and dependency resolution of repository metadata. | Over all performance is poor in terms of many factors.
10 | DNF Update: If a package contains irrelevant dependencies during a DNF update process, the package will not be updated. | YUM will update a package without verifying this.
11 | If the enabled repository does not respond, dnf will skip it and continue the transaction with the available repositories. | If a repository is not available, YUM will stop immediately.
12 | dnf update and dnf upgrade equals. | It's different in yum
13 | The dependencies on package installation are not updated | Yum offered an option for this behavior
14 | Clean Up Package Removal: When removing a package, dnf automatically removes any dependency packages not explicitly installed by the user. | Yum didn’t do this
15 | Repo Cache Update Schedule: By default, ten minutes after the system boots, updates to configured repositories are checked by dnf hourly. This action is controlled by the system timer unit named "/usr/lib/systemd/system/dnf-makecache.timer". | Yum do this too.
16 | Kernel packages are not protected by dnf. Unlike Yum, you can delete all kernel packages, including one that runs. | Yum will not allow you to remove the running kernel
17 | libsolv: for solving packages and reading repositories.

hawkey: hawkey, library providing simplified C and Python API to libsolv.

librepo: library providing C and Python (libcURL like) API for downloading linux repository metadata and packages.

libcomps: Libcomps is alternative for yum.comps library. It’s written in pure C as library and there’s bindings for python2 and python3 | Yum does not use separate libraries to perform this function.
18 | DNF contains 29k lines of code | Yum contains 56k lines of code
19 | DNF was developed by Ales Kozumplik | YUM was developed by Zdenek Pavlas, Jan Silhan and team members

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/comparison-difference-between-dnf-vs-yum/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[2]: https://www.2daygeek.com/linux-dnf-command-examples-manage-packages-fedora-centos-rhel-systems/
