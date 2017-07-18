How to use a man page: Faster than a Google search
============================================================

### Linux manual pages are easier to use than you think and hold a wealth of information.


![How to use a man page: Faster than a Google search](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/yearbook-haff-rx-linux-file-lead_0.png?itok=48iDNoH8 "How to use a man page: Faster than a Google search")
Image by : 

[Internet Archive Book Images][8]. Modified by Opensource.com. CC BY-SA 4.0

It's easy to get into the habit of googling anything you want to know about a command or operation in Linux, but I'd argue there's something even better: a living and breathing, complete reference, the **man pages**, which is short for manual pages.

The history of man pages predates Linux, all the way back to the early days of Unix. [According to Wikipedia][9], Dennis Ritchie and Ken Thompson wrote the first man pages in 1971, well before the days of personal computers, around the time when many calculators in use were the size of toaster ovens. Man pages also have a reputation of being terse and, in a way, have a language of their own. Just like Unix and Linux, the man pages have not been static, and they continue to be developed and maintained just like the kernel.

Man pages are divided into sections referenced by numbers:

1.  General user commands

2.  System calls

3.  Library functions

4.  Special files and drivers

5.  File formats

6.  Games and screensavers

7.  Miscellanea

8.  System administration commands and daemons

Even so, users generally don't need to know the section where a particular command lies to find what they need.

The files are formatted in a way that may look odd to many users today. Originally, they were written in in an old form of markup called **troff** because they were designed to be printed through a PostScript printer, so they included formatting for headers and other layout aspects. In Linux, [**groff** ][10]is used instead.

In my Fedora, the man pages are located in **/usr/share/man** with subdirectories (like **man1** for Section 1 commands) as well as additional subdirectories for translations of the man pages.

If you look up the man page for the command **man**, you'll see the file **man.1.gz**, which is the man pages compressed with the **gzip** utility. To access a man page, type a command such as:

```
man man
```

for example, to show the man page for **man**. This uncompresses the man page, interprets the formatting commands, and displays the results with [**less**][11], so navigation is the same as when you use **less**.

All man pages should have the following subsections: **Name**, **Synopsis**, **Description**, **Examples**, and **See** **Also**. Many have additional sections, like **Options**, **Exit** **Status**, **Environment**, **Bugs**, **Files**, **Author**, **Reporting** **Bugs**, **History**, and **Copyright**.

### Breaking down a man page

To explain how to interpret a typical man page, let's use the [man page for **ls**][12] as an example. Under **Name**, we see

```
ls - list directory contents
```

which tells us what **ls** means in the simplest terms.

Under **Synopsis**, we begin to see the terseness:

```
ls [OPTION]... [FILE]…
```

Any element that occurs inside brackets is optional. The above command means you can legitimately type **ls** and nothing else. The ellipsis after each element indicates that you can include as many options as you want (as long as they're compatible with each other) and as many files as you want. You can specify a directory name, and you can also use ***** as a wildcard. For example:

```
ls Documents/*.txt
```

Under **Description**, we see a more verbose description of what the command does, followed by a list of the available options for the command. The first option for **ls** is

```
-a, --all 
        do not ignore entries starting with .
```

If we want to use this option, we can either type the short form syntax, **-a**, or the long form **--all**. Not all options have two forms (e.g., **--author**), and even when they do, they aren't always so obviously related (e.g., -**F, --classify**). When you want to use multiple options, you can either type the short forms with spaces in between or type them with a single hyphen and no spaces (as long as they do not require further sub-options). Therefore,

```
ls -a -d -l
```

and

```
ls -adl
```

are equivalent.

The command **tar** is somewhat unique, presumably due to its long history, in that it doesn't require a hyphen at all for the short form. Therefore,

```
tar -cvf filearchive.tar thisdirectory/
```

and

```
tar cvf filearchive.tar thisdirectory/
```

are both legitimate.

On the **ls** man page, after **Description** are **Author**, **Reporting Bugs**, **Copyright**, and **See Also**.

The **See Also** section will often suggest related man pages, so it is generally worth a glance. After all, there is much more to man pages than just commands.

More Linux resources

*   [What is Linux?][1]

*   [What are Linux containers?][2]

*   [Download Now: Linux commands cheat sheet][3]

*   [Advanced Linux commands cheat sheet][4]

*   [Our latest Linux articles][5]

Certain commands that are specific to Bash and not system commands, like **alias**, **cd**, and a number of others, are listed together in a single **BASH_BUILTINS** man page. While the documentation for these is even more terse and compact, overall it contains similar information.

I find that man pages offer a lot of good, usable information, especially when I need a command I haven't used recently, and I need to brush up on the options and requirements. This is one place where the man pages' much-maligned terseness is actually very beneficial.

--------------------------------------------------------------------------------

作者简介：

Greg Pittman - Greg is a retired neurologist in Louisville, Kentucky, with a long-standing interest in computers and programming, beginning with Fortran IV in the 1960s. When Linux and open source software came along, it kindled a commitment to learning more, and eventually contributing. He is a member of the Scribus Team.


via: https://opensource.com/article/17/7/using-man-pages

作者：[ Greg Pittman ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/greg-p
[1]:https://opensource.com/resources/what-is-linux?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[2]:https://opensource.com/resources/what-are-linux-containers?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[3]:https://developers.redhat.com/promotions/linux-cheatsheet/?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[4]:https://developers.redhat.com/cheat-sheet/advanced-linux-commands-cheatsheet?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[5]:https://opensource.com/tags/linux?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[6]:https://opensource.com/article/17/7/using-man-pages?rate=W0QImEyJK1b4qSGof6I3agtPeTpPQXkaSekp_bI_Rno
[7]:https://opensource.com/user/30666/feed
[8]:https://www.flickr.com/photos/internetarchivebookimages/14803082483/in/photolist-oy6EG4-pZR3NZ-i6r3NW-e1tJSX-boBtf7-oeYc7U-o6jFKK-9jNtc3-idt2G9-i7NG1m-ouKjXe-owqviF-92xFBg-ow9e4s-gVVXJN-i1K8Pw-4jybMo-i1rsBr-ouo58Y-ouPRzz-8cGJHK-85Evdk-cru4Ly-rcDWiP-gnaC5B-pAFsuf-hRFPcZ-odvBMz-hRCE7b-mZN3Kt-odHU5a-73dpPp-hUaaAi-owvUMK-otbp7Q-ouySkB-hYAgmJ-owo4UZ-giHgqu-giHpNc-idd9uQ-osAhcf-7vxk63-7vwN65-fQejmk-pTcLgA-otZcmj-fj1aSX-hRzHQk-oyeZfR
[9]:https://en.wikipedia.org/wiki/Man_page
[10]:https://en.wikipedia.org/wiki/Groff_(software)
[11]:https://en.wikipedia.org/wiki/Less_(Unix)
[12]:http://linuxcommand.org/man_pages/ls1.html
[13]:https://opensource.com/users/greg-p
[14]:https://opensource.com/users/greg-p
[15]:https://opensource.com/article/17/7/using-man-pages#comments
