[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Linux Jargon Buster: What is a Linux Distribution? Why is it Called a ‘Distribution’?)
[#]: via: (https://itsfoss.com/what-is-linux-distribution/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Linux Jargon Buster: What is a Linux Distribution? Why is it Called a ‘Distribution’?
======

In this chapter of the Linux Jargon Buster, let’s discuss something elementary.

Let’s discuss what is a Linux distribution, why it is called a distribution (or distro) and how is it different from the Linux kernel. You’ll also learn a thing or two about why some people insist of calling Linux as GNU/Linux.

### What is a Linux distribution?

A Linux distribution is an operating system composed of the Linux kernel, [GNU tools][1], additional software and a package manager. It may also include display server and [desktop environment][2] to be used as regular desktop operating system.

The term is Linux distribution (or distro in short form) because an entity like Debian or Ubuntu ‘distributes’ the Linux kernel along with all the necessary software and utilities (like network manager, package manager, desktop environments etc) so that it can be used as an operating system.

Your distributions also takes the responsibility of providing updates to maintain the kernel and other utilities.

So, Linux is the kernel whereas the Linux distribution is the operating system. This is the reason why they are also sometime referred as Linux-based operating systems.

Don’t worry if not all the above makes sense right away. I’ll explain it in a bit more detail.

### Linux is just a kernel, not an operating system: What does it mean?

You might have come across that phrase and that’s entirely correct. The kernel is at the core of an operating system and it is close to the actual hardware. You interact with it using the applications and shell.

![Linux Kernel Structure][3]

To understand that, I’ll use the same analogy that I had used in my [detailed guide on what is Linux][4]. Think of operating systems as vehicles and kernel as engine. You cannot drive an engine directly. Similarly, you cannot use kernel directly.

![Operating System Analogy][5]

A Linux distribution can be seen as a vehicle manufacturer like Toyota or Ford that provides you ready to use cars just like Ubuntu or Fedora distributions provide you a ready to use operating systems based on Linux.

### What is GNU/Linux?

Take a look at this picture once again. What [Linus Torvalds][6] created in 1991 is just the innermost circle, i.e. the Linux kernel.

![Linux Kernel Structure][3]

To use Linux even in the most primitive form (without even a GUI), you need a shell. Most commonly, it is Bash shell.

And then, you need to run some commands in the shell to do some work. Can you recall some basic Linux commands? There is cat, cp, mv, grep find, diff, gzip and more.

Technically, not all of these so called ‘Linux commands’ belong to Linux exclusively. A lot of them originate mainly from the UNIX operating system.

Even before Linux came into existence, Richard Stallman had created the GNU (recursive acronym for GNU is not Unix) project, the first of the free software project, in 1983. The [GNU project][7] implemented many of the popular Unix utilities like cat, grep, awk, shell (bash) along with developing their own compilers (GCC) and editors (Emacs).

Back in the 80s UNIX was proprietary and super expensive. This is why Linus Torvalds developed a new kernel that was like UNIX. To interact with the Linux kernel, Torvalds used GNU tools which were available for free under their open source GPL license.

With the GNU tools, it also behaved like UNIX. This is the reason why Linux is also termed as UNIX-like operating system.

You cannot imagine Linux without the shell and all those commands. Since Linux integrates deeply with the GNU tools, almost dependent on it, the purists demand that GNU should get its fair share of recognition and this is why they insist on calling it GNU Linux (written as GNU/Linux).

### Conclusion

![][8]

So, what is the correct term? Linux, GNU/Linux, Linux distribution, Linux distro, Linux based operating system or UNIX-like operating system? I say it depends on you and the context. I have provided you enough detail so that you have a better understanding of these related terms.

I hope you are liking this **Linux Jargon Buster** series and learning new things. Your feedback and suggestions are welcome.

--------------------------------------------------------------------------------

via: https://itsfoss.com/what-is-linux-distribution/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.gnu.org/manual/blurbs.html
[2]: https://itsfoss.com/what-is-desktop-environment/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/Linux_Kernel_structure.png?resize=800%2C350&ssl=1
[4]: https://itsfoss.com/what-is-linux/
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/operating_system_analogy.png?resize=800%2C350&ssl=1
[6]: https://itsfoss.com/linus-torvalds-facts/
[7]: https://www.gnu.org/gnu/thegnuproject.en.html
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/09/what-is-linux-distribution.png?resize=800%2C450&ssl=1
