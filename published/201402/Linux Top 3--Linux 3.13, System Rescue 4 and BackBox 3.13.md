Linux 安全新闻: Linux 3.13、SystemRescueCD 4和BackBox 3.13
================================================================================
### 1) Linux 3.13 ###

Linus Torvalds 前一段时间释出了 Linux Kernel 3.13 作为2014年的开门红。按照惯例，此版本更新了大量驱动。

并且，Linux Kernel 3.13 包含了 nftable，这个软件是大名鼎鼎的 iptables 的继任者。从提交的代码来看，nftables 继续使用现存的网络过滤钩子(netfilter hooks)、连接追踪系统、NAT 子系统、透明代理引擎、日志基础架构和用户空间包排列设施。

> “简而言之，nftables 提供4个128位的普通寄存器和1个特殊寄存器用于保存结论”，代码提交的注释上说道，“并且 nftables 继承了 iptables 的“table/chain/rule 对象”这些概念，但提供了更灵活的配置方式，它也包含原先映射支持的未知数据类型架构。”
> 
> 值得注意的是这次还支持 NFC（近场通信）支付协议。
> 
> “使用 NFC_CMD_SE_IO 命令发送 ISO07816 应用协议数据单元到 NFC 嵌入式安全设备，”Intel 开发人员 Samuel Ortiz 在他的提交[信息][1]中写道：“反馈信息也是通过 NFC_CMD_SE_IO 返回到用户空间的。”

### 2) System Rescue CD 4.0.0 ###

大多数人都会使用 Linux 作为服务器或桌面系统，其实我们还可以把一个 Linux 系统拿来救援一个非 *nix 系统。

用于恢复系统和数据的 Linux 发行版中，比较流行的一个是“SystemRescueCd”，它在上周更新到了4.0.0版。

以下是它的[更新记录][2]：

- 标准内核：长期支持（LTS）版 linux-3.10.25（内核镜像包含32位的 rescue32 和 64位的 rescue64）
- 备用内核：最新稳定版 linux-3.12.7（内核镜像包含32位的 altker32 和 64位的 altker64）
- XOrg 图形环境和驱动更新到 xorg-server-1.14.3
- GParted 更新到 0.17.0（添加在线重新分区的功能）
- btrfs 工具集更新到 sys-fs/btrfs-progs-3.12

### 3) BackBox 3.13 ###

Linux 也是那些安全专家们手中的强大武器，而 BackBox 就是一个专注于安全的 Linux 发行版（BackBox 主要面对安全评估和渗透测试 —— 译者注）。最新版的 BackBox 更新了大量组件，有一点很奇怪，它没有使用最新的 Linux 3.13 内核，而用了 Linux 3.11 内核。

现在的 BackBox 发行版可以在匿名模式下更新安全工具。

--------------------------------------------------------------------------------

via: http://www.linuxplanet.com/news/linux-top-3-linux-3.13-system-rescue-4-and-backbox-3.13.html

译者：[bazz2](https://github.com/bazz2) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=5ce3f32b5264b337bfd13a780452a17705307725
[2]:http://www.sysresccd.org/Changes-x86
