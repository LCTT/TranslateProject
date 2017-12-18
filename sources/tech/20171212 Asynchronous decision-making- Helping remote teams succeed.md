translating by lujun9972
Asynchronous decision-making: Helping remote teams succeed
======
Asynchronous decision-making is a strategy that enables geographically and culturally distributed software teams to make decisions more efficiently. In this article, I'll discuss some of the principles and tools that make this approach possible.

Synchronous decision-making, in which participants interact with each other in real time, can be expensive for people who work on a [Maker's Schedule][1], and they are often impractical for remote teams. We've all seen how such meetings can devolve into inefficient time wasters that we all dread and avoid.

In contrast, asynchronous decision-making, which is often used in large open source projects--for example, at the Apache Software Foundation (ASF), where I'm most active--provides an efficient way for teams to move forward with minimal meetings. Many open source projects involve only a few meetings each year (and some none at all), yet development teams consistently produce high-quality software.

How does asynchronous decision-making work?

## Required tools

### Central asynchronous communications channel

The first thing you need to enable asynchronous decision-making is a central asynchronous communications channel. The technology you use must enable all team members to get the same information and hold threaded discussions, where you can branch off on a topic while ignoring other topics being discussed on the same channel. Think of marine radio, in which a broadcast channel is used sparingly to get the attention of specific people, who then branch off to a sub-channel to have more detailed discussions.

Many open source projects still use mailing lists as this central channel, although younger software developers might consider this approach old and clunky. Mailing lists require a lot of discipline to efficiently manage the high traffic of a busy project, particularly when it comes to meaningful quoting, sticking to one topic per thread, and making sure [subject lines are relevant][2]. Still, when used properly and coupled with an indexed archive, mailing lists remain the most ubiquitous tool to create a central channel.

Corporate teams might benefit from more modern collaboration tools, which can be easier to use and provide stronger multimedia features. Regardless of which tools you use, the key is to create a channel in which large groups of people can communicate efficiently and asynchronously on a wide variety of topics. A [busy channel is often preferable to multiple channels][3] to create a consistent and engaged community.

### Consensus-building mechanism

The second tool is a mechanism for building consensus so you can avoid deadlocks and ensure that decisions go forward. Unanimity in decision-making is ideal, but consensus, defined as "widespread agreement among people who have decision power," is second-best. Requiring unanimity or allowing vetoes in decision-making can block progress, so at the ASF vetoes apply only to a very limited set of decision types. The [ASF's voting rules][4] constitute a well-established and often-emulated approach to building consensus in loosely coupled teams which, like the ASF, may have no single boss. They can also be used when consensus doesn't emerge naturally.

### Case management system

Building consensus usually happens on the project's central channel, as described above. But for complex topics, it often makes sense to use a third tool: a case management system. Groups can then focus the central channel on informal discussions and brainstorming, then move to a more structured case management system when a discussion evolves into a decision.

The case management system organizes decisions more precisely. Smaller teams with fewer decisions to make could work without one, but many find it convenient to be able to discuss the details of a given decision and keep associated information in a single, relatively isolated place.

A case management system does not require complex software; at the ASF we use simple issue trackers, web-based systems originally created for software support and bug management. Each case is handled on a single web page, with a history of comments and actions. This approach works well for keeping track of decisions and the paths that lead to them. Some non-urgent or complex decisions can take a long time to reach closure, for example, and it's useful to have their history in a single place. New team members can also get up to speed quickly by learning which decisions were made most recently, which remain outstanding, who's involved in each one, and the background behind each decision.

## Success stories

The nine members of ASF's board of directors make a few dozen decisions at each monthly phone meeting, which last less than two hours. We carefully prepare for these meetings by making most of our decisions asynchronously in advance. This allows us to focus the meeting on the complex or uncertain issues rather than the ones that already have full or partial consensus.

An interesting example outside of the software world is the [Swiss Federal Council's weekly meeting][5], which runs in a way similar to ASF. Teams prepare for the meeting by using asynchronous decision-making to build consensus. The meeting agenda consists of a set of color-coded lists that indicate which items can be approved quickly, which need more discussion, and which are expected to be most complex. This allows seven busy people to make more than 2,500 decisions each year, in about 50 weekly sessions of a few hours each. Sounds pretty efficient to me.

In my experience, the benefits of asynchronous decision-making are well worth the investment in time and tools. It also leads to happier team members, which is a key component of success.

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/12/asynchronous-decision-making

作者：[Bertrand Delacretaz][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com
[1]:http://www.paulgraham.com/makersschedule.html
[2]:https://grep.codeconsult.ch/2017/11/10/large-mailing-lists-survival-guide/
[3]:https://grep.codeconsult.ch/2011/12/06/stefanos-mazzocchis-busy-list-pattern/
[4]:http://www.apache.org/foundation/voting.html
[5]:https://www.admin.ch/gov/en/start/federal-council/tasks/decision-making/federal-council-meeting.html
