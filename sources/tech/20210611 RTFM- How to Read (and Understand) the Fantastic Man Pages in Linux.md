[#]: subject: (RTFM! How to Read (and Understand) the Fantastic Man Pages in Linux)
[#]: via: (https://itsfoss.com/linux-man-page-guide/)
[#]: author: (Bill Dyer https://itsfoss.com/author/bill/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

RTFM! How to Read (and Understand) the Fantastic Man Pages in Linux
======

The _man pages_, short for _reference manual pages_, are your keys to Linux. Everything you want to know is there – take it all in an run with it. The collection of documents will never win a Pulitzer prize, but the set is quite accurate and complete. The man pages are _the_ primary source and that authority is well-known.

While they are the “go to” source, they aren’t the most pleasant to read. Once, in a long past philosophy class, I was told that reading [Aristotle][1] was the most boring read around. I disagreed: when it comes to dry reading, Aristotle comes in at a distant second to man pages.

At first glance, the pages may look incomplete but, believe it or not, the man pages aren’t designed to hide information from you – it’s just that there is so much information that the pages have to be structured and information is given in the most brief form possible. The explanations are rather spartan and they will take some getting used to, but once you get the hang of using them, you’ll see how useful they actually are.

### Getting Started with the man Pages in Linux

The pages are viewed through a utility called, `man`, and the command to use it is rather easy. In the simplest form, to use `man`, you type `man` on the command line, followed by a `space` and the command that you want to look up, such as `ls` or `cp`, like so:

```
man ls
```

man opens the manual page of the `ls` command.

![][2]

You can move up and down with the arrow keys and press `q` to quit viewing the man page. Usually, the man pages are opened with less so the keyboard shortcuts for less command work in man as well.

For example, you can search for a specific text using /search_term and so on.

There is an introduction to the man pages and it’s important that you read this one. It spells out, in great detail, how the man pages are laid out and organized.

To see this page, open a terminal and type:

```
man man
```

![man page of man][3]

### Section What?

Before you begin to look at man pages much deeper, it will be helpful to know that man pages have a set page layout _and_ a filing scheme. This can be confusing to a newcomer since I can say: “Look at the NAME _section_ of the man page for `ls`.” I can also say, “Look at the man page for `passwd` in _section_ 5.”

I italicized the word, _section_ to try to show a source of confusion. The word, _section_ is being used in two different ways, but the difference isn’t always explained to newcomers.

I am not sure why this confusion sets in, but I have seen it happen a few times back when I trained new users and entry-level sysadmins. I think it might be tunnel vision. Focusing on one thing can make a person forget about another. It’s a lot like not being able to see the forest because the trees are in the way.

To those who know the difference already, you can skip this sub-section. This part is directed to the people new to man pages.

Here is the difference:

#### The man page

Individual man pages are made to show blocks of information. For example, every man page has a **NAME** section to show the name of the command along with a brief description. There will be another block of information, called **SYNOPSIS** to show how the command is used, and so on.

![][4]

Every man page will have these, and other headings. These sections, or headings, on individual man pages, helps keep things consistent and information compartmentalized.

#### The Manual

The use of _section_, as in “Look at the man page for `passwd` in _section_ 5” speaks of the manual as a whole. When we look at only one page, it can be easy to overlook that, but the man page for `passwd` is part of the same manual that has a man page for `ls`, `rm`, `date`, `cal`, and others.

The entire Linux manual is huge; it has thousands of pages. Some of those pages have specialized information. Some pages have information that programmers need, while others have information unique to networking, and others that system administrators would be interested in.

These pages are grouped according to their unique purpose. Think of splitting the entire manual into several chapters – each chapter having a specific topic. There are 9 or so chapters (very large ones at that). It just so happens that these chapters are called _sections_.

To sum this up:

  * Sections of a single page of the manual (what we call the man page) are blocks of information defined by the headings and
  * Sections of the manual-at-large (the collection of all of the pages) are chapters which happen to be called _sections_.



Now you know the difference and, hopefully, the rest of this article will be easier to follow.

### man Page Sections

You will be looking at different man pages so let’s study the individual page layout first.

Manual pages are split into several headings and they may vary from vendor to vendor, but they will be similar. The general breakdown is as follows:

  * NAME
  * SYNOPSIS
  * DESCRIPTION
  * EXAMPLES
  * DIAGNOSTICS
  * FILES
  * LIMITS
  * PORTABILITY
  * SEE ALSO
  * HISTORY WARNING (or Bugs)
  * NOTES



**NAME** – Under this heading is the command name and a brief description of the command.

**SYNOPSIS** – Shows how the command is used. For instance, here is a synopsis of the `cal` command:

```
cal [Month] [Year]
```

The synopsis begins with the name of the command, with a list of options following. The synopsis takes the general form of a command line; it shows what you can type and the order of the arguments. Arguments in square brackets (`[]`) are optional; you can leave these arguments out and the command will still work correctly. Items not in brackets must be used.

Take note that brackets are for readability only. They should not be typed when you enter a command.

**DESCRIPTION** – Describes the command or utility as to what it does and how you can use it. This section usually starts off with an explanation of the synopsis as well as telling what happens if you omit any of the optional arguments. This section may be subdivided for long or complex commands.

**EXAMPLES** – Some man pages provide examples of how the command or utility can be used. If this section is present, the page tries to give a few simple usage examples, as well as more complex examples to show how complex tasks can be completed.

**DIAGNOSTICS** – This section lists status or error messages returned by the command or utility. Self-explanatory error and status messages aren’t usually shown. Messages that may be hard to understand are usually listed.

**FILES** This section contains a list of supplementary files used by UNIX to run this specific command. Here, _supplementary_ files are files not specified on the command line. For example, if you were looking at a man page for the `passwd` command, you may find `/etc/passwd` listed in this section since that is where UNIX stores password information.

**LIMITS** – This section describes any limitations of a utility. Operating system and hardware limitations are usually not listed as they are outside of the utility’s control.

**PORTABILITY** – Lists other systems where the utility is available, along with how other versions of the utility may differ.

**SEE ALSO** – lists related man pages that contain relevant information.

**HISTORY** – Gives a brief history of the command such as when it first appeared.

**WARNING** – If this section is present, it contains important advice for users.

**NOTES** – Not as severe as a warning, but important information.

Again, not all man pages use the exact headings listed above, but they’re close enough to follow.

### The Manual’s Sections

The entire Linux manual collection of pages are traditionally divided into numbered sections:

  * **Section 1** : Shell commands and applications
  * **Section 2** : Basic kernel services – system calls and error codes
  * **Section 3** : Library information for programmers
  * **Section 4** : Network services – if TCP/IP or NFS is installed Device drivers and network protocols
  * **Section 5** : Standard file formats – for example: shows what a _tar_ archive looks like.
  * **Section 6** : Games
  * **Section 7** : Miscellaneous files and documents
  * **Section 8** : System administration and maintenance commands
  * **Section 9** : Obscure kernel specs and interfaces



The grouping of pages into these groups makes for more efficient searching. I sometimes do a little programming where I work, so I spend a little time look at section 3 man pages. I also do a little work in networking, so I’ve been known to wade through the networking section, and as a system administrator of several experimental machines, I spend a good deal of time in section 8.

Grouping pages into specific (chapters) sections make searching for information easier – both for the human needing it, and for the machine doing the searching.

You can tell which page belongs to which section by the number next to the name. For example, if you’re looking at a man page for `ls` and the very top of the page says this: `LS(1)`, you are viewing the `ls` page in section 1, which contains the pages about shell commands and applications.

Here is another example. If you’re looking at a man page for `passwd` and the top of the page shows: `PASSWD(1)`, you are reading the page from section 1 that describes how the `passwd` command changes passwords for user accounts. If you see `PASSWD(5)`, you are reading about the the password file and how it is made up.

![][5]

`passwd` happens to be be two different things: it is the name of a command and a name of a file. Again, section 1 describes the command, while section 5 covers file formats.

The number in the parenthesis is the big clue – that number tells you what section that the page you’re reading, came from.

### Searching for a Specific Section

The basic command:

```
man name
```

will search for the man page identified by _name_ in every section, displaying them one at a time, in numerical order. To limit your search to a specific section, use an argument with the `man` command, like so:

```
man 1 name
```

This command will only search section 1, of the man pages, for _name_. Using our `passwd` example earlier, this means that we can keep the search targeted. If I want to read about the `passwd` command, I can type this in the terminal:

```
man 1 passwd
```

The `man` utility will only search through section 1 for `passwd` and display it. It will not look through any other section for `passwd`.

An alternative method for this command is to type: `man passwd.1`

### Using man -k to Search all man Pages Containing a Certain Keyword

The _man_ command, with the _k_ option (often called a _flag_ or _switch_) can come in handy if you want a listing of man pages containing a certain keyword. For example, if you want to see a list of man pages that deal with, say, `ftp`, you can get this list by typing:

```
man -k ftp
```

From the listing that will follow, you’ll be able to pick a specific man page to read:

![man k example][6]

On some systems, before `man -k` will work, the system administrator will need to run a utility called `catman`.

### Using whatis and whereis Commands to Know the Manual’s Sections

There are two nifty utilities that can be helpful in your search for information: whatis and whereis.

#### whatis

There are times when we can quite get the information we need. Chances are great that the information we need is available – finding it can be a small problem.

For example, if I want to look at the man page about the `passwd` file, and I type this on the terminal:

```
man passwd
```

I would see the page that tells me all about the `passwd` command, but nothing about the `passwd` file. I know that `passwd` is a command and there’s also a `passwd` file, but sometimes, I might forget that. It’s then that I realize that file structures are in a different section in the man pages, so I type:

```
man 4 passwd
```

and I get this reply:

```
No manual entry for passwd in section 4
See 'man 7 undocumented' for help when manual pages are not available.
```

Another lapse of forgetfulness. File structures are in section 4 of System V UNIX pages. Years ago, when I built files, I used `man 4...` _a lot_; it’s still a habit with me. So where is it in the Linux manual?

It’s time to call `whatis` to straighten me out. To do this, I type this in my terminal:

```
whatis passwd
```

and I see the following:

```
passwd (1)           - change user password
passwd (1ssl)        - compute password hashes
passwd (5)           - the password file
```

Ah! the page for the `passwd` file is in section 5. Now I am set straight and can access the information I want:

```
man 5 passwd
```

and I am brought to the man page that has the information I need.

`whatis` is handy utility that can tell you, in a brief one-liner, what a command does. Imagine that you want to know what `cal` does without having to view the man page. Just type this at the command prompt:

```
whatis cal
```

and you will see this in response:

```
cal (1)              - displays a calendar and the date of Easter
```

Now that you know about the `whatis` command, I can let you in on a secret – there is a `man` command equivalent. To get this, we use the `-f` switch: `man -f ...`

Try it out. Type: `whatis cal` at a terminal prompt. Once that executes, type: `man -f cal`. The output of both commands will be identical.

![whatis cal and man f cal outputs are the same][7]

#### whereis

The very name of the `whereis` command explains itself – it tells you where a program is within the filesystem. It will also tell you where the man page is stored too. Using `cal` as an example again, I type this at the prompt:

```
whereis cal
```

I will see this:

![whereis cal output][8]

Look carefully at the reply. The answer is on one line, but it tells me two things:

`/usr/bin/cal` is where the `cal` program is and

`/usr/share/man/man1/cal.1.gz` is where the man page resides (I’m also clued into the fact that the man page is compressed, but not to worry – the man command knows how to decompress it on the fly)

`whereis` is PATH dependent; it can only tell you where files are if they are in your PATH environment.

You may be wondering if there is an equivalent `man` command for `whereis`. There isn’t one that will tell you where the executable file is, but there is a switch you can use that will tell you where the man page is. Using the `date` command in this example, if we type:

```
whereis date
```

at a terminal prompt, we will see:

![whereis date output][9]

We see that the `date` program is in the `/usr/bin/` directory and the name and location of its man page is: `/usr/share/man/man1/date.1.gz`

The closest we can get man to act like `whereis` is to use the `-w` switch. We won’t get the location of the program, but we can at least get the location of the man page, like this:

```
man -w date
```

and we will see this returned:

![][10]

You know about `whatis` and `whereis` as well as a method to get the `man` command to do the same (or close) thing. I showed both ways for a couple of different reasons.

For years, I used `whatis` and `whereis` since they were in my training manuals. I didn’t learn about `man -f ...` and `man -w ...` until fairly recently. I’m sure I looked at the man page for `man` hundreds of times, but I never noticed the `-f` and `-w` switches. I was always looking at the man page for something else (i.e. `man -k ...`). I concentrated only on what I needed to find and ignored the rest. Once I found the information I needed, I would leave the page and get the work done, not paying attention to some of the other gems the command had to offer.

This is okay since this is partly what the man pages are for: to help you get work done.

It wasn’t until I was recently showing someone how to use man pages, that I took the time to just read – “to see what else was possible” – and we took real notice of the information about what the `man` command’s `-f` and `-w` flags can do.

No matter how long you have been using Linux, or how experienced, there is always something new to learn.

The man pages will tell you what you may need to know to work through a certain task – but they also hold a lot more – enough to make you look like a magician – but only if you take the time to read.

### Conclusion

If you spend some time and effort with the man pages, you will come out on top. Your proficiency of the man pages, will play a huge part in your mastery over Linux.

--------------------------------------------------------------------------------

via: https://itsfoss.com/linux-man-page-guide/

作者：[Bill Dyer][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/bill/
[b]: https://github.com/lujun9972
[1]: https://www.britannica.com/biography/Aristotle
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/06/man-page-example-800x527.png?resize=800%2C527&ssl=1
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/05/man_man.png?resize=800%2C455&ssl=1
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/06/man-page-example-1.png?resize=800%2C527&ssl=1
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/06/man-page-passwd-command.png?resize=1026%2C676&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/05/man-k_example.png?resize=800%2C200&ssl=1
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/05/whatis_cal_man-f_cal.png?resize=800%2C135&ssl=1
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/05/whereis_cal.png?resize=800%2C100&ssl=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/05/whereis_date.png?resize=800%2C100&ssl=1
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/05/man-w_date-1.png?resize=800%2C100&ssl=1
