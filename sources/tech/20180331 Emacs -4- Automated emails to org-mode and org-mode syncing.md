Emacs #4: Automated emails to org-mode and org-mode syncing
======
This is fourth in [a series on Emacs and org-mode][1].

Hopefully by now you’ve started to see how powerful and useful org-mode is. If you’re like me, you’re thinking:

“I’d really like to have this in sync across all my devices.”

and, perhaps:

“Can I forward emails into org-mode?”

This being Emacs, the answers, of course, are “Yes.”

### Syncing

Since org-mode just uses text files, syncing is pretty easily accomplished using any number of tools. I use git with git-remote-gcrypt. Due to some limitations of git-remote-gcrypt, each machine tends to push to its own branch, and to master on command. Each machine merges from all the other branches and pushes the result to master after a merge. A cron job causes pushes to the machine’s branch to happen, and a bit of elisp coordinates it all — making sure to save buffers before a sync, refresh them from disk after, etc.

The code for this post is somewhat more extended, so I will be linking to it on github rather than posting inline.

I have a directory $HOME/org where all my org-stuff lives. In ~/org lives [a Makefile][2] that handles the syncing. It defines these targets:

  * push: adds, commits, and pushes to a branch named after the machine’s hostname
  * fetch: does a simple git fetch
  * sync: adds, commits, pulls remote changes, merges, and (assuming the merge was successful) pushes to the branch named after the machine’s hostname plus master



Now, in my user’s crontab, I have this:
```
*/15 * * * * make -C $HOME/org push fetch 2>&1 | logger --tag 'orgsync'

```

The [accompanying elisp code][3] defines a shortcut (C-c s) to cause a sync to occur. Thanks to the cronjob, as long as files were saved — even if I didn’t explicitly sync on the other boxen — they’ll be pulled in.

I have found this setup to work really well.

### Emailing to org-mode

Before going down this path, one should ask the question: do you really need it? I use org-mode with mu4e, and the integration is excellent; any org task can link to an email by message-id, and this is ideal — it lets a person do things like make a reminder to reply to a message in a week.

However, org is not just about reminders. It’s also a knowledge base, authoring system, etc. And, not all of my mail clients use mu4e. (Note: things like MobileOrg exist for mobile devices). I don’t actually use this as much as I thought I would, but it has its uses and I thought I’d document it here too.

Now I didn’t want to just be able to accept plain text email. I wanted to be able to handle attachments, HTML mail, etc. This quickly starts to sound problematic — but with tools like ripmime and pandoc, it’s not too bad.

The first step is to set up some way to get mail into a specific folder. A plus-extension, special user, whatever. I then use a [fetchmail configuration][4] to pull it down and run my [insorgmail][5] script.

This script is where all the interesting bits happen. It starts with ripmime to process the message. HTML bits are converted from HTML to org format using pandoc. an org hierarchy is made to represent the structure of the email as best as possible. emails can get pretty complicated, with HTML and the rest, but I have found this does an acceptable job with my use cases.

### Up next…

My last post on org-mode will talk about using it to write documents and prepare slides — a use for which I found myself surprisingly pleased with it, but which needed a bit of tweaking.



--------------------------------------------------------------------------------

via: http://changelog.complete.org/archives/9898-emacs-4-automated-emails-to-org-mode-and-org-mode-syncing

作者：[John Goerzen][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://changelog.complete.org/
[1]:https://changelog.complete.org/archives/tag/emacs2018
[2]:https://github.com/jgoerzen/public-snippets/blob/master/emacs/org-tools/Makefile
[3]:https://github.com/jgoerzen/public-snippets/blob/master/emacs/org-tools/emacs-config.org
[4]:https://github.com/jgoerzen/public-snippets/blob/master/emacs/org-tools/fetchmailrc.orgmail
[5]:https://github.com/jgoerzen/public-snippets/blob/master/emacs/org-tools/insorgmail
