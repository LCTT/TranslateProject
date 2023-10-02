[#]: subject: "Linux Users Beware! GNOME 45 is Bad News for Extensions"
[#]: via: "https://news.itsfoss.com/gnome-45-extensions/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16161-1.html"

Linux 用户注意！GNOME 45 将影响所有扩展！
======

![][0]

> GNOME 45 是一次重要的升级，但对扩展的影响并不令人满意！

每当 GNOME 升级，总会有一些扩展遭遇问题，这点并不新鲜。但如今，到了 GNOME 45，每个扩展都将面临问题！ 😱

那么，究竟是什么原因呢？让我为你解释一番。

### GNOME 45 扩展的变化

每次升级，都意味着某种技术上的提升或者变化。

而 [GNOME 45][1] 带来了许多激动人心的更新，除了这一项。

> **[GNOME 45 引入激动人心的更新][2]**

**GNOME Shell 的 JavaScript 部分发生了变化**。如果你还不清楚的话，你需要知道的是，JavaScript（以及相关的模块）负责扩展的用户界面，包括面板、菜单、对话框等。

技术上的变更主要在于，GNOME Shell 和扩展开始使用 ESModules，而不是 GJS 的自定义导入系统。

虽然这个变革旨在鼓励开发人员用更加标准化的方式来处理 GNOME Shell 和扩展的代码，但可能会造成大量困扰。

**为什么呢？**

那是因为旧有系统与新的模块系统存在不兼容问题。

以下是 **Florian Müllner** 在谈及这个技术问题时 [提到][3] 的：

> 模块加载的方式与脚本有所不同，有些语句，特别是 `import` 和 `export`，只在模块中有效。这就意味着，如果一个模块使用了这些语句（几乎是必然的），那么用旧系统导入这个模块就会出现语法错误。

那么问题影响范围呢？**所有 GNOME 扩展都将受影响。**

  * 所有针对老版本 GNOME 设计的扩展将无法在 GNOME 45 上运行（除非迁移）。
  * 专门为 GNOME 45 设计的新扩展，也无法在老版本上运行。

好消息是，GNOME 扩展的开发人员可以支持多版本的 GNOME，但他们将需要付出更多努力，为 GNOME 45 之前和之后的版本分别上传新的版本。

因此，即使开发人员选择了这样做，并使用 [迁移指南][4] 将他们的扩展移植到新系统中，这仍将花费他们更多的时间，而在此期间，终端用户（也就是我们）在使用 GNOME 45 时会遇到扩展无法运行的情况。

**这并不是一个好的用户体验，对不对？** 😒

GNOME 的升级从未能完美处理扩展的兼容问题，现在，**情况变得更糟**。

虽然我并不太依赖现有的任何 [GNOME 扩展][5]，但很多用户在日常使用中都会用到。对他们来说，一个可能破坏使用体验的升级绝非喜事。

💬 你如何看待 GNOME 45 中对扩展的变动？在下方评论中分享你的想法吧。

*（题图：MJ/d67e0592-2395-4a7d-bda6-0ec3136e40db）*

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/gnome-45-extensions/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：ChatGPT
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/gnome-45/
[2]: https://linux.cn/article-16150-1.html
[3]: https://blogs.gnome.org/shell-dev/2023/09/02/extensions-in-gnome-45/
[4]: https://gjs.guide/extensions/upgrading/gnome-shell-45.html#esm
[5]: https://itsfoss.com/gnome-shell-extensions/
[6]: https://ssl.gstatic.com/gnews/logo/google_news_1024.png
[0]: https://img.linux.net.cn/data/attachment/album/202309/05/153130xbp37iw9i3cc77m7.jpg