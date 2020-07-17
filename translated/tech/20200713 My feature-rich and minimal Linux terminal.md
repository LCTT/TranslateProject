[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (My feature-rich and minimal Linux terminal)
[#]: via: (https://opensource.com/article/20/7/minimal-linux-terminal)
[#]: author: (Sumantro Mukherjee https://opensource.com/users/sumantro)

我功能丰富又最小的 Linux 终端
======
这些应用和主题帮助我的终端变成自己的。
![Digital images of a computer desktop][1]

每个人都喜欢以特定的方式设置他们的工作区；它可以帮助你提高效率，并使生活变得更轻松，它以一种有机的方式组织事物，并有一个对你有利的环境。这也绝对适用于终端。这可能就是为什么有这么多可用终端的原因。

在使用新的计算机时，我要做的第一件事是将终端设置为我自己的。

我最喜欢的终端应用是 [terminator][2]，因为它的设计极简，并且内置了窗口选项。但从这里开始变得更加复杂。我将自己喜欢的终端风格描述为“功能丰富，但保持最小化”。这种平衡是我经常要调整的。

我使用 zsh 作为默认 shell，而 Ohmyzsh 提供了额外的功能。可以下载它的安装脚本来安装 Ohmyzsh：


```
$ curl -fsSL \
<https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh> \
\--output install-zsh.sh
```

查看一遍脚本了解它做什么，并确保你有信心在计算机上运行该脚本。完成后，运行脚本：


```
`$ sh ./install-zsh.sh`
```

我最喜欢的主题/提示是 [Powerlevel 10k][3]，它是我环境的极其详细的视图。它包括一切，从命令高亮到运行时的时间戳。所有细节都集成到一个优雅的、上下文感知的提示中。上下文感知这里有两个好处，这里和下面的，作者可以在这里提供更多的信息，以了解这意味着什么以及为什么在终端中这是一件好事吗？

要安装 Powerlevel10k，请先在 `.oh-my-zsh/` 自定义主题目录中下载源码。


```
git clone --depth=1 <https://github.com/romkatv/powerlevel10k.git>
${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
```

但是，为了让 Powerlevel10k 看起来像仓库中所示，我们需要添加一些默认不包括的字体。它们是：

  * [MesloLGS NF Regular.ttf][4]
  * [MesloLGS NF Bold.ttf][5]
  * [MesloLGS NF Italic.ttf][6]
  * [MesloLGS NF Bold Italic.ttf][7]



这将产生一个美观且上下文感知的终端（如 [screenfetch][8] 所示）

![terminator terminal shot via screenFetch ][9]

我已经习惯了这个特殊的设置，但是，尽管重要的是让你的工作环境成为你自己的，但这也并不是一个固执地尝试新事物的理由。为了满足新一代用户的需求，出现了新的终端。这意味着，即使一开始不熟悉，与以前的备用终端相比，新开发的终端可能更适合于当今的环境和职责。

我最近一直在考虑其他选择。我开始观察 [Starship][10] 的开发情况，它将自己描述为对任何 shell 来说都是最小的、快速的、可无限自定义的提示。它仍然有许多沉浸式的视觉细节，而不会像 Powerlevel10k 那样使人分心。

你最喜欢的终端是什么？为什么？请在评论栏分享！

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/minimal-linux-terminal

作者：[Sumantro Mukherjee][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

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
