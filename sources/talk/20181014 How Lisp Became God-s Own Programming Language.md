thecyanbird translating

How Lisp Became God's Own Programming Language
======
When programmers discuss the relative merits of different programming languages, they often talk about them in prosaic terms as if they were so many tools in a tool belt—one might be more appropriate for systems programming, another might be more appropriate for gluing together other programs to accomplish some ad hoc task. This is as it should be. Languages have different strengths and claiming that a language is better than other languages without reference to a specific use case only invites an unproductive and vitriolic debate.

But there is one language that seems to inspire a peculiar universal reverence: Lisp. Keyboard crusaders that would otherwise pounce on anyone daring to suggest that some language is better than any other will concede that Lisp is on another level. Lisp transcends the utilitarian criteria used to judge other languages, because the median programmer has never used Lisp to build anything practical and probably never will, yet the reverence for Lisp runs so deep that Lisp is often ascribed mystical properties. Everyone’s favorite webcomic, xkcd, has depicted Lisp this way at least twice: In [one comic][1], a character reaches some sort of Lisp enlightenment, which appears to allow him to comprehend the fundamental structure of the universe. In [another comic][2], a robed, senescent programmer hands a stack of parentheses to his padawan, saying that the parentheses are “elegant weapons for a more civilized age,” suggesting that Lisp has all the occult power of the Force.

Another great example is Bob Kanefsky’s parody of a song called “God Lives on Terra.” His parody, written in the mid-1990s and called “Eternal Flame”, describes how God must have created the world using Lisp. The following is an excerpt, but the full set of lyrics can be found in the [GNU Humor Collection][3]:

> For God wrote in Lisp code
>  When he filled the leaves with green.
>  The fractal flowers and recursive roots:
>  The most lovely hack I’ve seen.
>  And when I ponder snowflakes,
>  never finding two the same,
>  I know God likes a language
>  with its own four-letter name.

I can only speak for myself, I suppose, but I think this “Lisp Is Arcane Magic” cultural meme is the most bizarre and fascinating thing ever. Lisp was concocted in the ivory tower as a tool for artificial intelligence research, so it was always going to be unfamiliar and maybe even a bit mysterious to the programming laity. But programmers now [urge each other to “try Lisp before you die”][4] as if it were some kind of mind-expanding psychedelic. They do this even though Lisp is now the second-oldest programming language in widespread use, younger only than Fortran, and even then by just one year. Imagine if your job were to promote some new programming language on behalf of the organization or team that created it. Wouldn’t it be great if you could convince everyone that your new language had divine powers? But how would you even do that? How does a programming language come to be known as a font of hidden knowledge?

How did Lisp get to be this way?

![Byte Magazine Cover, August, 1979.][5] 
The cover of Byte Magazine, August, 1979.

### Theory A: The Axiomatic Language

John McCarthy, Lisp’s creator, did not originally intend for Lisp to be an elegant distillation of the principles of computation. But, after one or two fortunate insights and a series of refinements, that’s what Lisp became. Paul Graham—we will talk about him some more later—has written that, with Lisp, McCarthy “did for programming something like what Euclid did for geometry.” People might see a deeper meaning in Lisp because McCarthy built Lisp out of parts so fundamental that it is hard to say whether he invented it or discovered it.

McCarthy began thinking about creating a language during the 1956 Darthmouth Summer Research Project on Artificial Intelligence. The Summer Research Project was in effect an ongoing, multi-week academic conference, the very first in the field of artificial intelligence. McCarthy, then an assistant professor of Mathematics at Dartmouth, had actually coined the term “artificial intelligence” when he proposed the event. About ten or so people attended the conference for its entire duration. Among them were Allen Newell and Herbert Simon, two researchers affiliated with the RAND Corporation and Carnegie Mellon that had just designed a language called IPL.

Newell and Simon had been trying to build a system capable of generating proofs in propositional calculus. They realized that it would be hard to do this while working at the level of the computer’s native instruction set, so they decided to create a language—or, as they called it, a “pseudo-code”—that would help them more naturally express the workings of their “Logic Theory Machine.” Their language, called IPL for “Information Processing Language”, was more of a high-level assembly dialect then a programming language in the sense we mean today. Newell and Simon, perhaps referring to Fortran, noted that other “pseudo-codes” then in development were “preoccupied” with representing equations in standard mathematical notation. Their language focused instead on representing sentences in propositional calculus as lists of symbolic expressions. Programs in IPL would basically leverage a series of assembly-language macros to manipulate and evaluate expressions within one or more of these lists.

McCarthy thought that having algebraic expressions in a language, Fortran-style, would be useful. So he didn’t like IPL very much. But he thought that symbolic lists were a good way to model problems in artificial intelligence, particularly problems involving deduction. This was the germ of McCarthy’s desire to create an algebraic list processing language, a language that would resemble Fortran but also be able to process symbolic lists like IPL.

Of course, Lisp today does not resemble Fortran. Over the next few years, McCarthy’s ideas about what an ideal list processing language should look like evolved. His ideas began to change in 1957, when he started writing routines for a chess-playing program in Fortran. The prolonged exposure to Fortran convinced McCarthy that there were several infelicities in its design, chief among them the awkward `IF` statement. McCarthy invented an alternative, the “true” conditional expression, which returns sub-expression A if the supplied test succeeds and sub-expression B if the supplied test fails and which also only evaluates the sub-expression that actually gets returned. During the summer of 1958, when McCarthy worked to design a program that could perform differentiation, he realized that his “true” conditional expression made writing recursive functions easier and more natural. The differentiation problem also prompted McCarthy to devise the maplist function, which takes another function as an argument and applies it to all the elements in a list. This was useful for differentiating sums of arbitrarily many terms.

None of these things could be expressed in Fortran, so, in the fall of 1958, McCarthy set some students to work implementing Lisp. Since McCarthy was now an assistant professor at MIT, these were all MIT students. As McCarthy and his students translated his ideas into running code, they made changes that further simplified the language. The biggest change involved Lisp’s syntax. McCarthy had originally intended for the language to include something called “M-expressions,” which would be a layer of syntactic sugar that made Lisp’s syntax resemble Fortran’s. Though M-expressions could be translated to S-expressions—the basic lists enclosed by parentheses that Lisp is known for— S-expressions were really a low-level representation meant for the machine. The only problem was that McCarthy had been denoting M-expressions using square brackets, and the IBM 026 keypunch that McCarthy’s team used at MIT did not have any square bracket keys on its keyboard. So the Lisp team stuck with S-expressions, using them to represent not just lists of data but function applications too. McCarthy and his students also made a few other simplifications, including a switch to prefix notation and a memory model change that meant the language only had one real type.

In 1960, McCarthy published his famous paper on Lisp called “Recursive Functions of Symbolic Expressions and Their Computation by Machine.” By that time, the language had been pared down to such a degree that McCarthy realized he had the makings of “an elegant mathematical system” and not just another programming language. He later wrote that the many simplifications that had been made to Lisp turned it “into a way of describing computable functions much neater than the Turing machines or the general recursive definitions used in recursive function theory.” In his paper, he therefore presented Lisp both as a working programming language and as a formalism for studying the behavior of recursive functions.

McCarthy explained Lisp to his readers by building it up out of only a very small collection of rules. Paul Graham later retraced McCarthy’s steps, using more readable language, in his essay [“The Roots of Lisp”][6]. Graham is able to explain Lisp using only seven primitive operators, two different notations for functions, and a half-dozen higher-level functions defined in terms of the primitive operators. That Lisp can be specified by such a small sequence of basic rules no doubt contributes to its mystique. Graham has called McCarthy’s paper an attempt to “axiomatize computation.” I think that is a great way to think about Lisp’s appeal. Whereas other languages have clearly artificial constructs denoted by reserved words like `while` or `typedef` or `public static void`, Lisp’s design almost seems entailed by the very logic of computing. This quality and Lisp’s original connection to a field as esoteric as “recursive function theory” should make it no surprise that Lisp has so much prestige today.

### Theory B: Machine of the Future

Two decades after its creation, Lisp had become, according to the famous [Hacker’s Dictionary][7], the “mother tongue” of artificial intelligence research. Early on, Lisp spread quickly, probably because its regular syntax made implementing it on new machines relatively straightforward. Later, researchers would keep using it because of how well it handled symbolic expressions, important in an era when so much of artificial intelligence was symbolic. Lisp was used in seminal artificial intelligence projects like the [SHRDLU natural language program][8], the [Macsyma algebra system][9], and the [ACL2 logic system][10].

By the mid-1970s, though, artificial intelligence researchers were running out of computer power. The PDP-10, in particular—everyone’s favorite machine for artificial intelligence work—had an 18-bit address space that increasingly was insufficient for Lisp AI programs. Many AI programs were also supposed to be interactive, and making a demanding interactive program perform well on a time-sharing system was challenging. The solution, originally proposed by Peter Deutsch at MIT, was to engineer a computer specifically designed to run Lisp programs. These Lisp machines, as I described in [my last post on Chaosnet][11], would give each user a dedicated processor optimized for Lisp. They would also eventually come with development environments written entirely in Lisp for hardcore Lisp programmers. Lisp machines, devised in an awkward moment at the tail of the minicomputer era but before the full flowering of the microcomputer revolution, were high-performance personal computers for the programming elite.

For a while, it seemed as if Lisp machines would be the wave of the future. Several companies sprang into existence and raced to commercialize the technology. The most successful of these companies was called Symbolics, founded by veterans of the MIT AI Lab. Throughout the 1980s, Symbolics produced a line of computers known as the 3600 series, which were popular in the AI field and in industries requiring high-powered computing. The 3600 series computers featured large screens, bit-mapped graphics, a mouse interface, and [powerful graphics and animation software][12]. These were impressive machines that enabled impressive programs. For example, Bob Culley, who worked in robotics research and contacted me via Twitter, was able to implement and visualize a path-finding algorithm on a Symbolics 3650 in 1985. He explained to me that bit-mapped graphics and object-oriented programming (available on Lisp machines via [the Flavors extension][13]) were very new in the 1980s. Symbolics was the cutting edge.

![Bob Culley's path-finding program.][14] Bob Culley’s path-finding program.

As a result, Symbolics machines were outrageously expensive. The Symbolics 3600 cost $110,000 in 1983. So most people could only marvel at the power of Lisp machines and the wizardry of their Lisp-writing operators from afar. But marvel they did. Byte Magazine featured Lisp and Lisp machines several times from 1979 through to the end of the 1980s. In the August, 1979 issue, a special on Lisp, the magazine’s editor raved about the new machines being developed at MIT with “gobs of memory” and “an advanced operating system.” He thought they sounded so promising that they would make the two prior years—which saw the launch of the Apple II, the Commodore PET, and the TRS-80—look boring by comparison. A half decade later, in 1985, a Byte Magazine contributor described writing Lisp programs for the “sophisticated, superpowerful Symbolics 3670” and urged his audience to learn Lisp, claiming it was both “the language of choice for most people working in AI” and soon to be a general-purpose programming language as well.

I asked Paul McJones, who has done lots of Lisp [preservation work][15] for the Computer History Museum in Mountain View, about when people first began talking about Lisp as if it were a gift from higher-dimensional beings. He said that the inherent properties of the language no doubt had a lot to do with it, but he also said that the close association between Lisp and the powerful artificial intelligence applications of the 1960s and 1970s probably contributed too. When Lisp machines became available for purchase in the 1980s, a few more people outside of places like MIT and Stanford were exposed to Lisp’s power and the legend grew. Today, Lisp machines and Symbolics are little remembered, but they helped keep the mystique of Lisp alive through to the late 1980s.

### Theory C: Learn to Program

In 1985, MIT professors Harold Abelson and Gerald Sussman, along with Sussman’s wife, Julie Sussman, published a textbook called Structure and Interpretation of Computer Programs. The textbook introduced readers to programming using the language Scheme, a dialect of Lisp. It was used to teach MIT’s introductory programming class for two decades. My hunch is that SICP (as the title is commonly abbreviated) about doubled Lisp’s “mystique factor.” SICP took Lisp and showed how it could be used to illustrate deep, almost philosophical concepts in the art of computer programming. Those concepts were general enough that any language could have been used, but SICP’s authors chose Lisp. As a result, Lisp’s reputation was augmented by the notoriety of this bizarre and brilliant book, which has intrigued generations of programmers (and also become [a very strange meme][16]). Lisp had always been “McCarthy’s elegant formalism”; now it was also “that language that teaches you the hidden secrets of programming.”

It’s worth dwelling for a while on how weird SICP really is, because I think the book’s weirdness and Lisp’s weirdness get conflated today. The weirdness starts with the book’s cover. It depicts a wizard or alchemist approaching a table, prepared to perform some sort of sorcery. In one hand he holds a set of calipers or a compass, in the other he holds a globe inscribed with the words “eval” and “apply.” A woman opposite him gestures at the table; in the background, the Greek letter lambda floats in mid-air, radiating light.

![The cover art for SICP.][17] The cover art for SICP.

Honestly, what is going on here? Why does the table have animal feet? Why is the woman gesturing at the table? What is the significance of the inkwell? Are we supposed to conclude that the wizard has unlocked the hidden mysteries of the universe, and that those mysteries consist of the “eval/apply” loop and the Lambda Calculus? It would seem so. This image alone must have done an enormous amount to shape how people talk about Lisp today.

But the text of the book itself is often just as weird. SICP is unlike most other computer science textbooks that you have ever read. Its authors explain in the foreword to the book that the book is not merely about how to program in Lisp—it is instead about “three foci of phenomena: the human mind, collections of computer programs, and the computer.” Later, they elaborate, describing their conviction that programming shouldn’t be considered a discipline of computer science but instead should be considered a new notation for “procedural epistemology.” Programs are a new way of structuring thought that only incidentally get fed into computers. The first chapter of the book gives a brief tour of Lisp, but most of the book after that point is about much more abstract concepts. There is a discussion of different programming paradigms, a discussion of the nature of “time” and “identity” in object-oriented systems, and at one point a discussion of how synchronization problems may arise because of fundamental constraints on communication that play a role akin to the fixed speed of light in the theory of relativity. It’s heady stuff.

All this isn’t to say that the book is bad. It’s a wonderful book. It discusses important programming concepts at a higher level than anything else I have read, concepts that I had long wondered about but didn’t quite have the language to describe. It’s impressive that an introductory programming textbook can move so quickly to describing the fundamental shortfalls of object-oriented programming and the benefits of functional languages that minimize mutable state. It’s mind-blowing that this then turns into a discussion of how a stream paradigm, perhaps something like today’s [RxJS][18], can give you the best of both worlds. SICP distills the essence of high-level program design in a way reminiscent of McCarthy’s original Lisp paper. The first thing you want to do after reading it is get your programmer friends to read it; if they look it up, see the cover, but then don’t read it, all they take away is that some mysterious, fundamental “eval/apply” thing gives magicians special powers over tables with animal feet. I would be deeply impressed in their shoes too.

But maybe SICP’s most important contribution was to elevate Lisp from curious oddity to pedagogical must-have. Well before SICP, people told each other to learn Lisp as a way of getting better at programming. The 1979 Lisp issue of Byte Magazine is testament to that fact. The same editor that raved about MIT’s new Lisp machines also explained that the language was worth learning because it “represents a different point of view from which to analyze problems.” But SICP presented Lisp as more than just a foil for other languages; SICP used Lisp as an introductory language, implicitly making the argument that Lisp is the best language in which to grasp the fundamentals of computer programming. When programmers today tell each other to try Lisp before they die, they arguably do so in large part because of SICP. After all, the language [Brainfuck][19] presumably offers “a different point of view from which to analyze problems.” But people learn Lisp instead because they know that, for twenty years or so, the Lisp point of view was thought to be so useful that MIT taught Lisp to undergraduates before anything else.

### Lisp Comes Back

The same year that SICP was released, Bjarne Stroustrup published the first edition of The C++ Programming Language, which brought object-oriented programming to the masses. A few years later, the market for Lisp machines collapsed and the AI winter began. For the next decade and change, C++ and then Java would be the languages of the future and Lisp would be left out in the cold.

It is of course impossible to pinpoint when people started getting excited about Lisp again. But that may have happened after Paul Graham, Y-Combinator co-founder and Hacker News creator, published a series of influential essays pushing Lisp as the best language for startups. In his essay [“Beating the Averages,”][20] for example, Graham argued that Lisp macros simply made Lisp more powerful than other languages. He claimed that using Lisp at his own startup, Viaweb, helped him develop features faster than his competitors were able to. [Some programmers at least][21] were persuaded. But the vast majority of programmers did not switch to Lisp.

What happened instead is that more and more Lisp-y features have been incorporated into everyone’s favorite programming languages. Python got list comprehensions. C# got Linq. Ruby got… well, Ruby [is a Lisp][22]. As Graham noted even back in 2001, “the default language, embodied in a succession of popular languages, has gradually evolved toward Lisp.” Though other languages are gradually becoming like Lisp, Lisp itself somehow manages to retain its special reputation as that mysterious language that few people understand but everybody should learn. In 1980, on the occasion of Lisp’s 20th anniversary, McCarthy wrote that Lisp had survived as long as it had because it occupied “some kind of approximate local optimum in the space of programming languages.” That understates Lisp’s real influence. Lisp hasn’t survived for over half a century because programmers have begrudgingly conceded that it is the best tool for the job decade after decade; in fact, it has survived even though most programmers do not use it at all. Thanks to its origins and use in artificial intelligence research and perhaps also the legacy of SICP, Lisp continues to fascinate people. Until we can imagine God creating the world with some newer language, Lisp isn’t going anywhere.

If you enjoyed this post, more like it come out every two weeks! Follow [@TwoBitHistory][23] on Twitter or subscribe to the [RSS feed][24] to make sure you know when a new post is out.

Previously on TwoBitHistory…

> This week's post: A look at Chaosnet, the network that gave us the "CH" DNS class.<https://t.co/dC7xqPYzi5>
>
> — TwoBitHistory (@TwoBitHistory) [September 30, 2018][25]

--------------------------------------------------------------------------------

via: https://twobithistory.org/2018/10/14/lisp.html

作者：[Two-Bit History][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://twobithistory.org
[b]: https://github.com/lujun9972
[1]: https://xkcd.com/224/
[2]: https://xkcd.com/297/
[3]: https://www.gnu.org/fun/jokes/eternal-flame.en.html
[4]: https://www.reddit.com/r/ProgrammerHumor/comments/5c14o6/xkcd_lisp/d9szjnc/
[5]: https://twobithistory.org/images/byte_lisp.jpg
[6]: http://languagelog.ldc.upenn.edu/myl/llog/jmc.pdf
[7]: https://en.wikipedia.org/wiki/Jargon_File
[8]: https://hci.stanford.edu/winograd/shrdlu/
[9]: https://en.wikipedia.org/wiki/Macsyma
[10]: https://en.wikipedia.org/wiki/ACL2
[11]: https://twobithistory.org/2018/09/30/chaosnet.html
[12]: https://youtu.be/gV5obrYaogU?t=201
[13]: https://en.wikipedia.org/wiki/Flavors_(programming_language)
[14]: https://twobithistory.org/images/symbolics.jpg
[15]: http://www.softwarepreservation.org/projects/LISP/
[16]: https://knowyourmeme.com/forums/meme-research/topics/47038-structure-and-interpretation-of-computer-programs-hugeass-image-dump-for-evidence
[17]: https://twobithistory.org/images/sicp.jpg
[18]: https://rxjs-dev.firebaseapp.com/
[19]: https://en.wikipedia.org/wiki/Brainfuck
[20]: http://www.paulgraham.com/avg.html
[21]: https://web.archive.org/web/20061004035628/http://wiki.alu.org/Chris-Perkins
[22]: http://www.randomhacks.net/2005/12/03/why-ruby-is-an-acceptable-lisp/
[23]: https://twitter.com/TwoBitHistory
[24]: https://twobithistory.org/feed.xml
[25]: https://twitter.com/TwoBitHistory/status/1046437600658169856?ref_src=twsrc%5Etfw

