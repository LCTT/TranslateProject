[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Complementary engineering indicators)
[#]: via: (https://dave.cheney.net/2019/12/04/complementary-engineering-indicators)
[#]: author: (Dave Cheney https://dave.cheney.net/author/davecheney)

Complementary engineering indicators
======

Last year I had the opportunity to watch Cat Swetel’s presentation _[The Development Metrics You Should Use (but Don’t)][1]_. The information that could be gleaned from just tracking the start and finish date of work items was eye opening. If you’re using an issue tracker this information is probably already (perhaps with some light data munging) available — no need for TPS reports. Additionally, statistics obtained by data mining your project’s issue tracker are, perhaps, less likely to be juked.

Around the time I saw Cat’s presentation I finished reading Andy Grove’s _High Output Management_. The hidden gem in this book (assuming becoming a meeting powerhouse isn’t your bag) was Grove’s notion of indicator pairs. An example of a paired indicator might be the number of sales deals closed paired with the customer retention rate. The underling principle being optimising for one indicator will have an adverse impact on the other. In the example, overly aggressive or deceptive tactics could superficially raise the number of sales made, but would be reflected in a dip in the retention rate as customers returned the product or terminated their service prematurely.

These ideas lead me to thinking about indicators you could use for a team delivering a software product. Could those indicators be derived cheaply from the hand to hand combat of software delivery? Could they be structured in a way that aggressively pursuing one metric would be reflected negatively in another? I think so.

These are the three metrics that I’ve been using to track the health of the project that I lead.

  * Date; was the software done when we said it would be done. If you prefer this indicator as a scalar, how many days difference is there between the ship date agreed on at the start of the sprint/milestone/whatever and what was the actual date that you considered it done.
  * Completeness; when the software is done, how many of the things we said we’re going to do actually got delivered in that release.
  * Defects reported; once the software is in the field, what is the rate of bugs reported.



It is relatively easy, for example, to hit a delivery date if you aggressively descope anything risky or simply don’t do it. But in doing so this lack of promised functionality would impact the completeness metric.

Conversely, it’s straight forward to hit your milestone’s completeness target if you let the release date slip and slip. Bringing both the metics into line requires good estimation skills to judge how much can be attempted in milestone and provide direct feedback if your estimation skills needed work.

The third indicator, defects reported in the field, acts as a check on the other two. It would be easy to consistent hit your delivery date with 100% feature completion if your team does a shoddy job. The high fives and 🎉 emojis will be short lived if each release brings with it a swathe of high priority bug reports. This indicator also tends to have a second order effect, rushed features to meet a deadline tend to generate remedial work in the following milestones, crowding out promised work or blowing later deadlines.

I consider these to be complementary metrics, they should be considered together, as a group, rather than individually. Ideally your team should be delivering what you promised, when you promised it, with a low defect rate. But more importantly, if that isn’t the case, if one of the indicators is unhealthy, addressing it shouldn’t result in the problem moving to another.

### Related posts:

  1. [Never edit a method, always rewrite it][2]
  2. [The Mythical Man-Month selection bias][3]
  3. [The office coffee model of concurrent garbage collection][4]
  4. [Sydney High Performance Go workshop][5]



--------------------------------------------------------------------------------

via: https://dave.cheney.net/2019/12/04/complementary-engineering-indicators

作者：[Dave Cheney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://dave.cheney.net/author/davecheney
[b]: https://github.com/lujun9972
[1]: https://www.youtube.com/watch?v=cW3yM-K2M08
[2]: https://dave.cheney.net/2017/11/30/never-edit-a-method-always-rewrite-it (Never edit a method, always rewrite it)
[3]: https://dave.cheney.net/2013/12/04/the-mythical-man-month-selection-bias (The Mythical Man-Month selection bias)
[4]: https://dave.cheney.net/2018/12/28/the-office-coffee-model-of-concurrent-garbage-collection (The office coffee model of concurrent garbage collection)
[5]: https://dave.cheney.net/2019/07/05/sydney-high-performance-go-workshop (Sydney High Performance Go workshop)
