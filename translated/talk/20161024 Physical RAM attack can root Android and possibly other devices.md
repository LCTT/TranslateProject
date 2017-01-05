针对物理 RAM 的攻击可以取得 Android 设备的根权限，其它设备也存在这样的可能
===

>攻击者确实可以在物理存储单元中实现位翻转来达到侵入（这里把 compromise 翻译成了侵入，感觉还是有点词不达意）移动设备与计算机的目的

![](http://images.techhive.com/images/idgnsImport/2015/08/id-2969037-security1-100606370-large.jpg)


研究者们发现了一种新的在不利用任何软件漏洞情况下，利用 RAM 芯片物理设计上的弱点来侵入 Android 设备的方式。这种攻击技术同样可以影响到其它如 ARM 和 X86 架构的设备与计算机。

攻击起源于过去十多年中将更多的 DRAM（动态随机存取存储器）容量封装进越来越小的芯片中，这将导致存储单元在特定情况下电子在相邻的两行中从一边泄漏到另一边。（这里翻译的有点不太通顺，特别是这 row 的概念，只是查看了维基百科有了大致了解，结合起来看可能会更有助理解 https://en.wikipedia.org/wiki/Row_hammer） 

例如，反复且快速的访问相同的物理储存位置 -- 一种被称为 “hammering” （这里 hammering 实在不知道该如何处理，用英文原文似乎也挺好的，在读英文内容的时候也会带来一定的便利）的行为 -- 可以导致相邻位置的位值从 0 反转成 1，或者相反。

虽然这样的电子干扰已经被生产商知晓并且从可靠性角度研究了一段时间了 -- 因为内存错误能够导致系统崩溃 -- 研究者展示了在可控方式的触发下它所存在的严重安全隐患。

在 2015 年 4 月，来自谷歌 Project Zero 项目的研究者公布了两份基于内存 “row hammer” 对于 x86-64 CPU 架构的 [提权利用][7]。其中一份利用可以使代码从谷歌的 Chrome 浏览器沙盒里逃逸并且直接在系统上执行，另一份可以在 Linux 机器上获取高级权限。（这里的 kernel-level 不太确定该如何处理，这个可以参看 https://en.wikipedia.org/wiki/Privilege_level）

此后，其他的研究者进行了更深入的调查并且展示了[通过网站中 JaveScript 脚本进行利用的方式][6]甚至能够影响运行在云环境下的[虚拟服务器][5]。然而，对于这项技术是否可以应用在智能手机和移动设备大量使用的 ARM 架构中还是有疑问的。

现在，一队成员来自荷兰阿姆斯特丹自由大学，奥地利格拉茨技术大学和加州大学圣塔芭芭拉分校的 VUSec 小组，已经证明了 Rowhammer 不仅仅可以应用在 ARM 架构上并且甚至比在 x86 架构上更容易。

研究者们将他们的新攻击命名为 Drammer，代表了 Rowhammer 确实存在，并且计划于周三在维也纳举办的第 23 届 ACM 计算机与通信安全大会上展示。这种攻击建立在之前就被发现与实现的 Rowhammer 技术之上。

VUSec 小组的研究者已经制造了一个适用于 Android 设备的恶意应用，当它被执行的时候利用不易察觉的内存位反转在不需要任何权限的情况下就可以获取设备根权限。

研究者们测试了来自不同制造商的 27 款 Android 设备，21 款使用 ARMv7（32-bit）指令集架构，其它 6 款使用 ARMv8（64-bit）指令集架构。他们成功的在 17 款 ARMv7 设备和 1 款 ARMv8 设备上实现了为反转，表明了这些设备是易受攻击的。

此外，Drammer 能够与其它的 Android 漏洞组合使用，例如 [Stagefright][4] 或者 [BAndroid][3] 来实现无需用户手动下载恶意应用的远程攻击。

谷歌已经注意到了这一类型的攻击。“在研究者向漏洞奖励计划（这里应该是特指谷歌的那个吧，不知道把它翻译成中文是否合适）报告了这个问题之后，我们与他们进行了密切的沟通来深入理解这个问题以便我们更好的保护用户，”一位谷歌的代表在一份邮件申明中这样说到。“我们已经开发了一个缓解方案（这里将 mitigation 翻成了缓解方案不知是否妥当，这又是一个有丰富含义的概念 https://en.wikipedia.org/wiki/Vulnerability_management）将会包含在十一月的安全更新中。”

VUSec 的研究者认为，谷歌的缓解方案将会使得攻击过程更为复杂，但是它不能修复潜在的问题。

事实上，从软件上去修复一个由硬件导致的问题是不现实的。硬件供应商正在研究相关问题并且有可能在将来的内存芯片中被修复，但是在现有设备的芯片中风险依然存在。

更糟的是，研究者们说，由于有许多因素会影响到攻击的成功与否并且这些因素尚未被研究透彻，因此很难去说有哪些设备会被影响到。例如，内存控制器可能会在不同的电量的情况下展现不同的行为，因此一个设备可能在满电的情况下没有风险，当它处于低电量的情况下就是有风险的。

同样的，在网络安全中有这样一句俗语：Attacks always get getter, they never get worse.（这里借用“道高一尺，魔高一仗。”不知是否合适）Rowhammer 攻击已经从理论变成了变成了现实，同样的他可能也会从现在的简单实现变成确确实实的存在。（这一句凭自己的理解翻的）这意味着今天某个设备是不被影响的，在明天就有可能被改进后的 Rowhammer 技术证明它是存在风险的。

Drammer 在 Android 上实现是因为研究者期望研究基于 ARM 设备的影响，但是潜在的技术可以被使用在所有的架构与操作系统上。新的攻击相较于之前建立在运气与特殊特性与特定平台之上并且十分容易失效的技术已经是一个巨大的进步了。

Drammer 依靠被大量硬件子系统所使用的 DMA（直接存储访问）缓存，其中包括了图形，网络，声音。Drammer 的实现采用了所有操作系统上都有的 Android 的 ION内存分配器，接口，与方法，这个特征（这里将 warning 翻译成了特征，纯粹是自己的理解，不知是否妥当）是文章中主要的贡献之一。

"破天荒的，我们成功的展示了我们可以做到，在不依赖任何特定的特性情况下完全可靠的证明了 Rowhammer，“ VUSec 小组中的其中一位研究者， Cristiano Giuffrida 这样说道。”攻击所利用的内存位置并非是 Android 独有的。攻击在任何的 Linux 平台上都能工作 -- 我们甚至怀疑其它操作系统也可以 -- 因为它利用的是操作系统内核内存管理中固有的特性。“

”我期待我们可以看到更多针对其它平台的攻击的变种，“阿姆斯特丹自由大学的教授兼 VUSec 系统安全研究小组的领导者，Herbert Bos 补充道。

在他们的[文章][2]之外，研究者们也释出了一个 Android 应用来测试 Android 设备在受到 Rowhammer 攻击时是否会有风险 -- 在当前所知的技术条件下。应用还没有传上[谷歌应用商店][Google Play]，可以从 [VUSec Drammer 网站][1] 下载来手动安装。一个开源的 Rowhammer 模拟器同样能够帮助其他的研究者来更深入的研究这个问题。

--------------------------------------------------------------------------------

via:http://www.csoonline.com/article/3134726/security/physical-ram-attack-can-root-android-and-possibly-other-devices.html

作者：[Lucian Constantin][a]

译者：[wcnnbdk1](https://github.com/wcnnbdk1)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.csoonline.com/author/Lucian-Constantin/
[1]:https://www.vusec.net/projects/drammer/
[2]:https://vvdveen.com/publications/drammer.pdf
[3]:https://www.vusec.net/projects/bandroid/
[4]:http://www.csoonline.com/article/3045836/security/new-stagefright-exploit-puts-millions-of-android-devices-at-risk.html
[5]:http://www.infoworld.com/article/3105889/security/flip-feng-shui-attack-on-cloud-vms-exploits-hardware-weaknesses.html
[6]:http://www.computerworld.com/article/2954582/security/researchers-develop-astonishing-webbased-attack-on-a-computers-dram.html
[7]:http://www.computerworld.com/article/2895898/google-researchers-hack-computers-using-dram-electrical-leaks.html
[8]:http://csoonline.com/newsletters/signup.html
