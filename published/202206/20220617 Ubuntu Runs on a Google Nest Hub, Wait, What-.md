[#]: subject: "Ubuntu Runs on a Google Nest Hub, Wait, What?"
[#]: via: "https://news.itsfoss.com/ubuntu-google-nest/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: "lkxed"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14746-1.html"

Ubuntu 可以运行在谷歌 Nest Hub 上了？！
======

> 一名安全专家成功地在谷歌 Nest Hub（第 2 代）上运行了 Ubuntu，嗯，然后呢？

![Ubuntu Google][1]

我刚刚看到了一个关于在谷歌 Nest Hub（第 2 代）上运行的 Ubuntu 的消息。

嗯，这实在是让人兴奋！

所以，让我在这里分享更多关于它的信息吧。

### 破解谷歌 Nest Hub 以安装 Ubuntu

是的，破解使得这成为可能。

网络安全专家 Frédéric Basse 破解了谷歌 Nest Hub（第 2 代）的安全启动，并成功运行 Ubuntu。

当然，谷歌 Nest Hub 并没有正式支持启动一个自定义操作系统。但是，Fred 使用了一个安全漏洞，从而成功运行了 Ubuntu。

虽然这很有趣，但对于始终在线的谷歌智能家居显示器来说，这也是一个严重的安全问题。

![](https://news.itsfoss.com/wp-content/uploads/2022/06/ubuntu-google-nest-hacked.gif)

正如这位安全专家在 [博客文章][2] 中所解释的，他使用了树莓派 Pico 微控制器，利用引导加载程序中的 USB 漏洞，从而破坏了安全启动链。

这位安全专家得出结论：

> 因此，攻击者可以通过插入恶意 USB 设备并按下两个按钮，从而在早期启动阶段（内核执行之前）执行任意代码。

如果你想进行实验（适合安全研究人员），他还在 [GitHub][3] 上提供了相关代码（关于如何利用这个引导加载程序漏洞）。

### 让 Ubuntu 在 Google Nest 上运行

![][4]

该漏洞允许攻击者启动未签名的操作系统。但是，在那之前，攻击者必须对为树莓派（64 位 ARM 版）量身定制的预装 Ubuntu 镜像进行一些修改。

这位安全专家还提到了以下内容：

> 我们构建了一个自定义 U-Boot 引导加载程序，禁用了安全引导，并更改了引导流程以从 USB 闪存驱动器加载环境。我们还为 elaine 构建了一个自定义 Linux 内核，其中包括包括了一些 [额外驱动，例如 USB 鼠标][5] 。重新打包了来自 Ubuntu 的初始 ramdisk（initrd），以集成触摸屏所需的固件二进制文件。引导镜像是基于自定义 Linux 内核和修改的 initrd 创建的。

因此，很明显，你不会获得完整的 Ubuntu 体验，但由于该漏洞，我们现在知道，如果你愿意破解 谷歌 Nest 进行测试的话（真心不建议！），Ubuntu 是可以在谷歌 Nest 上作运行的。

### 智能家居安全担忧 + Linux

网络安全专家指出，该漏洞已在上游（两次）修复。

但是，研究人员也指出，缺乏分配的 CVE 编号可能会导致修复程序无法向下游传播。

毫无疑问，看到有人在不受支持的设备上运行 Linux 真是太棒了。这让我思考，我们是否应该也制造一些 **由 Linux 驱动的商业智能家居设备？**

*或者说，已经有类似的东西了吗？*

然而，智能家居设备容易受到简单攻击，也同样令人担忧。

你怎么看？在下面的评论中分享你的想法吧。

**本文最初发布于** [Liliputing][6]

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/ubuntu-google-nest/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[lkxed](https://github.com/lkxed)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/wp-content/uploads/2022/06/hacker-installs-ubuntu-on-google-nest-hub.jpg
[2]: https://fredericb.info/2022/06/breaking-secure-boot-on-google-nest-hub-2nd-gen-to-run-ubuntu.html
[3]: https://github.com/frederic/chipicopwn
[4]: https://news.itsfoss.com/wp-content/uploads/2022/06/ubuntu-google-nest.jpg
[5]: https://github.com/frederic/elaine-linux/commit/11068237d9178e77d79e3a5d27fc4f8f9b923c51
[6]: https://liliputing.com/2022/06/hacker-installs-ubuntu-on-a-google-nest-hub-2nd-gen-smart-display.html
