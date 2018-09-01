CIP：延续 Linux 之光
======

> CIP 的目标是创建一个基本的系统，使用开源软件来为我们现代社会的基础设施提供动力。

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/cip-lights.jpg?itok=6LAUoIzt)


现如今，现代民用基础设施遍及各处 —— 发电厂、雷达系统、交通信号灯、水坝和天气系统等。这些基础设施项目已然存在数十年，这些设施还将继续提供更长时间的服务，所以安全性和使用寿命是至关重要的。

并且，其中许多系统都是由 Linux 提供支持，它为技术提供商提供了对这些问题的更多控制。然而，如果每个提供商都在构建自己的解决方案，这可能会导致分散和重复工作。因此，<ruby>[民用基础设施平台][1]<rt>Civil Infrastructure Platform</rt></ruby>（CIP）最首要的目标是创造一个开源基础层，提供给工业设施，例如嵌入式控制器或是网关设备。

担任 CIP 的技术指导委员会主席的 Yoshitake Kobayashi 说过，“我们在这个领域有一种非常保守的文化，因为一旦我们建立了一个系统，它必须得到长达十多年的支持，在某些情况下超过 60 年。这就是为什么这个项目被创建的原因，因为这个行业的每个使用者都面临同样的问题，即能够长时间地使用 Linux。” 

CIP 的架构是创建一个非常基础的系统，以在控制器上使用开源软件。其中，该基础层包括 Linux 内核和一系列常见的开源软件如 libc、busybox 等。由于软件的使用寿命是一个最主要的问题，CIP 选择使用 Linux 4.4 版本的内核，这是一个由 Greg Kroah-Hartman 维护的长期支持版本。

### 合作

由于 CIP 有上游优先政策，因此他们在项目中需要的代码必须位于上游内核中。为了与内核社区建立积极的反馈循环，CIP 聘请 Ben Hutchings 作为 CIP 的官方维护者。Hutchings 以他在 Debian LTS 版本上所做的工作而闻名，这也促成了 CIP 与 Debian 项目之间的官方合作。

在新的合作下，CIP 将使用 Debian LTS 版本作为构建平台。 CIP 还将支持 Debian 长期支持版本（LTS），延长所有 Debian 稳定版的生命周期。CIP 还将与 Freexian 进行密切合作，后者是一家围绕 Debian LTS 版本提供商业服务的公司。这两个组织将专注于嵌入式系统的开源软件的互操作性、安全性和维护。CIP 还会为一些 Debian LTS 版本提供资金支持。

Debian 项目负责人 Chris Lamb 表示，“我们对此次合作以及 CIP 对 Debian LTS 项目的支持感到非常兴奋，这样将使支持周期延长至五年以上。我们将一起致力于为用户提供长期支持，并为未来的城市奠定基础。”

### 安全性

Kobayashi 说过，其中最需要担心的是安全性。虽然出于明显的安全原因，大部分民用基础设施没有接入互联网（你肯定不想让一座核电站连接到互联网），但也存在其他风险。

仅仅是系统本身没有连接到互联网，这并不意味着能避开所有危险。其他系统，比如个人移动电脑也能够通过接入互联网而间接入侵到本地系统中。如若有人收到一封带有恶意文件作为电子邮件的附件，这将会“污染”系统内部的基础设备。

因此，至关重要的是保持运行在这些控制器上的所有软件是最新的并且完全修补的。为了确保安全性，CIP 还向后移植了<ruby>内核自我保护<rt>Kernel Self Protection</rt></ruby>（KSP）项目的许多组件。CIP 还遵循最严格的网络安全标准之一 —— IEC 62443，该标准定义了软件的流程和相应的测试，以确保系统更安全。

### 展望未来

随着 CIP 日趋成熟，官方正在加大与各个 Linux 提供商的合作力度。除了与 Debian 和 freexian 的合作外，CIP 最近还邀请了企业 Linux 操作系统供应商 Cybertrust Japan Co., Ltd. 作为新的银牌成员。

Cybertrust 与其他行业领军者合作，如西门子、东芝、Codethink、日立、Moxa、Plat'Home 和瑞萨，致力于为未来数十年打造一个可靠、安全的基于 Linux 的嵌入式软件平台。

这些公司在 CIP 的保护下所进行的工作，将确保管理我们现代社会中的民用基础设施的完整性。

想要了解更多信息，请访问 [民用基础设施官网][1]。

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/2018/6/cip-keeping-lights-linux

作者：[Swapnil Bhartiya][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[wyxplus](https://github.com/wyxplus)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/arnieswap
[1]:https://www.cip-project.org/
