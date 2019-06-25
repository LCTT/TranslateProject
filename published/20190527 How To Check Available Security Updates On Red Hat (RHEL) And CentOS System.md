[#]: collector: (lujun9972)
[#]: translator: (jdh8383)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10938-1.html)
[#]: subject: (How To Check Available Security Updates On Red Hat (RHEL) And CentOS System?)
[#]: via: (https://www.2daygeek.com/check-list-view-find-available-security-updates-on-redhat-rhel-centos-system/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

如何在 CentOS 或 RHEL 系统上检查可用的安全更新？
======

![](https://img.linux.net.cn/data/attachment/album/201906/05/003907tljfmy4bnn4qj1tp.jpg)

当你更新系统时，根据你所在公司的安全策略，有时候可能只需要打上与安全相关的补丁。大多数情况下，这应该是出于程序兼容性方面的考量。那该怎样实践呢？有没有办法让 `yum` 只安装安全补丁呢？

答案是肯定的，可以用 `yum` 包管理器轻松实现。

在这篇文章中，我们不但会提供所需的信息。而且，我们会介绍一些额外的命令，可以帮你获取指定安全更新的详实信息。

希望这样可以启发你去了解并修复你列表上的那些漏洞。一旦有安全漏洞被公布，就必须更新受影响的软件，这样可以降低系统中的安全风险。

对于 RHEL 或 CentOS 6 系统，运行下面的 [Yum 命令][1] 来安装 yum 安全插件。

```
# yum -y install yum-plugin-security
```

在 RHEL 7&8 或是 CentOS 7&8 上面，这个插件已经是 `yum` 的一部分了，不用单独安装。

要列出全部可用的补丁（包括安全、Bug 修复以及产品改进），但不安装它们：

```
# yum updateinfo list available
Loaded plugins: changelog, package_upload, product-id, search-disabled-repos,
              : subscription-manager, verify, versionlock
RHSA-2014:1031 Important/Sec. 389-ds-base-1.3.1.6-26.el7_0.x86_64
RHSA-2015:0416 Important/Sec. 389-ds-base-1.3.3.1-13.el7.x86_64
RHBA-2015:0626 bugfix         389-ds-base-1.3.3.1-15.el7_1.x86_64
RHSA-2015:0895 Important/Sec. 389-ds-base-1.3.3.1-16.el7_1.x86_64
RHBA-2015:1554 bugfix         389-ds-base-1.3.3.1-20.el7_1.x86_64
RHBA-2015:1960 bugfix         389-ds-base-1.3.3.1-23.el7_1.x86_64
RHBA-2015:2351 bugfix         389-ds-base-1.3.4.0-19.el7.x86_64
RHBA-2015:2572 bugfix         389-ds-base-1.3.4.0-21.el7_2.x86_64
RHSA-2016:0204 Important/Sec. 389-ds-base-1.3.4.0-26.el7_2.x86_64
RHBA-2016:0550 bugfix         389-ds-base-1.3.4.0-29.el7_2.x86_64
RHBA-2016:1048 bugfix         389-ds-base-1.3.4.0-30.el7_2.x86_64
RHBA-2016:1298 bugfix         389-ds-base-1.3.4.0-32.el7_2.x86_64
```

要统计补丁的大约数量，运行下面的命令：

```
# yum updateinfo list available | wc -l
11269
```

想列出全部可用的安全补丁但不安装，以下命令用来展示你系统里已安装和待安装的推荐补丁：

```
# yum updateinfo list security all
Loaded plugins: changelog, package_upload, product-id, search-disabled-repos,
              : subscription-manager, verify, versionlock
  RHSA-2014:1031 Important/Sec. 389-ds-base-1.3.1.6-26.el7_0.x86_64
  RHSA-2015:0416 Important/Sec. 389-ds-base-1.3.3.1-13.el7.x86_64
  RHSA-2015:0895 Important/Sec. 389-ds-base-1.3.3.1-16.el7_1.x86_64
  RHSA-2016:0204 Important/Sec. 389-ds-base-1.3.4.0-26.el7_2.x86_64
  RHSA-2016:2594 Moderate/Sec.  389-ds-base-1.3.5.10-11.el7.x86_64
  RHSA-2017:0920 Important/Sec. 389-ds-base-1.3.5.10-20.el7_3.x86_64
  RHSA-2017:2569 Moderate/Sec.  389-ds-base-1.3.6.1-19.el7_4.x86_64
  RHSA-2018:0163 Important/Sec. 389-ds-base-1.3.6.1-26.el7_4.x86_64
  RHSA-2018:0414 Important/Sec. 389-ds-base-1.3.6.1-28.el7_4.x86_64
  RHSA-2018:1380 Important/Sec. 389-ds-base-1.3.7.5-21.el7_5.x86_64
  RHSA-2018:2757 Moderate/Sec.  389-ds-base-1.3.7.5-28.el7_5.x86_64
  RHSA-2018:3127 Moderate/Sec.  389-ds-base-1.3.8.4-15.el7.x86_64
  RHSA-2014:1031 Important/Sec. 389-ds-base-libs-1.3.1.6-26.el7_0.x86_64
```

要显示所有待安装的安全补丁：

```
# yum updateinfo list security all | grep -v "i"

  RHSA-2014:1031 Important/Sec. 389-ds-base-1.3.1.6-26.el7_0.x86_64
  RHSA-2015:0416 Important/Sec. 389-ds-base-1.3.3.1-13.el7.x86_64
  RHSA-2015:0895 Important/Sec. 389-ds-base-1.3.3.1-16.el7_1.x86_64
  RHSA-2016:0204 Important/Sec. 389-ds-base-1.3.4.0-26.el7_2.x86_64
  RHSA-2016:2594 Moderate/Sec.  389-ds-base-1.3.5.10-11.el7.x86_64
  RHSA-2017:0920 Important/Sec. 389-ds-base-1.3.5.10-20.el7_3.x86_64
  RHSA-2017:2569 Moderate/Sec.  389-ds-base-1.3.6.1-19.el7_4.x86_64
  RHSA-2018:0163 Important/Sec. 389-ds-base-1.3.6.1-26.el7_4.x86_64
  RHSA-2018:0414 Important/Sec. 389-ds-base-1.3.6.1-28.el7_4.x86_64
  RHSA-2018:1380 Important/Sec. 389-ds-base-1.3.7.5-21.el7_5.x86_64
  RHSA-2018:2757 Moderate/Sec.  389-ds-base-1.3.7.5-28.el7_5.x86_64
```

要统计全部安全补丁的大致数量，运行下面的命令：

```
# yum updateinfo list security all | wc -l
3522
```

下面根据已装软件列出可更新的安全补丁。这包括 bugzilla（bug 修复）、CVE（知名漏洞数据库）、安全更新等：

```
# yum updateinfo list security

或者

# yum updateinfo list sec

Loaded plugins: changelog, package_upload, product-id, search-disabled-repos,
              : subscription-manager, verify, versionlock

RHSA-2018:3665 Important/Sec. NetworkManager-1:1.12.0-8.el7_6.x86_64
RHSA-2018:3665 Important/Sec. NetworkManager-adsl-1:1.12.0-8.el7_6.x86_64
RHSA-2018:3665 Important/Sec. NetworkManager-bluetooth-1:1.12.0-8.el7_6.x86_64
RHSA-2018:3665 Important/Sec. NetworkManager-config-server-1:1.12.0-8.el7_6.noarch
RHSA-2018:3665 Important/Sec. NetworkManager-glib-1:1.12.0-8.el7_6.x86_64
RHSA-2018:3665 Important/Sec. NetworkManager-libnm-1:1.12.0-8.el7_6.x86_64
RHSA-2018:3665 Important/Sec. NetworkManager-ppp-1:1.12.0-8.el7_6.x86_64
RHSA-2018:3665 Important/Sec. NetworkManager-team-1:1.12.0-8.el7_6.x86_64
RHSA-2018:3665 Important/Sec. NetworkManager-tui-1:1.12.0-8.el7_6.x86_64
RHSA-2018:3665 Important/Sec. NetworkManager-wifi-1:1.12.0-8.el7_6.x86_64
RHSA-2018:3665 Important/Sec. NetworkManager-wwan-1:1.12.0-8.el7_6.x86_64
```

显示所有与安全相关的更新，并且返回一个结果来告诉你是否有可用的补丁：

```
# yum --security check-update
Loaded plugins: changelog, package_upload, product-id, search-disabled-repos, subscription-manager, verify, versionlock
rhel-7-server-rpms                                                                                                                            | 2.0 kB  00:00:00
--> policycoreutils-devel-2.2.5-20.el7.x86_64 from rhel-7-server-rpms excluded (updateinfo)
--> smc-raghumalayalam-fonts-6.0-7.el7.noarch from rhel-7-server-rpms excluded (updateinfo)
--> amanda-server-3.3.3-17.el7.x86_64 from rhel-7-server-rpms excluded (updateinfo)
--> 389-ds-base-libs-1.3.4.0-26.el7_2.x86_64 from rhel-7-server-rpms excluded (updateinfo)
--> 1:cups-devel-1.6.3-26.el7.i686 from rhel-7-server-rpms excluded (updateinfo)
--> openwsman-client-2.6.3-3.git4391e5c.el7.i686 from rhel-7-server-rpms excluded (updateinfo)
--> 1:emacs-24.3-18.el7.x86_64 from rhel-7-server-rpms excluded (updateinfo)
--> augeas-libs-1.4.0-2.el7_4.2.i686 from rhel-7-server-rpms excluded (updateinfo)
--> samba-winbind-modules-4.2.3-10.el7.i686 from rhel-7-server-rpms excluded (updateinfo)
--> tftp-5.2-11.el7.x86_64 from rhel-7-server-rpms excluded (updateinfo)
.
.
35 package(s) needed for security, out of 115 available
NetworkManager.x86_64                        1:1.12.0-10.el7_6            rhel-7-server-rpms
NetworkManager-adsl.x86_64                   1:1.12.0-10.el7_6            rhel-7-server-rpms
NetworkManager-bluetooth.x86_64              1:1.12.0-10.el7_6            rhel-7-server-rpms
NetworkManager-config-server.noarch          1:1.12.0-10.el7_6            rhel-7-server-rpms
NetworkManager-glib.x86_64                   1:1.12.0-10.el7_6            rhel-7-server-rpms
NetworkManager-libnm.x86_64                  1:1.12.0-10.el7_6            rhel-7-server-rpms
NetworkManager-ppp.x86_64                    1:1.12.0-10.el7_6            rhel-7-server-rpms
```

列出所有可用的安全补丁，并且显示其详细信息：

```
# yum info-sec
.
.
===============================================================================
  tzdata bug fix and enhancement update
===============================================================================
  Update ID : RHBA-2019:0689
    Release : 0
       Type : bugfix
     Status : final
     Issued : 2019-03-28 19:27:44 UTC
Description : The tzdata packages contain data files with rules for various
            : time zones.
            :
            : The tzdata packages have been updated to version
            : 2019a, which addresses recent time zone changes.
            : Notably:
            :
            : * The Asia/Hebron and Asia/Gaza zones will start
            :   DST on 2019-03-30, rather than 2019-03-23 as
            :   previously predicted.
            : * Metlakatla rejoined Alaska time on 2019-01-20,
            :   ending its observances of Pacific standard time.
            :
            : (BZ#1692616, BZ#1692615, BZ#1692816)
            :
            : Users of tzdata are advised to upgrade to these
            : updated packages.
   Severity : None
```

如果你想要知道某个更新的具体内容，可以运行下面这个命令：

```
# yum updateinfo RHSA-2019:0163

Loaded plugins: changelog, package_upload, product-id, search-disabled-repos, subscription-manager, verify, versionlock
rhel-7-server-rpms                                                                                                                            | 2.0 kB  00:00:00
===============================================================================
  Important: kernel security, bug fix, and enhancement update
===============================================================================
  Update ID : RHSA-2019:0163
    Release : 0
       Type : security
     Status : final
     Issued : 2019-01-29 15:21:23 UTC
    Updated : 2019-01-29 15:23:47 UTC       Bugs : 1641548 - CVE-2018-18397 kernel: userfaultfd bypasses tmpfs file permissions
            : 1641878 - CVE-2018-18559 kernel: Use-after-free due to race condition in AF_PACKET implementation
       CVEs : CVE-2018-18397
            : CVE-2018-18559
Description : The kernel packages contain the Linux kernel, the core of any
            : Linux operating system.
            :
            : Security Fix(es):
            :
            : * kernel: Use-after-free due to race condition in
            :   AF_PACKET implementation (CVE-2018-18559)
            :
            : * kernel: userfaultfd bypasses tmpfs file
            :   permissions (CVE-2018-18397)
            :
            : For more details about the security issue(s),
            : including the impact, a CVSS score, and other
            : related information, refer to the CVE page(s)
            : listed in the References section.
            :
            : Bug Fix(es):
            :
            : These updated kernel packages include also
            : numerous bug fixes and enhancements. Space
            : precludes documenting all of the bug fixes in this
            : advisory. See the descriptions in the related
            : Knowledge Article:
            : https://access.redhat.com/articles/3827321
   Severity : Important
updateinfo info done
```

跟之前类似，你可以只查询那些通过 CVE 释出的系统漏洞：

```
# yum updateinfo list cves

Loaded plugins: changelog, package_upload, product-id, search-disabled-repos,
              : subscription-manager, verify, versionlock
CVE-2018-15688 Important/Sec. NetworkManager-1:1.12.0-8.el7_6.x86_64
CVE-2018-15688 Important/Sec. NetworkManager-adsl-1:1.12.0-8.el7_6.x86_64
CVE-2018-15688 Important/Sec. NetworkManager-bluetooth-1:1.12.0-8.el7_6.x86_64
CVE-2018-15688 Important/Sec. NetworkManager-config-server-1:1.12.0-8.el7_6.noarch
CVE-2018-15688 Important/Sec. NetworkManager-glib-1:1.12.0-8.el7_6.x86_64
CVE-2018-15688 Important/Sec. NetworkManager-libnm-1:1.12.0-8.el7_6.x86_64
CVE-2018-15688 Important/Sec. NetworkManager-ppp-1:1.12.0-8.el7_6.x86_64
CVE-2018-15688 Important/Sec. NetworkManager-team-1:1.12.0-8.el7_6.x86_64
```

你也可以查看那些跟 bug 修复相关的更新，运行下面的命令：

```
# yum updateinfo list bugfix | less

Loaded plugins: changelog, package_upload, product-id, search-disabled-repos,
              : subscription-manager, verify, versionlock
RHBA-2018:3349 bugfix NetworkManager-1:1.12.0-7.el7_6.x86_64
RHBA-2019:0519 bugfix NetworkManager-1:1.12.0-10.el7_6.x86_64
RHBA-2018:3349 bugfix NetworkManager-adsl-1:1.12.0-7.el7_6.x86_64
RHBA-2019:0519 bugfix NetworkManager-adsl-1:1.12.0-10.el7_6.x86_64
RHBA-2018:3349 bugfix NetworkManager-bluetooth-1:1.12.0-7.el7_6.x86_64
RHBA-2019:0519 bugfix NetworkManager-bluetooth-1:1.12.0-10.el7_6.x86_64
RHBA-2018:3349 bugfix NetworkManager-config-server-1:1.12.0-7.el7_6.noarch
RHBA-2019:0519 bugfix NetworkManager-config-server-1:1.12.0-10.el7_6.noarch
```

要想得到待安装更新的摘要信息，运行这个：

```
# yum updateinfo summary
Loaded plugins: changelog, package_upload, product-id, search-disabled-repos, subscription-manager, verify, versionlock
rhel-7-server-rpms                                                                                                                            | 2.0 kB  00:00:00
Updates Information Summary: updates
    13 Security notice(s)
         9 Important Security notice(s)
         3 Moderate Security notice(s)
         1 Low Security notice(s)
    35 Bugfix notice(s)
     1 Enhancement notice(s)
updateinfo summary done
```

如果只想打印出低级别的安全更新，运行下面这个命令。类似的，你也可以只查询重要级别和中等级别的安全更新。

```
# yum updateinfo list sec | grep -i "Low"

RHSA-2019:0201 Low/Sec.       libgudev1-219-62.el7_6.3.x86_64
RHSA-2019:0201 Low/Sec.       systemd-219-62.el7_6.3.x86_64
RHSA-2019:0201 Low/Sec.       systemd-libs-219-62.el7_6.3.x86_64
RHSA-2019:0201 Low/Sec.       systemd-sysv-219-62.el7_6.3.x86_64
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/check-list-view-find-available-security-updates-on-redhat-rhel-centos-system/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[jdh8383](https://github.com/jdh8383)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
