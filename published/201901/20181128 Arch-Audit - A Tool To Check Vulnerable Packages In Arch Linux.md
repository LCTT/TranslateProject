[#]: collector: "lujun9972"
[#]: translator: "Auk7F7"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: subject: "Arch-Audit : A Tool To Check Vulnerable Packages In Arch Linux"
[#]: via: "https://www.2daygeek.com/arch-audit-a-tool-to-check-vulnerable-packages-in-arch-linux/"
[#]: author: "Prakash Subramanian https://www.2daygeek.com/author/prakash/"
[#]: url: "https://linux.cn/article-10473-1.html"

Arch-Audit：一款在 Arch Linux 上检查易受攻击的软件包的工具
======

我们必须经常更新我们的系统以减少宕机时间和问题。每月给系统打一次补丁，60 天一次或者最多 90 天一次，这是 Linux 管理员的例行任务之一。这是忙碌的工作计划，我们不能在不到一个月内做到这一点，因为它涉及到多种活动和环境。

基本上，基础设施会一同提供测试、开发、 QA 环境（即各个分段和产品）。

最初，我们会在测试环境中部署补丁，相应的团队将监视系统一周，然后他们将给出一份或好或坏的状态的报告。如果成功的话，我们将会在其他环境中继续测试，若正常运行，那么最后我们会给生产服务器打上补丁。

许多组织会对整个系统打上补丁，我的意思是全系统更新，对于典型基础设施这是一种常规修补计划。

某些基础设施中可能只有生产环境，因此，我们不应该做全系统更新，而是应该使用安全修补程序来使系统更加稳定和安全。

由于 Arch Linux 及其衍生的发行版属于滚动更新版本，因此可以认为它们始终是最新的，因为它使用上游软件包的最新版本。 

在某些情况下，如果要单独更新安全修补程序，则必须使用 arch-audit 工具来标识和修复安全修补程序。

### 漏洞是什么?

漏洞是软件程序或硬件组件（固件）中的安全漏洞。这是一个可以让它容易受到攻击的缺陷。

为了缓解这种情况，我们需要相应地修补漏洞，就像应用程序/硬件一样，它可能是代码更改或配置更改或参数更改。

### Arch-Audit 工具是什么？

[Arch-audit][1] 是一个类似于 Arch Linux 的 pkg-audit 工具。它使用了令人称赞的 Arch 安全小组收集的数据。它不会扫描以发现系统中易受攻击的包（就像 `yum –security check-update & yum updateinfo` 一样列出可用的软件包），它只需解析 <https://security.archlinux.org/>  页面并在终端中显示结果，因此，它将显示准确的数据。（LCTT 译注：此处原作者叙述不清晰。该功能虽然不会像病毒扫描软件一样扫描系统上的文件，但是会读取已安装的软件列表，并据此查询上述网址列出风险报告。）

Arch 安全小组是一群以跟踪 Arch Linux 软件包的安全问题为目的的志愿者。所有问题都在 Arch 安全追踪者的监视下。

该小组以前被称为 Arch CVE 监测小组，Arch 安全小组的使命是为提高 Arch Linux 的安全性做出贡献。

### 如何在 Arch Linux 上安装 Arch-Audit 工具

Arch-audit 工具已经存在社区的仓库中，所以你可以使用 Pacman 包管理器来安装它。

```
$ sudo pacman -S arch-audit
```

运行 `arch-audit` 工具以查找在基于 Arch 的发行版本上的存在缺陷的包。

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

上述结果显示了系统的脆弱性风险状况，比如：低、中和严重三种情况。

若要仅显示易受攻击的包及其版本，请执行以下操作。

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

仅显示已修复的包。

```
$ arch-audit --upgradable --quiet
libtiff>=4.0.10-1
patch>=2.7.6-7
systemd>=239.300-1
webkit2gtk>=2.22.4-1
```

为了交叉检查上述结果，我将测试在 <https://www.archlinux.org/packages/> 列出的一个包以确认漏洞是否仍处于开放状态或已修复。是的，它已经被修复了，并于昨天在社区仓库中发布了更新后的包。

![][3]

仅打印包名称和其相关的 CVE。

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
译者：[Auk7F7](https://github.com/Auk7F7)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/prakash/
[b]: https://github.com/lujun9972
[1]: https://github.com/ilpianista/arch-audit
[2]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]: https://www.2daygeek.com/wp-content/uploads/2018/11/A-Tool-To-Check-Vulnerable-Packages-In-Arch-Linux.png
