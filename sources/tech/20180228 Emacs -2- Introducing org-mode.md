[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: subject: (Emacs #2: Introducing org-mode)
[#]: via: (https://changelog.complete.org/archives/9865-emacs-2-introducing-org-mode)
[#]: author: (John Goerzen http://changelog.complete.org/archives/author/jgoerzen)
[#]: url: ( )

Emacs #2: Introducing org-mode
======

In [my first post in my series on Emacs][1], I described returning to Emacs after over a decade of vim, and org-mode being the reason why.

I really am astounded at the usefulness, and simplicity, of org-mode. It is really a killer app.

**So what exactly is org-mode?**

I wrote yesterday:

> It’s an information organization platform. Its website says “Your life in plain text: Org mode is for keeping notes, maintaining TODO lists, planning projects, and authoring documents with a fast and effective plain-text system.”

That’s true, but doesn’t quite capture it. org-mode is a toolkit for you to organize things. It has reasonable out-of-the-box defaults, but it’s designed throughout for you to customize.

To highlight a few things:

  * **Maintaining TODO lists** : items can be scattered across org-mode files, contain attachments, have tags, deadlines, schedules. There is a convenient “agenda” view to show you what needs to be done. Items can repeat.
  * **Authoring documents** : org-mode has special features for generating HTML, LaTeX, slides (with LaTeX beamer), and all sorts of other formats. It also supports direct evaluation of code in-buffer and literate programming in virtually any Emacs-supported language. If you want to bend your mind on this stuff, read [this article on literate devops][2]. The [entire Worg website][3]
is made with org-mode.
  * **Keeping notes** : yep, it can do that too. With full-text search, cross-referencing by file (as a wiki), by UUID, and even into other systems (into mu4e by Message-ID, into ERC logs, etc, etc.)



**Getting started**

I highly recommend watching [Carsten Dominik’s excellent Google Talk on org-mode][4]. It is an excellent introduction.

org-mode is included with Emacs, but you’ll often want a more recent version. Debian users can `apt-get install org-mode`, or it comes with the Emacs packaging system; `M-x package-install RET org-mode RET` may do it for you.

Now, you’ll probably want to start with the org-mode compact guide’s [introduction section][5], noting in particular to set the keybindings mentioned in the [activation section][6].

**A good tutorial…**

I’ve linked to a number of excellent tutorials and introductory items; this post is not going to serve as a tutorial. There are two good videos linked at the end of this post, in particular.

**Some of my configuration**

I’ll document some of my configuration here, and go into a bit of what it does. This isn’t necessarily because you’ll want to copy all of this verbatim — but just to give you a bit of an idea of some of what can be configured, an idea of what to look up in the manual, and maybe a reference for “now how do I do that?”

First, I set up Emacs to work in UTF-8 by default.
```
(prefer-coding-system 'utf-8) (set-language-environment "UTF-8")
```

org-mode can follow URLs. By default, it opens in Firefox, but I use Chromium.
```
(setq browse-url-browser-function 'browse-url-chromium)
```

I set the basic key bindings as documented in the Guide, plus configure the M-RET behavior.

```
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-M-RET-may-split-line nil)
```


**Configuration: Capturing**

I can press `C-c c` from anywhere in Emacs. It will [capture something for me][7], and include a link back to whatever I was working on.

You can define [capture templates][8] to set how this will work. I am going to keep two journal files for general notes about meetings, phone calls, etc. One for personal, one for work items. If I press `C-c c j`, then it will capture a personal item. The %a in all of these includes the link to where I was (or a link I had stored with `C-c l`).

```
(setq org-default-notes-file "~/org/tasks.org")
(setq org-capture-templates
 '(
 ("t" "Todo" entry (file+headline "inbox.org" "Tasks")
 "* TODO %?\n %i\n %u\n %a")
 ("n" "Note/Data" entry (file+headline "inbox.org" "Notes/Data")
 "* %? \n %i\n %u\n %a")
 ("j" "Journal" entry (file+datetree "~/org/journal.org")
 "* %?\nEntered on %U\n %i\n %a")
 ("J" "Work-Journal" entry (file+datetree "~/org/wjournal.org")
 "* %?\nEntered on %U\n %i\n %a")
 ))
(setq org-irc-link-to-logs t)
```

I like to link by UUIDs, which lets me move things between files without breaking locations. This helps generate UUIDs when I ask Org to store a link target for future insertion.

```
(require 'org-id)
(setq org-id-link-to-org-use-id 'create-if-interactive)
```

**Configuration: agenda views**

I like my week to start on a Sunday, and for org to note the time when I mark something as done.

```
(setq org-log-done 'time)
(setq org-agenda-start-on-weekday 0)
```

**Configuration: files and refiling**

Here I tell it what files to use in the agenda, and to add a few more to the plain text search. I like to keep a general inbox (from which I can move, or “refile”, content), and then separate tasks, journal, and knowledge base for personal and work items.

```
 (setq org-agenda-files (list "~/org/inbox.org"
 "~/org/email.org"
 "~/org/tasks.org"
 "~/org/wtasks.org"
 "~/org/journal.org"
 "~/org/wjournal.org"
 "~/org/kb.org"
 "~/org/wkb.org"
 ))
 (setq org-agenda-text-search-extra-files
 (list "~/org/someday.org"
 "~/org/config.org"
 ))

 (setq org-refile-targets '((nil :maxlevel . 2)
 (org-agenda-files :maxlevel . 2)
 ("~/org/someday.org" :maxlevel . 2)
 ("~/org/templates.org" :maxlevel . 2)
 )
 )
(setq org-outline-path-complete-in-steps nil) ; Refile in a single go
(setq org-refile-use-outline-path 'file)
```

**Configuration: Appearance**

I like a pretty screen. After you’ve gotten used to org a bit, you might try this.

```
(require 'org-bullets)
(add-hook 'org-mode-hook
 (lambda ()
 (org-bullets-mode t)))
(setq org-ellipsis "⤵")
```

**Coming up next…**

This hopefully showed a few things that org-mode can do. Coming up next, I’ll cover how to customize TODO keywords and tags, archiving old tasks, forwarding emails to org-mode, and using git to synchronize between machines.

You can also see a [list of all articles in this series][9].



--------------------------------------------------------------------------------

via: https://changelog.complete.org/archives/9865-emacs-2-introducing-org-mode

作者：[John Goerzen][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://changelog.complete.org/archives/author/jgoerzen
[b]: https://github.com/lujun9972
[1]: https://changelog.complete.org/archives/9861-emacs-1-ditching-a-bunch-of-stuff-and-moving-to-emacs-and-org-mode
[2]: http://www.howardism.org/Technical/Emacs/literate-devops.html
[3]: https://orgmode.org/worg/
[4]: https://www.youtube.com/watch?v=oJTwQvgfgMM
[5]: https://orgmode.org/guide/Introduction.html#Introduction
[6]: https://orgmode.org/guide/Activation.html#Activation
[7]: https://orgmode.org/guide/Capture.html#Capture
[8]: https://orgmode.org/guide/Capture-templates.html#Capture-templates
[9]: https://changelog.complete.org/archives/tag/emacs2018
