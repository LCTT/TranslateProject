Translated by name1e5s

The big break in computer languages
============================================================


My last post ([The long goodbye to C][3]) elicited a comment from a C++ expert I was friends with long ago, recommending C++ as the language to replace C. Which ain’t gonna happen; if that were a viable future, Go and Rust would never have been conceived.

But my readers deserve more than a bald assertion. So here, for the record, is the story of why I don’t touch C++ any more. This is a launch point for a disquisition on the economics of computer-language design, why some truly unfortunate choices got made and baked into our infrastructure, and how we’re probably going to fix them.

Along the way I will draw aside the veil from a rather basic mistake that people trying to see into the future of programming languages (including me) have been making since the 1980s. Only very recently do we have the field evidence to notice where we went wrong.

I think I first picked up C++ because I needed GNU eqn to be able to output MathXML, and eqn was written in C++. That project succeeded. Then I was a senior dev on Battle For Wesnoth for a number of years in the 2000s and got comfortable with the language.

Then came the day we discovered that a person we incautiously gave commit privileges to had fucked up the games’s AI core. It became apparent that I was the only dev on the team not too frightened of that code to go in. And I fixed it all right – took me two weeks of struggle. After which I swore a mighty oath never to go near C++ again.

My problem with the language, starkly revealed by that adventure, is that it piles complexity on complexity upon chrome upon gingerbread in an attempt to address problems that cannot actually be solved because the foundational abstractions are leaky. It’s all very well to say “well, don’t do that” about things like bare pointers, and for small-scale single-developer projects (like my eqn upgrade) it is realistic to expect the discipline can be enforced.

Not so on projects with larger scale or multiple devs at varying skill levels (the case I normally deal with). With probability asymptotically approaching one over time and increasing LOC, someone is inadvertently going to poke through one of the leaks. At which point you have a bug which, because of over-layers of gnarly complexity such as STL, is much more difficult to characterize and fix than the equivalent defect in C. My Battle For Wesnoth experience rubbed my nose in this problem pretty hard.

What works for a Steve Heller (my old friend and C++ advocate) doesn’t scale up when I’m dealing with multiple non-Steve-Hellers and might end up having to clean up their mess. So I just don’t go there any more. Not worth the aggravation. C is flawed, but it does have one immensely valuable property that C++ didn’t keep – if you can mentally model the hardware it’s running on, you can easily see all the way down. If C++ had actually eliminated C’s flaws (that it, been type-safe and memory-safe) giving away that transparency might be a trade worth making. As it is, nope.

One way we can tell that C++ is not sufficient is to imagine an alternate world in which it is. In that world, older C projects would routinely up-migrate to C++. Major OS kernels would be written in C++, and existing kernel implementations like Linux would be upgrading to it. In the real world, this ain’t happening. Not only has C++ failed to present enough of a value proposition to keep language designers uninterested in imagining languages like D, Go, and Rust, it has failed to displace its own ancestor. There’s no path forward from C++ without breaching its core assumptions; thus, the abstraction leaks won’t go away.

Since I’ve mentioned D, I suppose this is also the point at which I should explain why I don’t see it as a serious contender to replace C. Yes, it was spun up eight years before Rust and nine years before Go – props to Walter Bright for having the vision. But in 2001 the example of Perl and Python had already been set – the window when a proprietary language could compete seriously with open source was already closing. The wrestling match between the official D library/runtime and Tango hurt it, too. It has never recovered from those mistakes.

So now there’s Go (I’d say “…and Rust”, but for reasons I’ve discussed before I think it will be years before Rust is fully competitive). It  _is_  type-safe and memory-safe (well, almost; you can partway escape using interfaces, but it’s not normal to have to go to the unsafe places). One of my regulars, Mark Atwood, has correctly pointed out that Go is a language made of grumpy-old-man rage, specifically rage by  _one of the designers of C_  (Ken Thompson) at the bloated mess that C++ became.

I can relate to Ken’s grumpiness; I’ve been muttering for decades that C++ attacked the wrong problem. There were two directions a successor language to C might have gone. One was to do what C++ did – accept C’s leaky abstractions, bare pointers and all, for backward compatibility, than try to build a state-of-the-art language on top of them. The other would have been to attack C’s problems at their root –  _fix_ the leaky abstractions. That would break backward compatibility, but it would foreclose the class of problems that dominate C/C++ defects.

The first serious attempt at the second path was Java in 1995\. It wasn’t a bad try, but the choice to build it over a j-code interpreter mode it unsuitable for systems programming. That left a huge hole in the options for systems programming that wouldn’t be properly addressed for another 15 years, until Rust and Go. In particular, it’s why software like my GPSD and NTPsec projects is still predominantly written in C in 2017 despite C’s manifest problems.

This is in many ways a bad situation. It was hard to really see this because of the lack of viable alternatives, but C/C++ has not scaled well. Most of us take for granted the escalating rate of defects and security compromises in infrastructure software without really thinking about how much of that is due to really fundamental language problems like buffer-overrun vulnerabilities.

So, why did it take so long to address that? It was 37 years from C (1972) to Go (2009); Rust only launched a year sooner. I think the underlying reasons are economic.

Ever since the very earliest computer languages it’s been understood that every language design embodies an assertion about the relative value of programmer time vs. machine resources. At one end of that spectrum you have languages like assembler and (later) C that are designed to extract maximum performance at the cost of also pessimizing developer time and costs; at the other, languages like Lisp and (later) Python that try to automate away as much housekeeping detail as possible, at the cost of pessimizing machine performance.

In broadest terms, the most important discriminator between the ends of this spectrum is the presence or absence of automatic memory management. This corresponds exactly to the empirical observation that memory-management bugs are by far the most common class of defects in machine-centric languages that require programmers to manage that resource by hand.

A language becomes economically viable where and when its relative-value assertion matches the actual cost drivers of some particular area of software development. Language designers respond to the conditions around them by inventing languages that are a better fit for present or near-future conditions than the languages they have available to use.

Over time, there’s been a gradual shift from languages that require manual memory management to languages with automatic memory management and garbage collection (GC). This shift corresponds to the Moore’s Law effect of decreasing hardware costs making programmer time relatively more expensive. But there are at least two other relevant dimensions.

One is distance from the bare metal. Inefficiency low in the software stack (kernels and service code) ripples multiplicatively up the stack. This, we see machine-centric languages down low and programmer-centric languages higher up, most often in user-facing software that only has to respond at human speed (time scale 0.1 sec).

Another is project scale. Every language also has an expected rate of induced defects per thousand lines of code due to programmers tripping over leaks and flaws in its abstractions. This rate runs higher in machine-centric languages, much lower in programmer-centric ones with GC. As project scale goes up, therefore, languages with GC become more and more important as a strategy against unacceptable defect rates.

When we view language deployments along these three dimensions, the observed pattern today – C down below, an increasing gallimaufry of languages with GC above – almost makes sense. Almost. But there is something else going on. C is stickier than it ought to be, and used way further up the stack than actually makes sense.

Why do I say this? Consider the classic Unix command-line utilities. These are generally pretty small programs that would run acceptably fast implemented in a scripting language with a full POSIX binding. Re-coded that way they would be vastly easier to debug, maintain and extend.

Why are these still in C (or, in unusual exceptions like eqn, in C++)? Transition costs. It’s difficult to translate even small, simple programs between languages and verify that you have faithfully preserved all non-error behaviors. More generally, any area of applications or systems programming can stay stuck to a language well after the tradeoff that language embodies is actually obsolete.

Here’s where I get to the big mistake I and other prognosticators made. We thought falling machine-resource costs – increasing the relative cost of programmer-hours – would be enough by themselves to displace C (and non-GC languages generally). In this we were not entirely or even mostly wrong – the rise of scripting languages, Java, and things like Node.js since the early 1990s was pretty obviously driven that way.

Not so the new wave of contending systems-programming languages, though. Rust and Go are both explicitly responses to  _increasing project scale_ . Where scripting languages got started as an effective way to write small programs and gradually scaled up, Rust and Go were positioned from the start as ways to reduce defect rates in  _really large_  projects. Like, Google’s search service and Facebook’s real-time-chat multiplexer.

I think this is the answer to the “why not sooner” question. Rust and Go aren’t actually late at all, they’re relatively prompt responses to a cost driver that was underweighted until recently.

OK, so much for theory. What predictions does this one generate? What does it tell us about what comes after C?

Here’s the big one. The largest trend driving development towards GC languages haven’t reversed, and there’s no reason to expect it will. Therefore: eventually we  _will_  have GC techniques with low enough latency overhead to be usable in kernels and low-level firmware, and those will ship in language implementations. Those are the languages that will truly end C’s long reign.

There are broad hints in the working papers from the Go development group that they’re headed in this direction – references to academic work on concurrent garbage collectors that never have stop-the-world pauses. If Go itself doesn’t pick up this option, other language designers will. But I think they will – the business case for Google to push them there is obvious (can you say “Android development”?).

Well before we get to GC that good, I’m putting my bet on Go to replace C anywhere that the GC it has now is affordable – which means not just applications but most systems work outside of kernels and embedded. The reason is simple: there is no path out of C’s defect rates with lower transition costs.

I’ve been experimenting with moving C code to Go over the last week, and I’m noticing two things. One is that it’s easy to do – C’s idioms map over pretty well. The other is that the resulting code is much simpler. One would expect that, with GC in the language and maps as a first-class data type, but I’m seeing larger reductions in code volume than initially expected – about 2:1, similar to what I see when moving C code to Python.

Sorry, Rustaceans – you’ve got a plausible future in kernels and deep firmware, but too many strikes against you to beat Go over most of C’s range. No GC, plus Rust is a harder transition from C because of the borrow checker, plus the standardized part of the API is still seriously incomplete (where’s my select(2), again?).

The only consolation you get, if it is one, is that the C++ fans are screwed worse than you are. At least Rust has a real prospect of dramatically lowering downstream defect rates relative to C anywhere it’s not crowded out by Go; C++ doesn’t have that.

This entry was posted in [Software][4] by [Eric Raymond][5]. Bookmark the [permalink][6].

--------------------------------------------------------------------------------

via: http://esr.ibiblio.org/?p=7724

作者：[Eric Raymond][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://esr.ibiblio.org/?author=2
[1]:http://esr.ibiblio.org/?author=2
[2]:http://esr.ibiblio.org/?p=7724
[3]:http://esr.ibiblio.org/?p=7711
[4]:http://esr.ibiblio.org/?cat=13
[5]:http://esr.ibiblio.org/?author=2
[6]:http://esr.ibiblio.org/?p=7724
