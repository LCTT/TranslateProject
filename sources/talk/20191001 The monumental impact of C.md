[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (The monumental impact of C)
[#]: via: (https://opensource.com/article/19/10/command-line-heroes-c)
[#]: author: (Matthew Broberg https://opensource.com/users/mbbroberg)

The monumental impact of C
======
The season finale of Command Line Heroes offers a lesson in how a small
community of open source enthusiasts can change the world.
![In the finale of Command Line Heroes, we learn about the significant impact of C][1]

C is the original general-purpose programming language. The Season 3 finale of the [Command Line Heroes][2] podcast explores C's origin story in a way that showcases the longevity and power of its design. It's a perfect synthesis of all the languages discussed throughout the podcast's third season and this [series of articles][3].

![The original C programming guide by two of the language authors, circa 1978][4]

C is such a fundamental language that many of us forget how much it has changed. Technically a "high-level language," in the sense that it requires a compiler to be runnable, it's as close to assembly language as people like to get these days (outside of specialized, low-memory environments). It's also considered to be the language that made nearly all languages that came after it possible.

### The path to C began with failure

While the myth persists that all great inventions come from highly competitive garage dwellers, C's story is more fit for the Renaissance period.

In the 1960s, Bell Labs in suburban New Jersey was one of the most innovative places of its time. Jon Gertner, author of [_The idea factory_][5], describes the culture of the time marked by optimism and the excitement to solve tough problems. Instead of monetization pressures with tight timelines, Bell Labs offered seemingly endless funding for wild ideas. It had a research and development ethos that aligns well with today's [open leadership principles][6]. The results were significant and prove that brilliance can come without the promise of VC funding or an IPO.

The challenge back then was terminal sharing: finding a way for lots of people to access the (very limited number of) available computers. Before there was a scalable answer for that, and long before we had [a shell like Bash][7], there was the Multics project. It was a hypothetical operating system where hundreds or even thousands of developers could share time on the same system. This was a dream of John McCarty, creator of Lisp and the term artificial intelligence (AI), as I [recently explored][8].

Joy Lisi Ranken, author of [_A people's history of computing in the United States_][9], describes what happened next. There was a lot of public interest in driving forward with Multics' vision of more universally available timesharing. Academics, scientists, educators, and some in the broader public were looking forward to this computer-powered future. Many advocated for computing as a public utility, akin to electricity, and the push toward timesharing was a global movement.

Up to that point, high-end mainframes topped out at 40-50 terminals per system. The change of scale was ambitious and eventually failed, as Warren Toomey writes in [IEEE Spectrum][10]:

> "Over five years, AT&amp;T invested millions in the Multics project, purchasing a GE-645 mainframe computer and dedicating to the effort many of the top researchers at the company's renowned Bell Telephone Laboratories—including Thompson and Ritchie, Joseph F. Ossanna, Stuart Feldman, M. Douglas McIlroy, and the late Robert Morris. But the new system was too ambitious, and it fell troublingly behind schedule. In the end, AT&amp;T's corporate leaders decided to pull the plug."

Bell Labs pulled out of the Multics program in 1969. Multics wasn't going to happen.

### The fellowship of the C

Funding wrapped up, and the powerful GE645 mainframe was assigned to other tasks inside Bell Labs. But that didn't discourage everyone.

Among the last holdouts from the Multics project were four men who felt passionately tied to the project: Ken Thompson, Dennis Ritchie, Doug McIlroy, and J.F. Ossanna. These four diehards continued to muse and scribble ideas on paper. Thompson and Ritchie developed a game called Space Travel for the PDP-7 minicomputer. While they were working on that, Thompson started implementing all those crazy hand-written ideas about filesystems they'd developed among the wreckage of Multics.

![A PDP-7 minicomputer][11]

A PDP-7 minicomputer was not top of line technology at the time, but the team implemented foundational technologies that change the future of programming languages and operating systems alike.

That's worth emphasizing: Some of the original filesystem specifications were written by hand and then programmed on what was effectively a toy compared to the systems they were using to build Multics. [Wikipedia's Ken Thompson page][12] dives deeper into what came next:

> "While writing Multics, Thompson created the Bon programming language. He also created a video game called [Space Travel][13]. Later, Bell Labs withdrew from the MULTICS project. In order to go on playing the game, Thompson found an old [PDP-7][14] machine and rewrote Space Travel on it. Eventually, the tools developed by Thompson became the [Unix][15] [operating system][16]: Working on a PDP-7, a team of Bell Labs researchers led by Thompson and Ritchie, and including Rudd Canaday, developed a [hierarchical file system][17], the concepts of [computer processes][18] and [device files][19], a [command-line interpreter][20], [pipes][21] for easy inter-process communication, and some small utility programs. In 1970, [Brian Kernighan][22] suggested the name 'Unix,' in a pun on the name 'Multics.' After initial work on Unix, Thompson decided that Unix needed a system programming language and created [B][23], a precursor to Ritchie's [C][24]."

As Walter Toomey documented in the IEEE Spectrum article mentioned above, Unix showed promise in a way the Multics project never materialized. After winning over the team and doing a lot more programming, the pathway to Unix was paved.

### Getting from B to C in Unix

Thompson quickly created a Unix language he called B. B inherited much from its predecessor BCPL, but it wasn't enough of a breakaway from older languages. B didn't know data types, for starters. It's considered a typeless language, which meant its "Hello World" program looked like this:


```
main( ) {
extrn a, b, c;
putchar(a); putchar(b); putchar(c); putchar('!*n');
}

a 'hell';
b 'o, w';
c 'orld';
```

Even if you're not a programmer, it's clear that carving up strings four characters at a time would be limiting. It's also worth noting that this text is considered the original "Hello World" from Brian Kernighan's 1972 book, [_A tutorial introduction to the language B_][25] (although that claim is not definitive).

[![A diagram showing the key Unix and Unix-like operating systems][26]][27]

Typelessness aside, B's assembly-language counterparts were still yielding programs faster than was possible using the B compiler's threaded-code technique. So, from 1971 to 1973, Ritchie modified B. He added a "character type" and built a new compiler so that it didn't have to use threaded code anymore. After two years of work, B had become C.

### The right abstraction at the right time

C's use of types and ease of compiling down to efficient assembly code made it the perfect language for the rise of minicomputers, which speak in bytecode. B was eventually overtaken by C. Once C became the language of Unix, it became the de facto standard across the budding computer industry. Unix was _the_ sharing platform of the pre-internet days. The more people wrote C, the better it got, and the more it was adopted. It eventually became an open standard itself. According to the [Brief history of C programming language][28]:

> "For many years, the de facto standard for C was the version supplied with the Unix operating system. In the summer of 1983 a committee was established to create an ANSI (American National Standards Institute) standard that would define the C language. The standardization process took six years (much longer than anyone reasonably expected)."

How influential is C today? A [quick review][29] reveals:

  * Parts of all major operating systems are written in C, including macOS, Windows, Linux, and Android.
  * The world's most prolific databases, including DB2, MySQL, MS SQL, and PostgreSQL, are written in C.
  * Many programming-language specifics begun in C, including Python, Go, Perl's core interpreter, and the R statistical language.



Decades after they started as scrappy outsiders, Thompson and Ritchie are praised as titans of the programming world. They shared 1983's Turing Award, and in 1998, received the [National Medal of Science][30] for their work on the C language and Unix. 

![Ritchie and Thompson receiving the National Medal of Technology from President Clinton, 1998][31]

But Doug McIlroy and J.F. Ossanna deserve their share of praise, too. All four of them are true Command Line Heroes.

### Wrapping up the season

[Command Line Heroes][2] has completed an entire season of insights into the programming languages that affect how we code today. It's been a joy to learn about these languages and share them with you. I hope you've enjoyed it as well!

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/command-line-heroes-c

作者：[Matthew Broberg][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mbbroberg
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/commnad_line_hereos_ep8_header_opensourcedotcom.png?itok=d7MJQHFJ (In the finale of Command Line Heroes, we learn about the significant impact of C)
[2]: https://www.redhat.com/en/command-line-heroes
[3]: https://opensource.com/tags/command-line-heroes-podcast
[4]: https://opensource.com/sites/default/files/uploads/2482009942_6caea217e0_c.jpg (The original C programming guide by two of the language authors, circa 1978)
[5]: https://en.wikipedia.org/wiki/The_Idea_Factory
[6]: https://opensource.com/open-organization/18/12/what-is-open-leadership
[7]: https://opensource.com/19/9/command-line-heroes-bash
[8]: https://opensource.com/article/19/9/command-line-heroes-lisp
[9]: https://www.hup.harvard.edu/catalog.php?isbn=9780674970977
[10]: https://spectrum.ieee.org/tech-history/cyberspace/the-strange-birth-and-long-life-of-unix
[11]: https://opensource.com/sites/default/files/uploads/800px-pdp7-oslo-2005.jpeg (A PDP-7 minicomputer)
[12]: https://en.wikipedia.org/wiki/Ken_Thompson
[13]: https://en.wikipedia.org/wiki/Space_Travel_(video_game)
[14]: https://en.wikipedia.org/wiki/PDP-7
[15]: https://en.wikipedia.org/wiki/Unix
[16]: https://en.wikipedia.org/wiki/Operating_system
[17]: https://en.wikipedia.org/wiki/File_system#Aspects_of_file_systems
[18]: https://en.wikipedia.org/wiki/Process_(computing)
[19]: https://en.wikipedia.org/wiki/Device_file
[20]: https://en.wikipedia.org/wiki/Command-line_interface#Command-line_interpreter
[21]: https://en.wikipedia.org/wiki/Pipeline_(Unix)
[22]: https://en.wikipedia.org/wiki/Brian_Kernighan
[23]: https://en.wikipedia.org/wiki/B_(programming_language)
[24]: https://en.wikipedia.org/wiki/C_(programming_language)
[25]: https://www.bell-labs.com/usr/dmr/www/btut.pdf
[26]: https://opensource.com/sites/default/files/uploads/640px-unix_history-simple.svg_.png (A diagram showing the key Unix and Unix-like operating systems)
[27]: https://commons.wikimedia.org/w/index.php?curid=1801948
[28]: http://cs-fundamentals.com/c-programming/history-of-c-programming-language.php
[29]: https://www.toptal.com/c/after-all-these-years-the-world-is-still-powered-by-c-programming
[30]: https://www.nsf.gov/od/nms/medal.jsp
[31]: https://opensource.com/sites/default/files/uploads/medal.jpeg (Ritchie and Thompson receiving the National Medal of Technology from President Clinton, 1998)
