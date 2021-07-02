[#]: subject: (How a college student founded a free and open source operating system)
[#]: via: (https://opensource.com/article/21/6/freedos-founder)
[#]: author: (Joshua Allen Holm https://opensource.com/users/holmja)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How a college student founded a free and open source operating system
======
An interview with FreeDOS founder Jim Hall.
![Puzzle pieces coming together to form a computer screen][1]

[Jim Hall][2] is best known as the computer programmer who founded the FreeDOS project. Jim began the project in 1994 as a replacement for MS-DOS while he was still a student at the University of Wisconsin–River Falls. Jim created FreeDOS in response to Microsoft ending support for MS-DOS in 1994. Recently Jim agreed to an email interview. Correspondent Joshua Allen Holm joined me in posing the following questions to Jim.

**Don Watkins: What kind of skill set invites you to write your own operating system?**

I think even a beginner can get started writing an operating system like FreeDOS, although it would take a more advanced programmer to write the kernel.

[I am a self-taught programmer][3]. I learned about programming from an early age by tinkering on our Apple II computer at home. Much later, I learned C programming—my brother was a computer science student when I was a physics student, and he introduced me to C. I picked up the rest by reading books and writing my own programs.

I wrote a lot of small utilities that enhanced my command line on MS-DOS or even replaced certain DOS commands. And you can write a lot of those programs even with a basic level of programming experience. You can write file utilities like FIND, FC, CHOICE, TYPE, MORE, or COPY—or user commands like ECHO or CLS—with only an introduction to C programming. With a bit of practice, you can write system-level programs like ATTRIB, or the COMMAND shell.

**DW: Were you inspired by Linus Torvalds when you decided to write your own version of DOS and how did that contribute to your licensing decision?**

In a way, yes. I really liked DOS and had been using it since the early 1980s. I ran MS-DOS on my personal computer at university. But in 1993, I discovered Linux.

I really liked the Unix systems in our campus computer lab, where I spent much of my time as an undergraduate university student. When I heard about Linux, a free version of Unix that I could run on my ’386 computer at home, I immediately wanted to try it out. [My first Linux distribution][4] was Softlanding Linux System (SLS) 1.03, with Linux kernel 0.99 alpha patch level 11. That required a whopping 2MB of RAM, or 4MB if you wanted to compile programs, and 8MB to run X windows.

I dual-booted Linux with MS-DOS. I booted into Linux most of the time, but I still booted back into MS-DOS to write papers in a word processor, to use a spreadsheet program to analyze data for my lab classes or to play my favorite DOS games.

In 1994, I heard that Microsoft planned to “do away” with MS-DOS. The next version of Windows would eliminate DOS. I didn’t like that, and I still wanted to run DOS. I decided that if folks could come together over the Internet to write something like Linux, surely, we could do the same with DOS. After all, DOS was fairly simple compared to Linux.

On June 29, 1994, [I announced the “PD-DOS” project][5] to write our own DOS. I called it “PD” because I thought it would be in the public domain. But I quickly learned about the GNU General Public License that the Linux kernel used, and decided that was a much better license. No one could take our source code and create a proprietary version of DOS. We changed the name to “Free-DOS” after another week or so. We later dropped the hyphen to become “FreeDOS.”

**Joshua Allen Holm: What are the advantages of using FreeDOS over alternative ways of running DOS applications (e.g., DOSBox)?**

Using DOSBox to run DOS applications in Linux is a great way to run certain DOS applications. But DOSBox is really intended to launch a single DOS program, like a game. The DOS command line is pretty limited in DOSBox.

In contrast, FreeDOS provides a full DOS command line. We include all of the commands you remember from classic DOS, and added other commands and utilities to do new things. FreeDOS also includes compilers and assemblers so developers can write new programs, utilities, and tools to make your DOS experience more useful, Internet programs to help you get on a network, and even open source games.

**JAH: Looking back over the years you have worked on FreeDOS, is there anything you would have done differently?**

There’s only one event that I wish I could take back. I occasionally reach out to companies that sold DOS applications in the 1980s and 1990s and ask them if they will release the source code to their old DOS programs under an open source software license. That’s a great way to contribute to the open source community.

One popular DOS program was a replacement for the MS-DOS COMMAND shell. 4DOS, by JP Software, was an extremely powerful DOS shell and included many modern features. For example, 4DOS supported built-in aliases, color-coded directory listings, and a “swapping” mechanism that freed up more conventional memory to run programs.

I contacted JP Software to ask if they would release the source code to 4DOS under an open source software license. JP Software had stopped supporting DOS, and instead focused on a similar replacement for the CMD shell in Windows NT, called 4NT. They were interested in releasing the source code to 4DOS but were concerned that someone might take the 4DOS source code and release a version for Windows. In effect, that would put JP Software in competition with their older product.

I still didn’t understand the fine points of open source software licenses, and I gave them bad advice. I suggested they might start with an existing open source license and add a term that said you could only run it on DOS. They then released the 4DOS source code under a modified version of the MIT license.

Unfortunately, limiting where you can run the software violates one of the tenets of open source software and free software. Users should be able to run open source software anywhere, and for any use. An open source license isn’t “open source” if you are limited to running it only on one operating system.

So despite best intentions, I gave JP Software really bad advice there, and 4DOS isn’t actually open source software. We used to include 4DOS in FreeDOS—but as we are preparing the FreeDOS 1.3 release, we want to be careful to only include open source software. So FreeDOS 1.3 RC4 (“release candidate 4”) does not include 4DOS. 

**JAH: What are some interesting ways people are using FreeDOS?**

Over the years, I’ve seen people use FreeDOS to do a lot of really interesting things!

One of the earliest cool examples was someone who built pinball machines like you used to see in arcades. He embedded a version of FreeDOS to track the score and update the video screen on the back of the machine. I don’t know exactly how he did this, but my guess is every target or bumper on the pinball board probably generated a keyboard event. You can write a DOS application to read the “keyboard” and update the score based on that.

A few years ago, a user found a video of a train control system in Russia [that ran on a FreeDOS PC][6]. They rebooted the computer, and if you freeze the video at the right point, you can briefly see the FreeDOS kernel starting up. It disappears quickly, but you can see it at 0:07 in the video.

More recently, I saw someone had managed to boot an original IBM PC 5150 with FreeDOS [from a vinyl record][7], using the 5150’s rarely used cassette tape storage port. It’s really cool to see FreeDOS being used this way. It’s a method that I would never have thought to try, but sometimes you have to do something just for the fun of it.

**JAH: Why work on DOS in 2021?**

We still work on DOS in 2021 for a few reasons. I guess the first reason is that DOS is still interesting. We’ve added a lot to FreeDOS over the years. Where the original MS-DOS had a limited set of commands, FreeDOS includes dozens of useful utilities and tools, including editors, compilers, assemblers, games, and other neat programs.

But it has to be more than just a cool hobby. I find that working on FreeDOS makes for a very interesting programming challenge. In modern systems like Linux, you can take advantage of a lot of memory at once, and you can address it all in one big block. As a result, many programmers will load a lot of libraries and other code to create their projects. This is a very easy way to build a complicated project. You can build a very complex system in a very short time this way. And for many systems, time to market is the most important factor.

Loading a bunch of libraries and other code blocks is very inefficient, however. You may have the same basic functionality implemented half a dozen ways across the different libraries because each library implements something their own way. So your code grows and requires more memory.

Maybe that’s not a problem on a desktop PC. I run Linux, and my modern desktop PC has 32GB of memory. Loading a bunch of stuff into memory isn’t a big deal. But on a shared server, where you might have multiple instances of that project running, you’ll quickly run into memory limitations. How many instances can you run at the same time on a server? That 32GB of memory starts to look pretty slim.

You can’t load all of that into memory on a DOS machine. To remain compatible with the original DOS, FreeDOS has all the limitations of DOS. When MS-DOS was popular, a powerful PC might have had 4MB, 8MB, or even 16MB of extended memory. But the computer only had 640kb of “main” memory, due to how DOS addressed memory. And that’s megabytes and kilobytes, not gigabytes. A kilobyte is a thousand bytes (the basic unit of memory). A megabyte is a thousand kilobytes. And a gigabyte is a thousand megabytes. So today’s computers have memory that is about 1,000,000 more than a DOS computer.

By programming on a limited system like FreeDOS, you constantly have to think about the tradeoffs. How much memory does my program really need to do its job? Is it faster to read a file into memory to work on it, or process the file one bit at a time? And you’re always keeping in mind what libraries and other code you use in your program. A DOS program can only be so big, so you need to be careful about how you write a DOS program.

When you write DOS programs all the time, you get really good at optimizing a program. You think about programming in a different way, because you’re always considering how to do something more efficiently. That’s a challenge, but an interesting one.

**DW: How big is the FreeDOS community?**

FreeDOS was a very popular project throughout the 1990s and into the early 2000s, but the community isn’t as big these days. But it’s great that we are still an engaged and active group. If you look at the news items on our website, you’ll see we post updates on a fairly regular basis.

It’s hard to estimate the size of the community. I’d say we have a few dozen members who are very active. And we have a few dozen others who reappear occasionally to post new versions of their programs. I think to maintain an active community that’s still working on an open source DOS from 1994 is a great sign.

Some members have been with us from the very beginning, and I’m really thankful to count them as friends. We do [video hangouts on a semi-regular basis][8]. It’s great to finally “meet” the folks I’ve only exchanged emails with over the years.

It's meetings like this when I remember open source is more than just writing code; it's about a community. And while I've always done well with our virtual community that communicates via email, I really appreciated getting to talk to people without the asynchronous delay or artificial filter of email—making that real-time connection means a lot to me.

**DW: How does someone get involved in the community?**

I think our community is very welcoming, so anyone is free to join. We communicate via an email list, which you can find on the [FreeDOS website][9]. Join the freedos-user email list if you want to talk about FreeDOS or ask for help. Developers should join the freedos-devel email list; that’s where most of the FreeDOS developers hang out. Our email list volume is pretty low, so you aren’t likely to fill up your inbox by subscribing to either email list.

A great way to get started is by writing or updating documentation, or by fixing bugs. I think that’s true of pretty much every open source project out there. We always need folks to work on the documentation and fix bugs. But for a project like FreeDOS, I think reading through the documentation is important if you’re new to DOS. A common mistake for newcomers is thinking of FreeDOS as a stripped-down version of Linux, when in fact DOS uses a different memory and execution model. You can learn about that by reading the documentation, which is why I recommend new contributors start there.

For the more adventurous, we maintain a list of priority projects on our website. If you’d like to contribute to FreeDOS, but aren’t sure what needs work, you might consider tackling one or more of these projects:

  * If you’ve got some programming experience:
    * Port FreeDOS utilities to OpenWatcom C and NASM—our preferred C compiler and Assembler for FreeDOS. (Some older FreeDOS programs were probably written for Borland C or Turbo C or Microsoft C, or Microsoft ASM or Turbo ASM)

    * Port GNU utilities to FreeDOS, such as using IA-16 GCC (while IA-16 GCC requires a ’386 or better to compile, programs compiled with IA-16 GCC run on all CPUs)

    * Create a new alternative shell, similar to COMMAND.COM but with expanded BAT programming

    * Add international language support to a FreeDOS program that currently only supports one language.

  * If you’re a highly-skilled DOS developer:
    * Write a guest tool like VMSMOUNT for VirtualBox

    * Write a driver for modern sound cards

    * Add some kind of UEFI bootstrap BIOS emulator, perhaps implemented as a CSM




We like to make it easy for new contributors to get started in FreeDOS, and we welcome everyone who wants to work on FreeDOS. If you still don’t know how to contribute, feel free to ask on the email list.

You can find FreeDOS at [www.freedos.org][10]
Join FreeDOS on Facebook at [facebook.com/groups/freedos/][11] 
Follow FreeDOS on Twitter at [twitter.com/freedos_project][12]

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/freedos-founder

作者：[Joshua Allen Holm][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/holmja
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/puzzle_computer_solve_fix_tool.png?itok=U0pH1uwj (Puzzle pieces coming together to form a computer screen)
[2]: https://opensource.com/users/jim-hall
[3]: https://opensource.com/article/20/8/learn-open-source
[4]: https://opensource.com/article/17/8/linux-anniversary
[5]: https://groups.google.com/g/comp.os.msdos.apps/c/oQmT4ETcSzU/m/O1HR8PE2u-EJ?pli=1
[6]: https://www.youtube.com/watch?v=eAate0v8hDE
[7]: https://www.youtube.com/watch?v=bqz65_YfcJg
[8]: https://opensource.com/article/20/8/meet-open-source-collaborators
[9]: https://www.freedos.org/
[10]: http://www.freedos.org/
[11]: https://www.facebook.com/groups/freedos/
[12]: http://twitter.com/freedos_project
