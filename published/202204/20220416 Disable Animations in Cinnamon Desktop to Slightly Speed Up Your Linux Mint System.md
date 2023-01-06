[#]: subject: "Disable Animations in Cinnamon Desktop to Slightly Speed Up Your Linux Mint System"
[#]: via: "https://itsfoss.com/disable-animations-cinnamon-desktop/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "lkxed"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14499-1.html"

禁用 Cinnamon 桌面的动画以略微加速你的 Linux Mint 系统
======

![](https://img.linux.net.cn/data/attachment/album/202204/22/121054zccs5lcss57lt96e.jpg)

让我们面对现实吧。

与 GNOME 等相比，Cinnamon 已经是一个轻量的桌面环境了。虽然它占用的资源可能没有 Xfce 那么低。

不过，如果你有一个硬件不足的系统，并且你想要提升一点性能，而不想切换到 Xfce 等替代性<ruby>桌面环境<rt>Desktop Environment</rt></ruby>（DE）或 [Sway][1]、[Fluxbox][2] 等<ruby>窗口管理器<rt>Window Manager</rt></ruby>（WM）的话，我这里倒是有一个实用小技巧可以分享给你。它应该帮助你加快 Linux Mint 的速度，虽然只能够加快一点点。

### 禁用 Cinnamon 桌面的动画效果

**首先，你一定不要指望用这个小技巧来大幅提高整体桌面性能。原因如下：**

当你打开/关闭应用程序窗口、使用菜单、弹出对话框等时，你会注意到这些<ruby>动画<rt>animations</rt></ruby>或<ruby>效果<rt>effects</rt></ruby>。由于这些事件都是短暂的，不会持续运行，因此禁用它们并不能得到很大提升。

如果你的系统真的在崩溃的边缘挣扎，禁用这些效果可能有助于减少卡顿。真的到了这种时候，能快一点是一点。让我们来看看该怎么做吧！

首先，打开菜单，搜索“<ruby>效果<rt>effects</rt></ruby>”。

![打开 Linux Mint Cinnamon 的效果设置][3]

打开“<ruby>效果<rt>effects</rt></ruby>”设置窗口，你默认会在“<ruby>启用效果<rt>Enable Effects</rt></ruby>”这个标签页中。你可以在这里选择禁用（或启用）各种可用的动画效果。

![禁用 Linux Mint Cinnamon 桌面的动画][4]

你可以选择禁用部分或全部效果。

如果你切换到“<ruby>自定义<rt>Customize</rt></ruby>”标签页，你可以自定义你在“<ruby>启用效果<rt>Enable Effects</rt></ruby>”标签页中看到的各种效果。

![自定义 Linux Mint Cinnamon 中的窗口动画][5]

第一栏是效果的名称，第二栏是动画的类型，第三栏是动画的展示方式，在最后一栏，你可以配置动画完成的时间。

如果你选择了 “None”、“easeNone” 和 “0” 时长，就相当于禁用了这个效果。不过，使用另一个标签中的禁用选项是一个更简单的选择。

### 值得这样做吗？

我写这个小技巧的原因是，有读者问我能否定制 Cinnamon 并禁用动画。

说实话，这并不费什么劲，而且做了之后也没有多大区别。你几乎不会注意到视觉上的影响，更别说是性能上的改进了。

但是，如果你的系统正处于挣扎状态，每一个微小的优化都会有帮助。你也可以尝试使用消耗较少系统资源的轻量级应用程序。这或许对你也有一点帮助。

你有任何类似的优化小技巧吗？请在评论区和大家分享吧！

--------------------------------------------------------------------------------

via: https://itsfoss.com/disable-animations-cinnamon-desktop/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[lkxed](https://github.com/lkxed)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/sway-window-manager/
[2]: http://fluxbox.org/
[3]: https://itsfoss.com/wp-content/uploads/2022/04/accessing-effects-settings-mint-cinnamon-800x630.png
[4]: https://itsfoss.com/wp-content/uploads/2022/04/disable-animations-cinnamon-Linux-mint-800x466.png
[5]: https://itsfoss.com/wp-content/uploads/2022/04/customize-window-animation-cinnamon-linux-mint-800x571.png
