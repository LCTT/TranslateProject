LKRG：Linux 的适用于运行时完整性检查的可加载内核模块
======
![LKRG logo][1]

开源社区的成员正在致力于一个 Linux 内核的新项目，它可以让内核更安全。命名为 Linux 内核运行时防护（Linux Kernel Runtime Guard，简称：LKRG），它是一个在 Linux 内核执行运行时完整性检查时的可加载内核模块。

它的用途是检测对 Linux 内核的已知的或未知的安全漏洞利用企图，以及去阻止这种攻击企图。

LKRG 也可以检测正在运行的进程的提权行为，在漏洞利用代码运行之前杀掉这个运行进程。

### 这个项目从 2011 年开始开发以来，首个版本已经发布。

因为这个项目开发的较早，LKRG 的当前版本仅仅是通过内核消息去报告违反内核完整性的行为，但是随着这个项目的成熟，一个完整的漏洞利用缓减系统将会部署。

LKRG 的成员 Alexander Peslyak 解释说，这个项目从 2011 年启动，并且 LKRG 已经经历了“预开发"阶段。

LKRG 的首个公开版本是 — LKRG v0.0 — 它现在可以从 [这个页面][2] 下载使用。[这里][3] 是这个项目的维基，为支持这个项目，它也有一个 [Patreon 页面][4]。

虽然 LKRG 还是一个开源项目，LKRG 的维护者也计划做一个 LKRG Pro 版本，这个版本将包含一个专用的 LKRG 发行版，它将支持对特定漏洞利用的检测，比如，容器泄漏。开发团队计划从 LKRG Pro 基金中提取部分资金用于保证项目的剩余工作。

### LKRG 是一个内核模块而不是一个补丁。

一个类似的项目是去增加一个内核监视功能（AKO），但是 LKRG 与 AKO 是不一样的，因为 LKRG 是一个内核加载模式而不是一个补丁。LKRG 开发团队决定将它设计为一个内核模块是因为，在内核上打补丁对安全性、系统稳定性以及性能都有很直接的影响。

而作为内核模块的方式，可以在每个系统上更容易部署去 LKRG，而不必去修改核心的内核代码，修改核心的内核代码非常复杂并且很容易出错。

LKRG 内核模块在目前主流的 Linux 发行版上都可以使用，比如，RHEL7、OpenVZ 7、Virtuozzo 7、以及 Ubuntu 16.04 到最新的主线版本。

### 它并非是一个完美的解决方案

LKRG 的创建者警告用户，他们并不认为 LKRG 是一个完美的解决方案，它**提供不了**坚不可摧和 100% 的安全。他们说，LKRG 是 "设计为**可旁通**的"，并且仅仅提供了"多元化安全" 的**一个**方面。

```
虽然 LKRG 可以防御许多对 Linux 内核的已存在的漏洞利用，而且也有可能会防御将来许多的（包括未知的）未特意设计去绕过 LKRG 的安全漏洞利用。它是设计为可旁通的（尽管有时候是以更复杂和/或低可利用为代价的）。因此，他们说 LKRG 通过多元化提供安全，就像运行一个不常见的操作系统内核一样，也就不会有真实运行一个不常见的操作系统的可用性弊端。
```

LKRG 有点像基于 Windows 的防病毒软件，它也是工作于内核级别去检测漏洞利用和恶意软件。但是，LKRG  团队说，他们的产品比防病毒软件以及其它终端安全软件更加安全，因为它的基础代码量比较小，所以在内核级别引入新 bug 和漏洞的可能性就更小。

### 运行当前版本的 LKRG 大约会带来 6.5% 的性能损失

Peslyak 说 LKRG 是非常适用于 Linux 机器的，它在修补内核的安全漏洞后不需要重启动机器。LKRG 允许用户去持续运行带有安全措施的机器，直到在一个计划的维护窗口中测试和部署关键的安全补丁为止。

经测试显示，安装 LKRG v0.0 后大约会产生 6.5% 性能影响，但是，Peslyak 说将在后续的开发中持续降低这种影响。

测试也显示，LKRG 检测到了 CVE-2014-9322 (BadIRET)、CVE-2017-5123 (waitid(2) missing access_ok)、以及 CVE-2017-6074 (use-after-free in DCCP protocol) 的漏洞利用企图，但是没有检测到 CVE-2016-5195 (Dirty COW) 的漏洞利用企图。开发团队说，由于前面提到的”可旁通“的设计策略，LKRG 没有检测到 Dirty COW 提权攻击。

```
在 Dirty COW 的测试案例中，由于 bug 机制的原因，使得 LKRG 发生了 "旁通"，并且这也是一种利用方法，它也是将来类似的以用户空间为目标的绕过 LKRG 的一种方法。这样的漏洞利用是否会是普通情况（不太可能！除非 LKRG 或者类似机制的软件流行起来），以及对它的可用性的（负面的）影响是什么？（对于那些直接目标是用户空间的内核漏洞来说，这不太重要，也并不简单）。
```

--------------------------------------------------------------------------------

via: https://www.bleepingcomputer.com/news/linux/lkrg-linux-to-get-a-loadable-kernel-module-for-runtime-integrity-checking/

作者：[Catalin Cimpanu][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.bleepingcomputer.com/author/catalin-cimpanu/
[1]:https://www.bleepstatic.com/content/posts/2018/02/04/LKRG-logo.png
[2]:http://www.openwall.com/lkrg/
[3]:http://openwall.info/wiki/p_lkrg/Main
[4]:https://www.patreon.com/p_lkrg
