Linus Torvalds 透露他编程最喜欢使用的笔记本
=================

> 是戴尔 XPS 13 开发者版。下面就是原因。

我最近和一些 Linux 开发者讨论了对于严谨的程序员来说，最好的笔记本是什么样的问题。结果，我从这些程序员的观点中筛选出了多款笔记本电脑。那么依我之见赢家是谁呢？就是戴尔 XPS 13 开发者版。和我观点一样的大有人在。Linux的缔造者 Linus Torvalds 也认同这个观点。对于他来说，戴尔 XPS 13 开发者版大概是最好的笔记本电脑了。

![Linus Torvalds new favorite laptop is the Dell XPS 13 Developer Edition.](http://zdnet3.cbsistatic.com/hub/i/r/2016/07/18/702609c3-db38-4603-9f5f-4dcc3d71b140/resize/770xauto/50a8ba1c2acb1f0994aec2115d2e55ce/2016-dell-xps-13.jpg)

Torvalds 的需求可能和你的不同。

在 Google+ 上，Torvalds 解释道，“第一：[我从来不把笔记本当成台式机的替代品][1]，并且，我每年旅游不了几次。所以对于我来说，笔记本是一个相当专用的东西，并不是每日（甚至每周）都要使用，因此，主要的标准不是那种“差不多每天都使用”的标准，而是非常适合于旅游时使用。”

因此，对于 Torvalds 来说，“我最后比较关心的一点是它是相当的小和轻，因为在会议上我可能一整天都需要带着它。我同样需要一个好的屏幕，因为到目前为止，我主要是在桌子上使用它，我希望文字的显示小而且清晰。”

戴尔的显示器是由 Intel's Iris 540 GPU 支持的。在我的印象中，它表现的非常的不错。

Iris 驱动了 13.3 英寸的 3200×1800 的显示屏。每英寸有 280 像素，比我喜欢的 [2015 年的 Chromebook Pixel][2] 多了 40 个像素，比 [Retina 屏的 MacBook Pro][3] 还要多 60 个像素。

然而，要让上面说的硬件配置在 [Gnome][4] 桌面上玩好也不容易。正如 Torvalds 在另一篇文章解释的那样，它“[和我的桌面电脑有一样的分辨率][5]，但是，显然因为笔记本的显示屏更小，Gnome 桌面似乎自己做了个艰难的决定，认为我需要 2 倍的自动缩放比例，这简直愚蠢到炸裂（例如窗口显示，图标等）。”

解决方案？你不用想着在用户界面里面找了。你需要在 shell下运行：`gsettings set org.gnome.desktop.interface scaling-factor 1`。

Torvalds 或许使用 Gnome 桌面，但是他不是很喜欢 Gnome 3.x 系列。这一点上我跟他没有不同意见。这就是为什么我使用 [Cinnamon][7] 来代替。

他还希望“一个相当强大的 CPU，因为当我旅游的时候，我依旧需要编译 Linux 内核很多次。我并不会像在家那样每次 pull request 都进行一次完整的“make allmodconfig”编译，但是我希望可以比我以前的笔记本多编译几次，实际上，这（也包括屏幕）应该是我想升级的主要原因。”

Linus 没有描述他的 XPS 13 的细节，但是我测评过的那台是一个高端机型。它带有双核 2.2GHz 的第 6 代英特尔的酷睿 i7-6550U Skylake 处理器，16GBs DDR3 内存，以及一块半 TB （500GB）的 PCIe 固态硬盘（SSD）。我可以肯定，Torvalds 的系统至少是精良装备。”

一些你或许会关注的特征没有在 Torvalds 的清单中：

> “我不会关心的是触摸屏，因为我的手指相对于我所看到的文字是又大又笨拙（我也无法处理污渍：也许我的手指特别油腻，但是我真的不想碰那些屏幕）。

> 我并不十分关心那些“一整天的电池寿命”，因为坦率的讲，我不记得上次没有接入电源时什么时候了。我可能着急忙慌而忘记插电，但它不是一个天大的问题。现在电池的寿命“超过两小时”，我只是不那么在乎了。”

戴尔声称，XPS 13，搭配 56 瓦小时的 4 芯电池，拥有 12 小时的电池寿命。以我的使用经验它已经很好的用过了 10 个小时。我从没有尝试过把电量完全耗完是什么状态。

Torvalds 也没有遇到 Intel 的 Wi-Fi 设备问题。非开发者版使用 Broadcom 的芯片设备，已经被 Windows 和 Linux 用户发现了一些问题。戴尔的技术支持对于我来解决这些问题非常有帮助。

一些用户在使用 XPS 13 触摸板的时候，遇到了问题。Torvalds 和我都几乎没有什么困扰。Torvalds 写到，“XPS13 触摸板对于我来说运行的非常好。这可能只是个人喜好，但它操作起来比较流畅，响应比较快。”

不过，尽管 Torvalds 喜欢 XPS 13，他同时也钟情于最新版的联想 X1 Carbon、惠普 Spectre 13 x360，和去年的联想 Yoga 900。至于我？我喜欢 XPS 13 开发者版。至于价钱，我以前测评过的型号是 $1949.99，可能刷你的信用卡就够了。

因此，如果你希望像世界上顶级的程序员之一一样开发的话，Dell XPS 13 开发者版对得起它的价格。

--------------------------------------------------------------------------------

via: http://www.zdnet.com/article/linus-torvalds-reveals-his-favorite-programming-laptop/

作者：[Steven J. Vaughan-Nichols][a]
译者：[yangmingming](https://github.com/yangmingming)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.zdnet.com/meet-the-team/us/steven-j-vaughan-nichols/
[1]: https://plus.google.com/+LinusTorvalds/posts/VZj8vxXdtfe
[2]: http://www.zdnet.com/article/the-best-chromebook-ever-the-chromebook-pixel-2015/
[3]: http://www.zdnet.com/product/apple-15-inch-macbook-pro-with-retina-display-mid-2015/
[4]: https://www.gnome.org/
[5]: https://plus.google.com/+LinusTorvalds/posts/d7nfnWSXjfD
[6]: http://www.zdnet.com/article/linus-torvalds-finds-gnome-3-4-to-be-a-total-user-experience-design-failure/
[7]: http://www.zdnet.com/article/how-to-customise-your-linux-desktop-cinnamon/
