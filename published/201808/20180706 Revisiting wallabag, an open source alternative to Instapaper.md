重温 wallabag：Instapaper 的开源替代品
======

> 这个稍后阅读应用增加了功能，使其成为诸如 Pocket、Paper 和 Instapaper 之类应用的可靠替代品。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/email_paper_envelope_document.png?itok=uPj_kouJ)

早在 2014 年，我[写了篇关于 wallabag 的文章][1]，它是诸如 Instapaper 和 Pocket 这样的稍后阅读应用的开源替代品。如果你愿意，去看看那篇文章吧。别担心，我会等你的。

好了么？很好。

自从我写这篇文章的四年来，[wallabag][2] 的很多东西都发生了变化。现在是时候悄悄看一下 wallabag 是如何成熟的。

### 有什么新的

最大的变化发生在幕后。Wallabag 的开发人员 Nicolas Lœuillet 和该项目的贡献者对代码进行了大量修改，从而改进了程序。每次使用时，你都会看到并感受到 wallabag 新代码库所带来的变化。

那么这些变化有哪些呢？有[很多][3]。以下是我发现最有趣和最有用的内容。

除了使 wallabag 更加快速和稳定之外，该应用的导入和导出内容的能力也得到了提高。你可以从 Pocket 和 Instapaper 导入文章，也可导入书签服务 [Pinboard][4] 中标记为 “To read” 的文章。你还可以导入 Firefox 和 Chrome 书签。

你还可以以多种格式导出文章，包括 EPUB、MOBI、PDF 和纯文本。你可以为单篇文章、所有未读文章或所有已读和未读执行此操作。我四年前使用的 wallabag 版本可以导出到 EPUB 和 PDF，但有时导出很糟糕。现在，这些导出快速而顺利。

Web 界面中的注释和高亮显示现在可以更好、更一致地工作。不可否认，我并不经常使用它们 —— 但它们不会像 wallabag v1 那样随机消失。

![](https://opensource.com/sites/default/files/uploads/wallabag-annotation.png)

wallabag 的外观和感觉也有所改善。这要归功于受 [Material Design][5] 启发的新主题。这似乎不是什么大不了的事，但这个主题使得 wallabag 在视觉上更具吸引力，使文章更容易扫描和阅读。是的，孩子们，良好的用户体验可以有所不同。

![](https://opensource.com/sites/default/files/uploads/wallabag-theme.png)

其中一个最大的变化是引入了 wallabag 的[托管版本][6]。不是只有少数人（包括你在内）没有服务器来运行网络程序，并且也不太愿意维护台服务器。当遇到任何技术问题时，我很窘迫。我不介意每年花 9 欧元（我写这篇文章的时候只要 10 美元），以获得一个我不需要关注的程序的完整工作版本。

### 没有改变什么

总的来说，wallabag 的核心功能是相同的。如上所述，更新的代码库使这些函数运行得更顺畅，更快速。

Wallabag 的[浏览器扩展][7]以同样的方式完成同样的工作。我发现这些扩展比我第一次尝试时和程序的 v1 版本时要好一些。

### 有什么令人失望的

移动应用良好，但不算很棒。它在渲染文章方面做得很好，并且有一些配置选项。但是你不能高亮或注释文章。也就是说，你可以使用该程序浏览你的存档文章。

![](https://opensource.com/sites/default/files/uploads/wallabag-android.png)

虽然 wallabag 在收藏文章方面做得很好，但有些网站的内容却无法保存。我没有碰到很多这样的网站，但已经遇到让人烦恼的情况。我不确定与 wallabag 有多大关系。相反，我怀疑它与网站的编码方式有关 —— 我在使用几个专有的稍后阅读工具时遇到了同样的问题。

Wallabag 可能不是 Pocket 或 Instapaper 的等功能的替代品，但它做得很好。自从我第一次写这篇文章以来的四年里，它已经有了明显的改善。它仍然有改进的余地，但要做好它宣传的。

### 最后的想法

自 2014 年以来，wallabag 在一直在演化。它一点一滴，一步一步地变得更好。虽然它可能不是 Instapaper 和 Pocket 等功能的替代品，但 wallabag 有价值的专有稍后阅读工具的开源替代品。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/wallabag

作者：[Scott Nesbitt][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/scottnesbitt
[1]:https://opensource.com/life/14/4/open-source-read-it-later-app-wallabag
[2]:https://wallabag.org/en
[3]:https://www.wallabag.org/en/news/wallabag-v2
[4]:https://pinboard.in
[5]:https://en.wikipedia.org/wiki/Material_Design
[6]:https://www.wallabag.it
[7]:https://github.com/wallabag/wallabagger
