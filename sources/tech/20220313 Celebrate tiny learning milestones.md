[#]: subject: "Celebrate tiny learning milestones"
[#]: via: "https://jvns.ca/blog/2022/03/13/celebrate-tiny-learning-milestones/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Celebrate tiny learning milestones
======

Hello! Today I want to talk about – how do you know you’re getting better at programming?

One obvious approach is:

  1. make goals
  2. periodically check if you achieved those goals
  3. if you did, celebrate



### I kind of hate goals

Goals can be useful, but a lot of the time I actually find them stressful and not that helpful. For example, here are a few goals I wrote down for myself 9 years ago:

  * write a nontrivial amount of C code that works and is used by actual people
  * contribute to an open source project in C
  * learn C++



9 years later, I have done 0 of those things. With the “goal” framing, it’s to think of this as a bad thing! Like, I wanted to learn C++ and I didn’t! I still can’t write C comfortably! Oh no! I guess I failed!

I find this framing depressing and unhelpful. In reality, I didn’t have any real reason to learn C++ then and I still don’t now. So it makes sense that I haven’t learned it.

Instead of goals, I like to think about **tiny milestones**.

### what’s a milestone?

Usually when we talk about milestones we mean something big, like “I graduated from university”.

But in this post I want to talk about milestones in the sense of its etymology – **stones** placed every **mile** on a highway, so that you can track your progress along a path.

These happen much more often – maybe you used a new tool for the first time, or you fixed a new type of bug that you’ve never seen before, or you learned about a new concept!

### a few of my tiny C milestones

Here are a few examples of tiny milestones from the last 9 years that are spiritually related to my original “learn C/C++” goals.

  * wrote a very basic shell in C
  * wrote a tiny Linux kernel module
  * learned about `strace`
  * learned how ELF binaries are organized (symbols, sections, etc)
  * learned what DWARF debugging symbols are and how they work
  * found a Mac kernel bug and managed to [write a program reproducing it in C][1]
  * learned how to use `gdb` to inspect a C program’s memory
  * implemented a buffer overflow exploit using `gdb` and `strace` (for a CTF)
  * wrote a [computers are fast][2] game
  * got a core dump for a crashing C++ program and managed to get a stack trace out of it
  * wrote an accurate bug report for a C++ program that had a memory leak, which resulted in the maintainers fixing the bug
  * learned about the RAII pattern (though in Rust, not C++)
  * pair programmed with a friend on implementing some Advent of Code problems in x86 assembly
  * in general I’m comfortable writing very basic C programs as long as they don’t have to do anything fancy like “memory management”



And there were even some major milestones, like I wrote a [Ruby profiler][3] in Rust in 2018.

When I think about it this way, I feel really good about my skills! I’ve learned all kinds of stuff related to systems programming, it just happened in a different way than I originally expected.

### changing goals isn’t a bad thing

The reason I still haven’t learned C isn’t that I suck or that C is impossible to learn. It’s just that learning how to write C well was never actually something I had a real reason to do.

Instead I learned Rust and Go and `strace` and `gdb` and about C structs and symbols and the call stack and the heap and lots of other things. (as an aside, I loved this paper [Some were meant for C][4] about how why C is still so important)

And that worked great! So I think it’s much more healthy to be flexible about your goals and to celebrate the milestones you do end up getting to instead of feeling bad about goals that you “failed” at.

### celebrate your tiny milestones

It’s really helpful for me to **celebrate** tiny milestones like this. I celebrate a lot by writing blog posts – I wrote the above list mostly by looking at my list of old blog posts for things I’d written about related to C.

If you don’t blog (it’s definitely not for everyone!), it can be helpful to write down this kind of thing in your [brag document][5] instead.

But I do think it’s important to celebrate these milestones _somewhere_. It gives me a real sense that I’m making progress and it helps me stay motivated to keep learning about the thing.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2022/03/13/celebrate-tiny-learning-milestones/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://jvns.ca/blog/2018/01/28/mac-freeze/
[2]: https://computers-are-fast.github.io/
[3]: https://github.com/rbspy/rbspy
[4]: https://www.humprog.org/~stephen/research/papers/kell17some-preprint.pdf
[5]: https://jvns.ca/blog/brag-documents/
