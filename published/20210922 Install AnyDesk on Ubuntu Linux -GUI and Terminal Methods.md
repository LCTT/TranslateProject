[#]: subject: "Install AnyDesk on Ubuntu Linux [GUI and Terminal Methods]"
[#]: via: "https://itsfoss.com/install-anydesk-ubuntu/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13839-1.html"

在 Ubuntu Linux 上安装 AnyDesk
======

> 这个初学者的教程讨论了在基于 Ubuntu 的 Linux 发行版上安装 AnyDesk 的 GUI 和终端方法。

![](https://img.linux.net.cn/data/attachment/album/202110/01/165758y9aaiix7yu88ayui.jpg)

[AnyDesk][1] 是一个流行的远程桌面软件，可用于 Linux、Windows、BSD、macOS 和移动平台。

有了 AnyDesk，你可以用它远程访问其他电脑，或者让别人远程访问你的系统。不是每个人都可以访问它，因为需要两台设备都使用 AnyDesk。你必须接受传入的连接和/或提供一个安全连接的密码。

这对于向朋友、家人、同事甚至客户提供技术支持很有帮助。

在本教程中，我将向你展示在 Ubuntu 上安装 AnyDesk 的图形和命令行两种方法。你可以根据自己的喜好使用这两种方法。这两种方法都会在你的 Ubuntu 系统上安装相同的 AnyDesk 版本。

同样的方法应该适用于 Debian 和其他基于 Debian 和 Ubuntu 的发行版，如 Linux Mint，Linux Lite 等。

> **非 FOSS 警告！**
>
> AnyDesk 不是开源软件。这里涉及它是因为它在 Linux 上可用，而文章的重点是 Linux。

### 方法 1：使用终端在 Ubuntu 上安装 AnyDesk

在你的系统上 [打开终端程序][2]。你需要一个像 `wget` 这样的工具来 [在终端下载文件][3]，使用以下命令：

```
sudo apt update
sudo apt install wget
```

下一步是下载 AnyDesk 仓库的 GPG 密钥，并将其添加到你的系统的可信密钥中。这样，你的系统就会信任来自这个[外部仓库][4]的软件。

```
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo apt-key add -
```

你可以暂时忽略关于 `apt-key` 命令的废弃警告。下一步是将 AnyDesk 仓库添加到系统的仓库源中：

```
echo "deb http://deb.anydesk.com/ all main" | sudo tee /etc/apt/sources.list.d/anydesk-stable.list
```

更新包缓存，这样你的系统就能通过新添加的仓库了解到新应用的可用性。

```
sudo apt update
```

现在，你可以安装 AnyDesk 了：

```
sudo apt install anydesk
```

完成后，你可以从系统菜单或从终端本身启动 AnyDesk：

```
anydesk
```

你现在可以享受 AnyDesk 了。

![AnyDesk running in Ubuntu][5]

### 方法 2：在 Ubuntu 上以图形方式安装 AnyDesk

如果你不习惯使用命令行，不用担心。你也可以不进入终端安装 AnyDesk。

你可以从 AnyDesk 官网下载 Ubuntu 上的 AnyDesk：

- [下载 Linux 上的 Anydesk][6]

你会看到一个“Download Now”的按钮。点击它。

![Download AnyDesk][7]

当你点击下载按钮时，它会给你提供各种 Linux 发行版的选项。选择 Ubuntu 的那个：

![Download the appropriate file][8]

它将下载 AnyDesk 的 DEB 文件。[安装 DEB 文件][9]很简单。要么双击它，要么右击并使用软件安装打开。

![Right click on deb file and open with software center][10]

软件中心应用将被打开，你可以在那里安装它。

![Installing AnyDesk in Ubuntu software center][11]

安装后，在系统菜单中搜索它并从那里开始。

![AnyDesk installed in Ubuntu][12]

这就好了。不是太难，是吗？

我不打算展示使用 AnyDesk 的步骤。我想你已经对这个问题有了一些了解。如果没有，请参考 [这篇文章][13]。

#### 故障排除提示

当我试图从系统菜单中运行 AnyDesk 时，它没有启动。于是，我从终端启动它，它显示了这个错误：

```
[email protected]:~$ anydesk
anydesk: error while loading shared libraries: libpangox-1.0.so.0: cannot open shared object file: No such file or directory
```

如果你看到 “[error while loading shared libraries][14]” 信息，你要安装它所报错的软件包。在我的例子中，我是这样做的：

```
sudo apt install libpangox-1.0-0
```

这解决了我的问题，我希望它也能为你解决。

如果你有任何与此主题相关的问题，请在评论区告诉我。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-anydesk-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://anydesk.com/en
[2]: https://itsfoss.com/open-terminal-ubuntu/
[3]: https://itsfoss.com/download-files-from-linux-terminal/
[4]: https://itsfoss.com/adding-external-repositories-ubuntu/
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/anydesk-running-in-ubuntu.png?resize=800%2C418&ssl=1
[6]: https://anydesk.com/en/downloads/linux
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/any-desk-ubuntu-download.webp?resize=800%2C312&ssl=1
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/any-desk-ubuntu-download-1.webp?resize=800%2C427&ssl=1
[9]: https://itsfoss.com/install-deb-files-ubuntu/
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/install-anaydesk-ubuntu.png?resize=800%2C403&ssl=1
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/installing-anydesk-in-ubuntu-software-center.png?resize=781%2C405&ssl=1
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/anydesk-installed-in-ubuntu.png?resize=759%2C196&ssl=1
[13]: https://support.anydesk.com/Access
[14]: https://itsfoss.com/solve-open-shared-object-file-quick-tip/
