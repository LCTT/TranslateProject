[#]: subject: "With Extensions, GNOME Web is Slowly Becoming an Attractive Option on Desktop Linux"
[#]: via: "https://news.itsfoss.com/gnome-web-extensions-dev/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: "lkxed"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14797-1.html"

有了扩展，GNOME Web 正逐渐成为 Linux 桌面上一个有吸引力的选择
======

> GNOME Web 正在打磨成一个完美的 Linux 浏览器。你认同吗？

![Gnome Web 浏览器][1]

GNOME Web（Epiphany）是 [可供 Linux 用户使用的最佳浏览器][2] 之一。

它提供了简约且独特的用户体验。

不幸的是，这种独特性并没有激励用户把它作为主力网页浏览器。

但是，看起来这种情况很快就会改变……

根据其中一位开发者（Patrick，网名 TingPing）透露，GNOME Web 终于添加了对 WebExtensions 的支持。

它将会是 GNOME 43 新功能的一部分。

### 带有 WebExtensions 的 GNOME Web

![][3]

一个浏览器，外观简约，还支持扩展，夫复何求啊！

我不知道你怎么想，但我对于 GNOME Web 不支持扩展这件事，一直耿耿于怀。

所以，这个消息真的让我很兴奋！

目前，这只是对 **Epiphany 43.alpha** 版本的实验性支持。因此，你只能使用 GNOME Web 的 beta/alpha 构建来测试它。

开发者提到：

> Epiphany 43.alpha 支持上述的基本结构。我们目前正在根据 Firefox 的 ManifestV2 API 来建模行为，同时也尽可能与 Chrome 扩展程序保持兼容。未来，我们计划在保留 V2 的同时，支持 ManifestV3。

你必须在终端中显式启用扩展支持，然后下载、添加扩展的 **.xpi** 文件，以安装浏览器扩展。

你需要访问 [Mozilla 的 Firefox 附加组件门户网站][4] 来获得扩展程序。

![][5]

你可以安装 Epiphany（GNOME Web）的最新开发版本，并使用以下命令启用扩展：

```
flatpak remote-add --if-not-exists gnome-nightly https://nightly.gnome.org/gnome-nightly.flatpakrepo
flatpak install gnome-nightly org.gnome.Epiphany.Devel
flatpak run --command=gsettings org.gnome.Epiphany.Devel set org.gnome.Epiphany.web:/org/gnome/epiphany/web/ enable-webextensions true
```

请注意，它仍在活跃开发中，可能无法按预期工作。在第一次尝试时，你可能需要密切关注终端是否有错误，如果有的话，要先解决它才行。

如果你想了解更多技术细节，你可以阅读 [TingPing 的博文][6]。

### 你的下一个主力浏览器？

与 Linux 上的基于 Firefox 和 Chrome/Chromium 的浏览器相比，GNOME Web 是一个的完全独特的替代品。（LCTT 译注：GNOME Web 基于 WebKit 引擎。）

那么，随着即将推出的扩展支持，你愿意尝试将 GNOME Web 作为你的主力浏览器吗？

*你如何看待 GNOME Web（或 Epiphany）中的改进呢？请在下方评论区中告诉我们吧！*

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/gnome-web-extensions-dev/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[lkxed](https://github.com/lkxed)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/wp-content/uploads/2022/06/gnome-web-adds-extensions-support.jpg
[2]: https://itsfoss.com/best-browsers-ubuntu-linux/
[3]: https://news.itsfoss.com/wp-content/uploads/2022/06/gnome-web-extensions.png
[4]: https://addons.mozilla.org/en-US/firefox/extensions/
[5]: https://news.itsfoss.com/wp-content/uploads/2022/06/gnome-web-extensions-1.png
[6]: https://blog.tingping.se/2022/06/29/WebExtensions-Epiphany.html
