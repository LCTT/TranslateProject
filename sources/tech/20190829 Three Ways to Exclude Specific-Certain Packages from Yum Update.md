[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Three Ways to Exclude Specific/Certain Packages from Yum Update)
[#]: via: (https://www.2daygeek.com/redhat-centos-yum-update-exclude-specific-packages/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

Three Ways to Exclude Specific/Certain Packages from Yum Update
======

As part of system update, you may need to exclude few of the packages due to application dependency in Red Hat based system.

If yes, how to exclude, how many ways that can be done.

Yes, it can be done in three ways, we will teach you all three methods in this article.

A package manager is a collection of tools that allow users to easily manage packages in Linux system.

It allows users to install, update/upgrade, remove, query, re-install, and search packages in Linux system.

For Red Hat and it’s clone, we uses **[yum Package Manager][1]** and **[rpm Package Manager][2]** for package management.

### What’s yum?

yum stands for Yellowdog Updater, Modified. Yum is an automatic updater and package installer/remover for rpm systems.

It automatically resolve dependencies when installing a package.

### What’s rpm?

rpm stands for Red Hat Package Manager is a powerful package management tool for Red Hat system.

The name RPM refers to `.rpm` file format that containing compiled software’s and necessary libraries for the package.

You may interested to read the following articles, which is related to this topic. If so, navigate to appropriate links.

  * **[How To Check Available Security Updates On Red Hat (RHEL) And CentOS System][3]**
  * **[Four Ways To Install Security Updates On Red Hat (RHEL) And CentOS Systems][4]**
  * **[Two Methods To Check Or List Installed Security Updates on Redhat (RHEL) And CentOS System][5]**



### Method-1: Exclude Packages with yum Command Manually or Temporarily

We can use `--exclude or -x` switch with yum command to exclude specific packages from getting updated through yum command.

I can say, this is a temporary method or On-Demand method. If you want to exclude specific package only once then we can go with this method.

The below command will update all packages except kernel.

To exclude single package.

```
# yum update --exclude=kernel

or

# yum update -x 'kernel'
```

To exclude multiple packages. The below command will update all packages except kernel and php.

```
# yum update --exclude=kernel* --exclude=php*

or

# yum update --exclude httpd,php
```

### Method-2: Exclude Packages with yum Command Permanently

This is permanent method and you can use this, if you are frequently performing the patch update.

To do so, add the required packages in /etc/yum.conf to disable packages updates permanently.

Once you add an entry, you don’t need to specify these package each time you run yum update command. Also, this prevent packages from any accidental update.

```
# vi /etc/yum.conf

[main]
cachedir=/var/cache/yum/$basearch/$releasever
keepcache=0
debuglevel=2
logfile=/var/log/yum.log
exactarch=1
obsoletes=1
gpgcheck=1
plugins=1
installonly_limit=3
exclude=kernel* php*
```

### Method-3: Exclude Packages Using Yum versionlock plugin

This is also permanent method similar to above. Yum versionlock plugin allow users to lock specified packages from being updated through yum command.

To do so, run the following command. The below command will exclude the freetype package from yum update.

Alternatively, you can add the package entry directly in “/etc/yum/pluginconf.d/versionlock.list” file.

```
# yum versionlock add freetype

Loaded plugins: changelog, package_upload, product-id, search-disabled-repos, subscription-manager, verify, versionlock
Adding versionlock on: 0:freetype-2.8-12.el7
versionlock added: 1
```

Run the following command to check the list of packages locked by versionlock plugin.

```
# yum versionlock list

Loaded plugins: changelog, package_upload, product-id, search-disabled-repos, subscription-manager, verify, versionlock
0:freetype-2.8-12.el7.*
versionlock list done
```

Run the following command to discards the list.

```
# yum versionlock clear
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/redhat-centos-yum-update-exclude-specific-packages/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[2]: https://www.2daygeek.com/rpm-command-examples/
[3]: https://www.2daygeek.com/check-list-view-find-available-security-updates-on-redhat-rhel-centos-system/
[4]: https://www.2daygeek.com/install-security-updates-on-redhat-rhel-centos-system/
[5]: https://www.2daygeek.com/check-installed-security-updates-on-redhat-rhel-and-centos-system/
