[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Why I use Java)
[#]: via: (https://opensource.com/article/19/9/why-i-use-java)
[#]: author: (Chris Hermansen https://opensource.com/users/clhermansen)

Why I use Java
======
There are probably better languages than Java, depending on work
requirements. But I haven't seen anything yet to pull me away.
![Coffee beans][1]

I believe I started using Java in 1997, not long after [Java 1.1 saw the light of day][2]. Since that time, by and large, I've really enjoyed programming in Java; although I confess these days, I'm as likely to be found writing [Groovy][3] scripts as "serious code" in Java.

Coming from a background in [FORTRAN][4], [PL/1][5], [Pascal][6], and finally [C][7], I found a lot of things to like about Java. Java was my first significant hands-on experience with [object-oriented programming][8]. By then, I had been programming for about 20 years, and it's probably safe to say I had some ideas about what mattered and what didn't.

### Debugging as a key language feature

I really hated wasting time tracking down obscure bugs caused by my code carelessly iterating off the end of an array, especially back in the days of programming in FORTRAN on IBM mainframes. Another subtle problem that cropped up from time to time was calling a subroutine with a four-byte integer argument that was expecting two bytes; on small-endian architecture, this was often a benign bug, but on big-endian machines, the value of the top two bytes was usually, but not always, zero.

Debugging in that batch environment was pretty awkward, too—poring through core dumps or inserting print statements, which themselves could move bugs around or even make them disappear.

So my early experiences with Pascal, first on [MTS][9], then using the same MTS compiler on [IBM OS/VS1][10], made my life a lot easier. Pascal's [strong and static typing][11] were a big part of the win here, and every Pascal compiler I have used inserts run-time checks on array bounds and ranges, so bugs are detected at the point of occurrence. When we moved most of our work to a Unix system in the early 1980s, porting the Pascal code was a straightforward task.

### Finding the right amount of syntax

But for all the things I liked about Pascal, my code was wordy, and the syntax seemed to have a tendency to slightly obscure the code; for example, using:


```
`if … then begin … end else … end`
```

instead of:


```
`if (…) { … } else { … }`
```

in C and similar languages. Also, some things were quite hard to do in Pascal and much easier to do in C. But, as I began to use C more and more, I found myself running into the same kind of errors I used to commit in FORTRAN—running off the end of arrays, for example—that were not detected at the point of the original error, but only through their adverse effects later in the program's execution. Fortunately, I was no longer living in the batch environment and had great debugging tools at hand. Still, C gave me a little too much flexibility for my own good.

When I discovered [awk][12], I found I had a nice counterpoint to C. At that time, a lot of my work involved transforming field data and creating reports. I found I could do a surprising amount of that with awk, coupled with other Unix command-line tools like sort, sed, cut, join, paste, comm, and so on. Essentially, these tools gave me something a lot like a relational database manager for text files that had a column-oriented structure, which was the way a lot of our field data came in. Or, if not exactly in that format, most of the time the data could be unloaded from a relational database or from some kind of binary format into that column-oriented structure.

String handling, [regular expressions][13], and [associative arrays][14] supported by awk, as well as the basic nature of awk (it's really a data-transformation pipeline), fit my needs very well. When confronted with binary data files, complicated data structuring, and absolute performance needs, I would still revert to C; but as I used awk more and more, I found C's very basic string support more and more frustrating. As time went on, more and more often I would end up using C only when I had to—and probably overusing awk the rest of the time.

### Java is the right level of abstraction

And then along came Java. It looked pretty good right out of the gate—a relatively terse syntax reminiscent of C, or at least, more so than Pascal or any of those other earlier experiences. It was strongly typed, so a lot of programming errors would get caught at compile time. It didn't seem to require too much object-oriented learning to get going, which was a good thing, as I was barely familiar with [OOP design patterns][15] at the time. But even in the earliest days, I liked the ideas behind its simplified [inheritance model][16]. (Java allows for single inheritance with interfaces provided to enrich the paradigm somewhat.)

And it seemed to come with a rich library of functionality (the concept of "batteries included") that worked at the right level to directly meet my needs. Finally, I found myself rapidly coming to like the idea of both data and behavior being grouped together in objects. This seemed like a great way to explicitly control interactions among data—much better than enormous parameter lists or uncontrolled access to global variables.

Since then, Java has grown to be the Helvetic military knife in my programming toolbox. I will still write stuff occasionally in awk or use Linux command-line utilities like cut, sort, or sed when they're obviously and precisely the straightforward way to solve the problem at hand. I doubt if I've written 50 lines of C in the last 20 years, though; Java has completely replaced C for my needs.

In addition, Java has been improving over time. First of all, it's become much more performant. And it's added some really useful capabilities, like [try with resources][17], which very nicely cleans up verbose and somewhat messy code dealing with error handling during file I/O, for example; or [lambdas][18], which provide the ability to declare functions and pass them as parameters, instead of the old approach, which required creating classes or interfaces to "host" those functions; or [streams][19], which encapsulate iterative behavior in functions, creating an efficient data-transformation pipeline materialized in the form of chained function calls.

### Java is getting better and better

A number of language designers have looked at ways to radically improve the Java experience. For me, most of these aren't yet of great interest; again, that's more a reflection of my typical workflow and (much) less a function of the features those languages bring. But one of these evolutionary steps has become an indispensable part of my programming arsenal: [Groovy][20]. Groovy has become my go-to solution when I run into a small problem that needs a small solution. Moreover, it's highly compatible with Java. For me, Groovy fills the same niche that Python fills for a lot of other people—it's compact, DRY (don't repeat yourself), and expressive (lists and dictionaries have full language support). I also make use of [Grails][21], which uses Groovy to provide a streamlined web framework for very performant and useful Java web applications.

### But is Java still open source?

Recently, growing support for [OpenJDK][22] has further improved my comfort level with Java. A number of companies are supporting OpenJDK in various ways, including [AdoptOpenJDK, Amazon, and Red Hat][23]. In one of my bigger and longer-term projects, we use AdoptOpenJDK to [generate customized runtimes on several desktop platforms][24].

Are there better languages than Java? I'm sure there are, depending on your work needs. But I'm still a very happy Java user, and I haven't seen anything yet that threatens to pull me away.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/why-i-use-java

作者：[Chris Hermansen][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/java-coffee-beans.jpg?itok=3hkjX5We (Coffee beans)
[2]: https://en.wikipedia.org/wiki/Java_version_history
[3]: https://en.wikipedia.org/wiki/Apache_Groovy
[4]: https://en.wikipedia.org/wiki/Fortran
[5]: https://en.wikipedia.org/wiki/PL/I
[6]: https://en.wikipedia.org/wiki/Pascal_(programming_language)
[7]: https://en.wikipedia.org/wiki/C_(programming_language)
[8]: https://en.wikipedia.org/wiki/Object-oriented_programming
[9]: https://en.wikipedia.org/wiki/Michigan_Terminal_System
[10]: https://en.wikipedia.org/wiki/OS/VS1
[11]: https://stackoverflow.com/questions/11889602/difference-between-strong-vs-static-typing-and-weak-vs-dynamic-typing
[12]: https://en.wikipedia.org/wiki/AWK
[13]: https://en.wikipedia.org/wiki/Regular_expression
[14]: https://en.wikipedia.org/wiki/Associative_array
[15]: https://opensource.com/article/19/7/understanding-software-design-patterns
[16]: https://www.w3schools.com/java/java_inheritance.asp
[17]: https://www.baeldung.com/java-try-with-resources
[18]: https://www.baeldung.com/java-8-lambda-expressions-tips
[19]: https://www.tutorialspoint.com/java8/java8_streams
[20]: https://groovy-lang.org/
[21]: https://grails.org/
[22]: https://openjdk.java.net/
[23]: https://en.wikipedia.org/wiki/OpenJDK
[24]: https://opensource.com/article/19/4/java-se-11-removing-jnlp
