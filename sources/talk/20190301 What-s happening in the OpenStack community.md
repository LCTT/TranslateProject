[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What's happening in the OpenStack community?)
[#]: via: (https://opensource.com/article/19/3/whats-happening-openstack)
[#]: author: (Jonathan Bryce https://opensource.com/users/jonathan-bryce)

What's happening in the OpenStack community?
======

In many ways, 2018 was a transformative year for the OpenStack Foundation.

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/travel-mountain-cloud.png?itok=ZKsJD_vb)

Since 2010, the OpenStack community has been building open source software to run cloud computing infrastructure. Initially, the focus was public and private clouds, but open infrastructure has been pulled into many new important use cases like telecoms, 5G, and manufacturing IoT.

As OpenStack software matured and grew in scope to support new technologies like bare metal provisioning and container infrastructure, the community widened its thinking to embrace users who deploy and run the software in addition to the developers who build the software. Questions like, "What problems are users trying to solve?" "Which technologies are users trying to integrate?" and "What are the gaps?" began to drive the community's thinking and decision making.

In response to those questions, the OSF reorganized its approach and created a new "open infrastructure" framework focused on use cases, including edge, container infrastructure, CI/CD, and private and hybrid cloud. And, for the first time, the OSF is hosting open source projects outside of the OpenStack project.

Following are three highlights from the [OSF 2018 Annual Report][1]; I encourage you to read the entire report for more detailed information about what's new.

### Pilot projects

On the heels of launching [Kata Containers][2] in December 2017, the OSF launched three pilot projects in 2018—[Zuul][3], [StarlingX][4], and [Airship][5]—that help further our goals of taking our technology into additional relevant markets. Each project follows the tenets we consider key to the success of true open source, [the Four Opens][6]: open design, open collaboration, open development, and open source. While these efforts are still new, they have been extremely valuable in helping us learn how we should expand the scope of the OSF, as well as showing others the kind of approach we will take.

While the OpenStack project remained at the core of the team's focus, pilot projects are helping expand usage of open infrastructure across markets and already benefiting the OpenStack community. This has attracted dozens of new developers to the open infrastructure community, which will ultimately benefit the OpenStack community and users.

There is direct benefit from these contributors working upstream in OpenStack, such as through StarlingX, as well as indirect benefit from the relationships we've built with the Kubernetes community through the Kata Containers project. Airship is similarly bridging the gaps between the Kubernetes and OpenStack ecosystems. This shows users how the technologies work together. A rise in contributions to Zuul has provided the engine for OpenStack CI and keeps our development running smoothly.

### Containers collaboration

In addition to investing in new pilot projects, we continued efforts to work with key adjacent projects in 2018, and we made particularly good progress with Kubernetes. OSF staffer Chris Hoge helps lead the cloud provider special interest group, where he has helped standardize how Kubernetes deployments expect to run on top of various infrastructure. This has clarified OpenStack's place in the Kubernetes ecosystem and led to valuable integration points, like having OpenStack as part of the Kubernetes release testing process.

Additionally, OpenStack Magnum was certified as a Kubernetes installer by the CNCF. Through the Kata Containers community, we have deepened these relationships into additional areas within the container ecosystem resulting in a number of companies getting involved for the first time.

### Evolving events

We knew heading into 2018 that the environment around our events was changing and we needed to respond. During the year, we held two successful project team gatherings (PTGs) in Dublin and Denver, reaching capacity for both events while also including new projects and OpenStack operators. We held OpenStack Summits in Vancouver and Berlin, both experiencing increases in attendance and project diversity since Sydney in 2017, with each Summit including more than 30 open source projects. Recognizing this broader audience and the OSF's evolving strategy, the OpenStack Summit was renamed the [Open Infrastructure Summit][7], beginning with the Denver event coming up in April.

In 2018, we boosted investment in China, onboarding a China Community Manager based in Shanghai and hosting a strategy day in Beijing with 30+ attendees from Gold and Platinum Members in China. This effort will continue in 2019 as we host our first Summit in China: the [Open Infrastructure Summit Shanghai][8] in November.

We also worked with the community in 2018 to define a new model for events to maximize participation while saving on travel and expenses for the individuals and companies who are increasingly stretched across multiple open source communities. We arrived at a plan that we will implement and iterate on in 2019 where we will collocate PTGs as standalone events adjacent to our Open Infrastructure Summits.

### Looking ahead

We've seen impressive progress, but the biggest accomplishment might be in establishing a framework for the future of the foundation itself. In 2018, we advanced the open infrastructure mission by establishing OSF as an effective place to collaborate for CI/CD, container infrastructure, and edge computing, in addition to the traditional public and private cloud use cases. The open infrastructure approach opened a lot of doors in 2018, from the initial release of software from each pilot project, to live 5G demos, to engagement with hyperscale public cloud providers.

Ultimately, our value comes from the effectiveness of our communities and the software they produce. As 2019 unfolds, our community is excited to apply learnings from 2018 to the benefit of developers, users, and the commercial ecosystem across all our projects.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/3/whats-happening-openstack

作者：[Jonathan Bryce][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jonathan-bryce
[b]: https://github.com/lujun9972
[1]: https://www.openstack.org/foundation/2018-openstack-foundation-annual-report
[2]: https://katacontainers.io/
[3]: https://zuul-ci.org/
[4]: https://www.starlingx.io/
[5]: https://www.airshipit.org/
[6]: https://www.openstack.org/four-opens/
[7]: https://www.openstack.org/summit/denver-2019/
[8]: https://www.openstack.org/summit/shanghai-2019
