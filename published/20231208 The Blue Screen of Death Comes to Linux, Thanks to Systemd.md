[#]: subject: "The Blue Screen of Death Comes to Linux, Thanks to Systemd"
[#]: via: "https://news.itsfoss.com/bsod-linux/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16453-1.html"

Linux 用户也将被蓝屏死机的恐怖所支配！
======

![][0]

> 现在，蓝屏死机的恐怖也将笼罩在 Linux 用户头上。

多年来，“<ruby>蓝屏死机<rt>Blue-Screen-Of-Death</rt></ruby>”（BSOD）已经成了 Windows 操作系统的代名词，一旦系统出现重大错误，Windows 就会展示蓝色的错误页面。

我自己也常常遇到一些看似随机的问题，这些问题会导致 Windows 蓝屏死机。有时候，显示的错误代码能提供一些帮助，但更多的时候，它们只是让我更加感到困惑。

而现在，随着 systemd v255 的发布，我们也将在 Linux 上见到这个熟悉的“朋友”。让我带你了解一下：

![一个模拟的蓝屏死机页面（并非 Linux 上可能出现的样子）][1]

发生的事情：systemd 开始加入一个称为 `systemd-bsod` 的**新实验性组件**。依据 [提交记录][2]，它**用于显示与引发系统启动失败相关的蓝屏错误消息**。

类似于 Windows，**这个功能还会展示一个二维码**，用户可以扫描获取到故障相关的信息。

> 📋 只有在错误级别达到 `LOG_EMERG` 时，才会显示错误信息。

**这很重要吗？**

当然重要。因为，对于装备了 systemd 的 Linux 发行版在发生崩溃或拒绝启动的情况下，**它展示错误代码的方式**过于令人费解，**尤其对于新手来说**。

有了蓝屏死机系统后，用户用不着还要在各大论坛和文章里寻求解答。他们现在的问题解决方式将更加直观，更贴近他们的习惯。

考虑到大部分 [热门的 Linux 发行版][3] 都基于 systemd，这个改变应该会受到许多用户的欢迎。

关于 **systemd 255 版本的其它改变**，这里有一些主要的亮点：

  * 针对启动服务的方法进行了**全面的重构**。
  * `seccomp` 已开始支持 **64 位龙架构** 微处理器架构。
  * 对 **System V 服务脚本** 的支持已被取消，未来版本将完全移除此项支持。
  * 如果在执行重启操作时发现 `/run/nextroot/` 目录下存在新的根文件系统，`systemctl` 将会自动执行 `soft-reboot` 操作。
  * 改善了在 systemd 上对 **TPM2 支持** 的众多方面。

我强烈建议你查看 [官方的更新日志][4]，了解更多关于新的 systemd 版本的信息。这个新版本将于 **2024 年上半年** 出现在许多即将发布的 Linux 发行版中。

尽管我们中的许多人都熟知那个围绕 systemd 已经酝酿多时的 [争议][5]，我仍然很好奇，当蓝屏死机的功能未来不久推出时，会引起怎样的反响。

有一点可以肯定，我们一定会开怀大笑，因为将有一大堆 Linux 蓝屏死机的段子图片问世 😆

💬 我迫不及待地想看 Linux 蓝屏死机的段子图片，你呢？

*（题图：DA/18062133-604c-41e6-b234-67c58d0770a5）*

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/bsod-linux/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[ChatGPT](https://linux.cn/lctt/ChatGPT)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/content/images/2023/12/Linux_BSOD.png
[2]: https://github.com/systemd/systemd/commit/fc7eb1325bd297634568528fb934698a68855121
[3]: https://itsfoss.com/best-linux-distributions/
[4]: https://github.com/systemd/systemd/releases/tag/v255
[5]: https://itsfoss.com/systemd-init/
[6]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[0]: https://img.linux.net.cn/data/attachment/album/202312/09/091822kuzxjl2zxbeblrbz.jpg