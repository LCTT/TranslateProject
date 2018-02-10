Linux 内核 4.15：“一个不同寻常的发布周期”
============================================================


![Linux](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/background-penguin.png?itok=g8NBQs24 "Linux")

> Linus Torvalds 在周日发布了 Linux 的 4.15 版内核，比原计划发布时间晚了一周。了解这次发行版的关键更新。

Linus Torvalds 在周日（1 月 28 日）[发布了 Linux 内核的 4.15 版][7]，再一次比原计划晚了一周。延迟发布的罪魁祸首是 “Meltdown” 和 “Spectre” bug，由于这两个漏洞，使开发者不得不在这最后的周期中提交重大补丁。Torvalds 不愿意“赶工”，因此，他又给了一周时间去制作这个发行版本。

不出意外的话，这第一批补丁将是去修补前面提及的 [Meltdown 和 Spectre][8] 漏洞。为防范 Meltdown —— 这个影响 Intel 芯片的问题，在 x86 架构上[开发者实现了页表隔离（PTI）][9]。不论什么理由你如果想去关闭它，你可以使用内核引导选项 `pti=off` 去关闭这个特性。

Spectre v2 漏洞对 Intel 和 AMD 芯片都有影响，为防范它，[内核现在带来了 retpoline 机制][10]。Retpoline 要求 GCC 的版本支持 `-mindirect-branch=thunk-extern` 功能。由于使用了 PTI，Spectre 抑制机制可以被关闭，如果需要去关闭它，在引导时使用 `spectre_v2=off` 选项。尽管开发者努力去解决 Spectre v1，但是，到目前为止还没有一个解决方案，因此，在 4.15 的内核版本中并没有这个 bug 的修补程序。

对于在 ARM 上的 Meltdown 解决方案也将在下一个开发周期中推送。但是，[对于 PowerPC 上的 bug，在这个发行版中包含了一个补救措施，那就是使用 L1-D 缓存的 RFI 冲刷特性][11]。

一个有趣的事情是，上面提及的所有受影响的新内核中，都带有一个 `/sys/devices/system/cpu/vulnerabilities/`  虚拟目录。这个目录显示了影响你的 CPU 的漏洞以及当前应用的补救措施。

芯片带 bug （以及保守秘密的制造商）的问题重新唤起了开发可行的开源替代品的呼声。这使得已经合并到主线版本的内核提供了对 [RISC-V][12] 芯片的部分支持。RISC-V 是一个开源的指令集架构，它允许制造商去设计他们自己的基于 RISC-V 芯片的实现。并且因此也有了几个开源的芯片。虽然 RISC-V 芯片目前主要用于嵌入式设备，它能够去做像智能硬盘或者像 Arduino 这样的开发板，RISC-V 的支持者认为这个架构也可以用于个人电脑甚至是多节点的超级计算机上。

正如在上面提到的，[对 RISC-V 的支持][13]，仍然没有全部完成，它虽然包含了架构代码，但是没有设备驱动。这意味着，虽然 Linux 内核可以在 RISC-V 芯片上运行，但是没有可行的方式与底层的硬件进行实质的交互。也就是说，RISC-V 不会受到其它闭源架构上的任何 bug 的影响，并且对它的支持的开发工作也在加速进行，因为，[RISC-V 基金会已经得到了一些行业巨头的支持][14]。

### 4.15 版新内核中的其它新特性

Torvalds 经常说他喜欢的事情是很无聊的。对他来说，幸运的是，除了 Spectre 和 Meltdown 引发的混乱之外，在 4.15 内核中的大部分其它东西都很普通，比如，对驱动的进一步改进、对新设备的支持等等。但是，还有几点需要重点指出，它们是：

*   [AMD 对虚拟化安全加密的支持][3]。它允许内核通过加密来实现对虚拟机内存的保护。加密的内存仅能够被使用它的虚拟机所解密。就算是 hypervisor 也不能看到它内部的数据。这意味着在云中虚拟机正在处理的数据，在虚拟机外的任何进程都看不到。
*   由于 [包含了_显示代码_][4]， AMD GPU 得到了极大的提升，这使得 Radeon RX Vega 和 Raven Ridge 显卡得到了内核主线版本的支持，并且也在 AMD 显卡中实现了 HDMI/DP 音频。
*   树莓派的爱好者应该很高兴，因为在新内核中， [7" 触摸屏现在已经得到原生支持][5]，这将产生成百上千的有趣的项目。

要发现更多的特性，你可以去查看在 [Kernel Newbies][15] 和 [Phoronix][16] 上的内容。

_想学习更多的 Linux 的知识，可以去学习来自 Linux 基金会和 edX 的免费课程 —— ["了解 Linux" ][6]。_

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/intro-to-linux/2018/1/linux-kernel-415-unusual-release-cycle

作者：[PAUL BROWN][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/bro66
[1]:https://www.linux.com/licenses/category/creative-commons-zero
[2]:https://www.linux.com/files/images/background-penguinpng
[3]:https://git.kernel.org/linus/33e63acc119d15c2fac3e3775f32d1ce7a01021b
[4]:https://git.kernel.org/torvalds/c/f6705bf959efac87bca76d40050d342f1d212587
[5]:https://git.kernel.org/linus/2f733d6194bd58b26b705698f96b0f0bd9225369
[6]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
[7]:https://lkml.org/lkml/2018/1/28/173
[8]:https://meltdownattack.com/
[9]:https://git.kernel.org/linus/5aa90a84589282b87666f92b6c3c917c8080a9bf
[10]:https://git.kernel.org/linus/76b043848fd22dbf7f8bf3a1452f8c70d557b860
[11]:https://git.kernel.org/linus/aa8a5e0062ac940f7659394f4817c948dc8c0667
[12]:https://riscv.org/
[13]:https://git.kernel.org/torvalds/c/b293fca43be544483b6488d33ad4b3ed55881064
[14]:https://riscv.org/membership/
[15]:https://kernelnewbies.org/Linux_4.15
[16]:https://www.phoronix.com/scan.php?page=search&amp;q=Linux+4.15
