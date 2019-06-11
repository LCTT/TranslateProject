[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10960-1.html)
[#]: subject: (Two Methods To Check Or List Installed Security Updates on Redhat (RHEL) And CentOS System)
[#]: via: (https://www.2daygeek.com/check-installed-security-updates-on-redhat-rhel-and-centos-system/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

在 RHEL 和 CentOS 上检查或列出已安装的安全更新的两种方法
======

![](https://img.linux.net.cn/data/attachment/album/201906/11/100735bdnjzkkmjbxbttmm.jpg)

我们过去曾写过两篇关于这个主题的文章，每篇文章都是根据不同的要求发表的。如果你想在开始之前浏览这些文章。请通过以下链接：

* [如何检查 RHEL 和 CentOS 上的可用安全更新？][1]
* [在 RHEL 和 CentOS 上安装安全更新的四种方法？][2]

这些文章与其他文章相互关联，因此，在深入研究之前，最好先阅读这些文章。

在本文中，我们将向你展示如何检查已安装的安全更新。我会介绍两种方法，你可以选择最适合你的。

此外，我还添加了一个小的 shell 脚本，它为你提供已安装的安全包计数。

运行以下命令获取系统上已安装的安全更新的列表。

```
# yum updateinfo list security installed

Loaded plugins: changelog, package_upload, product-id, search-disabled-repos,
              : subscription-manager, verify, versionlock
RHSA-2015:2315 Moderate/Sec.  ModemManager-glib-1.1.0-8.git20130913.el7.x86_64
RHSA-2015:2315 Moderate/Sec.  NetworkManager-1:1.0.6-27.el7.x86_64
RHSA-2016:2581 Low/Sec.       NetworkManager-1:1.4.0-12.el7.x86_64
RHSA-2017:2299 Moderate/Sec.  NetworkManager-1:1.8.0-9.el7.x86_64
RHSA-2015:2315 Moderate/Sec.  NetworkManager-adsl-1:1.0.6-27.el7.x86_64
RHSA-2016:2581 Low/Sec.       NetworkManager-adsl-1:1.4.0-12.el7.x86_64
RHSA-2017:2299 Moderate/Sec.  NetworkManager-adsl-1:1.8.0-9.el7.x86_64
RHSA-2015:2315 Moderate/Sec.  NetworkManager-bluetooth-1:1.0.6-27.el7.x86_64
```

要计算已安装的安全包的数量，请运行以下命令：

```
# yum updateinfo list security installed | wc -l
1046
```

仅打印安装包列表：

```
# yum updateinfo list security all | grep -w "i"

i RHSA-2015:2315 Moderate/Sec.  ModemManager-glib-1.1.0-8.git20130913.el7.x86_64
i RHSA-2015:2315 Moderate/Sec.  NetworkManager-1:1.0.6-27.el7.x86_64
i RHSA-2016:2581 Low/Sec.       NetworkManager-1:1.4.0-12.el7.x86_64
i RHSA-2017:2299 Moderate/Sec.  NetworkManager-1:1.8.0-9.el7.x86_64
i RHSA-2015:2315 Moderate/Sec.  NetworkManager-adsl-1:1.0.6-27.el7.x86_64
i RHSA-2016:2581 Low/Sec.       NetworkManager-adsl-1:1.4.0-12.el7.x86_64
i RHSA-2017:2299 Moderate/Sec.  NetworkManager-adsl-1:1.8.0-9.el7.x86_64
i RHSA-2015:2315 Moderate/Sec.  NetworkManager-bluetooth-1:1.0.6-27.el7.x86_64
i RHSA-2016:2581 Low/Sec.       NetworkManager-bluetooth-1:1.4.0-12.el7.x86_64
i RHSA-2017:2299 Moderate/Sec.  NetworkManager-bluetooth-1:1.8.0-9.el7.x86_64
i RHSA-2015:2315 Moderate/Sec.  NetworkManager-config-server-1:1.0.6-27.el7.x86_64
i RHSA-2016:2581 Low/Sec.       NetworkManager-config-server-1:1.4.0-12.el7.x86_64
i RHSA-2017:2299 Moderate/Sec.  NetworkManager-config-server-1:1.8.0-9.el7.noarch
```

要计算已安装的安全包的数量，请运行以下命令：

```
# yum updateinfo list security all | grep -w "i" | wc -l
1043
```

或者，你可以检查指定包修复的漏洞列表。

在此例中，我们将检查 “openssh” 包中已修复的漏洞列表：

```
# rpm -q --changelog openssh | grep -i CVE

- Fix for CVE-2017-15906 (#1517226)
- CVE-2015-8325: privilege escalation via user's PAM environment and UseLogin=yes (#1329191)
- CVE-2016-1908: possible fallback from untrusted to trusted X11 forwarding (#1298741)
- CVE-2016-3115: missing sanitisation of input for X11 forwarding (#1317819)
- prevents CVE-2016-0777 and CVE-2016-0778
- Security fixes released with openssh-6.9 (CVE-2015-5352) (#1247864)
- only query each keyboard-interactive device once (CVE-2015-5600) (#1245971)
- add new option GSSAPIEnablek5users and disable using ~/.k5users by default CVE-2014-9278
- prevent a server from skipping SSHFP lookup - CVE-2014-2653 (#1081338)
- change default value of MaxStartups - CVE-2010-5107 (#908707)
- CVE-2010-4755
- merged cve-2007_3102 to audit patch
- fixed audit log injection problem (CVE-2007-3102)
- CVE-2006-5794 - properly detect failed key verify in monitor (#214641)
- CVE-2006-4924 - prevent DoS on deattack detector (#207957)
- CVE-2006-5051 - don't call cleanups from signal handler (#208459)
- use fork+exec instead of system in scp - CVE-2006-0225 (#168167)
```

同样，你可以通过运行以下命令来检查相应的包中是否修复了指定的漏洞：

```
# rpm -q --changelog openssh | grep -i CVE-2016-3115

- CVE-2016-3115: missing sanitisation of input for X11 forwarding (#1317819)
```

### 如何使用 Shell 脚本计算安装的安全包？

我添加了一个小的 shell 脚本，它可以帮助你计算已安装的安全包列表。

```
# vi /opt/scripts/security-check.sh

#!/bin/bash
echo "+-------------------------+"
echo "|Security Advisories Count|"
echo "+-------------------------+"
for i in Important Moderate Low
do
sec=$(yum updateinfo list security installed | grep $i | wc -l)
echo "$i: $sec"
done | column -t
echo "+-------------------------+"
```

给 `security-check.sh` 文件执行权限。

```
$ chmod +x security-check.sh
```

最后执行脚本统计。

```
# sh /opt/scripts/security-check.sh

+-------------------------+
|Security Advisories Count|
+-------------------------+
Important:  480
Moderate:   410
Low:        111
+-------------------------+
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/check-installed-security-updates-on-redhat-rhel-and-centos-system/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-10938-1.html
[2]: https://www.2daygeek.com/install-security-updates-on-redhat-rhel-centos-system/
