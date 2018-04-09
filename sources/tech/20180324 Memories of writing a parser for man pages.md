Memories of writing a parser for man pages
======

I generally enjoy being bored, but sometimes enough is enough—that was the case a Sunday afternoon of 2015 when I decided to start an open source project to overcome my boredom.

In my quest for ideas, I stumbled upon a request to build a [“Man page viewer built with web standards”][1] by [Mathias Bynens][2] and without thinking too much, I started coding a man page parser in JavaScript, which after a lot of back and forths, ended up being [Jroff][3].

Back then, I was familiar with manual pages as a concept and used them a fair amount of times, but that was all I knew, I had no idea how they were generated or if there was a standard in place. Two years later, here are some thoughts on the matter.

### How man pages are written

The first thing that surprised me at the time, was the notion that manpages at their core are just plain text files stored somewhere in the system (you can check this directory using the `manpath` command).

This files not only contain the documentation, but also formatting information using a typesetting system from the 1970s called `troff`.

> troff, and its GNU implementation groff, are programs that process a textual description of a document to produce typeset versions suitable for printing. **It’s more ‘What you describe is what you get’ rather than WYSIWYG.**
>
> — extracted from [troff.org][4]

If you are totally unfamiliar with typesetting formats, you can think of them as Markdown on steroids, but in exchange for the flexibility you have a more complex syntax:

![groff-compressor][5]

The `groff` file can be written manually, or generated from other formats such as Markdown, Latex, HTML, and so on with many different tools.

Why `groff` and man pages are tied together has to do with history, the format has [mutated along time][6], and his lineage is composed of a chain of similarly-named programs: RUNOFF > roff > nroff > troff > groff.

But this doesn’t necessarily mean that `groff` is strictly related to man pages, it’s a general-purpose format that has been used to [write books][7] and even for [phototypesetting][8].

Moreover, It’s worth noting that `groff` can also call a postprocessor to convert its intermediate output to a final format, which is not necessarily ascii for terminal display! some of the supported formats are: TeX DVI, HTML, Canon, HP LaserJet4 compatible, PostScript, utf8 and many more.

### Macros

Other of the cool features of the format is its extensibility, you can write macros that enhance the basic functionalities.

With the vast history of *nix systems, there are several macro packages that group useful macros together for specific functionalities according to the output that you want to generate, examples of macro packages are `man`, `mdoc`, `mom`, `ms`, `mm`, and the list goes on.

Manual pages are conventionally written using `man` and `mdoc`.

You can easily distinguish native `groff` commands from macros by the way standard `groff` packages capitalize their macro names. For `man`, each macro’s name is uppercased, like .PP, .TH, .SH, etc. For `mdoc`, only the first letter is uppercased: .Pp, .Dt, .Sh.

![groff-example][9]

### Challenges

Whether you are considering to write your own `groff` parser, or just curious, these are some of the problems that I have found more challenging.

#### Context-sensitive grammar

Formally, `groff` has a context-free grammar, unfortunately, since macros describe opaque bodies of tokens, the set of macros in a package may not itself implement a context-free grammar.

This kept me away (for good or bad) from the parser generators that were available at the time.

#### Nested macros

Most of the macros in `mdoc` are callable, this roughly means that macros can be used as arguments of other macros, for example, consider this:

  * The macro `Fl` (Flag) adds a dash to its argument, so `Fl s` produces `-s`
  * The macro `Ar` (Argument) provides facilities to define arguments
  * The `Op` (Optional) macro wraps its argument in brackets, as this is the standard idiom to define something as optional.
  * The following combination `.Op Fl s Ar file` produces `[-s file]` because `Op` macros can be nested.



#### Lack of beginner-friendly resources

Something that really confused me was the lack of a canonical, well defined and clear source to look at, there’s a lot of information in the web which assumes a lot about the reader that it takes time to grasp.

### Interesting macros

To wrap up, I will offer to you a very short list of macros that I found interesting while developing jroff:

**man**

  * TH: when writing manual pages with `man` macros, your first line that is not a comment must be this macro, it accepts five parameters: title section date source manual
  * BI: bold alternating with italics (especially useful for function specifications)
  * BR: bold alternating with Roman (especially useful for referring to other manual pages)



**mdoc**

  * .Dd, .Dt, .Os: similar to how `man` macros require the `.TH` the `mdoc` macros require these three macros, in that particular order. Their initials stand for: Document date, Document title and Operating system.
  * .Bl, .It, .El: these three macros are used to create list, their names are self-explanatory: Begin list, Item and End list.




--------------------------------------------------------------------------------

via: https://monades.roperzh.com/memories-writing-parser-man-pages/

作者：[Roberto Dip][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://monades.roperzh.com
[1]:https://github.com/h5bp/lazyweb-requests/issues/114
[2]:https://mathiasbynens.be/
[3]:jroff
[4]:https://www.troff.org/
[5]:https://user-images.githubusercontent.com/4419992/37868021-2e74027c-2f7f-11e8-894b-80829ce39435.gif
[6]:https://manpages.bsd.lv/history.html
[7]:https://rkrishnan.org/posts/2016-03-07-how-is-gopl-typeset.html
[8]:https://en.wikipedia.org/wiki/Phototypesetting
[9]:https://user-images.githubusercontent.com/4419992/37866838-e602ad78-2f6e-11e8-97a9-2a4494c766ae.jpg
