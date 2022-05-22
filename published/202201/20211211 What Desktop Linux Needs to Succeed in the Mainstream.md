[#]: subject: "What Desktop Linux Needs to Succeed in the Mainstream"
[#]: via: "https://news.itsfoss.com/what-desktop-linux-needs-to-succeed-in-the-mainstream/"
[#]: author: "Community https://news.itsfoss.com/author/team/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14189-1.html"

桌面 Linux 需要什么才能在主流中获得成功？
======

> 这是 Linux 走向大众最重要的一件事。

![](https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2021/12/penguin-laptop.png?w=1200&ssl=1)

你可能看过 [最近 Linus Tech Tips 关于切换到 Linux 的视频][1]，以及 [他对 KDE 软件的一些抱怨的那个视频][2]。对于那些关注此事的人，我想让你们知道，我们（KDE）正在努力修复 Linus 提出的问题，你们可以在 [这里][3] 跟踪我们的进展。值得庆幸的是，大部分的问题都相当小，应该很容易解决。

关于桌面 Linux 需要什么才能成为主流的问题。[Sway][4] 开发者 [Drew DeVault 针对该视频发表了一篇文章][5]，而这篇博文是我的版本。Drew 强调了可访问性，我也同意，但结论略有不同。

### 桌面 Linux 需要预装在零售硬件上才能在主流市场取得成功

就是这样。

请允许我解释一下。

人们经常被功能和可用性所困扰，这些都很重要，但它们只是达到目的的手段，本身并不是目的。如果人们根本不能得到它，质量就毫无意义。而如果没有可访问的发行版，人们就无法得到它。高质量的 Linux 发行版还不够；它们需要被预装在你可以在主流零售店买到的硬件产品上。“主流人群”会购买他们可以触摸和拿起的产品；如果在主流商店找不到它，它就不存在。

想一想，**为什么普通人都使用 Windows 或 macOS**？因为他们购买的实体电脑包含了它。iOS 或 Android 呢？它被默认装在了他们的实体智能手机上。对于“主流人群”来说，不存在用一个新的操作系统替换设备的操作系统的想法。只有 [“三点”用户][6] 才会这么做，而他们只占市场的 5% 左右。如果获得你的操作系统的唯一途径是自己安装，那么你就没有机会在主流市场取得成功。

![](https://pointieststick.files.wordpress.com/2021/11/computers-skill.jpg?w=1085)

至于功能，人们通常只使用可用功能的很小的一部分。在可用性方面，大多数用户是 [记住他们的软件如何使用而不是理解它][7] —— 如果你真的需要，你可以记住任何东西。一个更好的用户界面会有所帮助，但是对于那些记忆这些的人来说并不是必需的，而它主要有利于那些能够识别模式，并欣赏逻辑、一致性和良好设计的高级用户（市场上 30% 的“二点及以上”人群）。因此，这些东西本身就不够好。

但这并不意味着我们应该忘记功能和可用性！一点也不。但是如果我们的目标是“走向主流”，我们就必须了解真正的受众：**是硬件供应商，而不是终端用户**。我们的目标是让软件产品有足够的吸引力，以便在供应商选购时被他们选中，因为它基本上就是这样做的。像苹果这样为知名产品定制自上而下的硬件和软件的公司很少。大多数公司都建立在第三方软件之上，这些软件需要他们内部软件团队进行最少的整合和定制工作。如果你的软件不能胜任，他们会转向下一个选择。因此，当一些硬件供应商有需求时，你的软件最好已经准备好了！

而硬件供应商需要什么？

  * **灵活性**。你的软件必须容易适应他们的任何类型的设备，而不需要大量的定制工程，他们将在产品的生命周期中负责支持。
  * **能使他们的设备看起来不错的功能**。对其物理硬件特性的支持、良好的性能、令人愉快的用户界面……人们购买它的理由基本上是这些。
  * **稳定性**。不能崩溃并将用户抛弃在命令行终端提示符下。必须可以实际工作。不能让人感觉像一个业余的科学展览会项目。
  * **可用性要足够好，以减少支持成本**。当出现问题时，“主流人群”会联系他们的硬件供应商。可用性需要足够好，以便尽可能少地发生这种情况。

它不需要完美。它只需要做这些事情。这就是 Windows 在 90 年代征服了个人电脑市场的方式，尽管它很糟糕！而我们的东西要好得多！

我看到有证据表明 KDE 已经是这样了。Pine 在 [PinePhone][8] 和 [PineBook Pro][9] 上分别为 Manjaro 提供了 Plasma 的移动版和桌面版。Valve 也为 [Steam Deck][10] 选择了 Plasma 的桌面版，在他们的新版 SteamOS 中取代了 GNOME。我认为 KDE 软件定位良好，并且一直在变得更好。因此，让我们继续加倍努力提供硬件供应商销售其出色产品所需的东西。

原文由 KDE 开发者 Nate Graham 发表在他的 [博客 PointiestStick][11] 中。 本文经许可后转载。所表达的观点代表作者自己，可能不能反映我们的观点。

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/what-desktop-linux-needs-to-succeed-in-the-mainstream/

作者：[Nate Graham][11]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/team/
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-14053-1.html
[2]: https://www.youtube.com/watch?v=TtsglXhbxno&list=PL8mG-RkN2uTyhe6fxWpnsHv53Y1I-K3yu&index=3
[3]: https://invent.kde.org/teams/usability/issue-board/-/boards/7723
[4]: https://swaywm.org/
[5]: https://drewdevault.com/2021/12/05/What-desktop-Linux-needs.html
[6]: https://pointieststick.com/2021/11/29/who-is-the-target-user
[7]: https://pointieststick.com/2021/11/30/more-about-those-zero-dot-users/
[8]: https://www.pine64.org/pinephone/
[9]: https://www.pine64.org/pinebook-pro/
[10]: https://www.steamdeck.com/
[11]: https://pointieststick.com/2021/12/09/what-desktop-linux-needs-to-succeed-in-the-mainstream/
