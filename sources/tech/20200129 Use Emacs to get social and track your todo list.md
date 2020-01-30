[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Use Emacs to get social and track your todo list)
[#]: via: (https://opensource.com/article/20/1/emacs-social-track-todo-list)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

Use Emacs to get social and track your todo list
======
Access Twitter, Reddit, chat, email, RSS, and your todo list in the
nineteenth in our series on 20 ways to be more productive with open
source in 2020.
![Team communication, chat][1]

Last year, I brought you 19 days of new (to you) productivity tools for 2019. This year, I'm taking a different approach: building an environment that will allow you to be more productive in the new year, using tools you may or may not already be using.

### Doing (almost) all the things with Emacs, part 2

[Yesterday][2], I talked about how to read email, access your addresses, and show calendars in Emacs. Emacs has tons and tons of functionality, and you can also use it for Twitter, chatting, to-do lists, and more!

![All the things with Emacs][3]

To do all of this, you need to install some Emacs packages. As you did yesterday, open the Emacs package manager with **Meta**+**x package-manager** (Meta is **Alt** on most keyboards or **Option** on MacOS). Now select the following packages with **i**, then install them by typing **x**:


```
nnreddit
todotxt
twittering-mode
```

Once they are installed, open **~/.emacs.d/init.el** with **Ctrl**+**x Ctrl**+**x**, and add the following before the **(custom-set-variables** line:


```
;; Todo.txt
(require 'todotxt)
(setq todotxt-file (expand-file-name "~/.todo/todo.txt"))

;; Twitter
(require 'twittering-mode)
(setq twittering-use-master-password t)
(setq twittering-icon-mode t)

;; Python3 for nnreddit
(setq elpy-rpc-python-command "python3")
```

Save the file with **Ctrl**+**x Ctrl**+**a**, exit Emacs with **Ctrl**+**x Ctrl**+**c**, then restart Emacs.

#### Tweet from Emacs with twittering-mode

![Twitter in Emacs][4]

[Twittering-mode][5] is one of the best Emacs interfaces for Twitter. It supports almost all the features of Twitter and has some easy-to-use keyboard shortcuts.

To get started, type **Meta**+**x twit** to launch twittering-mode. It will give a URL to open—and prompt you to launch a browser with it if you want—so you can log in and get an authorization token. Copy and paste the token into Emacs, and your Twitter timeline should load. You can scroll with the **Arrow** keys, use **Tab** to move from item to item, and press **Enter** to view the URL the cursor is on. If the cursor is on a username, pressing **Enter** will open that timeline in a web browser. If you are on a tweet's text, pressing **Enter** will reply to that tweet. You can create a new tweet with **u**, retweet something with **Ctrl**+**c**+**Enter**, and send a direct message with **d**—the dialog it opens has instructions on how to send, cancel, and shorten URLs.

Pressing **V** will open a prompt to get to other timelines. To open your mentions, type **:mentions**. The home timeline is **:home**, and typing a username will take you to that user's timeline. Finally, pressing **q** will quit twittering-mode and close the window.

There is a lot more functionality available in twittering-mode, and I encourage you to read the [full list][6] on its GitHub page.

#### Track your to-do's in Emacs with Todotxt.el

![todo.txt in emacs][7]

[Todotxt.el][8] is a nice interface for the [todo.txt][9] to-do list manager. It has hotkeys for just about everything.

To start it up, type **Meta**+**x todotxt**, and it will load the todo.txt file you specified in the **todotxt-file** variable (which you set in the first part of this article). Inside the buffer (window) for todo.txt, you can press **a** to add a new task and **c** to mark it complete. You can set priorities with **r**, and add projects and context to an item with **t**. When you are ready to move everything to **done.txt**, just press **A**. And you can filter the list with **/** or refresh back to the full list with **l**. And again, you can press **q** to exit.

#### Chat in Emacs with ERC

![Chatting with erc][10]

One of Vim's shortcomings is that trying to use chat with it is difficult (at best). Emacs, on the other hand, has the [ERC][11] client built into the default distribution. Start ERC with **Meta**+**x erc**, and you will be prompted for a server name, username, and password. You can use the same information you used a few days ago when you set up [BitlBee][12]: server **localhost**, port **6667**, and the same username with no password. It should be the same as using almost any other IRC client. Each channel will be split into a new buffer (window), and you can switch between them with **Ctrl**+**x Ctrl**+**b**, which also switches between other buffers in Emacs. The **/quit** command will exit ERC.

#### Read email, Reddit, and RSS feeds with Gnus

![Mail, Reddit, and RSS feeds with Gnus][13]

I'm sure many long-time Emacs users were asking, "but what about [Gnus][14]?" yesterday when I was talking about reading mail in Emacs. And it's a valid question. Gnus is a mail and newsreader built into Emacs, although it doesn't support [Notmuch][15] as a mail reader, just as a search engine. However, if you are configuring it for Reddit and RSS feeds (as you'll do in a moment), it's smart to add in mail functionality as well.

Gnus was created for reading Usenet News and grew from there. So, a lot of its look and feel (and terminology) seem a lot like a Usenet newsreader.

Gnus has its own configuration file in **~/.gnus** (the configuration can also be included in the main **~/.emacs.d/init.el**). Open **~/.gnus** with **Ctrl**+**x Ctrl**+**f** and add the following:


```
;; Required packages
(require 'nnir)
(require 'nnrss)

;; Primary Mailbox
(setq gnus-select-method
      '(nnmaildir "Local"
                  (directory "~/Maildir")
                  (nnir-search-engine notmuch)
      ))
(add-to-list 'gnus-secondary-select-methods
             '(nnreddit ""))
```

Save the file with **Ctrl**+**x Ctrl**+**s**. This tells Gnus to read mail from the local mailbox in **~/Maildir** as the primary source (**gnus-select-method**) and add a second source (**gnus-secondary-select-methods**) using the [nnreddit][16] plugin. You can also define multiple secondary sources, including Usenet News (nntp), IMAP (nnimap), mbox (nnmbox), and virtual collections (nnvirtual). You can learn more about all the options in the [Gnus manual][17].

Once you save the file, start Gnus with **Meta**+**x gnus**. The first run will install [Reddit Terminal Viewer][18] in a Python virtual environment, which is how it gets Reddit articles. It will then launch your browser to log into Reddit. After that, it will scan and load your subscribed Reddit groups. You will see a list of email folders with new mail and the list of subreddits with new content. Pressing **Enter** on any of them will load the list of messages for the group. You can navigate with the **Arrow** keys and press **Enter** to load and read a message. Pressing **q** will go back to the prior view when viewing message lists, and pressing **q** from the main window will exit Gnus. When reading a Reddit group, **a** creates a new message; in a mail group, **m** creates a new email; and **r** replies to messages in either view.

You can also add RSS feeds to the Gnus interface and read them like mail and newsgroups. To add an RSS feed, type **G**+**R** and fill in the RSS feed's URL. You will be prompted for the title and description of the feed, which should be auto-filled from the feed. Now type **g** to check for new messages (this checks for new messages in all groups). Reading a feed is like reading Reddit groups and mail, so it uses the same keys.

There is a _lot_ of functionality in Gnus, and there are a whole lot more key combinations. The [Gnus Reference Card][19] lists all of them for each view (on five pages in very small type).

#### See your position with nyan-mode

As a final note, you might notice [Nyan cat][20] at the bottom of some of my screenshots. This is [nyan-mode][21], which indicates where you are in a buffer, so it gets longer as you get closer to the bottom of a document or buffer. You can install it with the package manager and set it up with the following code in **~/.emacs.d/init.el**:


```
;; Nyan Cat
(setq nyan-wavy-trail t)
(setq nyan-bar-length 20)
(nyan-mode)
```

### Scratching Emacs' surface

This is just scratching the surface of all the things you can do with Emacs. It is _very_ powerful, and it is one of my go-to tools for being productive whether I'm tracking to-dos, reading and responding to mail, editing text, or chatting with my friends and co-workers. It takes a bit of getting used to, but once you do, it can become one of the most useful tools on your desktop.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/emacs-social-track-todo-list

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/talk_chat_team_mobile_desktop.png?itok=d7sRtKfQ (Team communication, chat)
[2]: https://opensource.com/article/20/1/emacs-mail-calendar
[3]: https://opensource.com/sites/default/files/uploads/productivity_19-1.png (All the things with Emacs)
[4]: https://opensource.com/sites/default/files/uploads/productivity_19-2.png (Twitter in Emacs)
[5]: https://github.com/hayamiz/twittering-mode
[6]: https://github.com/hayamiz/twittering-mode#features
[7]: https://opensource.com/sites/default/files/uploads/productivity_19-3.png (todo.txt in emacs)
[8]: https://github.com/rpdillon/todotxt.el
[9]: http://todotxt.org/
[10]: https://opensource.com/sites/default/files/uploads/productivity_19-4.png (Chatting with erc)
[11]: https://www.gnu.org/software/emacs/manual/html_mono/erc.html
[12]: https://opensource.com/article/20/1/open-source-chat-tool
[13]: https://opensource.com/sites/default/files/uploads/productivity_19-5.png (Mail, Reddit, and RSS feeds with Gnus)
[14]: https://www.gnus.org/
[15]: https://opensource.com/article/20/1/organize-email-notmuch
[16]: https://github.com/dickmao/nnreddit
[17]: https://www.gnus.org/manual/gnus.html
[18]: https://pypi.org/project/rtv/
[19]: https://www.gnu.org/software/emacs/refcards/pdf/gnus-refcard.pdf
[20]: http://www.nyan.cat/
[21]: https://github.com/TeMPOraL/nyan-mode
