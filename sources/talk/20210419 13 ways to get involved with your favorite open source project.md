[#]: subject: (13 ways to get involved with your favorite open source project)
[#]: via: (https://opensource.com/article/21/4/open-source-project-level)
[#]: author: (Mike Bursell https://opensource.com/users/mikecamel)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

13 ways to get involved with your favorite open source project
======
Apply GET/SET principles to connecting with open source projects.
![Looking at a map for career journey][1]

Many of my [blog][2]'s readers already know lots about open source, but I'm also aware that many know little, if anything, about it. I'm a big, big proponent of open source software (and beyond, such as open hardware), and there are lots of great resources you can find to learn more about it.

One very good starting point is the one you're now reading, Opensource.com. It's run by a bunch of brilliant people for the broader community by my current employer, Red Hat. (I should add a disclaimer that I'm not only employed by Red Hat but also a [Correspondent][3] at Opensource.com—a kind of frequent contributor/Elder Thing.) It has articles on pretty much every aspect of open source that you can imagine.

I was thinking about APIs today (they're [in the news][4] as I'm writing this, after a US Supreme Court judgment on an argument between Google and Oracle), and it occurred to me that if I were interested in understanding how to interact with open source at the project level but didn't know much about it, then a quick guide might be useful. The same goes if I were involved in an open source project (e.g., [Enarx][5]) interested in attracting contributors (particularly techie contributors) who aren't already knowledgeable about open source.

Given that most programmers will understand what GET and SET methods do (one reads data, the other writes data), I thought this might be a useful framework for considering engagement.[1][6] I'll start with GET, as that's how you're likely to be starting off—finding out more about the project—and then move to SET methods for getting involved with an open source project.

This is far from an exhaustive list, but I hope that I've hit most of the key ways you're most likely to start getting involved or encouraging others to get involved. The order I've chosen reflects what I suspect is a fairly typical approach to finding out more about a project, particularly for those who aren't open source savvy already but, as they say, YMMV.[3][7]

I've managed to stop myself from using Enarx (which I co-founded) as the sole source of examples and have tried to find a variety of projects to give you a taster. Disclaimer: their inclusion here does not mean that I am a user or contributor to the project, nor is it any guarantee of their open source credentials, code quality, up to date-ness, project maturity, or community health.[4][8]

### GET methods

  * **Landing page:** The first encounter you have with a project will probably be its landing page. Some projects go for something basic, others apply more design, but you should be able to use this as the starting point for your adventures around the project. You'd generally hope to find links to various of the other resources listed below from the landing page.
    * See [Sigstore][9]'s landing page.
  * **Wiki:** In many cases, the project will have a wiki. This could be simple, or it could be complex. It may allow editing by anyone or only by a select band of contributors to the project, and its relevance as a source of truth may be impacted by how up to date it is. Still, the wiki is usually an excellent place to start.
    * See the [Fedora Project][10] wiki.
  * **Videos:** Some projects maintain a set of videos about their project. These may include introductions to the concepts, talking-head interviews with team members, conference sessions, demos, how-tos, and more. It's also worth looking for videos put up by contributors to the project but not necessarily officially owned by the project.
    * See [Rust Language][11] videos.
  * **Code of conduct:** Many projects insist that their project members follow a code of conduct to reduce harassment, reduce friction, and generally make the project a friendly, more inclusive, and more diverse place to be.
    * See the [Linux kernel][12]'s CoC.
  * **Binary downloads:** As projects get more mature, they may choose to provide precompiled binary downloads for users. More technically inclined users may choose to compile their own binaries from the codebase (see below), but binary downloads can be a quick way to try out a project and see whether it does what you want.
    * See the binaries from [Chocolate Doom][13] (a Doom port).
  * **Design documentation:** Without design documentation, it can be very difficult to get really into a project. (I've written about the [importance of architecture diagrams][14] before.) This documentation is likely to include everything from an API definition to complex use cases and threat models.
    * See [Kubernetes][15]' design docs.
  * **Codebase:** You've found out all you need to get going: It's time to look at the code! This may vary from a few lines to many thousands, include documentation in comments, or include test cases, but if the code is not there, then the project can't legitimately call itself open source.
    * See [Rocket Rust web framework][16]'s code.[5][17]
  * **Email/chat:** Most projects like to have a way for contributors to discuss matters asynchronously. The preferred medium varies among projects, but most will choose an email list, a chat server, or both. These are where to get to know other users and contributors, ask questions, celebrate successful compiles, and just hang out.
    * See [Enarx chat][18].
  * **Meetups, videoconferences, calls, etc.:** Although in-person meetings are tricky for many at the moment (I'm writing as COVID-19 still reduces travel opportunities), having ways for community members and contributors to get together synchronously can be really helpful for everybody. Sometimes these are scheduled on a daily, weekly, or monthly basis; sometimes, they coincide with other, larger meetups, sometimes a project gets big enough to have its own meetups; sometimes, it's so big that there are meetups of subprojects or internal interest groups.
    * See the [Linux Security Summit Europe][19].



### PUT methods

  * **Bug reports:** The first time many of us contribute anything substantive back to an open source project is when we file a bug report. Bug reports from new users can be really helpful for projects, as they not only expose bugs that may not already be known to the project, but they also give clues as to how actual users of the project are trying to use the code. If the project already publishes binary downloads (see above), you don't even need to compile the code to try it and submit a bug report. But bug reports related to compilation and build can also be extremely useful to the project. Sometimes, the mechanism for bug reporting also provides a way to ask more general questions about the project or to ask for new features.
    * See the issues page for [exa][20] (a replacement for the _ls_ command).
  * **Tests:** Once you've started using the project, another way to get involved (particularly once you start contributing code) can be to design and submit tests for how the project _ought_ to work. This can be a great way to unearth both your assumptions (and lack of knowledge!) about the project and the project's design assumptions (some of which may well be flawed). Tests are often part of the code repository, but not always.
    * See [GNOME Shell][21]'s test repository.
  * **Wiki:** A wiki can be a great way to contribute to the project, whether you're coding or not. Many projects don't have as much information available as they should, and that information may not be aimed at people coming to the project "fresh." If this is what you've done, then you're in a great position to write material that will help other "newbs" get into the project faster, as you'll know what would have helped you if it had been there.
    * See the wiki for [Wine][22] (Windows Emulator for Linux).
  * **Code:** Last but not least, you can write code. You may take hours, months, or years to get to this stage—or you may never reach it—but open source software is nothing without its code. If you've paid enough attention to the other steps, gotten involved in the community, understood what the project aims to do, and have the technical expertise (which you may well develop as you go!), then writing code may be the way you want to contribute.
    * See [Enarx][23] (again).



* * *

  1. I did consider standard RESTful verbs—GET, PUT, POST, and DELETE—but that felt rather contrived.[2][24]
  2. And I don't like the idea of DELETE in this context!
  3. "Your Mileage May Vary," meaning, basically, that your experience may be different, and that's to be expected.
  4. That said, I do use lots of them!
  5. I included this one because I've spent _far_ too much of my time looking at this over the past few months…



* * *

_This article was originally published on [Alice, Eve, and Bob][25] and is reprinted with the author's permission._

Six non-code opportunities for contributing to open source software code and communities.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/open-source-project-level

作者：[Mike Bursell][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mikecamel
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/career_journey_road_gps_path_map_520.png?itok=PpL6jJgY (Looking at a map for career journey)
[2]: https://aliceevebob.com/
[3]: https://opensource.com/correspondent-program
[4]: https://www.eff.org/deeplinks/2021/04/victory-fair-use-supreme-court-reverses-federal-circuit-oracle-v-google
[5]: https://enarx.dev/
[6]: tmp.WF7h0s934j#1
[7]: tmp.WF7h0s934j#3
[8]: tmp.WF7h0s934j#4
[9]: https://sigstore.dev/
[10]: https://fedoraproject.org/wiki/Fedora_Project_Wiki
[11]: https://www.youtube.com/channel/UCaYhcUwRBNscFNUKTjgPFiA
[12]: https://www.kernel.org/doc/html/latest/process/code-of-conduct.html
[13]: https://www.chocolate-doom.org/wiki/index.php/Downloads
[14]: https://opensource.com/article/20/5/diagrams-documentation
[15]: https://kubernetes.io/docs/reference/
[16]: https://github.com/SergioBenitez/Rocket/tree/v0.4
[17]: tmp.WF7h0s934j#5
[18]: https://chat.enarx.dev/
[19]: https://events.linuxfoundation.org/linux-security-summit-europe/
[20]: https://github.com/ogham/exa/issues
[21]: https://gitlab.gnome.org/GNOME/gnome-shell/tree/master/tests/interactive
[22]: https://wiki.winehq.org/Main_Page
[23]: https://github.com/enarx
[24]: tmp.WF7h0s934j#2
[25]: https://aliceevebob.com/2021/04/06/get-set-methods-for-open-source-projects/
