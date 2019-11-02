[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Someone Forked GIMP into Glimpse Because Gimp is an Offensive Word)
[#]: via: (https://itsfoss.com/gimp-fork-glimpse/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

Someone Forked GIMP into Glimpse Because Gimp is an Offensive Word
======

In the world of open source applications, forking is common when members of the community want to take an application in a different direction than the rest. The latest newsworthy fork is named [Glimpse][1] and is intended to fix certain issues that users have with the [GNU Image Manipulation Program][2], commonly known as GIMP.

### Why create a fork of GIMP?

![][3]

When you visit the [homepage][1] of the Glimpse app, it says that the goal of the project is to “experiment with other design directions and fix longstanding bugs.” That doesn’t sound too much out of the ordinary. However, if you start reading the project’s blog posts, a different image appears.

According to the project’s [first blog post][4], they created this fork because they did not like the GIMP name. According to the post, “A number of us disagree that the name of the software is suitable for all users, and after 13 years of the project refusing to budge on this have decided to fork!”

If you are wondering why these people find the work GIMP disagreeable they answer that question on the [About page][5]:

> “If English is not your first language, then you may not have realised that the word “gimp” is problematic. In some countries it is considered a slur against disabled people and a playground insult directed at unpopular children. It can also be linked to certain “after dark” activities performed by consenting adults.”

They also point out that they are not making this move out of political correctness or being oversensitive. “In addition to the pain it can cause to marginalized communities many of us have our own free software advocacy stories about the GNU Image Manipulation Program not being taken seriously as an option by bosses or colleagues in professional settings.”

As if to answer many questions, they also said, “It is unfortunate that we have to fork the whole project to change the name, but we feel that discussions about the issue are at an impasse and that this is the most positive way forward.”

[][6]

Suggested read  After 6 Years, GIMP 2.10 is Here With Ravishing New Looks and Tons of New Features

It looks like the Glimpse name is not written in stone. There is [an issue][7] on their GitHub page about possibly picking another name. Maybe they should just drop GNU. I don’t think the word IMP has a bad connotation.

### A diverging path

![GIMP 2.10][8]

[GIMP][6] has been around for over twenty years, so any kind of fork is a big task. Currently, [they are planning][9] to start by releasing Glimpse 0.1 in September 2019. This will be a soft fork, meaning that changes will be mainly cosmetic as they migrate to a new identity.

Glimpse 1.0 will be a hard fork where they will be actively changing the codebase and adding to it. They want 1.0 to be a port to GTK3 and have its own documentation. They estimate that this will not take place until GIMP 3 is released in 2020.

Beyond the 1.0, the Glimpse team has plans to forge their own identity. They plan to work on a “front-end UI rewrite”. They are currently discussing [which language][10] they should use for the rewrite. There seems to be a lot of push for D and Rust. They also [hope to][4] “add new functionality that addresses common user complaints” as time goes on.

### Final Thoughts

I have used GIMP a little bit in the past but was never too bothered by the name. To be honest, I didn’t know what it meant for quite a while. Interestingly, when I searched Wikipedia for GIMP, I came across an entry for the [GIMP Project][11], which is a modern dance project in New York that includes disabled people. I guess gimp isn’t considered a derogatory term by everyone.

To me, it seems like a lot of work to go through to change a name. It also seems like the idea of rewriting the UI was tacked to make the project look more worthwhile. I wonder if they will tweak it to bring a more classic UI like [using Ctrl+S to save in GIMP][12]/Glimpse. Let’s wait and watch.

[][13]

Suggested read  Finally! WPS Office Has A New Release for Linux

If you are interested in the project, you can follow them on [Twitter][14], check out their [GitHub account][15], or take a look at their [Patreon page][16].

Are you offended by the GIMP name? Do you think it is worthwhile to fork an application, just so you can rename it? Let us know in the comments below.

If you found this article interesting, please take a minute to share it on social media, Hacker News or [Reddit][17].

--------------------------------------------------------------------------------

via: https://itsfoss.com/gimp-fork-glimpse/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://getglimpse.app/
[2]: https://www.gimp.org/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/08/gimp-fork-glimpse.png?resize=800%2C450&ssl=1
[4]: https://getglimpse.app/posts/so-it-begins/
[5]: https://getglimpse.app/about/
[6]: https://itsfoss.com/gimp-2-10-release/
[7]: https://github.com/glimpse-editor/Glimpse/issues/92
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2018/08/gimp-screenshot.jpg?resize=800%2C508&ssl=1
[9]: https://getglimpse.app/posts/six-week-checkpoint/
[10]: https://github.com/glimpse-editor/Glimpse/issues/70
[11]: https://en.wikipedia.org/wiki/The_Gimp_Project
[12]: https://itsfoss.com/how-to-solve-gimp-2-8-does-not-save-in-jpeg-or-png-format/
[13]: https://itsfoss.com/wps-office-2016-linux/
[14]: https://twitter.com/glimpse_editor
[15]: https://github.com/glimpse-editor/Glimpse
[16]: https://www.patreon.com/glimpse
[17]: https://reddit.com/r/linuxusersgroup
