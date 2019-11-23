[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How GNOME uses Git)
[#]: via: (https://opensource.com/article/19/10/how-gnome-uses-git)
[#]: author: (Molly de Blanc https://opensource.com/users/mollydb)

How GNOME uses Git
======
The GNOME project's decision to centralize on GitLab is creating
benefits across the community—even beyond the developers.
![red panda][1]

“What’s your GitLab?” is one of the first questions I was asked on my first day working for the [GNOME Foundation][2]—the nonprofit that supports GNOME projects, including the [desktop environment][3], [GTK][4], and [GStreamer][5]. The person was referring to my username on [GNOME’s GitLab instance][6]. In my time with GNOME, I’ve been asked for my GitLab a lot.

We use GitLab for basically everything. In a typical day, I get several issues and reference bug reports, and I occasionally need to modify a file. I don’t do this in the capacity of being a developer or a sysadmin. I’m involved with the Engagement and Inclusion &amp; Diversity (I&amp;D) teams. I write newsletters for Friends of GNOME and interview contributors to the project. I work on sponsorships for GNOME events. I don’t write code, and I use GitLab every day.

The GNOME project has been managed a lot of ways over the past two decades. Different parts of the project used different systems to track changes to code, collaborate, and share information both as a project and as a social space. However, the project made the decision that it needed to become more integrated and it took about a year from conception to completion.

There were a number of reasons GNOME wanted to switch to a single tool for use across the community. External projects touch GNOME, and providing them an easier way to interact with resources was important for the project, both to support the community and to grow the ecosystem. We also wanted to better track metrics for GNOME—the number of contributors, the type and number of contributions, and the developmental progress of different parts of the project.

When it came time to pick a collaboration tool, we considered what we needed. One of the most important requirements was that it must be hosted by the GNOME community; being hosted by a third party didn’t feel like an option, so that discounted services like GitHub and Atlassian. And, of course, it had to be free software. It quickly became obvious that the only real contender was GitLab. We wanted to make sure contribution would be easy. GitLab has features like single sign-on, which allows people to use GitHub, Google, GitLab.com, and GNOME accounts.

We agreed that GitLab was the way to go, and we began to migrate from many tools to a single tool. GNOME board member [Carlos Soriano][7] led the charge. With lots of support from GitLab and the GNOME community, we completed the process in May 2018.

There was a lot of hope that moving to GitLab would help grow the community and make contributing easier. Because GNOME previously used so many different tools, including Bugzilla and CGit, it’s hard to quantitatively measure how the switch has impacted the number of contributions. We can more clearly track some statistics though, such as the nearly 10,000 issues closed and 7,085 merge requests merged between June and November 2018. People feel that the community has grown and become more welcoming and that contribution is, in fact, easier.

People come to free software from all sorts of different starting points, and it’s important to try to even out the playing field by providing better resources and extra support for people who need them. Git, as a tool, is widely used, and more people are coming to participate in free software with those skills ready to go. Self-hosting GitLab provides the perfect opportunity to combine the familiarity of Git with the feature-rich, user-friendly environment provided by GitLab.

It’s been a little over a year, and the change is really noticeable. Continuous integration (CI) has been a huge benefit for development, and it has been completely integrated into nearly every part of GNOME. Teams that aren’t doing code development have also switched to using the GitLab ecosystem for their work. Whether it’s using issue tracking to manage assigned tasks or version control to share and manage assets, even teams like Engagement and I&amp;D have taken up using GitLab.

It can be hard for a community, even one developing free software, to adapt to a new technology or tool. It is especially hard in a case like GNOME, a project that [recently turned 22][8]. After more than two decades of building a project like GNOME, with so many parts used by so many people and organizations, the migration was an endeavor that was only possible thanks to the hard work of the GNOME community and generous assistance from GitLab.

I find a lot of convenience in working for a project that uses Git for version control. It’s a system that feels comfortable and is familiar—it’s a tool that is consistent across workplaces and hobby projects. As a new member of the GNOME community, it was great to be able to jump in and just use GitLab. As a community builder, it’s inspiring to see the results: more associated projects coming on board and entering the ecosystem; new contributors and community members making their first contributions to the project; and increased ability to measure the work we’re doing to know it’s effective and successful.

It’s great that so many teams doing completely different things (such as what they’re working on and what skills they’re using) agree to centralize on any tool—especially one that is considered a standard across open source. As a contributor to GNOME, I really appreciate that we’re using GitLab.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/how-gnome-uses-git

作者：[Molly de Blanc][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mollydb
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/redpanda_firefox_pet_animal.jpg?itok=aSpKsyna (red panda)
[2]: https://www.gnome.org/foundation/
[3]: https://gnome.org/
[4]: https://www.gtk.org/
[5]: https://gstreamer.freedesktop.org/
[6]: https://gitlab.gnome.org/
[7]: https://twitter.com/csoriano1618?lang=en
[8]: https://opensource.com/article/19/8/poll-favorite-gnome-version
