在 Linux 中安装最新的 Thunderbird 邮件客户端
============================================================

雷鸟（Thunderbird） 是一个开源自由的跨平台的基于 web 的电子邮件、新闻和聊天客户端应用程序，其旨在处理多个电子邮件帐户和新闻源。

在 2016 年 12 月 28 日，Mozilla 团队宣布 Thunderbird 45.6.0 的发布。这个新版本带有如下功能：

### Thunderbird 45.6.0 功能

1.  每次启动 Thunderbird 时都会显示系统集成对话框
2.  各种错误修复和性能改进。
3.  各种安全修复。

查看更多关于 Thunderbird 45.6.0 版本的新功能和已知问题在 [Thunderbird 发行说明][1]中有。

本文将解释如何在 Linux 发行版（如 Fedora、Ubuntu 及其衍生版）中安装 Thunderbird 邮件客户端。

在许多 Linux 发行版中，Thunderbird 包已经默认包含在内，并且可以使用默认包管理系统来安装，这样可以：

1.  确保你具有所有需要的库
2.  添加桌面快捷方式以启动 Thunderbird
3.  使 Thunderbird 可供计算机上的所有系统用户访问
4.  它可能不会为你提供最新版本的 Thunderbird

### 在 Linux 中安装 Thunderbird 邮件客户端

要从系统默认仓库中安装 Thunderbird：

```
$ sudo apt-get install thunderbird   [在基于 Ubuntu 的系统中]
$ dnf install thunderbird            [在基于 Fedora 的系统中]
```

如我所说，从默认仓库中安装的话将带给你的是旧版本 Thunderbird。如果要安装最新版本的 Mozilla Thunderbird，可以使用 Mozilla 团队维护的 PPA。

在 Ubuntu 及其衍生版中使用 `CTRL + ALT + T` 从桌面打开终端并添加 Thunderbird 仓库。

```
$ sudo add-apt-repository ppa:ubuntu-mozilla-security/ppa
```

接下来，使用 `update` 命令升级软件包。

```
$ sudo apt-get update
```

系统升级完成后，使用下面的命令安装。

```
$ sudo apt-get install thunderbird
```

### Thunderbird 预览

[
 ![Install Thunderbird in Linux](http://www.tecmint.com/wp-content/uploads/2012/11/Install-Thunderbird-in-Linux.png) 
][2]

*在 Linux 中安装 Thunderbird*

就是这样了，你已经成功在 Linux 中安装了 Thunderbird 45.6.0。在 [Thunderbird 下载页][3]中 Thunderbird 还可用于其他操作系统。

--------------------------------------------------------------------------------

作者简介：

![](http://1.gravatar.com/avatar/7badddbc53297b2e8ed7011cf45df0c0?s=256&d=blank&r=g)

我是 Ravi Saive，TecMint 的创建者。一个喜欢在互联网上分享技巧和提示的计算机 Geek 和 Linux 大师。我的大多数服务器运行在 Linux 开源平台上。在 Twitter、Facebook 和 Google+ 上关注我。

--------------------------------------------------------------------------------


via: http://www.tecmint.com/install-thunderbird-in-ubuntu-fedora-linux/

作者：[Ravi Saive][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/admin/
[1]:https://www.mozilla.org/en-US/thunderbird/45.6.0/releasenotes/
[2]:http://www.tecmint.com/wp-content/uploads/2012/11/Install-Thunderbird-in-Linux.png
[3]:http://www.mozilla.org/en-US/products/thunderbird/
