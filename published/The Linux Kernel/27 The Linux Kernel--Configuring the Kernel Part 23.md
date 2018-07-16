戴文的Linux内核专题：27 配置内核 (23)
================================================================================
![](http://www.linux.org/attachments/slide-jpg.735/.jpg)

欢迎来到内核配置的下一章！本篇中我们会配置密码API，虚拟化和运行库。密码学指的是在需要的计算机之间加密和安全通信的科学。用户可能加密数据以保证是收件人而不是黑客收到数据。

Linux内核需要在内核中启用"Cryptographic algorithm manager"(密码算法管理器)。这个特性提供了操作内核的加密特性所需的软件。

当启用这个它，用户空间提供了配置加密特性(Userspace cryptographic algorithm configuration)。注意:这个配置指的是内核运行时的加密设置，不是编译内核的工具。

为了加强性能，启用这个会在加密算法中停止自我检测的特性 (Disable run-time self tests)。

"GF(2^128) multiplication functions"是一种被一些密码使用特殊算法。GF代表的是" Galois field"(伽罗瓦域)，是一种有限数的集合。这写集合称之为域并且有不同的大小。

"Null algorithms"是用于IPSec的算法。NULL加密意味这没有加密，因此这个驱动允许IPSec不使用加密。

任意算法可以转换成并行算法(Parallel crypto engine)。这个特性提供了转换器。

任意算法同样可以转换成异步算法(Software async crypto daemon)。

IPsec需要"Authenc support"。"Authenc support"代表"Authenticated Encryption and offers multiple encryptions to IPsec"(认证加密并对IPSec提供多重加密)。

CCM代表的是"Counter with CBC MAC"(CBC MAC计数器)，IPSec需要它(CCM support)。

这个驱动提供了"GCM/GMAC support"。GCM意思是"Galois/Counter Mode"(伽罗瓦/计数器 模式)，GMAC是"Galois Message Authentication Code"(伽罗瓦消息验证码)。

注意：我不会明确地解释一些特性的使用和细节。密码学是计算机中的特定领域，解释加密学超出了这篇文章的范围。

"Sequence Number IV Generator"是一个被某些加密软件使用的特殊的号码生成器。

Linux内核提供了不同的密码算法(CBC support)、 (CTR support)、 (CTS support)、 (ECB support)、 (LRW support)、 (PCBC support)、 (XTS support)、 (HMAC support)、 (XCBC support) 和 (VMAC support)。

"CRC32c CRC algorithm" 明确被SPARC64处理器使用。

"CRC32c INTEL hardware acceleration"是另外一个特定处理器的算法。它工作于带SSE4.2的Intel处理器。

内核提供了很多摘要、密码和其他加密软件。通常上，默认允许它们除非你有特殊的理由来启用或禁用这些特性。

注意：摘要(像MD5)会基于一个文件生成一个哈希值(字符序列)。哈希值接着被用于检查文件。比如，如果你从Canonical网站上下载了Ubuntu ISO安装盘，你可能想要知道你硬盘上的文件就是服务器上的文件的复制品。用户这么做的原因是ISO可能在长时间下载中被损坏。哈希值被用来证明文件没有被改变。

注意：密码是一种加密/解密算法。加密是使文件对除了接受者/拥有者之外的人都不可读。解密是浏览加密文件的过程。

Linux内核同样支持用户被强烈建议启用的不同的压缩算法(Deflate compression algorithm)、 (Zlib compression algorithm)  和 (LZO compression algorithm)。

内核可以生成用于加密软件的随机数(Pseudo Random Number Generation for Cryptographic modules)、(User-space interface for hash algorithms) 和 (User-space interface for symmetric key cipher algorithms)。

"Hardware crypto devices"是一个子菜单，包含了基于硬件加密工具的驱动。这个硬件在固件中含有算法。

"Asymmetric (public-key cryptographic) key type" 菜单中存在着不同的非对称公开密钥。

下面，我们可以进入配置工具主菜单(基于菜单接口)的下一个入口。虚拟化是寄放一个操作系统的
能力。这意味这Linux(和其他的系统)可以运行其他的操作系统，仿佛客户机是一个应用一样。

"Kernel-based Virtual Machine (KVM) support"运行内核本身管理客户机。带Intel处理器的计算机需呀这个驱动(KVM for Intel processors support)，AMD的则需要(KVM for AMD processors support)。

用于内核虚拟机(KVM)的内存管理单元(MMU)可以有一个审计系统。

启用这个特性使客户机的网络变得更快(Host kernel accelerator for virtio net)。

在配置哇内核虚拟机特性后，配置工具主菜单下的最后菜单是内核配置的最后一部分。这个菜单用于"Library Routines"(库运行时)，同样也成为库函数。一部分内核可以被作为可以链接的库。比如，XZ过滤(压缩算法)可以被外部程序访问。下面列出了不同的库。

注意：CRC函数大多数都相同但有不同的特性和性能，通常来讲，最好启用这些特性。

CRC-CCITT functions - 循环冗余校验测试(Cyclic Redundancy Check)用于测试原始数据中的改变。

CRC16 functions - 循环冗余校验测试(Cyclic Redundancy Check)用于测试原始数据中的改变。

CRC calculation for the T10 Data Integrity Field - 循环冗余校验测试(Cyclic Redundancy Check)用于测试原始数据中的改变。

CRC ITU-T V.41 functions - 循环冗余校验测试(Cyclic Redundancy Check)用于测试原始数据中的改变。

CRC32/CRC32c functions - 循环冗余校验测试(Cyclic Redundancy Check)用于测试原始数据中的改变。

CRC32 perform self test on init - 循环冗余校验测试(Cyclic Redundancy Check)用于测试原始数据中的改变。

CRC32 implementation (Slice by 8 bytes) - 循环冗余校验测试(Cyclic Redundancy Check)用于测试原始数据中的改变。

CRC7 functions - 循环冗余校验测试(Cyclic Redundancy Check)用于测试原始数据中的改变。

CRC32c (Castagnoli, et al) Cyclic Redundancy-Check - 循环冗余校验测试(Cyclic Redundancy Check)用于测试原始数据中的改变。

CRC8 function - 循环冗余校验测试(Cyclic Redundancy Check)用于测试原始数据中的改变。

\* BCJ filter decoder - 为特定处理器设计的XZ解码器，这里的"*"是处理器。内核列出了一些不同的架构。

XZ decompressor tester - 用于测试XZ解码器的调试函数。

Averaging functions - "uptime"在"uptime"中看到的平均负载。

CORDIC algorithm - 双曲线和三角函数。


JEDEC DDR data - JEDEC双倍数据速率SD-RAM规范


你猜怎么了？我们已经完成配置内核。在23篇之后，我敢肯定这是你的感觉 -

视频链接:[http://www.youtube.com/embed/barWV7RWkq0?wmode=opaque][1]

下面，我们可以编译并安装了

在遥远的地方，我仍然在听 - 

视频链接:[http://www.youtube.com/embed/ELoUppY1esw?wmode=opaque][2]

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/the-linux-kernel-configuring-the-kernel-part-23.5112/

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.youtube.com/embed/barWV7RWkq0?wmode=opaque
[2]:http://www.youtube.com/embed/ELoUppY1esw?wmode=opaque