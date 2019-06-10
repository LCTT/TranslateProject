[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Two Methods To Check Or List Installed Security Updates on Redhat (RHEL) And CentOS System)
[#]: via: (https://www.2daygeek.com/check-installed-security-updates-on-redhat-rhel-and-centos-system/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

Two Methods To Check Or List Installed Security Updates on Redhat (RHEL) And CentOS System
======

We had wrote two articles in the past about this topic and each articles were published for different requirements.

If you would like to check those articles before getting into this topic.

Navigate to the following links.

  * **[How To Check Available Security Updates On Red Hat (RHEL) And CentOS System?][1]**
  * **[Four Ways To Install Security Updates On Red Hat (RHEL) And CentOS Systems?][2]**



These articles are interlinked one with others so, better to read them before digging into this.

In this article, we will show you, how to check installed security updates.

I have add two methods to achieve this and you can choose which one is best and suitable for you.

Also, i added a small shell script, that gives you a summary about installed security packages count.

Run the following command to get a list of the installed security updates on your system.

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

To count the number of installed security packages, run the following command.

```
# yum updateinfo list security installed | wc -l
1046
```

To print only install packages list.

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

To count the number of installed security packages, run the following command.

```
# yum updateinfo list security all | grep -w "i" | wc -l
1043
```

Alternatively, you can check the list of vulnerabilities had fixed against the given package.

In this example, we are going to check the list of vulnerabilities had fixed in the “openssh” package.

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

Similarly, you can check whether the given vulnerability is fixed or not in the corresponding package by running the following command.

```
# rpm -q --changelog openssh | grep -i CVE-2016-3115

- CVE-2016-3115: missing sanitisation of input for X11 forwarding (#1317819)
```

### How To Count Installed Security Packages Using Shell Script?

I have added a small shell script, which helps you to count the list of installed security packages.

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

Set an executable permission to `security-check.sh` file.

```
$ chmod +x security-check.sh
```

Finally run the script to achieve this.

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
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/check-list-view-find-available-security-updates-on-redhat-rhel-centos-system/
[2]: https://www.2daygeek.com/install-security-updates-on-redhat-rhel-centos-system/
