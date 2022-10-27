[#]: subject: "GitUI: A Blazing Fast Terminal Client for Git Written in Rust"
[#]: via: "https://itsfoss.com/gitui/"
[#]: author: "Marco Carmona https://itsfoss.com/author/marco/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13922-1.html"

GitUI: 用 Rust 编写的 Git 的快速命令行客户端
======

![](https://img.linux.net.cn/data/attachment/album/202110/26/111605achvngqr6ix6vv0p.jpg)

[基本的 Git 命令][1] 对于通常的克隆、添加、提交推送已经足够好了。

但如果你在一个有多个贡献者的大型项目上工作，你可能需要将事情可视化。GUI 工具可以让你更好地了解 `diff`、`stash` 和 `blame` 的情况。

但是，如果你常用终端，又想要 Git 的舒适性，我为你准备了一个好工具。

它叫 GitUI，它提供了类似于 Git GUI 的用户体验和舒适度，但就在你的终端中。它是可移植的、快速的、自由而开源的。

### GitUI：一个基于终端的 Git 工具

[GitUI][2] 并不是第一个用于 Linux 终端的 Git 客户端。那么，是什么让 GitUI 与其他类似项目如 [lazygit][3] 或 [tig][4] 不同？

GitUI 的开发者在项目的 README 文件中分享了一些基准数据。

名称 | 时间 |内存（GB）| 二进制（MB）| 冻结 | 崩溃
---|---|---|---|---|---
gitui | 24 s | 0.17 | 1.4 | 否 | 否
lazygit | 57 s | 2.6 | 16 | 是 | 有时
tig | 4 m 20 s | 1.3 | 0.6 | 有时 | 否

*GitUI、LazyGit 和 Tig 之间的比较。*

这种优化大部分来自于 Rust 语言的使用。

**注意：该程序处于早期开发阶段，还没有为生产做好准备。**

### 在 Linux 上安装 GitUI

不用说，你应该已经 [在你的系统上安装了 Git][5]。

要使用 GitUI，首先需要 [为你的 Linux 发行版安装 Rust 支持][6]。

在终端中，使用以下命令：

```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

![Installing Rust on Linux][7]

当你被要求选择时，请选择选项 1。当脚本完成安装后，用这个命令正确设置配置：

```
source $HOME/.cargo/env
```

现在你已经安装了 Rust 和它的包管理器 Cargo，使用 Cargo 命令来安装 GitUI：

```
cargo install gitui
```

然后你就可以使用 GitUI了，只需在终端输入 `gitui` 就可以运行了。我做了一些示例文件来测试 Git 和 GitUI。

![Starting gitui on terminal][8]

值得一提的是，这个界面有一个快速而直观的纯键盘控制。一切都很简单，只需输入正确的字母即可将文件暂存、提交、分支或推送到 git 仓库中。

真正让我兴奋的是，你不仅可以做之前的四个动作，还可以**编辑**每个文件，**拉取**它，**追溯** 它，在其中**导航**等等，这一切都无需退出界面。 很棒，不是吗？

![More functions inside the interface][9]

祝贺你! 现在你知道了如何安装 GitUI 以及它在你的终端中的样子。

如果你喜欢这个项目，请在 [GitHub][2] 上点赞它的仓库。如果你使用其他工具来管理 Git，请在评论区提出你的建议。

--------------------------------------------------------------------------------

via: https://itsfoss.com/gitui/

作者：[Marco Carmona][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/marco/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/basic-git-commands-cheat-sheet/
[2]: https://github.com/Extrawurst/gitui
[3]: https://github.com/jesseduffield/lazygit
[4]: https://jonas.github.io/tig/
[5]: https://itsfoss.com/install-git-ubuntu/
[6]: https://itsfoss.com/install-rust-cargo-ubuntu-linux/
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/Installing-Rust-step-1.png?resize=800%2C471&ssl=1
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/Starting-GitUI-on-terminal.png?resize=800%2C471&ssl=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/More-functions-inside-the-interface.png?resize=800%2C471&ssl=1
