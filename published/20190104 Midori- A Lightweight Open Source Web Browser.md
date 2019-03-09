[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10602-1.html)
[#]: subject: (Midori: A Lightweight Open Source Web Browser)
[#]: via: (https://itsfoss.com/midori-browser)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Midori：轻量级开源 Web 浏览器
======

> 这是一个对再次回归的轻量级、快速、开源的 Web 浏览器 Midori 的快速回顾。

如果你正在寻找一款轻量级[网络浏览器替代品][1]，请试试 Midori。

[Midori][2]是一款开源的网络浏览器，它更注重轻量级而不是提供大量功能。

如果你从未听说过 Midori，你可能会认为它是一个新的应用程序，但实际上 Midori 首次发布于 2007 年。

因为它专注于速度，所以 Midori 很快就聚集了一群爱好者，并成为了 Bodhi Linux、SilTaz 等轻量级 Linux 发行版的默认浏览器。

其他发行版如 [elementary OS][3] 也使用了 Midori 作为其默认浏览器。但 Midori 的开发在 2016 年左右停滞了，它的粉丝开始怀疑 Midori 已经死了。由于这个原因，elementary OS 从最新版本中删除了它。

好消息是 Midori 还没有死。经过近两年的不活跃，开发工作在 2018 年的最后一个季度恢复了。在后来的版本中添加了一些包括广告拦截器的扩展。

### Midori 网络浏览器的功能

![Midori web browser][4]

以下是 Midori 浏览器的一些主要功能

  * 使用 Vala 编写，使用 GTK+3 和 WebKit 渲染引擎。
  * 标签、窗口和会话管理。
  * 快速拨号。
  * 默认保存下一个会话的选项卡。
  * 使用 DuckDuckGo 作为默认搜索引擎。可以更改为 Google 或 Yahoo。
  * 书签管理。
  * 可定制和可扩展的界面。
  * 扩展模块可以用 C 和 Vala 编写。
  * 支持 HTML5。
  * 少量的扩展程序包括广告拦截器、彩色标签等。没有第三方扩展程序。
  * 表单历史。
  * 隐私浏览。
  * 可用于 Linux 和 Windows。

小知识：Midori 是日语单词，意思是绿色。如果你因此而猜想的话，但 Midori 的开发者实际不是日本人。

### 体验 Midori

![Midori web browser in Ubuntu 18.04][5]

这几天我一直在使用 Midori。体验基本很好。它支持 HTML5 并能快速渲染网站。广告拦截器也没问题。正如你对任何标准 Web 浏览器所期望的那样，浏览体验挺顺滑。

缺少扩展一直是 Midori 的弱点，所以​​我不打算谈论这个。

我注意到的是它不支持国际语言。我找不到添加新语言支持的方法。它根本无法渲染印地语字体，我猜对其他非[罗曼语言][6]也是一样。

我也在 YouTube 中也遇到了麻烦。有些视频会抛出播放错误而其他视频没问题。

Midori 没有像 Chrome 那样吃我的内存，所以这是一个很大的优势。

如果你想尝试 Midori，让我们看下你该如何安装。

### 在 Linux 上安装 Midori

在 Ubuntu 18.04 仓库中不再提供 Midori。但是，可以使用 [Snap 包][7]轻松安装较新版本的 Midori。

如果你使用的是 Ubuntu，你可以在软件中心找到 Midori（Snap 版）并从那里安装。

![Midori browser is available in Ubuntu Software Center][8]

对于其他 Linux 发行版，请确保你[已启用 Snap 支持][9]，然后你可以使用以下命令安装 Midori：

```
sudo snap install midori
```

你可以选择从源代码编译。你可以从 Midori 的网站下载它的代码。

- [下载 Midori](https://www.midori-browser.org/download/)

如果你喜欢 Midori 并希望帮助这个开源项目，请向他们捐赠或[从他们的商店购买 Midori 商品][10]。

你在使用 Midori 还是曾经用过么？你的体验如何？你更喜欢使用哪种其他网络浏览器？请在下面的评论栏分享你的观点。

--------------------------------------------------------------------------------

via: https://itsfoss.com/midori-browser

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/open-source-browsers-linux/
[2]: https://www.midori-browser.org/
[3]: https://itsfoss.com/elementary-os-juno-features/
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/01/Midori-web-browser.jpeg?resize=800%2C450&ssl=1
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/01/midori-browser-linux.jpeg?resize=800%2C491&ssl=1
[6]: https://en.wikipedia.org/wiki/Romance_languages
[7]: https://itsfoss.com/use-snap-packages-ubuntu-16-04/
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/01/midori-ubuntu-software-center.jpeg?ssl=1
[9]: https://itsfoss.com/install-snap-linux/
[10]: https://www.midori-browser.org/shop
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/01/Midori-web-browser.jpeg?fit=800%2C450&ssl=1
