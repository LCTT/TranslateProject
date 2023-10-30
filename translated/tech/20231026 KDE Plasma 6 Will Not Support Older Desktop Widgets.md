[#]: subject: "KDE Plasma 6 Will Not Support Older Desktop Widgets"
[#]: via: "https://news.itsfoss.com/kde-plasma-6-widgets/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

KDE Plasma 6 将不支持较旧的桌面小部件
======
KDE Plasma 6 进行了一些修改，需要小部件作者进行调整。开发人员，移植时间到了！

KDE Plasma 6 是桌面环境版本中备受期待的升级版本。

最近，其发布时间表公布，第一个 Alpha 版本将于 **2023 年 11 月 8 日**上线，最终 **Beta 版本于 2023 年 1 月 31 日**上线，稳定版计划于 **2024 年 2 月 28 日**上线。

考虑到 KDE Plasma 5.x 系列包含多项改进和功能添加，许多用户对 KDE Plasma 6 带来的功能感到兴奋。

如果你好奇，我们已经介绍了 [KDE Plasma 6 的主要变化][1]。因此，它会发生重大变化也就不足为奇了。

然而，在进行重大修改后，可能会出现一些重大变化，例如无法在 Plasma 6 上运行任何旧版小部件。

### 给小部件开发者的移植通知

在 KDE 的 _Nate Graham_ 最近发表的一篇[博客文章][2]中，向 Plasma 5 小部件作者发出了正式的警告。

突出显示的信息是：

> **你需要将你的小部件移植到更新的 API，以使它们与 Plasma 6 兼容！**

Plasma 小部件 API 已随着即将发布的版本进行了修改。而且，为了适应这种变化并保持运行，小部件开发人员必须将他们的创作移植到更新的 API。

如果开发人员不移植小部件以使用更新的 API，它将无法与 KDE Plasma 6 一起运行。

![][3]

当然，流行的小部件开发人员很可能会进行移植。但是，如果你使用的小部件可以完成这项工作，但没有积极维护，那么你将不得不在使用 KDE Plasma 6 时放弃它。

已提供[移植指南][4]供开发人员遵循。

你可以在 “[Plasma 6 扩展][5]”下找到 Plasma 6 兼容小部件。在撰写本文时，只能看到列出了两个第三方小部件。

![][6]

因此，当 KDE Plasma 6 的相应开发人员移植和上传所有你喜爱的小部件时，你将找到它们。

_💬 你期待移植哪些 KDE 小部件？ 你是否认为你会错过某些不再维护的小部件？ 在下面的评论中分享你的想法。_

* * *

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/kde-plasma-6-widgets/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/kde-plasma-6-dev/
[2]: https://pointieststick.com/2023/10/24/its-time-to-port-your-widgets-to-plasma-6/
[3]: https://news.itsfoss.com/content/images/2023/04/Follow-us-on-Google-News.png
[4]: https://develop.kde.org/docs/plasma/widget/porting_kf6/
[5]: https://store.kde.org/browse?cat=705&ord=latest
[6]: https://news.itsfoss.com/content/images/2023/10/kde-plasma-6-extension.jpg
