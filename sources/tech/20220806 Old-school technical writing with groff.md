[#]: subject: "Old-school technical writing with groff"
[#]: via: "https://opensource.com/article/22/8/old-school-technical-writing-groff"
[#]: author: "Jim Hall https://opensource.com/users/jim-hall"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Old-school technical writing with groff
======
Take a trip back in time to experience text formatting from a bygone era.

![Compute like it's 1989][1]

Image by: LSE Library. Modified by Opensource.com. CC BY-SA 4.0

One of my favorite stories about Unix is how it turned into a text processing system. Brian Kernighan [tells the story in his book][2] Unix: A History and a Memoir (chapter 3) but to summarize: The Unix team at Bell Labs ran the original Unix on a PDP-7 computer, but it was a tiny system and didn't have sufficient resources to support new work. So Ken Thompson and others lobbied to purchase a new PDP-11 computer. Management denied the request. Around the same time, the Patents department planned to buy a new computer platform to produce patent applications using proprietary document formatting software. The Unix group proposed that the Patents department instead buy a new PDP-11 for the Unix team, and the Unix team would create formatting software for them.

That new formatting system was called `nroff`, short for "New Roff," an updated version of a text formatting program called Roff from a 1960s computer system. The name Roff came from the old expression, "I'll run off a document."

### Basic formatting with nroff

By default, `nroff`  collects words and fills paragraphs. When `nroff`  encounters a blank line, it starts a new paragraph. For example, start with this article's introduction, which is only a few paragraphs long:

```
$ cat intro
Old-school technical writing with groff
Jim Hall
 
One of my favorite stories about Unix is how it turned
into a text processing system. Brian Kernighan tells the
story in his book Unix: A History and a Memoir (chapter 3)
but to summarize:
The Unix team at Bell Labs ran the original Unix on
a PDP-7 computer, but it was a tiny system and didn't
have sufficient resources to support new work. So Ken
Thompson and others lobbied to purchase a new PDP-11
computer. Management denied the request. Around the same
time, the Patents department planned to buy a new computer
platform to produce patent applications using proprietary
document formatting software. The Unix group proposed
that the Patents department instead buy a new PDP-11 for
the Unix team, and the Unix team would create formatting
software for them.
 
That new formatting system was called nroff, short for
"New Roff," an updated version of a text formatting program
called Roff from a 1960s computer system. The name Roff
came from the old expression, "I'll run off a document."
```

If you process this file with `nroff`, lines are "glued" together so the output is paragraphs with full justification. Using `nroff` also hyphenates words, if that helps balance lines in the text:

```
$ nroff intro | head
Old‐school technical writing with groff Jim Hall
 
One  of  my  favorite  stories about Unix is how it turned into a
text processing system. Brian Kernighan tells the  story  in  his
book  Unix:  A History and a Memoir (chapter 3) but to summarize:
The Unix team at Bell Labs ran the original Unix on a PDP‐7  com‐
puter,  but  it  was a tiny system and didn’t have sufficient re‐
sources to support new work. So Ken Thompson and  others  lobbied
to purchase a new PDP‐11 computer. Management denied the request.
Around the same time, the Patents department planned to buy a new
```

Original Unix systems used a typewriter-style printer that used 66 lines of 80 columns on a US Letter page, and `nroff` makes the same assumptions. It also adds empty lines so each page of output is 66 lines per page, but I've used the `head` command to show just the first few lines of output because my sample text isn't very long.

### Breaking lines and centering text

The first two lines were meant to be separate lines of text. You can insert a formatting instruction to tell `nroff` to add a line break. All `nroff` instructions start with a dot, followed by a brief command. To add a line break, use the `.br` instruction between the first and second line:

```
Old-school technical writing with groff
.br
Jim Hall
```

When you process this new file, `nroff` prints the title and author on separate lines:

```
$ nroff intro | head 
Old‐school technical writing with groff
Jim Hall
 
One  of  my  favorite  stories about Unix is how it turned into a
text processing system. Brian Kernighan tells the  story  in  his
book  Unix:  A History and a Memoir (chapter 3) but to summarize:
The Unix team at Bell Labs ran the original Unix on a PDP‐7  com‐
puter,  but  it  was a tiny system and didn’t have sufficient re‐
sources to support new work. So Ken Thompson and  others  lobbied
to purchase a new PDP‐11 computer. Management denied the request.
```

You can add other formatting to make this document look better. To center the top two lines, use the `.ce` formatting request. This takes a number argument, to indicate how many lines `nroff` should center. Here, you can center the top two output lines with the `.ce 2` request:

```
.ce 2
Old-school technical writing with groff
.br
Jim Hall
```

With this added instruction, `nroff`  correctly centers the first two lines:

```
$ nroff intro | head 
             Old‐school technical writing with groff
                            Jim Hall
 
One  of  my  favorite  stories about Unix is how it turned into a
text processing system. Brian Kernighan tells the  story  in  his
book  Unix:  A History and a Memoir (chapter 3) but to summarize:
The Unix team at Bell Labs ran the original Unix on a PDP‐7  com‐
puter,  but  it  was a tiny system and didn’t have sufficient re‐
sources to support new work. So Ken Thompson and  others  lobbied
to purchase a new PDP‐11 computer. Management denied the request.
```

### Adding page margins

Printing this to a printer results in text starting on the first line of the page, and against the left edge. To add a few lines of extra space from the top of the page, use the `.sp` request, with the number of blank lines to add:

```
.sp 5
.ce 2
Old-school technical writing with groff
.br
Jim Hall
```

By default, `nroff` formats the output so each line is 65 columns wide. Printing to an 80 column US Letter page leaves 15 empty columns. Adding 7 spaces on the left side neatly balances the output with equal left and right page margins. You can create this page offset using the `.po 7` request:

```
.po 7
.sp 5
.ce 2
Old-school technical writing with groff
.br
Jim Hall
```

Processing the new file with `nroff` produces a plain text page that's ready to print:

```
$ nroff intro | head
 
 
 
 
 
                    Old‐school technical writing with groff
                                   Jim Hall
 
       One  of  my  favorite  stories about Unix is how it turned into a
       text processing system. Brian Kernighan tells the  story  in  his
```

### Printing to a laser printer

Later, the Unix team at Bell Labs acquired a phototypesetting machine, capable of producing printed text similar to a laser printer. To support the typesetter's new capabilities, the Unix team updated `nroff` to become the typesetter-specific `troff` program, and a few years later updated it again to become `ditroff`, the device-independent version of `troff`.

Linux systems provide modern versions of `nroff` and `troff` using the GNU `groff` program. You can still use the old `nroff` program name to generate plain text output, or `troff` to produce `ditroff` compatible output. Using the `groff` program, you can also prepare documents for other kinds of output files, such as Postscript.

You can process the same input file using `groff` to print on a Postscript-compatible laser printer by selecting a suitable output type using the `-T` option, such as `-Tps` to generate a Postscript file. For example, I can print to a printer with the [lpr command][3] and the `HP_LaserJet_CP1525nw` device, because that's how my Linux system [recognizes my laser printer][4]:

```
$ groff -Tps intro | lpr -P "HP_LaserJet_CP1525nw"
```

### Generating other kinds of output

If you instead want to save the output as a PDF file, you can convert the Postscript using the `ps2pdf` tool:

```
$ groff -Tps intro | ps2pdf - > intro.pdf
```

To generate a web page from the same file, use `-Thtml` to set the output type to HTML:

```
$ groff -Thtml intro > index.html
```

The `groff` command supports lots of other built-in formatting requests to provide other kinds of document formatting. If you want to learn the other default formatting requests available to you in the GNU `groff` implementations of `nroff` and `troff`, refer to chapter 5 in the [The GNU Troff Manual][5].

Formatting documents using these built-in commands takes a lot of effort to keep everything looking the same. Technical writers who use `groff` instead use a collection of formatting requests called *macros*, which provide their own commands to generate section headings, paragraphs, block quotes, footnotes, lists, and other useful document formatting. To learn more about one popular macro package, read [How to format academic papers on Linux with groff -me][6] on Opensource.com.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/8/old-school-technical-writing-groff

作者：[Jim Hall][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/1980s-computer-yearbook.png
[2]: https://opensource.com/article/20/8/unix-history
[3]: https://opensource.com/article/21/9/print-files-linux
[4]: https://opensource.com/article/18/3/print-server-raspberry-pi
[5]: https://www.gnu.org/software/groff/manual/groff.html#gtroff-Reference
[6]: https://opensource.com/article/18/2/writing-academic-papers-groff-me
