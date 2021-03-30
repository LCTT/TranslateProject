[#]: subject: (4 cool new projects to try in Copr for March 2021)
[#]: via: (https://fedoramagazine.org/4-cool-new-projects-to-try-in-copr-for-march-2021/)
[#]: author: (Jakub Kadlčík https://fedoramagazine.org/author/frostyx/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13243-1.html)

COPR 仓库中 4 个很酷的新项目（2021.03）
======

![][1]

> COPR 是个人软件仓库 [集合][2]，它不在 Fedora 中。这是因为某些软件不符合轻松打包的标准；或者它可能不符合其他 Fedora 标准，尽管它是自由而开源的。COPR 可以在 Fedora 套件之外提供这些项目。COPR 中的软件不受 Fedora 基础设施的支持，或者是由项目自己背书的。但是，这是一种尝试新的或实验性的软件的一种巧妙的方式。

本文介绍了 COPR 中一些有趣的新项目。如果你第一次使用 COPR，请参阅 [COPR 用户文档][3]。

### Ytfzf

[Ytfzf][5] 是一个简单的命令行工具，用于搜索和观看 YouTube 视频。它提供了围绕模糊查找程序 [fzf][6] 构建的快速直观的界面。它使用 [youtube-dl][7] 来下载选定的视频，并打开外部视频播放器来观看。由于这种方式，`ytfzf` 比使用浏览器观看 YouTube 资源占用要少得多。它支持缩略图（通过 [ueberzug][8]）、历史记录保存、多个视频排队或下载它们以供以后使用、频道订阅以及其他方便的功能。多亏了像 [dmenu][9] 或 [rofi][10] 这样的工具，它甚至可以在终端之外使用。

![][11]

####  安装说明

目前[仓库][13]为 Fedora 33 和 34 提供 Ytfzf。要安装它，请使用以下命令：

```
sudo dnf copr enable bhoman/ytfzf
sudo dnf install ytfzf
```

### Gemini 客户端

你有没有想过，如果万维网走的是一条完全不同的路线，不采用 CSS 和客户端脚本，你的互联网浏览体验会如何？[Gemini][15] 是 HTTPS 协议的现代替代品，尽管它并不打算取代 HTTPS 协议。[stenstorp/gemini][16] COPR 项目提供了各种客户端来浏览 Gemini _网站_，有 [Castor][17]、[Dragonstone][18]、[Kristall][19] 和 [Lagrange][20]。

[Gemini][21] 站点提供了一些使用该协议的主机列表。以下显示了使用 Castor 访问这个站点的情况：

![][22]

#### 安装说明

该 [仓库][16] 目前为 Fedora 32、33、34 和 Fedora Rawhide 提供 Gemini 客户端。EPEL 7 和 8，以及 CentOS Stream 也可使用。要安装浏览器，请从这里显示的安装命令中选择：

```
sudo dnf copr enable stenstorp/gemini

sudo dnf install castor
sudo dnf install dragonstone
sudo dnf install kristall
sudo dnf install lagrange
```

### Ly

[Ly][25] 是一个 Linux 和 BSD 的轻量级登录管理器。它有一个类似于 ncurses 的基于文本的用户界面。理论上，它应该支持所有的 X 桌面环境和窗口管理器（其中很多都 [经过测试][26]）。Ly 还提供了基本的 Wayland 支持（Sway 也工作良好）。在配置的某个地方，有一个复活节彩蛋选项，可以在背景中启用著名的 [PSX DOOM fire][27] 动画，就其本身而言，值得一试。

![][28]

#### 安装说明

该 [仓库][30] 目前为 Fedora 32、33 和 Fedora Rawhide 提供 Ly。要安装它，请使用以下命令：

```
sudo dnf copr enable dhalucario/ly
sudo dnf install ly
```

在将 Ly 设置为系统登录界面之前，请在终端中运行 `ly` 命令以确保其正常工作。然后关闭当前的登录管理器，启用 Ly。

```
sudo systemctl disable gdm
sudo systemctl enable ly
```

最后，重启计算机，使其更改生效。

### AWS CLI v2

[AWS CLI v2][32] 带来基于社区反馈进行的稳健而有条理的演变，而不是对原有客户端的大规模重新设计。它引入了配置凭证的新机制，现在允许用户从 AWS 控制台中生成的 `.csv` 文件导入凭证。它还提供了对 AWS SSO 的支持。其他主要改进是服务端自动补全，以及交互式参数生成。一个新功能是交互式向导，它提供了更高层次的抽象，并结合多个 AWS API 调用来创建、更新或删除 AWS 资源。

![][33]

#### 安装说明

该 [仓库][35] 目前为 Fedora Linux 32、33、34 和 Fedora Rawhide 提供 AWS CLI v2。要安装它，请使用以下命令：

```
sudo dnf copr enable spot/aws-cli-2
sudo dnf install aws-cli-2
```

自然地，访问 AWS 账户凭证是必要的。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/4-cool-new-projects-to-try-in-copr-for-march-2021/

作者：[Jakub Kadlčík][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/frostyx/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/10/4-copr-945x400-1-816x345.jpg
[2]: https://copr.fedorainfracloud.org/
[3]: https://docs.pagure.org/copr.copr/user_documentation.html
[4]: https://github.com/FrostyX/fedora-magazine/blob/main/2021-march.md#droidcam
[5]: https://github.com/pystardust/ytfzf
[6]: https://github.com/junegunn/fzf
[7]: http://ytdl-org.github.io/youtube-dl/
[8]: https://github.com/seebye/ueberzug
[9]: https://tools.suckless.org/dmenu/
[10]: https://github.com/davatorium/rofi
[11]: https://fedoramagazine.org/wp-content/uploads/2021/03/ytfzf.png
[12]: https://github.com/FrostyX/fedora-magazine/blob/main/2021-march.md#installation-instructions
[13]: https://copr.fedorainfracloud.org/coprs/bhoman/ytfzf/
[14]: https://github.com/FrostyX/fedora-magazine/blob/main/2021-march.md#gemini-clients
[15]: https://gemini.circumlunar.space/
[16]: https://copr.fedorainfracloud.org/coprs/stenstorp/gemini/
[17]: https://git.sr.ht/~julienxx/castor
[18]: https://gitlab.com/baschdel/dragonstone
[19]: https://kristall.random-projects.net/
[20]: https://github.com/skyjake/lagrange
[21]: https://gemini.circumlunar.space/servers/
[22]: https://fedoramagazine.org/wp-content/uploads/2021/03/gemini.png
[23]: https://github.com/FrostyX/fedora-magazine/blob/main/2021-march.md#installation-instructions-1
[24]: https://github.com/FrostyX/fedora-magazine/blob/main/2021-march.md#ly
[25]: https://github.com/nullgemm/ly
[26]: https://github.com/nullgemm/ly#support
[27]: https://fabiensanglard.net/doom_fire_psx/index.html
[28]: https://fedoramagazine.org/wp-content/uploads/2021/03/ly.png
[29]: https://github.com/FrostyX/fedora-magazine/blob/main/2021-march.md#installation-instructions-2
[30]: https://copr.fedorainfracloud.org/coprs/dhalucario/ly/
[31]: https://github.com/FrostyX/fedora-magazine/blob/main/2021-march.md#aws-cli-v2
[32]: https://aws.amazon.com/blogs/developer/aws-cli-v2-is-now-generally-available/
[33]: https://fedoramagazine.org/wp-content/uploads/2021/03/aws-cli-2.png
[34]: https://github.com/FrostyX/fedora-magazine/blob/main/2021-march.md#installation-instructions-3
[35]: https://copr.fedorainfracloud.org/coprs/spot/aws-cli-2/
