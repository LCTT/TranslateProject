[#]: subject: "LibreWolf: An Open-Source Firefox Fork Without the Telemetry"
[#]: via: "https://itsfoss.com/librewolf/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14004-1.html"

自由之狼：一个没有遥测的开源火狐复刻
======

> LibreWolf 是一个火狐浏览器的复刻，它关注于隐私和安全，消除了遥测并增加了其他好处。让我们来了解一下它。

![](https://img.linux.net.cn/data/attachment/album/202111/21/121135e2mmb6ym53hxzlmj.jpg)

<ruby>火狐<rt>Firefox</rt></ruby> 是 Linux 上最好的网页浏览器之一。然而，一些用户并不喜欢其中的遥测机制。

除此之外，有些人更喜欢一个开箱即用的、为最佳隐私和安全而调整过的浏览器，即使火狐浏览器是提供了最好的定制功能的浏览器之一。

如果你不想要火狐浏览器的干扰功能，想要一个无需你亲自调整的私密网络体验，LibreWolf（自由之狼）或许就是答案。

### LibreWolf：更好的火狐？

![][1]

假设你想使用火狐，而不使用火狐的帐户同步的能力和其他一些火狐特有的功能，如 “添加到 Pocket” 按钮。在这种情况下，LibreWolf 可以是一个不错的选择。

不同于其他火狐浏览器的复刻（例如，[Basilisk 浏览器][2]），它是定期更新的。而且，它只专注于提供私密的网页浏览体验，而不影响你在火狐中所希望得到的用户体验。

![][3]

### LibreWolf 的特点

LibreWolf 为安全的网页浏览体验提供了一套相当有用的开箱即用的功能。让我强调其中的一些特点：

  * 移除遥测功能
  * 不使用火狐账户进行云同步
  * 私密搜索供应商，如 Searx、Qwant（DuckDuckGo 被设置为默认）
  * 包含 uBlock Origin 以阻止脚本/广告
  * 没有 “添加到 Pocket” 按钮
  * 主页上默认没有赞助/推荐的内容
  * 从设置中删除火狐<ruby>状态条<rt>snippets</rt></ruby>，它用于在新标签中添加新闻/提示
  * 没有赞助的快捷提示
  * 追踪保护默认设置为“严格”模式
  * Cookies 和历史记录设置为关闭浏览器时删除
  * 默认启用 HTTPS-only 模式

正如你所注意到的，LibreWolf 的目标是提供一个更清洁和有利于隐私的体验，而不需要调整任何东西。

![][4]

如果你不想反复登录网络服务和浏览历史记录来回忆你的浏览活动，一些选项如退出时清除 cookies/历史记录可能会很不方便。

所以，如果你想从火狐切换到 LibreWolf，你可能想在决定之前测试一下网页浏览体验。

![][5]

### 在 Linux 中安装 LibreWolf

对于任何 Linux 发行版，你可以使用 AppImage 文件或 Flathub 的 Flatpak 包。

如果你不知道，你可以参考我们关于 [使用 AppImage][6] 的指南和 [Flatpak 的资源][7] 。

对于 Arch Linux 用户，它也可以在 [Arch 用户仓库（AUR）][8] 中找到。

也可以在他们的 [官方网站][9] 或 [GitLab 页面][10] 中找到其他安装说明。

你试过 LibreWolf 吗？你喜欢用什么作为你的网页浏览器？请在下面的评论中分享你的想法！

--------------------------------------------------------------------------------

via: https://itsfoss.com/librewolf/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/librewolf-about.png?resize=800%2C566&ssl=1
[2]: https://itsfoss.com/basilisk-browser/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/librewolf-firefox.png?resize=800%2C572&ssl=1
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/librewolf-tracking.png?resize=800%2C565&ssl=1
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/librewolf-addon.png?resize=800%2C340&ssl=1
[6]: https://itsfoss.com/use-appimage-linux/
[7]: https://itsfoss.com/flatpak-guide/
[8]: https://itsfoss.com/aur-arch-linux/
[9]: https://librewolf-community.gitlab.io/install/
[10]: https://gitlab.com/librewolf-community
[11]: https://librewolf-community.gitlab.io/
