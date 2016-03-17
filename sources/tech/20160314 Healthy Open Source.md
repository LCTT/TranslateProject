Healthy Open Source
============================

keyword: Node.js , opensource , project management , software

*A walkthrough of the Node.js Foundation’s base contribution policy*.

A lot has changed since io.js and Node.js merged under the Node.js Foundation. The most impressive change, and probably the change that is most relevant to the rest of the community and to open source in general, is the growth in contributors and committers to the project.

A few years ago, Node.js had just a few committers (contributors with write access to the repository in order to merge code and triage bugs). The maintenance overhead for the few committers on Node.js Core was overwhelming and the project began to see a decline in both committers and outside contribution. This resulted in a corresponding decline in releases.

Today, the Node.js project is divided into many components with a full org size of well over 400 members. Node.js Core now has over 50 committers and over 100 contributors per month.

Through this growth we’ve found many tools that help scale the human infrastructure around an Open Source project. We also identified a few core values we believe are fundamental to modern Open Source: transparency, participation, and efficacy. As we continue to scale the way we do Open Source we try to find a balance of these values and adapt the practices we find help to fit the needs of each component of the Node.js project.

Now that Node.js is in a good place, the foundation is looking to promote this kind of sustainability in the ecosystem. Part of this is a new umbrella for additional projects to enter the foundation, of which [Express was recently admitted][1], and the creation of this new contribution policy.

This contribution policy is not universal. It’s meant as a starting point. Additions and alterations to this policy are encouraged so that the process used by each project fits its needs and can continue to change shape as the project grows and faces new challenges.

The [current version][2] is hosted in the Node.js Foundation. We expect to iterate on this over time and encourage people to [log issues][3] with questions and feedback regarding the policy for future iterations.

This document describes a very simple process suitable for most projects in the Node.js ecosystem. Projects are encouraged to adopt this whether they are hosted in the Node.js Foundation or not.

The Node.js project is organized into over a hundred repositories and a few dozen Working Groups. There are large variations in contribution policy between many of these components because each one has different constraints. This document is a minimalist version of the processes and philosophy we’ve found works best everywhere.

We believe that contributors should own their projects, and that includes contribution policies like this. While new foundation projects start with this policy we expect many of them to alter it or possibly diverge from it entirely to suite their own specific needs.

The goal of this document is to create a contribution process that:

* Encourages new contributions.

* Encourages contributors to remain involved.

* Avoids unnecessary processes and bureaucracy whenever possible.

* Creates a transparent decision making process which makes it clear how contributors can be involved in decision making.

Most contribution processes are created by maintainers who feel overwhelmed by outside contributions. These documents have traditionally been about processes that make life easier for a small group of maintainers, often at the cost of attracting new contributors.

We’ve gone the opposite direction. The purpose of this policy is to gain contributors, to retain them as much as possible, and to use a much larger and growing contributor base to manage the corresponding influx of contributions.

As projects mature, there’s a tendency to become top heavy and overly hierarchical as a means of quality control and this is enforced through process. We use process to add transparency that encourages participation which grows the code review pool which leads to better quality control.

This document is based on much prior art in the Node.js community, io.js, and the Node.js project.

This document is based on what we’ve learned growing the Node.js project. Not just the core project, which has been a massive undertaking, but also much smaller sub-projects like the website which have very different needs and, as a result, very different processes.

When we began these reforms in the Node.js project, we were taking a lot of inspiration from the broader Node.js ecosystem. In particular, Rod Vagg’s [OPEN Open Source policy][4]. Rod’s work in levelup and nan is the basis for what we now call “liberal contribution policies.”

### Vocabulary

* A **Contributor** is any individual creating or commenting on an issue or pull request.

* A **Committer** is a subset of contributors who have been given write access to the repository.

* A **TC (Technical Committee)** is a group of committers representing the required technical expertise to resolve rare disputes.

Every person who shows up to comment on an issue or submit code is a member of a project’s community. Just being able to see them means that they have crossed the line from being a user to being a contributor.

Typically open source projects have had a single distinction for those that have write access to the repository and those empowered with decision making. We’ve found this to be inadequate and have separated this into two distinctions which we’ll dive into more a bit later.

![](https://www.linux.com/images/stories/66866/healthy_1.png)

healthy 1Looking at the community in and around a project as a bunch of concentric circles helps to visualize this.

In the outermost circle are users, a subset of those users are contributors, a subset of contributors become committers who can merge code and triage issues. Finally, a smaller group of trusted experts who only get pulled in to the hard problems and can act as a tie-breaker in disputes.

This is what a healthy project should look like. As the demands on the project from increased users rise, so do the contributors, and as contributors increase more are converted into committers. As the committer base grows, more of them rise to the level of expertise where they should be involved in higher level decision making.

![](https://www.linux.com/images/stories/66866/healthy-2.png)

If these groups don’t grow in proportion to each other they can’t carry the load imposed on them by outward growth. A project’s ability to convert people from each of these groups is the only way it can stay healthy if its user base is growing.

This is what unhealthy projects look like in their earliest stages of dysfunction, but imagine that the committers bubble is so small you can’t actually read the word “committers” in it, and imagine this is a logarithmic scale.

healthy-2A massive user base is pushing a lot of contributions onto a very small number of maintainers.

This is when maintainers build processes and barriers to new contributions as a means to manage the workload. Often the problems the project is facing will be attributed to the tools the project is using, especially GitHub.

In Node.js we had all the same problems, resolved them without a change in tooling, and today manage a growing workload much larger than most projects, and GitHub has not been a bottleneck.

We know what happens to unhealthy projects over a long enough time period, more maintainers leave, contributions eventually fall, and **if we’re lucky** users leave it. When we aren’t so lucky adoption continues and years later we’re plagued with security and stability issues in widely adopt software that can’t be effectively maintained.

The number of users a project has is a poor indicator of the health of the project, often it is the most used software that suffers the biggest contribution crisis.

### Logging

Log an issue for any question or problem you might have. When in doubt, log an issue, any additional policies about what to include will be provided in the responses. The only exception is security disclosures which should be sent privately.

The first sentence is surprisingly controversial. A lot of maintainers complain that there isn’t a more heavy handed way of forcing people to read a document before they log an issue on GitHub. We have documents all over projects in the Node.js Foundation about writing good bug reports but, first and foremost, we encourage people to log something and try to avoid putting barriers in the way of that.

Sure, we get bad bugs, but we have a ton of contributors who can immediately work with people who log them to educate them on better practices and treat it as an opportunity to educate. This is why we have documentation on writing good bugs, in order to educate contributors, not as a barrier to entry.

Creating barriers to entry just reduces the number of people there’s a chance to identify, educate and potentially grow into greater contributors.

Of course, never log a public issue about a security disclosure, ever. This is a bit vague about the best private venue because we can’t determine that for every project that adopts this policy, but we’re working on a responsible disclosure mechanism for the broader community (stay tuned).

Committers may direct you to another repository, ask for additional clarifications, and add appropriate metadata before the issue is addressed.

For smaller projects this isn’t a big deal but in Node.js we’ve had to continually break off work into other, more specific, repositories just to keep the volume on a single repo manageable. But all anyone has to do when someone puts something in the wrong place is direct them to the right one.

Another benefit of growing the committer base is that there’s more people to deal with little things, like redirecting issues to other repos, or adding metadata to issues and PRs. This allows developers who are more specialized to focus on just a narrow subset of work rather than triaging issues.

Please be courteous, respectful, and every participant is expected to follow the project’s Code of Conduct.

One thing that can burn out a project is when people show up with a lot of hostility and entitlement. Most of the time this sentiment comes from a feeling that their input isn’t valued. No matter what, a few people will show up who are used to more hostile environments and it’s good to have these kinds of expectations explicit and written down.

And each project should have a Code of Conduct, which is an extension of these expectations that makes people feel safe and respected.

### Contributions

Any change to resources in this repository must be through pull requests. This applies to all changes to documentation, code, binary files, etc. Even long term committers and TC members must use pull requests.

No pull request can be merged without being reviewed.

Every change needs to be a pull request.

A Pull Request captures the entire discussion and review of a change. Allowing some subset of committers to slip things in without a Pull Request gives the impression to potential contributors that they they can’t be involved in the project because they don’t have access to a behind the scenes process or culture.

This isn’t just a good practice, it’s a necessity in order to be transparent enough to attract new contributors.

For non-trivial contributions, pull requests should sit for at least 36 hours to ensure that contributors in other timezones have time to review. Consideration should also be given to weekends and other holiday periods to ensure active committers all have reasonable time to become involved in the discussion and review process if they wish.

Part of being open and inviting to more contributors is making the process accessible to people in timezones all over the world. We don’t want to add an artificial delay in small doc changes but for any change that needs a bit of consideration needs to give people in different parts of the world time to consider it.

In Node.js we actually have an even longer timeline than this, 48 hours on weekdays and 72 on weekends. That might be too much for smaller projects so it is shorter in this base policy but as a project grows it may want to increase this as well.

The default for each contribution is that it is accepted once no committer has an objection. During review committers may also request that a specific contributor who is most versed in a particular area gives a “LGTM” before the PR can be merged. There is no additional “sign off” process for contributions to land. Once all issues brought by committers are addressed it can be landed by any committer.

A key part of the liberal contribution policies we’ve been building is an inversion of the typical code review process. Rather than the default mode for a change to be rejected until enough people sign off, we make the default for every change to land. This puts the onus on reviewers to note exactly what adjustments need to be made in order for it to land.

For new contributors it’s a big leap just to get that initial code up and sent. Viewing the code review process as a series of small adjustments and education, rather than a quality control hierarchy, does a lot to encourage and retain these new contributors.

It’s important not to build processes that encourage a project to be too top heavy, with a few people needing to sign off on every change. Instead, we just mention any committer than we think should weigh in on a specific review. In Node.js we have people who are the experts on OpenSSL, any change to crypto is going to need a LGTM from them. This kind of expertise forms naturally as a project grows and this is a good way to work with it without burning people out.

In the case of an objection being raised in a pull request by another committer, all involved committers should seek to arrive at a consensus by way of addressing concerns being expressed by discussion, compromise on the proposed change, or withdrawal of the proposed change.

This is what we call a lazy consensus seeking process. Most review comments and adjustments are uncontroversial and the process should optimize for getting them in without unnecessary process. When there is disagreement, try to reach an easy consensus among the committers. More than 90% of the time this is simple, easy and obvious.

If a contribution is controversial and committers cannot agree about how to get it to land or if it should land then it should be escalated to the TC. TC members should regularly discuss pending contributions in order to find a resolution. It is expected that only a small minority of issues be brought to the TC for resolution and that discussion and compromise among committers be the default resolution mechanism.

For the minority of changes that are controversial and don’t reach an easy consensus we escalate that to the TC. These are rare but when they do happen it’s good to reach a resolution quickly rather than letting things fester. Contentious issues tend to get a lot of attention, especially by those more casually involved in the project or even entirely outside of it, but they account for a relatively small amount of what the project does every day.

### Becoming a Committer

All contributors who land a non-trivial contribution should be on-boarded in a timely manner, and added as a committer, and be given write access to the repository.

This is where we diverge sharply from open source tradition.

Projects have historically guarded commit rights to their version control system. This made a lot of sense when we were using version control systems like subversion. A single contributor can inadvertently mess up a project pretty badly in older version control systems, but not so much in git. In git, there isn’t a lot that can’t be fixed and so most of the quality controls we put on guarding access are no longer necessary.

Not every committer has the rights to release or make high level decisions, so we can be much more liberal about giving out commit rights. That increases the committer base for code review and bug triage. As a wider range of expertise in the committer pool smaller changes are reviewed and adjusted without the intervention of the more technical contributors, who can spend their time on reviews only they can do.

This is they key to scaling contribution growth: committer growth.

Committers are expected to follow this policy and continue to send pull requests, go through proper review, and have other committers merge their pull requests.

This part is entirely redundant, but on purpose. Just a reminder even once someone is a committer their changes still flow through the same process they followed before.

### TC Process

The TC uses a “consensus seeking” process for issues that are escalated to the TC. The group tries to find a resolution that has no open objections among TC members. If a consensus cannot be reached that has no objections then a majority wins vote is called. It is also expected that the majority of decisions made by the TC are via a consensus seeking process and that voting is only used as a last-resort.

The best solution tends to be the one everyone can agree to so you would think that consensus systems would be the norm. However, **pure consensus** systems incentivize obstructionism which we need to avoid.

In pure consensus everyone essentially has a veto. So, if I don’t want something to happen I’m in a strong position of power over everyone that wants something to happen. They have to convince me, and I don’t have to convince anyone else of anything.

To avoid this we use a system called “consensus seeking” which has a long history outside of open source. It’s quite simple, just attempt to reach a consensus, if a consensus can’t be reached then call for a majority wins vote.

Just the fact that a vote **is a possibility** means that people can’t be obstructionists, whether someone favor a change or not, they have to convince their peers and if they aren’t willing to put in the work to convince their peers then they probably don’t involve themselves in that decision at all.

The way these incentives play out is pretty impressive. We started using this process in io.js and adopted it in Node.js when we merged into the foundation. In that entire time we’ve never actually had to call for a vote, just the fact that we could is enough to keep everyone working together to find a solution and move forward.

Resolution may involve returning the issue to committers with suggestions on how to move forward towards a consensus. It is not expected that a meeting of the TC will resolve all issues on its agenda during that meeting and may prefer to continue the discussion happening among the committers.

A TC tries to resolve things in a timely manner so that people can make progress but often it’s better to provide some additional guidance that pushes the greater contributorship towards resolution without being heavy handed.

Avoid creating big decision hierarchies. Instead, invest in a broad, growing and empowered contributorship that can make progress without intervention. We need to view a constant need for intervention by a few people to make any and every tough decision as the biggest obstacle to healthy Open Source.

Members can be added to the TC at any time. Any committer can nominate another committer to the TC and the TC uses its standard consensus seeking process to evaluate whether or not to add this new member. Members who do not participate consistently at the level of a majority of the other members are expected to resign.

The TC just uses the same consensus seeking process for adding new members as it uses for everything else.

It’s a good idea to encourage committers to nominate people to the TC and not just wait around for TC members to notice the impact some people are having. Listening to the broader committers about who they see as having a big impact keeps the TC’s perspective inline with the rest of the project.

As a project grows it’s important to add people from a variety of skill sets. If people are doing a lot of docs work, or test work, treat the investment they are making as equally valuable as the hard technical stuff.

Projects should have the same ladder, user -> contributor -> commiters -> TC member, for every skill set they want to build into the project to keep it healthy.

I often see long time maintainers worry about adding people who don’t understand every part of the project, as if they have to be involved in every decision. The reality is that people do know their limitations and want to defer hard decisions to people they know have more experience.

Thanks to Greg [Wallace][5] and ashley [williams][6].

--------------------------------------------------------------------------------

via: https://www.linux.com/news/biz-os/governance/892141-healthy-open-source

作者：[Mikeal Rogers][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/community/forums/person/66928


[1]: https://medium.com/@nodejs/node-js-foundation-to-add-express-as-an-incubator-project-225fa3008f70#.mc30mvj4m
[2]: https://github.com/nodejs/TSC/blob/master/BasePolicies/CONTRIBUTING.md
[3]: https://github.com/nodejs/TSC/issues
[4]: https://github.com/Level/community/blob/master/CONTRIBUTING.md
[5]: https://medium.com/@gtewallaceLF
[6]: https://medium.com/@ag_dubs
