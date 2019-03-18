[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Why feedback, not metrics, is critical to DevOps)
[#]: via: (https://opensource.com/article/19/3/devops-feedback-not-metrics)
[#]: author: (Ranjith Varakantam (Red Hat) https://opensource.com/users/ranjith)

Why feedback, not metrics, is critical to DevOps
======

Metrics can tell you some things, but not the most important things about how your products and teams are doing.

![CICD with gears][1]

Most managers and agile coaches depend on metrics over feedback from their teams, users, and even customers. In fact, quite a few use feedback and metrics synonymously, where they present feedback from teams or customers as a bunch of numbers or a graphical representation of those numbers. This is not only unfortunate, but it can be misleading as it presents only part of the story and not the entire truth.

When it comes to two critical factors—how we manage or guide our teams and how we operate and influence the product that our teams are developing—few exceptional leaders and teams get it right. For one thing, it has become very easy to get your hands on data and metrics. Furthermore, it's still hard to get real feedback from teams and users. It requires significant investments and energy, and unless everyone understands the critical need for it, getting and giving feedback tends to be a low priority and keeps getting pushed to the back burner.

### How to manage and guide teams

With the acceptance of agile, a lot of teams have put a ridiculously high value on metrics, such as velocity, burndown charts, cumulative flow diagram (CFD), etc., instead of the value delivered by the team in each iteration or deployment. The focus is on the delivery or output produced without a clear understanding of how this relates to personal performance or implications for the project, product, or service.

A few managers and agile coaches even abuse the true spirit of agile by misusing metrics to chastise or even penalize their teams. Instead of creating an environment of empowerment, they are slipping back into the command-and-control method where metrics are used to bully teams into submission.

In our group, the best managers have weekly one-on-one meetings with every team member. These meetings not only give them a real pulse on team morale but also a profound understanding of the project and the decisions being made to move it forward. This weekly feedback loop also helps the team members communicate technical, functional, and even personal issues better. As a result, the team is much more cohesive in understanding the overall project needs and able to make decisions promptly.

These leaders also skip levels—reaching out to team members two or three levels below them—and have frequent conversations with other group members who interact with their teams on a regular basis. These actions give the managers a holistic picture, which they couldn't get if they relied on feedback from one manager or lead, and help them identify any blind spots the leads and managers may have.

These one-on-one meetings effectively transform a manager into a coach who has a close understanding of every team member. Like a good coach, these managers both give and receive feedback from the team members regarding the product, decision-making transparency, places where the team feels management is lagging, and areas that are being ignored. This empowers the teams by giving them a voice, not once in a while in an annual meeting or an annual survey, but every week. This is the level where DevOps teams should be in order to deliver their commitments successfully.

This demands significant investments of time and energy, but the results more than justify it. The alternative is to rely on metrics and annual reviews and surveys, which has failed miserably. Unless we begin valuing feedback over metrics, we will keep seeing the metrics we want to see but failed projects and miserable team morale.

### Influencing projects and product development

We see similar behavior on the project or product side, with too few conversations with the users and developers and too much focus on metrics. Let's take the example of a piece of software that was released to the community or market, and the primary success metric is the number of downloads or installs. This can be deceiving for several reasons:

  1. This product was packaged into another piece of software that users installed; even though the users are not even aware of your product's existence or purpose, it is still counted as a win and something the user needs.

  2. The marketing team spent a huge budget promoting the product—and even offered an incentive to developers to download it. The _incentive_ drives the downloads, not user need or desire, but the metric is still considered a measure of success.

  3. Software updates are counted as downloads, even when they are involuntary updates pushed rather than initiated by the user. This keeps bumping up the number, even though the user might have used it once, a year ago, for a specific task.




In these cases, the user automatically becomes a metric that's used to report how well the product is doing, just based on the fact it was downloaded and it's accepting updates, regardless of whether the user likes or uses the software. Instead, we should be focusing on actual usage of the product and the feedback these users have to offer us, rather than stopping short at the download numbers.

The same holds true for SaaS products—instead of counting the number of signups, we should look at how often users use the product or service. Signups by themselves have little meaning, especially to the DevOps team where the focus is on getting constant feedback and striving for continuous improvements.

### Gathering feedback

So, why do we rely on metrics so much? My guess is they are easy to collect, and the marketing team is more interested in getting the product into the users' hands than evaluating how it is fairing. Unless the engineering team invests quite a bit of time in collecting feedback with tracing, which captures how often the program is executed and which components are used most often, it can be difficult to collect feedback.

A big advantage of working in an open source community is that we first release the piece of software into a community where we can get feedback. Most open source enthusiasts take the time to log issues and bugs based on their experience with the product. If we can supplement this data with tracing, the team has an accurate record of how the product is used.

Open as many channels of communication as possible–chat, email, Twitter, etc.—and allow users to choose their feedback channel.

A few DevOps teams have integrated blue-green deployments, A/B testing, and canary releases to shorten the feedback loop. Setting up these frameworks it is not a trivial matter and calls for a huge upfront investment and constant updates to make them seamlessly work. But once everything is set up and data begins to flow, the team can act upon real feedback based on real user interactions with every new bit of software released.

Most agile practitioners and lean movement activists push for a build-deploy-measure-learn cycle, and for this to happen, we need to collect feedback in addition to metrics. It might seem expensive and time consuming in the short term, but in the long run, it is a foolproof way of learning.

### Proof that feedback pays off

Whether it pertains to people or projects, it pays to rely on first-hand feedback rather than metrics, which are seldom interpreted in impartial ways. We have ample proof of this in other industries, where companies such as Zappos and the Virgin Group have done wonders for their business simply by listening to their customers. There is no reason we cannot follow suit, especially those of us working in open source communities.

Feedback is the only effective way we can uncover our blind spots. Metrics are not of much help in this regard, as we can't find out what's wrong when we are dealing with unknowns. Blind spots can create serious gaps between reality and what we think we know. Feedback not only encourages continuous improvement, whether it's on a personal or a product level, but the simple act of listening and acting on it increases trust and loyalty.


--------------------------------------------------------------------------------

via: https://opensource.com/article/19/3/devops-feedback-not-metrics

作者：[Ranjith Varakantam (Red Hat)][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ranjith
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cicd_continuous_delivery_deployment_gears.png?itok=kVlhiEkc (CICD with gears)
