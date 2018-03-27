Linux command line tools for working with non-Linux users
======
![](https://images.techhive.com/images/article/2016/06/linux-shell-100666628-large.jpg)
I spend most of my computing life in the Shell (command line, terminal or whatever you want to call it on your platform of choice). This can be a bit challenging, though, when I need to work with large groups of other people, especially in big enterprise companies that -- well -- use anything but the Shell.

The problems that crop up are made worse when other people within your company use a different platform than you. I tend to use Linux. If I'm doing a lot of my daily work from a Linux terminal and the bulk of my co-workers use Windows 10 (entirely from the GUI side), things can get … problematic.

 **Also on Network World:**[ **11 pointless but awesome Linux terminal tricks**][1]

Luckily, over the past few years, I've figured out how to deal with these problems. I've found ways to make using a Linux (or other Unix-like systems) Shell much more doable within a non-Unix, corporate environment. These tools/tips apply equally well for SysAdmins working on a company's servers as they do for developers or marketing people.

## Command line tools for working with non-Linux users

Let's start by focusing on the two areas that seem to be the hardest to solve for many people in big companies: document compatibility and enterprise instant messaging.

### Document compatibility between Linux and non-Linux systems

One of the biggest issues that crops up is that of simple word processing document compatibility.

Let's say your company has standardized on Microsoft Office. This makes you sad. But do not lose hope! There are ways to make this (mostly) work -- even from the Shell.

Two tools are critical in my arsenal: [Pandoc][2] and [Wordgrinder][3].

Wordgrinder is a simple, straight-to-the-point word processor. It may not be as full-featured as LibreOffice (or, really, any major GUI word-processing application), but it's fast. It's stable. And it supports just enough features (and file formats) to get the job done. In fact, I write the majority of my articles and books entirely in Wordgrinder.

But there's a problem (you knew there had to be).

Wordgrinder doesn't support .doc (or .docx) files. That means it can't read most files that your Windows- and MS Office-using co-workers send you.

That's where Pandoc comes in. It's a simple document converter that takes a wide range of files as input (MS Word, LibreOffice, HTML, markdown, etc.) and converts them to something else. The number of formats supported here is absolutely phenomenal -- PDF, ePub, various slideshow formats. It really makes converting documents between formats a breeze.

That's not to say I don't occasionally encounter formatting or feature issues. Converting a Word document that has a lot of custom formatting, some scripting, and an embedded chart? Yeah, a lot of that will be lost in the process.

But in practical terms, the combination of Pandoc (for converting files) and Wordgrinder (for document editing) has proven quite capable and powerful.

### Corporate instant messaging between Linux and non-Linux systems

Every company likes to standardize on an instant messaging system -- something for all employees to use to keep in real-time contact.

From the command line, this can get tricky. What if your company uses Google Hangouts? Or how about Novell GroupWise Messenger? Neither have officially supported, terminal-based clients.

Thank goodness, then, for [Finch & Hangups][4].

Finch is sort of the terminal version of Pidgin (the open-source, multi-protocol messenger client). It supports a wide variety of protocols, including Novell GroupWise, (the soon to be dead) AOL Instant Messenger, and a bunch of others.

And Hangups is an open implementation of a Google Hangouts client -- complete with message history and a nice tabbed interface.

Neither of these solutions will provide you with voice or video chat capabilities, but for text-based messaging, they work delightfully well. They aren't perfect (the user interface of Finch takes some getting used to), but they're definitely good enough to keep in touch with your co-workers.

Will these solutions allow you to spend your entire work day within the comforts of a text-only Shell? Probably not. Personally, I find that (with these tools, and others) I can comfortably spend roughly 80 percent of my day in a text-only interface.

Which feels pretty darn great.


--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3235688/linux/linux-command-line-tools-for-working-with-non-linux-users.html

作者：[Bryan Lunduke][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.networkworld.com/author/Bryan-Lunduke/
[1]:http://www.networkworld.com/article/2926630/linux/11-pointless-but-awesome-linux-terminal-tricks.html#tk.nww-fsb
[2]:https://www.youtube.com/watch?v=BkTYHChkDoE
[3]:https://www.youtube.com/watch?v=WnMyamBgKFE
[4]:https://www.youtube.com/watch?v=19lbWnYOsTc
