[#]: collector: "lujun9972"
[#]: translator: "qhwdw"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: subject: "OpenSnitch – an Application Firewall for Linux [Review]"
[#]: via: "https://itsfoss.com/opensnitch-firewall-linux/"
[#]: author: "John Paul https://itsfoss.com/author/john/"
[#]: url: "https://linux.cn/article-10337-1.html"

OpenSnitch：一个 Linux 上的应用程序防火墙
======

不能因为 Linux 比 Windows 更安全，就可以在 Linux 上放松警惕。Linux 上可以使用的防火墙很多，它们可以让你的 Linux 系统更安全。今天，我们将带你了解一个这样的防火墙工具，它就是 OpenSnitch。

### OpenSnitch 是什么？

![Linux firewall and security][1]

[OpenSnitch][2] 是从 Little Snitch 上移植过来的。而 Little Snitch 是专门为 Mac OS 设计的一款应用程序防火墙。OpenSnitch 是由 [Simone Margaritelli][3] 设计，也称为 [evilsocket][4]。

OpenSnitch 所做的主要事情就是跟踪你机器上安装的应用程序所发起的互联网请求。OpenSnitch 允许你去创建规则以同意或阻止那个应用程序发起的互联网访问。当一个应用程序尝试去访问互联网而没有相应的访问规则存在时，就会出现一个对话框，这个对话框让你去选择允许还是阻止那个连接。

你也可以决定这个新规则是应用到进程上、具体的 URL 上、域名上、单个实例上，以及本次会话还是永久有效。

![OpenSnitch firewall app in Linux][5]

*OpenSnatch 规则请求*

你创建的所有规则都保存为 [JSON 文件][6]，如果以后需要修改它，就可以去修改这个文件。比如说，你错误地阻止了一个应用程序。

OpenSnitch 也有一个漂亮的、一目了然的图形用户界面：

  * 是什么应用程序访问 web
  * 它们使用哪个 IP 地址
  * 属主用户是谁
  * 使用哪个端口

如果你愿意，也可以将这些信息导出到一个 CSV 文件中。

OpenSnitch 遵循 GPL v3 许可证使用。

![OpenSnitch firewall interface][7]

*OpenSnitch 进程标签页*

### 在 Linux 中安装 OpenSnitch

[OpenSnitch GitHub 页面][8] 上的安装介绍是针对 Ubuntu 用户的。如果你使用的是其它发行版，你需要调整一下相关的命令。据我所知，这个应用程序仅在 [Arch User Repository][9] 中打包了。

在你开始之前，你必须正确安装了 Go，并且已经定义好了 `$GOPATH` 环境变量。

首先，安装必需的依赖。

```
sudo apt-get install protobuf-compiler libpcap-dev libnetfilter-queue-dev python3-pip

go get github.com/golang/protobuf/protoc-gen-go

go get -u github.com/golang/dep/cmd/dep

python3 -m pip install --user grpcio-tools
```

接下来，克隆 OpenSnitch 仓库。这里可能会出现一个没有 Go 文件的信息，不用理它。如果出现 git 没有找到的信息，那么你需要首先去安装 Git。

```
go get github.com/evilsocket/opensnitch

cd $GOPATH/src/github.com/evilsocket/opensnitch
```

如果没有正确设置 `$GOPATH` 环境变量，运行上面的命令时将会出现一个 “no such folder found” 的错误信息。只需要进入到你刚才克隆仓库位置的 `evilsocket/opensnitch` 文件夹中即可。

现在，我们构建并安装它。

```
make

sudo make install
```

如果出现 “dep command could not be found” 的错误信息，在 `$PATH` 中添加 `$GOPATH/bin` 即可。

安装完成后，我们将要启动它的守护程序和图形用户界面。

```
sudo systemctl enable opensnitchd

sudo service opensnitchd start

opensnitch-ui
```

![OpenSnitch firewall interface][10]

*运行在 Manjaro 上的 OpenSnitch*

### 使用体验

实话实说：我使用 OpenSnitch 的体验并不好。我开始在 Fedora 上尝试安装它。遇到了许多依赖问题。我又转到 Manjaro 上，在 Arch User Repository 上我很容易地找到了这些依赖。

不幸的是，我安装之后，不能启动图形用户界面。因此，我手动去运行最后三个步骤。一切似乎很顺利。如果我想让 Firefox 去访问 Manjaro 的网站，对话框就会弹出来询问我。

有趣的是，当我运行一个 [AUR 工具][11] `yay` 去更新我的系统时，弹出对话框要求了 `yay`、`pacman`、`pamac`、和 `git` 的访问规则。后来，我关闭并重启动 GUI，因为它当前是激活的。当我重启动它时，它不再要求我去创建规则了。我安装了 Falkon，而 OpenSnitch 并没有询问我去授予它任何权限。它甚至在 OpenSnitch 的 GUI 中没有列出 Falkon。我重新安装了 OpenSnitch 后，这个问题依旧存在。

然后，我转到 Ubuntu Mate 上安装 OpenSnitch，因为安装介绍就是针对 Ubuntu 所写的，进展很顺利。但是，我遇到了几个问题。我调整了一下上面介绍的安装过程以解决我遇到的问题。

安装的问题并不是我遇到的唯一问题。每次一个新的应用程序创建一个连接时弹出的对话框仅存在 10 秒钟。这么短的时间根本不够去浏览所有的可用选项。大多数情况下，这点时间只够我去永久允许一个（我信任的）应用程序访问 web。

GUI 也有一点需要去改进。由于某些原因，每次窗口都被放在顶部。而且不能通过设置来修改这个问题。如果能够从 GUI 中改变规则将是一个不错的选择。

![][12]

*OpenSnitch 的 hosts 标签*

### 对 OpenSnitch 的最后意见

我很喜欢 OpenSnitch 的目标：用任何简单的方式控制离开你的计算机的信息。但是，它还很粗糙，我不能将它推荐给普通或业余用户。如果你是一个高级用户，很乐意去摆弄或挖掘这些问题，那么它可能很适合你。

这有点令人失望。我希望即将到来的 1.0 版本能够做的更好。

你以前用过 OpenSnitch 吗？如果没有，你最喜欢的防火墙应用是什么？你是如何保护你的 Linux 系统的？在下面的评论区告诉我们吧。

如果你对本文感兴趣，请花一点时间将它分享到社交媒体上吧，Hacker News 或 [Reddit][13] 都行。

--------------------------------------------------------------------------------

via: https://itsfoss.com/opensnitch-firewall-linux/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/11/linux-firewall-security.jpg?fit=800%2C450&ssl=1
[2]: https://www.opensnitch.io/
[3]: https://github.com/evilsocket
[4]: https://twitter.com/evilsocket
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2018/11/opensnitch-dialog.jpg?fit=800%2C421&ssl=1
[6]: https://www.json.org/
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2018/11/opensnitch-processes.jpg?fit=800%2C651&ssl=1
[8]: https://github.com/evilsocket/opensnitch
[9]: https://aur.archlinux.org/packages/opensnitch-git
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/11/opensnitch-manjaro.jpg?fit=800%2C651&ssl=1
[11]: https://itsfoss.com/best-aur-helpers/
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2018/11/opensnitch-hosts.jpg?fit=800%2C651&ssl=1
[13]: http://reddit.com/r/linuxusersgroup
