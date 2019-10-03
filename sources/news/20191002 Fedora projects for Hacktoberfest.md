[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Fedora projects for Hacktoberfest)
[#]: via: (https://fedoramagazine.org/fedora-projects-for-hacktoberfest/)
[#]: author: (Ben Cotton https://fedoramagazine.org/author/bcotton/)

Fedora projects for Hacktoberfest
======

![][1]

It’s October! That means its time for the annual [Hacktoberfest][2] presented by DigitalOcean and DEV. Hacktoberfest is a month-long event that encourages contributions to open source software projects. Participants who [register][3] and submit at least four pull requests to GitHub-hosted repositories during the month of October will receive a free t-shirt.

In a recent Fedora Magazine article, I listed some areas where would-be contributors could [get started contributing to Fedora][4]. In this article, I highlight some specific projects that provide an opportunity to help Fedora while you participate in Hacktoberfest.

### Fedora infrastructure

  * [Bodhi][5] — When a package maintainer builds a new version of a software package to fix bugs or add new features, it doesn’t go out to users right away. First it spends time in the updates-testing repository where in can receive some real-world usage. Bodhi manages the flow of updates from the testing repository into the updates repository and provides a web interface for testers to provide feedback.
  * [the-new-hotness][6] — This project listens to [release-monitoring.org][7] (which is also on [GitHub][8]) and opens a Bugzilla issue when a new upstream release is published. This allows package maintainers to be quickly informed of new upstream releases.
  * [koschei][9] — koschei enables continuous integration for Fedora packages. It is software for running a service for scratch-rebuilding RPM packages in Koji instance when their build-dependencies change or after some time elapses.
  * [MirrorManager2][10] — Distributing Fedora packages to a global user base requires a lot of bandwidth. Just like developing Fedora, distributing Fedora is a collaborative effort. MirrorManager2 tracks the hundreds of public and private mirrors and routes each user to the “best” one.
  * [fedora-messaging][11] — Actions within the Fedora community—from source code commits to participating in IRC meetings to…lots of things—generate messages that can be used to perform automated tasks or send notifications. fedora-messaging is the tool set that makes sending and receiving these messages possible.
  * [fedocal][12] — When is that meeting? Which IRC channel was it in again? Fedocal is the calendar system used by teams in the Fedora community to coordinate meetings. Not only is it a good Hacktoberfest project, it’s also [looking for a new maintainer][13] to adopt it.



In addition to the projects above, the Fedora Infrastructure team has highlighted [good Hacktoberfest issues][14] across all of their GitHub projects.

### Community projects

  * [bodhi-rs][15] — This project provides Rust bindings for Bodhi.
  * [koji-rs][16] — Koji is the system used to build Fedora packages. Koji-rs provides bindings for Rust applications.
  * [fedora-rs][17] — This project provides a Rust library for interacting with Fedora services like other languages like Python have.
  * [feedback-pipeline][18] — One of the current Fedora Council objectives is [minimization][19]: work to reduce the installation and patching footprint of Fedora releases. feedback-pipeline is a tool developed by this team to generate reports of RPM sizes and dependencies.



### And many more

The projects above are only a small sample focused on software used to build Fedora. Many Fedora packages have upstreams hosted on GitHub—too many to list here. The best place to start is with a project that’s important to you. Any contributions you make help improve the entire open source ecosystem. If you’re looking for something in particular, the [Join Special Interest Group][20] can help. Happy hacking!

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/fedora-projects-for-hacktoberfest/

作者：[Ben Cotton][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/bcotton/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/09/hacktoberfest-816x345.jpg
[2]: https://hacktoberfest.digitalocean.com/
[3]: https://hacktoberfest.digitalocean.com/register
[4]: https://fedoramagazine.org/how-to-contribute-to-fedora/
[5]: https://github.com/fedora-infra/bodhi
[6]: https://github.com/fedora-infra/the-new-hotness
[7]: https://release-monitoring.org/
[8]: https://github.com/release-monitoring/anitya
[9]: https://github.com/fedora-infra/koschei
[10]: https://github.com/fedora-infra/mirrormanager2
[11]: https://github.com/fedora-infra/fedora-messaging
[12]: https://github.com/fedora-infra/fedocal
[13]: https://lists.fedoraproject.org/archives/list/devel@lists.fedoraproject.org/message/GH4N3HYJ4ARFRP666O6EQCHDIQMXVUJB/
[14]: https://github.com/orgs/fedora-infra/projects/4
[15]: https://github.com/ironthree/bodhi-rs
[16]: https://github.com/ironthree/koji-rs
[17]: https://github.com/ironthree/fedora-rs
[18]: https://github.com/minimization/feedback-pipeline
[19]: https://docs.fedoraproject.org/en-US/minimization/
[20]: https://fedoraproject.org/wiki/SIGs/Join
