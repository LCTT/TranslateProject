[#]: collector: (lujun9972)
[#]: translator: (zgj1024 )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Why DevOps is the most important tech strategy today)
[#]: via: (https://opensource.com/article/19/3/devops-most-important-tech-strategy)
[#]: author: (Kelly AlbrechtWilly-Peter Schaub https://opensource.com/users/ksalbrecht/users/brentaaronreed/users/wpschaub/users/wpschaub/users/ksalbrecht)

Why DevOps is the most important tech strategy today
======
Clearing up some of the confusion about DevOps.
![CICD with gears][1]

Many people first learn about [DevOps][2] when they see one of its outcomes and ask how it happened. It's not necessary to understand why something is part of DevOps to implement it, but knowing that—and why a DevOps strategy is important—can mean the difference between being a leader or a follower in an industry.

Maybe you've heard some the incredible outcomes attributed to DevOps, such as production environments that are so resilient they can handle thousands of releases per day while a "[Chaos Monkey][3]" is running around randomly unplugging things. This is impressive, but on its own, it's a weak business case, essentially burdened with [proving a negative][4]: The DevOps environment is resilient because a serious failure hasn't been observed… yet.

There is a lot of confusion about DevOps and many people are still trying to make sense of it. Here's an example from someone in my LinkedIn feed:

> Recently attended few #DevOps sessions where some speakers seemed to suggest #Agile is a subset of DevOps. Somehow, my understanding was just the opposite.
>
> Would like to hear your thoughts. What do you think is the relationship between Agile and DevOps?
>
>   1. DevOps is a subset of Agile
>   2. Agile is a subset of DevOps
>   3. DevOps is an extension of Agile, starts where Agile ends
>   4. DevOps is the new version of Agile
>


Tech industry professionals have been weighing in on the LinkedIn post with a wide range of answers. How would you respond?

### DevOps' roots in lean and agile

DevOps makes a lot more sense if we start with the strategies of Henry Ford and the Toyota Production System's refinements of Ford's model. Within this history is the birthplace of lean manufacturing, which has been well studied. In [_Lean Thinking_][5], James P. Womack and Daniel T. Jones distill it into five principles:

  1. Specify the value desired by the customer
  2. Identify the value stream for each product providing that value and challenge all of the wasted steps currently necessary to provide it
  3. Make the product flow continuously through the remaining value-added steps
  4. Introduce pull between all steps where continuous flow is possible
  5. Manage toward perfection so that the number of steps and the amount of time and information needed to serve the customer continually falls



Lean seeks to continuously remove waste and increase the flow of value to the customer. This is easily recognizable and understood through a core tenet of lean: single piece flow. We can do a number of activities to learn why moving single pieces at a time is magnitudes faster than batches of many pieces; the [Penny Game][6] and the [Airplane Game][7] are two of them. In the Penny Game, if a batch of 20 pennies takes two minutes to get to the customer, they get the whole batch after waiting two minutes. If you move one penny at a time, the customer gets the first penny in about five seconds and continues getting pennies until the 20th penny arrives approximately 25 seconds later.

This is a huge difference, but not everything in life is as simple and predictable as the penny in the Penny Game. This is where agile comes in. We certainly see lean principles on high-performing agile teams, but these teams need more than lean to do what they do.

To be able to handle the unpredictability and variance of typical software development tasks, agile methodology focuses on awareness, deliberation, decision, and action to adjust course in the face of a constantly changing reality. For example, agile frameworks (like scrum) increase awareness with ceremonies like the daily standup and the sprint review. If the scrum team becomes aware of a new reality, the framework allows and encourages them to adjust course if necessary.

For teams to make these types of decisions, they need to be self-organizing in a high-trust environment. High-performing agile teams working this way achieve a fast flow of value while continuously adjusting course, removing the waste of going in the wrong direction.

### Optimal batch size

To understand the power of DevOps in software development, it helps to understand the economics of batch size. Consider the following U-curve optimization illustration from Donald Reinertsen's _[Principles of Product Development Flow][8]:_

![U-curve optimization illustration of optimal batch size][9]

This can be explained with an analogy about grocery shopping. Suppose you need to buy some eggs and you live 30 minutes from the store. Buying one egg (far left on the illustration) at a time would mean a 30-minute trip each time. This is your _transaction cost_. The _holding cost_ might represent the eggs spoiling and taking up space in your refrigerator over time. The _total cost_ is the _transaction cost_ plus your _holding cost_. This U-curve explains why, for most people, buying a dozen eggs at a time is their _optimal batch size_. If you lived next door to the store, it'd cost you next to nothing to walk there, and you'd probably buy a smaller carton each time to save room in your refrigerator and enjoy fresher eggs.

This U-curve optimization illustration can shed some light on why productivity increases significantly in successful agile transformations. Consider the effect of agile transformation on decision making in an organization. In traditional hierarchical organizations, decision-making authority is centralized. This leads to larger decisions made less frequently by fewer people. An agile methodology will effectively reduce an organization's transaction cost for making decisions by decentralizing the decisions to where the awareness and information is the best known: across the high-trust, self-organizing agile teams.

The following animation shows how reducing transaction cost shifts the optimal batch size to the left. You can't understate the value to an organization in making faster decisions more frequently.

![U-curve optimization illustration][10]

### Where does DevOps fit in?

Automation is one of the things DevOps is most known for. The previous illustration shows the value of automation in great detail. Through automation, we reduce our transaction costs to nearly zero, essentially getting our testing and deployments for free. This lets us take advantage of smaller and smaller batch sizes of work. Smaller batches of work are easier to understand, commit to, test, review, and know when they are done. These smaller batch sizes also contain less variance and risk, making them easier to deploy and, if something goes wrong, to troubleshoot and recover from. With automation combined with a solid agile practice, we can get our feature development very close to single piece flow, providing value to customers quickly and continuously.

More traditionally, DevOps is understood as a way to knock down the walls of confusion between the dev and ops teams. In this model, development teams develop new features, while operations teams keep the system stable and running smoothly. Friction occurs because new features from development introduce change into the system, increasing the risk of an outage, which the operations team doesn't feel responsible for—but has to deal with anyway. DevOps is not just trying to get people working together, it's more about trying to make more frequent changes safely in a complex environment.

We can look to [Ron Westrum][11] for research about achieving safety in complex organizations. In researching why some organizations are safer than others, he found that an organization's culture is predictive of its safety. He identified three types of culture: Pathological, Bureaucratic, and Generative. He found that the Pathological culture was predictive of less safety and the Generative culture was predictive of more safety (e.g., far fewer plane crashes or accidental hospital deaths in his main areas of research).

![Three types of culture identified by Ron Westrum][12]

Effective DevOps teams achieve a Generative culture with lean and agile practices, showing that speed and safety are complementary, or two sides of the same coin. By reducing the optimal batch sizes of decisions and features to become very small, DevOps achieves a faster flow of information and value while removing waste and reducing risk.

In line with Westrum's research, change can happen easily with safety and reliability improving at the same time. When an agile DevOps team is trusted to make its own decisions, we get the tools and techniques DevOps is most known for today: automation and continuous delivery. Through this automation, transaction costs are reduced further than ever, and a near single piece lean flow is achieved, creating the potential for thousands of decisions and releases per day, as we've seen happen in high-performing DevOps organizations.

### Flow, feedback, learning

DevOps doesn't stop there. We've mainly been talking about DevOps achieving a revolutionary flow, but lean and agile practices are further amplified through similar efforts that achieve faster feedback loops and faster learning. In the [_DevOps Handbook_][13], the authors explain in detail how, beyond its fast flow, DevOps achieves telemetry across its entire value stream for fast and continuous feedback. Further, leveraging the [kaizen][14] bursts of lean and the [retrospectives][15] of scrum, high-performing DevOps teams will continuously drive learning and continuous improvement deep into the foundations of their organizations, achieving a lean manufacturing revolution in the software product development industry.

### Start with a DevOps assessment

The first step in leveraging DevOps is, either after much study or with the help of a DevOps consultant and coach, to conduct an assessment across a suite of dimensions consistently found in high-performing DevOps teams. The assessment should identify weak or non-existent team norms that need improvement. Evaluate the assessment's results to find quick wins—focus areas with high chances for success that will produce high-impact improvement. Quick wins are important for gaining the momentum needed to tackle more challenging areas. The teams should generate ideas that can be tried quickly and start to move the needle on the DevOps transformation.

After some time, the team should reassess on the same dimensions to measure improvements and identify new high-impact focus areas, again with fresh ideas from the team. A good coach will consult, train, mentor, and support as needed until the team owns its own continuous improvement and achieves near consistency on all dimensions by continually reassessing, experimenting, and learning.

In the [second part][16] of this article, we'll look at results from a DevOps survey in the Drupal community and see where the quick wins are most likely to be found.

* * *

_Rob_ _Bayliss and Kelly Albrecht will present[DevOps: Why, How, and What][17] and host a follow-up [Birds of a][18]_ [_Feather_][18] _[discussion][18] at [DrupalCon 2019][19] in Seattle, April 8-12._


--------------------------------------------------------------------------------

via: https://opensource.com/article/19/3/devops-most-important-tech-strategy

作者：[Kelly AlbrechtWilly-Peter Schaub][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksalbrecht/users/brentaaronreed/users/wpschaub/users/wpschaub/users/ksalbrecht
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cicd_continuous_delivery_deployment_gears.png?itok=kVlhiEkc (CICD with gears)
[2]: https://opensource.com/resources/devops
[3]: https://github.com/Netflix/chaosmonkey
[4]: https://en.wikipedia.org/wiki/Burden_of_proof_(philosophy)#Proving_a_negative
[5]: https://www.amazon.com/dp/B0048WQDIO/ref=dp-kindle-redirect?_encoding=UTF8&btkr=1
[6]: https://youtu.be/5t6GhcvKB8o?t=54
[7]: https://www.shmula.com/paper-airplane-game-pull-systems-push-systems/8280/
[8]: https://www.amazon.com/dp/B00K7OWG7O/ref=dp-kindle-redirect?_encoding=UTF8&btkr=1
[9]: https://opensource.com/sites/default/files/uploads/batch_size_optimal_650.gif (U-curve optimization illustration of optimal batch size)
[10]: https://opensource.com/sites/default/files/uploads/batch_size_650.gif (U-curve optimization illustration)
[11]: https://en.wikipedia.org/wiki/Ron_Westrum
[12]: https://opensource.com/sites/default/files/uploads/information_flow.png (Three types of culture identified by Ron Westrum)
[13]: https://www.amazon.com/DevOps-Handbook-World-Class-Reliability-Organizations/dp/1942788002/ref=sr_1_3?keywords=DevOps+handbook&qid=1553197361&s=books&sr=1-3
[14]: https://en.wikipedia.org/wiki/Kaizen
[15]: https://www.scrum.org/resources/what-is-a-sprint-retrospective
[16]: https://opensource.com/article/19/3/where-drupal-community-stands-devops-adoption
[17]: https://events.drupal.org/seattle2019/sessions/devops-why-how-and-what
[18]: https://events.drupal.org/seattle2019/bofs/devops-getting-started
[19]: https://events.drupal.org/seattle2019
