[#]: subject: "Run Web Applications in Linux Using Tangram Browser"
[#]: via: "https://itsfoss.com/tangram/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "anine09"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13777-1.html"

使用 Tangram 浏览器在 Linux 中运行 Web 应用
=======

> Tangram 是一个旨在帮助你在 Linux 中运行和管理 Web 应用的浏览器。一起来看看它是如何使用的吧。

对于一些工具来说，即使我们有许多 Linux 原生应用，但是许多人最终还是选择使用 Web 应用。

他们也许是使用 Electron 构建的应用，或是直接在浏览器中打开的网页，使用原生应用正在成为一种比较“传统”的做法。

当然，不管在什么平台运行 Web 应用都会占用更多的系统资源。而且，考虑到每一个服务都正在提供基于 Web 的方式，而不是原生体验，我们就需要一种有效管理 Web 应用的解决方案。

一款开源的 Linux 应用 Tangram 或许就是这个解决方案。

### Tangram：专为 Web 应用设计的浏览器

![][1]

你可以选择其他 [优秀的浏览器][2] 来运行 Web 应用，但是如果你想完全专注于 Web 应用体验的浏览器，Tangram 是个不错的选择。

Tangram 的开发者从 GNOME Web、[Franz][3] 和  [Rambox][4] 中获得了灵感。

没有其他花里胡哨的功能，只是能更改你的<ruby>用户代理<rt>User Agent</rt></ruby>和管理你所登录的 Web 应用。

它可以用于访问多个社交媒体，聊天工具，工作协同应用等等。

### Tangram 的特性

![][5]

考虑到 Tangram 是一个基于 WebKitGTK 的精简化浏览器，它拥有的功能不算很多，下面是一些功能要点：

  * 重新排列侧边栏的标签
  * 方便地将任何一个 Web 服务添加为 Web 应用程序
  * 调整用户代理（桌面端和移动端） 
  * 使用键盘快捷键
  * 改变侧边栏（标签栏）的位置

你所需要做的就是加载一个 Web 服务，登录，然后点击“完成”，将其添加为 Web 应用程序。

![][6]

### 在 Linux 中安装 Tangram

每个 Linux 发行版都可以通过 Flatpak 来安装 Tangram，你也可以在 [AUR][7] 中找到它。

如果你想通过终端来安装它，输入以下命令：

```
flatpak install flathub re.sonny.Tangram
```

如果你的系统没有启用 Flatpak，你可以参考我们的 [Flatpak 指南][8]。

想要了解更多信息，请访问 [Tangram 的 Github 页面][9]。

- [Tangram Browser][10]

你试过 Tangram 吗？你更喜欢 Web 应用还是原生应用？欢迎在下面的评论中分享你的想法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/tangram/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[anine09](https://github.com/anine09)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/tangram-web-app-browser.png?resize=800%2C611&ssl=1
[2]: https://itsfoss.com/best-browsers-ubuntu-linux/
[3]: https://itsfoss.com/franz-messaging-app/
[4]: https://itsfoss.com/rambox/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/tangram-settings.png?resize=530%2C290&ssl=1
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/tangram-web-app-whatsapp.png?resize=800%2C431&ssl=1
[7]: https://itsfoss.com/aur-arch-linux/

[8]: https://itsfoss.com/flatpak-guide/
[9]: https://github.com/sonnyp/Tangram
[10]: https://flathub.org/apps/details/re.sonny.Tangram
