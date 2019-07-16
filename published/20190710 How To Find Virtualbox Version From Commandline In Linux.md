[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11099-1.html)
[#]: subject: (How To Find Virtualbox Version From Commandline In Linux)
[#]: via: (https://www.ostechnix.com/how-to-find-virtualbox-version-from-commandline-in-linux/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

在 Linux 中如何从命令行查找 VirtualBox 版本
======

![FInd Virtualbox version from commandline In Linux][1]

我使用 Oracle VirtualBox 和 [KVM][2] 虚拟化程序[测试不同的 Linux 操作系统][3]。虽然我偶尔使用 KVM，但 Virtualbox 始终是我的首选。不是因为我不喜欢 KVM，而是因为我只是习惯了 VirtualBox。当在我的 Ubuntu 无头服务器上使用 [Virtualbox][4] 时，我需要知道 VirtualBox 的版本。如果它有 GUI，我可以进入 Virtualbox -> About -> Help 轻松找到它。但我的是没有 GUI 的 Ubuntu 服务器。如果你想知道如何在 Linux 中从命令行查找 VirtualBox 版本，可以采用以下几种方法。


### 在 Linux 中从命令行查找 VirtualBox 版本

要查找已安装的 VirtualBox 的版本，请打开终端并运行以下命令：

```
$ vboxmanage --version
```

示例输出：

```
5.2.18_Ubuntur123745
```

![][5]

*在 Linux 中从命令行查找 Virtualbox 版本*

正如你在上面的输出中看到的，安装的 VirtualBox 的版本是 5.2。

查找 VirtualBox 版本的另一种方法是：

```
$ vbox-img --version
```

示例输出：

```
5.2.18_Ubuntur123745
```

或者，你可以使用 `head` 和 `awk` 命令来查找 VirtualBox 版本。

```
$ virtualbox --help | head -n 1 | awk '{print $NF}'
```

示例输出：

```
5.2.18_Ubuntu
```

或者，使用 `echo` 命令结合 `head` 和 `awk` 命令：

```
$ echo $(virtualbox --help | head -n 1 | awk '{print $NF}')
```

示例输出：

```
5.2.18_Ubuntu
```

以上命令适用于任何 Linux 发行版。如果你使用的是 Ubuntu，你可以使用 `dpkg` 命令查看 VirtualBox 版本。

```
$ dpkg -l | grep virtualbox | awk '{print $3}'
```

示例输出：

```
5.2.30-130521~Ubuntu~bionic
5.2.18-dfsg-2~ubuntu18.04.5
```

就是这些了。这些是从 Linux 中的终端查找 Oracle Virtualbox 版本的几种方法。希望这篇文章很有用。

参考来自：

  * [AskUbuntu][6]

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-find-virtualbox-version-from-commandline-in-linux/

作者：[sk][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/07/Find-Virtualbox-Version-1-720x340.png
[2]: https://www.ostechnix.com/setup-headless-virtualization-server-using-kvm-ubuntu/
[3]: https://www.ostechnix.com/test-100-linux-and-unix-operating-systems-online-for-free/
[4]: https://www.ostechnix.com/install-oracle-virtualbox-ubuntu-16-04-headless-server/
[5]: https://www.ostechnix.com/wp-content/uploads/2019/07/Find-Virtualbox-Version.png
[6]: https://askubuntu.com/questions/420363/how-do-i-check-virtualbox-version-from-cli
