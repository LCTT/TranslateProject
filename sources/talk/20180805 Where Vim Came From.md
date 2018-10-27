thecyanbird translating

Where Vim Came From
======
I recently stumbled across a file format known as Intel HEX. As far as I can gather, Intel HEX files (which use the `.hex` extension) are meant to make binary images less opaque by encoding them as lines of hexadecimal digits. Apparently they are used by people who program microcontrollers or need to burn data into ROM. In any case, when I opened up a HEX file in Vim for the first time, I discovered something shocking. Here was this file format that, at least to me, was deeply esoteric, but Vim already knew all about it. Each line of a HEX file is a record divided into different fields—Vim had gone ahead and colored each of the fields a different color. `set ft?` I asked, in awe. `filetype=hex`, Vim answered, triumphant.

Vim is everywhere. It is used by so many people that something like HEX file support shouldn’t be a surprise. Vim comes pre-installed on Mac OS and has a large constituency in the Linux world. It is familiar even to people that hate it, because enough popular command line tools will throw users into Vim by default that the uninitiated getting trapped in Vim has become [a meme][1]. There are major websites, including Facebook, that will scroll down when you press the `j` key and up when you press the `k` key—the unlikely high-water mark of Vim’s spread through digital culture.

And yet Vim is also a mystery. Unlike React, for example, which everyone knows is developed and maintained by Facebook, Vim has no obvious sponsor. Despite its ubiquity and importance, there doesn’t seem to be any kind of committee or organization that makes decisions about Vim. You could spend several minutes poking around the [Vim website][2] without getting a better idea of who created Vim or why. If you launch Vim without giving it a file argument, then you will see Vim’s startup message, which says that Vim is developed by “Bram Moolenaar et al.” But that doesn’t tell you much. Who is Bram Moolenaar and who are his shadowy confederates?

Perhaps more importantly, while we’re asking questions, why does exiting Vim involve typing `:wq`? Sure, it’s a “write” operation followed by a “quit” operation, but that is not a particularly intuitive convention. Who decided that copying text should instead be called “yanking”? Why is `:%s/foo/bar/gc` short for “find and replace”? Vim’s idiosyncrasies seem too arbitrary to have been made up, but then where did they come from?

The answer, as is so often the case, begins with that ancient crucible of computing, Bell Labs. In some sense, Vim is only the latest iteration of a piece of software—call it the “wq text editor”—that has been continuously developed and improved since the dawn of the Unix epoch.

### Ken Thompson Writes a Line Editor

In 1966, Bell Labs hired Ken Thompson. Thompson had just completed a Master’s degree in Electrical Engineering and Computer Science at the University of California, Berkeley. While there, he had used a text editor called QED, written for the Berkeley Timesharing System between 1965 and 1966. One of the first things Thompson did after arriving at Bell Labs was rewrite QED for the MIT Compatible Time-Sharing System. He would later write another version of QED for the Multics project. Along the way, he expanded the program so that users could search for lines in a file and make substitutions using regular expressions.

The Multics project, which like the Berkeley Timesharing System sought to create a commercially viable time-sharing operating system, was a partnership between MIT, General Electric, and Bell Labs. AT&T eventually decided the project was going nowhere and pulled out. Thompson and fellow Bell Labs researcher Dennis Ritchie, now without access to a time-sharing system and missing the “feel of interactive computing” that such systems offered, set about creating their own version, which would eventually be known as Unix. In August 1969, while his wife and young son were away on vacation in California, Thompson put together the basic components of the new system, allocating “a week each to the operating system, the shell, the editor, and the assembler.”

The editor would be called `ed`. It was based on QED but was not an exact re-implementation. Thompson decided to ditch certain QED features. Regular expression support was pared back so that only relatively simple regular expressions would be understood. QED allowed users to edit several files at once by opening multiple buffers, but `ed` would only work with one buffer at a time. And whereas QED could execute a buffer containing commands, `ed` would do no such thing. These simplifications may have been called for. Dennis Ritchie has said that going without QED’s advanced regular expressions was “not much of a loss.”

`ed` is now a part of the POSIX specification, so if you have a POSIX-compliant system, you will have it installed on your computer. It’s worth playing around with, because many of the `ed` commands are today a part of Vim. In order to write a buffer to disk, for example, you have to use the `w` command. In order to quit the editor, you have to use the `q` command. These two commands can be specified on the same line at once—hence, `wq`. Like Vim, `ed` is a modal editor; to enter input mode from command mode you would use the insert command (`i`), the append command (`a`), or the change command (`c`), depending on how you are trying to transform your text. `ed` also introduced the `s/foo/bar/g` syntax for finding and replacing, or “substituting,” text.

Given all these similarities, you might expect the average Vim user to have no trouble using `ed`. But `ed` is not at all like Vim in another important respect. `ed` is a true line editor. It was written and widely used in the days of the teletype printer. When Ken Thompson and Dennis Ritchie were hacking away at Unix, they looked like this:

![Ken Thompson interacting with a PDP-11 via teletype.][3]

`ed` doesn’t allow you to edit lines in place among the other lines of the open buffer, or move a cursor around, because `ed` would have to reprint the entire file every time you made a change to it. There was no mechanism in 1969 for `ed` to “clear” the contents of the screen, because the screen was just a sheet of paper and everything that had already been output had been output in ink. When necessary, you can ask `ed` to print out a range of lines for you using the list command (`l`), but most of the time you are operating on text that you can’t see. Using `ed` is thus a little trying to find your way around a dark house with an underpowered flashlight. You can only see so much at once, so you have to try your best to remember where everything is.

Here’s an example of an `ed` session. I’ve added comments (after the `#` character) explaining the purpose of each line, though if these were actually entered `ed` wouldn’t recognize them as comments and would complain:

```
[sinclairtarget 09:49 ~]$ ed
i # Enter input mode
Hello world!

Isn't it a nice day?
. # Finish input
1,2l # List lines 1 to 2
Hello world!$
$
2d # Delete line 2
,l # List entire buffer
Hello world!$
Isn't it a nice day?$
s/nice/terrible/g # Substitute globally
,l
Hello world!$
Isn't it a terrible day?$
w foo.txt # Write to foo.txt
38 # (bytes written)
q # Quit
[sinclairtarget 10:50 ~]$ cat foo.txt
Hello world!
Isn't it a terrible day?
```

As you can see, `ed` is not an especially talkative program.

### Bill Joy Writes a Text Editor

`ed` worked well enough for Thompson and Ritchie. Others found it difficult to use and it acquired a reputation for being a particularly egregious example of Unix’s hostility toward the novice. In 1975, a man named George Coulouris developed an improved version of `ed` on the Unix system installed at Queen Mary’s College, London. Coulouris wrote his editor to take advantage of the video displays that he had available at Queen Mary’s. Unlike `ed`, Coulouris’ program allowed users to edit a single line in place on screen, navigating through the line keystroke by keystroke (imagine using Vim on one line at a time). Coulouris called his program `em`, or “editor for mortals,” which he had supposedly been inspired to do after Thompson paid a visit to Queen Mary’s, saw the program Coulouris had built, and dismissed it, saying that he had no need to see the state of a file while editing it.

In 1976, Coulouris brought `em` with him to UC Berkeley, where he spent the summer as a visitor to the CS department. This was exactly ten years after Ken Thompson had left Berkeley to work at Bell Labs. At Berkeley, Coulouris met Bill Joy, a graduate student working on the Berkeley Software Distribution (BSD). Coulouris showed `em` to Joy, who, starting with Coulouris’ source code, built out an improved version of `ed` called `ex`, for “extended `ed`.” Version 1.1 of `ex` was bundled with the first release of BSD Unix in 1978. `ex` was largely compatible with `ed`, but it added two more modes: an “open” mode, which enabled single-line editing like had been possible with `em`, and a “visual” mode, which took over the whole screen and enabled live editing of an entire file like we are used to today.

For the second release of BSD in 1979, an executable named `vi` was introduced that did little more than open `ex` in visual mode.

`ex`/`vi` (henceforth `vi`) established most of the conventions we now associate with Vim that weren’t already a part of `ed`. The video terminal that Joy was using was a Lear Siegler ADM-3A, which had a keyboard with no cursor keys. Instead, arrows were painted on the `h`, `j`, `k`, and `l` keys, which is why Joy used those keys for cursor movement in `vi`. The escape key on the ADM-3A keyboard was also where today we would find the tab key, which explains how such a hard-to-reach key was ever assigned an operation as common as exiting a mode. The `:` character that prefixes commands also comes from `vi`, which in regular mode (i.e. the mode entered by running `ex`) used `:` as a prompt. This addressed a long-standing complaint about `ed`, which, once launched, greets users with utter silence. In visual mode, saving and quitting now involved typing the classic `:wq`. “Yanking” and “putting,” marks, and the `set` command for setting options were all part of the original `vi`. The features we use in the course of basic text editing today in Vim are largely `vi` features.

![A Lear Siegler ADM-3A keyboard.][4]

`vi` was the only text editor bundled with BSD Unix other than `ed`. At the time, Emacs could cost hundreds of dollars (this was before GNU Emacs), so `vi` became enormously popular. But `vi` was a direct descendant of `ed`, which meant that the source code could not be modified without an AT&T source license. This motivated several people to create open-source versions of `vi`. STEVIE (ST Editor for VI Enthusiasts) appeared in 1987, Elvis appeared in 1990, and `nvi` appeared in 1994. Some of these clones added extra features like syntax highlighting and split windows. Elvis in particular saw many of its features incorporated into Vim, since so many Elvis users pushed for their inclusion.

### Bram Moolenaar Writes Vim

“Vim”, which now abbreviates “Vi Improved”, originally stood for “Vi Imitation.” Like many of the other `vi` clones, Vim began as an attempt to replicate `vi` on a platform where it was not available. Bram Moolenaar, a Dutch software engineer working for a photocopier company in Venlo, the Netherlands, wanted something like `vi` for his brand-new Amiga 2000. Moolenaar had grown used to using `vi` on the Unix systems at his university and it was now “in his fingers.” So in 1988, using the existing STEVIE `vi` clone as a starting point, Moolenaar began work on Vim.

Moolenaar had access to STEVIE because STEVIE had previously appeared on something called a Fred Fish disk. Fred Fish was an American programmer that mailed out a floppy disk every month with a curated selection of the best open-source software available for the Amiga platform. Anyone could request a disk for nothing more than the price of postage. Several versions of STEVIE were released on Fred Fish disks. The version that Moolenaar used had been released on Fred Fish disk 256. (Disappointingly, Fred Fish disks seem to have nothing to do with [Freddi Fish][5].)

Moolenaar liked STEVIE but quickly noticed that there were many `vi` commands missing. So, for the first release of Vim, Moolenaar made `vi` compatibility his priority. Someone else had written a series of `vi` macros that, when run through a properly `vi`-compatible editor, could solve a [randomly generated maze][6]. Moolenaar was able to get these macros working in Vim. In 1991, Vim was released for the first time on Fred Fish disk 591 as “Vi Imitation.” Moolenaar had added some features (including multi-level undo and a “quickfix” mode for compiler errors) that meant that Vim had surpassed `vi`. But Vim would remain “Vi Imitation” until Vim 2.0, released in 1993 via FTP.

Moolenaar, with the occasional help of various internet collaborators, added features to Vim at a steady clip. Vim 2.0 introduced support for the `wrap` option and for horizontal scrolling through long lines of text. Vim 3.0 added support for split windows and buffers, a feature inspired by the `vi` clone `nvi`. Vim also now saved each buffer to a swap file, so that edited text could survive a crash. Vimscript made its first appearance in Vim 5.0, along with support for syntax highlighting. All the while, Vim’s popularity was growing. It was ported to MS-DOS, to Windows, to Mac, and even to Unix, where it competed with the original `vi`.

In 2006, Vim was voted the most popular editor among Linux Journal readers. Today, according to Stack Overflow’s 2018 Developer Survey, Vim is the most popular text-mode (i.e. terminal emulator) editor, used by 25.8% of all software developers (and 40% of Sysadmin/DevOps people). For a while, during the late 1980s and throughout the 1990s, programmers waged the “Editor Wars,” which pitted Emacs users against `vi` (and eventually Vim) users. While Emacs certainly still has a following, some people think that the Editor Wars are over and that Vim won. The 2018 Stack Overflow Developer Survey suggests that this is true; only 4.1% of respondents used Emacs.

How did Vim become so successful? Obviously people like the features that Vim has to offer. But I would argue that the long history behind Vim illustrates that it had more advantages than just its feature set. Vim’s codebase dates back only to 1988, when Moolenaar began working on it. The “wq text editor,” on the other hand—the broader vision of how a Unix-y text editor should work—goes back a half-century. The “wq text editor” had a few different concrete expressions, but thanks in part to the unusual attention paid to backward compatibility by both Bill Joy and Bram Moolenaar, good ideas accumulated gradually over time. The “wq text editor,” in that sense, is one of the longest-running and most successful open-source projects, having enjoyed contributions from some of the greatest minds in the computing world. I don’t think the “startup-company-throws-away all-precedents-and-creates-disruptive-new-software” approach to development is necessarily bad, but Vim is a reminder that the collaborative and incremental approach can also yield wonders.

If you enjoyed this post, more like it come out every two weeks! Follow [@TwoBitHistory][7] on Twitter or subscribe to the [RSS feed][8] to make sure you know when a new post is out.

Previously on TwoBitHistory…

> New post! This time we're taking a look at the Altair 8800, the very first home computer, and how to simulate it on your modern PC.<https://t.co/s2sB5njrkd>
>
> — TwoBitHistory (@TwoBitHistory) [July 22, 2018][9]

--------------------------------------------------------------------------------

via: https://twobithistory.org/2018/08/05/where-vim-came-from.html

作者：[Two-Bit History][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://twobithistory.org
[b]: https://github.com/lujun9972
[1]: https://stackoverflow.blog/wp-content/uploads/2017/05/meme.jpeg
[2]: https://www.vim.org/
[3]: https://upload.wikimedia.org/wikipedia/commons/8/8f/Ken_Thompson_%28sitting%29_and_Dennis_Ritchie_at_PDP-11_%282876612463%29.jpg
[4]: https://vintagecomputer.ca/wp-content/uploads/2015/01/LSI-ADM3A-full-keyboard.jpg
[5]: https://en.wikipedia.org/wiki/Freddi_Fish
[6]: https://github.com/isaacs/.vim/tree/master/macros/maze
[7]: https://twitter.com/TwoBitHistory
[8]: https://twobithistory.org/feed.xml
[9]: https://twitter.com/TwoBitHistory/status/1021058552352387074?ref_src=twsrc%5Etfw
