[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11042-1.html)
[#]: subject: (Use Firefox Send with ffsend in Fedora)
[#]: via: (https://fedoramagazine.org/use-firefox-send-with-ffsend-in-fedora/)
[#]: author: (Sylvia Sánchez https://fedoramagazine.org/author/lailah/)

在 Fedora 中利用 ffsend 使用 Firefox Send
======

![][1]

`ffsend` 是 Firefox Send 的命令行客户端。本文将展示 Firefox Send 和 `ffsend` 如何工作。还会详细介绍如何在 Fedora 中安装和使用它。

### 什么是 Firefox Send 和 ffsend？

Firefox Send 是 Mozilla 的一个文件共享工具，它能将加密文件发送给其他用户。你可以在自己的服务器上安装 Send，也可以使用 Mozilla 托管的链接 [send.firefox.com][2]。它最大支持 1GB 的文件，链接会在可配置的下载次数（默认值为 1）或 24 小时后过期，然后会删除发送服务器上的所有文件。此工具仍*处于实验阶段*，因此不应在生产中使用或共享重要或敏感数据。

虽然 Firefox Send 本身就是工具，并且可以在 Web 中使用，但 `ffsend` 是一个可以与脚本和参数一起使用的命令行程序。它有多种配置选项，并且可以在后台工作而无需任何人为干预。

### 它如何工作？

`ffsend` 可以上传和下载文件。远程主机可以使用 Firefox 工具或其他 Web 浏览器来下载文件。 Firefox Send 和 `ffsend` 都不需要使用 Firefox。

值得一提 `ffsend` 使用了客户端加密。这意味着文件在上传*前*被加密。链接中就有密钥，因此在共享时要小心，因为任何有链接的人都可以下载该文件。作为额外的保护，你可以使用以下参数使用密码保护文件：

```
ffsend password URL -p PASSWORD
```

### 其他功能

还有一些值得一提的其他功能：

* 链接到期前可配置的下载限制，范围从 1 到 20 次之间
* 内置解压和归档功能
* 跟踪共享文件的历史记录
* 检查或删除共享文件
* 文件夹也可以按原样共享，也可以作为压缩文件共享
* 生成 QR 码，便于在手机上下载

### 如何在 Fedora 中安装

虽然 Fedora Send 可以在 Firefox 中使用而无需安装其他，但你需要安装 CLI 工具才能使用 `ffsend`。此工具在官方仓库中，因此你只需使用 `dnf` 命令，并使用 [sudo][3]。

```
$ sudo dnf install ffsend
```

之后，你可以在终端使用 `ffsend`。


### 上传文件

上传文件很简单。

```
$ ffsend upload /etc/os-release
Upload complete
Share link:  https://send.firefox.com/download/05826227d70b9a4b/#RM_HSBq6kuyeBem8Z013mg
```

现在可以使用 “Share link” URL 轻松共享该文件。

### 下载文件

下载文件和上传一样简单。

```
$ ffsend download https://send.firefox.com/download/05826227d70b9a4b/#RM_HSBq6kuyeBem8Z013mg
Download complete
```

在下载之前，检查文件是否存在并获取有关它的信息会有用。`ffsend` 为此提供了 2 个方便的命令。

```
$ ffsend exists https://send.firefox.com/download/88a6324e2a99ebb6/#YRJDh8ZDQsnZL2KZIA-PaQ
Exists: true
Password: false
$ ffsend info https://send.firefox.com/download/88a6324e2a99ebb6/#YRJDh8ZDQsnZL2KZIA-PaQ
ID:         88a6324e2a99ebb6
Downloads:  0 of 1
Expiry:     23h59m (86388s
```

### 上传历史

`ffsend` 还提供了一种查看使用工具上传的历史记录的方法。例如，如果你用脚本上传了大量文件并且想要跟踪每个文件的下载状态，那么这非常有用。

```
$ ffsend history
LINK                                            EXPIRY
 1  https://send.firefox.com/download/#8TJ9QNw  23h59m
 2  https://send.firefox.com/download/KZIA-PaQ  23h54m
```

### 删除文件

另一个有用的功能是删除文件。

```
ffsend delete https://send.firefox.com/download/2d9faa7f34bb1478/#phITKvaYBjCGSRI8TJ9QNw
```

Firefox Send 是一项很棒的服务，`ffsend` 使得它在终端使用起来非常方便。[Gitlab 仓库][4]中有关于 `ffsend` 的更多示例和文档。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/use-firefox-send-with-ffsend-in-fedora/

作者：[Sylvia Sánchez][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/lailah/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/04/firefox-send-816x345.png
[2]: http://send.firefox.com/
[3]: https://fedoramagazine.org/howto-use-sudo/
[4]: https://gitlab.com/timvisee/ffsend
