translating by dianbanjiu
6 places to host your git repository
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/house_home_colors_live_building.jpg?itok=HLpsIfIL)

Perhaps you're one of the few people who didn't notice, but a few months back, [Microsoft bought GitHub][1]. Nothing against either company. Microsoft has become a vocal supporter of open source in recent years, and GitHub has been the de facto code repository for a heaping large number of open source projects almost since its inception.

However, the recent(-ish) purchase may have gotten you a little itchy. After all, there's nothing quite like a corporate buy-out to make you realize you've had your open source code sitting on a commercial platform. Maybe you're not quite ready to jump ship just yet, but it would at least be helpful to know your options. Let's have a look around the web and see what's available.

### Option 1: GitHub

Seriously, this is a valid option. [GitHub][2] doesn't have a history of acting in bad faith, and Microsoft certainly has been smiling on open source of late. There's nothing wrong with keeping your project on GitHub and taking a wait-and-see perspective. It's still the largest community website for software development, and it still has some of the best tools for issue tracking, code review, continuous integration, and general code management. And its underpinnings are still on Git, everyone's favorite open source distributed version control system. Your code is still your code. There's nothing wrong with leaving things where they are if nothing is broken.

### Option 2: GitLab

[GitLab][3] is probably the leading contender when it comes to alternative code platforms. It's fully open source. You can host your code right on GitLab's site much like you would on GitHub, but you can also choose to self-host a GitLab instance of your own on your own server and have full control over who has access to everything there and how things are managed. GitLab pretty much has feature parity with GitHub, and some folks might even say its continuous integration and testing tools are superior. Although the community of developers on GitLab is certainly smaller than the one on GitHub, it's still nothing to sneeze at. And it's possible that you'll find more like-minded developers among the population there.

### Option 3: Bitbucket

[Bitbucket][4] has been around for many years. In some ways, it could serve as a looking glass into the future of GitHub. Bitbucket was acquired by a larger corporation (Atlassian) eight years ago and has already been through some of that change-over process. It's still a commercial platform like GitHub, but it's far from being a startup, and it's on pretty stable footing, organizationally speaking. Bitbucket shares most of the features available on GitHub and GitLab, plus a few novel features of its own, like native support for [Mercurial][5] repositories.

### Option 4: SourceForge

The granddaddy of open source code repository sites is [SourceForge][6]. It used to be that if you had an open source project, SourceForge was the place to host your code and share your releases. It took a little while to migrate to Git for version control, and it had its own rash of commercial acquiring and re-acquiring events, coupled with a few unfortunate bundling decisions for a few open source projects. That said, SourceForge seems to have recovered since then, and the site is still a place where quite a few open source projects live. A lot of folks still feel a bit burned, though, and some people aren't huge fans of its various attempts to monetize the platform, so be sure you go in with open eyes.

### Option 5: Roll your own

If you want full control of your project's destiny (and no one to blame but yourself), then doing it all yourself may be the best option for you. It is a good alternative for both large and small projects. Git is open source, so it's easily self-hosted. If you want issue tracking and code review, you can run an instance of GitLab or [Phabricator][7]. For continuous integration, you can set up your own instance of the [Jenkins][8] automation server. Yes, you'll need to take responsibility for your own infrastructure overhead and the associated security requirements. However, it's not that hard to get yourself set up. And if you want a sure-fire way to avoid being beholden to the whims of anyone else's platform, this is the way to do it.

### Option 6: All of the above

Here's the beauty of all of this: Despite the proprietary drapery strewn over some of these platforms, they're still built on top of solid open source technology. And not just open source, but explicitly designed to be distributed across multiple nodes on a large network (like the internet). You're not required to use just one. You can use a couple… or all of them. Roll your own setup as a guaranteed home base using GitLab and have clone repositories on GitHub and Bitbucket for issue tracking and continuous integration. Keep your main codebase on GitHub but have "backup" clones sitting on GitLab for your own piece of mind.

The key thing is you have options. And we have those options thanks to open source licensing on very useful and powerful projects. The future is bright.

Of course, I'm bound to have missed some of the open source options available out there. Feel free to pipe up with your favorites. Are you using multiple platforms? What's your setup? Let everyone know in the comments!

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/github-alternatives

作者：[Jason van Gumster][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mairin
[1]: https://www.theverge.com/2018/6/4/17422788/microsoft-github-acquisition-official-deal
[2]: https://github.com/
[3]: https://gitlab.com
[4]: https://bitbucket.org
[5]: https://www.mercurial-scm.org/wiki/Repository
[6]: https://sourceforge.net
[7]: https://phacility.com/phabricator/
[8]: https://jenkins.io
