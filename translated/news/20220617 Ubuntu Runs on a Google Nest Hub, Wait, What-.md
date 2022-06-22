[#]: subject: "Ubuntu Runs on a Google Nest Hub, Wait, What?"
[#]: via: "https://news.itsfoss.com/ubuntu-google-nest/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: "lkxed"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Ubuntu 在 Google Nest Hub 上运行，等等，什么？
======
一名黑客成功地在 Google Nest Hub（第二代）上运行了 Ubuntu，嗯，然后呢？

![Ubuntu Google][1]

我刚刚看到了一个关于在 Google Nest Hub（第二代）上运行的 Ubuntu 的故事。

嗯，这实在是让人兴奋！

所以，让我在这里分享更多关于它的信息吧。

### 破解 Google Nest Hub 以安装 Ubuntu

是的，一次黑客攻击使这成为可能。

网络安全专家 **Frédéric Basse** 破解了 Google Nest Hub（第 2 代）的安全启动，并成功运行 Ubuntu。

当然，Google Nest Hub 并没有正式支持启动一个自定义操作系统。但是，Fred 使用了一个安全漏洞，从而成功运行了 Ubuntu。

虽然这很有趣，但对于始终连接的谷歌智能家居显示器来说，这也是一个严重的问题。

正如他在 [博客文章][2] 中所解释的，黑客使用了 Raspberry Pi Pico 微控制器，利用引导加载程序中的 USB 漏洞，从而破坏了安全启动链。

安全专家得出结论：

> 因此，攻击者可以通过插入恶意 USB 设备并按下两个按钮，从而在早期启动阶段（内核执行之前）执行任意代码。

如果你想进行实验（适合安全研究人员），他还在 [GitHub][3] 上提供了相关代码（关于如何利用这个引导加载程序漏洞）。

### 让 Ubuntu 在 Google Nest 上运行

![][4]

该漏洞允许攻击者启动未签名的操作系统。但是，在那之前，攻击者必须对为 Raspberry Pi（64 位 ARM）量身定制的预装 Ubuntu 镜像进行一些修改。

攻击者还提到了以下内容：

> 我们构建了一个自定义 U-Boot 引导加载程序，禁用了安全引导，并更改了引导流程以从 USB 闪存驱动器加载环境。我们还为 elaine 构建了一个自定义 Linux 内核，其中包括包括了一些 [额外驱动，例如 USB 鼠标][5] 。来自 Ubuntu 的初始 ramdisk（initrd）被重新打包，以集成触摸屏所需的固件二进制文件。引导镜像是基于自定义 Linux 内核和修改的 initrd 创建的。

因此，很明显，你不会获得完整的 Ubuntu 体验，但由于该漏洞，我们现在知道，如果你愿意破解 Google Nest 进行测试的话，Ubuntu 是可以在 Google Nest 上作运行的，作为一个实验（不要那样做，真的！）。

### 智能家居安全担忧 + Linux

网络安全专家指出，该漏洞已在上游修复（两次）。

但是，研究人员也指出，缺乏 CVE 可能会导致修复程序无法向下游传播。

毫无疑问，看到有人在不受支持的设备上运行 Linux 真是太棒了。这让我思考，我们是否应该也制造一些**由 Linux 驱动的商业智能家居设备？**

*或者说，已经有类似的东西了吗？*

然而，智能家居设备容易受到简单攻击，也同样令人担忧。

你怎么看？在下面的评论中分享你的想法吧。

**本文最初发布于** [Liliputing][6]

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/ubuntu-google-nest/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[lkxed](https://github.com/lkxed)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/wp-content/uploads/2022/06/hacker-installs-ubuntu-on-google-nest-hub.jpg
[2]: https://fredericb.info/2022/06/breaking-secure-boot-on-google-nest-hub-2nd-gen-to-run-ubuntu.html
[3]: https://github.com/frederic/chipicopwn
[4]: https://news.itsfoss.com/wp-content/uploads/2022/06/ubuntu-google-nest.jpg
[5]: https://github.com/frederic/elaine-linux/commit/11068237d9178e77d79e3a5d27fc4f8f9b923c51
[6]: https://liliputing.com/2022/06/hacker-installs-ubuntu-on-a-google-nest-hub-2nd-gen-smart-display.html
