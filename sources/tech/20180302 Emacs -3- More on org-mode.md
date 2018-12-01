[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: subject: (Emacs #3: More on org-mode)
[#]: via: (https://changelog.complete.org/archives/9877-emacs-3-more-on-org-mode)
[#]: author: (John Goerzen http://changelog.complete.org/archives/author/jgoerzen)
[#]: url: ( )

Emacs #3: More on org-mode
======

This is third in [a series on Emacs and org-mode][1].

**Todo tracking and keywords**

When using org-mode to [track your TODOs][2], it can have multiple states. You can press `C-c C-t` for a quick shift between states. I have set this:

```
(setq org-todo-keywords '(
 (sequence "TODO(t!)" "NEXT(n!)" "STARTED(a!)" "WAIT(w@/!)" "OTHERS(o!)" "|" "DONE(d)" "CANCELLED(c)")
))
```

Here, I set up 5 states that are for a task that is not yet done: TODO, NEXT, STARTED, WAIT, and OTHERS. Each has a single-character shortcut (t, n, a, etc). The states after the pipe symbol are ones that are considered “done”. I have two: DONE (for things that I have done) and CANCELED (for things that I haven’t done, but for whatever reason, won’t).

The exclamation mark means to log the time when an item was changed to a state. I don’t add this to the done states because those are already logged anyhow. The @ sign means to prompt for a reason; so when switching to WAIT, org-mode will ask me why and add this to the note.

Here’s an example of an entry that has had some state changes:

```
** DONE This is a test
 CLOSED: [2018-03-02 Fri 03:05]

 - State "DONE" from "WAIT" [2018-03-02 Fri 03:05]
 - State "WAIT" from "TODO" [2018-03-02 Fri 03:05] \\
 waiting for pigs to fly
 - State "TODO" from "NEXT" [2018-03-02 Fri 03:05]
 - State "NEXT" from "TODO" [2018-03-02 Fri 03:05]
```

Here, the most recent items are on top.

**Agenda mode, schedules, and deadlines**

When you’re in a todo item, C-c C-s or C-c C-d can set a schedule or a deadline for it, respectively. These show up in agenda mode. The difference is in intent and presentation. A schedule is something that you expect to work on at around a time, while a deadline is something that is due at a specific time. By default, the agenda view will start warning you about deadline items in advance.

And while we’re at it, the [agenda view][3] will show you the items that you have coming up, offers a nice way to search for items based on plain text or tags, and handles bulk manipulation of items even across multiple files. I covered setting the files for agenda mode in [part 2][4] of this series.

**Tags**

Of course org-mode has [tags][5]. You can quickly set them with C-c C-q.

You can set shortcuts for tags you might like to use often. Perhaps something like this:

```
(setq org-tag-persistent-alist
'(("@phone" . ?p)
("@computer" . ?c)
("@websurfing" . ?w)
("@errands" . ?e)
("@outdoors" . ?o)
("MIT" . ?m)
("BIGROCK" . ?b)
("CONTACTS" . ?C)
("INBOX" . ?i)
))
```

You can also add tags to this list on a per-file basis, and also set tags for something on a per-file basis. I use that for my inbox.org and email.org files to set an INBOX tag. I can then review all items tagged INBOX from the agenda view each day, and the simple act of refiling them into other files will cause them to lost the INBOX tag.

**Refiling**

“Refiling” is moving things around, either within a file or elsewhere. It has completion using your headlines. `C-c C-w` does this. I like these settings:

```
(setq org-outline-path-complete-in-steps nil) ; Refile in a single go
(setq org-refile-use-outline-path 'file)
```

**Archiving**

After awhile, you’ll get your files all cluttered with things that are done. org-mode has an [archive][6] feature to move things out of your main .org files and into some other files for future reference. If you have your org files in git or something, you may wish to delete these other files since you’d have things in history anyhow, but I find them handy for grepping and searching.

I periodically want to go through and archive everything in my files. Based on a [stackoverflow discussion][7], I have this code:

```
(defun org-archive-done-tasks ()
 (interactive)
 (org-map-entries
 (lambda ()
 (org-archive-subtree)
 (setq org-map-continue-from (outline-previous-heading)))
 "/DONE" 'file)
 (org-map-entries
 (lambda ()
 (org-archive-subtree)
 (setq org-map-continue-from (outline-previous-heading)))
 "/CANCELLED" 'file)
)
```

This is based on [a particular answer][8] — see the comments there for some additional hints. Now you can run `M-x org-archive-done-tasks` and everything in the current file marked DONE or CANCELED will be pulled out into a different file.

**Up next**

I’ll wrap up org-mode with a discussion of automatically receiving emails into org, and syncing org between machines.



--------------------------------------------------------------------------------

via: https://changelog.complete.org/archives/9877-emacs-3-more-on-org-mode

作者：[John Goerzen][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://changelog.complete.org/archives/author/jgoerzen
[b]: https://github.com/lujun9972
[1]: https://changelog.complete.org/archives/tag/emacs2018
[2]: https://orgmode.org/guide/TODO-Items.html#TODO-Items
[3]: https://orgmode.org/guide/Agenda-Views.html#Agenda-Views
[4]: https://changelog.complete.org/archives/9865-emacs-2-introducing-org-mode
[5]: https://orgmode.org/guide/Tags.html#Tags
[6]: https://orgmode.org/guide/Archiving.html#Archiving
[7]: https://stackoverflow.com/questions/6997387/how-to-archive-all-the-done-tasks-using-a-single-command
[8]: https://stackoverflow.com/a/27043756
