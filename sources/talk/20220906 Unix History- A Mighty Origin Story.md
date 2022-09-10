[#]: subject: "Unix History: A Mighty Origin Story"
[#]: via: "https://www.debugpoint.com/unix-history/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "Donkey-Hao"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Unix History: A Mighty Origin Story
======
A brief walk down memory lane about Unix and its beginning.

![The beginning][1]

### Unix: The origin story

The world today runs on Linux. Billions of mobile phones and servers today run Linux. But before Linux, there was Unix, and without it, Linux would not have existed today.

Unix’s origin can be traced back to the moon landing days. In 1965, three famous institutions started a joint venture to create an operating system that could serve multiple users and share data and resources.

![Scanned copy of actual Unix code][2]

They are the famous Bell Telephone Laboratories, the General Electric Company and the Massachusetts Institute of Technology. This project or the joint venture is called “Multics” – an acronym for “Multiplex Information and Computing Service”.

But, the project did not see much success. Unfortunately. Due to complexity and poor outcome, Bell Labs discontinued the project.

Ken Thomson from Bell Labs, who worked in Multics, started afresh. He started writing a new operating system for an ancient computer PDP-7 of Digital Equipment Corporation. Later, Dennis Ritchie joined, and they created a hierarchical file system, device files, command line interpreter and processes. This is how the Unix was born, named by another member of the Multics project – Brian Kernighan.

In 1971, Unix was ported to a little advanced PDP-11 computer with just a 512 KB disk. At the time, Unix was only supporting 16 KB and 8 KB memory allocated for user programs.

However, most of the Unix code was in assembly language, making it hardware dependent. So, it was not portable.

![Ken Thompson (sitting) and Dennis Ritchie at PDP-11 (credit and learn more about this image1)][3]

### Creation of C Programming Language

So, the only way to make it portable and machine-independent is to write it in a high-level language so that the compile and corresponding object code can take care of the machine code conversion.

The great brains at that time solve the problem in a jiffy. Ken Thompson created a high-level language from scratch called “B”. Then, he started the massive work to convert Unix assembly code to this newly created language. However, “B” also had some limitations, and Dennis Ritchie modified it to create the famous language “C”, which makes Unix a truly portable operating system.

The famous “C” language is still used today.

By the mid-’80s, Unix became so successful that it was running on thousands of hardware, from micro-computers to mainframes with a variety of hardware.

![The text book of C which we all read][4]

### MINIX and the birth of Linux

In 1987, Andrew S. Tanenbaum – a computer science professional, created a Unix fork called MINIX to explain the operating system concepts in his famous book “Operating Systems: Design and Implementation” and distributed (the 16-bit version) free along with the book. Those who studied computer science (including me) or related subjects knows that it’s the ultimate textbook on Operating system which explains the basics.

In 1991, Linux Torvalds [started a hobby project][5] while studying at the University of Helsinki. He based his work on MINIX with GNU C Compiler. He started his project to enable him to run programs on his new PC with a new 80386 processor. However, he wrote the entire operating system with features that MINIX lacked, eventually becoming the Linux Kernel.

![Famous operating systems book by Tanenbaum][6]

### BSD and macOS

During the ’80s, when Unix was shaping up, Bell Labs developed BSD (Berkeley Standard Distribution) based on the original Source code of Unix (the version that runs on PDP-7 and PDP-11). BSD is distributed by the Computer Systems Research Group (CSRG) at the University of California, Berkeley. After its formation, BSD has been adapted by many workstation vendors (the legacy desktop), such as Sun Microsystems, as a proprietary Unix variant.

This version eventually forked to create open-source variants such as OpenBSD, FreeBSD and so on. These free versions created the path to create NeXTSTEP by NeXT, founded by Steve Jobs. And NeXTSTEP eventually became the foundation for Apple’s macOS.

### Wrapping Up

Unix is a remarkable achievement by a few individuals with their original ideas and takes on problem-solving. The operating system is a work of art if you consider how much computing power and memory were available at the time of its creation.

All of these small steps, over several decades, eventually led us where we are today. No matter how many Kernels, OSes, and abstractions in the form of programming languages come in, at the core, it all started from a single source.

I always think that programs/codes are thoughts of human beings. It’s your logic, ideas are merely written in “IF-ELSE” blocks to achieve some real-world result.

References

* [https://www.bell-labs.com/usr/dmr/www/picture.html][7]1
* [https://groups.google.com/g/comp.os.minix/c/dlNtH7RRrGA/m/SwRavCzVE7gJ][8]
* [https://en.wikipedia.org/wiki/Andrew_S._Tanenbaum][9]
* [https://en.wikipedia.org/wiki/History_of_Linux][10]
* [https://en.wikipedia.org/wiki/History_of_Unix][11]
* [https://computerhistory.org/blog/the-earliest-unix-code-an-anniversary-source-code-release/][12]

*“All revolutions are, until they happen, then they are historical inevitabilities.” – Cloud Atlas*

![Join our Telegram channel and stay informed on the move.][13]

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/unix-history/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[Donkey-Hao](https://github.com/Donkey-Hao)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/wp-content/uploads/2022/09/The-beginning-1024x576.jpg
[2]: https://www.debugpoint.com/wp-content/uploads/2022/09/Scanned-copy-of-actual-Unix-code-1024x646.jpg
[3]: https://www.debugpoint.com/wp-content/uploads/2022/09/Ken-Thompson-sitting-and-Dennis-Ritchie-at-PDP-11.jpg
[4]: https://www.debugpoint.com/wp-content/uploads/2022/09/The-text-book-of-C-which-we-all-read.jpg
[5]: https://groups.google.com/g/comp.os.minix/c/dlNtH7RRrGA/m/SwRavCzVE7gJ
[6]: https://www.debugpoint.com/wp-content/uploads/2022/09/Famous-operating-systems-book-by-Tanenbaum.jpg
[7]: https://www.bell-labs.com/usr/dmr/www/picture.html
[8]: https://groups.google.com/g/comp.os.minix/c/dlNtH7RRrGA/m/SwRavCzVE7gJ
[9]: https://en.wikipedia.org/wiki/Andrew_S._Tanenbaum
[10]: https://en.wikipedia.org/wiki/History_of_Linux
[11]: https://en.wikipedia.org/wiki/History_of_Unix
[12]: https://computerhistory.org/blog/the-earliest-unix-code-an-anniversary-source-code-release/
[13]: https://t.me/debugpoint
