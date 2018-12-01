Name1e5s translating.
The Source History of Cat
======
I once had a debate with members of my extended family about whether a computer science degree is a degree worth pursuing. I was in college at the time and trying to decide whether I should major in computer science. My aunt and a cousin of mine believed that I shouldn’t. They conceded that knowing how to program is of course a useful and lucrative thing, but they argued that the field of computer science advances so quickly that everything I learned would almost immediately be outdated. Better to pick up programming on the side and instead major in a field like economics or physics where the basic principles would be applicable throughout my lifetime.

I knew that my aunt and cousin were wrong and decided to major in computer science. (Sorry, aunt and cousin!) It is easy to see why the average person might believe that a field like computer science, or a profession like software engineering, completely reinvents itself every few years. We had personal computers, then the web, then phones, then machine learning… technology is always changing, so surely all the underlying principles and techniques change too. Of course, the amazing thing is how little actually changes. Most people, I’m sure, would be stunned to know just how old some of the important software on their computer really is. I’m not talking about flashy application software, admittedly—my copy of Firefox, the program I probably use the most on my computer, is not even two weeks old. But, if you pull up the manual page for something like `grep`, you will see that it has not been updated since 2010 (at least on MacOS). And the original version of `grep` was written in 1974, which in the computing world was back when dinosaurs roamed Silicon Valley. People (and programs) still depend on `grep` every day.

My aunt and cousin thought of computer technology as a series of increasingly elaborate sand castles supplanting one another after each high tide clears the beach. The reality, at least in many areas, is that we steadily accumulate programs that have solved problems. We might have to occasionally modify these programs to avoid software rot, but otherwise they can be left alone. `grep` is a simple program that solves a still-relevant problem, so it survives. Most application programming is done at a very high level, atop a pyramid of much older code solving much older problems. The ideas and concepts of 30 or 40 years ago, far from being obsolete today, have in many cases been embodied in software that you can still find installed on your laptop.

I thought it would be interesting to take a look at one such old program and see how much it had changed since it was first written. `cat` is maybe the simplest of all the Unix utilities, so I’m going to use it as my example. Ken Thompson wrote the original implementation of `cat` in 1969. If I were to tell somebody that I have a program on my computer from 1969, would that be accurate? How much has `cat` really evolved over the decades? How old is the software on our computers?

Thanks to repositories like [this one][1], we can see exactly how `cat` has evolved since 1969. I’m going to focus on implementations of `cat` that are ancestors of the implementation I have on my Macbook. You will see, as we trace `cat` from the first versions of Unix down to the `cat` in MacOS today, that the program has been rewritten more times than you might expect—but it ultimately works more or less the same way it did fifty years ago.

### Research Unix

Ken Thompson and Dennis Ritchie began writing Unix on a PDP 7. This was in 1969, before C, so all of the early Unix software was written in PDP 7 assembly. The exact flavor of assembly they used was unique to Unix, since Ken Thompson wrote his own assembler that added some features on top of the assembler provided by DEC, the PDP 7’s manufacturer. Thompson’s changes are all documented in [the original Unix Programmer’s Manual][2] under the entry for `as`, the assembler.

[The first implementation][3] of `cat` is thus in PDP 7 assembly. I’ve added comments that try to explain what each instruction is doing, but the program is still difficult to follow unless you understand some of the extensions Thompson made while writing his assembler. There are two important ones. First, the `;` character can be used to separate multiple statements on the same line. It appears that this was used most often to put system call arguments on the same line as the `sys` instruction. Second, Thompson added support for “temporary labels” using the digits 0 through 9. These are labels that can be reused throughout a program, thus being, according to the Unix Programmer’s Manual, “less taxing both on the imagination of the programmer and on the symbol space of the assembler.” From any given instruction, you can refer to the next or most recent temporary label `n` using `nf` and `nb` respectively. For example, if you have some code in a block labeled `1:`, you can jump back to that block from further down by using the instruction `jmp 1b`. (But you cannot jump forward to that block from above without using `jmp 1f` instead.)

The most interesting thing about this first version of `cat` is that it contains two names we should recognize. There is a block of instructions labeled `getc` and a block of instructions labeled `putc`, demonstrating that these names are older than the C standard library. The first version of `cat` actually contained implementations of both functions. The implementations buffered input so that reads and writes were not done a character at a time.

The first version of `cat` did not last long. Ken Thompson and Dennis Ritchie were able to persuade Bell Labs to buy them a PDP 11 so that they could continue to expand and improve Unix. The PDP 11 had a different instruction set, so `cat` had to be rewritten. I’ve marked up [this second version][4] of `cat` with comments as well. It uses new assembler mnemonics for the new instruction set and takes advantage of the PDP 11’s various [addressing modes][5]. (If you are confused by the parentheses and dollar signs in the source code, those are used to indicate different addressing modes.) But it also leverages the `;` character and temporary labels just like the first version of `cat`, meaning that these features must have been retained when `as` was adapted for the PDP 11.

The second version of `cat` is significantly simpler than the first. It is also more “Unix-y” in that it doesn’t just expect a list of filename arguments—it will, when given no arguments, read from `stdin`, which is what `cat` still does today. You can also give this version of `cat` an argument of `-` to indicate that it should read from `stdin`.

In 1973, in preparation for the release of the Fourth Edition of Unix, much of Unix was rewritten in C. But `cat` does not seem to have been rewritten in C until a while after that. [The first C implementation][6] of `cat` only shows up in the Seventh Edition of Unix. This implementation is really fun to look through because it is so simple. Of all the implementations to follow, this one most resembles the idealized `cat` used as a pedagogic demonstration in K&R C. The heart of the program is the classic two-liner:

```
while ((c = getc(fi)) != EOF)
 putchar(c);
```

There is of course quite a bit more code than that, but the extra code is mostly there to ensure that you aren’t reading and writing to the same file. The other interesting thing to note is that this implementation of `cat` only recognized one flag, `-u`. The `-u` flag could be used to avoid buffering input and output, which `cat` would otherwise do in blocks of 512 bytes.

### BSD

After the Seventh Edition, Unix spawned all sorts of derivatives and offshoots. MacOS is built on top of Darwin, which in turn is derived from the Berkeley Software Distribution (BSD), so BSD is the Unix offshoot we are most interested in. BSD was originally just a collection of useful programs and add-ons for Unix, but it eventually became a complete operating system. BSD seems to have relied on the original `cat` implementation up until the fourth BSD release, known as 4BSD, when support was added for a whole slew of new flags. [The 4BSD implementation][7] of `cat` is clearly derived from the original implementation, though it adds a new function to implement the behavior triggered by the new flags. The naming conventions already used in the file were adhered to—the `fflg` variable, used to mark whether input was being read from `stdin` or a file, was joined by `nflg`, `bflg`, `vflg`, `sflg`, `eflg`, and `tflg`, all there to record whether or not each new flag was supplied in the invocation of the program. These were the last command-line flags added to `cat`; the man page for `cat` today lists these flags and no others, at least on Mac OS. 4BSD was released in 1980, so this set of flags is 38 years old.

`cat` would be entirely rewritten a final time for BSD Net/2, which was, among other things, an attempt to avoid licensing issues by replacing all AT&T Unix-derived code with new code. BSD Net/2 was released in 1991. This final rewrite of `cat` was done by Kevin Fall, who graduated from Berkeley in 1988 and spent the next year working as a staff member at the Computer Systems Research Group (CSRG). Fall told me that a list of Unix utilities still implemented using AT&T code was put up on a wall at CSRG and staff were told to pick the utilities they wanted to reimplement. Fall picked `cat` and `mknod`. The `cat` implementation bundled with MacOS today is built from a source file that still bears his name at the very top. His version of `cat`, even though it is a relatively trivial program, is today used by millions.

[Fall’s original implementation][8] of `cat` is much longer than anything we have seen so far. Other than support for a `-?` help flag, it adds nothing in the way of new functionality. Conceptually, it is very similar to the 4BSD implementation. It is only longer because Fall separates the implementation into a “raw” mode and a “cooked” mode. The “raw” mode is `cat` classic; it prints a file character for character. The “cooked” mode is `cat` with all the 4BSD command-line options. The distinction makes sense but it also pads out the implementation so that it seems more complex at first glance than it actually is. There is also a fancy error handling function at the end of the file that further adds to its length.

### MacOS

In 2001, Apple launched Mac OS X. The launch was an important one for Apple, because Apple had spent many years trying and failing to replace its existing operating system (classic Mac OS), which had long been showing its age. There were two previous attempts to create a new operating system internally, but both went nowhere; in the end, Apple bought NeXT, Steve Jobs’ company, which had developed an operating system and object-oriented programming framework called NeXTSTEP. Apple took NeXTSTEP and used it as a basis for Mac OS X. NeXTSTEP was in part built on BSD, so using NeXTSTEP as a starting point for Mac OS X brought BSD-derived code right into the center of the Apple universe.

The very first release of Mac OS X thus includes [an implementation][9] of `cat` pulled from the NetBSD project. NetBSD, which remains in development today, began as a fork of 386BSD, which in turn was based directly on BSD Net/2. So the first Mac OS X implementation of `cat` is Kevin Fall’s `cat`. The only thing that had changed over the intervening decade was that Fall’s error-handling function `err()` was removed and the `err()` function made available by `err.h` was used in its place. `err.h` is a BSD extension to the C standard library.

The NetBSD implementation of `cat` was later swapped out for FreeBSD’s implementation of `cat`. [According to Wikipedia][10], Apple began using FreeBSD instead of NetBSD in Mac OS X 10.3 (Panther). But the Mac OS X implementation of `cat`, according to Apple’s own open source releases, was not replaced until Mac OS X 10.5 (Leopard) was released in 2007. The [FreeBSD implementation][11] that Apple swapped in for the Leopard release is the same implementation on Apple computers today. As of 2018, the implementation has not been updated or changed at all since 2007.

So the Mac OS `cat` is old. As it happens, it is actually two years older than its 2007 appearance in MacOS X would suggest. [This 2005 change][12], which is visible in FreeBSD’s Github mirror, was the last change made to FreeBSD’s `cat` before Apple pulled it into Mac OS X. So the Mac OS X `cat` implementation, which has not been kept in sync with FreeBSD’s `cat` implementation, is officially 13 years old. There’s a larger debate to be had about how much software can change before it really counts as the same software; in this case, the source file has not changed at all since 2005.

The `cat` implementation used by Mac OS today is not that different from the implementation that Fall wrote for the 1991 BSD Net/2 release. The biggest difference is that a whole new function was added to provide Unix domain socket support. At some point, a FreeBSD developer also seems to have decided that Fall’s `raw_args()` function and `cook_args()` should be combined into a single function called `scanfiles()`. Otherwise, the heart of the program is still Fall’s code.

I asked Fall how he felt about having written the `cat` implementation now used by millions of Apple users, either directly or indirectly through some program that relies on `cat` being present. Fall, who is now a consultant and a co-author of the most recent editions of TCP/IP Illustrated, says that he is surprised when people get such a thrill out of learning about his work on `cat`. Fall has had a long career in computing and has worked on many high-profile projects, but it seems that many people still get most excited about the six months of work he put into rewriting `cat` in 1989.

### The Hundred-Year-Old Program

In the grand scheme of things, computers are not an old invention. We’re used to hundred-year-old photographs or even hundred-year-old camera footage. But computer programs are in a different category—they’re high-tech and new. At least, they are now. As the computing industry matures, will we someday find ourselves using programs that approach the hundred-year-old mark?

Computer hardware will presumably change enough that we won’t be able to take an executable compiled today and run it on hardware a century from now. Perhaps advances in programming language design will also mean that nobody will understand C in the future and `cat` will have long since been rewritten in another language. (Though C has already been around for fifty years, and it doesn’t look like it is about to be replaced any time soon.) But barring all that, why not just keep using the `cat` we have forever?

I think the history of `cat` shows that some ideas in computer science are very durable indeed. Indeed, with `cat`, both the idea and the program itself are old. It may not be accurate to say that the `cat` on my computer is from 1969. But I could make a case for saying that the `cat` on my computer is from 1989, when Fall wrote his implementation of `cat`. Lots of other software is just as ancient. So maybe we shouldn’t think of computer science and software development primarily as fields that disrupt the status quo and invent new things. Our computer systems are built out of historical artifacts. At some point, we may all spend more time trying to understand and maintain those historical artifacts than we spend writing new code.

If you enjoyed this post, more like it come out every two weeks! Follow [@TwoBitHistory][13] on Twitter or subscribe to the [RSS feed][14] to make sure you know when a new post is out.


--------------------------------------------------------------------------------

via: https://twobithistory.org/2018/11/12/cat.html

作者：[Two-Bit History][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://twobithistory.org
[b]: https://github.com/lujun9972
[1]: https://github.com/dspinellis/unix-history-repo
[2]: https://www.bell-labs.com/usr/dmr/www/man11.pdf
[3]: https://gist.github.com/sinclairtarget/47143ba52b9d9e360d8db3762ee0cbf5#file-1-cat-pdp7-s
[4]: https://gist.github.com/sinclairtarget/47143ba52b9d9e360d8db3762ee0cbf5#file-2-cat-pdp11-s
[5]: https://en.wikipedia.org/wiki/PDP-11_architecture#Addressing_modes
[6]: https://gist.github.com/sinclairtarget/47143ba52b9d9e360d8db3762ee0cbf5#file-3-cat-v7-c
[7]: https://gist.github.com/sinclairtarget/47143ba52b9d9e360d8db3762ee0cbf5#file-4-cat-bsd4-c
[8]: https://gist.github.com/sinclairtarget/47143ba52b9d9e360d8db3762ee0cbf5#file-5-cat-net2-c
[9]: https://gist.github.com/sinclairtarget/47143ba52b9d9e360d8db3762ee0cbf5#file-6-cat-macosx-c
[10]: https://en.wikipedia.org/wiki/Darwin_(operating_system)
[11]: https://gist.github.com/sinclairtarget/47143ba52b9d9e360d8db3762ee0cbf5#file-7-cat-macos-10-13-c
[12]: https://github.com/freebsd/freebsd/commit/a76898b84970888a6fd015e15721f65815ea119a#diff-6e405d5ab5b47ca2a131ac7955e5a16b
[13]: https://twitter.com/TwoBitHistory
[14]: https://twobithistory.org/feed.xml
[15]: https://twitter.com/TwoBitHistory/status/1051826516844322821?ref_src=twsrc%5Etfw
