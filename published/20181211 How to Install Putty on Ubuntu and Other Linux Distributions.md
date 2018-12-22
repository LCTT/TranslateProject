[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10373-1.html)
[#]: subject: (How to Install Putty on Ubuntu and Other Linux Distributions)
[#]: via: (https://itsfoss.com/putty-linux/)
[#]: author: (Abhishek Prakash  https://itsfoss.com/author/abhishek/)

如何在 Ubuntu 和其他 Linux 发行版上安装 Putty
======

如果我没弄错，[Putty][1] 可能是 Windows 最受欢迎的 SSH 客户端。

在 IT 公司中，开发环境通常在远程 Linux 系统上，而开发人员则使用 Windows 作为本地系统。Putty 用于从 Windows 机器连接到远程 Linux 系统。

Putty 不是限定于 Windows 的。你也可以在 Linux 和 macOS 上使用此开源软件。

但是等等！当你已经拥有“真正的” Linux 终端时，为什么要在 Linux 上使用单独的 SSH 客户端？这有几个想在 Linux 上使用 Putty 的原因。

  * 你在 Windows 上使用 Putty 已经很久了，你觉得它更舒服。
  * 你发现很难手动编辑 SSH 配置文件以保存各种 SSH 会话。你更喜欢 Putty 图形化保存 SSH 连接的方式。
  * 你想通过连接到原始套接字和串口进行调试。

无论是什么原因，如果你想在 Ubuntu 或任何其他 Linux 上使用 Putty，你当然可以这样做。让我告诉你如何做到。

### 在 Ubuntu Linux 上安装 Putty

![Installing Putty on Linux][2]

对于 Ubuntu 用户来说，好消息是 Putty 可以在 Ubuntu 的 universe 仓库中找到。

要在 Ubuntu上安装 Putty，首先应确保已启用 universe 仓库。

```
sudo add-apt-repository universe
```

启用 universe 仓库后，应使用以下命令更新 Ubuntu：

```
sudo apt update
```

之后，你可以使用以下命令安装 Putty：

```
sudo apt install putty
```

安装后，你可以在菜单中找到它来启动 Putty。

正如你在下面的截图中看到的，Putty 的 Linux 版本看起来与 Windows 版本相同。这让你松了一口气, 因为你不必再尝试新的设置。

![Putty in Linux][3]

当你输入远程系统的[主机名][4]或 IP 地址并连接到它时，Putty 将使用你已保存在主目录中的 SSH 密钥。

![Using Putty in Ubuntu Linux][5]

### 在其他 Linux 发行版上安装 Putty

[Putty 可用于 Debian][6]，所以你只需要使用 `apt-get` 或 `aptitude` 来安装它。

```
sudo apt-get install putty
```

Putty 也适用于 Fedora/Red Hat，并可以使用默认的包管理器进行安装。

```
sudo dnf install putty
```

你还可以在基于 Arch Linux 的发行版中轻松安装 Putty。

```
sudo pacman -S putty
```

请记住，Putty 是一款开源软件。如果你真的想要，你也可以通过源代码安装它。你可以从下面的链接获取 Putty 的源代码。

- [下载 Putty 源代码][8]

我一直喜欢原生 Linux 终端而不是像 Putty 这样的 SSH 客户端。我觉得 GNOME 终端或 [Terminator][7] 更有家的感觉。但是，在 Linux 中使用默认终端或 Putty 是个人选择。

你在 Linux 上管理多个 SSH 连接时使用了什么？

--------------------------------------------------------------------------------

via: https://itsfoss.com/putty-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:  https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.putty.org/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/12/Putty-linux.png?resize=800%2C450&ssl=1
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/12/putty-interface-ubuntu.jpeg?resize=800%2C503&ssl=1
[4]: https://itsfoss.com/change-hostname-ubuntu/
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2018/12/putty-interface-ubuntu-1.jpeg?resize=800%2C430&ssl=1
[6]: https://packages.debian.org/jessie/putty
[7]: https://launchpad.net/terminator
[8]: https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html
