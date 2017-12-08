Writing man Pages Using groff
===================

groff is the GNU version of the popular nroff/troff text-formatting tools provided on most Unix systems. Its most common use is writing manual pages—online documentation for commands, programming interfaqces, and so forth. In this article, we show you the ropes of writing your own man pages with groff.

Two of the original text processing systems found on Unix systems are troff and nroff, developed at Bell Labs for the original implementation of Unix (in fact, the development of Unix itself was spurred, in part, to support such a text-processing system). The first version of this text processor was called roff (for “runoff”); later came troff, which generated output for a particular typesetter in use at the time. nroff was a later version that became the standard text processor on Unix systems everywhere. groff is GNU's implementation of nroff and troff that is used on Linux systems. It includes several extended features and drivers for a number of printing devices.

groff is capable of producing documents, articles, and books, much in the same vein as other text-formatting systems, such as TeX. However, groff (as well as the original nroff) has one intrinsic feature that is absent from TeX and variants: the ability to produce plain-ASCII output. While other systems are great for producing documents to be printed, groff is able to produce plain ASCII to be viewed online (or printed directly as plain text on even the simplest of printers). If you're going to be producing documentation to be viewed online, as well as in printed form, groff may be the way to go (although there are alternatives, such as Texinfo, Lametex, and other tools).

groff also has the benefit of being much smaller than TeX; it requires fewer support files and executables than even a minimal TeX distribution.

One special application of groff is to format Unix man pages. If you're a Unix programmer, you'll eventually need to write and produce man pages of some kind. In this article, we'll introduce the use of groff through the writing of a short man page.

As with TeX, groff uses a particular text-formatting language to describe how to process the text. This language is slightly more cryptic than systems such as TeX, but also less verbose. In addition, groff provides several macro packages that are used on top of the basic formatter; these macro packages are tailored to a particular type of document. For example, the mgs macros are an ideal choice for writing articles and papers, while the man macros are used for man pages.

### Writing a man Page

Writing man pages with groff is actually quite simple. For your man page to look like others, you need to follow several conventions in the source, which are presented below. In this example, we'll write a man page for a mythical command coffee that controls your networked coffee machine in various ways.

Using any text editor, enter the source from Listing 1 and save the result as coffee.man. Do not enter the line numbers at the beginning of each line; those are used only for reference later in the article.

```
.TH COFFEE 1 "23 March 94"
.SH NAME
coffee /- Control remote coffee machine
.SH SYNOPSIS
/fBcoffee/fP [ -h | -b ] [ -t /fItype/fP ]
/fIamount/fP
.SH DESCRIPTION
/fBcoffee/fP queues a request to the remote
coffee machine at the device /fB/dev/cf0/fR.
The required /fIamount/fP argument specifies
the number of cups, generally between 0 and
12 on ISO standard coffee machines.
.SS Options
.TP
/fB-h/fP
Brew hot coffee. Cold is the default.
.TP
/fB-b/fP
Burn coffee. Especially useful when executing
/fBcoffee/fP on behalf of your boss.
.TP
/fB-t /fItype/fR
Specify the type of coffee to brew, where
/fItype/fP is one of /fBcolumbian/fP,
/fBregular/fP, or /fBdecaf/fP.
.SH FILES
.TP
/fC/dev/cf0/fR
The remote coffee machine device
.SH "SEE ALSO"
milk(5), sugar(5)
.SH BUGS
May require human intervention if coffee
supply is exhausted.
```

Don't let the amount of obscurity in this source file frighten you. It helps to know that the character sequences \fB, \fI, and \fR are used to change the font to boldface, italics, and roman type, respectively. \fP sets the font to the one previously selected.

Other groff requests appear on lines beginning with a dot (.). On line 1, we see that the .TH request is used to set the title of the man page to COFFEE, the man section to 1, and the date of the last man page revision. (Recall that man section 1 is used for user commands, section 2 is for system calls, and so forth. The man man command details each section number.) On line 2, the .SH request is used to start a section, entitled NAME. Note that almost all Unix man pages use the section progression NAME, SYNOPSIS, DESCRIPTION, FILES, SEE ALSO, NOTES, AUTHOR, and BUGS, with extra, optional sections as needed. This is just a convention used when writing man pages and isn't enforced by the software at all.

Line 3 gives the name of the command and a short description, after a dash ([mi]). You should use this format for the NAME section so that your man page can be added to the whatis database used by the man -k and apropos commands.

On lines 4—6 we give the synopsis of the command syntax for coffee. Note that italic type \fI...\fP is used to denote parameters on the command line, and that optional arguments are enclosed in square brackets.

Lines 7—12 give a brief description of the command. Boldface type is generally used to denote program and file names. On line 13, a subsection named Options is started with the .SS request. Following this on lines 14—25 is a list of options, presented using a tagged list. Each item in the tagged list is marked with the .TPrequest; the line after .TP is the tag, after which follows the item text itself. For example, the source on lines 14—16:

```
.TP
\fB-h\P
Brew hot coffee. Cold is the default.
```

```
-h     Brew hot coffee. Cold is the default.
```

Lines 26—29 make up the FILES section of the man page, which describes any files that the command might use to do its work. A tagged list using the .TP request is used for this as well.

On lines 30—31, the SEE ALSO section is given, which provides cross-references to other man pages of note. Notice that the string <\#34>SEE ALSO<\#34>following the .SH request on line 30 is in quotes; this is because .SH uses the first whitespace-delimited argument as the section title. Therefore any section titles that are more than one word need to be enclosed in quotes to make up a single argument. Finally, on lines 32—34, the BUGS section is presented.

### Formatting and Installing the man Page

In order to format this man page and view it on your screen, you can use the command:

```
$ groff -Tascii -man coffee.man | more
```

```
COFFEE(1)                                               COFFEE(1)
NAME
       coffee - Control remote coffee machine
SYNOPSIS
       coffee [ -h | -b ] [ -t type ] amount
DESCRIPTION
       coffee  queues  a  request to the remote coffee machine at
       the device /dev/cf0\. The required amount  argument  speci-
       fies the number of cups, generally between 0 and 12 on ISO
       standard coffee machines.
   Options
       -h     Brew hot coffee. Cold is the default.
       -b     Burn coffee. Especially useful when executing  cof-
              fee on behalf of your boss.
       -t type
              Specify  the  type of coffee to brew, where type is
              one of columbian, regular, or decaf.
FILES
       /dev/cf0
              The remote coffee machine device
SEE ALSO
       milk(5), sugar(5)
BUGS
       May  require  human  intervention  if  coffee  supply   is
       exhausted.
```

As mentioned before, groff is capable of producing other types of output. Using the -Tps option in place of -Tascii will produce PostScript output that you can save to a file, view with GhostView, or print on a PostScript printer. -Tdvi will produce device-independent .dvi output similar to that produced by TeX.

If you wish to make the man page available for others to view on your system, you need to install the groff source in a directory that is present in other users' MANPATH. The location for standard man pages is /usr/man. The source for section 1 man pages should therefore go in /usr/man/man1\. Therefore, the command:

```
$ cp coffee.man /usr/man/man1/coffee.1
```

If you can't copy man page sources directly to /usr/man (say, because you're not the system administrator), you can create your own man page directory tree and add it to your MANPATH. The MANPATH environment variable is of the same format asPATH; for example, to add the directory /home/mdw/man to MANPATH just use:

```
$ export MANPATH=/home/mdw/man:$MANPATH
```

```
groff -Tascii -mgs files...
```

Unfortunately, the macro sets provided with groff are not well-documented. There are section 7 man pages for some of them; for example, man 7 groff_mm will tell you about the mm macro set. However, this documentation usually only covers the differences and new features in the groff implementation, which assumes you have access to the man pages for the original nroff/troff macro sets (known as DWB—the Documentor's Work Bench). The best source of information may be a book on using nroff/troff which covers these classic macro sets in detail. For more about writing man pages, you can always look at the man page sources (in /usr/man) and determine what they do by comparing the formatted output with the source.

This article is adapted from Running Linux, by Matt Welsh and Lar Kaufman, published by O'Reilly and Associates (ISBN 1-56592-100-3). Among other things, this book includes tutorials of various text-formatting systems used under Linux. Information in this issue of Linux Journal as well as Running Linux should provide a good head-start on using the many text tools available for the system.

### Good luck, and happy documenting!

Matt Welsh ([mdw@cs.cornell.edu][1]) is a student and systems programmer at Cornell University, working with the Robotics and Vision Laboratory on projects dealing with real-time machine vision.

--------------------------------------------------------------------------------

via: http://www.linuxjournal.com/article/1158

作者：[Matt Welsh][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxjournal.com/user/800006
[1]:mailto:mdw@cs.cornell.edu