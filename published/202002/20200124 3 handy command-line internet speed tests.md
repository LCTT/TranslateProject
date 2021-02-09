[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11882-1.html)
[#]: subject: (3 handy command-line internet speed tests)
[#]: via: (https://opensource.com/article/20/1/internet-speed-tests)
[#]: author: (Ben Nuttall https://opensource.com/users/bennuttall)

3 个方便的命令行网速测试工具
======

> 用这三个开源工具检查你的互联网和局域网速度。

![](https://img.linux.net.cn/data/attachment/album/202002/12/115915kk6hkax1vparkuvk.jpg)

能够验证网络连接速度使您可以控制计算机。 使您可以在命令行中检查互联网和网络速度的三个开源工具是 Speedtest、Fast 和 iPerf。

### Speedtest

[Speedtest][2] 是一个旧宠。它用 Python 实现，并打包在 Apt 中，也可用 `pip` 安装。你可以将它作为命令行工具或在 Python 脚本中使用。

使用以下命令安装：

```
sudo apt install speedtest-cli
```

或者

```
sudo pip3 install speedtest-cli
```

然后使用命令 `speedtest` 运行它：

```
$ speedtest
Retrieving speedtest.net configuration...
Testing from CenturyLink (65.128.194.58)...
Retrieving speedtest.net server list...
Selecting best server based on ping...
Hosted by CenturyLink (Cambridge, UK) [20.49 km]: 31.566 ms
Testing download speed................................................................................
Download: 68.62 Mbit/s
Testing upload speed......................................................................................................
Upload: 10.93 Mbit/s
```

它给你提供了互联网上传和下载的网速。它快速而且可脚本调用，因此你可以定期运行它，并将输出保存到文件或数据库中，以记录一段时间内的网络速度。

### Fast

[Fast][3] 是 Netflix 提供的服务。它的网址是 [Fast.com][4]，同时它有一个可通过 `npm` 安装的命令行工具：

```
npm install --global fast-cli
```

网站和命令行程序都提供了相同的基本界面：它是一个尽可能简单的速度测试：

```
$ fast

     82 Mbps ↓
```

该命令返回你的网络下载速度。要获取上传速度，请使用 `-u` 标志：

```
$ fast -u

   ⠧ 80 Mbps ↓ / 8.2 Mbps ↑
```

### iPerf

[iPerf][5] 测试的是局域网速度（而不是像前两个工具一样测试互联网速度）的好方法。Debian、Raspbian 和 Ubuntu 用户可以使用 apt 安装它：

```
sudo apt install iperf
```

它还可用于 Mac 和 Windows。

安装完成后，你需要在同一网络上的两台计算机上使用它（两台都必须安装 iPerf）。指定其中一台作为服务器。

获取服务端计算机的 IP 地址：

```
ip addr show | grep inet.*brd
```

你的本地 IP 地址（假设为 IPv4 本地网络）以 `192.168` 或 `10` 开头。记下 IP 地址，以便可以在另一台计算机（指定为客户端的计算机）上使用它。

在服务端启动 `iperf`：

```
iperf -s
```

它会等待来自客户端的传入连接。将另一台计算机作为为客户端并运行此命令，将示例中的 IP 替换为服务端计算机的 IP：

```
iperf -c 192.168.1.2
```

![iPerf][6]

只需几秒钟即可完成测试，然后返回传输大小和计算出的带宽。我使用家用服务器作为服务端，在 PC 和笔记本电脑上进行了一些测试。我最近在房屋周围安装了六类线以太网，因此我的有线连接速度达到 1Gbps，但 WiFi 连接速度却低得多。

![iPerf][7]

你可能注意到它记录到 16Gbps。那是我使用服务器进行自我测试，因此它只是在测试写入磁盘的速度。该服务器具有仅 16 Gbps 的硬盘驱动器，但是我的台式机有 46Gbps，另外我的（较新的）笔记本超过了 60Gbps，因为它们都有固态硬盘。

![iPerf][8]

### 总结

通过这些工具来了解你的网络速度是一项非常简单的任务。如果你更喜欢脚本或者在命令行中运行，上面的任何一个都能满足你。如果你要了解点对点的指标，iPerf 能满足你。

你还使用其他哪些工具来衡量家庭网络？在评论中分享你的评论。

本文最初发表在 Ben Nuttall 的 [Tooling blog][9] 上，并获准在此使用。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/internet-speed-tests

作者：[Ben Nuttall][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/bennuttall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/train-plane-speed-big-machine.png?itok=f377dXKs (Old train)
[2]: https://github.com/sivel/speedtest-cli
[3]: https://github.com/sindresorhus/fast-cli
[4]: https://fast.com/
[5]: https://iperf.fr/
[6]: https://opensource.com/sites/default/files/uploads/iperf.png (iPerf)
[7]: https://opensource.com/sites/default/files/uploads/iperf2.png (iPerf)
[8]: https://opensource.com/sites/default/files/uploads/iperf3.png (iPerf)
[9]: https://tooling.bennuttall.com/command-line-speedtest-tools/
