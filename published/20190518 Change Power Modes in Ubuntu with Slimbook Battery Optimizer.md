[#]: collector: (lujun9972)
[#]: translator: (zhs852)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10897-1.html)
[#]: subject: (Change Power Modes in Ubuntu with Slimbook Battery Optimizer)
[#]: via: (https://itsfoss.com/slimbook-battry-optimizer-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

在 Ubuntu 中使用 Slimbook Battery Optimizer 切换电源模式
======

> Slimbook Battery Optimizer 是一个美观实用的指示器小程序，它可以让你在安装了 Linux 的笔记本上快速切换电源模式来延长续航时间。

[Slimbook][1] 是一个销售 [预装 Linux 的笔记本电脑][2] 的西班牙电脑制造商，他们发布了一款好用的小程序，用来在基于 Ubuntu 的 Linux 发行版下调整电池性能。

因为 Slimbook 销售他们自己的 Linux 系统，所以他们制作了一些在 Linux 上用于调整他们自己硬件性能的小工具。Battery Optimizer 就是这样一个工具。

要使用这个实用小程序，你不必购买 Slimbook 的产品，因为 Slimbook 已经将它在 [他们的官方 PPA 源][3] 发行了。

### Slimbook Battery Optimizer 简介

这个程序叫 Slimbook Battery。它是一个常驻顶栏的指示器小程序，使得你可以快速切换电源模式。

![Slimbook Battery Mode Ubuntu][4]

你可能在 Windows 中见过类似的程序。Slimbook Battery 和它们一样，提供了类似的电源计划：

  * 节能：最大程度延长电池续航时间
  * 平衡：性能与节能间的最佳平衡
  * 高性能：最大程度提高性能

你可以在高级模式中配置这些模式：

![配置多种多样的电源模式][5]

如果你觉得你把设置调乱了，你可以用“恢复默认设置”的按钮还原它。

你也可以修改像程序自启或默认电源模式这样的通用设置。

![Slimbook Battery 通用设置][6]

Slimbook 有专门为多种电源管理参数提供的页面。如果你希望自己配置，请参照 [此页][7]。

不过，我认为 Slimbook 的界面需要一些改进。例如，某些页面上的“问题标记”的图标应该改为可点击的，以此提供更多信息。然而，在我写这篇文章时，那个标记仍然无法点击。

总的来说，Slimbook Battery 是一个小巧精美的软件，你可以用它来快速切换电源模式。如果你决定在 Ubuntu 及其衍生发行版上（比如 Linux Mint 或 elementary OS 等），你可以使用官方 [PPA 源][8]。

#### 在基于 Ubuntu 的发行版上安装 Slimbook Battery

打开终端，一步一步地使用以下命令：

```
sudo add-apt-repository ppa:slimbook/slimbook
sudo apt update
sudo apt install slimbookbattery
```

安装好之后，在菜单中搜索 Slimbook Battery：

![启动 Slimbook Battery Optimizer][10]

在你点击它之后，你会发现它出现在了顶栏。你可以在这里选择你希望使用的电源模式。

![Slimbook Battery 电源模式][4]

#### 卸载 Slimbook Battery

如果你不再使用它，你可以通过以下命令来卸载它：

```
sudo apt remove slimbookbattery
sudo add-apt-repository -r ppa:slimbook/slimbook
```

在我看来，这样的应用程序为某些特定的目的服务，这是值得鼓励的。这个工具给了你一条调整电源模式的捷径，和调整性能的更多选项。

你用过 Slimbook Battery 吗？你觉得它如何？

--------------------------------------------------------------------------------

via: https://itsfoss.com/slimbook-battry-optimizer-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[zhs852](https://github.com/zhs852)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://slimbook.es/en/
[2]: https://itsfoss.com/get-linux-laptops/
[3]: https://launchpad.net/~slimbook/+archive/ubuntu/slimbook
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/05/slimbook-battery-mode-ubuntu.jpg?resize=800%2C400&ssl=1
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/05/slimbook-battery-optimizer-2.jpg?ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/05/slimbook-battery-optimizer-1.jpg?ssl=1
[7]: https://slimbook.es/en/tutoriales/aplicaciones-slimbook/398-slimbook-battery-3-application-for-optimize-battery-of-your-laptop
[8]: https://itsfoss.com/ppa-guide/
[9]: https://itsfoss.com/ubuntu-forums-hacked-again/
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/05/slimbook-battery-optimizer.jpg?ssl=1
