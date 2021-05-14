[#]: subject: "Chrome Browser Keeps Detecting Network Change in Linux? Here’s How to Fix it"
[#]: via: "https://itsfoss.com/network-change-detected/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "HuengchI"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13389-1.html"

Linux 下 Chrome 浏览器一直报“检测到网络变化”，修复方法来了
======

![](https://img.linux.net.cn/data/attachment/album/202105/14/140644y6xx6e8100wzxrr5.jpg)

过去几天，我在 Ubuntu Linux系统上遇到了一个奇怪的问题。我用的是 Firefox 浏览器和 [Brave 浏览器][1]。Brave 浏览器一直报“network change detection”错误，几乎每次刷新都报错，但是在 Firefox 浏览器中一切正常。

![][2]

这个问题严重到了几乎不能使用浏览器的地步。我不能用 [Feedly][3] 来从我最喜欢的网站浏览信息流，每一个搜索结果都要多次刷新，网站也需要多次刷新。

作为替代，我尝试 [在 Ubuntu 上安装 Chrome 浏览器][4]。但是问题依然存在。我还 [在 Linux 上安装了微软 Edge][5]，但是问题依旧。基本上，任何 Chromium 内核的浏览器都会持续报“ERR_NETWORK_CHANGED”错误。

幸运地是，我找到了一个方法来修复这个问题。我将会把解决步骤分享给你，如果你也遇到了同样的问题，这将能够帮到你。

### 解决基于 Chromium 内核的浏览器频繁报“network change detection”错的问题

对我而言，关闭网络设置中的 IPv6 是一个有效的诀窍。虽然现在我还不确定是什么导致了这个故障，但是 IPv6 会在很多系统中导致错误并不是什么鲜为人知的事。如果你的系统，路由器和其他设备用了 IPv6 而不是古老却好用的 IPv4，那么你就可能遭遇和我相同的网络连接故障。

幸亏，[关闭 Ubuntu 的 IPv6][6] 并不算难。有好几种方法都能够达到目的，我将会分享一个大概是最容易的方法。这个方法就是用 GRUB 来关闭 IPv6。

> 新手注意！
>
> 如果你不习惯于用命令行和终端，请额外注意这些步骤。仔细的阅读这些操作说明。

#### 第 1 步：打开 GRUB 配置文件以编辑

打开终端。用下面的命令来在 Nano 编辑器中打开 GRUB 配置文件。这里你需要输入你的账户密码。

```
sudo nano /etc/default/grub
```

我希望你懂得一点 [使用 Nano 编辑器][7] 的方法。使用方向键移动光标，找到以`GRUB_CMDLINE_LINUX` 开头的这行。把它的值修改成这样：

```
GRUB_CMDLINE_LINUX="ipv6.disable=1"
```

注意引号和空格。不要动其他行。

![][8]

使用 `Ctrl+x` 快捷键保存更改。按 `Y` 或者回车确认。

#### 第 2 步：更新 GRUB

你已经修改了 GRUB 引导器的配置，但是在你更新 GRUB 之前这些更改都不会生效。使用下面的命令来更新：

```
sudo update-grub
```

![][9]

现在当你重启系统之后，IPv6 将会被关闭了。你不应该再遇到网络中断的故障了。

你可能会想为什么我没提从网络设置中关掉 IPv6。这是因为目前 Ubuntu 用了 [Netplan][10] 来管理网络配置，似乎在网络设置中做出的更改并没有被完全应用到 Netplan 中。我试过虽然在网络设置中关掉了 IPv6，但是这个问题并没有被解决，直到我用了上述命令行的方法。

即使过了这么多年，IPv6 的支持还是没有成熟，并且持续引发了很多故障。比如关闭 IPv6 有时候能 [提高 Linux 下的 Wi-Fi 速度][11]。够扯吧？

不管怎样，我希望上述小方法也能够帮助你解决系统中的“network change detection”故障。

--------------------------------------------------------------------------------

via: https://itsfoss.com/network-change-detected/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[HuengchI](https://github.com/HuengchI)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/brave-web-browser/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/04/network-change-detected.png?resize=800%2C418&ssl=1
[3]: https://feedly.com/
[4]: https://itsfoss.com/install-chrome-ubuntu/
[5]: https://itsfoss.com/microsoft-edge-linux/
[6]: https://itsfoss.com/disable-ipv6-ubuntu-linux/
[7]: https://itsfoss.com/nano-editor-guide/
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/disabling-ipv6-via-grub.png?resize=800%2C453&ssl=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/04/updating-grub-ubuntu.png?resize=800%2C434&ssl=1
[10]: https://netplan.io/
[11]: https://itsfoss.com/speed-up-slow-wifi-connection-ubuntu/
