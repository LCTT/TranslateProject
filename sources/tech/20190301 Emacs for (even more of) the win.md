[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Emacs for (even more of) the win)
[#]: via: (https://so.nwalsh.com/2019/03/01/emacs)
[#]: author: (Norman Walsh https://so.nwalsh.com)

Emacs for (even more of) the win
======

I use Emacs every day. I rarely notice it. But when I do, it usually brings me joy.

>If you are a professional writer…Emacs outshines all other editing software in approximately the same way that the noonday sun does the stars. It is not just bigger and brighter; it simply makes everything else vanish.

I’ve been using [Emacs][1] for well over twenty years. I use it for writing almost anything and everything (I edit Scala and Java in [IntelliJ][2]). I read my email in it. If it can be done in Emacs, that’s where I prefer to do it.

Although I’ve used Emacs for literally decades, I realized around the new year that very little about my use of Emacs had changed in the past decade or more. New editing modes had come along, of course, I’d picked up a package or two, and I did adopt [Helm][3] a few years ago, but mostly it just did all the heavy lifting that I required of it, day in and day out without complaining or getting in my way. On the one hand, that’s a testament to how good it is. On the other hand, that’s an invitation to dig in and see what I’ve missed.

At about the same time, I resolved to improve several aspects of my work life:

  * **Better meeting management.** I’m lead on a couple of projects at work and those projects have meetings, both regularly scheduled and ad hoc; some of them I run, some of them, I only attend.

I realized I’d become sloppy about my participation in meetings. It’s all too easy sit in a room where there’s a meeting going on but actually read email and work on other items. (I strongly oppose the “no laptops” rule in meetings, but that’s a topic for another day.)

There are a couple of problems with sloppy participation. First, it’s disrespectful to the person who convened the meeting and the other participants. That’s actually sufficient reason not to do it, but I think there’s another problem: it disguises the cost of meetings.

If you’re in a meeting but also answering your email and maybe fixing a bug, then that meeting didn’t cost anything (or as much). If meetings are cheap, then there will be more of them.

I want fewer, shorter meetings. I don’t want to disguise their cost, I want them to be perceived as damned expensive and to be avoided unless absolutely necessary.

Sometimes, they are absolutely necessary. And I appreciate that a quick meeting can sometimes resolve an issue quickly. But if I have ten short meetings a day, let’s not pretend that I’m getting anything else productive accomplished.

I resolved to take notes at all the meetings I attend. I’m not offering to take minutes, necessarily, but I am taking minutes of a sort. It keeps me focused on the meeting and not catching up on other things.

  * **Better time management.** There are lots and lots of things that I need or want to do, both professionally and personally. I’ve historically kept track off some of them in issue lists, some in saved email threads (in Emacs and [Gmail][4], for slightly different types of reminders), in my calendar, on “todo lists” of various sorts on my phone, and on little scraps of paper. And probably other places as well.

I resolved to keep them all in one place. Not because I think there’s one place that’s uniformly best or better, but because I hope to accomplish two things. First, by having them all in one place, I hope to be able to develop a better and more holistic view of where I’m putting my energies. Second, because I want to develop a habitn. “A settled or regular tendency or practice, especially one that is hard to give up.” of recording, tracking, and preserving them.

  * **Better accountability.** If you work in certain science or engineering disciplines, you will have developed the habit of keeping a [lab notebook][5]. Alas, I did not. But I resolved to do so.

I’m not interested in the legal aspects that encourage bound pages or scribing only in permanent marker. What I’m interested in is developing the habit of keeping a record. My goal is to have a place to jot down ideas and design sketches and the like. If I have sudden inspiration or if I think of an edge case that isn’t in the test suite, I want my instinct to be to write it in my journal instead of scribbling it on a scrap of paper or promising myself that I’ll remember it.




This confluence of resolutions led me quickly and more-or-less directly to [Org][6]. There is a large, active, and loyal community of Org users. I’ve played with it in the past (I even [wrote about it][7], at least in passing, a couple of years ago) and I tinkered long enough to [integrate MarkLogic][8] into it. (Boy has that paid off in the last week or two!)

But I never used it.

I am now using it. I take minutes in it, I record all of my todo items in it, and I keep a journal in it. I’m not sure there’s much value in me attempting to wax eloquent about it or enumerate all its features, you’ll find plenty of either with a quick web search.

If you use Emacs, you should be using Org. If you don’t use Emacs, I’m confident you wouldn’t be the first person who started because of Org. It does a lot. It takes a little time to learn your way around and remember the shortcuts, but I think it’s worth it. (And if you carry an [iOS][9] device in your pocket, I recommend [beorg][10] for recording items while you’re on the go.)

Naturally, I worked out how to [get XML out of it][11]⊕“Worked out” sure is a funny way to spell “hacked together in elisp.”. And from there, how to turn it back into the markup my weblog expects (and do so at the push of a button in Emacs, of course). So this is the first posting written in Org. It won’t be the last.

P.S. Happy birthday [little weblog][12].

--------------------------------------------------------------------------------

via: https://so.nwalsh.com/2019/03/01/emacs

作者：[Norman Walsh][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://so.nwalsh.com
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Emacs
[2]: https://en.wikipedia.org/wiki/IntelliJ_IDEA
[3]: https://emacs-helm.github.io/helm/
[4]: https://en.wikipedia.org/wiki/Gmail
[5]: https://en.wikipedia.org/wiki/Lab_notebook
[6]: https://en.wikipedia.org/wiki/Org-mode
[7]: https://www.balisage.net/Proceedings/vol17/html/Walsh01/BalisageVol17-Walsh01.html
[8]: https://github.com/ndw/ob-ml-marklogic/
[9]: https://en.wikipedia.org/wiki/IOS
[10]: https://beorgapp.com/
[11]: https://github.com/ndw/org-to-xml
[12]: https://so.nwalsh.com/2017/03/01/helloWorld
