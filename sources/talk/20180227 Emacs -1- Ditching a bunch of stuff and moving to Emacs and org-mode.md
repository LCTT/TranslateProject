Emacs #1: Ditching a bunch of stuff and moving to Emacs and org-mode
======
I’ll admit it. After over a decade of vim, I’m hooked on [Emacs][1].

I’ve long had this frustration over how to organize things. I’ve followed approaches like [GTD][2] and [ZTD][3], but things like email or large files are really hard to organize.

I had been using Asana for tasks, Evernote for notes, Thunderbird for email, a combination of ikiwiki and some other items for a personal knowledge base, and various files in an archive directory on my PC. When my new job added Slack to the mix, that was finally the last straw.

A lot of todo-management tools integrate with email — poorly. When you want to do something like “remind me to reply to this in a week”, a lot of times that’s impossible because the tool doesn’t store the email in a fashion you can easily reply to. And that problem is even worse with Slack.

It was right around then that I stumbled onto [Carsten Dominik’s Google Talk on org-mode][4]. Carsten was the author of org-mode, and although the talk is 10 years old, it is still highly relevant.

I’d stumbled across [org-mode][5] before, but each time I didn’t really dig in because I had the reaction of “an outliner? But I need a todo list.” Turns out I was missing out. org-mode is all that.

### Just what IS Emacs? And org-mode?

Emacs grew up as a text editor. It still is, and that heritage is definitely present throughout. But to say Emacs is an editor would be rather unfair.

Emacs is something more like a platform or a toolkit. Not only do you have source code to it, but the very configuration is a program, and there are hooks all over the place. It’s as if it was super easy to write a Firefox plugin. A couple lines, and boom, behavior changed.

org-mode is very similar. Yes, it’s an outliner, but that’s not really what it is. It’s an information organization platform. Its website says “Your life in plain text: Org mode is for keeping notes, maintaining TODO lists, planning projects, and authoring documents with a fast and effective plain-text system.”

### Capturing

If you’ve ever read productivity guides based on GTD, one of the things they stress is effortless capture of items. The idea is that when something pops into your head, get it down into a trusted system quickly so you can get on with what you were doing. org-mode has a capture system for just this. I can press `C-c c` from anywhere in Emacs, and up pops a spot to type my note. But, critically, automatically embedded in that note is a link back to what I was doing when I pressed `C-c c`. If I was editing a file, it’ll have a link back to that file and the line I was on. If I was viewing an email, it’ll link back to that email (by Message-Id, no less, so it finds it in any folder). Same for participating in a chat, or even viewing another org-mode entry.

So I can make a note that will remind me in a week to reply to a certain email, and when I click the link in that note, it’ll bring up the email in my mail reader — even if I subsequently archived it out of my inbox.

YES, this is what I was looking for!

### The tool suite

Once you’re using org-mode, pretty soon you want to integrate everything with it. There are browser plugins for capturing things from the web. Multiple Emacs mail or news readers integrate with it. ERC (IRC client) does as well. So I found myself switching from Thunderbird and mairix+mutt (for the mail archives) to mu4e, and from xchat+slack to ERC.

And wouldn’t you know it, I liked each of those Emacs-based tools **better** than the standalone they replaced.

A small side tidbit: I’m using OfflineIMAP again! I even used it with GNUS way back when.

### One Emacs process to rule them

I used to use Emacs extensively, way back. Back then, Emacs was a “large” program. (Now my battery status applet literally uses more RAM than Emacs). There was this problem of startup time back then, so there was a way to connect to a running Emacs process.

I like to spawn programs with Mod-p (an xmonad shortcut to a dzen menubar, but Alt-F2 in more traditional DEs would do the trick). It’s convenient to not run several emacsen with this setup, so you don’t run into issues with trying to capture to a file that’s open in another one. The solution is very simple: I created a script, named it `em`, and put it on my path. All it does is this:

`#!/bin/bash exec emacsclient -c -a "" "$@"`

It creates a new emacs process if one doesn’t already exist; otherwise, it uses what you’ve got. A bonus here: parameters such as `-nw` work just fine, so it really acts just as if you’d typed `emacs` at the shell prompt. It’s a suitable setting for `EDITOR`.

### Up next…

I’ll be talking about my use of, and showing off configurations for:

  * org-mode, including syncing between computers, capturing, agenda and todos, files, linking, keywords and tags, various exporting (slideshows), etc.
  * mu4e for email, including multiple accounts, bbdb integration
  * ERC for IRC and IM


--------------------------------------------------------------------------------

via: http://changelog.complete.org/archives/9861-emacs-1-ditching-a-bunch-of-stuff-and-moving-to-emacs-and-org-mode

作者：[John Goerzen][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://changelog.complete.org/archives/author/jgoerzen
[1]:https://www.gnu.org/software/emacs/
[2]:https://gettingthingsdone.com/
[3]:https://zenhabits.net/zen-to-done-the-simple-productivity-e-book/
[4]:https://www.youtube.com/watch?v=oJTwQvgfgMM
[5]:https://orgmode.org/
