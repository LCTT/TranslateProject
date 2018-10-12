3 areas to drive DevOps change
======
Driving large-scale organizational change is painful, but when it comes to DevOps, the payoff is worth the pain.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/diversity-inclusion-transformation-change_20180927.png?itok=2E-g10hJ)

Pain avoidance is a powerful motivator. Some studies hint that even [plants experience a type of pain][1] and take steps to defend themselves. Yet we have plenty of examples of humans enduring pain on purpose—exercise often hurts, but we still do it. When we believe the payoff is worth the pain, we'll endure almost anything.

The truth is that driving large-scale organizational change is painful. It hurts for those having to change their values and behaviors, it hurts for leadership, and it hurts for the people just trying to do their jobs. In the case of DevOps, though, I can tell you the pain is worth it.

I've seen firsthand how teams learn they must spend time improving their technical processes, take ownership of their automation pipelines, and become masters of their fate. They gain the tools they need to be successful.

![Improvements after DevOps transformation][3]

Image by Lee Eason. CC BY-SA 4.0

This chart shows the value of that change. In a company where I directed a DevOps transformation, its 60+ teams submitted more than 900 requests per month to release management. If you add up the time those tickets stayed open, it came to more than 350 days per month. What could your company do with an extra 350 person-days per month? In addition to the improvements seen above, they went from 100 to 9,000 deployments per month, a 24% decrease in high-severity bugs, happier engineers, and improved net promoter scores (NPS). The biggest NPS improvements link to the teams furthest along on their DevOps journey, as the [Puppet State of DevOps][4] report predicted. The bottom line is that investments into technical process improvement translate into better business outcomes.

DevOps leaders must focus on three main areas to drive this change: executives, culture, and team health.

### Executives

The bottom line is that investments into technical process improvement translate into better business outcomes.

The larger your organization, the greater the distance (and opportunities for misunderstanding) between business leadership and the individuals delivering services to your customers. To make things worse, the landscape of tools and practices in technology is changing at an accelerating rate. This makes it practically impossible for business leaders to understand on their own how transformations like DevOps or agile work.

The larger your organization, the greater the distance (and opportunities for misunderstanding) between business leadership and the individuals delivering services to your customers. To make things worse, the landscape of tools and practices in technology is changing at an accelerating rate. This makes it practically impossible for business leaders to understand on their own how transformations like DevOps or agile work.

DevOps leaders must help executives come along for the ride. Educating leaders gives them options when they're making decisions and makes it more likely they'll choose paths that help your company.

For example, let's say your executives believe DevOps is going to improve how you deploy your products into production, but they don't understand how. You've been working with a software team to help automate their deployment. When an executive hears about a deploy failure (and there will be failures), they will want to understand how it occurred. When they learn the software team did the deployment rather than the release management team, they may try to protect the business by decreeing all production releases must go through traditional change controls. You will lose credibility, and teams will be far less likely to trust you and accept further changes.

It takes longer to rebuild trust with executives and get their support after an incident than it would have taken to educate them in the first place. Put the time in upfront to build alignment, and it will pay off as you implement tactical changes.

Two pieces of advice when building that alignment:

  * First, **don't ignore any constraints** they raise. If they have worries about contracts or security, make the heads of legal and security your new best friends. By partnering with them, you'll build their trust and avoid making costly mistakes.
  * Second, **use metrics to build a bridge** between what your delivery teams are doing and your executives' concerns. If the business has a goal to reduce customer churn, and you know from research that many customers leave because of unplanned downtime, reinforce that your teams are committed to tracking and improving Mean Time To Detection and Resolution (MTTD and MTTR). You can use those key metrics to show meaningful progress that teams and executives understand and get behind.



### Culture

DevOps is a culture of continuous improvement focused on code, build, deploy, and operational processes. Culture describes the organization's values and behaviors. Essentially, we're talking about changing how people behave, which is never easy.

I recommend reading [The Wolf in CIO's Clothing][5]. Spend time thinking about psychology and motivation. Read [Drive][6] or at least watch Daniel Pink's excellent [TED Talk][7]. Read [The Hero with a Thousand Faces][8] and learn to identify the different journeys everyone is on. If none of these things sound interesting, you are not the right person to drive change in your company. Otherwise, read on!

Essentially, we're talking about changing how people behave, which is never easy.

Most rational people behave according to their values. Most organizations don't have explicit values everyone understands and lives by. Therefore, you'll need to identify the organization's values that have led to the behaviors that have led to the current state. You also need to make sure you can tell the story about how those values came to be and how they led to where you are. When you tell that story, be careful not to demonize those values—they aren't immoral or evil. People did the best they could at the time, given what they knew and what resources they had.

Most rational people behave according to their values. Most organizations don't have explicit values everyone understands and lives by. Therefore, you'll need to identify the organization's values that have led to the behaviors that have led to the current state. You also need to make sure you can tell the story about how those values came to be and how they led to where you are. When you tell that story, be careful not to demonize those values—they aren't immoral or evil. People did the best they could at the time, given what they knew and what resources they had.

Explain that the company and its organizational goals are changing, and the team must alter its values. It's helpful to express this in terms of contrast. For example, your company may have historically valued cost savings above all else. That value is there for a reason—the company was cash-strapped. To get new products out, the infrastructure group had to tightly couple services by sharing database clusters or servers. Over time, those practices created a real mess that became hard to maintain. Simple changes started breaking things in unexpected ways. This led to tight change-control processes that were painful for delivery teams, so they stopped changing things.

Play that movie for five years, and you end up with little to no innovation, legacy technology, attraction and retention problems, and poor-quality products. You've grown the company, but you've hit a ceiling, and you can't continue to grow with those same values and behaviors. Now you must put engineering efficiency above cost saving. If one option will help teams maintain their service easier, but the other option is cheaper in the short term, you go with the first option.

You must tell this story again and again. Then you must celebrate any time a team expresses the new value through their behavior—even if they make a mistake. When a team has a deploy failure, congratulate them for taking the risk and encourage them to keep learning. Explain how their behavior is leading to the right outcome and support them. Over time, teams will see the message is real, and they'll feel safe altering their behavior.

### Team health

Have you ever been in a planning meeting and heard something like this: "We can't really estimate that story until John gets back from vacation. He's the only one who knows that area of the code well enough." Or: "We can't get this task done because it's got a cross-team dependency on network engineering, and the guy that set up the firewall is out sick." Or: "John knows that system best; if he estimated the story at a 3, then let's just go with that." When the team works on that story, who will most likely do the work? That's right, John will, and the cycle will continue.

For a long time, we've accepted that this is just the nature of software development. If we don't solve for it, we perpetuate the cycle.

Entropy will always drive teams naturally towards disorder and bad health. Our job as team members and leaders is to intentionally manage against that entropy and keep our teams healthy. Transformations like DevOps, agile, moving to the cloud, or refactoring a legacy application all amplify and accelerate that entropy. That's because transformations add new skills and expertise needed for the team to take on that new type of work.

Let's look at an example of a product team refactoring its legacy monolith. As usual, they build those new services in AWS. The legacy monolith was deployed to the data center, monitored, and backed up by IT. IT made sure the application's infosec requirements were met at the infrastructure layer. They conducted disaster recovery tests, patched the servers, and installed and configured required intrusion detection and antivirus agents. And they kept change control records, required for the annual audit process, of everything was done to the application's infrastructure.

I often see product teams make the fatal mistake of thinking IT is all cost and bottleneck. They're hungry to shed the skin of IT and use the public cloud, but they never stop to appreciate the critical services IT provides. Moving to the cloud means you implement these things differently; they don't go away. AWS is still a data center, and any team utilizing it accepts the related responsibilities.

In practice, this means product teams must learn how to do those IT services when they move to the cloud. So, when our fictional product team starts refactoring its legacy application and putting new services in in the cloud, it will need a vastly expanded skillset to be successful. Those skills don't magically appear—they're learned or hired—and team leaders and managers must actively manage the process.

I built [Tekata.io][9] because I couldn't find any tools to support me as I helped my teams evolve. Tekata is free and easy to use, but the tool is not as important as the people and process. Make sure you build continuous learning into your cadence and keep track of your team's weak spots. Those weak spots affect your ability to deliver, and filling them usually involves learning new things, so there's a wonderful synergy here. In fact, 76% of millennials think professional development opportunities are [one of the most important elements][10] of company culture.

### Proof is in the payoff

DevOps transformations involve altering the behavior, and therefore the culture, of your teams. That must be done with executive support and understanding. At the same time, those behavior changes mean learning new skills, and that process must also be managed carefully. But the payoff for pulling this off is more productive teams, happier and more engaged team members, higher quality products, and happier customers.

Lee Eason will present [Tales From A DevOps Transformation][11] at [All Things Open][12], October 21-23 in Raleigh, N.C.

Disclaimer: All opinions are statements in this article are exclusively those of Lee Eason and are not representative of Ipreo or IHS Markit.


--------------------------------------------------------------------------------

via: https://opensource.com/article/18/10/tales-devops-transformation

作者：[Lee Eason][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/leeeason
[b]: https://github.com/lujun9972
[1]: https://link.springer.com/article/10.1007%2Fs00442-014-2995-6
[2]: /file/411061
[3]: https://opensource.com/sites/default/files/uploads/devops-delays.png (Improvements after DevOps transformation)
[4]: https://puppet.com/resources/whitepaper/state-of-devops-report
[5]: https://www.gartner.com/en/publications/wolf-cio
[6]: https://en.wikipedia.org/wiki/Drive:_The_Surprising_Truth_About_What_Motivates_Us
[7]: https://www.ted.com/talks/dan_pink_on_motivation?language=en#t-2094
[8]: https://en.wikipedia.org/wiki/The_Hero_with_a_Thousand_Faces
[9]: https://tekata.io/
[10]: https://www.execu-search.com/~/media/Resources/pdf/2017_Hiring_Outlook_eBook
[11]: https://allthingsopen.org/talk/tales-from-a-devops-transformation/
[12]: https://allthingsopen.org/
