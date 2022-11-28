[#]: subject: "Use Linux Terminal on Android Smartphones With These Apps"
[#]: via: "https://itsfoss.com/using-linux-terminal-android/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14286-1.html"

在安卓手机上使用 Linux 终端
======

![](https://img.linux.net.cn/data/attachment/album/202202/19/190329mrnlr1fzkrmeewe5.jpg)

想练习 Linux 命令吗？你不需要为此而安装一个完整的发行版。

有很多 [让你在线使用 Linux 终端的网站][1]。这些网站在桌面上运行良好，但在移动设备上却不适合。

别担心。安卓毕竟是基于 Linux 内核的。有几个应用程序可以让你用你的安卓智能手机练习 Linux 命令，或通过 SSH 连接到远程服务器。

当然，你不应该指望它能取代你在台式机上使用的常规 [Linux 终端仿真器][2]。在安卓上有相当多的这类应用。

为了方便起见，我添加了两个不同的类别，一个涵盖了终端模拟器，另一个是为远程连接功能（SSH）以及终端界面量身定做的。

> 非 FOSS 提醒！
>
> 这里提到的一些应用程序不是开源的，它们都做了适当的提示。它们被涵盖在这里是因为它们可以让你在安卓上使用 Linux 终端。

### Linux 终端仿真器应用

请注意，你需要在你的安卓手机上有 root 权限，才能使用 `ls` 等命令在目录中导航、复制/粘贴、并执行高级操作。

**注意：** 对于大多数应用程序/终端，没有 root 权限你将只限于基本的操作，如测试 ping、更新，以及在支持的地方安装包。

#### 1、Qute 终端仿真器（非 FOSS）

![][3]

[Qute][6] 终端模拟器提供了对你的安卓设备上的内置命令行 Shell 的访问。

你可以在你的智能手机上使用常见的命令，如 `ping`、`trace`、`cd`、`mkdir` 等等。除了一些 [有用的 Linux 命令][4] 之外，你还可以安装 bin 文件和创建 [shell 脚本][5]。

伴随着 bash 脚本编辑器和对已 root 的设备的支持，它应该是一个令人兴奋的选择，可以尝试。

它还提供了启用浅色主题、隐藏键盘、切换语法高亮和其他一些功能。

不幸的是，开发者提到，根据谷歌最新的隐私政策，安卓 11 及更新版本存在一些已知的问题。因此，如果没有一个已 root 的设备，你可能做不了什么。

#### 2、安卓终端仿真器（FOSS）

![][7]

Jack Palevich 的 “[终端仿真器][9]” 是最古老的可用于安卓的 Linux 终端仿真器之一。

你可以使用简单的命令、添加多个窗口，并使用启动器的快捷键进行快速操作。

它最好的地方是没有任何广告和应用内购买选项，也没有干扰性元素。然而，它已经很久没有被维护了，它的 [GitHub 页面][8] 也在 2020 年被归档，这标志着它的开发已经结束。

但即使在目前的状态下，它似乎也对众多用户有用。因此，在否定它之前，你可以试试。

#### 3、Material Terminal（非 FOSS）

![][10]

[Material Terminal][11] 是 “安卓终端仿真器” 的重新换肤版本。

你可以获得相同的功能，有多个窗口、没有广告、基本命令开箱即用，还可以选择在已 root 的设备上安装 Busy Box，以及其他命令行工具。

简单的说，就是前一个选项中的一切，加上一个 Material Design 用户界面。很好，对吗？

### SSH 客户端和 Linux 终端

你想要一个能够使用 SSH 连接的安卓终端仿真器吗？或者，也许只是为 SSH 远程连接而定制？

这里有一些选择：

#### 4、Termux（FOSS）

![][12]

[Termux][17] 是一个相当流行的可用于安卓的终端仿真器。它有一个全面的软件包集合，让你体验 bash 和 zsh。

如果你有 root 权限，你还可以 [用 nnn 管理文件][13]，并用 `nano`、`vim` 或 `emacs` 来编辑文件。用户界面除了终端外没有其他东西。

你还可以 [使用 SSH 访问服务器][14]。除此之外，你还可以用 clang、`make` 和 `gbd` 进行 C 语言开发。当然，这些都取决于你的需要，以及你是否有一个已 root 的设备。

你也可以查看它的 [GitHub 页面][15] 来解决发现的问题。截至目前，由于一些技术原因，Play Store 版本的更新已停止了。因此，如果可用的 Play Store 版本不能工作，你可以通过 [F-Droid][16] 安装最新版本。

#### 5、Termius（非 FOSS）

![][18]

[Termius][20] 是一个 SSH 和 SFTP 的定制客户端，专门用于从安卓设备进行远程访问。

通过 Termius，你可以管理 UNIX 和 Linux 系统。Play Store 页面将其描述为一个漂亮的安卓版 Putty 客户端，这一点是正确的。

用户界面很容易理解，看起来并不令人困惑。它还支持 Mosh 和 Telnet 协议。

当你连接到一个远程设备时，它可以检测到操作系统，如树莓派、Ubuntu、Fedora。你也可以用你的键盘连接到运行这个应用程序的手机上工作。最重要的是，没有任何广告或横幅，使它成为一个完美的远程连接应用程序。

它确实提供了可选的高级服务（14 天免费试用），具有更多的功能，如加密的交叉同步、SSH 密钥代理转发、SFTP、终端标签等。你也可以在其 [官方网站][19] 上了解更多关于它的信息。

#### 6、JuiceSSH（非 FOSS）

![][21]

[JuiceSSH][22] 是另一个流行的 SSH 客户端，有大量免费的功能和一个可选的专业版升级。

除了支持 Telnet 和 Mosh 之外，你还可以使用一些第三方插件来扩展功能。你可以从一系列可用的选项中调整外观，并按组轻松组织你的连接。

不要忘了，还有 IPv6 支持。

如果你选择专业版升级，你可以与 AWS 集成，启用安全同步，自动备份等等。

#### 7、ConnectBot（FOSS）

![][23]

如果你想要的只是一个简单的 SSH 客户端，[ConnectBot][24] 应该能满足你的需求。

你可以管理同时进行的 SSH 会话、创建安全隧道，并获得在其他应用程序之间复制/粘贴的能力。

### 赠品：无需 root 设备就能访问 Linux 发行版和命令

如果你没有已 root 的安卓手机，也不打算去 root 它，你有一个独特的选择，让你在智能手机上安装 Linux 发行版。

- [Andronix][25] （部分开源）

你可以得到广泛的 Linux 发行版和琳琅满目的桌面环境以及窗口管理器。

最重要的是，你不需要一个已 root 的设备来使用各种 Linux 命令。你只需要安装你最喜欢的发行版就可以做到这一切。

除了使用方便外，它还提供高级选项，使你能够获得离线发行版安装和跨设备同步命令的能力。

当然，你安装了一个 Linux 发行版并不意味着你可以做所有事情，但它仍然是一个很好的选择。你可以在 [Play Store][26] 找到它，并在 [GitHub][27] 上了解关于它的更多信息。

## 总结

在安卓上访问 Linux 终端并不像选择一个终端模拟器那么简单。你需要检查对命令的支持，以及它能让你在已 root 的、未 root 的设备上做什么，然后再继续。

如果你想做实验，任何一个选项都应该做得很好。

你的个人最爱是什么？我们是否错过了列出任何你的最爱？请在下面的评论中告诉我。

--------------------------------------------------------------------------------

via: https://itsfoss.com/using-linux-terminal-android/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/online-linux-terminals/
[2]: https://itsfoss.com/linux-terminal-emulators/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/02/qute-terminal.jpg?resize=800%2C600&ssl=1
[4]: https://itsfoss.com/linux-command-tricks/
[5]: https://itsfoss.com/shell-scripting-resources/
[6]: https://play.google.com/store/apps/details?id=com.ddm.qute&hl=en_IN&gl=US
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/02/terminal-emulator-old.jpg?resize=800%2C600&ssl=1
[8]: https://github.com/jackpal/Android-Terminal-Emulator/
[9]: https://play.google.com/store/apps/details?id=jackpal.androidterm&hl=en_IN&gl=US
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/02/material-terminal.jpg?resize=800%2C600&ssl=1
[11]: https://play.google.com/store/apps/details?id=yarolegovich.materialterminal&hl=en_IN&gl=US
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/02/termux.jpg?resize=800%2C600&ssl=1
[13]: https://itsfoss.com/nnn-file-browser-linux/
[14]: https://linuxhandbook.com/ssh-basics/
[15]: https://github.com/termux/termux-app
[16]: https://f-droid.org/en/packages/com.termux/
[17]: https://play.google.com/store/apps/details?id=com.termux
[18]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/02/termius.jpg?resize=800%2C600&ssl=1
[19]: https://termius.com/
[20]: https://play.google.com/store/apps/details?id=com.server.auditor.ssh.client&hl=en_IN&gl=US
[21]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/02/juicessh.jpg?resize=800%2C600&ssl=1
[22]: https://play.google.com/store/apps/details?id=com.sonelli.juicessh&hl=en_IN&gl=US
[23]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/02/connectbot-app.jpg?resize=800%2C600&ssl=1
[24]: https://play.google.com/store/apps/details?id=org.connectbot&hl=en_IN&gl=US
[25]: https://andronix.app/
[26]: https://play.google.com/store/apps/details?id=studio.com.techriz.andronix
[27]: https://github.com/AndronixApp
