[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12401-1.html)
[#]: subject: (Ex-Solus Dev is Now Creating a Truly Modern Linux Distribution Called Serpent Linux)
[#]: via: (https://itsfoss.com/serpent-os-announcement/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Solus Linux 创始人正在开发一个没有 GNU 的“真正现代”的 Linux 发行版
======

曾经创建独立 Linux 发行版 Solus 的开发人员 [Ikey Doherty][1] 宣布了他的新项目：Serpent OS。

[Serpent OS][2] 是一个**不想**被归类为“轻量级、用户友好、注重隐私的 Linux 桌面发行版”。

相反，Serpent OS 具有“与主流产品不同的目标”。具体怎么样？请继续阅读。

### Serpent OS：制作“真正现代”的 Linux 发行版

![][3]

Serpent 采用发行版优先，兼容靠后的方法。这使他们可以做出一些非常大胆的决定。

Ikey 表示，这个项目不会对阻碍 Linux 的负面角色容忍。例如，不会容忍 NVIDIA 在其 GPU 上缺乏对 Wayland 加速的支持，并将 NVIDIA 专有驱动加入发行版黑名单。

这是 Serpent Linux 项目的拟议计划（摘自[其网站][4]）：

  * 不再分割 usrbin
  * 100％ clang 构建（包括内核）
  * musl 作为 libc，依靠编译器优化而不是内联 asm
  * 使用 libc++ 而不是 libstdc++
  * LLVM 的 binutils 变体（lld、as 等）
  * 混合源代码/二进制分发
  * 从 x86\_64 通用基线转移到更新的 CPU，包括针对 Intel 和 AMD 的优化
  * 包管理器中基于功能的订阅（硬件/用户选择等）
  * 只支持 UEFI。不支持老式启动方式
  * 完全开源，包括引导程序/重建脚本
  * 针对高工作负载进行了认真的优化
  * 第三方应用仅依赖于容器。没有兼容性修改
  * 仅支持 Wayland。将调查通过容器的 X11 兼容性
  * 完全无状态的管理工具和上游补丁

Ikey 大胆地宣称 Serpent Linux 不是 Serpent GNU/Linux，因为它不再依赖于 GNU 工具链或运行时。

Serpent OS 项目的开发将于 7 月底开始。没有确定最终稳定版本的时间表。

### 要求过高？但是 Ikey 过去做到了

你可能会怀疑 Serpent OS 是否会出现，是否能够兑现其所作的所有承诺。

但是 Ikey Doherty 过去已经做到了。如果我没记错的话，他首先基于 Debian 创建了 SolusOS。他于 2013 年停止了基于 [Debian 的 SolusOS][5] 的开发，甚至它还没有进入 Beta 阶段。

然后，他从头开始创建 [evolve OS][6]，而不是使用其他发行版作为基础。由于某些命名版权问题，项目名称已更改为 Solus（是的，相同的旧名称）。[Ikey 在 2018 年退出了 Solus 项目][7]，其他开发人员现在负责该项目。

Solus 是一个独立的 Linux 发行版，它为我们提供了漂亮的 Budgie 桌面环境。

Ikey 过去做到了（当然，在其他开发人员的帮助下）。他现在也应该能够做到。

### 看好还是不看好？

你如何看待这个 Serpent Linux？你是否认为是时候让开发人员采取大胆的立场，并着眼于未来开发操作系统，而不是坚持过去？请分享你的观点。

--------------------------------------------------------------------------------

via: https://itsfoss.com/serpent-os-announcement/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/ikey-doherty-serpent-interview/
[2]: https://www.serpentos.com/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/07/serpent-linux.png?ssl=1
[4]: https://www.serpentos.com/about/
[5]: https://distrowatch.com/table.php?distribution=solusos
[6]: https://itsfoss.com/beta-evolve-os-released/
[7]: https://itsfoss.com/ikey-leaves-solus/
