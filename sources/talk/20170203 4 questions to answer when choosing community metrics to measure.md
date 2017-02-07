4 questions to answer when choosing community metrics to measure
============================================================

> When evaluating a specific metric that you are considering including in your metrics plan, you should answer four questions.


 ![4 questions to answer when choosing community metrics to measure](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/metrics_lead-steps-measure.png?itok=dj9mvlQw "4 questions to answer when choosing community metrics to measure") 
Image by : 

[Internet Archive Book Images][4]. Modified by Opensource.com. [CC BY-SA 4.0][5]

Thus far in the [Community Metrics Playbook][6] column, I've discussed the importance of [setting goals][7] to guide the metrics process, outlined the general [types of metrics][8] that are useful for studying your community, and reviewed technical details of [available tools][9]. As you are deciding which metrics to track for your community, having a deeper understanding of each area is important so you not only choose good metrics, but also understand and plan for what to do when the numbers don't line up with expectations.

When evaluating a specific metric that you are thinking about including in your metrics plan, you should answer four questions:

*   Does it help achieve my goals?
*   How accurate is it?
*   What is its relationship to other metrics?
*   What will I do if the metrics goes "bad"?

### Goal-appropriate

This one should be obvious by now from my [previous discussion on goals][10]: Why do you need to know this metric? Does this metric have a relationship to your project's goals? If not, then you should consider ignoring it—or at least placing much less emphasis on it. Metrics that do not help measure your progress toward goals waste time and resources that could be better spent developing better metrics.

One thing to consider are intermediate metrics. These are metrics that may not have an obvious, direct relationship to your goals. They can be dangerous when considered alone and can lead to undesirable behavior simply to "meet the number," but when combined with and interpreted in the context of other intermediates, can help projects improve.

### Accuracy

Accuracy is defined as the quality or state of being correct or precise. Gauging accuracy for metrics that have built-in subjectivity and bias, such as survey questions, is difficult, so for this discussion I'll talk about objective metrics obtained by computers, which are for the most part highly precise and accurate. [Data can't lie][11], so why are we even discussing accuracy of computed metrics? The potential for inaccurate metrics stems from their human interpretation. The classic example here is _number of downloads_. This metric can be measured easily—often as part of a download site's built-in metrics—but will not be accurate if your software is split into multiple packages, or known systemic processes produce artificially inflated (or deflated) numbers, such as automated testing systems that execute repeated downloads.

As long as you recognize and avoid fixating on absolute correctness, having slightly inaccurate metrics is usually better than no metrics at all. Web analytics are [notorious][12] for being inaccurate gauges of reality due to the underlying technical nature of web servers, browsers, proxies, caching, dynamic addressing, cookies, and other aspects of computing that can muddy the waters of visitor engagement metrics; however, multiple slightly inaccurate web metrics over time can be an accurate indicator that the website refresh you did reduced your repeat visits by 30%. So don't be afraid of the fact that you'll probably never achieve 100% accuracy.

### Understanding relationships

 ![fresh lemons graph](https://opensource.com/sites/default/files/f1-falkner-02-2017_520.png "fresh lemons graph") 

_Data from: [NHTSA, DOT HS 810 780][1]. [U.S. Department of Agriculture (pdf)][2]_

The universe of metrics is full of examples stemming from the statistical phrase "[correlation does not imply causation][13]." When choosing metrics, carefully consider whether the chosen metric might have relationships to other metrics, directly or indirectly. Related metrics often can help diagnose success and failure, and indicate needed changes to your project to drive the improvement you're looking for.

Truly proving that one metric's behavior causes predictable changes in another requires quite a bit of experimentation and statistical analysis, but you don't have to take it that far. If you suspect a relationship, take note and observe their behavior over time, and if evidence suggests a relationship, then you can do experimentation in your own project to test the hypothesis.

For example, a typical goal of open source projects is to drive innovation by attracting new developers who bring their diverse experience and backgrounds to the project. A given project notices that when the "average time from contribution to code commit" decreases, the number of new contributors coming to the project increases. If evidence over time maintains this correlation, the project might decide to dedicate more resources to handling contributions. This can have an effect elsewhere—such as an increase in bugs due to lots of new code coming in—so try not to over-rotate while using your new-found knowledge.

### Planning for failure

After gauging the accuracy and applicability of a metric, you need to think about and plan for what you will do when things don't go as planned (which will happen). Consider this scenario: You've chosen several quality-related metrics for your project, and there is general agreement that they are accurate and important to the project. The QA team is working hard, yet your chosen metrics continue to suffer. What do you do? You have several choices:

*   Do nothing.
*   Make the QA team come in on the weekend to write more tests.
*   Work with developers to find the root cause of all the bugs.
*   Choose different metrics.

Which is the correct choice? The answer shouldn't surprise you: _It depends_. You may not need to do anything if the trend is expected, for example if resource constraints are forcing you to trade quality for some other metric. QA might actually need to write more tests if you have known poor coverage. Or you may need to do root cause analysis for a systemic issue in development. The last one is particularly important to include in any plan; your metrics may have become outdated and no longer align with your project's goals, and should be regularly evaluated and eliminated or replaced as needed.

Rarely will there be a single correct choice—it's more important to outline, for each metric, the potential causes for failure and which questions you need to ask and what you will do in various contexts. It doesn't have to be a lengthy checklist of actions for each possible cause, but you should at least list a handful of potential causes and how to proceed to investigate failure.

By answering these four questions about your metrics, you will gain a greater understanding of their purpose and efficacy. More importantly, sharing the answers with the rest of the project will give your community members a greater feeling of autonomy and purpose, which can be a much better motivator than simply asking them to meet a set of seemingly arbitrary numbers.

--------------------------------------------------------------------------------

译者简介：

James Falkner - Technology evangelist, teacher, learner, author, dedicated to open source and open computing. I work at Red Hat as a technical evangelist for Red Hat's portfolio of open source products and love what we do and learning from others, and occasionally teaching at conferences.

Prior to Red Hat I spent 5 years at Liferay growing a large open source community, onboarding new contributors, meeting and engaging with beginners and experts, and championing open source as the de facto choice for businesses large and small. I am based in the Orlando, Florida, USA area.

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/2/4-questions-answer-when-choosing-community-metrics-measure

作者：[James Falkner][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/james-falkner
[1]:https://crashstats.nhtsa.dot.gov/Api/Public/ViewPublication/810780
[2]:http://www.ers.usda.gov/media/320480/wrs0406f_1_.pdf
[3]:https://opensource.com/article/17/2/4-questions-answer-when-choosing-community-metrics-measure?rate=I8iVb2WNG2xAcYFvNaZfoEFTozgl_gQ-Pz8Ra1SveOE
[4]:https://www.flickr.com/photos/internetarchivebookimages/14753212581/in/photolist-otG57a-orWcFN-ovJbD4-orWgoN-otWQTN-otWmY9-otG3wg-otYjFc-otLxay-otWi5N-ovJ8pt-ocuoJr-otG4KZ-ovJ7ok-otWjdj-otY18v-otYqxn-orWptL-otWkzY-otWTnW-otYcHe-otWAx3-octWmY-otWNwd-otL2wq-otYco6-ovHSva-otFSq4-otFPP2-otWmAL-otYtwP-orWAj3-otLjQy-otWDRs-otWoPJ-otG7wR-otWBTQ-otG4b2-otWyD3-orWgCA-otWMzo-otYfHx-otY9oP-otGbrz-orWnwj-orW6gJ-ocuAd8-orW5U1-otWBcu-otFXgr/
[5]:https://creativecommons.org/licenses/by-sa/4.0/
[6]:https://opensource.com/tags/community-metrics-playbook
[7]:https://opensource.com/bus/16/8/measuring-community-health
[8]:https://opensource.com/business/16/9/choosing-right-metrics
[9]:https://opensource.com/article/16/11/tools-collecting-analyzing-community-metrics
[10]:https://opensource.com/bus/16/8/measuring-community-health
[11]:http://management.curiouscatblog.net/2007/08/09/data-cant-lie/
[12]:https://brianclifton.com/pro-lounge-files/accuracy-whitepaper.pdf
[13]:https://en.wikipedia.org/wiki/Correlation_does_not_imply_causation
[14]:https://opensource.com/user/18065/feed
[15]:https://opensource.com/users/james-falkner
