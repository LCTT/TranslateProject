[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12856-1.html)
[#]: subject: (How to Install Google Chrome on Fedora [Beginner’s Tutorial])
[#]: via: (https://itsfoss.com/install-google-chrome-fedora/)
[#]: author: (Dimitrios Savvopoulos https://itsfoss.com/author/dimitrios/)

如何在 Fedora 上安装 Google Chrome 浏览器
======

![](https://img.linux.net.cn/data/attachment/album/202011/25/094346ig44av4l4lzh1v7t.jpg)

Fedora 的默认网页浏览器是 Firefox。尽管它是一个优秀的网络浏览器，你可能更喜欢流行的 Google Chrome 浏览器。

如果你想知道如何在 Fedora 上安装 Google Chrome 浏览器，让我告诉你两种安装 Google Chrome 浏览器的方式：图形化方式和命令行方式。

* [图形化方式 1：通过启用 Fedora 第三方仓库从软件中心安装 Chrome 浏览器][1]
* [图形化方式 2：从谷歌浏览器网站下载 RPM 文件][2]
* [命令行方式：从 Fedora 第三方仓库安装 Chrome，一切使用命令（与 GUI 方式 1 相同）][3]

这全取决于你喜欢哪种方式。你在 [Fedora][4] 上的 Google Chrome 浏览器都将通过这三种方式的系统更新获取定期更新。

### 方式 1：在 Fedora 中从软件中心安装 Google Chrome

Fedora 提供了一个第三方仓库，其中包含了一些流行的专有软件、图形驱动程序。Google Chrome 就是其中之一。

第一步，确保在 Fedora 中启用第三方仓库。你应该在软件中心中看到这个选项。

![Step1: Fedora Third Party Repositories][5]

启用后，只需在软件中心搜索 Chrome：

![Step 2: Search for Chrome In Fedora Software Center][6]

并从那里安装它：

![Step 3: Install Chrome Fedora][7]

还有比这更简单的吗？我觉得没有。

### 方式 2：在 Fedora 上从 Chrome 网站安装 Google Chrome

如果你不想启用第三方仓库，也没关系。你不必这样做。你可以从 Chrome 的网站上下载 RPM 文件，双击并安装它。

访问 Google Chrome 的网站，点击下载按钮。

- [获取 Google Chrome][8]

![][9]

然后选择 .rpm 包，点击“接受并安装”。

![][10]

下载结束后，双击文件，在包管理器提示时点击安装。输入密码，等待安装完成。

![][11]

这是超级简单的，对吧？让我们来看看有点复杂的方式（如果你不是一个终端爱好者）。

### 方式 3：使用命令行在 Fedora 上安装 Chrome

首先，你需要添加额外的 Fedora 仓库（你在方式 1 中看到的）：

```
sudo dnf install fedora-workstation-repositories
```

然后启用 Google Chrome 仓库。

```
sudo dnf config-manager --set-enabled google-chrome
```

![][12]

要安装 Google Chrome 稳定版，请在终端运行以下命令。

```
sudo dnf install google-chrome-stable
```

你会看到一个导入 GPG 密钥的警告，输入 `y` 继续。

![][13]

你正在添加 Google Chrome 仓库。这个软件包来自这个仓库，它直接来自 Google。

### 总结

即使你使用命令行，在 Fedora 上安装 Google chrome 也相当简单。除了第三方仓库的部分，这和[在 Ubuntu 上安装 Chrome][14] 差不多。

现在你已经安装好了，你可能会想[查看我们的 Google Chrome 键盘快捷键列表][15]来更快地使用浏览器。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-google-chrome-fedora/

作者：[Dimitrios Savvopoulos][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/dimitrios/
[b]: https://github.com/lujun9972
[1]: tmp.VFVwBw56ac#gui-method-1
[2]: tmp.VFVwBw56ac#gui-method-2
[3]: tmp.VFVwBw56ac#cli-method
[4]: https://getfedora.org/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/fedora-third-party-repositories.jpg?resize=800%2C400&ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/chrome-in-fedora.png?resize=800%2C400&ssl=1
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/11/installing-chrome-fedora.png?resize=800%2C400&ssl=1
[8]: https://www.google.com/chrome/
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/01/install-google-chrome-ubuntu-1.jpeg?resize=800%2C374&ssl=1
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/3.-download-rpm-chrome.png?resize=800%2C600&ssl=1
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/11/4.-install-chrome-fedora.png?resize=800%2C550&ssl=1
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/11/1.-Fedora-extra-repos.png?resize=800%2C550&ssl=1
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/2.-Fedora-GPG-key.png?resize=800%2C550&ssl=1
[14]: https://itsfoss.com/install-chrome-ubuntu/
[15]: https://itsfoss.com/google-chrome-shortcuts/