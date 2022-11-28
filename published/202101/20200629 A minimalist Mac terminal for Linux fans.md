[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12999-1.html)
[#]: subject: (A minimalist Mac terminal for Linux fans)
[#]: via: (https://opensource.com/article/20/6/iterm2-mac)
[#]: author: (Lisa Seelye https://opensource.com/users/lisa)

为 Linux 爱好者打造的极简 Mac 终端
======

> 以下是我如何通过很多微妙复杂的方式来保持终端的简单和我的点文件的安全。

![咖啡和笔记本][1]

我要向大家坦白。我成为 Mac 用户已经有 10 多年了。起初，鉴于我强大的 Linux 背景，我觉得有点惭愧，但 Mac 给了我一个类似 Unix 的 Shell 和一个伟大的窗口管理器。因为这段历史，我有一个合二为一的功能，它运行在 macOS 上，但又为 Linux 用户所熟悉。没有理由它不能移植到 Linux 上（而且它已经移植了！）。

### 在 Mac 上使用 iTerm2

很长时间以来，我首选的终端是基本的内置 Term.app，但我最近改用了 [iTerm2][2]，因为它有更好的自定义和配置文件支持。对我来说，它的一个主要优点是可以轻松地在 Mac 之间移植配置。对于日常使用，我更喜欢 Solarized Dark 主题；但对于演示文稿，我有一个单独的配置文件，可以放大文本，并使用色彩更鲜艳的纯黑色背景。

要使 iTerm2 可用，我首先要做的是配置 `Ctrl+Left` 和 `Ctrl+Right` 箭头，使其尊重经典的终端行为，即跳转到单词边界的开始和结束。要做到这一点，请导航到 “Preferences > Profiles > Your Profile > Keys” 并输入以下内容：

  * 键盘快捷键：`^←`
  * 行动：发送 Escape 序列
  * Esc+：`b`

然后是另一个：

  * 键盘快捷键：`^→`
  * 行动：发送 Escape 序列
  * Esc+：`f`

了解更多关于 [iTerm2][3] 的内容，享受自定义体验。

### 一个简单的命令提示符

我是那种无聊的终端提示符用户。我不想在其中包含 Git 目录或退出代码，我也只用单行提示符。我唯一使用的花哨组件是 [kubectx][4] ，它包括当前的 Kubernetes 上下文。作为一位 [OpenShift Dedicated][5] 的站点可靠性工程师（SRE），我必须在运行命令时有相应的上下文，而 `kubectx` 让我在打字时很容易知道自己在哪里。所以，我的 Bash PS1 就是无聊的 `username@host cwd $`，免除了 Kubernetes 上下文前缀。（LCTT 译注：如果想将 Kubernetes 上下文和名字空间显示在 PS1，可以看看 [kube-ps1](https://github.com/jonmosco/kube-ps1)。）

毫无疑问，与我见过的一些花哨的终端相比，我是偏向于极简的。有些人喜欢透明背景，有些人则喜欢他们的提示符上有很多信息 —— 从时间到退出代码以及其他一切。我觉得这些在我的终端上会让人分心，所以我很喜欢远离的那些设置。

### 精美复杂的点文件

与我的极简主义终端相比，很容易看出我在哪里投入了最大的努力：部署我的[点文件][6]，包括我的 `.bash_profile` 和我的整体 Mac 设置。

我使用通过 GitHub 托管的 [一系列 Makefile][7] 来管理我的 Mac 设置。这将会拉取我的[点文件专用部署机制][8]，它也在 GitHub 上。你要问为什么要围绕安全做这些工具？IT 专业人士和业余爱好者都需要一种强大的方式来将安全的数据片段放在新系统上。也许你想要你的 SSH 配置是隐藏的，或者你通过第三方系统部署凭证。我发现把我的安全数据和其他一切数据放在一起是很有用的，我用 [Ansible Vault][9] 解决了这个问题。我所有的机密信息都存储在 Git 中，用 Ansible Vault 加密。解密是用 Makefile 处理的。

无论是第一次安装还是更新现有的点文件，我（当然）都必须有 Ansible Vault，为了避免到处安装，我把它放在一个用 Docker 运行的容器里，这样我就到处都安装好了。我把解密口令放到一个文件中， `run make`，然后用 `make clean` 清理一切。你可以通过[探索这些点文件][8]来了解更多）。

我想说的是，这种管理方案可能过于夸张，而有些人喜欢复杂的终端提示。所以，也许在权衡之下，一切都会变得平衡。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/iterm2-mac

作者：[Lisa Seelye][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/lisa
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_cafe_brew_laptop_desktop.jpg?itok=G-n1o1-o (Coffee and laptop)
[2]: https://www.iterm2.com/
[3]: https://www.iterm2.com/documentation.html
[4]: https://github.com/ahmetb/kubectx
[5]: https://www.openshift.com/products/dedicated/
[6]: https://opensource.com/article/19/3/move-your-dotfiles-version-control
[7]: https://github.com/lisa/mac-setup
[8]: https://github.com/lisa/dotrc
[9]: https://docs.ansible.com/ansible/latest/user_guide/vault.html
