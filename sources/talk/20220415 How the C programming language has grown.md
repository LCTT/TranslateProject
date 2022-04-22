[#]: subject: "How the C programming language has grown"
[#]: via: "https://opensource.com/article/22/3/how-c-programming-language-has-grown"
[#]: author: "Jim Hall https://opensource.com/users/jim-hall"
[#]: collector: "lkxed"
[#]: translator: "lkxed"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How the C programming language has grown
======
Here's my interview with Brian Kernighan, co-author (with Dennis Ritchie) of The C Programming Language book, to discuss the C programming language and its 50-year history.

![The original C programming guide by two of the language authors, circa 1978][1]

The C programming language will turn fifty years old in 2022. Yet despite its long history, C remains one of the top "most-used" programming languages in many "popular programming languages" surveys. For example, check out the [TIOBE Index][2], which tracks the popularity of different programming languages. Many Linux applications are written in C, such as the GNOME desktop.

I interviewed [Brian Kernighan][3], co-author (with Dennis Ritchie) of *The C Programming Language* book, to learn more about the C programming language and its history.

**Where did the C programming language come from?**

C is an evolution of a sequence of languages intended for system programming—that is, writing programs like compilers, assemblers, editors, and ultimately operating systems. The Multics project at MIT, with Bell Labs as a partner, planned to write everything in a high-level language (a new idea at the time, roughly 1965). They were going to use IBM's PL/1, but it was very complicated, and the promised compilers didn't arrive in time.

After a brief flirtation with a subset called EPL (by Doug McIlroy of Bell Labs), Multics turned to BCPL, a much simpler and cleaner language designed and implemented by Martin Richards of Cambridge, who I think was visiting MIT at the time. When Ken Thompson started working on what became Unix, he created an even simpler language, based on BCPL, that he called B. He implemented it for the PDP-7 used for the first proto-Unix system in 1969.

BCPL and B were both "typeless" languages; that is, they had only one data type, integer. The DEC PDP-11, which arrived on the scene in about 1971 and was the computer for the first real Unix implementation, supported several data types, notably 8-bit bytes as well as 16-bit integers. For that, a language that also supported several data types was a better fit. That's the origin of C.

**How was C used within Bell Labs and the early versions of Unix?**

C was originally used only on Unix, though after a while, there were also C compilers for other machines and operating systems. Mostly it was used for system-programming applications, which covered quite a spectrum of interesting areas, along with a lot of systems for managing operations of AT&T's telephone network.

**What was the most interesting project written in C at Bell Labs?**

Arguably, the most interesting, memorable, and important C program was the Unix operating system itself. The first version of Unix in 1971 was in PDP-11 assembly language, but by the time of the fourth edition, around 1973, it was rewritten in C. That was truly crucial since it meant that the operating system (and all its supporting software) could be ported to a different kind of computer basically by recompiling everything. Not quite that simple in practice, but not far off.

**You co-authored The C Programming Language book with Dennis Ritchie. How did that book come about, and how did you and Dennis collaborate on the book?**

I had written a tutorial on Ken Thompson's B language to help people get started with it. I upgraded that to a tutorial on C when it became available. And after a while, I twisted Dennis's arm to write a C book with me. Basically, I wrote most of the tutorial material, except for the system call chapter, and Dennis had already written the reference manual, which was excellent. Then we worked back and forth to smooth out the tutorial parts; the reference manual stayed pretty much the same since it was so well done from the beginning. The book was formatted with the *troff* formatter, one of many tools on Unix, and I did most of the formatting work.

**When did C become a thing that other programmers outside of Bell Labs used for their work?**

I don't really remember well at this point, but I think C mostly followed along with Unix for the first half dozen years or so. With the development of compilers for other operating systems, it began to spread to other systems besides Unix. I don't recall when we realized that C and Unix were having a real effect, but it must have been in the mid to late 1970s.

**Why did C become such an influential programming language?**

The primary reason in the early days was its association with Unix, which spread rapidly. If you used Unix, you wrote in C. Later on, C spread to computers that might not necessarily run Unix, though many did because of the portable C compiler that Steve Johnson wrote. The workstation market, with companies like Sun Microsystems, MIPS (which became SGI), and others, was enabled by the combination of Unix and C. The IBM PC came somewhat later, about 1982, and C became one of the standard languages, under MS-DOS and then Windows. And today, most Internet of Things (IoT) devices will use C.

**C remains a popular programming language today, some 50 years after its creation. Why has C remained so popular?**

I think C hit a sweet spot with efficiency and expressiveness. In earlier times, efficiency really mattered since computers were slow and had limited memory compared to what we are used to today. C was very efficient, in the sense that it could be compiled into efficient machine code, and it was simple enough that it was easy to see how to compile it. At the same time, it was very expressive, easy to write, and compact. No other language has hit that kind of spot quite so well, at least in my humble but correct opinion.

**How has the C programming language grown or changed over the years?**

C has grown modestly, I guess, but I haven't paid much attention to the evolving C standards. There are enough changes that code written in the 1980s needs a bit of work before it will compile, but it's mostly related to being honest about types. Newer features like complex numbers are perhaps useful, but not to me, so I can't make an informed comment.

**What programming problems can be solved most easily in C?**

Well, it's a good language for anything, but today, with lots of memory and processing power, most programmers are well served by languages like Python that take care of memory management and other more high-level constructs. C remains a good choice for lower levels where squeezing cycles and bytes still matter.

**C has influenced other programming languages, including C++, Java, Go, and Rust. What are your thoughts on these other programming languages?**

Almost every language is in some ways a reaction to its predecessors. To over-simplify a fair amount, C++ adds mechanisms to control access to information, so it's better than C for really large programs. [Java][4] is a reaction to the perceived complexity of C++. Go is a reaction to the complexity of C++ and the restrictions of [Java][4]. [Rust][5] is an attempt to deal with memory management issues in C (and presumably C++) while coming close to C's efficiency.

They all have real positive attributes, but somehow no one is ever quite satisfied, so there will always be more languages that, in their turn, react to what has gone before. At the same time, the older languages, for the most part, will remain around because they do their job well, and there's an embedded base where they are perfectly fine, and it would be infeasible to reimplement in something newer.

Thanks to Brian for sharing this great history of the C programming language!

Would you like to learn C programming? Start with these popular C programming articles from the last year: [5 ways to learn the C programming language in 2022][6].

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/3/how-c-programming-language-has-grown

作者：[Jim Hall][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/uploads/2482009942_6caea217e0_c.jpg
[2]: https://www.tiobe.com/tiobe-index/
[3]: https://opensource.com/article/22/1/interview-brian-kernighan
[4]: https://opensource.com/tags/java
[5]: https://opensource.com/tags/rust
[6]: https://opensource.com/article/22/1/c-programming
