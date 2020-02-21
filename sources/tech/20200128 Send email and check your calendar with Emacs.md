[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Send email and check your calendar with Emacs)
[#]: via: (https://opensource.com/article/20/1/emacs-mail-calendar)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

Send email and check your calendar with Emacs
======
Manage your email and view your schedule with the Emacs text editor in
the eighteenth in our series on 20 ways to be more productive with open
source in 2020.
![Document sending][1]

Last year, I brought you 19 days of new (to you) productivity tools for 2019. This year, I'm taking a different approach: building an environment that will allow you to be more productive in the new year, using tools you may or may not already be using.

### Doing (almost) all the things with Emacs, part 1

Two days ago, I shared that I use both [Vim][2] and [Emacs][3] regularly, and on days [16][4] and [17][5] of this series, I explained how to do almost everything in Vim. Now, it's time for Emacs!

![Mail and calendar in Emacs][6]

Before I get too far, I should explain two things. First, I'm doing everything here using the default Emacs configuration, not [Spacemacs][7], which I have [written about][8]. Why? Because I will be using the default keyboard mappings so that you can refer back to the documentation and not have to translate things from "native Emacs" to Spacemacs. Second, I'm not setting up Org mode in this series. Org mode almost needs an entire series on its own, and, while it is very powerful, the setup can be quite complex.

#### Configure Emacs

Configuring Emacs is a little bit more complicated than configuring Vim, but in my opinion, it is worth it in the long run. Start by creating a configuration file and opening it in Emacs:


```
mkdir ~/.emacs.d
emacs ~/.emacs.d/init.el
```

Next, add some additional package sources to the built-in package manager. Add the following to **init.el**:


```
(package-initialize)
(add-to-list 'package-archives '("melpa" . "<http://melpa.org/packages/>"))
(add-to-list 'package-archives '("org" . "<http://orgmode.org/elpa/>") t)
(add-to-list 'package-archives '("gnu" . "<https://elpa.gnu.org/packages/>"))
(package-refresh-contents)
```

Save the file with **Ctrl**+**x** **Ctrl**+**s**, exit with **Ctrl**+**x** **Ctrl**+**c**, and restart Emacs. It will download all the package lists at startup, and then you should be ready to install things with the built-in package manager. Start by typing **Meta**+**x** to bring up a command prompt (the **Meta** key is the **Alt** key on most keyboards or **Option** on MacOS). At the command prompt, type **package-list-packages** to bring up a list of packages you can install. Go through the list and select the following packages with the **i** key:


```
bbdb
bbdb-vcard
calfw
calfw-ical
notmuch
```

Once the packages are selected, press **x** to install them. Depending on your internet connection, this could take a while. You may see some compile errors, but it's safe to ignore them. Once it completes, open **~/.emacs.d/init.el** with the key combination **Ctrl**+**x** **Ctrl**+**f**, and add the following lines to the file after **(package-refresh-packages)** and before **(custom-set-variables**. Emacs uses the **(custom-set-variables** line internally, and you should never, ever modify anything below it. Lines beginning with **;;** are comments.


```
;; Set up bbdb
(require 'bbdb)
(bbdb-initialize 'message)
(bbdb-insinuate-message)
(add-hook 'message-setup-hook 'bbdb-insinuate-mail)
;; set up calendar
(require 'calfw)
(require 'calfw-ical)
;; Set this to the URL of your calendar. Google users will use
;; the Secret Address in iCalendar Format from the calendar settings
(cfw:open-ical-calendar "<https://path/to/my/ics/file.ics>")
;; Set up notmuch
(require 'notmuch)
;; set up mail sending using sendmail
(setq send-mail-function (quote sendmail-send-it))
(setq user-mail-address "[myemail@mydomain.com][9]"
      user-full-name "My Name")
```

Now you are ready to start Emacs with your setup! Save the **init.el** file (**Ctrl**+**x** **Ctrl**+**s**), exit Emacs (**Ctrl**+**x** **Ctrl**+**c**), and then restart it. It will take a little longer to start this time.

#### Read and write email in Emacs with Notmuch

Once you are at the Emacs splash screen, you can start reading your email with [Notmuch][10]. Type **Meta**+**x notmuch**, and you'll get Notmuch's Emacs interface.

![Reading mail with Notmuch][11]

All the items in bold type are links to email views. You can access them with either a mouse click or by tabbing between them and pressing **Return** or **Enter**. You can use the search bar to

search Notmuch's database using the [same syntax][12] as you use on Notmuch's command line. If you want, you can save any searches for later use with the **[save]** button, and they will be added to the list at the top of the screen. If you follow one of the links, you will get a list of the relevant email messages. You can navigate the list with the **Arrow** keys, and press **Enter** on the message you want to read. Pressing **r** will reply to a message, **f** will forward the message, and **q** will exit the current screen.

You can write a new message by typing **Meta**+**x compose-mail**. Composing, replying, and forwarding all bring up the mail writing interface. When you are done writing your email, press **Ctrl**+**c Ctrl**+**c** to send it. If you decide you don't want to send it, press **Ctrl**+**c Ctrl**+**k** to kill the message compose buffer (window).

#### Autocomplete email addresses in Emacs with BBDB

![Composing a message with BBDB addressing][13]

But what about your address book? That's where [BBDB][14] comes in. But first, import all your addresses from [abook][15] by opening a command line and running the following export command:


```
`abook --convert --outformat vcard --outfile ~/all-my-addresses.vcf --infile ~/.abook/addresses`
```

Once Emacs starts, run **Meta**+**x bbdb-vcard-import-file**. It will prompt you for the file name you want to import, which is **~/all-my-addresses.vcf**. After the import finishes, when you compose a message, you can start typing a name and use **Tab** to search and autocomplete the "To" field. BBDB will also open a buffer for the contact so you can make sure it's the correct one.

Why do it this way when you already have each address as a **vcf.** file from [vdirsyncer][16]? If you are like me, you have a LOT of addresses, and doing them one at a time is a lot of work. This way, you can take everything you have in abook and make one big file.

#### View your calendar in Emacs with calfw

![calfw calendar][17]

Finally, you can use Emacs to look at your calendar. In the configuration section above, you installed the [calfw][18] package and added lines to tell it where to find the calendars to load. Calfw is short for the Calendar Framework for Emacs, and it supports many calendar formats. Since I use Google calendar, that is the link I put into my config. Your calendar will auto-load at startup, and you can view it by switching the **cfw-calendar** buffer with the **Ctrl**+**x**+**b** command.

Calfw offers views by the day, week, two weeks, and month. You can select the view from the top of the calendar and navigate your calendar with the **Arrow** keys. Unfortunately, calfw can only view calendars, so you'll still need to use something like [khal][19] or a web interface to add, delete, and modify events.

So there you have it: mail, calendars, and addresses in Emacs. Tomorrow I'll do even more.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/emacs-mail-calendar

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/email_paper_envelope_document.png?itok=uPj_kouJ (Document sending)
[2]: https://www.vim.org/
[3]: https://www.gnu.org/software/emacs/
[4]: https://opensource.com/article/20/1/vim-email-calendar
[5]: https://opensource.com/article/20/1/vim-task-list-reddit-twitter
[6]: https://opensource.com/sites/default/files/uploads/productivity_18-1.png (Mail and calendar in Emacs)
[7]: https://www.spacemacs.org/
[8]: https://opensource.com/article/19/12/spacemacs
[9]: mailto:myemail@mydomain.com
[10]: https://notmuchmail.org/
[11]: https://opensource.com/sites/default/files/uploads/productivity_18-2.png (Reading mail with Notmuch)
[12]: https://opensource.com/article/20/1/organize-email-notmuch
[13]: https://opensource.com/sites/default/files/uploads/productivity_18-3.png (Composing a message with BBDB addressing)
[14]: https://www.jwz.org/bbdb/
[15]: https://opensource.com/article/20/1/sync-contacts-locally
[16]: https://opensource.com/article/20/1/open-source-calendar
[17]: https://opensource.com/sites/default/files/uploads/productivity_18-4.png (calfw calendar)
[18]: https://github.com/kiwanami/emacs-calfw
[19]: https://khal.readthedocs.io/en/v0.9.2/index.html
