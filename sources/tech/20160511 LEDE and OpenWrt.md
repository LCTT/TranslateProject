LEDE and OpenWrt
===================

The [OpenWrt][1] project is perhaps the most widely known Linux-based distribution for home WiFi routers and access points; it was spawned from the source code of the now-famous Linksys WRT54G router more than 12 years ago. In early May, the OpenWrt user community was thrown into a fair amount of confusion when a group of core OpenWrt developers [announced][2] that they were starting a spin-off (or, perhaps, a fork) of OpenWrt to be named the [Linux Embedded Development Environment][3] (LEDE). It was not entirely clear to the public why the split was taking place—and the fact that the LEDE announcement surprised a few other OpenWrt developers suggested trouble within the team.

The LEDE announcement was sent on May 3 by Jo-Philipp Wich to both the OpenWrt development list and the new LEDE development list. It describes LEDE as "a reboot of the OpenWrt community" and as "a spin-off of the OpenWrt project" seeking to create an embedded-Linux development community "with a strong focus on transparency, collaboration and decentralisation."

The rationale given for the reboot was that OpenWrt suffered from longstanding issues that could not be fixed from within—namely, regarding internal processes and policies. For instance, the announcement said, the number of developers is at an all-time low, but there is no process for on-boarding new developers (and, it seems, no process for granting commit access to new developers). The project infrastructure is unreliable (evidently, server outages over the past year have caused considerable strife within the project), the announcement said, but internal disagreements and single points of failure prevented fixing it. There is also a general lack of "communication, transparency and coordination" internally and from the project to the outside world. Finally, a few technical shortcomings were cited: inadequate testing, lack of regular builds, and poor stability and documentation.

The announcement goes on to describe how the LEDE reboot will address these issues. All communication channels will be made available for public consumption, decisions will be made by project-wide votes, the merge policy will be more relaxed, and so forth. A more detailed explanation of the new project's policies can be found on the [rules][4] page at the LEDE site. Among other specifics, it says that there will be only one class of committer (that is, no "core developer" group with additional privileges), that simple majority votes will settle decisions, and that any infrastructure managed by the project must have at least three operators with administrative access. On the LEDE mailing list, Hauke Mehrtens [added][5] that the project will make an effort to have patches sent upstream—a point on which OpenWrt has been criticized in the past, especially where the kernel is concerned.

In addition to Wich, the announcement was co-signed by OpenWrt contributors John Crispin, Daniel Golle, Felix Fietkau, Mehrtens, Matthias Schiffer, and Steven Barth. It ends with an invitation for others interested in participating to visit the LEDE site.

#### Reactions and questions

One might presume that the LEDE organizers expected their announcement to be met with some mixture of positive and negative reactions. After all, a close reading of the criticisms of the OpenWrt project in the announcement suggests that there were some OpenWrt project members that the LEDE camp found difficult to work with (the "single points of failure" or "internal disagreements" that prevented infrastructure fixes, for instance).

And, indeed, there were negative responses. OpenWrt co-founder Mike Baker [responded][6] with some alarm, disagreeing with all of the LEDE announcement's conclusions and saying "phrases such as a 'reboot' are both vague and misleading and the LEDE project failed to identify its true nature." Around the same time, someone disabled the @openwrt.org email aliases of those developers who signed the LEDE announcement; when Fietkau [objected][7], Baker [replied][8] that the accounts were "temporarily disabled" because "it's unclear if LEDE still represents OpenWrt." Imre Kaloz, another core OpenWrt member, [wrote][9]that "the LEDE team created most of that [broken] status quo" in OpenWrt that it was now complaining about.

But the majority of the responses on the OpenWrt list expressed confusion about the announcement. List members were not clear whether the LEDE team was going to [continue contributing][10] to OpenWrt or not, nor what the [exact nature][11] of the infrastructure and internal problems were that led to the split. Baker's initial response lamented the lack of public debate over the issues cited in the announcement: "We recognize the current OpenWrt project suffers from a number of issues," but "we hoped we had an opportunity to discuss and attempt to fix" them. Baker concluded:

We would like to stress that we do want to have an open discussion and resolve matters at hand. Our goal is to work with all parties who can and want to contribute to OpenWrt, including the LEDE team.

In addition to the questions over the rationale of the new project, some list subscribers expressed confusion as to whether LEDE was targeting the same uses cases as OpenWrt, given the more generic-sounding name of the new project. Furthermore, a number of people, such as Roman Yeryomin, [expressed confusion][12] as to why the issues demanded the departure of the LEDE team, particularly given that, together, the LEDE group constituted a majority of the active core OpenWrt developers. Some list subscribers, like Michael Richardson, were even unclear on [who would still be developing][13] OpenWrt.

#### Clarifications

The LEDE team made a few attempts to further clarify their position. In Fietkau's reply to Baker, he said that discussions about proposed changes within the OpenWrt project tended to quickly turn "toxic," thus resulting in no progress. Furthermore:

A critical part of many of these debates was the fact that people who were controlling critical pieces of the infrastructure flat out refused to allow other people to step up and help, even in the face of being unable to deal with important issues themselves in a timely manner.

This kind of single-point-of-failure thing has been going on for years, with no significant progress on resolving it.

Neither Wich nor Fietkau pointed fingers at specific individuals, although others on the list seemed to think that the infrastructure and internal decision-making problems in OpenWrt came down to a few people. Daniel Dickinson [stated][14] that:

My impression is that Kaloz (at least) holds infrastructure hostage to maintain control, and that the fundamental problem here is that OpenWrt is *not* democratic and ignores what people who were ones visibly working on openwrt want and overrides their wishes because he/they has/have the keys.

On the other hand, Luka Perkov [countered][15] that many OpenWrt developers wanted to switch from Subversion to Git, but that Fietkau was responsible for blocking that change.

What does seem clear is that the OpenWrt project has been operating with a governance structure that was not functioning as desired and, as a result, personality conflicts were erupting and individuals were able to disrupt or block proposed changes simply by virtue of there being no well-defined process. Clearly, that is not a model that works well in the long run.

On May 6, Crispin [wrote][16] to the OpenWrt list in a new thread, attempting to reframe the LEDE project announcement. It was not, he said, meant as a "hostile or disruptive" act, but to make a clean break from the dysfunctional structures of OpenWrt and start fresh. The matter "does not boil down to one single event, one single person or one single flamewar," he said. "We wanted to split with the errors we have done ourselves in the past and the wrong management decision that were made at times." Crispin also admitted that the announcement had not been handled well, saying that the LEDE team "messed up the politics of the launch."

Crispin's email did not seem to satisfy Kaloz, who [insisted][17] that Crispin (as release manager) and Fietkau (as lead developer) could simply have made any desirable changes within the OpenWrt project. But the discussion thread has subsequently gone silent; whatever happens next on either the LEDE or OpenWrt side remains to be seen.

#### Intent

For those still seeking further detail on what the LEDE team regarded as problematic within OpenWrt, there is one more source of information that can shed light on the issues. Prior to the public announcement, the LEDE organizers spent several weeks hashing out their plan, and IRC logs of the meetings have now been [published][18]. Of particular interest is the March 30 [meeting][19] that includes a detailed discussion of the project's goals.

Several specific complaints about OpenWrt's infrastructure are included, such as the shortcomings of the project's Trac issue tracker. It is swamped with incomplete bug reports and "me too" comments, Wich said, and as a result, few committers make use of it. In addition, people seem confused by the fact that bugs are also being tracked on GitHub, making it unclear where issues ought to be discussed.

The IRC discussion also tackles the development process itself. The LEDE team would like to implement several changes, starting with the use of staging trees that get merged into the trunk during a formal merge window, rather than the commit-directly-to-master approach employed by OpenWrt. The project would also commit to time-based releases and encourage user testing by only releasing binary modules that have successfully been tested, by the community rather than the core developers, on actual hardware.

Finally, the IRC discussion does make it clear that the LEDE team's intent was not to take OpenWrt by surprise with its announcement. Crispin suggested that LEDE be "semi public" at first and gradually be made more public. Wich noted that he wanted LEDE to be "neutral, professional and welcoming to OpenWrt to keep the door open for a future reintegration." The launch does not seem to have gone well on that front, which is unfortunate.

In an email, Fietkau added that the core OpenWrt developers had been suffering from bottlenecks on tasks like patch review and maintenance work that were preventing them from getting other work done—such as setting up download mirrors or improving the build system. In just the first few days after the LEDE announcement, he said, the team had managed to tackle the mirror and build-system tasks, which had languished for years.

A lot of what we did in LEDE was based on the experience with decentralizing the development of packages by moving it to GitHub and giving up a lot of control over how packages should be maintained. This ended up reducing our workload significantly and we got quite a few more active developers this way.

We really wanted to do something similar with the core development, but based on our experience with trying to make bigger changes we felt that we couldn't do this from within the OpenWrt project.

Fixing the infrastructure will reap other dividends, too, he said, such as an improved system for managing the keys used to sign releases. The team is considering a rule that imposes some conditions on non-upstream patches, such as requiring a description of the patch and an explanation of why it has not yet been sent upstream. He also noted that many of the remaining OpenWrt developers have expressed interest in joining LEDE, and that the parties involved are trying to figure out if they will re-merge the projects.

One would hope that LEDE's flatter governance model and commitment to better transparency will help it to find success in areas where OpenWrt has struggled. For the time being, sorting out the communication issues that plagued the initial announcement may prove to be a major hurdle. If that process goes well, though, LEDE and OpenWrt may find common ground and work together in the future. If not, then the two teams may each be forced to move forward with fewer resources than they had before, which may not be what developers or users want to see.

--------------------------------------------------------------------------------

via: https://lwn.net/Articles/686767/

作者：[Nathan Willis ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://lwn.net/Articles/686767/
[1]:https://openwrt.org/
[2]:https://lwn.net/Articles/686180/
[3]:https://www.lede-project.org/
[4]:https://www.lede-project.org/rules.html
[5]:http://lists.infradead.org/pipermail/lede-dev/2016-May/000080.html
[6]:https://lwn.net/Articles/686988/
[7]:https://lwn.net/Articles/686989/
[8]:https://lwn.net/Articles/686990/
[9]:https://lwn.net/Articles/686991/
[10]:https://lwn.net/Articles/686995/
[11]:https://lwn.net/Articles/686996/
[12]:https://lwn.net/Articles/686992/
[13]:https://lwn.net/Articles/686993/
[14]:https://lwn.net/Articles/686998/
[15]:https://lwn.net/Articles/687001/
[16]:https://lwn.net/Articles/687003/
[17]:https://lwn.net/Articles/687004/
[18]:http://meetings.lede-project.org/lede-adm/2016/?C=M;O=A
[19]:http://meetings.lede-project.org/lede-adm/2016/lede-adm.2016-03-30-11.05.log.html
