[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Four Ways To Install Security Updates On Red Hat (RHEL) And CentOS Systems?)
[#]: via: (https://www.2daygeek.com/install-security-updates-on-redhat-rhel-centos-system/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

Four Ways To Install Security Updates On Red Hat (RHEL) And CentOS Systems?
======

Patching of the Linux server is one of important and routine task of Linux admin.

Keeping the system with latest patch level is must. It protects your system against unnecessary attack.

There are three kind of erratas available in the RHEL/CentOS repository, these are Security, Bug Fix and Product Enhancement.

Now, you have two options to handle this.

Either install only security updates or all the errata packages.

We have already written an article in the past **[to check available security updates?][1]**.

Also, **[check the installed security updates on your system][2]** using this link.

You can navigate to the above link, if you would like to verify available security updates before installing them.

In this article, we will show your, how to install security updates in multiple ways on RHEL and CentOS system.

### 1) How To Install Entire Errata Updates In Red Hat And CentOS System?

Run the following command to download and apply all available security updates on your system.

Make a note, this command will install the last available version of any package with at least one security errata.

Also, install non-security erratas if they provide a more updated version of the package.

```
# yum update --security

Loaded plugins: changelog, package_upload, product-id, search-disabled-repos, subscription-manager, verify, versionlock
RHEL7-Server-DVD                                                                                                                              | 4.3 kB  00:00:00
rhel-7-server-rpms                                                                                                                            | 2.0 kB  00:00:00
--> 1:grub2-tools-extra-2.02-0.76.el7.1.x86_64 from rhel-7-server-rpms removed (updateinfo)
--> nss-pem-1.0.3-5.el7_6.1.x86_64 from rhel-7-server-rpms removed (updateinfo)
.
35 package(s) needed (+0 related) for security, out of 115 available
Resolving Dependencies
--> Running transaction check
---> Package NetworkManager.x86_64 1:1.12.0-6.el7 will be updated
---> Package NetworkManager.x86_64 1:1.12.0-10.el7_6 will be an update
```

Once you ran the above command, it will check all the available updates and its dependency satisfaction.

```
--> Finished Dependency Resolution
--> Running transaction check
---> Package kernel.x86_64 0:3.10.0-514.26.1.el7 will be erased
---> Package kernel-devel.x86_64 0:3.10.0-514.26.1.el7 will be erased
--> Finished Dependency Resolution

Dependencies Resolved
=====================================================================================================================================================================
Package                                          Arch                       Version                                   Repository                               Size
=====================================================================================================================================================================
Installing:
kernel                                           x86_64                     3.10.0-957.10.1.el7                       rhel-7-server-rpms                       48 M
kernel-devel                                     x86_64                     3.10.0-957.10.1.el7                       rhel-7-server-rpms                       17 M
Updating:
NetworkManager                                   x86_64                     1:1.12.0-10.el7_6                         rhel-7-server-rpms                      1.7 M
NetworkManager-adsl                              x86_64                     1:1.12.0-10.el7_6                         rhel-7-server-rpms                      157 k
.
Removing:
kernel                                           x86_64                     3.10.0-514.26.1.el7                       @rhel-7-server-rpms                     148 M
kernel-devel                                     x86_64                     3.10.0-514.26.1.el7                       @rhel-7-server-rpms                      34 M
```

If these dependencies were satisfied, which finally gives you a total summary about it.

The transaction summary shows, how many packages will be getting Installed, upgraded and removed from the system.

```
Transaction Summary
=====================================================================================================================================================================
Install   2 Packages
Upgrade  33 Packages
Remove    2 Packages

Total download size: 124 M
Is this ok [y/d/N]:
```

### How To Install Only Security Updates In Red Hat And CentOS System?

Run the following command to install only the packages that have a security errata.

```
# yum update-minimal --security

Loaded plugins: changelog, package_upload, product-id, search-disabled-repos, subscription-manager, verify, versionlock
rhel-7-server-rpms                                                                                                                            | 2.0 kB  00:00:00
Resolving Dependencies
--> Running transaction check
---> Package NetworkManager.x86_64 1:1.12.0-6.el7 will be updated
---> Package NetworkManager.x86_64 1:1.12.0-8.el7_6 will be an update
.
--> Finished Dependency Resolution
--> Running transaction check
---> Package kernel.x86_64 0:3.10.0-514.26.1.el7 will be erased
---> Package kernel-devel.x86_64 0:3.10.0-514.26.1.el7 will be erased
--> Finished Dependency Resolution

Dependencies Resolved
=====================================================================================================================================================================
Package                                          Arch                       Version                                   Repository                               Size
=====================================================================================================================================================================
Installing:
kernel                                           x86_64                     3.10.0-957.10.1.el7                       rhel-7-server-rpms                       48 M
kernel-devel                                     x86_64                     3.10.0-957.10.1.el7                       rhel-7-server-rpms                       17 M
Updating:
NetworkManager                                   x86_64                     1:1.12.0-8.el7_6                          rhel-7-server-rpms                      1.7 M
NetworkManager-adsl                              x86_64                     1:1.12.0-8.el7_6                          rhel-7-server-rpms                      157 k
.
Removing:
kernel                                           x86_64                     3.10.0-514.26.1.el7                       @rhel-7-server-rpms                     148 M
kernel-devel                                     x86_64                     3.10.0-514.26.1.el7                       @rhel-7-server-rpms                      34 M

Transaction Summary
=====================================================================================================================================================================
Install   2 Packages
Upgrade  33 Packages
Remove    2 Packages

Total download size: 124 M
Is this ok [y/d/N]:
```

### How To Install Security Update Using CVE reference In Red Hat And CentOS System?

If you would like to install a security update using a CVE reference, run the following command.

```
# yum update --cve

# yum update --cve CVE-2008-0947
```

### How To Install Security Update Using Specific Advisory In Red Hat And CentOS System?

Run the following command, if you want to apply only a specific advisory.

```
# yum update --advisory=

# yum update --advisory=RHSA-2014:0159
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/install-security-updates-on-redhat-rhel-centos-system/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/check-list-view-find-available-security-updates-on-redhat-rhel-centos-system/
[2]: https://www.2daygeek.com/check-installed-security-updates-on-redhat-rhel-and-centos-system/
