[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12439-1.html)
[#]: subject: (My feature-rich and minimal Linux terminal)
[#]: via: (https://opensource.com/article/20/7/minimal-linux-terminal)
[#]: author: (Sumantro Mukherjee https://opensource.com/users/sumantro)

我的功能丰富却又保持简约的 Linux 终端
======

> 这些应用和主题可以你真正拥有你的终端。

![](https://img.linux.net.cn/data/attachment/album/202007/22/123206g5t5mmz5ozdt5f5m.jpg)

每个人都喜欢以特定的方式设置他们的工作区：它可以帮助你提高效率，并使生活更容易以一种感觉有机的方式组织事物，并拥有一个对你来说感觉良好的环境。这也绝对适用于终端。这可能就是为什么有这么多可用终端的原因。

在使用新的计算机时，我做的第一件事就是设置我的终端，让它成为我自己的终端。

我最喜欢的终端应用是 [Terminator][2]，因为它的设计简约，并且内置了窗口选项。但从这里开始变得更加复杂。我将自己喜欢的终端风格描述为“功能丰富却又保持简约”。这种平衡是我经常在微调的。

我使用 zsh 作为默认 shell，并使用 Ohmyzsh 来提供额外的功能。可以下载它的安装脚本来安装 Ohmyzsh：

```
$ curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh --output install-zsh.sh
```

查看一遍脚本了解它做什么，并确保你有信心在计算机上运行该脚本。完成后，运行脚本：

```
$ sh ./install-zsh.sh
```

我最喜欢的主题/提示符是 [Powerlevel 10k][3]，它是一个非常详细的环境视图。它包含了从命令的颜色高亮到运行时间的时间戳等所有内容。所有细节都集成到一个优雅的、具有上下文感知的提示符中。

要安装 Powerlevel10k，请先在 `.oh-my-zsh/` 自定义主题目录中下载源码。

```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git
${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
```

但是，为了让 Powerlevel10k 看起来如其存储库中所示，我们需要添加一些默认不包括的字体。它们是：

  * [MesloLGS NF Regular.ttf][4]
  * [MesloLGS NF Bold.ttf][5]
  * [MesloLGS NF Italic.ttf][6]
  * [MesloLGS NF Bold Italic.ttf][7]

这将产生一个美观且具有上下文感知的终端（如 [screenfetch][8] 所示）：

![terminator terminal shot via screenFetch][9]

我已经习惯了这个特殊的设置，但是，把工作环境变成自己的环境固然重要，但这也并不是一个固执地尝试新事物的理由。新终端的出现，是为了满足新一代用户的需求和要求。这意味着，即使一开始不熟悉，但最近开发的一种终端可能比你的老旧备用机更适合当今的环境和职责。

我最近一直在考虑其他选择。我开始关注 [Starship][10] 的开发情况，它将自己描述为简约的、快速的、可无限定制的提示符，适用于任何 shell。它仍然有很多在视觉上可以身临其境的细节，而不会像 Powerlevel10k 那样使人分心。

你最喜欢的终端是什么？为什么？请在评论栏分享！

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/minimal-linux-terminal

作者：[Sumantro Mukherjee][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sumantro
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_desk_home_laptop_browser.png?itok=Y3UVpY0l (Digital images of a computer desktop)
[2]: https://terminator-gtk3.readthedocs.io/en/latest/
[3]: https://github.com/romkatv/powerlevel10k
[4]: https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
[5]: https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
[6]: https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
[7]: https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
[8]: https://github.com/KittyKatt/screenFetch
[9]: https://opensource.com/sites/default/files/uploads/osdc00_edit.png (terminator terminal shot via screenFetch )
[10]: https://starship.rs/
