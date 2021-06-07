[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 reasons why I love coding on Linux)
[#]: via: (https://opensource.com/article/21/2/linux-programming)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

5 reasons why I love coding on Linux
======
Linux is a great platform for programming—it's logical, easy to see the
source code, and very efficient.
![Terminal command prompt on orange background][1]

In 2021, there are more reasons why people love Linux than ever before. In this series, I'll share 21 different ways to use Linux. Here I'll explain why so many programmers choose Linux.

When I first started using Linux, it was for its excellent multimedia support because I worked in film production. We found that the typical proprietary video editing applications couldn't handle most of the footage we were pulling from pretty much any device that could record an image. At the time, I wasn't aware that Linux had a reputation as an operating system for servers and programmers. The more I did on Linux, the more I wanted to control every aspect of it. And in the end, I discovered that a computer was at its most powerful when its user could "speak" its language. Within a few years of switching to Linux, I was scripting unattended video edits, stringing together audio files, bulk editing photos, and anything else I could imagine and then invent a solution for. It didn't take long for me to understand why programmers loved Linux, but it was Linux that taught me to love programming.

It turns out that Linux is an excellent platform for programmers, both new and experienced. It's not that you _need_ Linux to program. There are successful developers on all different kinds of platforms. However, Linux has much to offer developers. Here are a few things I've found useful.

### Foundations of logic

Linux is built around [automation][2]. It's very intentional that staple applications on Linux can at the very least launch from a terminal with additional options, and often they can even be used entirely from the terminal. This idea is sometimes mistaken as a primitive computing model because people mistakenly believe that writing software that operates from a terminal is just doing the bare minimum to get a working application. This is an unfortunate misunderstanding of how code works, but it's something many of us are guilty of from time to time. We think _more_ is always better, so an application containing 1,000 lines of code must be 100 times better than one with ten lines of code, right? The truth is that all things being equal, the application with greater flexibility is preferable, regardless of how that translates to lines of code.

On Linux, a process that might take you an hour when done manually can literally be reduced to one minute with the right terminal command, and possibly less when parsed out to [GNU Parallel][3]. This phenomenon requires a shift in how you think about what a computer does. For instance, if your task is to add a cover image to 30 PDF files, you might think this is a sensible workflow:

  1. Open a PDF in a PDF editor
  2. Open the front cover
  3. Append a PDF to the end of the cover file
  4. Save the file as a new PDF
  5. Repeat this process for each old PDF (but do not duplicate this process for each new PDF)



It's mostly common sense stuff, and while it's painfully repetitive, it does get the job done. On Linux, however, you're able to work smarter than that. The thought process is similar: First, you devise the steps required for a successful result. After some research, you'd find out about the `pdftk-java` command, and you'd discover a simple solution:


```
$ pdftk A=cover.pdf B=document_1.pdf \
 cat A B \
 output doc+cover_1.pdf
```

Once you've proven to yourself that the command works on one document, you take time to learn about looping options, and you settle on a parallel operation:


```
$ find ~/docs/ -name "*.pdf" | \
 parallel pdftk A=cover.pdf B={} \
 cat A B \
 output {.}.cover.pdf
```

It's a slightly different way of thinking because the "code" you write processes data differently than the enforced linearity you're used to. However, getting out of your old linear way of thinking is important for writing actual code later, and it has the side benefit of empowering you to compute smarter.

### Code connections

No matter what platform you're programming for when you write code, you're weaving an intricate latticework of invisible connections between many different files. In all but the rarest cases, code draws from headers and relies on external libraries to become a complete program. This happens on any platform, but Linux tends to encourage you to understand this for yourself, rather than blindly trusting the platform's development kit to take care of it for you.

Now, there's nothing wrong with trusting a development kit to resolve _library_ and _include_ paths. On the contrary, that kind of abstraction is a luxury you should enjoy. However, if you never understand what's happening, then it's a lot harder to override the process when you need to do something that a dev kit doesn't know about or to troubleshoot problems when they arise.

This translates across platforms, too. You can develop code on Linux that you intend to run on Linux as well as other operating systems, and your understanding of how code compiles helps you hit your targets.

Admittedly, you don't learn these lessons just by using Linux. It's entirely possible to blissfully code in a good IDE and never give a thought to what version of a library you have installed or where the development headers are located. However, Linux doesn't hide anything from you. It's easy to dig down into the system, locate the important parts, and read the code they contain.

### Existing code

Knowing where headers and libraries are located is useful, but having them to reference is yet another added bonus to programming on Linux. On Linux, you get to see the source code of basically anything you want (excluding applications that aren't open source but that run on Linux). The benefit here cannot be overstated. As you learn more about programming in general or about programming something new to you, you can learn a lot by referring to existing code on your Linux system. Many programmers have learned how to code by reading other people's open source code.

On proprietary systems, you might find developer documentation with code samples in it. That's great because documentation is important, but it pales in comparison to locating the exact functionality you want to implement and then finding the source code demonstrating how it was done in an application you use every day.

### Direct access to peripherals

Something I often took for granted after developing code for media companies using Linux is access to peripherals. For instance, when connecting a video camera to Linux, you can pull incoming data from **/dev/video0** or similar. Everything's in **/dev**, and it's always the shortest path between two points to get there.

That's not the case on other platforms. Connecting to systems outside of the operating system is often a maze of SDKs, restricted libraries, and sometimes NDAs. This, of course, varies depending on what you're programming for, but it's hard to beat Linux's simple and predictable interface.

### Abstraction layers

Conversely, Linux also provides a healthy set of abstraction layers for when direct access or manual coding ends up creating more work than you want to do. There are conveniences found in Qt and Java, and there are whole stacks like Pulse Audio, Pipewire, and gstreamer. Linux _wants_ you to be able to code, and it shows.

### Add to this list

There are more reasons that make coding on Linux a pleasure. Some are broad concepts and others are overly-specific details that have saved me hours of frustration. Linux is a great place to be, no matter what platform you're targeting. Whether you're just learning about programming or you're a coder looking for a new digital home, there's no better workspace for programming than Linux.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/linux-programming

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/terminal_command_linux_desktop_code.jpg?itok=p5sQ6ODE (Terminal command prompt on orange background)
[2]: https://opensource.com/article/20/11/orchestration-vs-automation
[3]: https://opensource.com/article/18/5/gnu-parallel
