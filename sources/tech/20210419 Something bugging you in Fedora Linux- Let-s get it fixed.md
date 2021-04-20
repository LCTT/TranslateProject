[#]: subject: (Something bugging you in Fedora Linux? Let’s get it fixed!)
[#]: via: (https://fedoramagazine.org/something-bugging-you-in-fedora-linux-lets-get-it-fixed/)
[#]: author: (Matthew Miller https://fedoramagazine.org/author/mattdm/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Something bugging you in Fedora Linux? Let’s get it fixed!
======

![][1]

Software has bugs. Any complicated system is guaranteed to have at least some bits that don’t work as planned. Fedora Linux is a _very_ complicated system. It contains thousands of packages created by countless independent upstream projects around the world. There are also hundreds of updates every week. So, it’s inevitable that problems creep in. This article addresses the bug fixing process and how some bugs may be prioritized.

### The release development process

As a Linux distribution project, we want to deliver a polished, “everything just works” experience to our users. Our release process starts with “Rawhide”. This is our development area where we integrate new versions of all that updated free and open source software. We’re constantly improving our ongoing testing and continuous integration processes to make even Rawhide safe to use for the adventurous. By its nature, however, Rawhide will always be a little bit rough.

Twice a year we take that rough operating system and branch it for a beta release, and then a final release. As we do that, we make a concerted effort to find problems. We run Test Days to check on specific areas and features. “Candidate builds” are made which are checked against our [release validation test plan][2]. We then enter a “freeze” state where only approved changes go into the candidates. This isolates the candidate from the constant development (which still goes into Rawhide!) so new problems are not introduced.

Many bugs, big and small, are squashed as part of the release process. When all goes according to plan, we have a shiny new on-schedule Fedora Linux release for all of our users. (We’ve done this reliably and repeatedly for the last few years — thanks, everyone who works so hard to make it so!) If something is really wrong, we can mark it as a “release blocker”. That means we won’t ship until it’s fixed. This is often appropriate for big issues, and definitely turns up the heat and attention that bug gets.

Sometimes, we have issues that are persistent. Perhaps something that’s been going on for a release or two, or where we don’t have an agreed solution. Some issues are really annoying and frustrating to many users, but individually don’t rise to the level we’d normally block a release for. We _can_ mark these things as blockers. But that is a really big sledgehammer. A blocker may cause the bug to get finally smashed, but it can also cause disruption all around. If the schedule slips, all the _other_ bug fixes and improvements, as well as features people have been working on, don’t get to users.

### The Prioritized Bugs process

So, we have another way to address annoying bugs! The [Prioritized Bugs process][3] is a different way to highlight issues that result in unpleasantness for a large number of users. There’s no hammer here, but something more like a spotlight. Unlike the release blocker process, the Prioritized Bugs process does not have a strictly-defined set of criteria. Each bug is evaluated based on the breadth and severity of impact.

A team of interested contributors helps curate a short list of issues that need attention. We then work to connect those issues to people who can fix them. This helps take pressure off of the release process, by not tying the issues to any specific deadlines. Ideally, we find and fix things before we even get to the beta stage. We try to keep the list short, no more than a handful, so there truly is a focus. This helps the teams and individuals addressing problems because they know we’re respectful of their often-stretched-thin time and energy.

Through this process, Fedora has resolved dozens of serious and annoying problems. This includes everything from keyboard input glitches to SELinux errors to that thing where gigabytes of old, obsolete package updates would gradually fill up your disk. But we can do a lot more — we actually aren’t getting as many nominations as we can handle. So, if there’s something _you_ know that’s causing long-term frustration or affecting a lot of people and yet which seems to not be reaching a resolution, follow the [Prioritized Bugs process][3] and let _us_ know.

#### **You can help**

All Fedora contributors are invited to participate in the Prioritized Bugs process. Evaluation meetings occur every two weeks on IRC. Anyone is welcome to join and help us evaluate the nominated bugs. See the [calendar][4] for meeting time and location. The Fedora Program Manager sends an agenda to the [triage][5] and [devel][6] mailing lists the day before meetings.

### Bug reports welcome

Big or small, when you find a bug, we really appreciate it if you report it. In many cases, the best place to do that is with the project that creates the software. For example, lets say there is a problem with the way the Darktable photography software renders images from your digital camera. It’s best to take that to the Darktable developers. For another example, say there’s a problem with the GNOME or KDE desktop environments or with the software that is part of them. Taking these issues to those projects will usually get you the best results.

However, if it’s a Fedora-specific problem, like something with our build or configuration of the software, or a problem with how it’s integrated, don’t hesitate to [file a bug with us][7]. This is also true when there is a problem which you know has a fix that we just haven’t included yet.

I know this is kind of complex… it’d be nice to have a one-stop place to handle all of the bugs. But remember that Fedora packagers — the people who do the work of taking upstream software and configuring it to build in our system — are largely volunteers. They are not always the deepest experts in the code for the software they’re working with. When in doubt, you can always file a [Fedora bug][7]. The folks in Fedora responsible for the corresponding package can help with their connections to the upstream software project.

Remember, when you find a bug that’s gone through diagnosis and doesn’t yet have a good fix, when you see something that affects a lot of people, or when there’s a long-standing problem that just isn’t getting attention, please nominate it as a Prioritized Bug. We’ll take a look and see what can be done!

_PS: The famous image in the header is, of course, from the logbook of the Mark II computer at Harvard where Rear Admiral Grace Murray Hopper worked. But contrary to popular belief about the story, this isn’t the first use of the term “bug” for a systems problem — it was already common in engineering, which is why it was funny to find a literal bug as the cause of an issue. #nowyouknow #jokeexplainer_

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/something-bugging-you-in-fedora-linux-lets-get-it-fixed/

作者：[Matthew Miller][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/mattdm/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/04/bugging_you-816x345.jpg
[2]: https://fedoraproject.org/wiki/QA:Release_validation_test_plan
[3]: https://docs.fedoraproject.org/en-US/program_management/prioritized_bugs/
[4]: https://calendar.fedoraproject.org/base/
[5]: https://lists.fedoraproject.org/archives/list/triage%40lists.fedoraproject.org/
[6]: https://lists.fedoraproject.org/archives/list/devel%40lists.fedoraproject.org/
[7]: https://docs.fedoraproject.org/en-US/quick-docs/howto-file-a-bug/
