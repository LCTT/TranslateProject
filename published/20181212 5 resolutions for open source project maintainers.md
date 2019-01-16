[#]: collector: (lujun9972)
[#]: translator: (bestony)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10448-1.html)
[#]: subject: (5 resolutions for open source project maintainers)
[#]: via: (https://opensource.com/article/18/12/resolutions-open-source-project-maintainers)
[#]: author: (Ben Cotton https://opensource.com/users/bcotton)

一位开源项目维护者的 5 个决心
======

> 不管怎么说，好的交流是一个活跃的开源社区的必备品。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/spark_sparkler_fire_new_year_idea.png?itok=rnyMpVP8)

我通常不会定下大的新年决心。当然，我在自我提升方面没有任何问题，这篇文章我希望锚定的是这个日历中的另外一部分。不过即使是这样，这里也有一些东西要从今年的免费日历上划掉，并将其替换为一些可以激发我的自省的新日历内容。

在 2017 年，我从不在社交媒体上分享我从未阅读过的文章。我一直保持这样的状态，我也认为它让我成为了一个更好的互联网公民。对于 2019 年，我正在考虑让我成为更好的开源软件维护者的决心。

下面是一些我在一些项目中担任维护者或共同维护者时坚持的决心：

### 1、包含行为准则

Jono Bacon 在他的文章“[7 个你可能犯的错误][1]”中包含了一条“不强制执行行为准则”。当然，要强制执行行为准则，你首先需要有一个行为准则。我打算默认用[贡献者契约][2]，但是你可以使用其他你喜欢的。关于这个许可协议，最好的方法是使用别人已经写好的，而不是你自己写的。但是重要的是，要找到一些能够定义你希望你的社区执行的，无论它们是什么样子。一旦这些被记录下来并强制执行，人们就能自行决定是否成为他们想象中社区的一份子。

### 2、使许可证清晰且明确

你知道什么真的很烦么？不清晰的许可证。"这个软件基于 GPL 授权"，如果没有进一步提供更多信息的文字，我无法知道更多信息。基于哪个版本的[GPL][3]？我可以用它吗？对于项目的非代码部分，“根据知识共享许可证（CC）授权”更糟糕。我喜欢[知识共享许可证][4]，但它有几个不同的许可证包含着不同的权利和义务。因此，我将非常清楚的说明哪个许可证的变种和版本适用于我的项目。我将会在仓库中包含许可的全文，并在其他文件中包含简明的注释。

与此相关的一类问题是使用 [OSI][5] 批准的许可证。想出一个新的准确的说明了你想要表达什么的许可证是有可能的，但是如果你需要强制推行它，祝你好运。会坚持使用它么？使用您项目的人会理解么？

### 3、快速分类错误报告和问题

在技术领域, 很少有比开源维护者更贫乏的东西了。即使在小型项目中，也很难找到时间去回答每个问题并修复每个错误。但这并不意味着我不能哪怕回应一下，它没必要是多段的回复。即使只是给 GitHub 问题贴了个标签也表明了我看见它了。也许我马上就会处理它，也许一年后我会处理它。但是让社区看到它很重要，是的，这里还有人管。

### 4、如果没有伴随的文档，请不要推送新特性或错误修复

尽管多年来我的开源贡献都围绕着文档，但我的项目并没有反映出我对它的重视。我能推送的提交不多，并不不需要某种形式的文档。新的特性显然应该在他们被提交时甚至是在之前就编写文档。但即使是错误修复，也应该在发行说明中有一个条目提及。如果没有什么意外，推送提交也是很好的改善文档的机会。

### 5、放弃一个项目时，要说清楚

我很不擅长对事情说“不”，我告诉编辑我会为 [Opensource.com][6] 写一到两篇文章，而现在我有了将近 60 篇文章。哎呀。但在某些时候，曾经我有兴趣的事情也会不再有兴趣。也许该项目是不必要的，因为它的功能被吸收到更大的项目中；也许只是我厌倦了它。但这对社区是不公平的（并且存在潜在的危险，正如最近的 [event-stream 恶意软件注入][7]所示），会让该项目陷入困境。维护者有权随时离开，但他们离开时应该说清楚。

无论你是开源维护者还是贡献者，如果你知道项目维护者应该作出的其他决心，请在评论中分享！

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/resolutions-open-source-project-maintainers

作者：[Ben Cotton][a]
选题：[lujun9972][b]
译者：[bestony](https://github.com/bestony)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/bcotton
[b]: https://github.com/lujun9972
[1]: https://opensource.com/article/17/8/mistakes-open-source-avoid
[2]: https://www.contributor-covenant.org/
[3]: https://opensource.org/licenses/gpl-license
[4]: https://creativecommons.org/share-your-work/licensing-types-examples/
[5]: https://opensource.org/
[6]: http://Opensource.com
[7]: https://arstechnica.com/information-technology/2018/11/hacker-backdoors-widely-used-open-source-software-to-steal-bitcoin/
