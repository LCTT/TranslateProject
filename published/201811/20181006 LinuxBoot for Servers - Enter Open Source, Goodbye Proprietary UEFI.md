服务器的 LinuxBoot：告别 UEFI、拥抱开源
============

[LinuxBoot][13] 是私有的 [UEFI][15] 固件的开源 [替代品][14]。它发布于去年，并且现在已经得到主流的硬件生产商的认可成为他们产品的默认固件。去年，LinuxBoot 已经被 Linux 基金会接受并[纳入][16]开源家族。

这个项目最初是由 Ron Minnich 在 2017 年 1 月提出，它是 LinuxBIOS 的创造人，并且在 Google 领导 [coreboot][17] 的工作。

Google、Facebook、[Horizon Computing Solutions][18]、和 [Two Sigma][19] 共同合作，在运行 Linux 的服务器上开发 [LinuxBoot 项目][20]（以前叫 [NERF][21]）。

它的开放性允许服务器用户去很容易地定制他们自己的引导脚本、修复问题、构建他们自己的 [运行时环境][22] 和用他们自己的密钥去 [刷入固件][23]，而不需要等待供应商的更新。

下面是第一次使用 NERF BIOS 去引导 [Ubuntu Xenial][24] 的视频：

[点击看视频](https://youtu.be/HBkZAN3xkJg)

我们来讨论一下它与 UEFI 相比在服务器硬件方面的其它优势。

### LinuxBoot 超越 UEFI 的优势

![LinuxBoot vs UEFI](https://i1.wp.com/itsfoss.com/wp-content/uploads/2018/10/linuxboot-uefi.png?w=800&ssl=1)

下面是一些 LinuxBoot 超越 UEFI 的主要优势：

#### 启动速度显著加快

它能在 20 秒钟以内完成服务器启动，而 UEFI 需要几分钟的时间。

#### 显著的灵活性

LinuxBoot 可以用在 Linux 支持的各种设备、文件系统和协议上。

#### 更加安全

相比 UEFI 而言，LinuxBoot 在设备驱动程序和文件系统方面进行更加严格的检查。

我们可能争辩说 UEFI 是使用 [EDK II][25] 而部分开源的，而 LinuxBoot 是部分闭源的。但有人[提出][26]，即便有像 EDK II 这样的代码，但也没有做适当的审查级别和像 [Linux 内核][27] 那样的正确性检查，并且在 UEFI 的开发中还大量使用闭源组件。

另一方面，LinuxBoot 有非常小的二进制文件，它仅用了大约几百 KB，相比而言，而 UEFI 的二进制文件有 32 MB。

严格来说，LinuxBoot 与 UEFI 不一样，更适合于[可信计算基础][28]。

LinuxBoot 有一个基于 [kexec][30] 的引导加载器，它不支持启动 Windows/非 Linux 内核，但这影响并不大，因为主流的云都是基于 Linux 的服务器。

### LinuxBoot 的采用者

自 2011 年， [Facebook][32] 发起了[开源计算项目（OCP）][31]，它的一些服务器是基于[开源][33]设计的，目的是构建的数据中心更加高效。LinuxBoot 已经在下面列出的几个开源计算硬件上做了测试：

*   Winterfell
*   Leopard
*   Tioga Pass

更多 [OCP][34] 硬件在[这里][35]有一个简短的描述。OCP 基金会通过[开源系统固件][36]运行一个专门的固件项目。

支持 LinuxBoot 的其它一些设备有：

*   [QEMU][9] 仿真的 [Q35][10] 系统
*   [Intel S2600wf][11]
*   [Dell R630][12]

上个月底（2018 年 9 月 24 日），[Equus 计算解决方案][37] [宣布][38] 发行它的 [白盒开放式™][39] M2660 和 M2760 服务器，作为它们的定制的、成本优化的、开放硬件服务器和存储平台的一部分。它们都支持 LinuxBoot 灵活定制服务器的 BIOS，以提升安全性和设计一个非常快的纯净的引导体验。

### 你认为 LinuxBoot 怎么样？

LinuxBoot 在 [GitHub][40] 上有很丰富的文档。你喜欢它与 UEFI 不同的特性吗？由于 LinuxBoot 的开放式开发和未来，你愿意使用 LinuxBoot 而不是 UEFI 去启动你的服务器吗？请在下面的评论区告诉我们吧。

--------------------------------------------------------------------------------

via: https://itsfoss.com/linuxboot-uefi/

作者：[Avimanyu Bandyopadhyay][a]
选题：[oska874][b]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://itsfoss.com/author/avimanyu/
[b]:https://github.com/oska874
[1]:https://itsfoss.com/linuxboot-uefi/#
[2]:https://itsfoss.com/linuxboot-uefi/#
[3]:https://itsfoss.com/linuxboot-uefi/#
[4]:https://itsfoss.com/linuxboot-uefi/#
[5]:https://itsfoss.com/linuxboot-uefi/#
[6]:https://itsfoss.com/linuxboot-uefi/#
[7]:https://itsfoss.com/author/avimanyu/
[8]:https://itsfoss.com/linuxboot-uefi/#comments
[9]:https://en.wikipedia.org/wiki/QEMU
[10]:https://wiki.qemu.org/Features/Q35
[11]:https://trmm.net/S2600
[12]:https://trmm.net/NERF#Installing_on_a_Dell_R630
[13]:https://www.linuxboot.org/
[14]:https://www.phoronix.com/scan.php?page=news_item&px=LinuxBoot-OSFC-2018-State
[15]:https://itsfoss.com/check-uefi-or-bios/
[16]:https://www.linuxfoundation.org/blog/2018/01/system-startup-gets-a-boost-with-new-linuxboot-project/
[17]:https://en.wikipedia.org/wiki/Coreboot
[18]:http://www.horizon-computing.com/
[19]:https://www.twosigma.com/
[20]:https://trmm.net/LinuxBoot_34c3
[21]:https://trmm.net/NERF
[22]:https://trmm.net/LinuxBoot_34c3#Runtimes
[23]:http://www.tech-faq.com/flashing-firmware.html
[24]:https://itsfoss.com/features-ubuntu-1604/
[25]:https://www.tianocore.org/
[26]:https://media.ccc.de/v/34c3-9056-bringing_linux_back_to_server_boot_roms_with_nerf_and_heads
[27]:https://medium.com/@bhumikagoyal/linux-kernel-development-cycle-52b4c55be06e
[28]:https://en.wikipedia.org/wiki/Trusted_computing_base
[29]:https://itsfoss.com/adobe-alternatives-linux/
[30]:https://en.wikipedia.org/wiki/Kexec
[31]:https://en.wikipedia.org/wiki/Open_Compute_Project
[32]:https://github.com/facebook
[33]:https://github.com/opencomputeproject
[34]:https://www.networkworld.com/article/3266293/lan-wan/what-is-the-open-compute-project.html
[35]:http://hyperscaleit.com/ocp-server-hardware/
[36]:https://www.opencompute.org/projects/open-system-firmware
[37]:https://www.equuscs.com/
[38]:http://www.dcvelocity.com/products/Software_-_Systems/20180924-equus-compute-solutions-introduces-whitebox-open-m2660-and-m2760-servers/
[39]:https://www.equuscs.com/servers/whitebox-open/
[40]:https://github.com/linuxboot/linuxboot
