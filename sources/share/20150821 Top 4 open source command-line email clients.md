KevinSJ Translating
Top 4 open source command-line email clients
================================================================================
![](http://opensource.com/sites/default/files/styles/image-full-size/public/images/life/life_mail.png)

Like it or not, email isn't dead yet. And for Linux power users who live and die by the command line, leaving the shell to use a traditional desktop or web based email client just doesn't cut it. After all, if there's one thing that the command line excels at, it's letting you process files, and especially text, with uninterrupted efficiency.

Fortunately, there are a number of great command-line email clients, many with a devoted following of users who can help you get started and answer any questions you might have along the way. But fair warning: once you've mastered one of these clients, you may find it hard to go back to your old GUI-based solution!

To install any of these four clients is pretty easy; most are available in standard repositories for major Linux distributions, and can be installed with a normal package manager. You may also have luck finding and running them on other operating systems as well, although I haven't tried it and can't speak to the experience.

### Mutt ###

- [Project page][1]
- [Source code][2]
- License: [GPLv2][3]

Many terminal enthusiasts may already have heard of or even be familiar with Mutt and Alpine, which have both been on the scene for many years. Let's first take a look at Mutt.

Mutt supports many of the features you've come to expect from any email system: message threading, color coding, availability in a number of languages, and lots of configuration options. It supports POP3 and IMAP, the two most common email transfer protocols, and multiple mailbox formats. Having first been released in 1995, Mutt still has an active development community, but in recent years, new releases have focused on bug fixes and security updates rather than new features. That's okay for many Mutt users, though, who are comfortable with the interface and adhere to the project's slogan: "All mail clients suck. This one just sucks less."

### Alpine ###

- [Project page][4]
- [Source code][5]
- License: [Apache 2.0][6]

Alpine is the other well-known client for terminal email, developed at the University of Washington and designed to be an open source, Unicode-friendly alternative to Pine, also originally from UW.

Designed to be friendly to beginners, but also chocked full of features for advanced users, Alpine also supports a multitude of protocols—IMAP, LDAP, NNTP, POP, SMTP, etc.—as well as different mailbox formats. Alpine is packaged with Pico, a simple text editing utility that many use as a standalone tool, but it also should work with your text editor of choice: vi, Emacs, etc.

While Alpine is still infrequently updated, there is also a fork, re-alpine, which was created to allow a different set of maintainers to continue the project's development.

Alpine features contextual help on the screen, which some users may prefer to breaking out the manual with Mutt, but both are well documented. Between Mutt and Alpine, users may want to try both and let personal preference guide their decision, or they may wish to check out a couple of the newer options below.

### Sup ###

- [Project page][7]
- [Source code][8]
- License: [GPLv2][9]

Sup is the first of two of what can be called "high volume email clients" on our list. Described as a "console-based email client for people with a lot of email," Sup's goal is to provide an interface to email with a hierarchical design and to allow tagging of threads for easier organization.

Written in Ruby, Sup provides exceptionally fast searching, manages your contact list automatically, and allows for custom extensions. For people who are used to Gmail as a webmail interface, these features will seem familiar, and Sup might be seen as a more modern approach to email on the command line.

### Notmuch ###

- [Project page][10]
- [Source code][11]
- License: [GPLv3][12]

"Sup? Notmuch." Notmuch was written as a response to Sup, originally starting out as a speed-focused rewrite of some portions of Sup to enhance performance. Eventually, the project grew in scope and is now a stand-alone email client.

Notmuch is also a fairly trim program. It doesn't actually send or receive email messages on its own, and the code which enables Notmuch's super-fast searching is actually designed as a separate library which the program can call. But its modular nature enables you to pick your favorite tools for composing, sending, and receiving, and instead focuses on doing one task and doing it well—efficient browsing and management of your email.

This list isn’t by any means comprehensive; there are a lot more email clients out there which might be an even better fit for you. What’s your favorite? Did we leave one out that you want to share about? Let us know in the comments below!

--------------------------------------------------------------------------------

via: http://opensource.com/life/15/8/top-4-open-source-command-line-email-clients

作者：[Jason Baker][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://opensource.com/users/jason-baker
[1]:http://www.mutt.org/
[2]:http://dev.mutt.org/trac/
[3]:https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html
[4]:http://www.washington.edu/alpine/
[5]:http://www.washington.edu/alpine/acquire/
[6]:http://www.apache.org/licenses/LICENSE-2.0
[7]:http://supmua.org/
[8]:https://github.com/sup-heliotrope/sup
[9]:https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html
[10]:http://notmuchmail.org/
[11]:http://notmuchmail.org/releases/
[12]:http://www.gnu.org/licenses/gpl.html
