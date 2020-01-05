[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (DevOps is a solution to burnout worth investing in)
[#]: via: (https://opensource.com/article/20/1/devops-burnout-solution)
[#]: author: (Dawn Parzych https://opensource.com/users/dawnparzych)

DevOps is a solution to burnout worth investing in
======
Instead of treating burnout once it kicks in, we need to do more to
prevent it in the first place. Here is a reminder of the cause and a
look at solutions.
![A person choosing between several different incentives][1]

Not a day goes by that I don't see a tweet or hear somebody talking about burnout. Burnout is becoming a pervasive part of our lives, especially in tech and open source communities. In [_What you need to know about burnout in open source communities_,][2] I defined burnout and explored its causes, symptoms, and potential treatments. But a better question is about prevention: How do we change the underlying processes, cultures, and tools to prevent burnout from occurring in the first place?

### Burnout's catalyst is unplanned work

Let's start by reviewing what's known about the cause of burnout. In 2019, PagerDuty published [_Unplanned work: The human impact of an always-on world_][3]. More than 35% of the study's respondents are considering leaving their jobs due to stress and work/life balance issues, also known as burnout. Companies that utilize automation and have documented response plans have fewer unplanned incidents and less stressed employees.

Modern software organizations use automation and documented response plans to move faster. Moving faster is necessary to stay competitive. We are in this endless cycle where customers expect more, which puts more pressure on companies to deliver more and deliver it faster, which in turn creates pressure on employees.

However, it is possible to move fast while having protections to prevent unplanned work and burnout. The Accelerate State of DevOps Report has been tracking trends in DevOps for six years. It allows teams to benchmark against others in the industry as low, medium, high, or elite performers. One of the findings from the [2019 State of DevOps report][4] was: "Productivity can drive improvements in work/life balance and reductions in burnout, and organizations can make smart investments to support it."

Productivity means more work gets done. Therefore, more value is delivered. The catch to productivity is balance: Don't do more work in the short term at the expense of burning out your people. Processes and tooling need to be in place to prevent people from feeling overworked and overwhelmed.

To support productivity that does not lead to burnout, organizations need to make smart investments in tooling and reduce technical debt. Investing in tooling means purchasing useful and easy-to-use solutions. The preference for building rather than buying may lead productivity to decrease and burnout to emerge. How? Instead of focusing on building features that are competitive differentiators and help the company achieve key business objectives, the developers spend countless hours trying to build something that a vendor could have quickly provided.

As developers spend time building non-core solutions, technical debt accrues, and features are pushed out. Instead of building all the things, buy the tooling that supports the business but is not strategic, and build the things that are core to your business strategy. You wouldn't use development resources to build your own email program, so treat other tooling the same way. Twenty percent of tools used by low-performing teams are developed primarily in-house and proprietary to the organization, compared to 5% to 6% in medium, high, and elite teams.

### Worthwhile solutions to burnout

If you want to prevent burnout, here are some areas to invest in. It's no coincidence they overlap with frequent discussions [in DevOps articles][5].

#### Communication and collaboration

Communication is at the heart of everything we do. [Laurie Barth][6] sums it up nicely: "Over time, I've learned that the biggest source of failure is often due to people and teams. A lack of communication and coordination can cause serious problems." Use tools like videoconferencing, Confluence, and Slack to ensure communication and collaboration happen.

But create rules around the use of these tools. Make sure to turn off Slack notifications during off-hours. I disable my notifications from 6pm to 8am.

Define what type of communication is best for which situations. Slack is useful for real-time, ephemeral communication, but it can lead to people feeling the need to always be on. If they're not online, they may miss an important conversation. If major or minor decisions are made in a Slack thread, document those in a longer-living system of record, giving all team members access to the necessary information.

Trying to debug an incident? Communicate via Slack. Need to write up a post-incident review? Post that to Confluence or a wiki.

Videoconferencing tools like Zoom or BlueJeans help enable remote work. Having the ability to work remotely, part-time or full-time, can reduce the stress of commuting or relocating. Videoconferences make it easy to stay connected with distributed teams because sometimes it is easier to hash things out in a face-to-face conversation than over email or Slack.

These tools should not be used to encourage people to work while on vacation. Time off means time away from work to rest, recover, and recharge.

#### Releases and deploys

According to the 2019 State of DevOps report, elite teams deploy code 208 times more frequently than low performers, and their lead time from committing code to deployment is 106 times faster. It may seem that the more deploys you do, the greater the likelihood of burnout, but that isn't necessarily the case. Teams that utilize continuous delivery have processes in place to deploy safely.

First, separate releases from deploys—just because you deployed code doesn't mean that all users should have access to it. Ring deploys make features available to a small group of people, like internal employees or beta customers. These users can help you identify bugs or provide feedback to fine-tune a feature before releasing it widely.

Next, create feedback loops regarding the quality of a deployment. Things don't always go as planned when deploying your code. You need the ability to rapidly stop when things go wrong. Feedback loops include implementing monitoring and observability tools. By using telemetry data along with kill switches, you can quickly turn off a poorly behaving feature rather than rolling back an entire deployment.

Finally, run A/B tests and experiments to learn what customers respond to. A metrics-based approach provides insight into what works and what doesn't and can help you validate a hypothesis. Instead of creating technical debt with a partial feature, collect data to see if the feature provides the expected conversions early on. If it doesn't, don't release it.

#### Incident resolution

Part of resolving incidents means knowing what to do when something breaks. And constantly putting out fires can lead to burnout. We can't prevent all incidents from happening, but we can be better prepared. Running chaos experiments or game days with tools like Gremlin can help companies prepare for the unexpected.

With chaos experiments, you can learn how your systems, services, and applications respond under specific scenarios. Knowing how things behave when they're broken can shorten incident-resolution times. They can also help you identify and fix vulnerabilities before an incident occurs.

What can you automate to reduce toil during incident resolution? For example, when you're actively working on an incident, can a Slack channel dedicated to the incident be automatically generated? Or can you create [feature flags][7] with a solution like LaunchDarkly (full disclosure: I work there) to perform common tasks during incident resolution? These could include:

  * Dynamic configuration changes, like automatically adjusting logging levels to collect more information when an alert is triggered
  * Load-shedding to disable non-critical elements when systems are under heavy load to ensure essential tasks complete
  * Kill switches or circuit breakers to turn off features when they are impacting your service reliability



### It's not magic

There is no magic bullet to resolve burnout; it requires having the right people, processes, and tools. The people help create an environment of psychological safety where people are free to ask questions, experiment, make mistakes, and be creative. Think about what is most important to your organization, and invest in the right tools to support those goals and the people working towards them.

This month we look at ways to balance your workload, gracefully say "no," and avoid burnout.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/devops-burnout-solution

作者：[Dawn Parzych][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dawnparzych
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BUSINESS_incentives.png?itok=IhIL1xyT (A person choosing between several different incentives)
[2]: https://opensource.com/article/19/11/burnout-open-source-communities
[3]: https://www.pagerduty.com/resources/reports/unplanned-work/
[4]: https://services.google.com/fh/files/misc/state-of-devops-2019.pdf
[5]: https://opensource.com/tags/devops
[6]: https://laurieontech.com/
[7]: https://martinfowler.com/articles/feature-toggles.html
