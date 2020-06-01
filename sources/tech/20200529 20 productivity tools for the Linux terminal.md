[#]: collector: (lujun9972)
[#]: translator: (lxbwolf)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (20 productivity tools for the Linux terminal)
[#]: via: (https://opensource.com/article/20/6/productivity-tools-linux-terminal)
[#]: author: (Alan Smithee https://opensource.com/users/alansmithee)

20 productivity tools for the Linux terminal
======
Try some of these open source tools. Get more done.
![Computer screen with files or windows open][1]

Many of us, admittedly, only use computers because they're fun. But some people use computers to get stuff done, and their theory is computers are supposed to make things faster, better, and more organized. In practice, though, computers don't necessarily improve our lives without a little manual reconfiguration to match our individual work styles.

[Kevin Sonney][2] likes to design systems, not just for networks but for improving his own workday, and this year he covered 18 different productivity tools in a series of 20 articles. This article gets all of Kevin's favorite tools in one place and provides a quick summary of what each one can do for you.

### File sync

![][3]

Important files deserve to be managed carefully.

  * [Syncthing][4] is a way for you to keep files on different devices in sync with one another. A _device_ can be a Linux, Windows, or Mac computer, a server, an Android tablet or phone, and so on, and the files can be any file you want to keep updated across many machines. Syncthing is lightweight and peer-to-peer, so you don't need to pay for a service, you don't need a third-party server, and it's fast.
  * Synchronization is one thing, but sometimes you also need help dealing with the files you have. Say you want an application to behave differently depending on whether it's being used as a graphical application or as a console application. You could change the config file between, say, `.foo-gui` and ****`.foo-term` by changing which its symlink points to. Doing that manually is entirely possible, but it could be scripted, or you could just use [GNU Stow][5] instead.



### Email management

![][6]

We all depend on email and inboxes, but few of us seem to be comfortable with how we manage it. If you're inclined to working in the terminal, why not stay in the terminal for email? It's one thing to check and send email from a terminal, but it's even more exciting to organize your email that way. If you're a typist by trade and scripter by nature, check out some of these tools.

  * I use [OfflineIMAP][7] every day to sync work email to my laptop for viewing in Mutt. It's a specific tool that does exactly one thing: it ensures that a local copy of your email inbox mirrors your remote inbox. It's relatively easy to set up and schedule with [cron][8], and then you can forget it exists. Easy and worth every minute you spend fighting with IMAP.
  * [Notmuch][9] indexes, tags, and searches mail messages. If you have a problem with your inbox, it takes _not much_ effort to remedy it.
  * [Vim][10] can check and send email and manage your calendar.
  * [Emacs][11], of course, also does email and calendaring.



### Calendars and contacts

![][12]

Every Linux system I've ever used comes with the `cal` command installed. This is a handy little calendar for the terminal, and it's a great quick reference. However, it's hardly what you'd call a calendaring application. The [iCalendar][13] specification (no relation to Apple's old desktop calendar) provides rich shared calendaring functionality, and while `.ics` appointments and events are plain text, the workflow for managing them in the terminal is basically non-existent. Or at least, it was non-existent until khal and vdirsyncer.

  * [Khal][14] is a console-based calendar that reads and writes `.ics` files.
  * [Vdirsyncer][14] is a terminal command that synchronizes online calendars (and contacts) to your local drive. Khal works locally and vdirsyncer works remotely, so your calendars online stay in sync with the calendar you're managing on your hard drive. ****
  * Contact management can be hard, but it gets easier if you use [Khard][15], a terminal command that reads and writes files in the vCard format. This, in turn, can be synchronized to a remote server using vdirsyncer (which you may already be using for your khal calendar). This makes calendaring and contacts easy, and it's easier than ever to [run your own personal information management (PIM) server][16].



### To-do lists

![][17]

  * There are many ways to organize your day, but one of the easiest is [todo.txt][18], a simple, portable, understandable system that doesn't break down even if a device doesn't have todo.txt installed on it. The reason todo.txt works is because it's just a Bash shell script, which will run on nearly any computing device you can find. The process is simple: you download the script, install it to your home directory, and start scheduling tasks with a simple command. If you're on a computer that doesn't have the `todo.sh` command installed, your to-do list is still useful as a plain-text file, which you can update manually as needed.
  * [Jrnl][19] is a digital notebook to keep track of your daily agenda and activities. This is the program you've been looking for if you compulsively jot notes on scraps of paper on your desk or echo idle thoughts into random text files.



### Keep in touch

![][20]

Communication is key, and yet now more than ever, there seems to be a chat platform problem. There aren't just several clients, there are several isolated networks. How do you manage them all? Here are two ideas.

  * If you've got lots of contacts spread across too many chat networks, you ought to try [BitlBee][21], the singular chat client that lets you infiltrate all the others.
  * [Rainbow Stream][22] is a Twitter client that can be awfully useful to keep you away from the distractions of an open web browser while still keeping you in touch with your adoring public.



### Keep informed

![][23]

Web browsers are nice, but they can sometimes be overkill. You want to stay informed, but you don't want to give yourself entirely over to the internet. Because the internet is built upon open specifications and a lot of open source technology, you don't have to do everything through just one interface. There are _clients_ for all kinds of tasks, and they give you access to the information you need, using the interface you prefer.

  * [Tuir][24] is a terminal client to Reddit.
  * [Newsboat][25] is an RSS feed reader.
  * [Wego][26] brings you a weather report.
  * [Vim][27] can help you check in with Reddit and Twitter.
  * [Emacs][28] can keep you connected with clients for Reddit, Twitter, chat, and much more.



### Keep that terminal open

![][29]

If you're spending time in a terminal, what's the point in ever closing a terminal? Do away with the temptation of `exit` or `Ctrl+D` and keep your console open.

  * [Tmux][30] lets you split your terminal, "layer" one terminal window on top of another, and even walk away from one computer and continue the same terminal session from another computer.
  * [DESQview][31] takes a different approach: it's essentially a window manager for your terminal.



### Keep going

The tools in this article are but a subset of amazing productivity tools for your Linux terminal. This list must end, but your personal list can grow. Find the tools you love, learn them, and use them to your greatest advantage. Of course, a good tool doesn't always have to increase your productivity: sometimes your favorite command is the one that makes you happiest. Your job is to find the commands you love and to do amazing things with them.

Have fun!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/productivity-tools-linux-terminal

作者：[Alan Smithee][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alansmithee
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_screen_windows_files.png?itok=kLTeQUbY (Computer screen with files or windows open)
[2]: https://opensource.com/users/ksonney
[3]: https://opensource.com/sites/default/files/uploads/productivity_2-1.png
[4]: https://opensource.com/article/20/1/sync-files-syncthing
[5]: https://opensource.com/article/20/1/configuration-management-stow
[6]: https://opensource.com/sites/default/files/uploads/productivity_3-1.png
[7]: https://opensource.com/article/20/1/sync-email-offlineimap
[8]: https://opensource.com/article/17/11/how-use-cron-linux
[9]: https://opensource.com/article/20/1/organize-email-notmuch
[10]: https://opensource.com/article/20/1/vim-email-calendar
[11]: https://opensource.com/article/20/1/emacs-mail-calendar
[12]: https://opensource.com/sites/default/files/uploads/productivity_5-1.png
[13]: https://tools.ietf.org/html/rfc5545
[14]: https://opensource.com/article/20/1/open-source-calendar
[15]: https://opensource.com/article/20/1/sync-contacts-locally
[16]: https://opensource.com/alternatives/google-calendar
[17]: https://opensource.com/sites/default/files/uploads/productivity_7-1.png
[18]: https://opensource.com/article/20/1/open-source-to-do-list
[19]: https://opensource.com/article/20/1/python-journal
[20]: https://opensource.com/sites/default/files/uploads/productivity_9-1.png
[21]: https://opensource.com/article/20/1/open-source-chat-tool
[22]: https://opensource.com/article/20/1/tweet-terminal-rainbow-stream
[23]: https://opensource.com/sites/default/files/uploads/productivity_13-1.png
[24]: https://opensource.com/article/20/1/open-source-reddit-client
[25]: https://opensource.com/article/20/1/open-source-rss-feed-reader
[26]: https://opensource.com/article/20/1/open-source-weather-forecast
[27]: https://opensource.com/article/20/1/vim-task-list-reddit-twitter
[28]: https://opensource.com/article/20/1/emacs-social-track-todo-list
[29]: https://opensource.com/sites/default/files/uploads/productivity_14-1.png
[30]: https://opensource.com/article/20/1/tmux-console
[31]: https://opensource.com/article/20/1/multiple-consoles-twin
