[#]: subject: "Accessibility in Fedora Workstation"
[#]: via: "https://fedoramagazine.org/accessibility-in-fedora-workstation/"
[#]: author: "Christian Fredrik Schaller https://fedoramagazine.org/author/uraeus/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Accessibility in Fedora Workstation
======
![Accessibility in Fedora Workstation Featured Image][1]

Photo by [Elizabeth Woolner][2] on [Unsplash][3]

The first concerted effort to support accessibility under Linux was undertaken by Sun Microsystems when they decided to use GNOME for Solaris. Sun put together a team focused on building the pieces to make GNOME 2 fully accessible and worked with hardware makers to make sure things like Braille devices worked well. I even heard claims that GNOME and Linux had the best accessibility of any operating system for a while due to this effort. As Sun started struggling and got acquired by Oracle this accessibility effort eventually trailed off with the community trying to pick up the slack afterwards. Especially engineers from Igalia were quite active for a while trying to keep the accessibility support working well.

But over the years we definitely lost a bit of focus on this and we know that various parts of GNOME 3 for instance aren’t great in terms of accessibility. So at Red Hat we have had a lot of focus over the last few years trying to ensure we are mindful about diversity and inclusion when hiring, trying to ensure that we don’t accidentally pre-select against underrepresented groups based on for instance gender or ethnicity. But one area we realized we hadn’t given so much focus recently was around technologies that allowed people with various disabilities to make use of our software. Thus I am very happy to announce that Red Hat has just hired Lukas Tyrychtr, who is a blind software engineer, to lead our effort in making sure Red Hat Enterprise Linux and Fedora Workstation has excellent accessibility support!

Anyone who has ever worked for a large company knows that getting funding for new initiatives is often hard and can take a lot of time, but I want to highlight how I was extremely positively surprised at how quick and easy it was to get support for hiring Lukas to work on accessibility. When Jiri Eischmann and I sent the request to my manager, Stef Walter, he agreed to champion the same day, and when we then sent it up to Mike McGrath who is the Vice President of Linux Engineering he immediately responded that he would bring this to Tim Cramer who is our Senior Vice President of Software Engineering. Within a few days we had the go ahead to hire Lukas. The fact that everyone just instantly agreed that accessibility is important and something we as a company should do made me incredibly proud to be a Red Hatter.

What we hope to get from this is not only a better experience for our users, but also to allow even more talented engineers like Lukas to work on Linux and open source software at Red Hat. I thought it would be a good idea here to do a quick interview with Lukas Tyrychtr about the state of accessibility under Linux and what his focus will be.

Christian: Hi Lukas, first of all welcome as a full time engineer to the team! Can you tell us a little about yourself?

Lukas: Hi, Christian. For sure. I am a completely blind person who can see some light, but that’s basically it. I started to be interested in computers around 2009 or so, around my 15th or 16th birthday. First, because of circumstances, I started tinkering with Windows, but Linux came shortly after, mainly because of some pretty good friends. Then, after four years the university came and the Linux knowledge paid off, because going through all the theoretical and practical Linux courses there was pretty straightforward (yes, there was no GUI involved, so it was pretty okay, including some custom kernel configuration tinkering). During that time, I was contacted by Red Hat associates whether I’d be willing to help with some accessibility related presentation at our faculty, and that’s how the collaboration began. And, yes, the hire is its current end, but that’s actually, I hope, only the beginning of a long and productive journey.

Christian: So as a blind person you have first hand experience with the state of accessibility support under Linux. What can you tell us about what works and what doesn’t work?

Lukas: Generally, things are in pretty good shape. Braille support on text-only consoles basically just always works (except for some SELinux related issues which cropped up). Having speech there is somewhat more challenging, the needed kernel module ([Speakup][4] for the curious among the readers) is not included by all distributions, unfortunately it is not included by Fedora, for example, but Arch Linux has it. When we look at the desktop state of affairs, there is basically only a single screen reader (an application which reads the screen content), called [Orca][5], which might not be the best position in terms of competition, but on the other hand, stealing Orca developers would not be good either. Generally, the desktop is usable, at least with GTK, Qt and major web browsers and all recent Electron based applications. Yes, accessibility support receives much less testing than I would like, so for example, a segmentation fault with a running screen reader can still unfortunately slip through a GTK release. But, generally, the foundation works well enough. Having more and naturally sounding voices for speech synthesis might help attract more blind users, but convincing all the players is no easy work. And then there’s the issue of developer awareness. Yes, everything is in some guidelines like the GNOME ones, however I saw much more often than I’d like to for example a button without any accessibility labels, so I’d like to help all the developers to fix their apps so accessibility regressions don’t get to the users, but this will have to improve slowly, I guess.

Christian: So you mention Orca, are there other applications being widely used providing accessibility?

Lukas: Honestly, only a few. There’s Speakup – a kernel module which can read text consoles using speech synthesis, e.g. a screen reader for these, however without something like Espeakup (an Espeak to Speakup bridge) the thing is basically useless, as it by default supports hardware synthesizers, however this piece of hardware is basically a think of the past, e.g. I have never seen one myself. Then, there’s [BRLTTY][6]. This piece of software provides braille output for screen consoles and an API for applications which want to output braille, so the drivers can be implemented only once. And that’s basically it, except for some efforts to create an Orca alternative in Rust, but that’s a really long way off. Of course, utilities for other accessibility needs exist as well, but I don’t know much about these.

Christian: What is your current focus for things you want to work on both yourself and with the larger team to address?

Lukas: For now, my focus is to go through the applications which were ported to GTK 4 as a part of the GNOME development cycle and ensure that they work well. It includes adding a lot of missing labels, but in some cases, it will involve bigger changes, for example, GNOME Calendar seems to need much more work. During all that, educating developers should not be forgotten either. With these things out of the way, making sure that no regressions slip to the applications should be addressed by extending the quality assurance and automated continuous integration checks, but that’s a more distant goal.

Christian: Thank you so much for talking with us Lukas, if there are other people interested in helping out with accessibility in Fedora Workstation what is the best place to reach you?

Actually for now the easiest way to reach me is by email at [ltyrycht@redhat.com][7]. Be happy to talk to anyone wanting to help with making Workstation great for accessibility.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/accessibility-in-fedora-workstation/

作者：[Christian Fredrik Schaller][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/uraeus/
[b]: https://github.com/lkxed
[1]: https://fedoramagazine.org/wp-content/uploads/2022/06/Accessibility-in-Fedora-Workstation-816x345.jpg
[2]: https://unsplash.com/@elizabeth_woolner?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/accessibility?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: http://www.linux-speakup.org/speakup.html
[5]: https://wiki.gnome.org/action/show/Projects/Orca?action=show&redirect=Orca
[6]: https://brltty.app/
[7]: https://fedoramagazine.org/mailto:ltyrycht@redhat.com
