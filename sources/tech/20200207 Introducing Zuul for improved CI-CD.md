[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Introducing Zuul for improved CI/CD)
[#]: via: (https://opensource.com/article/20/2/zuul)
[#]: author: (Jeremy Stanley https://opensource.com/users/fungi)

Introducing Zuul for improved CI/CD
======
A quick history of how and why Zuul is replacing Jenkins in CI testing
in the OpenStack community.
![Plumbing tubes in many directions][1]

[Jenkins][2] is a marvelous piece of software. As an execution and automation engine, it's one of the best you're going to find. Jenkins serves as a key component in countless continuous integration (CI) systems, and this is a testament to the value of what its community has built over the years. But that's what it is­­—a component. Jenkins is not a CI system itself; it just runs things for you. It does that really well and has a variety of built-ins and a vibrant ecosystem of plugins to help you tell it what to run, when, and where.

CI is, at the most fundamental level, about integrating the work of multiple software development streams into a coherent whole with as much frequency and as little friction as possible. Jenkins, on its own, doesn't know about your source code or how to merge it together, nor does it know how to give constructive feedback to you and your colleagues. You can, of course, glue it together with other software that can perform these activities, and this is how many CI systems incorporate Jenkins.

It's what we did for OpenStack, too, at least at first.

### If it's not tested, it's broken

In 2010, an open source community of projects called [OpenStack][3] was forming. Some of the developers brought in to assist with the collaboration infrastructure also worked on a free database project called [Drizzle][4], and a key philosophy within that community was the idea "if it's not tested, it's broken." So OpenStack, on day one, required all proposed changes of its software to be reviewed and tested for regressions before they could be approved to merge into the trunk of any source code repositories. To do this, Hudson (which later forked to form the Jenkins project) was configured to run tests exercising every change.

A plugin was installed to interface with the [Gerrit][5] code review system, automatically triggering jobs when new changes were proposed and reporting back with review comments indicating whether they succeeded or failed. This may sound rudimentary by today's standards, but at the time, it was a revolutionary advancement for an open source collaboration. No developer on OpenStack was special in the eyes of CI, and everyone's changes had to pass this growing battery of tests before they could merge—a concept the project called "project gating."

There was, however, an emerging flaw with this gating idea: To guarantee two unrelated changes didn't alter a piece of software in functionally incompatible ways, they had to be tested one at a time in sequence before they could merge. OpenStack was complicated to install and test, even back then, and quickly grew in popularity. The rising volume of developer contributions coupled with increasing test coverage meant that, during busy periods, there was simply not enough time to test every change that passed review. Some longer-running jobs took nearly an hour to complete, so the upper bound for what could get through the gate was roughly two dozen changes in a day. The resulting merge backlog showed a new solution was required.

### Enter Zuul

During an OpenStack CI meeting in May 2012, one of the CI team members, James Blair, [announced][6] that he'd "been working on speculative execution of Jenkins jobs." **Speculative execution** is an optimization most commonly found in the pipelines of modern microprocessors. Much like the analogy with processor hardware, the theory was that by optimistically predicting positive gating results for changes recently approved but that had not yet completed their tests, subsequently approved changes could be tested concurrently and then conditionally merged as long as their predecessors also passed tests and merged. James said he had a name for this intelligent scheduler: [Zuul][7].

Within this time frame, challenges from trying to perform better revision control for Jenkins' XML job configuration led to the creation of the human-readable YAML-based [Jenkins Job Builder][8] templating engine. Limited success with the JClouds plugin for Jenkins and cumbersome attempts to use jobs for refreshing cloud images of single-use Jenkins slaves ended with the creation of the [Nodepool][9] service. Limited log-storage capabilities resulted in the team adding separate external solutions for organizing, serving, and indexing job logs and assuming maintainership of an abandoned secure copy protocol (SCP) plugin replacing the less-secure FTP option that Jenkins provided out of the box. The OpenStack infrastructure team was slowly building a fleet of services and utilities around Jenkins but began to bump up against a performance limitation.

### Multiplying Jenkins

By mid-2013, Nodepool was constantly recycling as many as 100 virtual machines registered with Jenkins as slaves, but this was no longer enough to keep up with the growing workload. Thread contention for global locks in Jenkins thwarted all attempts to push past this threshold, no matter how much processor power and memory was thrown at the master server. The project had offers to donate additional capacity for Jenkins slaves to help relieve the frequent job backlog, but this would require an additional Jenkins master. The efficient division of work between multiple masters needed a new channel of communication for dispatch and coordination of jobs. Zuul's maintainers identified the [Gearman][10] job server protocol as an ideal fit, so they outfitted Zuul with a new [geard][11] service and extended Jenkins with a custom Gearman client plugin.

Now that jobs were spread across a growing assembly of Jenkins masters, there was no longer any single dashboard with a complete view of job activity and results. In order to facilitate this new multi-master world, Zuul grew its own status API and WebUI, as well as a feature to emit metrics through the [StatsD][12] protocol. Over the next few years, Zuul steadily subsumed more of the CI features its users relied on, while Jenkins' place in the system waned accordingly, and it was becoming a liability. OpenStack made an early choice to standardize on the Python programming language; this was reflected in Zuul's development, yet Jenkins and its plugins were implemented in Java. Zuul's configuration was maintained in the same YAML serialization format that OpenStack used to template its own Jenkins jobs, while Jenkins kept everything in baroque XML. These differences complicated ongoing maintenance and led to an unnecessarily steep learning curve for new administrators from related communities that had started trying to run Zuuls.

The time was right for another revolution.

### The rise of Ansible

In early 2016, Zuul's maintainers embarked on an ambitious year-long overhaul of their growing fleet of services with the goal of eliminating Jenkins from the overall system design. By this time, Jenkins was serving only as a conduit for running jobs consisting mostly of shell scripts on slave nodes over SSH, providing real-time streaming of job output and copying resulting artifacts to longer-term storage. [Ansible][13] was found to be a great fit for that first need; purpose-built to run commands remotely over SSH, it was written in Python, just like Zuul, and also used YAML to define its tasks. It even had built-in modules for features the team had previously implemented as bespoke Jenkins plugins. Ansible provided true multi-node support right out of the box, so the same playbooks could be used for both simulating and performing complex production deployments. An ever-expanding ecosystem of third-party modules filled in any gaps, in much the same way as the Jenkins community's plugins had before.

A new Zuul executor service filled the prior role of the Jenkins master: it acted on pending requests in the scheduler's geard, dispatched them via Ansible to ephemeral servers managed by Nodepool, then collected results and artifacts for publication. It also exposed in-progress build output over the classic [RFC 742 Name/Finger protocol][14], streamed in real time from an extension of Ansible's command output module. Once it was no longer necessary to limit jobs to what Jenkins' parser could comprehend, Zuul was free to grow new features like distributed in-repository job definitions, shareable between projects with inheritance and secure handling of secrets, as well as the ability to test-drive proposed changes for the jobs themselves. Jenkins served its purpose admirably, but at least for Zuul, its usefulness was finally at an end.

### Testing the future

Zuul's community likes to say that it "tests the future" through its novel application of speculative execution. Gone are the harrowing days of wondering whether the improvement you want to make to an existing job will render it non-functional once it's applied in production. Overloaded review teams for a massive central job repository are a thing of the past. Jobs are treated as a part of the software and shipped right alongside the rest of the source code, taking advantage of Zuul's other features like cross-repository dependencies so that your change to part of a job in one project can be exercised with a proposed job change in another project. It will even comment on your job changes, highlighting specific lines with syntax problems as if it were another code reviewer giving you advice.

These were features Zuul only dreamed of before, but which required freedom from Jenkins so that it could take job parsing into its own hands. This is the future of CI, and Zuul's users are living it.

As of early 2019, the OpenStack Foundation recognized Zuul as an independent, openly governed project with its own identity and flourishing community. If you're into open source CI, consider taking a look. Development on the next evolution of Zuul is always underway, and you're welcome to help. Find out more on [Zuul's website][7].

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/zuul

作者：[Jeremy Stanley][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/fungi
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/plumbing_pipes_tutorial_how_behind_scenes.png?itok=F2Z8OJV1 (Plumbing tubes in many directions)
[2]: https://jenkins.io/
[3]: https://www.openstack.org/
[4]: https://en.wikipedia.org/wiki/Drizzle_(database_server)
[5]: https://www.gerritcodereview.com/
[6]: http://eavesdrop.openstack.org/irclogs/%23openstack-meeting/%23openstack-meeting.2012-05-22.log.html#t2012-05-22T19:42:27
[7]: https://zuul-ci.org/
[8]: https://jenkins-job-builder.readthedocs.io/
[9]: https://zuul-ci.org/docs/nodepool/
[10]: http://gearman.org/
[11]: https://docs.opendev.org/opendev/gear/#server-example
[12]: https://github.com/statsd/statsd
[13]: https://www.ansible.com/
[14]: https://tools.ietf.org/html/rfc742
