[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 cool terminal pagers in Fedora)
[#]: via: (https://fedoramagazine.org/5-cool-terminal-pagers-in-fedora/)
[#]: author: (Jacob Burns https://fedoramagazine.org/author/jaek/)

5 cool terminal pagers in Fedora
======

![][1]

Large files like logs or source code can run into the thousands of lines. That makes navigating them difficult, particularly from the terminal. Additionally, most terminal emulators have a scrollback buffer of only a few hundred lines. That can make it impossible to browse large files in the terminal using utilities which print to standard output like _cat_, _head_ and _tail_. In the early days of computing, programmers solved these problems by developing utilities for displaying text in the form of virtual “pages” — utilities imaginatively described as _pagers_.

Pagers offer a number of features which make text file navigation much simpler, including scrolling, search functions, and the ability to feature as part of a [pipeline][2] of commands. In contrast to most text editors, some terminal pagers do not require loading the entire file for viewing, which makes them faster, especially for very large files.

In the modern era of Linux computing, terminal emulators are more sophisticated than ever. They offer support for a kaleidoscope of colors, terminal resizing, as well as a host of other features to make parsing text on screen easier and more efficient. Terminal pagers have undergone a similar evolution, from extremely simple UNIX utilities like _pg_ and _more_, to sophisticated programs with a wide range of features, covering any number of use cases. With this in mind, we’ve put together a list of some of the most popular terminal paging utilities — more or less.

### More

_more_ is one of the earliest pagers, initially featured in version 3.0 BSD. The first implementation of _more_ was written in 1978 by [Daniel Halbert][3]. Since then, _more_ has become a ubiquitous feature of many operating systems, including Windows, OS/2, MacOS and most linux distributions.

_more_ is a very lightweight utility. The version featured in util-linux runs to just under 2100 lines of C. However, this small footprint comes at a price. Most versions of _more_ feature relatively limited functionality, with no support for backwards scroll or search. Commands are similarly stripped back: press enter to scroll one line, or space to scroll one page. Some other useful commands include:

  * Press v while reading to open the current file in your default terminal editor.
  * ‘/_pattern_‘ let’s you search for the next occurrence of _pattern_.
  * :n and :p will open the next and previous files respectively when more is called with more than one file as arguments



### Less

_less_ was initially conceived as a successor to _more_, addressing some of its limitations. Building on the functionality of _more_, _less_ adds a number of useful features including backwards scroll, backwards search. It is also more amenable to window resizing.

Navigation in _less_ is similar to _more_, though _less_ borrows a few useful commands from the _vi_ editor as well. Users can navigate the document using the familiar home row navigational keys. A glance at the man page for _less_ reveals a fairly rich repertoire of available commands. Some particularly useful examples include:

  * ?_pattern_ lets you search backwards in the file for _pattern_
  * &amp;_pattern_ shows only lines which feature _pattern_. This is particularly useful for those who find themselves issuing **$ grep pattern | less** regularly.
  * Calling less with the -s (–sqeueeze-blank-lines) flag allows you to view text files with large gaps. Multiple newline characters are reduced to single breaks.
  * s _filename_, called from within the program, saves input to _filename_ (if input is a pipe).
  * Alternatively, calling less with the -o _filename_ flag will save the input of less to _filename._



With this enhanced functionality comes a little extra weight. The version of _less_ that ships with Fedora at the time of writing clocks in at around 25000 lines of source code. Granted, for all but the most storage constrained systems, this is a non-issue. Besides, _less_ is more than _more_.

### Most

While _less_ aims to expand on the existing capabilities of _more_, _most_ takes a different approach. Rather than expanding on the traditional single file view, _most_ gives users the ability to split their view into “windows.” Each window contains different files in different viewing modes.
Significantly, _most_ takes into account the width of its input text. The default viewing mode doesn’t wrap text (-S in less), a feature particularly useful when dealing with “wide” files. While these design decisions might represent a significant departure from tradition for some users, the end result is very powerful.

In addition to the navigation commands offered by _more_, _most_ uses intuitive mnemonics for file navigation. For example, _**t**_ moves to the **t**op of a file, and _**b**_ moves to the bottom. As a result, users unfamiliar with _vi_ and its descendants will find most to be refreshingly simple.

The distinguishing feature of _most_ is its ability to split windows and contexts quickly and easily. For example, one could open two distinct text files using the following:

```
$ most textFile1.txt textFile2.txt
```

In order to split the screen horizontally, use the key combos **Ctrl+x, 2** or **Ctrl+w, 2**. The command _:n_ will open the next file argument in a given window, offering a split screen view of two files:

![][4]

If you turn wrap off in one window, it does not affect the behavior of other windows. The \ character indicates a wrap or fold, while the $ character indicates that the file extends past the limitations of the current window.

### pspg

Those who work with SQL databases often need to be able to examine the contents of our databases at a glance. The command line interfaces for many popular open source DBMS’s, such as MySQL and PostGreSQL, use the system default pager to view outputs that don’t fit on a single screen. Utilities like _more_ and _less_ are designed around the idea of presenting text files, but for more structured data, leave something to be desired. Naive text paginating programs have no concept of broad, tabular data, which can be frustrating when dealing with large queries.

[pspg][5] attempts to address this by offering users the ability to freeze columns while viewing, sort data _in situ_, and colourize output. While _pspg_ was intended initially to serve as a pager replacement for _psql_ specifically, the program also supports the viewing of CSV data, and is a suitable drop-in replacement for _mysql_ and _pgcli_.

### Vim

In a modern, technicolor terminal, the idea of endless pages of drab grey on black text can feel like something of an anachronism. The syntax highlighting options offered by powerful text editors like _vim_ can be useful for browsing source code. Furthermore, the search functions offered by _vim_ vastly outclass the competition. With this in mind, _vim_ ships with a shell script _less.sh_ that lets _vim_ serve as a replacement for conventional pagers.

To set _vim_ as [the default pager][6] for man pages, add the following to your shell’s config (such as _~/.bashrc_ if using the default bash shell):

```
export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""
```

Alternatively, to set _vim_ as the default pager system-wide, locate the _less.sh_ script. (You can find it at _/usr/share/vim/vim81/macros/_ on current Fedora systems.) Export this location as the variable _PAGER_ to set it as default, or under an alias to invoke it explicitly.

* * *

_Photo by [Cathy Mü][7] on [Unsplash][8]._

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/5-cool-terminal-pagers-in-fedora/

作者：[Jacob Burns][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/jaek/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/11/5-pagers-816x345.jpg
[2]: https://fedoramagazine.org/command-line-quick-tips-using-pipes-to-connect-tools/
[3]: https://danhalbert.org/more.html
[4]: https://fedoramagazine.org/wp-content/uploads/2019/11/image-2.png
[5]: https://github.com/okbob/pspg
[6]: https://zameermanji.com/blog/2012/12/30/using-vim-as-manpager/
[7]: https://unsplash.com/@zyljosa?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[8]: https://unsplash.com/s/photos/pages?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
