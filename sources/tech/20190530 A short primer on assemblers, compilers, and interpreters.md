[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (A short primer on assemblers, compilers, and interpreters)
[#]: via: (https://opensource.com/article/19/5/primer-assemblers-compilers-interpreters)
[#]: author: (Erik O'Shaughnessy https://opensource.com/users/jnyjny/users/shawnhcorey/users/jnyjny/users/jnyjny)

A short primer on assemblers, compilers, and interpreters
======
A gentle introduction to the historical evolution of programming
practices.
![keyboard with connected dots][1]

In the early days of computing, hardware was expensive and programmers were cheap. In fact, programmers were so cheap they weren't even called "programmers" and were in fact usually mathematicians or electrical engineers. Early computers were used to solve complex mathematical problems quickly, so mathematicians were a natural fit for the job of "programming."

### What is a program?

First, a little background. Computers can't do anything by themselves, so they require programs to drive their behavior. Programs can be thought of as very detailed recipes that take an input and produce an output. The steps in the recipe are composed of instructions that operate on data. While that sounds complicated, you probably know how this statement works:


```
`1 + 2 = 3`
```

The plus sign is the "instruction" while the numbers 1 and 2 are the data. Mathematically, the equal sign indicates that both sides of an equation are "equivalent," however most computer languages use some variant of equals to mean "assignment." If a computer were executing that statement, it would store the results of the addition (the "3") somewhere in memory.

Computers know how to do math with numbers and move data around the machine's memory hierarchy. I won't say too much about memory except that it generally comes in two different flavors: fast/small and slow/big. CPU registers are very fast, very small and act as scratch pads. Main memory is typically very big and not nearly as fast as register memory. CPUs shuffle the data they are working with from main memory to registers and back again while a program executes.

### Assemblers

Computers were very expensive and people were cheap. Programmers spent endless hours translating hand-written math into computer instructions that the computer could execute. The very first computers had terrible user interfaces, some only consisting of toggle switches on the front panel. The switches represented 1s and 0s in a single "word" of memory. The programmer would configure a word, indicate where to store it, and commit the word to memory. It was time-consuming and error-prone.

![Programmers operate the ENIAC computer][2]

_Programmers[Betty Jean Jennings][3] (left) and [Fran Bilas][4] (right) operate [ENIAC's][5] main control panel._

Eventually, an [electrical engineer][6] decided his time wasn't cheap and wrote a program with input written as a "recipe" expressed in terms people could read that output a computer-readable version. This was the first "assembler" and it was very controversial. The people that owned the expensive machines didn't want to "waste" compute time on a task that people were already doing; albeit slowly and with errors. Over time, people came to appreciate the speed and accuracy of the assembler versus a hand-assembled program, and the amount of "real work" done with the computer increased.

While assembler programs were a big step up from toggling bit patterns into the front panel of a machine, they were still pretty specialized. The addition example above might have looked something like this:


```
01 MOV R0, 1
02 MOV R1, 2
03 ADD R0, R1, R2
04 MOV 64, R0
05 STO R2, R0
```

Each line is a computer instruction, beginning with a shorthand name of the instruction followed by the data the instruction works on. This little program will first "move" the value 1 into a register called R0, then 2 into register R1. Line 03 adds the contents of registers R0 and R1 and stores the resulting value into register R2. Finally, lines 04 and 05 identify where the result should be stored in main memory (address 64). Managing where data is stored in memory is one of the most time-consuming and error-prone parts of writing computer programs.

### Compilers

Assembly was much better than writing computer instructions by hand; however, early programmers yearned to write programs like they were accustomed to writing mathematical formulae. This drove the development of higher-level compiled languages, some of which are historical footnotes and others are still in use today. [ALGO][7] is one such footnote, while real problems continue to be solved today with languages like [Fortran][8] and [C][9].

![Genealogy tree of ALGO and Fortran][10]

Genealogy tree of ALGO and Fortran programming languages

The introduction of these "high-level" languages allowed programmers to write their programs in simpler terms. In the C language, our addition assembly program would be written:


```
int x;
x = 1 + 2;
```

The first statement describes a piece of memory the program will use. In this case, the memory should be the size of an integer and its name is **x** The second statement is the addition, although written "backward." A C programmer would read that as "X is assigned the result of one plus two." Notice the programmer doesn't need to say where to put **x** in memory, as the compiler takes care of that.

A new type of program called a "compiler" would turn the program written in a high-level language into an assembly language version and then run it through the assembler to produce a machine-readable version of the program. This composition of programs is often called a "toolchain," in that one program's output is sent directly to another program's input.

The huge advantage of compiled languages over assembly language programs was porting from one computer model or brand to another. In the early days of computing, there was an explosion of different types of computing hardware from companies like IBM, Digital Equipment Corporation, Texas Instruments, UNIVAC, Hewlett Packard, and others. None of these computers shared much in common besides needing to be plugged into an electrical power supply. Memory and CPU architectures differed wildly, and it often took man-years to translate programs from one computer to another.

With high-level languages, the compiler toolchain only had to be ported to the new platform. Once the compiler was available, high-level language programs could be recompiled for a new computer with little or no modification. Compilation of high-level languages was truly revolutionary.

![IBM PC XT][11]

IBM PC XT released in 1983, is an early example of the decreasing cost of hardware.

Life became very good for programmers. It was much easier to express the problems they wanted to solve using high-level languages. The cost of computer hardware was falling dramatically due to advances in semiconductors and the invention of integrated chips. Computers were getting faster and more capable, as well as much less expensive. At some point, possibly in the late '80s, there was an inversion and programmers became more expensive than the hardware they used.

### Interpreters

Over time, a new programming model rose where a special program called an "interpreter" would read a program and turn it into computer instructions to be executed immediately. The interpreter takes the program as input and interprets it into an intermediate form, much like a compiler. Unlike a compiler, the interpreter then executes the intermediate form of the program. This happens every time an interpreted program runs, whereas a compiled program is compiled just one time and the computer executes the machine instructions "as written."

As a side note, when people say "interpreted programs are slow," this is the main source of the perceived lack of performance. Modern computers are so amazingly capable that most people can't tell the difference between compiled and interpreted programs.

Interpreted programs, sometimes called "scripts," are even easier to port to different hardware platforms. Because the script doesn't contain any machine-specific instructions, a single version of a program can run on many different computers without changes. The catch, of course, is the interpreter must be ported to the new machine to make that possible.

One example of a very popular interpreted language is [perl][12]. A complete perl expression of our addition problem would be:


```
`$x = 1 + 2`
```

While it looks and acts much like the C version, it lacks the variable initialization statement. There are other differences (which are beyond the scope of this article), but you can see that we can write a computer program that is very close to how a mathematician would write it by hand with pencil and paper.

### Virtual Machines

The latest craze in programming models is the virtual machine, often abbreviated as VM. There are two flavors of virtual machine; system virtual machines and process virtual machines. Both types of VMs provide a level of abstraction from the "real" computing hardware, though they have different scopes. A system virtual machine is software that offers a substitute for the physical hardware, while a process virtual machine is designed to execute a program in a system-independent manner. So in this case, a process virtual machine (virtual machine from here on) is similar in scope to an interpreter in that a program is first compiled into an intermediated form before the virtual machine executes it.

The main difference between an interpreter and a virtual machine is the virtual machine implements an idealized CPU accessed through its virtual instruction set. This abstraction makes it possible to write front-end language tools that compile programs written in different languages and target the virtual machine. Probably the most popular and well known virtual machine is the Java Virtual Machine (JVM). The JVM was initially only for the Java programming language back in the 1990s, but it now hosts [many][13] popular computer languages: Scala, Jython, JRuby, Clojure, and Kotlin to list just a few. There are other examples that may not be common knowledge. I only recently learned that my favorite language, [Python][14], is not an interpreted language, but a [language hosted on a virtual machine][15]!

Virtual machines continue the historical trend of reducing the amount of platform-specific knowledge a programmer needs to express their problem in a language that supports their domain-specific needs.

### That's a wrap

I hope you enjoy this primer on some of the less visible parts of software. Are there other topics you want me to dive into next? Let me know in the comments.

* * *

_This article was originally published on[PyBites][16] and is reprinted with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/5/primer-assemblers-compilers-interpreters

作者：[Erik O'Shaughnessy][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jnyjny/users/shawnhcorey/users/jnyjny/users/jnyjny
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming_keyboard_coding.png?itok=E0Vvam7A (keyboard with connected dots)
[2]: https://opensource.com/sites/default/files/uploads/two_women_operating_eniac.gif (Programmers operate the ENIAC computer)
[3]: https://en.wikipedia.org/wiki/Jean_Bartik (Jean Bartik)
[4]: https://en.wikipedia.org/wiki/Frances_Spence (Frances Spence)
[5]: https://en.wikipedia.org/wiki/ENIAC
[6]: https://en.wikipedia.org/wiki/Nathaniel_Rochester_%28computer_scientist%29
[7]: https://en.wikipedia.org/wiki/ALGO
[8]: https://en.wikipedia.org/wiki/Fortran
[9]: https://en.wikipedia.org/wiki/C_(programming_language)
[10]: https://opensource.com/sites/default/files/uploads/algolfortran_family-by-borkowski.png (Genealogy tree of ALGO and Fortran)
[11]: https://opensource.com/sites/default/files/uploads/639px-ibm_px_xt_color.jpg (IBM PC XT)
[12]: www.perl.org
[13]: https://en.wikipedia.org/wiki/List_of_JVM_languages
[14]: /resources/python
[15]: https://opensource.com/article/18/4/introduction-python-bytecode
[16]: https://pybit.es/python-interpreters.html
