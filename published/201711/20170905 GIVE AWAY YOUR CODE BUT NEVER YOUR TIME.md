放弃你的代码，而不是你的时间
============================================================

作为软件开发人员，我认为我们可以认同开源代码^注1 已经[改变了世界][9]。它的公共性质去除了壁垒，可以让软件可以变的最好。但问题是，太多有价值的项目由于领导者的精力耗尽而停滞不前：

>“我没有时间和精力去投入开源了。我在开源上没有得到任何收入，所以我在那上面花的时间，我可以用在‘生活上的事’，或者写作上……正因为如此，我决定现在结束我所有的开源工作。”
>
>—[Ryan Bigg，几个 Ruby 和 Elixir 项目的前任维护者][1]
>
>“这也是一个巨大的机会成本，由于我无法同时学习或者完成很多事情，FubuMVC 占用了我很多的时间，这是它现在必须停下来的主要原因。”
>
>—[前 FubuMVC 项目负责人 Jeremy Miller][2]
>
>“当我们决定要孩子的时候，我可能会放弃开源，我预计最终解决我问题的方案将是：核武器。”
>
>—[Nolan Lawson，PouchDB 的维护者之一][3]

我们需要的是一种新的行业规范，即项目领导者将_总是_能获得（其付出的）时间上的补偿。我们还需要抛弃的想法是， 任何提交问题或合并请求的开发人员都自动会得到维护者的注意。

我们先来回顾一下开源代码在市场上的作用。它是一个积木。它是[实用软件][10]，是企业为了在别处获利而必须承担的成本。如果用户能够理解该代码的用途并且发现它比替代方案（闭源专用、定制的内部解决方案等）更有价值，那么围绕该软件的社区就会不断增长。它可以更好，更便宜，或两者兼而有之。

如果一个组织需要改进该代码，他们可以自由地聘请任何他们想要的开发人员。通常情况下[为了他们的利益][11]会将改进贡献给社区，因为由于代码合并的复杂性，这是他们能够轻松地从其他用户获得未来改进的唯一方式。这种“引力”倾向于把社区聚集在一起。

但是它也会加重项目维护者的负担，因为他们必须对这些改进做出反应。他们得到了什么回报？最好的情况是，这些社区贡献可能是他们将来可以使用的东西，但现在不是。最坏的情况下，这只不过是一个带着利他主义面具的自私请求罢了。

有一类开源项目避免了这个陷阱。Linux、MySQL、Android、Chromium 和 .NET Core 除了有名，有什么共同点么？他们都对一个或多个大型企业具有_战略性重要意义_，因为它们满足了这些利益。[聪明的公司商品化他们的商品][12]，没有什么比开源软件便宜的商品了。红帽需要那些使用 Linux 的公司来销售企业级 Linux，Oracle 使用 MySQL 作为销售 MySQL Enterprise 的引子，谷歌希望世界上每个人都拥有电话和浏览器，而微软则试图将开发者锁定在平台上然后将它们拉入 Azure 云。这些项目全部由各自公司直接资助。

但是那些其他的项目呢，那些不是大玩家核心战略的项目呢？

如果你是其中一个项目的负责人，请向社区成员收取年费。_开放的源码，封闭的社区_。给用户的信息应该是“尽你所愿地使用代码，但如果你想影响项目的未来，请_为我们的时间支付_。”将非付费用户锁定在论坛和问题跟踪之外，并忽略他们的电子邮件。不支付的人应该觉得他们错过了派对。

还要向贡献者收取合并非普通的合并请求的时间花费。如果一个特定的提交不会立即给你带来好处，请为你的时间收取全价。要有原则并[记住 YAGNI][13]。

这会导致一个极小的社区和更多的分支么？绝对。但是，如果你坚持不懈地构建自己的愿景，并为其他人创造价值，他们会尽快为要做的贡献而支付。_合并贡献的意愿是[稀缺资源][4]_。如果没有它，用户必须反复地将它们的变化与你发布的每个新版本进行协调。

如果你想在代码库中保持高水平的[概念完整性][14]，那么限制社区是特别重要的。有[自由贡献政策][15]的无领导者项目没有必要收费。

为了实现更大的愿景，而不是单独为自己的业务支付成本，而是可能使其他人受益，去[众筹][16]吧。有许多成功的故事：

- [Font Awesome 5][5]
- [Ruby enVironment Management (RVM)][6] 
- [Django REST framework 3][7]

[众筹有局限性][17]。它[不适合][18][大型项目][19]。但是，开源代码也是实用软件，它不需要雄心勃勃、冒险的破局者。它已经一点点地[渗透到每个行业][20]。

这些观点代表着一条可持续发展的道路，也可以解决[开源的多样性问题][21]，这可能源于其历史上无偿的性质。但最重要的是，我们要记住，[我们一生中只留下那么多的按键次数][22]，而且我们总有一天会后悔那些我们浪费的东西。

- 注 1 ：当我说“开源”时，我的意思是代码[许可][8]以某种方式来构建专有的东西。这通常意味着一个宽松许可证（MIT 或 Apache 或 BSD），但并非总是如此。Linux 是当今科技行业的核心，但是是以 GPL 授权的。_ 

感谢 Jason Haley、Don McNamara、Bryan Hogan 和 Nadia Eghbal 阅读了这篇文章的草稿。

--------------------------------------------------------------------------------

via: http://wgross.net/essays/give-away-your-code-but-never-your-time

作者：[William Gross][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://wgross.net/#about-section
[1]:http://ryanbigg.com/2015/11/open-source-work
[2]:https://jeremydmiller.com/2014/04/03/im-throwing-in-the-towel-in-fubumvc/
[3]:https://nolanlawson.com/2017/03/05/what-it-feels-like-to-be-an-open-source-maintainer/
[4]:https://hbr.org/2010/11/column-to-win-create-whats-scarce
[5]:https://www.kickstarter.com/projects/232193852/font-awesome-5
[6]:https://www.bountysource.com/teams/rvm/fundraiser
[7]:https://www.kickstarter.com/projects/tomchristie/django-rest-framework-3
[8]:https://choosealicense.com/
[9]:https://www.wired.com/insights/2013/07/in-a-world-without-open-source/
[10]:https://martinfowler.com/bliki/UtilityVsStrategicDichotomy.html
[11]:https://tessel.io/blog/67472869771/monetizing-open-source
[12]:https://www.joelonsoftware.com/2002/06/12/strategy-letter-v/
[13]:https://martinfowler.com/bliki/Yagni.html
[14]:http://wiki.c2.com/?ConceptualIntegrity
[15]:https://opensource.com/life/16/5/growing-contributor-base-modern-open-source
[16]:https://poststatus.com/kickstarter-open-source-project/
[17]:http://blog.felixbreuer.net/2013/04/24/crowdfunding-for-open-source.html
[18]:https://www.indiegogo.com/projects/geary-a-beautiful-modern-open-source-email-client#/
[19]:http://www.itworld.com/article/2708360/open-source-tools/canonical-misses-smartphone-crowdfunding-goal-by--19-million.html
[20]:http://www.infoworld.com/article/2914643/open-source-software/rise-and-rise-of-open-source.html
[21]:http://readwrite.com/2013/12/11/open-source-diversity/
[22]:http://keysleft.com/
[23]:http://wgross.net/essays/give-away-your-code-but-never-your-time
