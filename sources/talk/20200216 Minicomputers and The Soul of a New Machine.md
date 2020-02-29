[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Minicomputers and The Soul of a New Machine)
[#]: via: (https://opensource.com/article/20/2/minicomputers-and-soul-new-machine)
[#]: author: (Matthew Broberg https://opensource.com/users/mbbroberg)

Minicomputers and The Soul of a New Machine
======
The new season of Command Line Heroes begins with a story of increases
in memory, company politics, and a forgotten technology at the heart of
our computing history.
![Command Line Heroes season 4 episode 1 covers the rise of minicomputers][1]

The [Command Line Heroes podcast][2] is back, and this season it covers the machines that run all the programming languages [I covered last season][3]. As the podcast staff puts it:

"This season, we'll look at what happens when idealistic teams come together to build visionary machines. Machines made with leaps of faith and a lot of hard, often unrecognized, work in basements and stifling cubicles. Machines that brought teams together and changed us as a society in ways we could only dream of."

This first episode looks at the non-fiction book (and engineering classic), [_The Soul of a New Machine_][4], to look at a critical moment in computing history. It covers the transition from large, hulking mainframes to the intermediate step of the minicomputer, which will eventually lead us to the PC revolution that we're still living in the wake of.

### The rise of minicomputers

One of the most important machines on the path to modern machines, most of us have since forgotten: the minicomputer.

It was a crucial link in the evolution from mainframe to PC (aka microcomputer). It was also extremely important in the development of software that would fuel the PC revolution, chiefly the operating system. The PDP-7 and PDP-11—on which [UNIX was developed][5]—were examples of minicomputers. So was the machine at the heart of _The Soul of the New Machine_.

This episode takes us back to this important time in computing and explores this forgotten machine—both in terms of its hardware and software.

From 1963 to 1977, minicomputers were 12 to 16-bit machines from computing giants DEC ([PDP][6]) and rival upstart [Data General][7] ([Nova][8], [Eclipse][9]). But in October 1977, DEC unveiled the VAX 11/780, a 32-bit CPU built from transistor-transistor logic with a five megahertz cycle-time and 2 megabytes of memory. The VAX launched DEC [into second place][10] in the largest computer company in the world.

The jump from a 12-bit to a 32-bit CPU is a jump from 4,096 bytes to 4,294,967,296 bytes of data. That increase massively increased the potential for software to do complex tasks while drastically shrinking the size of the computer. And with a 32-bit CPU, the VAX was nearly as powerful as an IBM/360 mainframe—but much smaller and much, much less expensive.

[The episode][11] goes into the drama that unfolds as teams within Data General race to have the most marketable minicomputer while working through company politics and strong personalities.

### Revisiting _The Soul of a New Machine_

_The Soul of a New Machine_ was written in 1981 by Tracy Kidder, and chronicles a small group of engineers at the now-former tech company, Data General, as they attempt to compete with a rival internal group and create a 32-bit minicomputer as a skunkworks project known as "Eagle." For those okay with spoilers, the computer would eventually be known as the [Eclipse MV/8000][12].

Earlier this year, [Jessie Frazelle][13], of Docker, Go, and Kubernetes fame, and [Bryan Cantrill][14], known for [DTrace][15], Joyent, and many other technologies, publicly wrote about reading the non-fiction classic. As it's written, Cantrill mentioned the book to Frazelle, who read it and then wrote an enthusiastic [blog post][16] about the book. As Frazelle put it:

"Personally, I look back on the golden age of computers as the time when people were building the first personal computers in their garage. There is a certain whimsy of that time fueled with a mix of hard work and passion for building something crazy with a very small team. In today's age, at large companies, most engineers take jobs where they work on one teeny aspect of a machine or website or app. Sometimes they are not even aware of the larger goal or vision but just their own little world.

In the book, a small team built an entire machine… The team wasn't driven by power or greed, but by accomplishment and self-fulfillment. They put a part of themselves in the machine, therefore, producing a machine with a soul…The team was made up of programmers with the utmost expertise and experience and also with new programmers."

Inspired by Frazelle's reaction, Cantrill re-read it and wrote [a blog article][17] about it and writes this beautiful note:

"…_The Soul of a New Machine_ serves to remind us that the soul of what we build is, above all, shared — that we do not endeavor alone but rather with a group of like-minded individuals."

Frazelle's and Cantrill's reading of the book and blog [sparked a wave of people][18] exploring and talking about this text. While it remains on my book list, this dialogue-by-book-review is at the heart of the CLH season 4 as it explores the entire machine.

### Why did the minicomputer go the way of the Neanderthal?

As we all know, minicomputers are not a popular purchase in today's technology market. Minicomputers ended up being great technology for timesharing. The irony is that they unwittingly sealed their own fate. The Internet, which started off as ARPANET, was basically a new kind of timesharing. They were so good at timesharing that at one point, the DEC PDP 11 accounted for over 30% of the nodes on ARPANET. Minicomputers were powering their own demise.*

Minicomputers paved the way for smaller computers and for more and more people to have access to these powerful, society-changing machines. But I'm getting ahead of myself. Keep listening to the [new season of Command Line Heroes][2] to continue the story of machines in computing history.

* * *

What's your minicomputer story? I'd love to read them in the comments.

(There were, of course, other factors leading to the end of this era. Minicomputers were fighting at the low end of the market with the rise of microcomputers, while Unix systems continued to push into the midrange market. The rise of the Internet was perhaps its final blow.)

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/minicomputers-and-soul-new-machine

作者：[Matthew Broberg][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mbbroberg
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/command-line-heroes-minicomputers-s4-e1.png?itok=FRaff5i6 (Command Line Heroes season 4 episode 1 covers the rise of minicomputers)
[2]: https://www.redhat.com/en/command-line-heroes
[3]: https://opensource.com/article/19/6/command-line-heroes-python
[4]: https://en.wikipedia.org/wiki/The_Soul_of_a_New_Machine
[5]: https://opensource.com/19/9/command-line-heroes-bash
[6]: https://en.wikipedia.org/wiki/PDP
[7]: https://en.wikipedia.org/wiki/Data_General
[8]: https://en.wikipedia.org/wiki/Data_General_Nova
[9]: https://en.wikipedia.org/wiki/Data_General_Eclipse
[10]: http://www.old-computers.com/history/detail.asp?n=20&t=3
[11]: https://www.redhat.com/en/command-line-heroes/season-4/minicomputers
[12]: https://en.wikipedia.org/wiki/Data_General_Eclipse_MV/8000
[13]: https://twitter.com/jessfraz?lang=en
[14]: https://en.wikipedia.org/wiki/Bryan_Cantrill
[15]: https://en.wikipedia.org/wiki/DTrace
[16]: https://blog.jessfraz.com/post/new-golden-age-of-building-with-soul/
[17]: http://dtrace.org/blogs/bmc/2019/02/10/reflecting-on-the-soul-of-a-new-machine/
[18]: https://twitter.com/search?q=jessfraz%20soul%20new%20machine&src=typed_query&f=live
