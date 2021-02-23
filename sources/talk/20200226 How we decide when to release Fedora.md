[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How we decide when to release Fedora)
[#]: via: (https://fedoramagazine.org/how-we-decide-when-to-release-fedora/)
[#]: author: (Ben Cotton https://fedoramagazine.org/author/bcotton/)

How we decide when to release Fedora
======

![][1]

Open source projects can use a variety of different models for deciding when to put out a release. Some projects release on a set schedule. Others decide on what the next release should contain and release whenever that is ready. Some just wake up one day and decide it’s time to release. And other projects go for a rolling release model, avoiding the question entirely.

For Fedora, we go with a [schedule-based approach][2]. Releasing twice a year means we can give our contributors time to implement large changes while still keeping on the leading edge. Targeting releases for the end of April and the end of October gives everyone predictability: contributors, users, upstreams, and downstreams.

But it’s not enough to release whatever’s ready on the scheduled date. We want to make sure that we’re releasing _quality_ software. Over the years, the Fedora community has developed a set of processes to help ensure we can meet both our time and and quality targets.

### Changes process

Meeting our goals starts months before the release. Contributors propose changes through our [Changes process][3], which ensures that the community has a chance to provide input and be aware of impacts. For changes with a broad impact (called “system-wide changes”), we require a contingency plan that describes how to back out the change if it’s broken or won’t be ready in time. In addition, the change process includes providing steps for testing. This helps make sure we can properly verify the results of a change.

Change proposals are due 2-3 months before the beta release date. This gives the community time to evaluate the impact of the change and make adjustments necessary. For example, a new compiler release might require other package maintainers to fix bugs exposed by the new compiler or to make changes that take advantage of new capabilities.

A few weeks before the beta and final releases, we enter a [code freeze][4]. This ensures a stable target for testing. Bugs identified as blockers and non-blocking bugs that are granted a freeze exception are updated in the repo, but everything else must wait. The freeze lasts until the release.

### Blocker and freeze exception process

In a project as large as Fedora, it’s impossible to test every possible combination of packages and configurations. So we have a set of test cases that we run to make sure the key features are covered.

As much as we’d like to ship with zero bugs, if we waited until we reached that state, there’d never be another Fedora release again. Instead, we’ve defined release criteria that define what bugs can [block the release][5]. We have [basic release criteria][6] that apply to all release milestones, and then separate, cumulative criteria for [beta][7] and [final][8] releases. With beta releases, we’re generally a little more forgiving of rough edges. For a final release, it needs to pass all of beta’s criteria, plus some more that help make it a better user experience.

The week before a scheduled release, we hold a “[go/no go meeting][9]“. During this meeting, the QA team, release engineering team, and the Fedora Engineering Steering Committee (FESCo) decide whether or not we will ship the release. As part of the decision process, we conduct a final review of blocker bugs. If any accepted blockers remain, we push the release back to a later date.

Some bugs aren’t severe enough to block the release, but we still would like to get them fixed before the release. This is particularly true of bugs that affect the live image experience. In that case, we grant an [exception for updates that fix those bugs][10].

### How you can help

In all my years as a Fedora contributor, I’ve never heard the QA team say “we don’t need any more help.” Contributing to the pre-release testing processes can be a great way to make your first Fedora contribution.

The Blocker Review meetings happen most Mondays in #fedora-blocker-review on IRC. All members of the Fedora community are welcome to participate in the discussion and voting. One particularly useful contribution is to look at the [proposed blockers][11] and see if you can reproduce them. Knowing if a bug is widespread or not is important to the blocker decision.

In addition, the QA team conducts test days and test weeks focused on various parts of the distribution: the kernel, GNOME, etc. Test days are announced on [Fedora Magazine][12].

There are plenty of other ways to contribute to the QA process. The Fedora wiki has a [list of tasks and how to contact the QA team][13]. The Fedora 32 Beta release is a few weeks away, so now’s a great time to get started!

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/how-we-decide-when-to-release-fedora/

作者：[Ben Cotton][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/bcotton/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/02/releasing-fedora-1-816x345.png
[2]: https://fedoraproject.org/wiki/Fedora_Release_Life_Cycle#Development_Schedule
[3]: https://docs.fedoraproject.org/en-US/program_management/changes_policy/
[4]: https://fedoraproject.org/wiki/Milestone_freezes
[5]: https://fedoraproject.org/wiki/QA:SOP_blocker_bug_process
[6]: https://fedoraproject.org/wiki/Basic_Release_Criteria
[7]: https://fedoraproject.org/wiki/Fedora_32_Beta_Release_Criteria
[8]: https://fedoraproject.org/wiki/Fedora_32_Final_Release_Criteria
[9]: https://fedoraproject.org/wiki/Go_No_Go_Meeting
[10]: https://fedoraproject.org/wiki/QA:SOP_freeze_exception_bug_process
[11]: https://qa.fedoraproject.org/blockerbugs/
[12]: https://fedoramagazine.org/tag/test-day/
[13]: https://fedoraproject.org/wiki/QA/Join
