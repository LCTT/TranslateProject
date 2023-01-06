[#]: subject: "Secure Boot Disabled? GNOME Will Soon Warn You About it!"
[#]: via: "https://news.itsfoss.com/gnome-secure-boot-warning/"
[#]: author: "Anuj Sharma https://news.itsfoss.com/author/anuj/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14892-1.html"

如果禁用了安全启动，GNOME 就会发出警告
======

> GNOME 正计划通知用户其固件安全状态，来保护不安全的硬件。

![](https://news.itsfoss.com/wp-content/uploads/2022/08/gnome-secure-boot-warning.jpg)

当你在支持 UEFI 的电脑上安装 Linux 时，你必须禁用“<ruby>安全启动<rt>Secure Boot</rt></ruby>”，因为启用该选项后，不能使用<ruby>现场 USB<rt>Live USB</rt></ruby> 启动。

一些主流的 Linux 发行版支持安全启动，但对于许多其他发行版（以及板载的 Nvidia 硬件）来说，它的设置仍然具有挑战性。

虽然一年又一年，情况似乎并没有改善，但总的来说，安全启动是一个必不可少的保护功能。

因此，正如 [Phoronix][1] 所发现的，为了方便和让用户意识到这一点，GNOME 和红帽的开发者正在努力在安全启动被禁用时通知（或警告）用户。

### 它有什么用？

UEFI/安全启动被批评为 DRM，因为它剥夺了用户的自由。开源社区的许多人仍然不赞同实施 UEFI/安全启动和 TPM，因为它带来了不便。这就催生了像 [Coreboot][2] 这样的项目在开源世界中蓬勃发展。

当然，如果你每天都用 Linux，我会建议你购买支持 Coreboot 的新硬件，这是一个不同的故事。

话虽如此，但可以肯定的是，安全启动是最简单的方法。

考虑到捆绑的专有固件，安全启动的安全性仍然值得商榷。但是，它是一个确保系统的固件安全的基本保护机制。

所以，开发者准备在启动闪屏（[Plymouth][3]）、GNOME 显示管理器（GDM）和 GNOME 控制中心显示警告。

![图片来源：GNOME 博客][4]

GNOME 的一位开发者在 [博客文章][5] 中分享了它的更多细节，同时给出了其中的一些屏幕截图。

![][6]

一位来自红帽的开发者在 [合并请求][7] 中提到。

> 安全启动被用来对付一些恶意软件试图感染系统的固件的安全威胁。用户可能会无意中禁用或软件可能会有意禁用安全启动。因此，配置不正确的话，系统就运行在一个不安全的平台上。如果启动闪屏能向用户提供一个警告，用户可以重新启动并重新配置他们的系统，或者立即寻求帮助。

所以，作为一个 GNOME 用户，当它进入 GNOME 43 的最终版本或任何未来的版本时，我乐于看到它所带来的变化。

如果你也想看看，你可以在 GNOME 控制中心的“<ruby>隐私<rt>Privacy</rt></ruby>”标签下的“<ruby>设备安全<rt>Device Security</rt></ruby>”部分找到这个选项，如下图所示，我的机器在 Arch Linux 上运行 GNOME 43 alpha。

![][8]

该菜单还可以显示 TPM、英特尔 BootGuard 和 IOMMU 保护的细节。

![][9]

看来我的系统并不像我想象的那么安全……但也许这就是这个功能的意义所在？

如果你只在你的 Linux 发行版上使用 UEFI 模式，并且为了方便而关闭了安全保护功能，这能让你意识到这一点吗？

有可能。但是，看看 Linux 发行版的状况和启用安全启动的问题。我不觉得这可能会是一个大问题。我们很快就会知道了。

### 如何禁用这个警告？

正如在 GNOME Gitlab 的 [合并请求][10] 中提到的，在你的内核参数中添加 `sb-check=false` 就可以禁用这些警告。

不过，作为终端用户，你不需要担心这个问题。

你对即将在 GNOME 43 或更高版本中增加的这个功能有什么看法？你对 UEFI/安全启动有什么看法？

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/gnome-secure-boot-warning/

作者：[Anuj Sharma][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/anuj/
[b]: https://github.com/lujun9972
[1]: https://www.phoronix.com/news/GNOME-Secure-Boot-Warning
[2]: https://www.coreboot.org/
[3]: https://gitlab.freedesktop.org/plymouth
[4]: https://news.itsfoss.com/wp-content/uploads/2022/08/gnome-secure-boot-mockup.png
[5]: https://blogs.gnome.org/hughsie/2022/07/29/emulated-host-profiles-in-fwupd/
[6]: https://news.itsfoss.com/wp-content/uploads/2022/08/boot-security.png
[7]: https://gitlab.freedesktop.org/plymouth/plymouth/-/merge_requests/176
[8]: https://news.itsfoss.com/wp-content/uploads/2022/07/secure-boot-gnome.png
[9]: https://news.itsfoss.com/wp-content/uploads/2022/07/secure-boot-gnome1.png
[10]: https://gitlab.gnome.org/GNOME/gnome-shell/-/merge_requests/2333
