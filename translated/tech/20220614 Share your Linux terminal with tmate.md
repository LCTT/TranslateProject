[#]: subject: "Share your Linux terminal with tmate"
[#]: via: "https://opensource.com/article/22/6/share-linux-terminal-tmate"
[#]: author: "Sumantro Mukherjee https://opensource.com/users/sumantro"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "turbokernel"
[#]: publisher: " "
[#]: url: " "

使用 tmate 分享你的 Linux 终端
======
Tmate 增加了你与 Linux 终端共享会话的选择。

![Terminal command prompt on orange background][1]

图片提供: [iradaturrahmat][2] 通过 [Pixabay][3]，CC0

作为 Fedora Linux QA 团队的一员，有时我发现自己执行了一堆想广播给其他开发者的命令。如果你曾经使用过类似 [tmux][5] 或 [GNU Screen][6] 这样的[终端复用器][4]，你可能会认为这是一个相对容易的任务。但并不是所有想看我演示的人都是通过笔记本电脑或台式机连接到我的终端会话的。有些人可能是随时从他们的手机浏览器中打开的，他们可以很容易地做到这一点，因为我使用了[tmate][7]。

### 使用 tmate 共享 Linux终端

观摩别人在 Linux 终端工作是非常有教育意义的。你可以学到新的命令，新的工作流程，或者新的调试和自动化的方法。但要记录到你所看到的东西，以便后续的自行尝试，这可能很困难。你可能会依赖于截图或共享终端会话的屏幕记录，这样你就可以在以后打出每个命令。唯一的选择是由演示命令的人使用 [Asciinema][8] 或 [script 和 scriptreplay][9] 等工具来记录会话。

通过 tmate，用户仅需在只读模式下或通过 SSH 共享一个终端。SSH 和只读会话都可以通过终端或以 HTML 网页的形式访问。

当我为 Fedora QA 团队培训人员时，我使用只读模式，因为我需要运行命令并显示输出，但有了 tmate，人们可以通过从他们的浏览器复制和粘贴到文本编辑器来保持笔记。

### Linux tmate 入门

在 Linux 上，你可以通过包管理器安装 tmate。例如，在 Fedora 上：

```
$ sudo dnf install tmate
```

在 Debian 系列的发行版上：

```
$ sudo apt install tmate
```

在 macOS 上，你可以用 [Homebrew][10] 或 [MacPorts][11] 安装它。如果你需要其他 Linux 发行版的说明，请参考[安装][12]指南。

![Screenshot of terminal showing the options for tmate sharing: web session (regular and read-only) and ssh session (regular and read-only)][13]

安装后，启动 tmate：

```
$ tmate
```

当 tmate 启动时，会产生链接，通过 HTTP 和 SSH 提供对终端会话的访问。每个协议都有一个只读选项以及一个反向的 SSH 会话。

下面是一个网络会话的样子：

![Screenshot showing tmate terminal window and 2 versions of sharing sessions demonstrating the same code][14]

Tmate 的网络控制台是 HTML5 的，因此，用户可以复制整个屏幕并粘贴到终端来运行相同的命令。

### 保持会话活跃

你可能想知道如果不小心关闭了你的终端会发生什么。你也可能想知道如何与不同的控制台应用共享你的终端。毕竟，tmate 是一个多路复用器，所以它应该能够保持会话活跃，脱离并重新连接到一个会话，等等。

当然，这正是 tmate 所能做到的。如果你曾经使用过 tmux，这可能是相当熟悉的。

```
$ tmate -F -n web new-session vi console
```

这个命令在 Vi 中打开了 `new-session`，`-F` 选项确保会话在关闭时也能重新开启。

![A screenshot of the terminal showing the output after using the new-session and -F options: connection information for either a web session (regular or read-only) or ssh session (regular or read-only)][15]

### 社交复用

Tmate 给你带来了自由的 tmux 或 GNU Screen ，以及与他人共享会话的能力。对于教其他用户如何使用终端，演示一个新命令的功能，或调试意外的行为，这是一个有价值的工具。它是开源的，所以请试一试！

图片提供（Sumantro Mukherjee，CC BY-SA 4.0）

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/6/share-linux-terminal-tmate

作者：[Sumantro Mukherjee][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[turbokernel](https://github.com/turbokernel)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sumantro
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/terminal_command_linux_desktop_code.jpg
[2]: https://pixabay.com/en/users/iradaturrahmat-3964359/
[3]: https://pixabay.com/en/ubuntu-computer-program-interface-3145957/
[4]: https://opensource.com/article/21/5/linux-terminal-multiplexer
[5]: https://opensource.com/downloads/tmux-cheat-sheet
[6]: https://opensource.com/article/17/3/introduction-gnu-screen
[7]: https://tmate.io/
[8]: https://opensource.com/article/22/1/record-your-terminal-session-asciinema
[9]: https://www.redhat.com/sysadmin/record-terminal-script-scriptreplay
[10]: https://opensource.com/article/20/6/homebrew-mac
[11]: https://opensource.com/article/20/11/macports
[12]: https://tmate.io/
[13]: https://opensource.com/sites/default/files/2022-06/install%20tmate_0.png
[14]: https://opensource.com/sites/default/files/2022-06/tmate%20web%20session.png
[15]: https://opensource.com/sites/default/files/2022-06/tmate%20keeping%20session%20alive.png
