[#]: subject: "GitHub Copilot is Now Available for All and Not Everyone Likes It"
[#]: via: "https://news.itsfoss.com/github-copilot/"
[#]: author: "Jacob Crume https://news.itsfoss.com/author/jacob/"
[#]: collector: "lkxed"
[#]: translator: "lkxed"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14759-1.html"

GitHub Copilot 现已可供所有人使用，但并非所有人都喜欢它
======

> GitHub Copilot 来了，它能帮助程序员，为他们提供人工智能的编码建议，不过，它是否会让事情变得更糟呢？

![GitHub][1]

在 2021 年，我曾花了好几个小时来翻阅 GitHub Copilot 文档，试图弄清楚如何能够加入它的技术预览计划。还好，这一切都得到了回报，我成功加入了预览计划。

而现在，它终于可供所有人使用啦！

如果你还不知道的话，[GitHub Copilot][2] 是一个 AI 助手，可帮助你更快、更高效地编写代码。

我能想到的最类似的东西，就是你手机上的（输入法的）自动完成功能。不过，与自动完成功能不同，GitHub Copilot 编写代码，就相当于是在完成整段的句子。

### Copilot 现已可供大众使用

正如我在前面提到的，Copilot 已经处于技术预览阶段将近一年了。这意味着，GitHub 只允许非常有限数量的开发者免费使用它，以换取同意 GitHub 监控他们的使用情况，从而改进程序的最终版本。

看起来 GitHub 终于满意地向公众发布了它。现在，任何拥有 GitHub 帐户的人都应该能够使用它，尽管需要付出一定的代价（我很快就会在下面提到）。

[公告][3] 中提到：

> 直到不久前，人工智能都没有能够帮助改进代码，开发软件的过程几乎完全是手动的。现在，这种情况正在改变。今天，我很高兴地宣布，我们正在向所有个人开发者提供 [GitHub Copilot][4]。你的 AI 配对程序员来啦。
>
> —— [Thomas Dohmke][5]，GitHub CEO

Copilot 作为免费的编辑器扩展，已经帮助数百万开发者加快了他们的编程速度。然而，它确实是有代价的，无论是直接的还是间接的。

### GitHub Copilot 定价

与几乎所有令人兴奋的新技术一样，Copilot 对某些人来说可能过于昂贵。它将花费你 10 美元/月或 100 美元/年。

如果你是开源项目维护者或经过验证的学生，那么你可以免费使用它。

### GitHub Copilot 不道德吗？

围绕 GitHub Copilot 产品的争议巨大且令人担忧。从技术上讲，这个人工智能是使用大家托管在 GitHub 上的代码来进行训练的。

因此，基本上，GitHub 是通过使用你的代码来提供一个新产品（如果你愿意的话，还可以加点料）。而且，关于 Copilot，可别忘了，自由软件基金会（FSF）也 [建议][6] 不要在 GitHub 上托管代码。

我们知道，企业总是喜欢利用事物，但有些人认为这应该不会直接损害托管在 GitHub 上的项目/代码。

**但是，是这样吗？**

简而言之，在 Copilot 发布后，许多开发者都分享说，他们发现 GitHub Copilot 生成了受版权保护的代码：

> 我试了下 GitHub Copilot，这是一项付费服务​​，来看看它是否会使用带有限制性许可证的存储库的代码。我检查了它，看看它是否有我在之前雇主那里编写的代码，该代码有一个许可证，只允许其用于免费游戏，并且需要附加许可证。是的，它确实有。

![图源：推特上的 Chris Green][7]

当然，如果我们查看 GitHub Copilot 的常见问题解答（FAQ），其中提到：

> GitHub 不拥有 GitHub Copilot 生成的建议。您在 GitHub Copilot 的帮助下编写的代码属于您自己，由您自己负责。

所以说，你为一项服务付了费，最终却为你的项目增加了不便和更多的工作？

在我看来，就简化开发者的任务而言，这听起来一点儿也不令人兴奋。

*你对此有什么想法？请在下面的评论区中分享一下吧！*

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/github-copilot/

作者：[Jacob Crume][a]
选题：[lkxed][b]
译者：[lkxed](https://github.com/lkxed)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/jacob/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/wp-content/uploads/2022/06/github-copilot.jpg
[2]: https://copilot.github.com/
[3]: https://github.blog/2022-06-21-github-copilot-is-generally-available-to-all-developers/
[4]: http://copilot.github.com
[5]: https://github.blog/author/ashtom/
[6]: https://www.fsf.org/blogs/licensing/fsf-funded-call-for-white-papers-on-philosophical-and-legal-questions-around-copilot
[7]: https://pbs.twimg.com/media/FV45qM_VEAALLv6?format=png&name=medium
[8]: https://twitter.com/ChrisGr93091552/status/1539731632931803137?ref_src=twsrc%5Etfw
