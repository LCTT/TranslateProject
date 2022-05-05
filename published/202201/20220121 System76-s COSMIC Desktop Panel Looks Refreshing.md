[#]: subject: "System76’s COSMIC Desktop Panel Looks Refreshing!"
[#]: via: "https://news.itsfoss.com/system76-cosmic-panel/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14203-1.html"

System76 的 COSMIC 桌面面板看起来很清爽！
======

> System76 分享了其即将推出的使用 Rust 开发的 COSMIC 桌面的顶部面板草图。看起来令人惊叹！

![](https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/01/cosmic-top-panel-ft.png?w=1200&ssl=1)

System76 令人兴奋的用 Rust 开发的 COSMIC 桌面的开发工作现在正在进行中。

虽然我们已经用早期的代码 [试过了][1]，但我们现在可以看到更多的东西。从其 [GitHub 仓库][2] 和 [Figma 文档][3] 的一些原型中，我们可以看到它的更多信息。

值得注意的是，我们可以看到顶部面板和系统托盘，正如你在 COSMIC 桌面上所期望的那样。

这仍是一项正在进行的工作，可能会有变化。

### COSMIC 桌面的顶部面板

Pop!_OS 依赖于 GNOME 扩展来通过顶部面板或系统托盘图标提供更多的功能。

随着即将推出的使用 Rust 开发的 COSMIC 桌面，看起来他们正在创建新的小程序，与当前的外观相融合，并提供更多的功能。

开发者 Eduardo Flores [分解研究][4] 了它，发现了关键的区别以及 System76 的目标是如何使其发挥作用。

而且，这也是它更有趣的地方：

> 看起来 System76 正在摆脱传统的“扩展”，计划为第三方小程序设计一个 API，这与 KDE、XFce 和其他公司的做法类似。
>
> 这是一个令人兴奋的消息，将使 COSMIC 成为一个更强大的桌面环境，使其可以扩展和定制。

另外，似乎这些小程序也可以和顶部面板一起放在坞站里。我们会在其未来的某个测试版中看到更多的实际情况。

在这里，让我重点介绍一下从现有的草图中观察到的基本变化：

#### 1、声音小程序

![用 Rust 开发的 COSMIC 桌面（声音小程序）][5]

与我们现在所拥有的相比，COSMIC 的目标是增加细化的控制，如选择输入/输出设备、在顶部面板上切换媒体控制的选项、控制媒体播放，以及访问声音设置。

虽然草图没有显示专辑封面，但在发布前会包括它。

作为参考，以下是 Pop!_OS 顶部面板选项现在的样子。

![Pop!_OS 21.10（COSMIC，基于 GNOME）][6]

#### 2、电源小程序

![][7]

很高兴看到有一个专门的电源按钮来快速访问系统设置、锁屏和注销。

另外，暂停、重启和关机的按钮应该可以提高可用性，关闭计算机不用额外的点击。

#### 3、网络小程序

虽然你可以很容易地打开或关闭有线、无线网络，但会弹出一个占据了整个屏幕的单独窗口来选择 Wi-Fi 网络并输入密码。

![][8]

但是，看起来我们终于可以在这里输入密码，连接到可用的无线网络，并重试失败的连接，而不必从活动窗口分心。所有这些都发生在系统托盘上的网络小程序上，如上面的截图所示。

同样，你可以看到关于你的有线连接的更多信息，包括 IP 地址和速度。

#### 4、日期、时间和日历小程序

![][9]

最重要的日历小程序看起来更加实用，信息量更大。通知区不再驻留在这里（它现在有一个单独的小程序），使它的体验更干净，可以把注意力放在你关注的东西上。

一些细微的视觉改进，比如用重点颜色来突出日历中的某一行，应该会使它更容易理解。

#### 5、通知中心

![][10]

正如我前面提到的，通知现在有一个独立的空间。通知小程序会将所有的通知堆积起来，并允许你在需要时展开它们，或者将它们全部清除。

我们仍然有“请勿打扰”开关，并可以快速访问通知设置。

#### 6、图形模式小程序

![][11]

这对笔记本电脑用户来说应该是非常有用的，可以在图形模式之间无缝切换，并可以看到当前使用的哪种模式。

除了所有这些，还有一个蓝牙小程序、一个电池电源模式小程序，以及一些其他的东西，比如改变输入语言或输入源的能力。

![][12]

![][13]

鉴于这是初次看到使用 Rust 开发 COSMIC 桌面顶部面板的外观，看来我们有很多东西要去看了。

### 总结

总的来说，System76 正准备为我们提供一个高度可定制但又简化的 COSMIC 桌面版本。

而所有这些都应该有助于形成一种独特的桌面体验。当然，明年你就得在 Pop!_OS 中和 GNOME 说再见了。

你怎么看？请在下面的评论中告诉我你的想法！

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/system76-cosmic-panel/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/system76-rust-cosmic-desktop/
[2]: https://github.com/pop-os/cosmic-panel/issues
[3]: https://www.figma.com/proto/ZeGTqzAM7dVZgjEW3uhxcd/Top-panel?node-id=559%3A11100&scaling=scale-down&page-id=559%3A11099&starting-point-node-id=559%3A11100&show-proto-sidebar=1
[4]: https://blog.edfloreshz.dev/articles/linux/system76/cosmic-panel/
[5]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/01/pop-os-cosmic-sound-applet-early.png?w=820&ssl=1
[6]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/01/pop-os-current-top-panel.png?resize=1568%2C1037&ssl=1
[7]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/01/cosmic-new-power-applet.png?w=598&ssl=1
[8]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/01/cosmic-new-network-applet.png?w=768&ssl=1
[9]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/01/cosmic-new-date-panel.png?w=1188&ssl=1
[10]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/01/cosmic-new-notifications.png?w=1132&ssl=1
[11]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/01/cosmic-new-graphics-applet.png?w=822&ssl=1
[12]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/01/cosmic-new-battery.png?w=598&ssl=1
[13]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/01/cosmic-new-bluetooth.png?w=678&ssl=1
