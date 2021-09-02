The Lineage of Man
======
I’ve always found man pages fascinating. Formatted as strangely as they are and accessible primarily through the terminal, they have always felt to me like relics of an ancient past. Some man pages probably are ancient: I’d love to know how many times the man page for `cat` or say `tee` has been revised since the early days of Unix, but I’m willing to bet it’s not many. Man pages are mysterious—it’s not obvious where they come from, where they live on your computer, or what kind of file they might be stored in—and yet it’s hard to believe that something so fundamental and so obviously governed by rigid conventions could remain so inscrutable. Where did the man page conventions come from? Where are they codified? If I wanted to write my own man page, where would I even begin?

The story of `man` is inextricably tied to the story of Unix. The very first version of Unix, completed in 1971 but only available internally at Bell Labs, did not provide a `man` command. But Douglas McIlroy, who at the time was head of the Computing Techniques Research Department and managed the Unix project, insisted that some kind of documentation be made available. He pushed Ken Thompson and Dennis Ritchie, the two programmers commonly credited with creating Unix, to write some. The result was the [first edition][1] of the Unix Programmer’s Manual.

The first edition of the Unix Programmer’s Manual consisted of (physical!) pages collected together in a single binder. It documented only 61 different commands, along with a couple dozen system calls and a few library routines. Though the `man` command itself was not to come until later, the first edition of the Unix Programmer’s Manual established many of the conventions that man pages adhere to today, even in the absence of an official specification. The documentation for each command included the well-known NAME, SYNOPSIS, DESCRIPTION, and SEE ALSO headings. Optional flags were enclosed in square brackets and meta-arguments (for example, “file” where a file path is expected) were underlined. The manual also established the canonical manual sections such as Section 1 for General Commands, Section 2 for System Calls, and so on; these sections were, at the time, simply sections of a very long printed document. Thompson and Ritchie could not have known that they were establishing a tradition that would survive for decades and decades, but that is what they did.

McIlroy later speculated about why the man page format has survived as long as it has. In a technical report about the conceptual development of Unix, he noted that the original man pages were written in a “terse, yet informal, prose style” that together with the alphabetical ordering of information “encouraged accurate on-line documentation.” In a nod to an experience with man pages that all programmers have had at one time or another, he added that the man page format “was popular with initiates who needed to look up facts, albeit sometimes frustrating for beginners who didn’t know what facts to look for.” McIlroy was highlighting the sometimes-overlooked distinction between tutorial and reference; man pages may not be much use for the former, but they are perfect for the latter.

The `man` command was a part of Unix by the time the [second edition][2] of the Unix Programmer’s Manual was printed. It made the entire manual available “on-line”, meaning interactively, which was seen as enormously useful. The `man` command has its own manual page in the second edition (this page is the original `man man`), which explains that `man` can be used to “run off a particular section of this manual.” Among the original Unix wizards, the term “run off” referred to the physical act of printing a document but also to the program they used to typeset documents, `roff`. The `roff` program had been used to typeset both the first and second editions of the Unix Programmer’s Manual before they were printed, but it was now also used by `man` to process man pages before they were displayed. The man pages themselves were stored on every Unix system in a file format meant to be read by `roff`.

`roff` was the first in a long lineage of typesetting programs that have always been used to format man pages. Its own development can be traced back to a program called `RUNOFF` that was written in the mid-60s. At Bell Labs, `roff` spawned several successors including `nroff` (en-roff) and `troff` (tee-roff). `nroff` was designed to improve on `roff` and better output text to terminals, while `troff` tackled the problem of printing using a CAT phototypesetter. (If you don’t know what phototypesetting is, as I did not, I refer you to [this][3] eminently watchable film.) All of these programs were based on a kind of markup language consisting of two-letter commands inserted at the beginning of every line in a document. These commands could control such things as font size, text positioning, line spacing, and so on. Today, the most common implementation of the `roff` system is `groff`, a part of the GNU project.

It’s easy to get a sense of what `roff` input files look like by just taking a gander at some of the man pages stored on your own computer. At least on a BSD-derived system like MacOS, you can use the `--path` argument to `man` to find out where the man page for a particular command is stored. Typically this will be under `/usr/share/man` or `/usr/local/share/man`. Using `man` this way, you can find the path for the `man` man page itself and then open it in a text editor. It will not look anything like what you’re used to looking at with `man`. On my system, the first couple dozen lines are:

```
.TH man 1 "September 19, 2005"
.LO 1
.SH NAME
man \- format and display the on-line manual pages
.SH SYNOPSIS
.B man
.RB [ \-acdfFhkKtwW ]
.RB [ --path ]
.RB [ \-m
.IR system ]
.RB [ \-p
.IR string ]
.RB [ \-C
.IR config_file ]
.RB [ \-M
.IR pathlist ]
.RB [ \-P
.IR pager ]
.RB [ \-B
.IR browser ]
.RB [ \-H
.IR htmlpager ]
.RB [ \-S
.IR section_list ]
.RI [ section ]
.I "name ..."

.SH DESCRIPTION
.B man
formats and displays the on-line manual pages. If you specify
.IR section ,
.B man
only looks in that section of the manual.
.I name
is normally the name of the manual page, which is typically the name
of a command, function, or file.
However, if
.I name
contains a slash
.RB ( / )
then
.B man
interprets it as a file specification, so that you can do
.B "man ./foo.5"
or even
.B "man /cd/foo/bar.1.gz\fR.\fP"
.PP
See below for a description of where
.B man
looks for the manual page files.
```

You can make out, for example, that all of the section headings are preceded by `.SH`, and everything that would appear in bold is preceded by `.B`. These commands are `roff` macros specifically designed for writing man pages. The macros used here are part of a package called `man`, but there are other packages such as `mdoc` that you can use for the same purpose. The macros make writing man pages much simpler than it would otherwise be. They also enforce consistency by always compiling down to the same set of lower-level `roff` commands. The `man` and `mdoc` packages are now documented under [GROFF_MAN(7)][4] and [GROFF_MDOC(7)][5] respectively.

The entire `roff` system is reminiscent of LaTeX, another typesetting tool that today enjoys much more popularity. LaTeX is essentially a big bucket of macros built on top of the core TeX system designed by Donald Knuth. Like with `roff`, there are many other macro packages that you can incorporate into your LaTeX documents. These macro packages mean that you almost never have to write raw TeX yourself. LaTeX has superseded `roff` in many domains, but it is poorly suited to formatting text for a terminal, so nobody uses it to write man pages.

If you were to write a man page today, in 2017, how would you go about it? You certainly could write a man page using a `roff` macro package like `man` or `mdoc`. The syntax is unfamiliar and unwieldy. But the macros abstract away so much of the complexity that you can write a reasonably complete man page without learning very many commands. That said, there are now other options worth considering.

[Pandoc][6] is a widely used software tool for converting documents from one format to another. You can use Pandoc to convert Markdown files into `man`-macro-based man pages, meaning that you can now write your man pages in something as straightforward as Markdown. Pandoc supports many more Markdown constructs than most Markdown converters, giving you lots of ways to format your man page. While this convenience comes at the cost of some control, it’s unlikely that you will ever need something that would warrant dropping down to the `roff` macro level. If you’re curious about what these Markdown files might look like, I’ve written [a few of my own][7] to document a tool I created for keeping notes on how to use different command-line utilities. NPM’s [documentation][8] is also written in Markdown and converted to a `roff` man format later, though they use a JavaScript package called [marked-man][9] instead of Pandoc to do the conversion.

So there are now plenty of ways to write man pages, giving you lots of freedom to choose the tool you think best. That said, you’d better ensure that your man page reads like every other man page that has ever been written. Even though there is now so much flexibility in tooling, the man page conventions are as strong as ever. And you might be tempted to skip writing a man page altogether—after all, you probably have documentation on the web, or maybe you just want to rely on the `--help` flag—but you’re forgoing the patina of respectability a man page can provide. The man page is an institution that doesn’t seem likely to disappear or evolve soon, which is fascinating, because there are so many ways in which we could do man pages better. XML didn’t come off well in my [last post][10], but it would be the perfect format here, and it would allow us to do something like query `man` about an option:

```
$ man grep -v
Selected lines are those not matching any of the specified patterns.
```

Imagine that! But it seems that we’re all too used to man pages the way they are. In a field where rapid change is the norm, maybe some stability—particularly in a documentation system we all turn to in moments of ignorance and confusion—is a good thing.

If you enjoyed this post, more like it come out every two weeks! Follow [@TwoBitHistory][11] on Twitter or subscribe to the [RSS feed][12] to make sure you know when a new post is out.

--------------------------------------------------------------------------------

via: https://twobithistory.org/2017/09/28/the-lineage-of-man.html

作者：[Two-Bit History][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://twobithistory.org
[b]: https://github.com/lujun9972
[1]: https://www.bell-labs.com/usr/dmr/www/1stEdman.html
[2]: http://bitsavers.informatik.uni-stuttgart.de/pdf/att/unix/2nd_Edition/UNIX_Programmers_Manual_2ed_Jun72.pdf
[3]: https://vimeo.com/127605644
[4]: http://man7.org/linux/man-pages/man7/groff_man.7.html
[5]: http://man7.org/linux/man-pages/man7/groff_mdoc.7.html
[6]: http://pandoc.org/
[7]: https://github.com/sinclairtarget/um/tree/02365bd0c0a229efb936b3d6234294e512e8a218/doc
[8]: https://github.com/npm/npm/blob/20589f4b028d3e8a617800ac6289d27f39e548e8/doc/cli/npm.md
[9]: https://www.npmjs.com/package/marked-man
[10]: https://twobithistory.org/2017/09/21/the-rise-and-rise-of-json.html
[11]: https://twitter.com/TwoBitHistory
[12]: https://twobithistory.org/feed.xml
