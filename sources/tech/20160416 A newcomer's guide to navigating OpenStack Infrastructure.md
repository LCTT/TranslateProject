A newcomer's guide to navigating OpenStack Infrastructure
===========================================================

New contributors to OpenStack are welcome, but having a road map for navigating within this maturing, fast-paced open source community doesn't hurt. At OpenStack Summit in Austin, [Paul Belanger][1] (Red Hat, Inc.), [Elizabeth K. Joseph][2] (HPE), and [Christopher Aedo][3] (IBM) will lead a session on [OpenStack Infrastructure for Beginners][4]. In this interview, they offer tips and resources to help onboard new OpenStack contributors.

![](https://opensource.com/sites/default/files/images/life/Interview%20banner%20Q%26A.png)

**Your talk description says you'll be "diving into the heart of infrastructure and explain everything you need to know about the systems that keep OpenStack working." That's a tall order for a 40-minute time slot. What are the top things beginners should know about OpenStack infrastructure?**

**Elizabeth K. Joseph (EKJ)**: We don't use GitHub for OpenStack patches. This is something that trips up a lot of new contributors because we do maintain mirrors of all our repositories on GitHub for historical reasons. Instead we use a fully open source code review and continuous integration (CI) system maintained by the OpenStack Infrastructure team. Relatedly, since we run a CI system, every change proposed to OpenStack is tested before merging.

**Paul Belanger (PB)**: A lot of passionate people in the project, so don't get discouraged if your patch gets a -1.

**Christopher Aedo (CA)**: The community wants to help you succeed, don't be afraid to ask questions or ask for pointers to more information to improve your understanding.

### Which online resources would you recommend for beginners to fill in the holes for what you can't cover in your talk?

**PB**: Definitely our [OpenStack Project Infrastructure documentation][5]. At lot of effort has been taken to keep it up to date as much as possible. Every system used in running OpenStack as a project has a dedicated page, even the OpenStack cloud the Infrastructure teams is bringing online.

**EKJ**: I'll echo what Paul said about the Infrastructure documentation, and add that we love seeing patches from folks who are learning. We often don't realize what we're missing in terms of documentation until someone asks. So read, learn, and then help us fill in the gaps. You can ask questions on the [openstack-infra mailing list][6] or in our IRC channel at #openstack-infra on Freenode.

**CA**: I love [this detailed post][7] about building images, by Ian Wienand.

### Which "gotchas" should new OpenStack contributors look out for?

**EKJ**: Contributing is not just about submitting new code and new features; the OpenStack community places a very high value on doing code reviews. If you want people to look at a patch you submitted, consider reviewing some of the work of others and providing clear and constructive feedback. The more your fellow contributors know about your work and see you doing reviews, the more likely you'll get your code reviewed in a timely manner.

**CA**: I see a lot of newcomers getting tripped up with [Gerrit][8]. Read through the [developer workflow][9] in the Developers Guide, and then maybe read through it one more time. If you're not used to Gerrit, it can seem confusing and overwhelming at first, but walking through a few code reviews usually makes it all come together. Also, I'm a big fan of IRC. It can be a great place to get help, but it's best if you can maintain a persistent presence so people can answer your questions even if you're not "there" at that particular moment. (Read [IRC, the secret to success in open source][10].) You don't need to be "always on," but the ability to easily scroll back in a channel and catch up on a conversation can be invaluable.

**PB**: I agree with both Elizabeth and Chris—Gerrit is what to look out for. It is going to be the hub of your development effort. Not only will you be submitting code for people to review, but you'll also be reviewing other contributors' code. Watch out for the Gerrit UI; it can be confusing at times. I'd recommend trying out [Gertty][11], which is a console-based interface to the Gerrit Code Review system, which happens to be a project driven by OpenStack Infrastructure.

### What resources do you recommend for beginners to help them network with other OpenStack contributors?

**PB**: For me, it was using IRC and joining the #openstack-infra channel on Freenode ([IRC logs][12]). There is a lot of fantastic information and people in that channel. You get to see the day-to-day operations of the OpenStack project, and once you know how the project works, you'll have a better understanding on how to contribute to its future.

**CA**: I want to second that note for IRC; staying on IRC throughout the day made a huge difference for me in terms of feeling informed and connected. It's also such a great way to get help when you're stuck with someone on one of the projects—the ones with active IRC channels always have someone around willing to get your issues sorted out.

**EKJ**: The [openstack-dev mailing list][13] is quite important for staying up to date with news about projects you're working on inside of OpenStack, so I recommend subscribing to that. The mailing list uses subject tags to separate projects, so you can instruct your email client to use those and focus on threads that impact projects you care about. Beyond online resources, many OpenStack groups have popped up all over the world that serve the needs of both users and contributors to OpenStack, and many of them routinely have talks and events with key OpenStack contributors. You can search on Meetup.com in your area, or search on [groups.openstack.org][14] to see if there is an OpenStack group in your area. Finally, there are the [OpenStack Summits][15], which happen every six months, and where we'll be giving our Infrastructure talk. In their current format, the summits consist of both a user conference and a developer conference in one space to talk about everything related to OpenStack, past, present, and future.

### In which areas does OpenStack need to improve to become more beginner-friendly?

**PB**: I think our [account-setup][16] process could be made easier for new contributors, especially how many steps are needed to submit your first patch. There is a large cost to enroll into OpenStack development model, which maybe be too much for contributors; however, once enrolled, the model works fantastic for developers.

**CA**: We have a very pro-developer community, but the focus is on developing OpenStack itself, with less consideration given to the users of OpenStack clouds. We need to bring in application developers and encourage more people to develop things that run beautifully on OpenStack clouds, and encourage them to share those apps in the [Community App Catalog][17]. We can do this by continuing to improve our API standards and by ensuring different libraries (like libcloud, phpopencloud, and others) continue to work reliably for developers. Oh, also by sponsoring more OpenStack hackathons! All these things can ease entry for newcomers, which will lead to them sticking around.

**EKJ**: I've worked on open source software for many years, but for a large number of OpenStack developers, this is the first open source project they've every worked on. I've found that their proprietary software background doesn't prepare them for the open source ideals, methodologies, and collaboration techniques used in an open source project. I'd love to see us do a better job of welcoming people who have this proprietary software background and working with them so they can truly understand the value of what they're working on in the open source software community.

### I think 2016 is shaping up to be the Year of the Open Source Haiku. Explain OpenStack to beginners via Haiku.

**PB**: OpenStack runs clouds If you enjoy free software Submit your first patch

**CA**: In the near future OpenStack will rule the world Help make it happen!

**EKJ**: OpenStack is free Deploy on your own servers And run your own cloud!

*Paul, Elizabeth*, and Christopher will be [speaking at OpenStack Summit][18] in Austin on Monday, April 25, starting at 11:15am.


------------------------------------------------------------------------------

via: https://opensource.com/business/16/4/interview-openstack-infrastructure-beginners

作者：[linux.com][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://rikkiendsley.com/
[1]: https://twitter.com/pabelanger
[2]: https://twitter.com/pleia2
[3]: https://twitter.com/docaedo
[4]: https://www.openstack.org/summit/austin-2016/summit-schedule/events/7337
[5]: http://docs.openstack.org/infra/system-config/
[6]: http://lists.openstack.org/cgi-bin/mailman/listinfo/openstack-infra
[7]: https://www.technovelty.org/openstack/image-building-in-openstack-ci.html
[8]: https://code.google.com/p/gerrit/
[9]: http://docs.openstack.org/infra/manual/developers.html#development-workflow
[10]: https://developer.ibm.com/opentech/2015/12/20/irc-the-secret-to-success-in-open-source/
[11]: https://pypi.python.org/pypi/gertty
[12]: http://eavesdrop.openstack.org/irclogs/%23openstack-infra/
[13]: http://lists.openstack.org/cgi-bin/mailman/listinfo/openstack-dev
[14]: https://groups.openstack.org/
[15]: https://www.openstack.org/summit/
[16]: http://docs.openstack.org/infra/manual/developers.html#account-setup
[17]: https://apps.openstack.org/
[18]: https://www.openstack.org/summit/austin-2016/summit-schedule/events/7337
