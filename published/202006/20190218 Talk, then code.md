[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12319-1.html)
[#]: subject: (Talk, then code)
[#]: via: (https://dave.cheney.net/2019/02/18/talk-then-code)
[#]: author: (Dave Cheney https://dave.cheney.net/author/davecheney)

给开源项目贡献代码时：先讨论，再编码
======

我所参与的开源项目遵循的是一种这样的理念，我把它描述为 “先讨论，再编码”。我认为一般来说这是开发软件的好方法，我想花一点时间来谈谈这种方法的好处。

### 避免伤害感情

先讨论你想做的改变最重要的原因是避免伤害感情。我经常看到一个贡献者闭门造车地提交了一个 PR，却发现他的努力工作被拒绝了。这可能有一堆原因：PR 太大了，PR 没有遵循本地风格，PR 修复了一个对项目不重要的问题或者最近间接修复了的问题，等等。

这些问题的根本原因都是缺乏沟通。“先讨论，再编码” 理念的目标不是阻碍你或给你带来挫折，而是确保一个功能第一次就能正确落地，而不至于产生大量的维护债务。无论是改动的作者，还是审查者，当一个改动突然出现时，并暗示说 “好吧，我已经做完了，你要做的就是合并它，对吧？”，先讨论可以让他们不必背负伤害感情的情绪负担。

### 讨论应该如何进行？

每一个新功能或错误修复都应该在工作开始前与项目的维护者讨论。私下试验是可以的，但不要在没有讨论之前就发送修改。

对于简单的改动，“讨论” 的定义可以只是 GitHub 议题中的一个设计草图。如果你的 PR 修复了一个 bug，你应该链接到它修复的 bug。如果没有，你应该先提出一个 bug，等待维护者确认后再发送 PR。这可能看起来有点落后 —— 谁不希望一个 bug 被修复呢 —— 但考虑到这个 bug 可能是对软件工作方式的误解，也可能是一个更大问题的症状，这需要进一步调查。

对于比较复杂的改动，尤其是功能请求，我建议在发送代码之前，先分发一份设计文档并达成一致。这不一定是一个完整的文档，发一个议题，带个草图可能就足够了，但关键是在用代码搞定之前，先用文字达成一致。

在任何情况下，你都不应该继续发送你的代码，直到维护者同意你的方法是他们所满意的。拉取请求是日常生活，而不仅仅是为了赶着过节。

### 代码审查，而不是由委员会设计

代码审查不是争论设计的地方。这有两个原因。首先，大多数代码审查工具都不适合长长的评论会话，GitHub 的 PR 界面在这方面非常糟糕，Gerrit 比较好，但很少有管理员团队会维护 Gerrit 实例。更重要的是，在代码审查阶段就出现了分歧，说明大家对如何实现这个变化并没有达成一致。

* * *

讨论你想写的代码，然后再写你所讨论的代码。请不要反其道而行之。

--------------------------------------------------------------------------------

via: https://dave.cheney.net/2019/02/18/talk-then-code

作者：[Dave Cheney][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://dave.cheney.net/author/davecheney
[b]: https://github.com/lujun9972
[1]: https://dave.cheney.net/2013/09/07/how-to-include-c-code-in-your-go-package (How to include C code in your Go package)
[2]: https://dave.cheney.net/2015/11/05/lets-talk-about-logging (Let’s talk about logging)
[3]: https://dave.cheney.net/2016/04/11/the-value-of-tdd (The value of TDD)
[4]: https://dave.cheney.net/2016/03/12/suggestions-for-contributing-to-an-open-source-project (Suggestions for contributing to an Open Source project)
