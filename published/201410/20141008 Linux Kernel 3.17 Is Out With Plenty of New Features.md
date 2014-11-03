Linux Kernel 3.17 带来了很多新特性
================================================================================
Linus Torvalds已经发布了最新的稳定版内核3.17。

![](http://www.omgubuntu.co.uk/wp-content/uploads/2011/07/Tux-psd3894.jpg)

Torvalds以他典型的[放任式][1]的口吻在Linux内核邮件列表中解释说：

> “过去的一周很平静，我对3.17的如期发布没有疑虑（相对于乐观的“我应该早一周发布么”的计划而言）。”

由于假期，Linux说他还没有开始合并3.18的改变：

>“我马上要去旅行了- 在我期盼早点发布的时候我希望避免一些事情。这意味着在3.17发布后，我不会在下周非常活跃地合并新的东西，并且下下周是LinuxCon EU”

### Linux 3.17有哪些新的? ###

最新版本的 Linux 3.17 加入了最新的改进，硬件支持，修复等等。范围从不明觉厉的 - 比如：[memfd 和 文件密封补丁][2] - 到大多数人感兴趣的，比如最新硬件的支持。

下面是这次发布的一些亮点的列表，但它们并不详尽：

- Microsoft Xbox One 控制器支持 (没有震动反馈)
- 额外的Sony SIXAXIS支持改进
- 东芝 “主动防护感应器” 支持 
- 新的包括Rockchip RK3288和AllWinner A23 SoC的ARM芯片支持
- 安全计算设备上的“跨线程过滤设置”
- 基于Broadcom BCM7XXX板卡的支持（用在不同的机顶盒上）
- 增强的AMD Radeon R9 290支持
- Nouveau 驱动改进，包括Kepler GPU修复
- 包含Intel Broadwell超级本上的Wildcatpoint Audio DSP音频支持

### 在Ubuntu上安装 Linux 3.17 ###

虽然被列为稳定版，但是目前对于大多数人而言只有很少的功能需要我们“现在去安装”。

但是如果你很耐心——**更重要的是**——有足够的技能去处理从中导致的问题，你可以通过在由Canonical维护的主线内核存档中找到一系列合适的包安装在你的Ubuntu 14.10中，升级到Linux 3.17。

**警告：除非你知道你正在做什么，不要尝试从下面的链接中安装任何东西。**

- [访问Ubuntu内核主线存档][3]

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2014/10/linux-kernel-3-17-whats-new-improved

作者：[Joey-Elijah Sneddon][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://plus.google.com/117485690627814051450/?rel=author
[1]:http://lkml.iu.edu/hypermail/linux/kernel/1410.0/02818.html
[2]:http://lwn.net/Articles/607627/
[3]:http://kernel.ubuntu.com/~kernel-ppa/mainline/?C=N;O=D