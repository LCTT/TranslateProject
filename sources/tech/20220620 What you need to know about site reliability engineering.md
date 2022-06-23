[#]: subject: "What you need to know about site reliability engineering"
[#]: via: "https://opensource.com/article/22/6/introduction-site-reliability-engineering"
[#]: author: "Robert Kimani https://opensource.com/users/robert-charles"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

What you need to know about site reliability engineering
======
Understand the basics and best practices for establishing and maintaining an SRE program in your organization.

![Working on a team, busy worklife][1]

Image by: opensource.com

What is site reliability engineering? The creator of the first site reliability engineering (SRE) program, [Benjamin Treynor Sloss][2] at Google, described it this way:

> Site reliability engineering is what happens when you ask a software engineer to design an operations team.

What does that mean? Unlike traditional system administrators, site reliability engineers (SREs) apply solid software engineering principles to their day-to-day work. For laypeople, a clearer definition might be:

> Site reliability engineering is the discipline of building and supporting modern production systems at scale.

SREs are responsible for maximizing reliability, performance availability, latency, efficiency, monitoring, emergency response, change management, release planning, and capacity planning for both infrastructure and software. As applications and infrastructure grow more complex, SRE teams help ensure that these systems can evolve.

### What does an SRE organization do?

There are four primary responsibilities of an SRE organization:

* Availability: SREs are responsible for the availability of the services they support. After all, if services are not available, end users' work is disrupted, which can cause serious damage to your organization's credibility.
* Performance: A service needs to be not only available but also highly performant. For example, how useful is a website that takes 20 seconds to move from one page to another?
* Incident management: SREs manage the response to unplanned disruptions that impact customers, such as outages, service degradation, or interruptions to business operations.
* Monitoring: A foundational requirement for every SRE, monitoring involves collecting, processing, aggregating, and displaying real-time quantitative data about a system. This could include query counts and types, error counts and types, processing times, and server lifetimes.

Occasionally, release and capacity planning are also the responsibility of the SRE organization.

### How do SREs maintain site reliability?

The SRE role is a diverse one, with many responsibilities. An SRE must be able to identify an issue quickly, troubleshoot, and mitigate it with minimal disruption to operations.

Here's a partial list of the tasks a typical SRE undertakes:

* Writing code: An SRE is required to solve problems using software, whether they are a software engineer with an operations background or a system engineer with a development background.
* Being on call: This is not the most attractive part of being an SRE, but it is essential.
* Leading a war room: SREs facilitate discussions of strategy and execution during incident management.
* Performing postmortems: This is an excellent tool to learn from an incident and identify processes that can be put in place to avoid future incidents.
* Automating: SREs tend to get bored with manual steps. Automation not only saves time but reduces failures due to human errors. Spending some time on engineering by automating tasks can have a strong return on investment.
* Implement best practices: SREs are well versed with distributed systems and web-scale architectures. They apply best practices in several areas of service management.

### Designing an effective on-call system

An on-call management system streamlines the process of adding members of the SRE team into after-hours or weekend call schedules, assigning them equitable responsibility for managing alerts outside of traditional work hours or on holidays. In some cases, an organization might designate on-call SREs around the clock.

In the medical profession, on-call doctors don't have to be on site, but they do have to be prepared to show up and deal with emergencies anytime during their on-call shift. SRE professionals likewise use on-call schedules to make sure that someone's always there to respond to major bugs, capacity issues, or product downtime. If they can't fix the problem on their own, they're also responsible for escalating the issue. For SRE teams who run services for which customers expect 24/7/365, 99.999% uptime and availability, on-call staffing is especially critical.

There are two main kinds of [on-call design structures][4] that can be used when designing an on-call system, and they focus on domain expertise and ownership of a given service:

* Single-team ownership model
* Shared ownership model

In most cases, single-team ownership will be the better model.

The on-call SRE has multiple duties:

* Protecting production systems:  The SRE on call serves as a guardian to all production services they are required to support.
* Responding to emergencies within acceptable time: Your organization may choose to have a service-level objective (SLO) for SRE response time. In most cases, anywhere between 5 to 15 minutes would be an acceptable response time. Automated monitoring and alerting solutions also empower SREs to respond immediately to any interruptions to service availability.
* Involving team members and escalating issues:  The on-call SRE is responsible for identifying and calling in the right team members to address specific problems.
* Tackling non-emergent issues: In some organizations, a secondary on-call engineer is scheduled to handle non-emergencies, like email alerts.
* Writing postmortems: As noted above, a good postmortem is a valuable tool for documenting and learning from significant incidents.

### 3 key tenets of an effective on-call management system

#### A focus on engineering

SREs should be spending more time designing solutions than applying band-aids. A general guideline is for SREs to spend 50% of their time in engineering work, such as writing code and automating tasks. When an SRE is on-call, time should be split between about 25% of time managing incidents and 25% on operations duty.

#### Balanced workload

Being on call can quickly burn out an engineer if there are too many tickets to handle. If well-coordinated multi-region support is possible, such as a US-based team and an Asia-Pacific team, that arrangement can help limit the detrimental health effects of repeated night shifts. Otherwise, having six to eight SREs per site will help avoid exhaustion. At the same time, make sure all SREs are getting a turn being on call at least once or twice a quarter to avoid getting out of touch with production systems. Fair compensation for on-call work during overnights or holidays, such as additional hours off or cash awards, will also help SREs feel that their extra effort is appreciated.

#### Positive and safe environment

Clearly defined escalation and blameless postmortem procedures are absolutely necessary for SREs to be effective and productive. Established protocols are central to a robust incident management system. Postmortems must focus on root causes and prevention rather than individual and team actions. If you don't have a clear postmortem procedure in your organization, it is wise to start one immediately.

### SRE best practices

This article covered some SRE basics and best practices for establishing and running an SRE on-call management system.

In future articles, I will look at other categories of best practices for SRE, the technologies involved, and the processes to support those technologies. By the end of this series, you'll know how to implement SRE best practices for designing, implementing, and supporting production systems.

### More resources

* [Availability Calculator][5]
* [Error Budget Calculator][6]

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/6/introduction-site-reliability-engineering

作者：[Robert Kimani][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/robert-charles
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/team_dev_email_chat_video_work_wfm_desk_520.png
[2]: https://sre.google/sre-book/introduction/
[3]: https://enterprisersproject.com/article/2022/2/8-reasons-site-reliability-engineer-one-most-demand-jobs-2022
[4]: https://alexwitherspoon.com/publications/on-call-design/
[5]: https://availability.sre.xyz/
[6]: https://dastergon.gr/error-budget-calculator/
