[#]: subject: "Want to Help Improve GNOME? This New Tool Gives You the Chance!"
[#]: via: "https://news.itsfoss.com/gnome-improve-tool/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14972-1.html"

想帮助改善 GNOME 吗？这个新工具给了你这个机会！
======

> 这个新的工具，使 GNOME 用户能够提供他们的配置和使用意见，以帮助改善用户体验。

![想帮助改善 GNOME 吗？ 这个新工具给了你机会！][1] 

GNOME 带来了一个工具，可以让用户匿名提供他们的配置、扩展和 GNOME 调整设置等方面的意见。

这应该有助于 GNOME 了解更多的用户偏好，并做出更好的增强用户体验的决定。

有趣的是，是红帽公司的一名实习生（Vojtech Stanek）创造了这个工具。

###  GNOME 信息收集：准备好安装了吗？

![gnome info collect terminal][2]

该工具（`gnome-info-collect`）是一个简单的终端程序，你需要下载、安装并运行它来与 GNOME 分享数据。

以下是该工具需要从你的 GNOME 系统中收集的内容：

* 硬件信息（包括制造商和型号）。
* 系统设置（包括工作区配置、共享功能、SSH 等）。
* 安装并启用的 GNOME shell 扩展。
* 应用程序信息（如已安装的应用程序和收藏的应用程序）。
* Linux 发行版和版本。
* Flatpak 和 Flathub 状态。
* 默认浏览器。
* 机器 ID + 用户名的 [加盐哈希][3]。

你可以在其 [GitLab 页面][4] 上找到适合你的发行版的软件包和收集数据的更多细节。

如果你有一个基于 Ubuntu 的发行版，你可以通过输入以下内容来安装它：

```
sudo snap install --classic gnome-info-collect
```

安装完毕后，在终端使用以下命令将其启动：

```
gnome-info-collect
```

接下来，它会显示它打算与 GNOME 共享的数据。所以，如果你觉得没问题，你可以选择将数据上传到 GNOME 的服务器上。

![][5]

考虑到这些数据是匿名的，它应该可以帮助 GNOME 了解他们的用户喜欢什么，并随着时间的推移专注于这些改进。

> **[下载 gnome-info-collect][6]**

你对 GNOME 的这个新的数据收集工具有什么看法？请在下面的评论中分享你的想法。 

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/gnome-improve-tool/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/content/images/size/w1200/2022/08/gnome-improvement-tool.jpg
[2]: https://news.itsfoss.com/content/images/2022/08/gnome-info-collect-terminal.png
[3]: https://en.wikipedia.org/wiki/Salt_(cryptography)
[4]: https://gitlab.gnome.org/vstanek/gnome-info-collect/
[5]: https://news.itsfoss.com/content/images/2022/08/gnome-info-collect-sharing.png
[6]: https://gitlab.gnome.org/vstanek/gnome-info-collect/
