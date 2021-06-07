[#]: collector: (lujun9972)
[#]: translator: (qianmingtian)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11987-1.html)
[#]: subject: (Install and Use Wireshark on Ubuntu Linux)
[#]: via: (https://itsfoss.com/install-wireshark-ubuntu/)
[#]: author: (Community https://itsfoss.com/author/itsfoss/)

Ubuntu 上 Wireshark 的安装与使用
======

> 在本教程中，你将学习如何在 Ubuntu 和其它基于 Ubuntu 的发行版上安装最新的 Wireshark。同时你也将学习如何在没有 sudo 的情况下来运行 Wireshark，以及如何设置它来进行数据包嗅探。

[Wireshark][1] 是一款自由开源的网络协议分析器，它在全球被广泛使用。

通过使用 Wireshark，你可以实时捕获网络的传入和传出数据包，并将其用于网络故障排除、数据包分析、软件和通信协议开发等。

它适用于所有主流的桌面操作系统，如 Windows、Linux、macOS、BSD 等。

在本教程中，我将指导你在 Ubuntu 和其他基于 Ubuntu 的发行版上安装 Wireshark 。我还将介绍如何设置和配置 Wireshark 来捕获数据包。

### 在基于 Ubuntu 的 Linux 发行版上安装 Wireshark

![][2]

Wireshark 适用于所有主流 Linux 发行版。你应该查看[官方安装说明][3]。因为在本教程中，我将着重在仅基于 Ubuntu 的发行版上安装最新版本的 Wireshark 。

Wireshark 可以在 Ubuntu 的 Universe 存储库中找到。你可以[启用 universe 存储库][4]，然后按如下方式安装：

```
sudo add-apt-repository universe
sudo apt install wireshark
```

这种方法的一个小问题是，你可能并不总是得到最新版本的 Wireshark 。

例如，在 Ubuntu 18.04 中，如果你使用 [apt][5] 命令检查 Wireshark 的可用版本，可用版本会显示是 2.6 。

```
abhishek@nuc:~$ apt show wireshark
Package: wireshark
Version: 2.6.10-1~ubuntu18.04.0
Priority: optional
Section: universe/net
Origin: Ubuntu
Maintainer: Balint Reczey <rbalint@ubuntu.com>
```

然而， [Wireshark 3.2 稳定版][6]已经在几个月前发布了。当然，新版本拥有新的特性。

那么在这种情况下，你应该怎么办呢？谢天谢地， Wireshark 开发者提供了一种官方 PPA 方式，你可以使用它在 Ubuntu 和其它基于 Ubuntu 的发行版上安装最新稳定版本的 Wireshark.

我希望你熟悉 PPA。如果没有，请[阅读我们关于 PPA 的优秀指南，以便完全理解它][7]。              

打开终端并逐个使用以下命令：

```
sudo add-apt-repository ppa:wireshark-dev/stable
sudo apt update
sudo apt install wireshark
```

即使安装了旧版本的 Wireshark ，它也将更新为新版本。

安装时，系统将询问你是否允许非超级用户捕获数据包。选择“Yes”允许，选择“No”限制非超级用户捕获数据包，最后完成安装。

### 不使用 sudo 运行 Wireshark

如果在上一次安装中选择了“No”，则以 root 用户身份运行以下命令：

```
sudo dpkg-reconfigure wireshark-common
```

然后按 `tab` 键并使用回车键选择“No”：

![][8]

由于你允许非超级用户捕获数据包，因此你必须将该用户添加到 `wireshark` 组。使用 [usermod][9] 命令将自己添加到 `wireshark` 组。 

```
sudo usermod -aG wireshark $(whoami)
```

最后，[重启你的 Ubuntu 系统][10]对你的系统进行必要的修改。

> 冷知识
>
> Wireshark 于 1998 年首次发布，最初被称为 Ethereal 。2006 年，由于商标问题，开发商不得不将其名称改为 Wireshark 。

### 启动 Wireshark 

你可以从应用程序启动器或者命令行启动 Wireshark 应用。

如果从命令行启动，只需要在你的控制台中输入 `wireshark`：

```
wireshark
```

要是从**图形化界面**启动，需要在搜索栏搜索 Wireshark 应用，并按回车键。

![][11]

现在，让我们来玩玩 Wireshark 吧。

### 使用 Wireshark 捕获数据包

当你启动 Wireshark 的时候，你会看到一个接口列表，你可以使用它来捕获这个接口接收和发送的数据包。

你可以使用 Wireshark 监视许多类型的接口，例如，有线、外部设备等。根据你的偏好，你可以从下图中的标记区域选择在欢迎屏幕中显示特定类型的接口。

![Select interface][12]

例如，我只列出了**有线**网络接口。

![][13]

接下来，要开始捕获数据包，你必须选择接口（在我的示例中是 `ens33` ），然后单击“Start capturing packets”图标，如下图所示。

![Start capturing packets with Wireshark][14]

你还可以同时从多个接口捕获数据包。只需按住 `CTRL` 按钮，同时单击要捕获的接口，然后点击“Start capturing packets”图标，如下图所示。

![][15]

接下来，我尝试在终端中使用 `ping google.com` 命令，如你所见，捕获了许多数据包。

![Captured packets][16]

现在你可以选择任何数据包来检查该特定数据包。在点击一个特定的包之后，你可以看到与它相关的 TCP/IP 协议的不同层的信息。

![Packet info][17]

你还可以在底部看到该特定数据包的原始数据，如下图所示。

![Check RAW data in the captured packets][18]

> 这就是为什么端到端加密很重要。
> 
> 假设你正在登录一个不使用 HTTPS 的网站。与你在同一网络上的任何人都可以嗅探数据包，并在原始数据中看到用户名和密码。
>
> 这就是为什么现在大多数聊天应用程序使用端到端加密，而大多数网站使用 https （而不是 http）。

#### 在 Wireshark 中停止数据包捕获

你可以点击如图所示的红色图标停止捕获数据包。

![Stop packet capture in Wireshark][19]

#### 将捕获的数据包保存成文件

你可以单击下图中标记的图标，将捕获的数据包保存到文件中以备将来使用。

![Save captured packets by Wireshark][20]


**注意**：输出可以导出为 XML、PostScript、CSV 或纯文本。

接下来，选择一个目标文件夹，键入文件名并单击“Save”。

然后选择文件并单击“Open”。

![][21]

现在你可以随时打开和分析保存的数据包。要打开文件，请按 `\+o`，或从 Wireshark 转到 “File > Open”。

捕获的数据包将从文件中加载。

![][22]

### 结语

Wireshark 支持许多不同的通信协议。有许多选项和功能，使你能够以独特的方式捕获和分析网络数据包。你可以从 Wireshark 的[官方文档][23]了解更多关于 Wireshark 的信息。

我希望这个教程能帮助你在 Ubuntu 上安装 Wireshark 。请让我知道你的问题和建议。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-wireshark-ubuntu/

作者：[Kushal Rai][a]
选题：[lujun9972][b]
译者：[qianmingtian][c]
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/itsfoss/
[b]: https://github.com/lujun9972
[c]: https://github.com/qianmingtian
[1]: https://www.wireshark.org/
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/wireshark_ubuntu.png?ssl=1
[3]: https://www.wireshark.org/docs/wsug_html_chunked/ChBuildInstallUnixInstallBins.html
[4]: https://itsfoss.com/ubuntu-repositories/
[5]: https://itsfoss.com/apt-command-guide/
[6]: https://www.wireshark.org/news/20191218.html
[7]: https://itsfoss.com/ppa-guide/
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/yes.png?ssl=1
[9]: https://linuxhandbook.com/usermod-command/
[10]: https://itsfoss.com/schedule-shutdown-ubuntu/
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/03/wire.png?ssl=1
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/interfaces.jpg?ssl=1
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/intoption.jpg?ssl=1
[14]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/03/singleinterface.jpg?ssl=1
[15]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/selint.jpg?ssl=1
[16]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/03/capture.jpg?ssl=1
[17]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/03/packetinfo.png?ssl=1
[18]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/raw.png?ssl=1
[19]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/03/stopcapture.png?ssl=1
[20]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/savepackets.jpg?ssl=1
[21]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/savename.jpg?ssl=1
[22]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/openpacket.png?ssl=1
[23]: https://www.wireshark.org/docs/https://www.wireshark.org/docs/
[24]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/kushal_rai.jpg?ssl=1
