[#]: subject: (5 signs you're a groff programmer)
[#]: via: (https://opensource.com/article/21/4/groff-programmer)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

5 signs you're a groff programmer
======
Learning groff, an old-school text processor, is like learning to ride a
bicycle.
![Typewriter in the grass][1]

I first discovered Unix systems in the early 1990s, when I was an undergraduate at university. I liked it so much that I replaced the MS-DOS system on my home computer with the Linux operating system.

One thing that Linux didn't have in the early to mid-1990s was a word processor. A standard office application on other desktop operating systems, a word processor lets you edit text easily. I often used a word processor on DOS to write my papers for class. I wouldn't find a Linux-native word processor until the late 1990s. Until then, word processing was one of the rare reasons I maintained dual-boot on my first computer, so I could occasionally boot back into DOS to write papers.

Then I discovered that Linux provided kind of a word processor. GNU troff, better known as [groff][2], is a modern implementation of a classic text processing system called troff, short for "typesetter roff," which is an improved version of the nroff system. And nroff was meant to be a new implementation of the original roff (which stood for "run off," as in to "run off" a document).

With text processing, you edit text in a plain text editor, and you add formatting through macros or other processing commands. You then process that text file through a text-processing system such as groff to generate formatted output suitable for a printer. Another well-known text processing system is LaTeX, but groff was simple enough for my needs.

With a little practice, I found I could write my class papers just as easily in groff as I could using a word processor on Linux. While I don't use groff to write documents today, I still remember the macros and commands to generate printed documents with it. And if you're the same and you learned how to write with groff all those years ago, you probably recognize these five signs that you're a groff writer.

### 1\. You have a favorite macro set

You format a document in groff by writing plain text interspersed with macros. A macro in groff is a short command that starts with a single period at the beginning of a line. For example: if you want to insert a few lines into your output, the `.sp 2` macro command adds two blank lines. groff supports other basic macros for all kinds of formatting.

To make formatting a document easier for the writer, groff also provides different _macro sets_, collections of macros that let you format documents your own way. The first macro set I learned was the `-me` macro set. Really, the macro set is called the `e` macro set, and you specify the `e` macro set when you process a file using the `-me` option.

groff includes other macro sets, too. For example, the `-man` macro set used to be the standard macro set to format the built-in _manual_ pages on Unix systems, and the `-ms` macro set is often used to format certain other technical documents. If you learned to write with groff, you probably have a favorite macro set.

### 2\. You want to focus on your content, not the formatting

One great feature of writing with groff is that you can focus on your _content_ and not worry too much about what it looks like. That is a handy feature for technical writers. groff is a great "distraction-free" environment for professional writers. At least, as long as you don't mind delivering your output in any of the formats that groff supports with the `-T` command-line option, including PDF, PostScript, HTML, and plain text. You can't generate a LibreOffice ODT file or Word DOC file directly from groff.

Once you get comfortable writing in groff, the macros start to _disappear_. The formatting macros become part of the background, and you focus purely on the text in front of you. I've done enough writing in groff that I don't even see the macros anymore. Maybe it's like writing programming code, and your mind just switches gears, so you think like a computer and see the code as a set of instructions. For me, writing in groff is like that; I just see my text, and my mind interprets the macros automatically into formatting.

### 3\. You like the old-school feel

Sure, it might be _easier_ to write your documents with a more typical word processor like LibreOffice Writer or even Google Docs or Microsoft Word. And for certain kinds of documents, a desktop word processor is the right fit. But if you want the "old-school" feel, it's hard to beat writing in groff.

I'll admit that I do most of my writing with LibreOffice Writer, which does an outstanding job. But when I get that itch to do it "old-school," I'll open an editor and write my document using groff.

### 4\. You like that you can use it anywhere

groff (and its cousins) are a standard package on almost any Unix system. And with groff, the macros don't change. For example, the `-me` macros should be the same from system to system. So once you've learned to use the macros on one system, you can use them on the next system.

And because groff documents are just plain text, you can use any editor you like to edit your documents for groff. I like to use GNU Emacs to edit my groff documents, but you can use GNOME Gedit, Vim, or your [favorite text editor][3]. Most editors include some kind of "mode" that will highlight the groff macros in a different color from the rest of your text to help you spot errors before processing the file.

### 5\. You wrote this article in -me

When I decided to write this article, I thought the best way would be to use groff directly. I wanted to demonstrate how flexible groff was in preparing documents. So even though you're reading this on a website, the article was originally written using groff.

I hope this has interested you in learning how to use groff to write documents. If you'd like to use more advanced functions in the `-me` macro set, refer to Eric Allman's _Writing papers with groff using -me_, which you should find on your system as **meintro.me** in groff's documentation. It's a great reference document that explains other ways to format papers using the `-me` macros.

I've also included a copy of the original draft of my article that uses the `-me` macros. Save the file to your system as **five-signs-groff.me**, and run it through groff to view it. The `-T` option sets the output type, such as `-Tps` to generate PostScript output or `-Thtml` to create an HTML file. For example:

groff -me -Thtml five-signs-groff.me &gt; five-signs-groff.html

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/groff-programmer

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/doc-dish-lead.png?itok=h3fCkVmU (Typewriter in the grass)
[2]: https://en.wikipedia.org/wiki/Groff_(software)
[3]: https://opensource.com/article/21/2/open-source-text-editors
