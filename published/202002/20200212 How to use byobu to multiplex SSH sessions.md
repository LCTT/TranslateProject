[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11944-1.html)
[#]: subject: (How to use byobu to multiplex SSH sessions)
[#]: via: (https://opensource.com/article/20/2/byobu-ssh)
[#]: author: (Ben Nuttall https://opensource.com/users/bennuttall)

如何使用 byobu 复用 SSH 会话
======

> Byobu 能让你在保持会话活跃的情况下维护多个终端窗口，通过 SSH 连接、断开、重连以及共享访问。

![Person drinking a hat drink at the computer][1]

[Byobu][2] 是基于文本的窗口管理器和终端多路复用器。它类似于 [GNU Screen][3]，但更现代、更直观。它还适用于大多数 Linux、BSD 和 Mac 发行版。

Byobu 能让你在保持会话活跃的情况下维护多个终端窗口、通过 SSH（secure shell）连接、断开、重连，甚至让其他人访问。

比如，你 SSH 进入树莓派或服务器，并运行（比如） `sudo apt update && sudo apt upgrade`，然后你在它运行的时候失去了互联网连接，你的命令会丢失无效。然而，如果你首先启动 byobu 会话，那么它会继续运行，在你重连后，你会发现它仍在继续运行。

![The byobu logo is a fun play on screens.][4]

Byobu 名称来自于日语的装饰性多面板屏风，它可作为折叠式隔断，我认为这很合适。

要在 Debian/Raspbian/Ubuntu 上安装 byobu：

```
sudo apt install byobu
```

接着启用它：

```
byobu-enable
```

现在，请退出 SSH 会话并重新登录，你将会在 byobu 会话中登录。运行类似 `sudo apt update` 命令并关闭窗口（或输入转义序列（[Enter + ~ + .][5]）并重新登录。你将看到更新命令在你离开后还在运行。

有*很多*我不常使用的功能。我通常使用的是：

  * `F2` – 新窗口
  * `F3/F4` – 在窗口间导航
  * `Ctrl`+`F2` – 垂直拆分窗格
  * `Shift`+`F2` – 水平拆分窗格
  * `Shift`+`左箭头/Shift`+`右箭头` – 在拆分窗格间导航
  * `Shift`+`F11` – 放大（或缩小）拆分窗格

### 我们如何使用 byobu

Byobu 对于维护 [piwheels][6]（一个用于树莓派的方便的，预编译 Python 包）很好用。我水平拆分了窗格，在上半部分显示了 piwheels 监视器，在下半部分实时显示了 syslog 条目。接着，如果我们想要做其他事情，我们可以切换到另外一个窗口。当我们进行协作分析时，这特别方便，因为当我在 IRC 中聊天时，我可以看到我的同事 Dave 输入了什么（并纠正他的错字）。

我在家庭和办公服务器上启用了 byobu，因此，当我登录到任何一台计算机时，一切都与我离开时一样。它正在运行多个作业、在特定目录中保留一个窗口，以另一个用户身份运行进程等。

![byobu screenshot][7]

Byobu 对于在树莓派上进行开发也很方便。你可以在桌面上启动它，运行命令，然后 SSH 进入，并连接到该命令运行所在的会话。请注意，启用 byobu 不会更改终端启动器的功能。只需运行 `byobu` 即可启动它。

本文最初发表在 Ben Nuttall 的 [Tooling blog][8] 中，并获许重用。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/byobu-ssh

作者：[Ben Nuttall][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/bennuttall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_tea_laptop_computer_work_desk.png?itok=D5yMx_Dr (Person drinking a hat drink at the computer)
[2]: https://byobu.org/
[3]: http://www.gnu.org/software/screen/
[4]: https://opensource.com/sites/default/files/uploads/byobu.png (byobu screen)
[5]: https://www.google.com/search?client=ubuntu&channel=fs&q=Enter-tilde-dot&ie=utf-8&oe=utf-8
[6]: https://opensource.com/article/20/1/piwheels
[7]: https://opensource.com/sites/default/files/uploads/byobu-screenshot.png (byobu screenshot)
[8]: https://tooling.bennuttall.com/byobu/
