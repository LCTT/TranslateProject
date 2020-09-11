[#]: collector: (lujun9972)
[#]: translator: (hopefully2333)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10876-1.html)
[#]: subject: (Cisco issues critical security warning for Nexus data-center switches)
[#]: via: (https://www.networkworld.com/article/3392858/cisco-issues-critical-security-warning-for-nexus-data-center-switches.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

思科针对 Nexus 数据中心交换机发出危急安全预警
======

> 思科围绕着 Nexus 的交换机、Firepower 防火墙和其他设备，发布了 40 个安全报告。

![Thinkstock][1]

日前，思科发布了 40 个左右的安全报告，但只有其中的一个被评定为“[危急][2]”：思科 Nexus 9000 系列应用中心基础设施（ACI）模式数据中心交换机中的一个漏洞，可能会让攻击者隐秘地访问到系统资源。

这个新发现的漏洞，被通用漏洞评分系统给到了 9.8 分（满分 10 分），思科表示，它是思科 Nexus 9000 系列的安全 shell （ssh）密钥管理方面的问题，这个漏洞允许远程攻击者以 root 用户的权限来连接到受影响的系统。

思科表示，“**这个漏洞是因为所有的设备都存在一对默认的 ssh 密钥对**，攻击者可以使用提取到的密钥材料，并通过 IPv6 来创建连接到目标设备的 SSH 连接。这个漏洞仅能通过 IPv6 来进行利用，IPv4 不会被攻击”。

型号为 Nexus 9000 系列且 NX-OS 软件版本在 14.1 之前的设备会受此漏洞的影响，该公司表示没有解决这个问题的变通办法。

然而，思科公司已经为解决这个漏洞[发布了免费的软件更新][4]。

该公司同样对 Nexus 9000 系列发布了一个“高危”级别的安全预警报告，报告中表示存在一种攻击，允许攻击者以 root 用户权限在受影响的设备上执行任意操作系统命令。思科表示，如果要用这种方式攻击成功，攻击者需要对应设备的有效的管理员用户凭证。

[思科表示][5]，这个漏洞是由于过于宽泛的系统文件权限造成的。攻击者可以通过向受影响的设备进行认证，构造一个精心设计的命令字符串，并将这个字符串写入到特定位置的文件里。攻击者通过这种方式来利用这个漏洞。

思科发布了解决这个漏洞的软件更新。

另外两个被评为“高危”级别的漏洞的影响范围同样包括 Nexus 9000 系列：

- 思科 Nexus 9000 系列软件后台操作功能中的[漏洞][7]，能够允许一个已认证的本地攻击者在受影响的设备上提权到 root 权限。这个漏洞是由于在受影响的设备上用户提供的文件验证不充分。思科表示，攻击者可以通过登录到受影响设备的命令行界面，并在文件系统的特定目录中构造一个精心设计过的文件，以此来利用这个漏洞。
- 交换机软件后台操作功能中的[弱点][7]能够允许攻击者登录到受影响设备的命令行界面，并在文件系统的特定目录里创建一个精心构造过的文件。思科表示，这个漏洞是由于在受影响的设备上用户提供的文件验证不充分。

思科同样为这些漏洞[发布了软件更新][4]。

此外，这些安全警告中的一部分是针对思科 FirePower 防火墙系列中大量的“高危”漏洞警告。

例如，思科[写道][8]，思科 Firepower 威胁防御软件的 SMB 协议预处理检测引擎中的多个漏洞能够允许未认证的相邻、远程攻击者造成拒绝服务攻击（DoS）的情况。

思科表示，思科 Firepower 2100 系列中思科 Firepower 软件里的内部数据包处理功能有[另一个漏洞][9]，能够让未认证的远程攻击者造成受影响的设备停止处理流量，从而导致 DOS 的情况。

[软件补丁][4]可用于这些漏洞。

其他的产品，比如思科[自适应安全虚拟设备][10]和 [web 安全设备][11]同样也有高优先级的补丁。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3392858/cisco-issues-critical-security-warning-for-nexus-data-center-switches.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[hopefully2333](https://github.com/hopefully2333)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2018/02/lock_broken_unlocked_binary_code_security_circuits_protection_privacy_thinkstock_873916354-100750739-large.jpg
[2]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20190501-nexus9k-sshkey
[3]: https://www.networkworld.com/article/3284352/data-center/how-to-plan-a-software-defined-data-center-network.html
[4]: https://www.cisco.com/c/en/us/about/legal/cloud-and-software/end_user_license_agreement.html
[5]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20190501-nexus9k-rpe
[6]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fcertified-information-systems-security-professional-cisspr
[7]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20190501-aci-hw-clock-util
[8]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20190501-frpwr-smb-snort
[9]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20190501-frpwr-dos
[10]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20190501-asa-ipsec-dos
[11]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20190501-wsa-privesc
[12]: https://www.facebook.com/NetworkWorld/
[13]: https://www.linkedin.com/company/network-world
