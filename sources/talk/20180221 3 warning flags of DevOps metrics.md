3 warning flags of DevOps metrics
======
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/metrics_graph_stats_blue.png?itok=OKCc_60D)

Metrics. Measurements. Data. Monitoring. Alerting. These are all big topics for DevOps and for cloud-native infrastructure and application development more broadly. In fact, acm Queue, a magazine published by the Association of Computing Machinery, recently devoted an [entire issue][1] to the topic.

I've argued before that we conflate a lot of things under the "metrics" term, from key performance indicators to critical failure alerts to data that may be vaguely useful someday for something or other. But that's a topic for another day. What I want to discuss here is how metrics affect behavior.

In 2008, Daniel Ariely published [Predictably Irrational][2] , one of a number of books written around that time that introduced behavioral psychology and behavioral economics to the general public. One memorable quote from that book is the following: "Human beings adjust behavior based on the metrics they're held against. Anything you measure will impel a person to optimize his score on that metric. What you measure is what you'll get. Period."

This shouldn't be surprising. It's a finding that's been repeatedly confirmed by research. It should also be familiar to just about anyone with business experience. It's certainly not news to anyone in sales management, for example. Base sales reps' (or their managers'!) bonuses solely on revenue, and they'll discount whatever it takes to maximize revenue even if it puts margin in the toilet. Conversely, want the sales force to push a new product line—which will probably take extra effort—but skip the [spiffs][3]? Probably not happening.

And lest you think I'm unfairly picking on sales, this behavior is pervasive, all the way up to the CEO, as Ariely describes in [a 2010 Harvard Business Review article][4]. "CEOs care about stock value because that's how we measure them. If we want to change what they care about, we should change what we measure," writes Ariely.

Think developers and operations folks are immune from such behaviors? Think again. Let's consider some problematic measurements. They're not all bad or wrong but, if you rely too much on them, warning flags should go up.

### Three warning signs for DevOps metrics

First, there are the quantity metrics. Lines of code or bugs fixed are perhaps self-evidently absurd. But there are also the deployments per week or per month that are so widely quoted to illustrate DevOps velocity relative to more traditional development and deployment practices. Speed is good. It's one of the reasons you're probably doing DevOps—but don't reward people on it excessively relative to quality and other measures.

Second, it's obvious that you want to reward individuals who do their work quickly and well. Yes. But. Whether it's your local pro sports team or some project team you've been on, you can probably name someone who was really a talent, but was just so toxic and such a distraction for everyone else that they were a net negative for the team. Moral: Don't provide incentives that solely encourage individual behaviors. You may also want to put in place programs, such as peer rewards, that explicitly value collaboration. [As Red Hat's Jen Krieger told me][5] in a podcast last year: "Having those automated pots of awards, or some sort of system that's tracked for that, can only help teams feel a little more cooperative with one another as in, 'Hey, we're all working together to get something done.'"

The third red flag area is incentives that don't actually incent because neither the individual nor the team has a meaningful ability to influence the outcome. It's often a good thing when DevOps metrics connect to business goals and outcomes. For example, customer ticket volume relates to perceived shortcomings in applications and infrastructure. And it's also a reasonable proxy for overall customer satisfaction, which certainly should be of interest to the executive suite. The best reward systems to drive DevOps behaviors should be tied to specific individual and team actions as opposed to just company success generally.

You've probably noticed a common theme. That theme is balance. Velocity is good but so is quality. Individual achievement is good but not when it damages the effectiveness of the team. The overall success of the business is certainly important, but the best reward systems also tie back to actions and behaviors within development and operations.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/2/three-warning-flags-devops-metrics

作者：[Gordon Haff][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/ghaff
[1]:https://queue.acm.org/issuedetail.cfm?issue=3178368
[2]:https://en.wikipedia.org/wiki/Predictably_Irrational
[3]:https://en.wikipedia.org/wiki/Spiff
[4]:https://hbr.org/2010/06/column-you-are-what-you-measure
[5]:http://bitmason.blogspot.com/2015/09/podcast-making-devops-succeed-with-red.html
