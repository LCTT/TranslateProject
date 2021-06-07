[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11152-1.html)
[#]: subject: (How to Enable Canonical Kernel Livepatch Service on Ubuntu LTS System?)
[#]: via: (https://www.2daygeek.com/enable-canonical-kernel-livepatch-service-on-ubuntu-lts-system/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

如何在 Ubuntu LTS 系统上启用 Canonical 的内核实时补丁服务
======

![](https://img.linux.net.cn/data/attachment/album/201907/27/072251d3dij23lndtuutzr.jpg)

Canonical 在 Ubuntu 14.04 LTS 系统中引入了<ruby>内核实时补丁服务<rt>Kernel Livepatch Service</rt></ruby>。实时补丁服务允许你安装和应用关键的 Linux 内核安全更新，而无需重新启动系统。这意味着，在应用内核补丁程序后，你无需重新启动系统。而通常情况下，我们需要在安装内核补丁后重启 Linux 服务器才能供系统使用。

实时修补非常快。大多数内核修复程序只需要几秒钟。Canonical 的实时补丁服务对于不超过 3 个系统的用户无需任何费用。你可以通过命令行在桌面和服务器中启用 Canonical 实时补丁服务。

这个实时补丁系统旨在解决高级和关键的 Linux 内核安全漏洞。

有关[支持的系统][1]和其他详细信息，请参阅下表。

Ubuntu 版本 | 架构 | 内核版本 | 内核变体
---|---|---|---
Ubuntu 18.04 LTS | 64-bit x86 | 4.15 | 仅 GA 通用和低电压内核
Ubuntu 16.04 LTS | 64-bit x86 | 4.4 | 仅 GA 通用和低电压内核
Ubuntu 14.04 LTS | 64-bit x86 | 4.4 | 仅 Hardware Enablement 内核

**注意**：Ubuntu 14.04 中的 Canonical 实时补丁服务 LTS 要求用户在 Trusty 中运行 Ubuntu v4.4 内核。如果你当前没有运行使用该服务，请重新启动到此内核。

为此，请按照以下步骤操作。

### 如何获取实时补丁令牌？

导航到 [Canonical 实时补丁服务页面][2]，如果要使用免费服务，请选择“Ubuntu 用户”。它适用于不超过 3 个系统的用户。如果你是 “UA 客户” 或多于 3 个系统，请选择 “Ubuntu customer”。最后，单击 “Get your Livepatch token” 按钮。

![][4]

确保你已经在 “Ubuntu One” 中拥有帐号。否则，可以创建一个新的。

登录后，你将获得你的帐户密钥。

![][5]

### 在系统中安装 Snap 守护程序

实时补丁系统通过快照包安装。因此，请确保在 Ubuntu 系统上安装了 snapd 守护程序。

```
$ sudo apt update
$ sudo apt install snapd
```

### 如何系统中安装和配置实时补丁服务？

通过运行以下命令安装 `canonical-livepatch` 守护程序。

```
$ sudo snap install canonical-livepatch
canonical-livepatch 9.4.1 from Canonical* installed
```

运行以下命令以在 Ubuntu 计算机上启用实时内核补丁程序。

```
$ sudo canonical-livepatch enable xxxxc4xxxx67xxxxbxxxxbxxxxfbxx4e

Successfully enabled device. Using machine-token: xxxxc4xxxx67xxxxbxxxxbxxxxfbxx4e
```

运行以下命令查看实时补丁机器的状态。

```
$ sudo canonical-livepatch status

client-version: 9.4.1
architecture: x86_64
cpu-model: Intel(R) Core(TM) i7-6700HQ CPU @ 2.60GHz
last-check: 2019-07-24T12:30:04+05:30
boot-time: 2019-07-24T12:11:06+05:30
uptime: 19m11s
status:
- kernel: 4.15.0-55.60-generic
  running: true
  livepatch:
    checkState: checked
    patchState: nothing-to-apply
    version: ""
    fixes: ""
```

使用 `--verbose` 开关运行上述相同的命令，以获取有关实时修补机器的更多信息。

```
$ sudo canonical-livepatch status --verbose
```

如果要手动运行补丁程序，请执行以下命令。

```
$ sudo canonical-livepatch refresh

Before refresh:

kernel: 4.15.0-55.60-generic
fully-patched: true
version: ""

After refresh:

kernel: 4.15.0-55.60-generic
fully-patched: true
version: ""
```

`patchState` 会有以下状态之一：

* `applied`：未发现任何漏洞
* `nothing-to-apply`：成功找到并修补了漏洞
* `kernel-upgrade-required`：实时补丁服务无法安装补丁来修复漏洞

请注意，安装内核补丁与在系统上升级/安装新内核不同。如果安装了新内核，则必须重新引导系统以激活新内核。

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/enable-canonical-kernel-livepatch-service-on-ubuntu-lts-system/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://wiki.ubuntu.com/Kernel/Livepatch
[2]: https://auth.livepatch.canonical.com/
[3]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[4]: https://www.2daygeek.com/wp-content/uploads/2019/07/enable-canonical-livepatch-service-on-ubuntu-lts-system-1.jpg
[5]: https://www.2daygeek.com/wp-content/uploads/2019/07/enable-canonical-livepatch-service-on-ubuntu-lts-system-2.jpg
