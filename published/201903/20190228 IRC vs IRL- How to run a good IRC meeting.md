[#]: collector: (lujun9972)
[#]: translator: (lujun9972)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10670-1.html)
[#]: subject: (IRCvsIRL:HowtorunagoodIRCmeeting)
[#]: via: (https://opensource。com/article/19/2/irc-vs-irl-meetings)
[#]: author: (Ben Cotton https://opensource.com/users/bcotton)

IRC vs IRL：如何召开一个良好的 IRC 会议
======

> 若你遵守这些最佳实践，Internet Relay Chat（IRC）会议可以很好滴推进项目进展。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BUSINESS_community_1.png?itok=rT7EdN2m)

开展任何形式的会议都是门艺术。很多人已经学会了开展面对面会议和电话会议，但是 [Internet Relay Chat][1]（IRC）会议因其特殊的性质有别于“<ruby>现实<rt>in real life</rt></ruby>”（IRL） 会议。本文将会分享 IRC 这种会议形式的优势和劣势，以及帮你更有效地领导 IRC 会议的小技巧。

为什么用 IRC? 虽说现在有大量的实时聊天工具可供选择，[IRC 依然是开源项目的基石][2]。若你的项目使用其他沟通工具，也不要紧。这里大多数的建议都适用于同步的文本聊天机制，只需要进行一些微调。

### IRC 会议的挑战

与面对面会议相比，IRC 会议会遇到一些挑战。你应该知道一个人结束谈话到下一个人开始谈话之间会有间隙吧？在 IRC 中这更糟糕，因为人们需要输入他们的所想。这比说话要更慢，而且不像谈话，你不知道别人什么时候在组织消息。主持人在要求回复或转到下一主题前必须等待很长一段时间。而想要发言的人需要先插入一个简短的信息（例如，一个句号）来让主持人知道（他需要发言）。

IRC 会议还缺少其他方法中能够获得的那些元数据。你无法通过文本了解面部表情和语调。这意味着你必须小心你的措辞。

而且 IRC 会议很容易让人分心。至少在面对面会议中，当某人正在看搞笑的猫咪图片时，你可以看到他面带笑容而且在不合时宜的时候发出笑声。在 IRC 中，除非他们不小心粘贴了错误的短信，否则甚至都没有同伴的压力来让他们假装专注。你甚至可以同时参加多个 IRC 会议。我就这么做过，但如果你需要积极参与这些会议，那就很危险了。

### IRC 会议的优势

IRC 会议也有某些独一无二的优势。IRC 是一个非常轻资源的媒介。它并不怎么消耗带宽和 CPU。这降低了参与的门槛，这对贫困这和发展中的人都是有利的。对于志愿者来说，这意味着他们可以在工作日参加会议。同时它也意味着参与者无需寻找一个安静的地方来让他们沟通而不打扰到周围的人。

借助会议机器人，IRC 可以立即生成会议记录。在 Fedora 中，我们使用 Zodbot（Debian 的 [Meetbot][3] 的一个实例）来记录会议并提供交互。会议结束后，会议记录和完整的日志立即可供社区使用。这减少了开展会议的管理开销。

### 这跟普通会议类似，但有所不同

通过 IRC 或其他基于文本的媒介进行会议意味着以稍微不同寻常的方式来看待会议。虽然它缺少一些更高带宽沟通模式的优点，但它也有自己的优点。开展 IRC 会议可以让你有机会开发出各种规则，而这些规则有助于你开展各种类型的会议。

与任何会议一样，IRC 会议最好有明确的日程和目的。一个好的会议主持者知道什么时候让谈话继续下去以及什么时候将话题拉回来。并没有什么硬性规定，这是一门艺术。但 IRC 在这方面有一个优势。通过设置频道主题为会议的当前主题，人们可以看到他们应该谈论的内容。

如果你的项目尚未实施过同步会议，你应该考虑一下。对于项目成员分布在不同时区的项目，找到一个大家都认可的时间来组织会议很难。你不能把会议作为你唯一的协调方式。但他们可以是项目工作的重要组成部分。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/2/irc-vs-irl-meetings

作者：[Ben Cotton][a]
选题：[lujun9972][b]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/bcotton
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Internet_Relay_Chat
[2]: https://opensource.com/article/16/6/getting-started-irc
[3]: https://wiki.debian.org/MeetBot
