心脏流血教给我们的:成为开源的贡献者而不仅是个用户
================================================================================
![](http://readwrite.com/files/styles/1400_0/public/fields/heart-shaped-hole-heartbleed.jpg)

> 如果你的公司依赖像OpenSSL这样的开源软件，是时候主动点了。

心脏流血漏洞让开源社区如芒在背。

ComputerWorld的Richi Jennings [抨击说][1]“又一个非常可怕的开源失败。”（他是要做标题党么？）ZDNet的Steven J. Vaughan-Nichols不像是作秀反开源，却仍旧将心脏流血漏洞[渲染为][2]“开源软件的最遭时刻”。而最后，ZDNet的Chris Duckett则务实地[倡议][3]：“商业公司（应该）筹集资金来避免心脏流血再次发生。”

而实际上，企业资金并不是解决心脏流血事件的最终答案 。你才是！

想要避免开源失败的公司应该不仅仅是开源软件的用户，还要是贡献者。

### 贡献者乘坐头等舱 ###

贡献者能够引导特定的项目。他们占据主动，而不是被动接受。大多数企业缺乏资源参与他们所使用的所有开源项目，但每家公司都可以资助给那些真正关系到他们的项目。并且资助得越多，得到的好处越大。

开源就是一个不断给予的礼物，尤其是给予那些对开源反哺的人们。

我在MongoDB的同事[Adam Comerford让这点更有说服力][4]：如果你看看第一批得知Heartbleed漏洞的[时间线] [5]，那些第一批得知的（如谷歌）有一个相当大的优势。如Comford所说的，这些公司有一个显著的优势就是他们可以在bug还未大规模传开的时候率先采取措施保护他们的系统。


鉴于早期了解像Heartbleed之类问题的优势，Comerford问：“我如何确保我在这类问题的早期通知列表里面？”


如果你依赖于专有软件，你有一个答案：向卖方支付大量的金钱，并希望他适时地响应。但是，如果你正在使用开源软件，有一个更多选择： “要么有大量的员工给[开源项目]做贡献 ，或者...有认识主要贡献者的员工（我们可以找找，他们大多也会贡献其他开源软件项目，像其他的极客和呆瓜一样。“

Comerford断言说，好处不止这样：

> 这有很多好处 - 除了让问题及早通知，让手头上的专家来应付这些棘手的更新，以评估你的风险，甚至可能在公众知道之前内部解决问题。在确定项目的方向上你还可以得到重视的回馈，可以影响到关键特性的优先级。最终，你会得到社区的善意，使产品变得更好，并有可能成为其它的聪明贡献者的工作目标。

换句话说，参与进来。成员有特权，主要的特权可能就是信息。

### 选择在哪贡献 ###

同样，没有一家公司有足够的资源来有效地促进所有它所使用的项目，这就是为什么Comerford建议对关键项目上这么做的原因：

> 如果你要人们列出在企业中所有开源关键技术，你可能会得到一张很长的名单。然后，告诉他们，他们将必须清点人工和预算来支持清单上的每一种技术的话（并验证它） - 它可能会迅速缩水。

如果你是一个AMD那样的芯片公司，给Linux内核贡献基本驱动程序和其他代码很可能是强制性的。给LibreOffice贡献可能不是。或者，如果你判断你的未来在Hadoop上进行深层数据分析，你应该贡献Hadoop，即使你依旧免费使用OpenSSL社区的成果。比如Dish Networks公司，它的[ CIO告诉上周在开放商业会上的人们][6]，他们正在将重要的数据从关系型数据库转到Apache的Kafka，那他最好研究Kafka的代码，即使他不贡献给Apache HTTP服务器项目。

每家公司都有其优先级，以及这些优先级应该以严肃的承诺而确立。

这是确保这些项目安全的一部分办法。而另一部分，它是一种形成影响力指引的方式。但同时，红帽公司CEO[Jim Whitehurst][7]早在2008年声明，它是显著减少IT花费的办法：

> 今天编写的绝大多数软件是企业编写的，不得转售。并且绝大多数是从来没有真正使用过。IT软件开发中的浪费是巨大的....最终，开源给全世界的客户提供价值，我们不仅需要让我们的客户作为开源产品的用户，而且真正加入开源和参与在开发社区。


Comerford坚持认为：“如果我在业务中使用开源软件，我应该雇开发人员来积极给软件做贡献，如果他们自己不是核心开发者，那就雇佣核心开发者。 ”这是充分利用开源软件的关键：给它做贡献，不只是使用它。

--------------------------------------------------------------------------------

via: http://readwrite.com/2014/05/14/heartbleed-open-source-contribution-users

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://blogs.computerworld.com/encryption/23767/heartbleed-openssl-open-source-fail
[2]:http://www.zdnet.com/heartbleed-open-sources-worst-hour-7000028420/
[3]:http://www.zdnet.com/openssl-needs-corporate-funding-to-avoid-heartbleed-repeat-7000028385/
[4]:http://comerford.cc/wordpress/2014/04/15/my-conclusion-heartbleed-timeline/
[5]:http://www.smh.com.au/it-pro/security-it/heartbleed-disclosure-timeline-who-knew-what-and-when-20140415-zqurk.html
[6]:http://blogs.wsj.com/cio/2014/05/06/dish-looks-to-open-source-software-after-database-failure/
[7]:http://www.cnet.com/news/red-hat-solve-enterprise-waste-through-open-source/
