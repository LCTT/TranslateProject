[#]: collector: (lujun9972)
[#]: translator: (lnrCoder)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12254-1.html)
[#]: subject: (Now You Can Run Linux Apps in Windows (Thanks to WSL))
[#]: via: (https://itsfoss.com/run-linux-apps-windows-wsl/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

现在你可以在 Windows 中运行 Linux 应用了
======

![](https://img.linux.net.cn/data/attachment/album/202005/27/111439z64u19z6ct6r46kb.jpg)

微软最近的 “[Build 2020][1]” 开发者大会公布了一些有趣的公告。我不确定这该令人兴奋还是该令人怀疑 —— 但是微软，你现在比以往任何时候都受到我们的关注。

同时，在所有的这些公告中，能够在 WSL（Windows Subsystem for Linux）上运行 GUI 应用程序的功能备受关注。

更不要忘了 [Xamrin.Forms 更名为 MAUI 的尴尬结局][2]，它与 [Nitrux Linux][4] 的 Uri Herrera 的现有开源项目（[Maui Project][3]）名字冲突。

以防你不清楚，WSL 是一种环境，可让你在 Windows 10 中获得 Linux 控制台的体验。它也是在 [Windows 中运行 Linux 命令的最佳方法][5]之一。

正如 [Liam Dawe][7] 认为的那样，通过博客文章（[DirectX ❤ Linux][6]）发布的公告可能是只是个公关诱饵。但是，仍然值得一提。

### WSL 上对 Linux GUI 应用程序的支持

![][8]

最近，Microsoft 在在线开发者大会上宣布了 WSL（即 WSL 2）的一系列新功能。

[Windows 包管理器][9]、[Windows 终端 1.0][10]，以及其他一些功能的引入是其亮点。

但是， WSL 2 对 GPU 硬件加速的支持非常重要。

那么，是否意味着你可以使用 WSL 在 Windows 上运行 Linux 应用程序呢？看起来像是。

微软计划通过使用全新的 Linux 内核驱动程序 `dxgkrnl` 来实现它。为了给你一个技术性的简报, 我在这里引用他们的公告中的描述：

![Linux Kernel Driver Wsl][11]

> dxgkrnl 是一个全新的 Linux 内核驱动程序，它将 `/dev/dxg` 设备提供给用户模式的 Linux。  `/dev/dxg` 提供了一组 IOCTL，它们与 Winodws 上的原生 WDDM D3DKMT 内核服务层非常相似。Linux 内核中的 dxgkrnl 通过 VM 总线连接到 Windows 主机上，并使用此 VM 总线连接与物理 GPU 进行通讯。

我不是这方面的专家，但这意味着 WSL 上的 Linux 应用程序将与原生的 Windows 应用程序一样可以访问 GPU。

针对 GUI 应用程序的支持将在今年秋季的晚些时候提供（而不是 2020 年 5 月的更新） —— 所以我们要看看什么时候提供。

微软专门针对的是那些希望在 Windows 上轻松使用 Linux IDE 的开发人员。谷歌也在瞄准同样的用户群，[将 GUI Linux 应用程序引入到 Chromebook][12]。

那么，对于那些坚持使用 Windows 的用户来说，这是个好消息。但是，这是真的吗？

### 微软爱上了 Linux —— 真的吗？

![Microsoft Loves Linux][13]

他们在 Windows 上整合 Linux 环境来拥抱 Linux 及其优势的努力，绝对是一件好事。

但是，它真的能给**桌面 Linux 用户**带来什么好处呢？到目前为止，我还没有看到任何实际的好处。

在这里，你可以有不同的看法。但是，我认为 WSL 的开发对于 Linux 桌面用户来说没有真正的价值。至少，到目前为止没有。

有趣的是，[Linux Unplugged podcast][14] 上有人强调了微软的举动，认为这与他们的 EEE（<ruby>拥抱、延伸和扑灭<rt>Embrace, extend, and extinguish</rt></ruby>）的思路是一致的。

可能吧，谁知道呢？当然，他们为实现这一目标而付出的努力值得赞赏 —— 同时又令人感到兴奋和神秘。

### 这是否以为着 Windows 用户将不必再转到 Linux?

微软之所以在其平台上集成 Linux，是因为他们知道 Liunx 的能力，也知道开发人员（或用户）喜欢使用它的原因。

但是，随着 WSL 2 的更新，如果这种情况持续下去，我倾向于同意 Abhishek 的看法：

> 最终，桌面 Linux 将被限制在 Windows 下，成为桌面应用程序……

好吧，当然，原生的体验暂时还是比较好的。而且，很难看到现有的 Linux 桌面用户会使用 Windows 来将其替代。但是，这仍然值得担心。

你如何看待这一切？我不认为 WSL 对于被迫使用 Windows 的用户有什么好处 —— 但是，从长远来看，你认为微软在 WSL 方面的进展本质上是敌意还是对 Linux 有帮助？

在评论中让我知道你的想法！

--------------------------------------------------------------------------------

via: https://itsfoss.com/run-linux-apps-windows-wsl/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[lnrCoder](https://github.com/lnrCoder)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://news.microsoft.com/build2020/
[2]: https://itsfoss.com/microsoft-maui-kde-row/
[3]: https://mauikit.org/
[4]: https://itsfoss.com/nitrux-linux/
[5]: https://itsfoss.com/run-linux-commands-in-windows/
[6]: https://devblogs.microsoft.com/directx/directx-heart-linux/
[7]: https://www.gamingonlinux.com/2020/05/microsoft-build-directx-and-linux-plus-more
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/Linux-GUI-app-Windows-WSL.png?ssl=1
[9]: https://devblogs.microsoft.com/commandline/windows-package-manager-preview/
[10]: https://devblogs.microsoft.com/commandline/windows-terminal-1-0/
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/linux-kernel-driver-wsl.png?ssl=1
[12]: https://itsfoss.com/linux-apps-chromebook/
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/microsoft-loves-linux.jpg?ssl=1
[14]: https://linuxunplugged.com/354
