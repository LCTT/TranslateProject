[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What metrics matter: A guide for open source projects)
[#]: via: (https://opensource.com/article/19/1/metrics-guide-open-source-projects)
[#]: author: (Gordon Haff https://opensource.com/users/ghaff)

What metrics matter: A guide for open source projects
======
5 principles for deciding what to measure.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/metrics_data_dashboard_system_computer_analytics.png?itok=oxAeIEI-)

"Without data, you're just a person with an opinion."

Those are the words of W. Edwards Deming, the champion of statistical process control, who was credited as one of the inspirations for what became known as the Japanese post-war economic miracle of 1950 to 1960. Ironically, Japanese manufacturers like Toyota were far more receptive to Deming’s ideas than General Motors and Ford were.

Community management is certainly an art. It’s about mentoring. It’s about having difficult conversations with people who are hurting the community. It’s about negotiation and compromise. It’s about interacting with other communities. It’s about making connections. In the words of Red Hat’s Diane Mueller, it’s about "nurturing conversations."

However, it’s also about metrics and data.

Some have much in common with software development projects more broadly. Others are more specific to the management of the community itself. I think of deciding what to measure and how as adhering to five principles.

### 1. Recognize that behaviors aren't independent of the measurements you choose to highlight.

In 2008, Daniel Ariely published Predictably Irrational, one of a number of books written around that time that introduced behavioral psychology and behavioral economics to the general public. One memorable quote from that book is the following: “Human beings adjust behavior based on the metrics they’re held against. Anything you measure will impel a person to optimize his score on that metric. What you measure is what you’ll get. Period.”

This shouldn’t be surprising. It’s a finding that’s been repeatedly confirmed by research. It should also be familiar to just about anyone with business experience. It’s certainly not news to anyone in sales management, for example. Base sales reps’ (or their managers’) bonuses solely on revenue, and they’ll try to discount whatever it takes to maximize revenue, even if it puts margin in the toilet. Conversely, want the sales force to push a new product line—which will probably take extra effort—but skip the spiffs? Probably not happening.

And lest you think I’m unfairly picking on sales, this behavior is pervasive, all the way up to the CEO, as Ariely describes in a 2010 Harvard Business Review article: “CEOs care about stock value because that’s how we measure them. If we want to change what they care about, we should change what we measure.”

Developers and other community members are not immune.

### 2. You need to choose relevant metrics.

There’s a lot of folk wisdom floating around about what’s relevant and important that’s not necessarily true. My colleague [Dave Neary offers an example from baseball][1]: “In the late '90s, the key measurements that were used to measure batter skill were RBI (runs batted in) and batting average (how often a player got on base with a hit, divided by the number of at-bats). The Oakland A’s were the first major league team to recruit based on a different measurement of player performance: on-base percentage. This measures how often they get to first base, regardless of how it happens.”

Indeed, the whole revolution of sabermetrics in baseball and elsewhere, which was popularized in Michael Lewis’ Moneyball, often gets talked about in terms of introducing data in a field that historically was more about gut feel and personal experience. But it was also about taking a game that had actually always been fairly numbers-obsessed and coming up with new metrics based on mostly existing data to better measure player value. (The data revolution going on in sports today is more about collecting much more data through video and other means than was previously available.)

### 3. Quantity may not lead to quality.

As a corollary, collecting lots of tangential but easy-to-capture data isn’t better than just selecting a few measurements you’ve determined are genuinely useful. In a world where online behavior can be tracked with great granularity and displayed in colorful dashboards, it’s tempting to be distracted by sheer data volume, even when it doesn’t deliver any great insight into community health and trajectory.

This may seem like an obvious point: Why measure something that isn’t relevant? In practice, metrics often get chosen because they’re easy to measure, not because they’re particularly useful. They tend to be more about inputs than outputs: The number of developers. The number of forum posts. The number of commits. Collectively, measures like this often get called vanity metrics. They’re ubiquitous, but most people involved with community management don’t think much of them.

Number of downloads may be the worst of the bunch. It’s true that, at some level, they’re an indication of interest in a project. That’s something. But it’s sufficiently distant from actively using the project, much less engaging with the project deeply, that it’s hard to view downloads as a very useful number.

Is there any harm in these vanity metrics? Yes, to the degree that you start thinking that they’re something to base action on. Probably more seriously, stakeholders like company management or industry observers can come to see them as meaningful indicators of project health.

### 4. Understand what measurements really mean and how they relate to each other.

Neary makes this point to caution against myopia. “In one project I worked on,” he says, ”some people were concerned about a recent spike in the number of bug reports coming in because it seemed like the project must have serious quality issues to resolve. However, when we looked at the numbers, it turned out that many of the bugs were coming in because a large company had recently started using the project. The increase in bug reports was actually a proxy for a big influx of new users, which was a good thing.”

In practice, you often have to measure through proxies. This isn’t an inherent problem, but the further you get between what you want to measure and what you’re actually measuring, the harder it is to connect the dots. It’s fine to track progress in closing bugs, writing code, and adding new features. However, those don’t necessarily correlate with how happy users are or whether the project is doing a good job of working towards its long-term objectives, whatever those may be.

### 5. Different measurements serve different purposes.

Some measurements may be non-obvious but useful for tracking the success of a project and community relative to internal goals. Others may be better suited for a press release or other external consumption. For example, as a community manager, you may really care about the number of meetups, mentoring sessions, and virtual briefings your community has held over the past three months. But it’s the number of contributions and contributors that are more likely to grab the headlines. You probably care about those too. But maybe not as much, depending upon your current priorities.

Still, other measurements may relate to the goals of any sponsoring organizations. The measurements most relevant for projects tied to commercial products are likely to be different from pure community efforts.

Because communities differ and goals differ, it’s not possible to simply compile a metrics checklist, but here are some ideas to think about:

Consider qualitative metrics in addition to quantitative ones. Conducting surveys and other studies can be time-consuming, especially if they’re rigorous enough to yield better-than-anecdotal data. It also requires rigor to construct studies so that they can be used to track changes over time. In other words, it’s a lot easier to measure quantitative contributor activity than it is to suss out if the community members are happier about their participation today than they were a year ago. However, given the importance of culture to the health of a community, measuring it in a systematic way can be a worthwhile exercise.

Breadth of community, including how many are unaffiliated with commercial entities, is important for many projects. The greater the breadth, the greater the potential leverage of the open source development process. It can also be instructive to see how companies and individuals are contributing. Projects can be explicitly designed to better accommodate casual contributors.

Are new contributors able to have an impact, or are they ignored? How long does it take for code contributions to get committed? How long does it take for a reported bug to be fixed or otherwise responded to? If they asked a question in a forum, did anyone answer them? In other words, are you letting contributors contribute?

Advancement within the project is also an important metric. [Mikeal Rogers of the Node.js community][2] explains: “The shift that we made was to create a support system and an education system to take a user and turn them into a contributor, first at a very low level, and educate them to bring them into the committer pool and eventually into the maintainer pool. The end result of this is that we have a wide range of skill sets. Rather than trying to attract phenomenal developers, we’re creating new phenomenal developers.”

Whatever metrics you choose, don’t forget why you made them metrics in the first place. I find a helpful question to ask is: “What am I going to do with this number?” If the answer is to just put it in a report or in a press release, that’s not a great answer. Metrics should be measurements that tell you either that you’re on the right path or that you need to take specific actions to course-correct.

For this reason, Stormy Peters, who handles community leads at Red Hat, [argues for keeping it simple][3]. She writes, “It’s much better to have one or two key metrics than to worry about all the possible metrics. You can capture all the possible metrics, but as a project, you should focus on moving one. It’s also better to have a simple metric that correlates directly to something in the real world than a metric that is a complicated formula or ration between multiple things. As project members make decisions, you want them to be able to intuitively feel whether or not it will affect the project’s key metric in the right direction.”

The article is adapted from [How Open Source Ate Software][4] by Gordon Haff (Apress 2018).

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/metrics-guide-open-source-projects

作者：[Gordon Haff][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ghaff
[b]: https://github.com/lujun9972
[1]: https://community.redhat.com/blog/2014/07/when-metrics-go-wrong/
[2]: https://opensource.com/article/17/3/nodejs-community-casual-contributors
[3]: https://medium.com/open-source-communities/3-important-things-to-consider-when-measuring-your-success-50e21ad82858
[4]: https://www.apress.com/us/book/9781484238936
