[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (FreeDOS turns 25 years old: An origin story)
[#]: via: (https://opensource.com/article/19/6/freedos-anniversary)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)

FreeDOS turns 25 years old: An origin story
======
The operating system's history is a great example of the open source
software model: developers working together to create something.
![FreeDOS fish logo and command prompt on computer][1]

June 29 marks the 25th anniversary of [FreeDOS][2]. That's a major milestone for any open source software project, and I'm proud of the work that we've done on it over the past quarter century. I'm also proud of how we built FreeDOS because it is a great example of how the open source software model works.

For its time, MS-DOS was a powerful operating system. I'd used DOS for years, ever since my parents replaced our aging Apple II computer with a newer IBM machine. MS-DOS provided a flexible command line, which I quite liked and that came in handy to manipulate my files. Over the years, I learned how to write my own utilities in C to expand its command-line capabilities even further.

Around 1994, Microsoft announced that its next planned version of Windows would do away with MS-DOS. But I liked DOS. Even though I had started migrating to Linux, I still booted into MS-DOS to run applications that Linux didn't have yet.

I figured that if we wanted to keep DOS, we would need to write our own. And that's how FreeDOS was born.

On June 29, 1994, I made a small announcement about my idea to the comp.os.msdos.apps newsgroup on Usenet.

> ANNOUNCEMENT OF PD-DOS PROJECT:
>  A few months ago, I posted articles relating to starting a public domain version of DOS. The general support for this at the time was strong, and many people agreed with the statement, "start writing!" So, I have…
>
> Announcing the first effort to produce a PD-DOS. I have written up a "manifest" describing the goals of such a project and an outline of the work, as well as a "task list" that shows exactly what needs to be written. I'll post those here, and let discussion follow.

While I announced the project as PD-DOS (for "public domain," although the abbreviation was meant to mimic IBM's "PC-DOS"), we soon changed the name to Free-DOS and later FreeDOS.

I started working on it right away. First, I shared the utilities I had written to expand the DOS command line. Many of them reproduced MS-DOS features, including CLS, DATE, DEL, FIND, HELP, and MORE. Some added new features to DOS that I borrowed from Unix, such as TEE and TRCH (a simple implementation of Unix's tr). I contributed over a dozen FreeDOS utilities

By sharing my utilities, I gave other developers a starting point. And by sharing my source code under the [GNU General Public License][3] (GNU GPL), I implicitly allowed others to add new features and fix bugs.

Other developers who saw FreeDOS taking shape contacted me and wanted to help. Tim Norman was one of the first; Tim volunteered to write a command shell (COMMAND.COM, later named FreeCOM). Others contributed utilities that replicated or expanded the DOS command line.

We released our first alpha version as soon as possible. Less than three months after announcing FreeDOS, we had an Alpha 1 distribution that collected our utilities. By the time we released Alpha 5, FreeDOS boasted over 60 utilities. And FreeDOS included features never imagined in MS-DOS, including internet connectivity via a PPP dial-up driver and dual-monitor support using a primary VGA monitor and a secondary Hercules Mono monitor.

New developers joined the project, and we welcomed them. By October 1998, FreeDOS had a working kernel, thanks to Pat Villani. FreeDOS also sported a host of new features that brought not just parity with MS-DOS but surpassed MS-DOS, including ANSI support and a print spooler that resembled Unix lpr.

You may be familiar with other milestones. We crept our way towards the 1.0 label, finally releasing FreeDOS 1.0 in September 2006, FreeDOS 1.1 in January 2012, and FreeDOS 1.2 in December 2016. MS-DOS stopped being a moving target long ago, so we didn't need to update as frequently after the 1.0 release.

Today, FreeDOS is a very modern DOS. We've moved beyond "classic DOS," and now FreeDOS features lots of development tools such as compilers, assemblers, and debuggers. We have lots of editors beyond the plain DOS Edit editor, including Fed, Pico, TDE, and versions of Emacs and Vi. FreeDOS supports networking and even provides a simple graphical web browser (Dillo). And we have tons of new utilities, including many that will make Linux users feel at home.

FreeDOS got where it is because developers worked together to create something. In the spirit of open source software, we contributed to each other's work by fixing bugs and adding new features. We treated our users as co-developers; we always found ways to include people, whether they were writing code or writing documentation. And we made decisions through consensus based on merit. If that sounds familiar, it's because those are the core values of open source software: transparency, collaboration, release early and often, meritocracy, and community. That's the [open source way][4]!

I encourage you to download FreeDOS 1.2 and give it a try.

### More resources

  * [FreeDOS website][2]
  * [FreeDOS wiki][5]
  * [Download FreeDOS 1.2][6]
  * [Free ebooks about FreeDOS][7]
  * [A gentle introduction to FreeDOS][8]
  * [The origin and evolution of FreeDOS][9]
  * [4 cool facts you should know about FreeDOS][10]
  * [How to upgrade your system BIOS using FreeDOS][11]
  * [Celebrating 24 years of FreeDOS: Useful commands cheat sheet][12]
  * [How to run DOS programs in Linux][13]
  * [Keeping DOS alive and kicking with open source][14]
  * [Running DOS on the Raspberry Pi][15]



--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/freedos-anniversary

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/freedos-fish-laptop-color.png?itok=vfv_Lpph (FreeDOS fish logo and command prompt on computer)
[2]: https://www.freedos.org/
[3]: https://www.gnu.org/licenses/licenses.en.html
[4]: https://opensource.com/open-source-way
[5]: http://wiki.freedos.org/
[6]: https://www.freedos.org/download/
[7]: https://www.freedos.org/ebook/
[8]: https://opensource.com/article/18/4/gentle-introduction-freedos
[9]: https://opensource.com/article/17/10/freedos
[10]: https://opensource.com/article/17/6/freedos-still-cool-today
[11]: https://opensource.com/article/17/6/upgrade-bios-freedos
[12]: https://opensource.com/article/18/6/freedos-commands-cheat-sheet
[13]: https://opensource.com/article/17/10/run-dos-applications-linux
[14]: https://opensource.com/life/16/9/interview-jim-hall-freedos
[15]: https://opensource.com/article/18/3/can-you-run-dos-raspberry-pi
