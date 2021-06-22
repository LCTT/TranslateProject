[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11869-1.html)
[#]: subject: (Read Reddit from the Linux terminal)
[#]: via: (https://opensource.com/article/20/1/open-source-reddit-client)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

在 Linux 终端中阅读 Reddit
======

> 在我们的 20 个使用开源提升生产力的系列的第十一篇文章中使用 Reddit 客户端 Tuir 在工作中短暂休息一下。

![](https://img.linux.net.cn/data/attachment/album/202002/09/104113w1ytjmlv1jly0j1t.jpg)

去年，我在 19 天里给你介绍了 19 个新（对你而言）的生产力工具。今年，我换了一种方式：使用你在使用或者还没使用的工具，构建一个使你可以在新一年更加高效的环境。

### 使用 Tuir 阅读 Reddit

短暂休息对于保持生产力很重要。我休息时喜欢去的地方之一是 [Reddit][2]，如果你愿意，这可能是一个很好的资源。我在那里发现了各种有关 DevOps、生产力、Emacs、鸡和 ChromeOS 项目的文章。这些讨论可能很有价值。我还关注了一些只有动物图片的子板，因为我喜欢动物（而不只是鸡）照片，有时经过长时间的工作后，我真正需要的是小猫照片。

![/r/emacs in Tuir][3]

当我阅读 Reddit（不仅仅是看动物宝宝的图片）时，我使用 [Tuir][4]（Reddit 终端 UI）。Tuir 是功能齐全的 Reddit 客户端，可以在运行 Python 的任何系统上运行。安装是通过 `pip` 完成的，非常简单。

首次运行时，Tuir 会进入 Reddit 默认文章列表。屏幕的顶部和底部有列出不同命令的栏。顶部栏显示你在 Reddit 上的位置，第二行显示根据 Reddit “Hot/New/Controversial” 等类别筛选的命令。按下筛选器前面的数字触发筛选。

![Filtering by Reddit's "top" category][5]

你可以使用箭头键或 `j`、`k`、`h` 和 `l` 键浏览列表，这与 Vi/Vim 使用的键相同。底部栏有用于应用导航的命令。如果要跳转到另一个子板，只需按 `/` 键打开提示，然后输入你要进入的子板名称。

![Logging in][6]

某些东西除非你登录，否则无法访问。如果你尝试执行需要登录的操作，那么 Tuir 就会提示你，例如发布新文章 （`c`）或赞成/反对 （`a` 和 `z`）。要登录，请按 `u` 键。这将打开浏览器以通过 OAuth2 登录，Tuir 将保存令牌。之后，你的用户名应出现在屏幕的右上方。

Tuir 还可以打开浏览器来查看图像、加载链接等。稍作调整，它甚至可以在终端中显示图像（尽管我没有让它可以正常工作）。

总的来说，我对 Tuir 在我需要休息时能快速跟上 Reddit 感到很满意。

Tuir 是现已淘汰的 [RTV][7] 的两个分叉之一。另一个是 [TTRV][8]，它还无法通过 `pip` 安装，但功能相同。我期待看到它们随着时间的推移脱颖而出。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/open-source-reddit-client

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_web_internet_website.png?itok=g5B_Bw62 (Digital creative of a browser on the internet)
[2]: https://www.reddit.com/
[3]: https://opensource.com/sites/default/files/uploads/productivity_11-1.png (/r/emacs in Tuir)
[4]: https://gitlab.com/ajak/tuir
[5]: https://opensource.com/sites/default/files/uploads/productivity_11-2.png (Filtering by Reddit's "top" category)
[6]: https://opensource.com/sites/default/files/uploads/productivity_11-3.png (Logging in)
[7]: https://github.com/michael-lazar/rtv
[8]: https://github.com/tildeclub/ttrv
