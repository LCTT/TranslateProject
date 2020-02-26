[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11583-1.html)
[#]: subject: (Red Hat Responds to Zombieload v2)
[#]: via: (https://www.networkworld.com/article/3453596/red-hat-responds-to-zombieload-v2.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

红帽对 Zombieload v2 缺陷的应对
======
![](https://images.techhive.com/images/article/2015/10/20151027-red-hat-logo-100625237-large.jpg)

> 红帽呼吁更新 Linux 软件，以解决可能导致数据盗用的英特尔处理器缺陷。

前两天公开的三个“常见漏洞和披露”（CVE）跟踪的是某些英特尔处理器中的三个漏洞，如果利用这些漏洞，可能会使敏感数据面临风险。

在报告的缺陷中，新发现的英特尔处理器缺陷是今年早些时候发现的 Zombieload 攻击的变种，并且仅会影响英特尔的 Cascade Lake 芯片。

红帽强烈建议，所有的红帽系统即使不认为其配置构成直接威胁，也要对其进行更新，并且红帽正在向其客户和企业 IT 社区提供资源。

这三个 CVE 是：

* CVE-2018-12207：页面大小更改时的机器检查错误
* CVE-2019-11135：TSX异步中止
* CVE-2019-0155 和 CVE-2019-0154：i915 图形驱动程序

### CVE-2018-12207

红帽将该漏洞评为重要。此漏洞可能使本地和非特权的攻击者绕过安全控制并导致系统范围的拒绝服务。

硬件缺陷是在英特尔微处理器中发现的，并且与指令翻译后备缓冲区（ITLB）有关。它缓存从虚拟地址到物理地址的转换，旨在提高性能。但是，在缓存页面更改后，使缓存的条目无效的延迟可能导致处理器使用无效的地址转换，从而导致机器检查错误异常并使系统进入挂起状态。

攻击者可以制作这种情况来关闭系统。

### CVE-2019-11135

红帽将此漏洞评为中级。这个事务同步扩展（TSX）异步中止是一个微体系结构数据采样（MDS）缺陷。使用定制代码的本地攻击者可以利用此漏洞从处理器以及支持同时多线程（SMT）和 TSX 的处理器上的缓存内容中收集信息。

### CVE-2019-0155，CVE-2019-0154

红帽将 CVE-2019-0155 漏洞评为重要，将 CVE-2019-0154 漏洞评为中级。这两个缺陷都与 i915 图形驱动程序有关。

CVE-2019-0155 允许攻击者绕过常规的内存安全限制，从而允许对应该受到限制的特权内存进行写访问。

当图形处理单元（GPU）处于低功耗模式时，CVE-2019-0154 可能允许本地攻击者创建无效的系统状态，从而导致系统无法访问。

唯一受 CVE-2019-0154 影响的的显卡在 i915 内核模块上受到影响。`lsmod` 命令可用于指示该漏洞。 如下所示的任何输出（即以 i915 开头）都表明该系统易受攻击：

```
$ lsmod | grep ^i915
i915          2248704 10
```

### 更多资源

红帽在以下链接中向其客户和其他人提供了详细信息和进一步的说明：

- <https://access.redhat.com/security/vulnerabilities/ifu-page-mce>
- <https://access.redhat.com/solutions/tsx-asynchronousabort>
- <https://access.redhat.com/solutions/i915-graphics>


--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3453596/red-hat-responds-to-zombieload-v2.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/newsletters/signup.html
[2]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE20773&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[3]: https://access.redhat.com/solutions/tsx-asynchronousabort%20
[4]: https://access.redhat.com/solutions/i915-graphics
[5]: https://www.facebook.com/NetworkWorld/
[6]: https://www.linkedin.com/company/network-world
