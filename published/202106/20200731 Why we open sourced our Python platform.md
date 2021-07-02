[#]: collector: "lujun9972"
[#]: translator: "zepoch"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13533-1.html"
[#]: subject: "Why we open sourced our Python platform"
[#]: via: "https://opensource.com/article/20/7/why-open-source"
[#]: author: "Meredydd Luff https://opensource.com/users/meredydd-luff"

为什么我们要开源我们的 Python 平台
======

> 开源开发的理念使得 Anvil 的整个解决方案更加有用且值得信赖。

![](https://img.linux.net.cn/data/attachment/album/202106/29/041151fpvlz4a75ihlr0lv.jpg)

Anvil 团队最近开源了 [Anvil App Server][2]， 一个用于托管完全用 Python 构建的 Web 程序的运行时引擎。

社区的反应十分积极，我们 Anvil 团队已经将许多反馈纳入了我们的 [下一个版本][3]。但是我们不断被问到的问题是，“为什么你们选择开源这个产品的核心呢？”

### 我们为何创造 Anvil

[Anvil][4] 是一个可以使得构建 Web 应用更加简单的工具。我们让你们有能力仅使用一种语言—— Python —— 就可以来构建你的整个应用。

在 Anvil 之前，如果你想要构建一个 Web app，你需要写很多代码，用很多的技术，比如 HTML、Javascript、CSS、Python、SQL、React、Redux、Bootstrap、Sass、Webpack 等。这需要花费很长时间来学习。对于一个简单的应用便是这样子；相信我，一般的应用其实 [更加复杂][5]。

![A complex framework of development tools needed for a simple web app][6]

*是的。对于一个简单的 web 应用便是需要如此多的技术。*

但即使如此，你还没有完成！你需要了解有关 Git 和云托管提供商的所有信息、如何保护（很有可能是）Linux 操作系统、如何调整数据库，然后随时待命以保持其运行。一直如此。

因此，我们开发出了 Anvil，这是一个在线 IDE，你可以在用 [拖放编辑器][7] 来设计你的 UI 界面，用 Python 编写你的 [逻辑][8]，然后 Anvil 会负责其余的工作。我们将所有的繁杂的技术栈进行了替换，只用 Python 就行啦！

### 简单的 Web 托管很重要，但还不够

Anvil 还可以为你托管你的应用程序。为什么不呢？部署 Web 应用程序非常复杂，因此运行我们自己的云托管服务是提供我们所需的简单性的唯一方法。在 Anvil 编辑器中构建一个应用程序，[单击按钮][9]，它就在网上发布了。

但我们不断听到有人说，“那太好了，但是……”

  * “我需要在没有可靠互联网接入的海外平台上运行这个应用。”
  * “我想要将我的应用程序嵌入到我售出的 IoT 设备中”
  * "如果我把我的宝都压到你的 Anvil 上，我怎么能确定十年后我的应用仍然能够运行呢？”

这些都是很好的观点！云服务并不是适合所有人的解决方案。如果我们想为这些用户提供服务，就必须有一些方法让他们把自己的应用从 Anvil 中取出来，在本地运行，由他们自己完全控制。

### 开源是一个逃生舱，而不是弹射座椅

在会议上，我们有时会被问到，“我可以将它导出为 Flask+JS 的应用程序吗？” 当然，我们可以将 Anvil 项目分别导出为 Python 和 JavaScript —— 我们可以生成一个服务器包，将客户端中的 Python 编译为 Javascript，然后生成一个经典的 Web 应用程序。但它会有严重的缺点，因为：**代码生成是一个弹射座椅。**

![Code generation is an ejector seat from a structured platform][10]

生成的代码聊胜于无；至少你可以编辑它！但是在你编辑该代码的那一刻，你就失去了生成它的系统的所有好处。如果你使用 Anvil 是因为它的 [拖放编辑器][12] 和 [运行在浏览器中的 Python][13]，那么你为什么必须使用 vim 和 Javascript 才能在本地托管你的应用程序？

我们相信 [逃生舱，而不是弹射座椅][14]。所以我们选择了一个正确的方式——我们 [开源了 Anvil 的运行引擎][2]，这与在我们的托管服务中为你的应用程序提供服务的代码相同。这是一个独立的应用程序；你可以使用文本编辑器编辑代码并在本地运行。但是你也可以将它直接用 `git` 推回到我们的在线 IDE。这不是弹射座椅；没有爆炸性的转变。这是一个逃生舱；你可以爬出来，做你需要做的事情，然后再爬回来。

### 如果它开源了，它还可靠吗

开源中的一个看似矛盾的是，它的免费可用性是它的优势，但有时也会产生不稳定的感觉。毕竟，如果你不收费，你如何保持这个平台的长期健康运行？

我们正在做我们一直在做的事情 —— 提供一个开发工具，使构建 Web 应用程序变得非常简单，尽管你使用 Anvil 构建的应用程序 100% 是你的。我们为 Anvil 应用程序提供托管，并为 [企业客户][15] 提供整个现场开发和托管平台。这使我们能够提供免费计划，以便每个人都可以将 Anvil 用于业余爱好或教育目的，或者开始构建某些东西并查看它的发展。

### 得到的多，失去的少

开源我们的运行引擎并没有减少我们的业务 —— 它使我们的在线 IDE 在今天和未来变得更有用、更值得信赖。我们为需要它的人开放了 Anvil App Server 的源代码，并提供最终的安全保障。对于我们的用户来说，这是正确的举措 —— 现在他们可以放心地进行构建，因为他们知道开源代码 [就在那里][3]，如果他们需要的话。

如果我们的开发理念与你产生共鸣，何不亲自尝试 Anvil？

-----

这篇文章改编自 [Why We Open Sourced the Anvil App Server][16]，经许可重复使用。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/why-open-source

作者：[Meredydd Luff][a]
选题：[lujun9972][b]
译者：[zepoch](https://github.com/zepoch)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/meredydd-luff
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BUS_OSwhy_520x292_ma.png?itok=lqfhAs8L "neon sign with head outline and open source why spelled out"
[2]: https://anvil.works/blog/open-source
[3]: https://github.com/anvil-works/anvil-runtime
[4]: https://anvil.works/
[5]: https://github.com/kamranahmedse/developer-roadmap#introduction
[6]: https://opensource.com/sites/default/files/uploads/frameworks.png "A complex framework of development tools needed for a simple web app"
[7]: https://anvil.works/docs/client/ui
[8]: https://anvil.works/docs/client/python
[9]: https://anvil.works/docs/deployment
[10]: https://opensource.com/sites/default/files/uploads/ejector-seat-opensourcecom.jpg "Code generation is an ejector seat from a structured platform"
[11]: https://commons.wikimedia.org/wiki/File:Crash.arp.600pix.jpg
[12]: https://anvil.works/docs/editor
[13]: https://anvil.works/docs/client
[14]: https://anvil.works/blog/escape-hatches-and-ejector-seats
[15]: https://anvil.works/docs/overview/enterprise
[16]: https://anvil.works/blog/why-open-source

