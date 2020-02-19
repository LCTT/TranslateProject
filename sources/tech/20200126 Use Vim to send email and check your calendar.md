[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Use Vim to send email and check your calendar)
[#]: via: (https://opensource.com/article/20/1/vim-email-calendar)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

Use Vim to send email and check your calendar
======
Manage your email and calendar right from your text editor in the
sixteenth in our series on 20 ways to be more productive with open
source in 2020.
![Calendar close up snapshot][1]

Last year, I brought you 19 days of new (to you) productivity tools for 2019. This year, I'm taking a different approach: building an environment that will allow you to be more productive in the new year, using tools you may or may not already be using.

### Doing (almost) all the things with Vim, part 1

I use two text editors regularly—[Vim][2] and [Emacs][3]. Why both? They have different use cases, and I'll talk about some of them in the next few articles in this series.

![][4]

OK, so why do everything in Vim? Because if there is one application that is on every machine I have access to, it's Vim. And if you are like me, you probably already spend a lot of time in Vim. So why not use it for _all the things_?

Before that, though, you need to do some things. The first is to make sure you have Ruby support in Vim. You can check that with **vim --version | grep ruby**. If the result is not **+ruby**, that needs to be fixed. This can be tricky, and you should check your distribution's documentation for the right package to install. On MacOS, this is the official MacVim (not from Brew), and on most Linux distributions, this is either vim-nox or vim-gtk—NOT vim-gtk3.

I use [Pathogen][5] to autoload my plugins and bundles. If you use [Vundle][6] or another Vim package manager, you'll need to adjust the commands below to work with it.

#### Do your email in Vim

A good starting place for making Vim a bigger part of your productivity plan is using it to send and receive email with [Notmuch][7] using [abook][8] to access your contact list. You need to install some things for this. All the sample code below is on Ubuntu, so you'll need to adjust for that if you are using a different distribution. Do the setup with:


```
sudo apt install notmuch-vim ruby-mail
curl -o ~/.vim/plugin/abook --create-dirs <https://raw.githubusercontent.com/dcbaker/vim-abook/master/plugin/abook.vim>
```

So far, so good. Now start Vim and execute **:NotMuch**. There may be some warnings due to the older version of the mail library **notmuch-vim** was written for, but in general, Vim will now be a full-featured Notmuch mail client.

![Reading Mail in Vim][9]

If you want to perform a search for a specific tag, type **\t**, enter the name of the tag, and press Enter. This will pull up a list of all messages with that tag. The **\s** key combination brings up a **Search:** prompt that will do a full search of the Notmuch database. Navigate the message list with the arrow keys, press Enter to display the selected item, and enter **\q** to exit the current view.

To compose mail, use the **\c** keystroke. You will see a blank message. This is where the **abook.vim** plugin comes in. Hit **Esc** and enter **:AbookQuery &lt;SomeName&gt;**, where &lt;SomeName&gt; is a part of the name or email address you want to look for. You will get a list of entries in the abook database that match your search. Select the address you want by typing its number to add it to the email's address line. Finish typing and editing the email, press **Esc** to exit edit mode, and enter **,s** to send.

If you want to change the default folder view when **:NotMuch** starts up, you can add the variable **g:notmuch_folders** to your **.vimrc** file:


```
let g:notmuch_folders = [
      \ [ 'new', 'tag:inbox and tag:unread' ],
      \ [ 'inbox', 'tag:inbox' ],
      \ [ 'unread', 'tag:unread' ],
      \ [ 'News', 'tag:@sanenews' ],
      \ [ 'Later', 'tag:@sanelater' ],
      \ [ 'Patreon', 'tag:@patreon' ],
      \ [ 'LivestockConservancy', 'tag:livestock-conservancy' ],
    \ ]
```

There are many more settings covered in the Notmuch plugin's documentation, including setting up keys for tags and using alternate mail programs.

#### Consult your calendar in Vim

![][10]

Sadly, there do not appear to be any calendar programs for Vim that use the vCalendar or iCalendar formats. There is [Calendar.vim][11], which is very well done. Set up Vim to access your calendar with:


```
cd ~/.vim/bundle
git clone [git@github.com][12]:itchyny/calendar.vim.git
```

Now, you can see your calendar in Vim by entering **:Calendar**. You can switch between year, month, week, day, and clock views with the **&lt;** and **&gt;** keys. If you want to start with a particular view, use the **-view=** flag to tell it which one you wish to see. You can also add a date to any of the views. For example, if I want to see what is going on the week of July 4, 2020, I would enter **:Calendar -view week 7 4 2020**. The help is pretty good and can be accessed with the **?** key.

![][13]

Calendar.vim also supports Google Calendar (which I need), but in December 2019 Google disabled the access for it. The author has posted a workaround in [the issue on
GitHub][14].

So there you have it, your mail, addresses, and calendars in Vim. But you aren't done yet; you'll do even more with Vim tomorrow!

Vim offers great benefits to writers, regardless of whether they are technically minded or not.

Need to keep your schedule straight? Learn how to do it using open source with these free...

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/vim-email-calendar

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/calendar.jpg?itok=jEKbhvDT (Calendar close up snapshot)
[2]: https://www.vim.org/
[3]: https://www.gnu.org/software/emacs/
[4]: https://opensource.com/sites/default/files/uploads/day16-image1.png
[5]: https://github.com/tpope/vim-pathogen
[6]: https://github.com/VundleVim/Vundle.vim
[7]: https://opensource.com/article/20/1/organize-email-notmuch
[8]: https://opensource.com/article/20/1/sync-contacts-locally
[9]: https://opensource.com/sites/default/files/uploads/productivity_16-2.png (Reading Mail in Vim)
[10]: https://opensource.com/sites/default/files/uploads/day16-image3.png
[11]: https://github.com/itchyny/calendar.vim
[12]: mailto:git@github.com
[13]: https://opensource.com/sites/default/files/uploads/day16-image4.png
[14]: https://github.com/itchyny/calendar.vim/issues/156
