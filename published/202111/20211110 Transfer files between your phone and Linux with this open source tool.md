[#]: subject: "Transfer files between your phone and Linux with this open source tool"
[#]: via: "https://opensource.com/article/21/11/transfer-files-phone-linux"
[#]: author: "Don Watkins https://opensource.com/users/don-watkins"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13999-1.html"

使用 qrcp 在你的手机和 Linux 之间传输文件
======

> qrcp 项目提供了一种快速地从你的 iPhone 或 Android 设备中复制文件到你的 Linux 电脑的方法，反之也可。

![](https://img.linux.net.cn/data/attachment/album/202111/19/114121wt40ilipix1oo1zh.jpg)

你是否在寻找一种快速复制文件的方法，从你的 iPhone 或 Android 移动设备到你的 Linux 电脑，或者从你的 Linux 电脑到你的设备？我最近发现了一个开源的应用，它很容易安装，并且传输文件只需一个二维码。

`qrcp` 项目提供了一个命令，可以在你的终端生成一个二维码，让你通过网络向你的电脑发送或接收文件。

### 在 Linux、Windows 或 Mac 上安装 qrcp

开发者 Claudio d'Angelis 以 MIT 许可证发布了 `qrcp` 应用。我发现它很容易安装，也很容易使用。它适用于 Linux、Windows 和 macOS，可以作为 RPM、DEB 或 tarball 下载。它为几乎所有的平台做了构建，包括树莓派。

如果你想在 Linux 上安装它，下载 RPM 或 DEB，并使用你的包管理器进行本地安装。例如，在 Fedora、CentOS 或 Mageia，或类似的平台上：

```
$ sudo dnf install ./qrcp*rpm
```

如果你只是想试试，你可以下载 tar.gz 压缩包并在本地运行它：

```
$ tar --extract --file qrcp*tar.gz
$ ./qrcp version
qrcp 0.x.y
```

### 设置 qrcp

你可以通过使用 `--help` 选项查看所有可用的 `qrcp` 选项：

```
$ qrcp --help
$ ./qrcp --help
Usage:
 qrcp [flags]
 qrcp [command]

Available Commands:
 completion  Generate completion script
 config      Configure qrcp
 help        Help about any command
 receive     Receive one or more files
 send        Send a file(s) or directories from this host
 version     Print version number and build information.
[...]
```

默认配置文件位于 `~/.config/qrcp/config.json` ，你可以使用你喜欢的编辑器编辑，或从命令行调用配置向导来配置应用。

```
$ qrcp config
```

第一步是创建一个配置文件。`qrcp config` 命令将带你完成这个过程，但会问你几个问题。

第一个问题是要求你提供一个“完全限定域名”。如果你在一个不使用完全限定域名的本地网络上使用 `qrcp`（或者你不知道哪种方式），那么就把这个留空。`qrcp` 命令将使用你的本地 IP 地址代替。

下一个问题是提示你选择端口。大多数防火墙会阻止非标准的端口，但会将 8080 端口作为互联网流量的情况并不少见。如果你的防火墙屏蔽了 8080 端口，那么你还是要添加一个例外。假设你的系统使用 `firewalld`，你可以用这个命令允许 8080 端口的流量：

```
$ sudo firewall-cmd --add-port 8080/tcp --permanent
```

拒绝在“传输完成后保持网络连接”的选项，让 `qrcp` 生成一个随机路径。

假设你在一个可信的网络上，使用 HTTP（而不是 HTTPS）连接，那么你不必配置 TLS。

配置保存在 `~/.config/qrcp/config.json` 中，并且之后可以编辑，所以如果你想改变设置，它很容易更新。

更新后的配置看起来像这样：

```
{
  "fqdn": "",
  "interface": "wlp0s20f3",
  "port": 8080,
  "keepAlive": false,
  "path": "",
  "secure": false,
  "tls-key": "",
  "tls-cert": "",
  "output": "/home/don"
}
```

### 用 qrcp 传输文件

现在你已经准备好从你的 Linux 电脑向你的移动设备发送一个文件。在这个例子中，我使用了我的 iPhone，它完全不支持 Linux，这是臭名昭著的。这个过程在安卓设备上是完全一样的。

我是这样做的。首先，我在我的电脑上创建一个示例文件：

```
$ echo "Hello world"> ~/example.txt
```

接下来，我使用 `send` 子命令将文件从我的 Linux 电脑发送到我的手机：

```
Linux~$ qrcp send example.txt
```

![example of sending a file][2]

*使用 `qrcp send example.txt` 发送文件的例子（CC BY-SA 4.0）*

我打开我的相机应用（在 Android 上，我使用一个保护隐私的专用二维码扫描器），iPhone 扫描二维码并在我的手机上启动 Safari 浏览器。最后，我点击“下载”按钮。

![example download][3]

*下载示例 .txt 文件（CC BY-SA 4.0）*

### 用 qrcp 接收文件

接收文件也一样简单，只是命令略有不同：

```
$ qrcp receive
```

![example of receiving a file][4]

*使用 `qrcp receive` 命令接收一个文件（CC BY-SA 4.0）*

我扫描了二维码，它再次启动了我手机上的 Safari 浏览器，但这次出现了一些不同，因为我正在将文件从我的 iPhone 发送到 Linux 电脑上。

![example of selecting a file][5]

*选择一个要传输的文件（CC BY-SA 4.0）*

我点击“选择文件”，它让我选择想发送的文件。

![file appears in default location][6]

*文件被下载到默认位置（CC BY-SA 4.0）*

发送文件后，是在我的配置中指定的默认位置找到了文件。

### 尝试 qrcp

项目文档很简短但已足够，除了最初提出这个想法的 Claudio d'Angelis 之外，它还有开发者社区的支持。社区欢迎你加入他们，该应用将改变你对移动设备之间文件传输的看法。试试吧！

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/11/transfer-files-phone-linux

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/idea_innovation_mobile_phone.png?itok=RqVtvxkd (A person looking at a phone)
[2]: https://opensource.com/sites/default/files/send-example.png
[3]: https://opensource.com/sites/default/files/download-example.png
[4]: https://opensource.com/sites/default/files/receive-file.png
[5]: https://opensource.com/sites/default/files/select-file.jpg
[6]: https://opensource.com/sites/default/files/default-location.png
