[#]: subject: "7 Things I Want to See in Ubuntu 22.04 LTS [I Know I Won’t Get it]"
[#]: via: "https://news.itsfoss.com/things-i-want-ubuntu-22-04-lts/"
[#]: author: "Jacob Crume https://news.itsfoss.com/author/jacob/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14304-1.html"

7 个我希望在 Ubuntu 22.04 LTS 看到的变化
======

> Ubuntu 22.04 即将面世。但是，你对它的发布有什么期望？在这里，我分享一些我希望看到的东西。

![](https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/02/ubuntu-22-04-things-i-want.jpg?w=1200&ssl=1)

随着 Ubuntu 22.04 LTS 的到来，我们都在急切地等待着体验 [Ubuntu 22.04 引入的功能][1]。

在没有对 Ubuntu 22.04 进行全面亲身体验的情况下，我不能确定它是否令人印象深刻。但是，我确实对我想在 Ubuntu 22.04 中看到的东西有一些想法。

现在提出一些修改要求可能有点太晚了，但我还是希望能有最好的结果。

一些重点包括：

### 1、在所有的应用程序中保持一致的主题形象

![][2]

任何试图在 Ubuntu 上安装 KDE 应用的人都会知道，主题不一致的情况比比皆是。更糟糕的是，Libadwaita 的加入只会让更多的应用程序显得格格不入。

为了解决这个问题，我认为需要一个替代解决方案组合。

首先，默认采用 Ubuntu 的 Yaru 主题的定制 Libadwaita 将使几乎所有为 Gnome 和 GTK 构建的应用程序再次保持一致。然而，这仍然不能解决 Qt/KDE 应用程序的问题。

对于这些，需要一个类似于 [Kvantum][3] 的解决方案。尽管 Kvantum 有点“难”，但我真的相信，一个有 Canonical（Ubuntu 的母公司）全力支持的解决方案能够克服 Kvantum 所面临的所有挑战。

Ubuntu 的外观和感觉是其决定性的特征之一，关键是要在每个应用程序中保持这种外观，以确保其视觉吸引力。

### 2、使用 GNOME 40 中引入的水平停靠区

![][3a]

尽管有些激进，[Gnome 40][4] 是 Gnome 向未来的一次飞跃，有几个令人兴奋的功能。然而，这些创新的功能中有许多并没有进入 Ubuntu 22.10。

其中最值得注意的是水平停靠区。对我来说，我发现它极大地提高了我的工作效率，因为我不必再像以前那样把鼠标移到屏幕的左边。我相信很多 Ubuntu 用户同意我的观点，但是 Canonical 坚持认为左边的位置是最好的。

我不是说他们应该把停靠区移到底部，这毕竟是 Ubuntu 的一个决定性特征，只是给用户一个这样的选择而已。Ubuntu 在设置程序中已经有一个自定义“外观”部分，所以我认为在那里增加一个简单的切换开关不会太难。

### 3、找回混合主题

![][5]

升级到 Ubuntu 21.10 后，我很失望地发现 [混合主题选项消失了][6]。虽然这只是个小问题，但我确实发现自己很怀念这个选项，并不断地想办法把它找回来。

我认为，让用户有能力轻松地定制他们的桌面是很重要的，把这个选项带回来对改善这个问题有很大的帮助。

我理解他们想摆脱它是因为 Ubuntu 和 GNOME 默认主题颜色的冲突。但是，我喜欢它原来的样子。

### 4、改造后的软件中心

![][7]

随着 Canonical 不断推动人们使用 snap 应用程序（一种与所有发行版兼容的通用打包格式），创建一个新的软件中心将是有意义的。

虽然 Snap 商店已经存在，但它只是 Gnome 软件的一个复刻，而它以其速度慢和 bug 多而出名。

随着 [Gnome 41][8] 的发布，这一点在一定程度上得到了缓解，尽管这些改进不太可能被包含在 Ubuntu 22.04 中。

如果有一个新的软件中心诞生，或者现有的软件中心得到重大改造，我将会很高兴。

如果 Ubuntu 要推出一个新的应用程序商店，它可能会使用 Flutter 来构建，就像他们的新安装程序。虽然我个人并不喜欢 Ubuntu 开始转向 Flutter 的决定，但这将有助于确保其所有变体的一致性。

### 5、改进的自定义选项

有些人喜欢保持简单，而有些人则喜欢自定义选项来改变外观/感觉。

Ubuntu 22.04 LTS 不需要引入任何疯狂的东西，但是简单地在默认情况下增加一些额外的控制，你可以在 [GNOME 调整][9] 中找到，应该可以做到这一点。

目前，外观调整是相当有限的，我们可以使用更多的选项。

### 6、让 Snap 应用程序少一些

![][9a]

我知道，我知道。Snap 应用程序无处不在，而且它们与多个发行版兼容。但是，它们的速度也更慢，而且只能从专有的 Snap 商店安装。

当然，你可以选择 Flatpak 和预建的二进制文件。但是，Snap 的专有方式仍然是许多用户不喜欢的。

另一方面，Ubuntu 的原生 [Apt 软件包管理器][10] 速度更快，而且有更多的应用程序可用。这导致了用户体验的明显改善，尽管这种改善在各发行版中并不连续。

不幸的是，Snap 实际上是由 Ubuntu 背后的同一个团队开发的，所以删除它是相当不可能的。

### 7、卸载应用程序的统一方式

Ubuntu 在为终端用户提供便利方面有着很好的声誉。

为了对抗 Linux 软件包的碎片化，Ubuntu 能否引入一种轻松卸载应用程序的方法，无论是 Flatpak/Deb/Snap？

考虑到外面有各种各样的软件包，现在是时候让我们有一个处理所有软件包的单一解决方案了。

![][10a]

在 Ubuntu 22.04 LTS 中不太可能看到它的解决方案，但我希望在下一个版本中能做到！

### 总结

很明显，你可能不会看到所有这些期望的事情在下一个版本中发生。然而，即使 Ubuntu 22.04 LTS 在这个方向上做了一些努力，我们也有希望在未来的版本中看到它们。

你希望在 Ubuntu 22.04 中看到哪些新功能？请在下面的评论中告诉我们！

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/things-i-want-ubuntu-22-04-lts/

作者：[Jacob Crume][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/jacob/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/ubuntu-22-04-release-features/
[2]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2021/06/ubuntu-dark-light-theme.png?w=1200&ssl=1
[3]: https://github.com/tsujan/Kvantum
[3a]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/02/gnome-42-ft.jpg?w=1200&ssl=1
[4]: https://news.itsfoss.com/gnome-40-release/
[5]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2021/06/ubuntu-yaru-standard-theme.png?resize=1568%2C1074&ssl=1
[6]: https://news.itsfoss.com/ubuntu-21-10-theme-change/
[7]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/01/sign-in-ubuntu-software-center.png?resize=1568%2C836&ssl=1
[8]: https://news.itsfoss.com/gnome-41-release/
[9]: https://itsfoss.com/gnome-tweak-tool/
[9a]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2021/09/firefox-snap-default.jpg?w=1200&ssl=1
[10]: https://itsfoss.com/apt-command-guide/
[10a]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/01/Remove-application-option-gnome.png?w=800&ssl=1