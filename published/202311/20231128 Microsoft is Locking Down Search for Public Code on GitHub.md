[#]: subject: "Microsoft is Locking Down Search for Public Code on GitHub"
[#]: via: "https://news.itsfoss.com/microsoft-github-open-source-code/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16424-1.html"

微软加码对 GitHub 上的公开代码搜索的限制
======

![][0]

> 微软，你在 GitHub 上的行为究竟是何目的？

许多用户对 [微软收购 GitHub][1] 这一事实感到失望。当然，这并非用户能阻止的事情。

因此，有些人选择转向 GitLab 或其他 [GitHub 替代品][2]，而部分人则决定坚守在 GitHub，不论他们的感受如何。

GitHub 是无数开发者熟悉的地方。无论现在是谁拥有它，这个平台都有它的价值，所以用户仍然根据自己的需求来选择使用它。

不幸的是，自微软加入之后，平台上才有了某些变化，两者之间似乎存在一些关联，而且部分改变让用户觉得不便。被关注起来的这个变化就是 2023 年 6 月实施的。

### 现在需要登录才能搜索代码

一位 GitHub 用户/贡献者 [抱怨][3] 在未登录的情况下无法在公开仓库中搜索代码，这让人非常失望。

> 📋 在 GitHub 上进行全局代码搜索已经需要登录用户操作，这样已经好几年了。现在所讨论的是仓库内搜索的情况。

下面是他的观点：

> 这真是让人感到恶心，这是对开源运动的亵渎。我必须指出，微软在这里是在滥用开源运动。
>
> 我们被告知这是出于安全考虑……但当我可以简单地克隆仓库，使用更专业的工具进行适当的搜索和分析时，那么这样的安全又是为了什么呢？
>
> 那么到底是什么原因呢？！你们还没有获得我们足够的数据吗？只是靠每次上厕所就能赚点钱，你们还要追踪我在看哪一行代码？

此外，他解释了在他认为应公开访问的仓库中搜索代码的不便。

> 我正在老旧的机器上使用，需要在我们自己的仓库中搜索东西，结果却做不到。我其实希望人们能够搜索我们的代码库。
>
> 那我该怎么做呢？我试过登录。但是我的密码管理器不在我手边，所以我不得不拿出我的手机。哦！现在我需要 2FA。然后我得回办公室拿我的 Yubi 密钥。旧的笔记本没有 USB-C 端口？好吧，现在我无能为力了。
>
> 这个变化不仅没必要，而且对你们自己的客户来说，简直是**敌意**。猖獗的敌意！

实际上，无法访问本应公开且对“**所有人**”开放的代码库让人极度不便。

这就是开源代码应该如何访问的，对吗？

Martin Woodward，**GitHub 的开发者关系副总裁**，对这个反馈简单地表示，这是一段时间以来的一个改变，主要是为了避免机器人。

> 对 [@koepnick][4] 的不便感到抱歉，虽然在很长一段时间里，我们在全仓库范围内的搜索都要求用户登录，但是当我们在 2023 年提升了搜索能力后，我们不得不将这一要求扩大到仓库内（参看 [https://github.blog/changelog/2023-06-07-code-search-now-requires-login/][5])。
>
> 主要是确保我们的服务器能够支撑 GitHub 上的开发者负载，并帮助防止服务器被匿名请求等机器人行为压垮。

当然，这是一个大公司的预期回应。不幸的是，这并没有说服为什么要在 GitHub 上做出这样的改变，而其他平台并没有这个限制。

声明说的更多的是“何时实施了此项更改”。

幸运的是，[代码搜索团队的一员][6] 试图阐述他们通过限制获得的优势。

**太长不看版：该策略可以减少滥用，但并不能阻止所有的机器人。**

那么，让我们思考一下，作为科技行业的重要参与者，微软没有足够的基础设施来抵御机器人，而不是通过限制访问代码来做到这一点吗？难道没有其他方式来保护代码免受机器人和其他恶意抓取器的侵袭，而不需要禁用搜索功能吗？

此外，讨论中的一些用户指出，开源代码的全部意义就在于任何人，无论身份是已知还是未知，都应该可以访问。

尽管代码关联到了开源许可证，但是这个限制似乎违反了开源的概念。

_微软是正在私下里试图控制 GitHub 上的开源利益吗？_ 🤔

💬 也许微软需要重新考虑这个变动，来让事情变得好一些？或者，也许他们可以提供一个比声明中更好的解释？

*（题图：MJ/d35ceb65-521d-4313-8e4c-60df0a898455）*

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/microsoft-github-open-source-code/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[ChatGPT](https://linux.cn/lctt/ChatGPT)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/microsoft-github/
[2]: https://itsfoss.com/github-alternatives/
[3]: https://github.com/orgs/community/discussions/77046
[4]: https://github.com/koepnick
[5]: https://github.blog/changelog/2023-06-07-code-search-now-requires-login/
[6]: https://github.com/orgs/community/discussions/77046#discussioncomment-7683240
[0]: https://img.linux.net.cn/data/attachment/album/202311/29/082734mnmvpphzuz4pojjx.png