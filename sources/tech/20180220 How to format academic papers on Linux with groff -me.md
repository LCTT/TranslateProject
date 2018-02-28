How to format academic papers on Linux with groff -me
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/life_paperclips.png?itok=j48op49T)

I was an undergraduate student when I discovered Linux in 1993. I was so excited to have the power of a Unix system right in my dorm room, but despite its many capabilities, Linux lacked applications. Word processors like LibreOffice and OpenOffice were years away. If you wanted to use a word processor, you likely booted your system into MS-DOS and used WordPerfect, the shareware GalaxyWrite, or a similar program.

`nroff` and `troff`. They are different interfaces to the same system: `nroff` generates plaintext output, suitable for screens or line printers, and `troff` generates very pretty output, usually for printing on a laser printer.

That was my method, since I needed to write papers for my classes, but I preferred staying in Linux. I knew from our "big Unix" campus computer lab that Unix systems provided a set of text-formatting programs calledand. They are different interfaces to the same system:generates plaintext output, suitable for screens or line printers, andgenerates very pretty output, usually for printing on a laser printer.

On Linux, `nroff` and `troff` are combined as GNU troff, more commonly known as [groff][1]. I was happy to see a version of groff included in my early Linux distribution, so I set out to learn how to use it to write class papers. The first macro set I learned was the `-me` macro package, a straightforward, easy to learn macro set.

The first thing to know about `groff` is that it processes and formats text according to a set of macros. A macro is usually a two-character command, set on a line by itself, with a leading dot. A macro might carry one or more options. When `groff` encounters one of these macros while processing a document, it will automatically format the text appropriately.

Below, I'll share the basics of using `groff -me` to write simple documents like class papers. I won't go deep into the details, like how to create nested lists, keeps and displays, tables, and figures.

### Paragraphs

Let's start with an easy example you see in almost every type of document: paragraphs. Paragraphs can be formatted with the first line either indented or not (i.e., flush against the left margin). Many printed documents, including academic papers, magazines, journals, and books, use a combination of the two types, with the first (leading) paragraph in a document or chapter flush left and all other (regular) paragraphs indented. In `groff -me`, you can use both paragraph types: leading paragraphs (`.lp`) and regular paragraphs (`.pp`).
```
.lp

This is the first paragraph.

.pp

This is a standard paragraph.

```

### Text formatting

The macro to format text in bold is `.b` and to format in italics is `.i`. If you put `.b` or `.i` on a line by itself, then all text that comes after it will be in bold or italics. But it's more likely you just want to put one or a few words in bold or italics. To make one word bold or italics, put that word on the same line as `.b` or `.i`, as an option. To format multiple words in **bold** or italics, enclose your text in quotes.
```
.pp

You can do basic formatting such as

.i italics

or

.b "bold text."

```

In the above example, the period at the end of **bold text** will also be in bold type. In most cases, that's not what you want. It's more correct to only have the words **bold text** in bold, but not the trailing period. To get the effect you want, you can add a second argument to `.b` or `.i` to indicate any text that should trail the bolded or italicized text, but in normal type. For example, you might do this to ensure that the trailing period doesn't show up in bold type.
```
.pp

You can do basic formatting such as

.i italics

or

.b "bold text" .

```

### Lists

With `groff -me`, you can create two types of lists: bullet lists (`.bu`) and numbered lists (`.np`).
```
.pp

Bullet lists are easy to make:

.bu

Apple

.bu

Banana

.bu

Pineapple

.pp

Numbered lists are as easy as:

.np

One

.np

Two

.np

Three

.pp

Note that numbered lists will reset at the next pp or lp.

```

### Subheads

If you're writing a long paper, you might want to divide your content into sections. With `groff -me`, you can create numbered headings (`.sh`) and unnumbered headings (`.uh`). In either, enclose the section title in quotes as an argument. For numbered headings, you also need to provide the heading level: `1` will give a first-level heading (e.g., 1.). Similarly, `2` and `3` will give second and third level headings, such as 2.1 or 3.1.1.
```
.uh Introduction

.pp

Provide one or two paragraphs to describe the work

and why it is important.

.sh 1 "Method and Tools"

.pp

Provide a few paragraphs to describe how you

did the research, including what equipment you used

```

### Smart quotes and block quotes

It's standard in any academic paper to cite other people's work as evidence. If you're citing a brief quote to highlight a key message, you can just type quotes around your text. But groff won't automatically convert your quotes into the "smart" or "curly" quotes used by modern word processing systems. To create them in `groff -me`, insert an inline macro to create the left quote (`\*(lq`) and right quote mark (`\*(rq`).
```
.pp

Christine Peterson coined the phrase \*(lqopen source.\*(rq

```

There's also a shortcut in `groff -me` to create these quotes (`.q`) that I find easier to use.
```
.pp

Christine Peterson coined the phrase

.q "open source."

```

If you're citing a longer quote that spans several lines, you'll want to use a block quote. To do this, insert the blockquote macro (`.(q`) at the beginning and end of the quote.
```
.pp

Christine Peterson recently wrote about open source:

.(q

On April 7, 1998, Tim O'Reilly held a meeting of key

leaders in the field. Announced in advance as the first

.q "Freeware Summit,"

by April 14 it was referred to as the first

.q "Open Source Summit."

.)q

```

### Footnotes

To insert a footnote, include the footnote macro (`.(f`) before and after the footnote text, and use an inline macro (`\**`) to add the footnote mark. The footnote mark should appear both in the text and in the footnote itself.
```
.pp

Christine Peterson recently wrote about open source:\**

.(f

\**Christine Peterson.

.q "How I coined the term open source."

.i "OpenSource.com."

1 Feb 2018.

.)f

.(q

On April 7, 1998, Tim O'Reilly held a meeting of key

leaders in the field. Announced in advance as the first

.q "Freeware Summit,"

by April 14 it was referred to as the first

.q "Open Source Summit."

.)q

```

### Cover page

Most class papers require a cover page containing the paper's title, your name, and the date. Creating a cover page in `groff -me` requires some assembly. I find the easiest way is to use centered blocks of text and add extra lines between the title, name, and date. (I prefer to use two blank lines between each.) At the top of your paper, start with the title page (`.tp`) macro, insert five blank lines (`.sp 5` ), then add the centered text (`.(c`), and extra blank lines (`.sp 2`).
```
.tp

.sp 5

.(c

.b "Writing Class Papers with groff -me"

.)c

.sp 2

.(c

Jim Hall

.)c

.sp 2

.(c

February XX, 2018

.)c

.bp

```

The last macro (`.bp`) tells groff to add a page break after the title page.

### Learning more

Those are the essentials of writing professional-looking a paper in `groff -me` with leading and indented paragraphs, bold and italics text, bullet and numbered lists, numbered and unnumbered section headings, block quotes, and footnotes.

I've included a sample groff file to demonstrate all of this formatting. Save the `lorem-ipsum.me` file to your system and run it through groff. The `-Tps` option sets the output type to PostScript so you can send the document to a printer or convert it to a PDF file using the `ps2pdf` program.
```
groff -Tps -me lorem-ipsum.me > lorem-ipsum.me.ps

ps2pdf lorem-ipsum.me.ps lorem-ipsum.me.pdf

```

If you'd like to use more advanced functions in `groff -me`, refer to Eric Allman's "Writing Papers with Groff using `−me`," which you should find on your system as `meintro.me` in groff's `doc` directory. It's a great reference document that explains other ways to format papers using the `groff -me` macros.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/2/how-format-academic-papers-linux-groff-me

作者：[Jim Hall][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jim-hall
[1]:https://www.gnu.org/software/groff/
