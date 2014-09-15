barney-ro translating 

Why Your Company Needs To Write More Open Source Software - ReadWrite
为什么你的公司需要参与更多的开源软件的编写
================================================================================
> Real innovation doesn't happen behind closed doors.
>闭关锁国是产生不了革新的。

![](http://a5.files.readwrite.com/image/upload/c_fill,h_900,q_70,w_1600/MTE5NDg0MDYxMTkxMzQxNTgz.jpg)

**The Wall Street Journal [thinks][1] it's news that Zulily is developing** "more software in-house." It's not. At all. As [Eric Raymond wrote][2] years ago, 95% of the world's software is written for use, not for sale. The reasons are many, but one stands out: as Zulily CIO Luke Friang declares, it's "nearly impossible for a [off the shelf] solution to keep up with our pace."

**华尔街日报 [称][1] 有消息表明，Zulily正在开发** 更多的内部软件，但实则不是。正如多年前[Eric Raymond写到][2]，全世界95%的软件写来用的，而不是售卖。原因很多，但是其中有一个比较突出：正如Zulily的CIO Luke Friang所说，基本上是没有一个[不用定制]软件解决方案能跟上我们的步伐。 

True now, just as it was true 20 years ago.

But one thing is different, and it's something the WSJ completely missed. Historically software developed in-house was zealously kept proprietary because, the reasoning went, it was the source of a firm's competitive advantage. Today, however, companies increasingly realize the opposite: there is far more to be gained by open sourcing in-house software than keeping it closed.

Which is why your company needs to contribute more open-source code. Much more.

We've gone through an anomalous time these past 20 years. While most software continued to be written for internal use, most of the attention has been focused on vendors like SAP and Microsoft that build solutions that apply to a wide range of companies.

That's the theory, anyway.

In practice, buyers spent a small fortune on license fees, then a 5X multiple on top of that to make the software fit their requirements. For example, a company may spend $100,000 on an ERP system, but they're going to spend another $500,000 making it work. 

One of the reasons open source took off, even in applications, was that companies could get a less functional product for free (or a relatively inexpensive fee) and then spend their implementation dollars tuning it to their needs. Either way, customization was necessary, but the open source approach was less costly and arguably more likely to result in a more tailored result.

Meanwhile, technology vendors doubled-down on "sameness," as Redmonk analyst [Stephen O'Grady describes][3]:

> The mainstream technology industry has, in recent years, eschewed specialization. Virtual appliances, each running a version of the operating system customized for an application or purpose, have entirely failed to dent the sales of general purpose alternatives such as RHEL or Windows. For better than twenty years, the answer to any application data persistence requirement has meant one thing: a relational database. If you were talking about enterprise application development, you were talking about Java. And so on.

Along the way, however, companies discovered that vendors weren't really meeting their needs, even for well-understood product categories like Content Management Systems. They needed different, not same.

So the customers went rogue. They became vendors. Sort of.

As is often the case, [O'Grady nails][4] this point. Writing in 2010, O'Grady uncovers an interesting trend: "Software vendors are facing a powerful new market competitor: their customers." 

Think about the most visible technologies today. Most are open source, and nearly all of them were originally written for some company's internal use, or some developer's hobby. Linux, Git, Hadoop, Cassandra, MongoDB, Android, etc. None of these technologies were originally written to be sold as products.

Instead, they were developed by companies—usually Web companies—building software to "[scratch their own itches][5]," to use the open source phrase. And unlike previous generations of in-house software developed at banks, hospitals and other organizations, they open sourced the code. 

While [some companies eschew developing custom software][6] because they don't want to maintain it, open source (somewhat) mitigates this by letting a community grow up to extend and maintain a project, thereby amortizing the costs of development for the code originators. Yahoo! started Hadoop, but its biggest contributors today are Cloudera and Hortonworks. Facebook kickstarted Cassandra, but DataStax primarily maintains it today. And so on.

Today real software innovation doesn't happen behind closed doors. Or, if it does, it doesn't stay there. It's open source, and it's upending decades of established software orthodoxy.

Not that it's for the faint of heart. 

The best open-source projects [innovate very fast][7]. Which is not the same as saying anyone will care about your open-source code. There are [significant pros and cons to open sourcing your code][8]. But one massive "pro" is that the best developers want to work on open code: if you need to hire quality developers, you need to give them an open source outlet for their work. (Just [ask Netflix][9].)

But that's no excuse to sit on the sidelines. It's time to get involved, and not for the good of some ill-defined "community." No, the primary beneficiary of open-source software development is you and your company. Better get started.

Lead image courtesy of Shutterstock.

--------------------------------------------------------------------------------

via: http://readwrite.com/2014/08/16/open-source-software-business-zulily-erp-wall-street-journal

作者：[Matt Asay][a]
译者：[barney-ro](https://github.com/barney-ro)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://readwrite.com/author/matt-asay
[1]:http://blogs.wsj.com/cio/2014/08/08/zulily-calls-in-house-software-a-differentiator-for-competitive-advantage/
[2]:http://oreilly.com/catalog/cathbazpaper/chapter/ch05.html
[3]:http://redmonk.com/sogrady/2010/01/12/roll-your-own/#ixzz3ATBuZsef
[4]:http://redmonk.com/sogrady/2010/01/12/roll-your-own/
[5]:http://en.wikipedia.org/wiki/The_Cathedral_and_the_Bazaar
[6]:http://www.abajournal.com/magazine/article/roll_your_own_software_hidden_dangers_on_the_road_less_traveled/
[7]:http://readwrite.com/2013/12/12/open-source-innovation
[8]:http://readwrite.com/2014/07/07/open-source-software-pros-cons
[9]:http://techblog.netflix.com/2012/07/open-source-at-netflix-by-ruslan.html