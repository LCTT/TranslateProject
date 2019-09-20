[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Code it, ship it, own it with full-service ownership)
[#]: via: (https://opensource.com/article/19/9/full-service-ownership)
[#]: author: (Julie GundersonJustin Kearns https://opensource.com/users/juliegundhttps://opensource.com/users/juliegundhttps://opensource.com/users/juliegundhttps://opensource.com/users/kearnsjdhttps://opensource.com/users/ophir)

Code it, ship it, own it with full-service ownership
======
Making engineers responsible for their code and services in production
offers multiple advantages—for the engineer as well as the code.
![Gears above purple clouds][1]

Software teams seeking to provide better products and services must focus on faster release cycles. But running reliable systems at ever-increasing speeds presents a big challenge. Software teams can have both quality and speed by adjusting their policies around ongoing service ownership. While on-call plays a large part in this model, advancement in knowledge, more resilient code, increased collaboration, and better practices mean engineers don't have to wake up to a nightmare.

This four-part series will delve into the concepts of full-service ownership, psychological safety in transformation, the ethics of accountability, and the impact of ownership on the customer experience.

### What is full-service ownership?

![Code it, ship it, own it][2]

Full-service ownership is the philosophy that engineers are responsible for the code and services they create in production. Using the "code it, ship it, own it," mentality means embracing the [DevOps principle][3] of no longer throwing code over the wall to operations nor relying on the [site reliability engineering (SRE) team][4] to ensure the reliability of services in the wild. Instead:

> Accountability, reliability, and continuous improvement are the main objectives of full-service ownership.

Putting engineers on-call for what they create brings accountability directly into the hands of that engineer and team.

### Why accountability matters

Digital transformation has changed how people work and how consumers consume. There is an implicit expectation in consumers' minds that services will work. For example, when I try to make an online purchase (almost always through my mobile device), I expect a seamless, secure, and efficient experience. When I am interrupted because a page won't load or throws an error, I simply move on to another company that can fulfill my request. According to the [PagerDuty State of Digital Operations 2017 UK report][5], 86.6% of consumers will do the same thing.

![Amount of time consumers will wait for an unresponsive app][6]

Empowering engineers to work on the edge of the customer experience by owning the full lifecycle of their code and services gives companies a competitive advantage. As well as benefiting the company, full-service ownership benefits the engineer. Accountability ensures high-quality work and gives engineers a direct line of sight into how the code or service is performing and impacting the customers' day-to-day.

### Reliability beyond subject-matter experts

Services will go down; it's an inevitable facet of operating in the digital world. However, how long those services are down—and the impact the outages have on customers—will be mitigated by bringing the

subject matter expert (SME) or "owner" into the incident immediately. The SME is the engineer who created the code or service and has the intimate, technical knowledge to both respond to incidents and take corrective action to ensure their services experience fewer interruptions through continuous improvement. As the responsible party, the engineers are incented to automate, test, and create code that is as bulletproof as possible.

Also, teams that adopt full-service ownership increase their overall knowledge. Through practices that include on-call handoffs, code reviews, daily standups, and Failure Friday exercises, individual engineers develop greater expertise around the entire codebase. New skills include systems thinking, collaboration, and working in non-siloed environments. Teams and individuals build necessary redundancy in skills and knowledge by sharing information.

### Continuous improvement

As engineers strive to improve their product, code, and/or services continuously, a side-effect of full-service ownership is the refinement of services and alerting. Alerts that interrupt time outside regular work hours must be actionable. If team members are repeatedly interrupted with non-actionable alerts, there is an opportunity to improve the system by analyzing the data. Cleaning up the monitoring system is an investment of time; however, committing to actionable alerting will make on-call better for everyone on the team and reduce alert fatigue—which will free up mental energy to focus on future releases and automation.

Developers who write the code and define the alerts for that code are more likely to create actionable alerts. It will literally wake them up at night if they don't. Beyond actionable alerts, engineers are incented to produce the highest quality code, as better code equals fewer interruptions.

While on-call can interrupt your personal life, on-call is not meant to be "always-on." Rather, it's a shared team responsibility to ensure high-quality code. Instead of looking at full-service ownership as an on-call requirement, you can argue that it is building in time to go "off-call."

Imagine you are on the operations team triaging an incident; time is of the essence, and you need answers fast. Are you going to carefully run through a list of all members of the team responsible for that service? Or are you going to call the SME you know always answers the phone on a Sunday afternoon? Repeatedly calling the same one or two people places an undue burden on those individuals, potentially causing a single source of failure that can lead to burnout. With that said, an on-call rotation serves multiple functions:

  1. Engineers know that their code and services are being covered when they are off-call so they can fully relax.
  2. The burden of being the "go-to" SME is parsed out to the rest of the team on rotation.
  3. Services become more reliable.
  4. Team knowledge and skills increase through deeper understanding of the codebase.



By going beyond coding to shipping and owning, full-service ownership reduces the chaos associated with incidents by defining roles and responsibilities, removing unnecessary layers, and ultimately fostering a culture of empowerment and accountability. And, in the next article in this series, I'll share how full-service ownership can foster psychological safety.

What has your experience been? Has being on-call helped you to become a better engineer? Do you loathe the thought of picking up a "pager"? Let us know your thoughts in the comments below or tweet [@julie_gund][7].

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/full-service-ownership

作者：[Julie GundersonJustin Kearns][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/juliegundhttps://opensource.com/users/juliegundhttps://opensource.com/users/juliegundhttps://opensource.com/users/kearnsjdhttps://opensource.com/users/ophir
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/chaos_engineer_monster_scary_devops_gear_kubernetes.png?itok=GPYLvfVh (Gears above purple clouds)
[2]: https://opensource.com/sites/default/files/uploads/code_ship_own.png (Code it, ship it, own it)
[3]: https://opensource.com/article/18/1/getting-devops
[4]: https://opensource.com/article/18/10/sre-startup
[5]: https://www.pagerduty.com/resources/reports/digital-operations-uk/
[6]: https://opensource.com/sites/default/files/uploads/unresponsiveapps.png (Amount of time consumers will wait for an unresponsive app)
[7]: https://twitter.com/julie_gund
