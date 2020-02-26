[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Election fraud: Is there an open source solution?)
[#]: via: (https://opensource.com/article/19/9/voting-fraud-open-source-solution)
[#]: author: (Jeff Macharyas https://opensource.com/users/jeffmacharyashttps://opensource.com/users/mbrownhttps://opensource.com/users/luis-ibanezhttps://opensource.com/users/jhibbets)

Election fraud: Is there an open source solution?
======
The Trust The Vote project is developing open source technology to help
keep elections honest.
![Team checklist][1]

Can open source technology help keep our elections honest? With its [Trust The Vote Project][2], the [Open Source Election Technology (OSET) Institute][3] is working on making that a reality for elections in the United States and around the world.

The project is developing an open, adaptable, flexible, full-featured, and innovative elections technology platform called [ElectOS][4]. It will support all aspects of elections administration and voting, including creating, marking, casting, and counting ballots and managing all back-office functions. The software is freely available under an Open Source Initiative (OSI)-recognized public license for adoption, adaptation, and deployment by anyone, including elections jurisdictions directly or, more commonly, commercial vendors or systems integrators.

With elections coming under more and more scrutiny due to vulnerable designs, aging machinery, hacking, foreign influence, and human incompetence, the OSET Institute is working on technology that will help ensure that every vote is counted as it was cast.

### Mississippi churning

The Mississippi Republican gubernatorial primary in August 2019 was called into question when a voting machine malfunctioned, denying a vote for candidate Bill Waller as the machine changed it to his opponent, Tate Reeves. The incident was [caught on camera][5].

"Around 40 states have voting machines that are a decade old or older," J. Alex Halderman, a computer science professor at the University of Michigan, tells [Politifact][6]. "There are reports of machines misbehaving in this manner after almost every election." That's rather alarming. Can open source be a solution to this problem?

The OSET Institute was founded in January 2007 by venture capital advisers who are alumni of Apple, Mozilla, Netscape, and Sun Microsystems. It is a non-partisan, non-profit 501(c)3 organization that researches and designs public technology—open source technology—for use in the US and around the world.

"For a long time, there have been systemic problems—market malformation and dysfunction—in the election industry. Due to market dynamics and industry performance issues, there has been no commercial incentive to make the investment in the necessary research and development to produce the kind of high-assurance, mission-critical systems for verifiable and accurate elections," says Gregory Miller, co-founder and COO of the OSET Institute.

Reflecting back to the 2000 presidential election between Vice President Al Gore and Texas Governor George W. Bush, Miller says: "Nobody was thinking about digital attacks during the ['chadfest' of Florida][7] and even as recently as 2007." Miller adds that one of the most important aspects of public technology is that it must be entirely trustworthy.

### Essential election technologies

Most voting systems in use are based around proprietary, black-box hardware and software built on 1990s technology—Windows 2000 or older. Some newer machines are running Windows 7—which is scheduled to lose maintenance and support in January 2020.

Miller says there are two crucial parts of the election process: the election administration systems and the voting systems.

  * Election administration systems in the back office are responsible for elections setup, administration, and operation, especially casting and counting ballots; voter registration; ballot design, layout, and distribution; poll-book configuration; ballot-marking device configuration; and election results reporting and analytics.
  * Voting systems are simply the ballot marking, casting, and counting components.



The most important element of the system is the bridge between the voting systems in polling places and the back-office administration systems. This behind-the-scenes process aggregates vote tallies into tabulations to determine the results.

The key device—and arguably the Achilles Heel of the entire ecosystem—is the election management system (EMS), which is the connection between election administration and the voting systems. The EMS machine is a back-office element but also a component of the voting system. Because the EMS software typically resides on a desktop machine used for a variety of government functions that serve citizens, it is the element most vulnerable to attacks.

Despite the vote-changing problem in the Mississippi primary, Miller warns, "the vulnerability of attack is not to the voting machinery in the polling place but to the tabulation component of the back-office EMS or other vital configuration tools, including the configuration of poll books (those stacks of papers, binders, or … apps that check a voter in to cast a ballot). As a result, attackers need only to find a highly contentious swing state precinct to be disruptive."

### Code causes change

Because voting security vulnerabilities are largely software-based, "code causes change," Miller declares. But, there are barriers to getting this done in time for the next US presidential election in November 2020. Foremost is the fact that there is little time left for OSET's team of 12 full-time people to finish the core voting platform and create separate EMS and voting system components, all based on a non-black box, non-proprietary model that uses public, open source technology with off-the-shelf hardware.

However, there is a lot more to do in addition to developing code for off-the-shelf hardware. OSET is developing new open data standards with NIST and the Elections Assistance Commission (EAC). A new component-based certification process must be invented, and new design guidelines must be issued.

Meanwhile, service contracts that last for decades or more are protecting legacy vendors and making migration to new systems a challenge. Miller explains, "there are three primary vendors that control 85% of voting systems in the US and 70% globally; with the barriers to entry that exist, it will take a finished system to display the opportunity for change."

Getting there with open code is a process too. Miller says, "there is a very closely managed code-commit process, and the work faces far more scrutiny than an open source operating system, web server, or [content management system]. So, we are implementing a dual-sandbox model where one allows for wide-ranging, free-wheeling development and contributions. The other is the controlled environment that must pass security muster with the federal government in order for states to feel confident that the actual code for production systems is verifiable, accurate, secure, and transparent. We'll use a process for [passing] code across a review membrane that enables work in the less secure environment to be committed to the production environment. It's a process still in design."

The licenses are a bit complex: for governments or vendors that have regulatory issues with procuring and deploying commercial systems comprised of open source software, commercial hardware, and professional services, OSET offers the OSET Public License (OPL), an OSI-approved open source license based on the Mozilla Public License. For other research, development, and non-commercial use, or commercial use where certain procurement regulations are not an issue, the code is available under the GPL 2.0 license.

Of OSET's activities, Miller says, "85% is code development—a democracy software foundry. Another 10% is cybersecurity advisory for election administrators, and the final 5% of OSET's activity is public policy work (we are informers, not influencers in legislation). As a 501(c)3, we can not—and do not—perform lobbying, but a portion of our mission is education. So, our work remains steadfastly nonpartisan and philanthropically funded by grant-making organizations and the public.

Explains Miller: "We have a fairly straightforward charter: to build a trustworthy codebase that can exist on an inherently untrustworthy hardware base. Certain types of election administration apps and services can live in the cloud, while the voting system—a marriage of that software layer and hardware, federally certified to be deployed—must be built up from a hardened Linux kernel. So, a portion of our R&amp;D lies in the arenas of trusted boot with hardware attestation and other important security architectures such as computer-assisted code randomization and so forth."

### Work with the code

There are two levels of access for people who want to work with the OSET Institute's Trust the Vote code. One is to contact the project to request access to certain code to advance development efforts; all legitimate requests will be honored, but the code is not yet accessible in the public domain. The other access point is to the extensive work that the OSET Institute has done for third-party voter registration systems, such as Rock The Vote. That source code is publicly available [online][8].

One component of this is [RockyOVR][9] for online voter registration services (it is operated by the OSET Institute and Rock The Vote with support from AWS). Another is [Grommet][10], an Android-native mobile app used by voter registration drives. [Siggy][11] and [VoteReady][12] are prototypes for new voter services under development that will be announced soon.

The OSET Institute is continually on the lookout for talented volunteers to advance the project. Top needs include system architecture and engineering and software development for both cloud-based and offline applications. These are not entry-level projects or positions, and in some cases, they require advanced skills in BIOS and firmware development; operating system internals; device drivers; and more.

All developers at the OSET Institute start as volunteers, and the best are moved into contract and staff positions, as project funding allows, in a meritocratic process. The Institute is based in Palo Alto, Calif., but operations are distributed and virtual with offices and centers of development excellence in Arlington, Va.; Boston; Mountain View, Calif.; Portland, Ore.; San Francisco; and the University of Edinburgh, Scotland.

The Open Election Data Initiative wants to give access to election data for a true picture of an...

The pernicious effects of closed proprietary software reaches its peak of damaging the general...

One of the ways Obama won the 2012 election was with technology. It wasn’t the only way, but...

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/voting-fraud-open-source-solution

作者：[Jeff Macharyas][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jeffmacharyashttps://opensource.com/users/mbrownhttps://opensource.com/users/luis-ibanezhttps://opensource.com/users/jhibbets
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/checklist_todo_clock_time_team.png?itok=1z528Q0y (Team checklist)
[2]: https://trustthevote.org/
[3]: https://www.osetfoundation.org/
[4]: https://bit.ly/EOSt1
[5]: https://twitter.com/STaylorRayburn/status/1166347828152680449
[6]: https://www.politifact.com/truth-o-meter/article/2019/aug/29/viral-video-voting-machine-malfunction-mississippi/
[7]: https://en.wikipedia.org/wiki/2000_United_States_presidential_election_in_Florida
[8]: https://github.com/TrustTheVote-Project
[9]: https://github.com/TrustTheVote-Project/Rocky-OVR
[10]: https://github.com/TrustTheVote-Project/Grommet
[11]: https://github.com/TrustTheVote-Project/Siggy
[12]: https://github.com/TrustTheVote-Project/VoteReady
