[#]: subject: "5 Things elementary OS 6 Should Improve for a Better Linux Desktop Experience"
[#]: via: "https://news.itsfoss.com/elementary-os-6-things-to-improve/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14120-1.html"

elementary OS 6 应该改进体验的 5 个地方
======

> elementary OS 是一个漂亮的 Linux 发行版，但它适合所有人吗？它们是否有可以做得更好的地方？下面是我的想法。

![](https://i1.wp.com/news.itsfoss.com/wp-content/uploads/2021/12/elementary-os-opinion.png?w=1200&ssl=1)

[elementary OS 的 6.1 是最新的版本][1]，它做了许多基本的改进，带来了一些新功能。

当然，为你的系统选择的 Linux 发行版在很多方面都是不同的。然而，我认为在 elementary OS 中，有一些事情可以做得更好。

在这里，我列出了 elementary OS 中可以做的一些改进。

不过，这仅代表我个人观点，请诸位轻喷。

### elementary OS 中可以改进的东西

如果你想看的话，我也打算指出其他发行版的我不喜欢东西（从这篇开始）。

发行版通常仅展示其好的一面，除非有人指出一个发行版中潜在的细微差别，否则你无法真正确定这个发行版是否适合你。

#### 1、没有内置的 Debian 软件包安装程序

![][2]

它是一个基于 Ubuntu 的发行版，但下载一个 deb 文件后才发现无法安装，还得让你寻找解决方案。

这当然是有原因的，因为 elementary OS 在 [elementary OS 6 发布][3] 时切换到了只使用 Flatpak 的模式，即使是对于第一方的应用程序也是如此。

然而，新用户很可能不知道像 Eddy 这样的解决方案，它是一个 Debian 软件包安装程序，可以在 AppCenter 中找到。

当你尝试安装 deb 包时，指向该工具的通知/提示应该说明清楚。或者，预下安装 Eddy 应该会让事情变得更方便。

#### 2、Flathub 支持开箱即用

![][4]

Flatpak 优先的方法使安装软件更加安全和方便。然而，你不能通过 Flathub 安装 Flatpak 应用程序，除非你（使用终端）手动添加了第三方 Flatpak 仓库。

即使 AppCenter 提供了 Flatpak 应用程序，但它可能不足以满足所有用户的需要。相比之下，Flathub 提供了大量的 Flatpak 应用程序。

虽然提供第一方的体验，并且让用户能够在需要时启用第三方（Flathub）是件好事，但是否可以做些什么来轻松启用 Flathub 的支持，而无需去终端？（忽略 flatpak 的参考文件）

![][5]

好吧，我认为用一个快速切换开关来启用/禁用开箱即用的 Flathub 支持可以使事情变得更好。

或者，像你在上面的截图中注意到的那样，在建议启用 Flathub 的同时提到该命令。

#### 3、最小化按钮

![][6]

考虑到 elementary OS 没有像 Pop!_OS 那样的自动平铺窗口功能，许多应用程序上缺少最小化按钮可能会让人觉得令人不适。

是的，你可以利用键盘上的快捷键 `Super+H` 来隐藏/最小化窗口。然而，对于以鼠标操作为主的用户来说，没有最小化按钮的感觉并不舒服。

#### 4、没有系统托盘支持

![][7]

根据他们的设计选择，elementary OS 团队认为最好不要有系统托盘的支持（或者是我从 Reddit 的一些帖子中了解到的情况）。

不幸的是，系统托盘的图标对于快速访问和关注某事物的状态非常有用。

例如，我可以从应用指示器图标中快速访问 Flameshot 截图工具，在使用 Insync 等工具时检查同步状态，当 Slack 中有我的信息时也会得到通知。

而如果没有系统托盘图标的整合支持，我就不能做这些事情，这是一个缺陷。

#### 5、一个单独的 NVIDIA ISO

![][8]

单独的 NVIDIA ISO（或 Nvidia 显卡安装模式）比通过软件中心安装专有的 Nvidia 驱动程序要方便得多。

当然，我在使用 AppCenter 安装 Nvidia 驱动时没有任何问题。但是，有了单独的 ISO，你就省去了安装后的额外步骤。

### 总结

每个操作系统都有缺陷，Linux 发行版也不例外。

有时这些细微的差别是根据其目标用户设计出来的。你可能喜欢也可能不喜欢一个发行版所做的一切，这就是为什么要知道它们能否做得更好（或是否适合你）。

elementary OS 无疑是 [最漂亮的 Linux 发行版之一][9]。但是，它适合你吗？

好吧，如果我提到的一些观点是你不在意的，那它对你来说应该是很好的体验。

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/elementary-os-6-things-to-improve/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/elementary-os-6-1-release/
[2]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2021/12/Screenshot-from-2021-12-17-12.16.32.png?w=941&ssl=1
[3]: https://news.itsfoss.com/elementary-os-6-release/
[4]: https://i1.wp.com/news.itsfoss.com/wp-content/uploads/2021/12/Screenshot-from-2021-12-17-12.16.01.png?w=942&ssl=1
[5]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2021/12/elementary-flathub-add.png?w=964&ssl=1
[6]: https://i1.wp.com/news.itsfoss.com/wp-content/uploads/2021/12/minimize-button-elementary-os.png?w=1015&ssl=1
[7]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2021/12/elementary-os-system-tray.png?w=392&ssl=1
[8]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2021/12/elementary-os-nvidia-driver.png?w=944&ssl=1
[9]: https://itsfoss.com/beautiful-linux-distributions/
