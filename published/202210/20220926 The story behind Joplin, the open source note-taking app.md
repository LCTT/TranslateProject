[#]: subject: "The story behind Joplin, the open source note-taking app"
[#]: via: "https://opensource.com/article/22/9/joplin-interview"
[#]: author: "Richard Chambers https://opensource.com/users/20i"
[#]: collector: "lkxed"
[#]: translator: "MareDevi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15161-1.html"

开源笔记软件 Joplin 背后的故事
======

![](https://img.linux.net.cn/data/attachment/album/202210/21/112935tfapsvpac06h2sth.jpg)

> Laurent Cozic 与我坐下来，讨论了 Joplin 是如何开始的，以及这个开源笔记软件的下一步计划。  

在这次采访中，我见到了笔记软件 Joplin 的创建者 Laurent Cozic。[Joplin][2] 是 [20i][3] 奖励的赢家，所以我想了解是什么让它如此成功，以及他如何实现的。  

### 你能概述一下什么是 Joplin 吗？

[Joplin][4] 是一个开源的笔记软件。它可以让你捕获你的想法并从任何设备安全地访问它们。  

### 显然，还有很多其他的笔记应用，那么除了免费使用之外，它还有什么不同呢？

对我们的许多用户来说，它是开源的这一事实是一个非常重要的方面，因为这意味着没有供应商对数据的封锁，而且数据可以很容易地被导出并以各种方式访问。  

我们还关注用户的安全和数据隐私，特别是端到端加密同步功能，以及通过对应用的任何连接保持透明。我们还与安全研究人员合作，以保证软件更加安全。  

最后，Joplin 可以通过几种不同的方式进行定制 —— 通过插件（可以添加新的功能）和主题来定制应用程序的外观。我们还公开了一个数据 API，它允许第三方应用程序访问 Joplin 的数据。  

> **[相关阅读：5 款 Linux 上的笔记应用][5]**

### 这是一个竞争非常激烈的市场，那么是什么激发了你创建它的想法？

这是有原因的的。我从 2016 年开始研究它，因为我不喜欢现有的商业记事应用程序：笔记、附件或标签不能轻易被其他工具导出或操作。  
 
这主要是由于供应商的封锁，另外还有供应商缺乏动力，因为他们没有动力帮助用户将他们的数据转移到其他应用程序。还有一个问题是，这些公司通常会以纯文本形式保存笔记，而这有可能造成数据隐私和安全方面的问题。  

因此，我决定开始创建一个简单且具有同步功能的移动和终端应用程序，使我的笔记能够轻松地在我的设备上访问。之后又创建了桌面应用程序，项目从此开始发展。  

![Chrome OS 上 Joplin 的图片][6]

### 编写 Joplin 花了多长时间呢？

自 2016 年以来，我一直在断断续续地开发，但并不是专门去维护。不过在过去的两年里，我更加专注于它。

### 对于准备创建自己的开源应用的人，你有什么建议？

挑选一个你自己使用的项目和你喜欢的技术来工作。  

管理一个开源项目有时是很困难的，所以必须要有足够的兴趣去让它变得更有价值。那么我想 “早发布，多发布” 原则在这里也适用，这样你就可以衡量用户的兴趣，以及是否有必要花时间进一步开发这个项目。  

### 有多少人参与了 Joplin 的开发？

有 3、4 人参与开发。目前，我们还有 6 名学生在 <ruby>谷歌编程之夏<rt>Google Summer of Code</rt></ruby> 中为这个项目工作。  

### 许多人都在创建开源项目，但 Joplin 对你来说是一个巨大的成功。关于如何获得关注，你能否给开发者提供一些建议？

没有简单的公式，说实话，我不认为我可以在另一个项目中复制这种成功！你必须对你所做的事情充满热情，但同时也要严谨、有组织、稳步前进，确保代码质量保持高水平，并拥有大量的测试单元以防止回归。

同时，对于你收到的用户反馈保持开放的态度，并在此基础上改进项目。  

一旦你掌握了这些，剩下的可能就全靠运气了 —— 如果你做的项目让很多人都感兴趣，事情可能会顺利进行!  

### 一旦你得到关注，但如果你没有传统的营销预算，你如何保持这种势头？

我认为这在于倾听项目周围的社区。举个例子来说，我从未计划过建立一个论坛，但有人在 GitHub 上提出了这个建议，所以我创建了一个论坛，它成为了一个分享想法、讨论功能、提供支持等很好的方式。社区也普遍欢迎新人，这形成了一种良性循环。  

除此以外，定期就项目进行沟通也很重要。  

我们没有一个公开的路线图，因为大多数功能的 ETA 通常是 “我不知道”，但我会试图就即将到来的功能、新版本等进行沟通。我们也会就重要的事件进行沟通，特别是谷歌编程之夏，或者当我们有机会赢得像 20i FOSS 奖的时候。  

最后，我们很快将在伦敦举行一次面对面的聚会，这是与社区和合作者保持联系的另一种方式。  

### 用户的反馈是如何影响路线图的？

很明显，贡献者们经常仅仅因为他们需要某个特性而从事某些工作。但除此之外，我们还根据论坛和 GitHub 问题追踪器上的信息，追踪对用户来说似乎最重要的功能。  

例如，移动应用程序现在具有很高的优先级，因为我们经常从用户那里听到，它的限制和缺陷是有效使用 Joplin 的一个问题。  

![桌面使用Joplin的图片][8]

### 你是如何跟上最新的开发和编码的发展的？

主要是通过阅读 Hacker News！

### 你有个人最喜欢的自由/开源软件可以推荐吗？

在不太知名的项目中，[SpeedCrunch][9] 作为一个计算器非常好。它有很多功能，而且很好的是它能保留以前所有计算的历史。

我还使用 [KeepassXC][10] 作为密码管理器。在过去的几年里，它一直在稳步改进。  

最后，[Visual Studio Code][11] 作为一个跨平台的文本编辑器非常棒。  

### 我原以为 Joplin 是以 Janis 的名字命名的，但维基百科告诉我来自是 Scoot Joplin。你为什么选择这个名字？

我起初想把它命名为 “jot-it”，但我想这个名字已经被人占了。  

由于我那时经常听 Scoot Joplin 的 <ruby>拉格泰姆<rt>ragtime</rt></ruby>音乐（我相当痴迷于此），我决定使用他的名字。  

我认为产品名称的含义并不太重要，只要名称本身易于书写、发音、记忆，并与一些积极的东西（或至少没有消极的东西）有关。  

我觉得 “Joplin” 符合所有条件。  

### 关于 Joplin 的计划，你还有什么可以说的吗？也许是对一个新功能的独家预告？

如前所述，我们非常希望在用户体验设计和新功能方面对移动应用进行改进。  

我们也在考虑创建一个 “插件商店”，以便更容易地浏览和安装插件。  

感谢 Laurent — 祝 Joplin 的未来好运。

*图片来自: (Opensource.com, CC BY-SA 4.0)*

*[这篇访谈最初发表在 20i 博客上，已获得许可进行转载。][12]*

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/9/joplin-interview

作者：[Richard Chambers][a]
选题：[lkxed][b]
译者：[MareDevi](https://github.com/MareDevi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/20i
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/wfh_work_home_laptop_work.png
[2]: https://joplinapp.org/
[3]: https://www.20i.com/foss-awards/winners
[4]: https://opensource.com/article/19/1/productivity-tool-joplin
[5]: https://opensource.com/article/22/8/note-taking-apps-linux
[6]: https://opensource.com/sites/default/files/2022-09/joplin-chrome-os.png
[7]: https://opensource.com/article/21/10/google-summer-code
[8]: https://opensource.com/sites/default/files/2022-09/joplin-desktop.png
[9]: https://heldercorreia.bitbucket.io/speedcrunch/
[10]: https://opensource.com/article/18/12/keepassx-security-best-practices
[11]: https://opensource.com/article/20/6/open-source-alternatives-vs-code
[12]: https://www.20i.com/blog/joplin-creator-laurent-cozic/
