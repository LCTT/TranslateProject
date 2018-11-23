The case for open source classifiers in AI algorithms
======
Machine bias is a widespread problem with potentially serious human consequences, but it's not unmanageable.

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/brain_data.png?itok=RH6NA32X)

Dr. Carol Reiley's achievements are too long to list. She co-founded [Drive.ai][1], a self-driving car startup that [raised $50 million][2] in its second round of funding last year. Forbes magazine named her one of "[20 Incredible Women in AI][3]," and she built intelligent robot systems as a PhD candidate at Johns Hopkins University.

But when she built a voice-activated human-robot interface, her own creation couldn't recognize her voice.

Dr. Reiley used Microsoft's speech recognition API to build her interface. But since the API was built mostly by young men, it hadn't been exposed to enough voice variations. After some failed attempts to lower her voice so the system would recognize her, Dr. Reiley [enlisted a male graduate][4] to lead demonstrations of her work.

Did Microsoft train its API to recognize only male voices? Probably not. It's more likely that the dataset used to train this API didn't have a wide range of voices with diverse accents, inflections, etc.

AI-powered products learn from the data they're trained on. If Microsoft's API was exposed only to male voices within a certain age range, it wouldn't know how to recognize a female voice—even if a female built the product.

This is an example of machine bias at work—and it's a more widespread problem than we think.

### What is machine bias?

[According to Gartner research][5] (available for clients), "Machine bias arises when an algorithm unfairly prefers a particular group or unjustly discriminates against another when making predictions and drawing conclusions." This bias takes one of two forms:

  * **Direct bias** occurs when models make predictions based on sensitive or prohibited attributes. These attributes include race, religion, gender, and sexual orientation.
  * **Indirect bias** is a byproduct of non-sensitive attributes that correlate with sensitive attributes. This is the more common form of machine bias. It's also the tougher form of bias to detect.



### The human impact of machine bias

In my [lightning talk][6] at Open Source Summit North America in August, I shared the Correctional Offender Management Profiling for Alternative Sanctions ([COMPAS][7]) algorithm as an example of indirect bias. Judges in more than 12 U.S. states use this algorithm to predict a defendant's likelihood to recommit crimes.

Unfortunately, [research from ProPublica][8] found that the COMPAS algorithm made incorrect predictions due to indirect bias based on race. The algorithm was two times more likely to incorrectly cite black defendants as high risks for recommitting crimes and two times more likely to incorrectly cite white defendants as low risks for recommitting crimes.

How did this happen? The COMPAS algorithm's predictions correlated with race (a sensitive/prohibited attribute). To confirm whether indirect bias exists within a dataset, the outcomes from one group are compared with another group's. If the difference exceeds some agreed-upon threshold, the model is considered unacceptably biased.

This isn't a "What if?" scenario: COMPAS's results impacted defendants' prison sentences, including the length of those sentences and whether defendants were released on parole.

Based partially on COMPAS's recommendation, a Wisconsin judged [denied probation][9] to a man named Eric Loomis. Instead, the judge gave Loomis a six-year prison sentence for driving a car that had been used in a recent shooting.

To make matters worse, we can't confirm how COMPAS reached its conclusions: The manufacturer refused to disclose how it works, which made it [a black-box algorithm][10]. But when Loomis took his case to the Supreme Court, the justices refused to give it a hearing.

This choice signaled that most Supreme Court justices condoned the algorithm's use without knowing how it reached (often incorrect) conclusions. This sets a dangerous legal precedent, especially as confusion about how AI works [shows no signs of slowing down][11].

### Why you should open source your AI algorithms

The open source community discussed this subject during a Birds of a Feather (BoF) session at Open Source Summit North America in August. During this discussion, some developers made cases for keeping machine learning algorithms private.

Along with proprietary concerns, these black-box algorithms are built on endless neurons that each have their own biases. Since these algorithms learn from the data they're trained on, they're at risk of manipulation by bad actors. One program manager at a major tech firm said his team is constantly on guard to protect their work from those with ill intent.

In spite of these reasons, there's a strong case in favor of making the datasets used to train machine learning algorithms open where possible. And a series of open source tools is helping developers solve this problem.

Local Interpretable Model-Agnostic Explanations (LIME) is an open source Python toolkit from the University of Washington. It doesn't try to dissect every factor influencing algorithms' decisions. Instead, it treats every model as a black box.

LIME uses a pick-step to select a representative set of predictions or conclusions to explain. Then it approximates the model closest to those predictions. It manipulates the inputs to the model and then measures how predictions change.

The image below, from [LIME's website][12], shows a classifier from text classification. The tool's researchers took two classes—Atheism and Christian—that are difficult to distinguish since they share so many words. Then, they [trained a forest with 500 trees][13] and got a test accuracy of 92.4%. If accuracy was your core measure of trust, you'd be able to trust this algorithm.

![](https://opensource.com/sites/default/files/uploads/classifier.png)

Projects like LIME prove that while machine bias is unavoidable, it's not unmanageable. If you add bias testing to your product development lifecycles, you can decrease the risk of bias within datasets that are used to train AI-powered products built on machine learning.

### Avoid algorithm aversion

When we don't know how algorithms make decisions, we can't fully trust them. In the near future, companies will have no choice but to be more transparent about how their creations work.

We're already seeing legislation in Europe that would fine large tech companies for not revealing how their algorithms work. And extreme as this might sound, it's what users want.

Research from the University of Chicago and the University of Pennsylvania showed that users [have more trust in modifiable algorithms][14] than in those built by experts. People prefer algorithms when they can clearly see how those algorithms work—even if those algorithms are wrong.

This supports the crucial role that transparency plays in public trust of tech. It also makes [the case for open source projects][15] that aim to solve this problem.

Algorithm aversion is real, and rightfully so. Earlier this month, Amazon was the latest tech giant to [have its machine bias exposed][16]. If such companies can't defend how these machines reach conclusions, their end users will suffer.

I gave a full talk on machine bias—including steps to solve this problem—[at Google Dev Fest DC][17] as part of DC Startup Week in September. On October 23, I'll give a [lightning talk][18] on this same subject at All Things Open in Raleigh, N.C.

Lauren Maffeo will present [Erase unconscious bias from your AI datasets][19] at [All Things Open][20], October 21-23 in Raleigh, N.C.


--------------------------------------------------------------------------------

via: https://opensource.com/article/18/10/open-source-classifiers-ai-algorithms

作者：[Lauren Maffeo][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/lmaffeo
[b]: https://github.com/lujun9972
[1]: http://Drive.ai
[2]: https://www.reuters.com/article/us-driveai-autonomous-idUSKBN19I2ZD
[3]: https://www.forbes.com/sites/mariyayao/2017/05/18/meet-20-incredible-women-advancing-a-i-research/#1876954026f9
[4]: https://techcrunch.com/2016/11/16/when-bias-in-product-design-means-life-or-death/
[5]: https://www.gartner.com/doc/3889586/control-bias-eliminate-blind-spots
[6]: https://www.youtube.com/watch?v=JtQzdTDv-P4
[7]: https://en.wikipedia.org/wiki/COMPAS_(software)
[8]: https://www.propublica.org/article/how-we-analyzed-the-compas-recidivism-algorithm
[9]: https://www.nytimes.com/2017/10/26/opinion/algorithm-compas-sentencing-bias.html
[10]: https://www.technologyreview.com/s/609338/new-research-aims-to-solve-the-problem-of-ai-bias-in-black-box-algorithms/
[11]: https://www.thenetworkmediagroup.com/blog/ai-the-facts-and-myths-lauren-maffeo-getapp
[12]: https://homes.cs.washington.edu/~marcotcr/blog/lime/
[13]: https://towardsdatascience.com/decision-trees-in-machine-learning-641b9c4e8052
[14]: https://papers.ssrn.com/sol3/papers.cfm?abstract_id=2616787
[15]: https://github.com/mbilalzafar/fair-classification
[16]: https://www.reuters.com/article/us-amazon-com-jobs-automation-insight/amazon-scraps-secret-ai-recruiting-tool-that-showed-bias-against-women-idUSKCN1MK08G
[17]: https://www.facebook.com/DCstartupweek/videos/1919103555059439/?fref=mentions&__xts__%5B0%5D=68.ARD1fVGSdYCHajf8qSryp5g2MoKg4522wZ0KJGIIPJTtw3xulDIkl9A6Vg4BrnbB6BfSX-yl9D5sNMZ4rtZb8rIbBU9ueWA9xXnt6SDv_hPlo_cxIRVS2RUI_O0hYahfNvHvYi8AsCPsDRqiHO4Jt1Ex9VS67uoJ46MXynR1XQB4f5jdGp1UDQ&__tn__=K-R
[18]: https://opensource.com/article/18/10/lightning-talks-all-things-open
[19]: https://opensource.com/article/18/10/lightning-talks-all-things-open#4
[20]: https://allthingsopen.org/
