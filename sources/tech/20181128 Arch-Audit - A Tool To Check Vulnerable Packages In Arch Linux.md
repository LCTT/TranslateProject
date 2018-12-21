[#]: collector: (lujun9972)
[#]: translator: ( Auk7F7)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: subject: (Arch-Audit : A Tool To Check Vulnerable Packages In Arch Linux)
[#]: via: (https://www.2daygeek.com/arch-audit-a-tool-to-check-vulnerable-packages-in-arch-linux/)
[#]: author: (Prakash Subramanian https://www.2daygeek.com/author/prakash/)
[#]: url: ( )


Arch-Audit : A Tool To Check Vulnerable Packages In Arch Linux
======

We have to make the system up-to date to minimize the downtime and issues.

It’s one of the routine task for Linux administrator to patch the system once in a month or 60 days once or 90 days at maximum.

It would be sufficient schedule and we can’t do it this less than a month as it’s involve multiple activities and environments.

Basically infrastructure comes with Test, Development, QA a.k.a Staging & Prod environments.

Initially we will deploy the patches in the Test environment and corresponding team will be monitoring the system a week then they will give a status report like good or bad.

If it’s success then we will move forward to other environments. If everything is good then finally we will patch production servers.

Many of the organization has prepare to patch entire system. i mean full system update. It is a general patching schedule for a typical infrastructure.

In some of the infrastructure they may have only production environment so, we should not prepare for the full system update instead we can go with security patch to make the system more stable and secure.

Since Arch Linux and its derivatives distributions are fall under rolling release can be considered to be always up-to-date, as it uses the latest versions of software packages from the upstream.

In some cases if you want to update security patch alone then you have to use arch-audit tool to identify and fix the security patches.

### What is a Vulnerability?

A vulnerability is a security weakness in a software program or hardware components (firmware). It’s a flaw that can leave it open to attack.

To mitigate this we need to patch accordingly like for application/hardware it could be a code changes or config changes or parameter changes.

### What is Arch-Audit Tool?

[Arch-audit][1] is a tool like pkg-audit for Arch Linux system. It Uses data collected by the awesome Arch Security Team. It wont scan and find the vulnerable packages on your system like **yum –security check-update & yum updateinfo list available** and it will simply parse the <https://security.archlinux.org/> page and display the results in terminal. So, it would show the accurate data.

The Arch Security Team is a group of volunteers whose goal is to track security issues with Arch Linux packages. All issues are tracked on the Arch Linux security tracker.

The team was formerly known as the Arch CVE Monitoring Team. The mission of the Arch Security Team is to contribute to the improvement of the security of Arch Linux.

### How to Install arch-audit tool in Arch Linux

The arch-audit tool is available in community repository so you can use the Pacman Package Manager to install it.

```
$ sudo pacman -S arch-audit
```

Run the `arch-audit` tool to find the open vulnerable packages on Arch based distributions.

```
$ arch-audit
Package cairo is affected by CVE-2017-7475. Low risk!
Package exiv2 is affected by CVE-2017-11592, CVE-2017-11591, CVE-2017-11553, CVE-2017-17725, CVE-2017-17724, CVE-2017-17723, CVE-2017-17722. Medium risk!
Package libtiff is affected by CVE-2018-18661, CVE-2018-18557, CVE-2017-9935, CVE-2017-11613. High risk!. Update to 4.0.10-1!
Package openssl is affected by CVE-2018-0735, CVE-2018-0734. Low risk!
Package openssl-1.0 is affected by CVE-2018-5407, CVE-2018-0734. Low risk!
Package patch is affected by CVE-2018-6952, CVE-2018-1000156. High risk!. Update to 2.7.6-7!
Package pcre is affected by CVE-2017-11164. Low risk!
Package systemd is affected by CVE-2018-6954, CVE-2018-15688, CVE-2018-15687, CVE-2018-15686. Critical risk!. Update to 239.300-1!
Package unzip is affected by CVE-2018-1000035. Medium risk!
Package webkit2gtk is affected by CVE-2018-4372. Critical risk!. Update to 2.22.4-1!
```

The above result shows the vulnerability risk status as well such as Low, Medium and Critical.

To Show only vulnerable package names and their versions.

```
$ arch-audit -q
cairo
exiv2
libtiff>=4.0.10-1
openssl
openssl-1.0
patch>=2.7.6-7
pcre
systemd>=239.300-1
unzip
webkit2gtk>=2.22.4-1
```

To show only packages that have already been fixed.

```
$ arch-audit --upgradable --quiet
libtiff>=4.0.10-1
patch>=2.7.6-7
systemd>=239.300-1
webkit2gtk>=2.22.4-1
```

To cross check the above results, i’m going to test one of the package which is listed above in <https://www.archlinux.org/packages/> to confirm whether the vulnerability is still open or fixed it. Yes, it’s fixed and published the updated package in repository on yesterday.
![][3]

To print only package names and associated CVEs alone.

```
$ arch-audit -uf "%n|%c"
libtiff|CVE-2018-18661,CVE-2018-18557,CVE-2017-9935,CVE-2017-11613
patch|CVE-2018-6952,CVE-2018-1000156
systemd|CVE-2018-6954,CVE-2018-15688,CVE-2018-15687,CVE-2018-15686
webkit2gtk|CVE-2018-4372
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/arch-audit-a-tool-to-check-vulnerable-packages-in-arch-linux/

作者：[Prakash Subramanian][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/prakash/
[b]: https://github.com/lujun9972
[1]: https://github.com/ilpianista/arch-audit
[2]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]: https://www.2daygeek.com/wp-content/uploads/2018/11/A-Tool-To-Check-Vulnerable-Packages-In-Arch-Linux.png
