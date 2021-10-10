[#]: subject: "DirectX 11/12 Games like Cyberpunk 2077 Can Use NVIDIA DLSS With Proton Experimental on Linux"
[#]: via: "https://news.itsfoss.com/nvidia-dlss-dx-11-12-proton/"
[#]: author: "Rishabh Moharir https://news.itsfoss.com/author/rishabh/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13865-1.html"

《赛博朋克 2077》等 DirectX 11/12 游戏可在 Linux 上体验 DLSS 了
======

> 通过 Steam Proton 的实验版本，期待已久的 Nvidia DLSS 支持在 Linux 上的 DirectX 11/12 大作中出现。

![](https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2021/10/nvidia-dlss-proton.png?w=1200&ssl=1)

6 月，英伟达 [宣布][1] 通过 Steam Proton 支持 Linux 中的 DLSS，并为基于 Vulkan 的游戏提供了测试版驱动程序。

DLSS 是指<ruby>深度学习超级采样<rt>Deep Learning Super Sampling</rt></ruby>。它利用由 RTX GPU 中的 Tensor 核心提供支持的深度学习算法来提升游戏中的图像。这将使图像更清晰、更锐利，并提高帧率。

![来源：英伟达][2]

这种 [升级技术][3] 类似于 AMD 的 Fidelity FX，甚至更接近于英特尔即将推出的 XeSS，与 DLSS 不同的是这两者都是开源的。玩家已经可以通过 [GloriousEggroll][4] 的定制 Proton GE 版本体验到 Fidelity FX。

此外，英伟达还计划在今年秋天之前将支持范围扩大到 DirectX 游戏。

而且，随着最新的 Proton 实验性支持，这一切终于实现了。使用英伟达 GPU 的 Linux 游戏玩家现在可以用 DLSS 玩他们最喜欢的基于 DX11/12 的游戏。

考虑到我们很快就能在 Linux 上玩各种多人游戏，并且 [Proton 中添加了对 BattleEye & Easy-Anti Cheat 的支持][5]，这是进行这项添加的最好时机。

### Steam Porton 的重大更新

几天前，伴随着 Proton 6.3-7 的一波改进，Valve 终于设法将 DLSS 支持添加到 Proton 的 DirectX 11/12 游戏实验分支中。

在此之前，需要一个测试版驱动程序才能将 DLSS 用于基于 Vulkan 的游戏，例如 DOOM Eternal。

但是，现在不再如此 —— 尽管推荐使用最新的驱动程序。

作为补充，DXVK 和 Steamworks SDK 也已经更新到最新的开发版本。此外，还修复了特定游戏的性能问题和其他错误。

你可以查看 Proton 的 [官方 GitHub 更新日志][6] 来了解到目前为止支持的所有游戏的改进列表。

### 为 DX11/12 游戏启用 DLSS

启用 DLSS 是一个简单明了的过程。

首先，你必须确保你的 Windows 游戏可以在 Proton Experimental 上运行。

这可以通过右键点击游戏并选择“<ruby>属性<rt>Properties</rt></ruby>”来完成。然后在“<ruby>兼容性<rt>Compatibility</rt></ruby>”下，你需要勾选“<ruby>强制使用特定的 Steam Play 兼容工具<rt>Force the use of a specific Steam Play compatibility tool</rt></ruby>”复选框。接下来，从下拉菜单中选择 “Proton Experimental”。

![][7]

最后，你需要在“<ruby>启动选项<rt>Launch Options</rt></ruby>”中插入命令：`PROTON_HIDE_NVIDIA_GPU=0 PROTON_ENABLE_NVAPI=1 %command%` 。

![][8]

这就行了。你就可以用 DLSS 玩你的游戏了！

### 总结

英伟达 DLSS 对于许多游戏来说是一个非常需要的功能，因为它的作用很大。

Linux 从一开始就没有对 DLSS 的全面支持。但是，看起来它很快就会在未来的 Proton 稳定版本中提供，并进行必要的改进。

Linux 玩家终于可以用基于 RTX 的 GPU 在许多游戏中体验到更好的帧率和视觉质量。

虽然我在 AMD 显卡上使用 Fidelity FX，但我仍然渴望在 RTX GPU 上尝试 DLSS！

你对英伟达 DLSS 的到来有什么感觉？你会很快尝试它吗？欢迎在下面分享你的评论。

转自：[GamingOnLinux][9]。

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/nvidia-dlss-dx-11-12-proton/

作者：[Rishabh Moharir][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/rishabh/
[b]: https://github.com/lujun9972
[1]: https://www.nvidia.com/en-us/geforce/news/june-2021-rtx-dlss-game-update/
[2]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2021/10/DLSS_RDD2.jpg?w=800&ssl=1
[3]: https://news.itsfoss.com/intel-xess-open-source/
[4]: https://github.com/GloriousEggroll/proton-ge-custom
[5]: https://news.itsfoss.com/easy-anti-cheat-linux/
[6]: https://github.com/ValveSoftware/Proton/wiki/Changelog
[7]: https://i2.wp.com/news.itsfoss.com/wp-content/uploads/2021/10/Compatibility.png?w=836&ssl=1
[8]: https://i2.wp.com/news.itsfoss.com/wp-content/uploads/2021/10/Commands-1.png?w=831&ssl=1
[9]: https://www.gamingonlinux.com/2021/10/proton-experimental-expands-nvidia-dlss-support-on-linux-to-directx-11-titles
