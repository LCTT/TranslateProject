[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Check Available Security Updates On Red Hat (RHEL) And CentOS System?)
[#]: via: (https://www.2daygeek.com/check-list-view-find-available-security-updates-on-redhat-rhel-centos-system/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

How To Check Available Security Updates On Red Hat (RHEL) And CentOS System?
======

As per your organization policy you may need to push only security updates due to varies reasons.

In most cases, it could be an application compatibility issues.

How to do that? Is it possible to limit yum to perform only security updates?

Yes, it’s possible and can be done easily through yum package manager.

In this article, we are not giving only the required information.

Instead, we have added lot more commands that help you to gather many information about a given security package.

This may give you an idea or opportunity to understand and fix the list of vulnerabilities, which you have it.

If security vulnerabilities are discovered, the affected software must be updated in order to limit any potential security risks on system.

For RHEL/CentOS 6 systems, run the following **[Yum Command][1]** to install yum security plugin.

```
# yum -y install yum-plugin-security
```

The plugin is already a part of yum itself so, no need to install this on RHEL 7&8/CentOS 7&8.

To list all available erratas (it includes Security, Bug Fix and Product Enhancement) without installing them.

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

To count the number of erratas, run the following command.

```
# yum updateinfo list available | wc -l
11269
```

To list all available security updates without installing them.

It used to display information about both installed and available advisories on your system.

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

To print all available advisories security packages (It prints all kind of packages like installed and not-installed).

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

To count the number of available security package, run the following command.

```
# yum updateinfo list security all | wc -l
3522
```

It’s used to list all of the relevant errata notice information, from the updateinfo.xml data in yum. This includes bugzillas, CVEs, security updates and new.

```
# yum updateinfo list security

or

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

To display all updates that are security relevant, and get a return code on whether there are security updates.

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

To list all available security updates with verbose descriptions of the issues.

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

If you would like to know more information about the given advisory, run the following command.

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

Similarly, you can view CVEs which affect the system using the following command.

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

Similarly, you can view the packages which is belongs to bugfixs by running the following command.

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

To get a summary of advisories, which needs to be installed on your system.

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

To print only specific pattern of security advisories, run the following command. Similarly, you can check Important or Moderate security advisories info alone.

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
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
