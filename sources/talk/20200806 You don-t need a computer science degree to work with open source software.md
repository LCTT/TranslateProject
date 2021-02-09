[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (You don't need a computer science degree to work with open source software)
[#]: via: (https://opensource.com/article/20/8/learn-open-source)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)

You don't need a computer science degree to work with open source software
======
Open source makes software knowledge accessible to anyone, so formal
training isn't the only path to a technology career.
![Stack of books for reading][1]

I am mostly a self-taught programmer. When I was growing up in the late 1970s, our elementary school had a small resource room with an Apple II computer. My brother and I fell into a group of friends that liked computers, and we all helped each other learn the system.

We showed such promise that our parents bought us an Apple II+ clone called the Franklin ACE 1000. My brother and I taught ourselves how to program in AppleSoft BASIC. Our parents bought us books, and we devoured them. I learned every corner of BASIC by reading about something in the book, then writing a practice program. My favorite pastime was writing simulations and games.

I stayed with BASIC for a long time. Our next computer was an IBM PC clone with a version of BASIC on it. Much later, MS-DOS 5 introduced QBasic, which was a modern version of BASIC that finally eliminated line numbers.

I began to learn other programming languages when I entered university. I was a physics student, and as part of our numerical analysis prerequisite, we had to learn Fortran. Having already learned BASIC, I thought Fortran was pretty easy to pick up. Fortran and BASIC were very similar, although Fortran was more limited in my experience.

My brother was a computer science major at a different university, and he introduced me to the C programming language. I immediately loved working in C! It was a straightforward programming language that gave me a ton of flexibility for writing useful programs. But I didn't have room in my degree program to take a class that didn't apply to my physics major. So, instead, I taught myself C by reading books and combing through the library reference guide. Each time I wanted to learn a new topic, I looked it up in the reference guide and wrote a practice program to exercise my new knowledge.

My early use of C was writing new utilities to expand MS-DOS. I used Unix on campus, but my computer at home mostly ran MS-DOS. I wanted MS-DOS to have similar enhanced command-line features that Unix offered, so I wrote my own utilities to give me the added functionality.

I suppose my first tools were pretty simple programming exercises. I used programs like Unix cat or DOS TYPE to display the contents of text files, with extra command-line options to add line numbers, convert tabs to spaces, and the like. Or I'd use a program like Unix clear or DOS CLS to clear the screen, but also set the colors to something other than the usual white-on-black text. And I wrote a few new utilities to help me with my studies, like a program to find common errors in a Fortran source file, a utility to organize files in a directory, a filter to convert nroff files to LaTeX format, and a program to fit a straight line through x and y data points.

Armed with this limited experience in C programming, I tackled my first big open source project. It turns out you can accomplish a lot if you don't know what you don't know and have a passion for a project. That's how I created the [FreeDOS Project][2] in 1994.

Since then, I've written, maintained, or otherwise contributed to dozens of open source projects on FreeDOS, Linux, and Big Unix. My first contribution was a fix to GNU Emacs so it would compile correctly on a DomainOS Unix system. I also submitted patches to an early open source C compiler specific to HP-UX, a fun artillery game with cartoony tanks, a utility to organize music on an iPod, and other Unix and Linux programs. On FreeDOS, I wrote much of the underlying code libraries we used at the time, including an implementation of Unix catgets, so FreeDOS programs could support different spoken languages without having to be rewritten.

Over time, I leveraged what I'd learned to pick up other programming languages. I wrote a ton of Unix Korn shell scripts, Linux Bash scripts, and AWK scripts. I wrote small utilities in Perl, and later wrote Perl CGI and PHP pages for websites. I learned enough LISP to tweak my copy of GNU Emacs, and enough Scheme to work on a project that used GNU Guile. And I continued to write and share open source games, applications, utilities, and tools for Linux and FreeDOS.

And as I wrote more code, I got better at programming. Even today, I continue to learn new things and reinforce those lessons by [teaching others][3]. I'm always trying new things out.

And that's my lesson. You don't have to be formally trained in computer science or hold a CS degree to contribute to open source software. Find your passion, and you can figure out the rest on your own. All that matters is that you love doing what you do and that you're willing to share your contribution with others.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/8/learn-open-source

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/books_read_list_stack_study.png?itok=GZxb9OAv (Stack of books for reading)
[2]: https://opensource.com/article/17/10/freedos
[3]: https://opensource.com/article/20/7/teaching-c
