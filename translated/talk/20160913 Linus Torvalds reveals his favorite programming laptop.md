Linus Torvalds 透漏他最喜欢的编程使用的笔记本
====

>是戴尔 XPS 13 开发版。下面就是原因。

我最近和一些 Linux 开发者讨论了对于严谨的程序员来说，最好的笔记本是什么样的问题。结果，我从这些程序员的观点中筛选出了多款笔记本电脑。在我的书上的赢家是谁呢？就是戴尔 XPS 13 开发版。我在一家好的公司。Linus Torvalds —— Linux的缔造者 —— 也认同这个观点。对于他来说，戴尔 XPS 13 开发版是他周围最好的笔记本电脑了。

![](http://zdnet3.cbsistatic.com/hub/i/r/2016/07/18/702609c3-db38-4603-9f5f-4dcc3d71b140/resize/770xauto/50a8ba1c2acb1f0994aec2115d2e55ce/2016-dell-xps-13.jpg)

Torvald's 的说法，可能和你的想法不同。

在 Google+ 上，Torvalds解释道，“第一：[我从来不把笔记本当成台式机的替代品][1]，并且，我每年旅游不了几次。对于我来说，笔记本是有专门用途的，而不是每日（或者每周）都要使用，因此，主要的标准不是类似于“平均每天使用”，而是非常适合于旅游时使用。

因此，对于 Torvalds 来说，“我最后比较关心的一点是它是相当的小和轻，因为在会议上我可能一整天都需要带着它。我同样需要一个好的屏幕，因为到目前为止，我主要是在桌子上使用它，我希望文字的显示，小而且清晰。”

戴尔的显示器是由 Intel's Iris 540 GPU 提供的。在我的印象中，这款GPU非常的不错。

Iris 提供了 13.3 英寸的 3,200×1,800 的显示屏。每英寸有280像素，比我喜欢的[2015年的 Chromebook Pixel][2]多了40个像素，比[MacBook Pro with Retina][3]多了60个像素。

然而，有了上面说的硬件配置，在[Gnome][4]桌面上玩好也不容易。正如 Torvalds 在另一篇文章解释的那样，它“[和我的桌面电脑有一样的分辨率][5]，但是，显然因为笔记本的显示屏更小，Gnome 桌面似乎自己做决定，所以我需要2倍的自动缩放因子，这样才避免所有愚蠢的事情（例如窗口显示，图标等）。

解决方案？你可以忘掉对于用户界面的期待。你需要在shell下运行：gsettings 设置 org.gnome.desktop.interface 的缩放因子为1。

Torvalds 或许使用 Gnome 桌面，但是他不是很喜欢 Gnome 3.x 系列。我不是很赞同他。这就是为什么我使用 [Cinnamon][7] 来代替。

他还希望“一个相当强大的 CPU，因为当我旅游的时候，我依旧需要多次编译 Linux 内核。我并不需要像在家那样每次 pull request 都进行一次完整的“make allmodconfig”编译，但是我希望可以比我以前的笔记本多编译几次，实际上，这（也包括屏幕）应该是我想升级的主要原因。

Linus 没有描述他的 XPS 13 的细节，但是我审查单位一个高端机型。它是双核 2.2GHz 的第 6 代英特尔的酷睿 i7-6550U处理器搭载 Skylake 架构，并且 16GBs DDR3 内存，和一个半兆兆位【注：约500M】的PCIe固态硬盘（SSD）。我可以肯定，Torvalds 的系统至少是精良装备。

一些你或许会关注的特征，不在 Torvalds 给出的列表中。

>“我不倾向于关心是触摸屏，因为我的手指相对于我所看到的文字是有大有笨拙（我也无法处理污迹：也许我有特别油腻的手指，但是我真的不想触摸屏幕）。

>我并不十分关心一些“一整天电池寿命”，因为坦率的讲，我不记得上次没有接入电源时什么时候了。我可能不会为了快速检查而打扰它在那儿充电，但它不是一个压倒一切的大问题。等到电池的寿命“超过两小时”，我只是不那么在乎了。

戴尔声称，XPS 13，搭配 56wHR，4 芯电池，拥有12小时的电池寿命。它已经很好的超过了我印象中10个小时电池寿命。我从没有尝试过把电量完全耗完是什么状态。

Torvalds 也不需要担心 Intel 的 Wi-Fi 设置。非开发版使用 Broadcom 的芯片设置，已经被 Windows 和 Linux 用户发现了一些问题。戴尔的技术支持对于我来控制这些问题非常有帮助。

一些用户在使用 XPS 13 触摸板的时候，遇到了问题。Torvalds 和我都几乎没有什么困扰。Torvalds 写到，“XPS13 触摸板对于我来说运行的非常好。这可能只是个人喜好，但它操作起来比较流畅，响应比较快。”

不过，尽管 Torvalds 喜欢 XPS 13,他同时也钟情于最新版的联想 X1 Carbon,惠普 Spectre 13 x360,和去年联想 Yoga 900。至于我，我喜欢 XPS 13 开发版，至于价钱，我以前见到的模型是 $1949.99，可能使用你的信用卡就可以了。

因此，如果你希望像世界上顶级的程序员之一一样开发的话，Dell XPS 13 开发版对得起它的价格。

--------------------------------------------------------------------------------

via: http://www.zdnet.com/article/linus-torvalds-reveals-his-favorite-programming-laptop/

作者：[Steven J. Vaughan-Nichols ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.zdnet.com/meet-the-team/us/steven-j-vaughan-nichols/
[1]: https://plus.google.com/+LinusTorvalds/posts/VZj8vxXdtfe
[2]: http://www.zdnet.com/article/the-best-chromebook-ever-the-chromebook-pixel-2015/
[3]: http://www.zdnet.com/product/apple-15-inch-macbook-pro-with-retina-display-mid-2015/
[4]: https://www.gnome.org/
[5]: https://plus.google.com/+LinusTorvalds/posts/d7nfnWSXjfD
[6]: http://www.zdnet.com/article/linus-torvalds-finds-gnome-3-4-to-be-a-total-user-experience-design-failure/
[7]: http://www.zdnet.com/article/how-to-customise-your-linux-desktop-cinnamon/
