[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (4 misconceptions about ethics and bias in AI)
[#]: via: (https://opensource.com/article/19/8/4-misconceptions-ethics-and-bias-ai)
[#]: author: (Rachel Thomas https://opensource.com/users/rachel-thomas)

4 misconceptions about ethics and bias in AI
======
As artificial intelligence increasingly affects our lives, we must
consider how algorithms affect real people. Join us at PyBay 2019 to
continue the conversation.
![A brain design in a head][1]

At [PyBay 2019][2] in August, I will continue a conversation I started at PyBay 2018 about the importance of ethics in the artificial intelligence (AI) we're developing, especially as it gains more and more influence in our everyday lives. In last year's keynote, I dug into how we're overlooking the essential role humans play in AI's future.

Ethical discussions around technology are more and more common, and I come to them from my first love, math. Math usually gives us a sense of certainty, but I have found that the more challenging, human parts of my work offer me the greatest potential to improve the world. If you're curious about the more technical side, here's a list of resources I put together:

> Deep Learning: <https://t.co/MhwV37J54I>
>  NLP: <https://t.co/zC31JstaF1>
>  Comp Linear Algebra: <https://t.co/CY7Gu90yLz>
>  Bias, Ethics, &amp; AI: <https://t.co/ThSz3bnZ4k>
>  Debunk Pipeline Myth: <https://t.co/qIW64edWiQ>
>  AI Needs You: <https://t.co/xUAv2eIatU> 
>  67 Questions: <https://t.co/8m7JK57Aaq>
>
> — Rachel Thomas (@math_rachel) [July 9, 2019][3]

Misconceptions about the impact of all types and parts of technology have been common for a long time, but they are hitting home ever harder as AI systems gain increasing popularity and influence over our everyday lives. In this article, I'll walk through some common misconceptions about AI ethics then offer some healthy principles we can use to make AI work with us toward a better future.

### 1\. Misconception: Engineers are only responsible for the code

There is an idea that engineers are only responsible for their code, not how the code is used nor the quality of the outcomes it produces. The problem is that in complicated, real-world systems, which involve a mixture of software and various administrative processes, often nobody feels responsible for the outcome.  For example, a software program that had bugs decreased essential healthcare services to people with serious disabilities, including cerebral palsy and diabetes, as reported in [The Verge][4].  In this case, the creator of the algorithm blamed state officials for their process, and state officials could blame the team that implemented the software, and so on, with nobody taking responsibility.

Systems where nobody feels responsible and there is no accountability do not lead to good outcomes. I don't bring up responsibility in order to point fingers, but because I want to help ensure good outcomes. Our code often interacts with very messy, real-world systems and can accidentally amplify those problems in an undesirable way.

### 2\. Misconception: Humans and computers are interchangeable

People often talk about human and computer decision makers as though they are plug-and-play interchangeable, or have the mindset of building machines to replicate exactly what humans do.  However, humans and computers are typically used in different ways in practice.

One powerful example pertains to AI's value proposition—the idea that companies could scale services with AI that would be unaffordable if humans did all the work. Whether it's faster health insurance signups or recommending items on consumer sites, AI is meant to make life simpler for us and cheaper for service providers. The Trojan horse hiding here is that algorithms may be implemented in such a way that the outcome is a dead end with no appeals process and no way to catch or address mistakes. This can be incredibly harmful if a person is [fired from a job][5] or [denied needed healthcare][4] based on an algorithm without explanation or recourse. 

People remain at risk even when we add humans back into the equation. Studies show that when given an option to override a harmful AI conclusion, people are likely to assume the code is objective or error-free and are reluctant to override "the system."  In many cases, AI is being used because it is cheap, not because it is more accurate or leads to better outcomes. As [Cathy O'Neil][6] puts it, we are creating a world where "the privileged are processed by people; the poor are processed by algorithms."

> The privileged are processed by people; the poor are processed by algorithms. - [@mathbabedotorg][7] [pic.twitter.com/ZMEDTEPOvK][8]
>
> — Rachel Thomas (@math_rachel) [December 16, 2016][9]

Another angle posits that humans and computers are at odds with one another. That's fun in a story like competing in chess or Go, but the better issue is figuring out how machines can augment and complement human goals. Ultimately, algorithms are designed by human beings with human ends in mind.

### 3\. Misconception: We can't regulate the tech industry

I regularly hear that the tech industry is too hard to regulate and regulation won't be effective. It reminds me of a [99% Invisible podcast episode][10] about the early days of the automobile. When cars came out, there were no speed limits, licenses, or drunk driving laws, and they were made with a lot of sharp metal and shatterable glass. At the time, the idea of making cars safer was a tough conversation. People would argue that cars are inherently dangerous because the people driving them were dangerous, and that danger had nothing to do with the vehicle. At the time, the idea of making cars safer was a tough conversation, and car companies were strongly resistent to anyone discussing safety. People argued that cars were inherently dangerous because the people driving them were dangerous, and that the danger had nothing to do with the vehicle. Consumer safety advocates worked for decades to change the mindset and laws around car safety, addressing many of these previous issues.

Consider a case study on what is effective at spurring action: people warned executives of a large social media company for years (beginning as early as 2013) of how their platform was being used to incite ethnic violence in Myanmar, and executives took little action. After the UN determined in 2018 that the site had played a "determining role" in the Myanmar genocide, the company said they would hire "dozens" of additional moderators. Contrast this to when Germany passed a hate speech law with significant finacial penalties, and that same social media site hired 1,200 moderators in under a year to avoid being fined. The different orders of magnitude in response to [a potential fine vs a genocide][11] may provide insight into the potential effectiveness of regulation.

### 4\. Misconception: Tech is only about optimizing metrics

It can be easy to think of our job in tech being to optimize metrics and respond to consumer demand. 

> _"Recommendation systems and collaborative filtering are never neutral; they are always ranking one video, pin, or group against another when they're deciding what to show you."_
>  –Renee Diresta, _[Wired][12]_

Metrics are just a proxy for the things we truly care about, and over-emphasizing metrics can lead to unintended consequences. When optimizing for viewing time, a popular video site was found to be pushing the most controversial, conspiracy-centric videos because they were the ones people on the site watched for the longest time. That metrics-only perspective resulted, for example, in people interested in lawnmower reviews being recommended extremist, white supremacist conspiracy theories.

We can choose to not just optimize for metrics, but also to consider desired outcomes. [Evan Estola][13] discussed what that looked like for his team at [Meetup.com][14], in his 2016 Machine Learning Conference presentation [When Recommendations Systems Go Bad][15]. Meetup's data showed that fewer women than men were going to technology-focused meetups. There was a risk that they could create an algorithm that recommended fewer tech meetups to women, which would cause fewer women to find out about tech meetups, decreasing attendance further, and then recommending even fewer tech meetups to women. That feedback loop would result in even fewer women going to tech events. Meetup decided to short-circuit that feedback loop before it was created.

Technology impacts the world and exposes us to new ideas. We need to think more about the values we stand for and the broader systems we want to build rather than solely optimizing for metrics.

### Better principles for AI

I share these misconceptions so we can move past them and make the world a better place. We can improve our world through the ethical use of AI.Keep the following ideas in mind to create a better future with AI:

  * We have a responsibility to think about the whole system.
  * We need to work with domain experts and with those impacted by AI.
  * We have to find ways to leverage the strengths of computers and humans and bring them together for the best outcomes.
  * We must acknowledge regulation is both possible and has been impactful in the past.
  * We can't be afraid of hard and messy problems.
  * We can choose to optimize for impact on the world, not just for metrics.



By internalizing these concepts in our work and our daily lives, we can make the future a better place for everyone.

* * *

_Rachel Thomas will present [Getting Specific About Algorithmic Bias][16] at [PyBay 2019][17] August 17–18 in San Francisco. Use the [OpenSource35][18] discount code when purchasing tickets._

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/4-misconceptions-ethics-and-bias-ai

作者：[Rachel Thomas][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/rachel-thomas
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/LAW_patents4abstract_B.png?itok=6RHeRaYh (A brain design in a head)
[2]: http://pybay.com/
[3]: https://twitter.com/math_rachel/status/1148385754982363136?ref_src=twsrc%5Etfw
[4]: https://www.theverge.com/2018/3/21/17144260/healthcare-medicaid-algorithm-arkansas-cerebral-palsy
[5]: https://www.washingtonpost.com/local/education/creative--motivating-and-fired/2012/02/04/gIQAwzZpvR_story.html
[6]: https://twitter.com/math_rachel/status/809810694065385472
[7]: https://twitter.com/mathbabedotorg?ref_src=twsrc%5Etfw
[8]: https://t.co/ZMEDTEPOvK
[9]: https://twitter.com/math_rachel/status/809810694065385472?ref_src=twsrc%5Etfw
[10]: https://99percentinvisible.org/episode/nut-behind-wheel/
[11]: https://www.fast.ai/2018/04/19/facebook/#myanmar
[12]: https://www.wired.com/story/creating-ethical-recommendation-engines/
[13]: https://mlconf.com/speakers/evan-estola/
[14]: http://meetup.com/
[15]: https://mlconf.com/sessions/when-recommendations-systems-go-bad-machine-learn/
[16]: https://pybay.com/speaker/rachel-thomas/
[17]: https://pybay.com/
[18]: https://ti.to/sf-python/pybay2019/discount/OpenSource35
