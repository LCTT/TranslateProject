[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Use Vim to manage your task list and access Reddit and Twitter)
[#]: via: (https://opensource.com/article/20/1/vim-task-list-reddit-twitter)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

Use Vim to manage your task list and access Reddit and Twitter
======
Handle your to-do list and get social from the text editor in the
seventeenth in our series on 20 ways to be more productive with open
source in 2020.
![Chat via email][1]

Last year, I brought you 19 days of new (to you) productivity tools for 2019. This year, I'm taking a different approach: building an environment that will allow you to be more productive in the new year, using tools you may or may not already be using.

### Doing (almost) all the things with Vim, part 2

In [yesterday's article][2], you started reading mail and checking your calendars with Vim. Today, you're going to do even more. First, you'll take care of your task tracking, and then you'll get social, directly in the Vim text editor.

#### Track your to-do's in Vim with todo.txt-vim

![to-dos and Twitter with Vim][3]

Editing a text-based to-do file with Vim is a natural fit, and the [todo.txt-vim][4] package makes it even easier. Start by installing the todo.txt-vim package:


```
git clone <https://github.com/freitass/todo.txt-vim> ~/.vim/bundle/todo.txt-vim
vim ~/path/to/your/todo.txt
```

Todo.txt-vim automatically recognizes files ending in todo.txt and done.txt as [todo.txt][5] files. It adds key bindings specific to the todo.txt format. You can mark things "done" with **\x**, set them to the current date with **\d**, and change the priority with **\a**, **\b**, and **\c**. You can bump the priorities up (**\k**) or down (**\j**) and sort (**\s**) based on project (**\s+**), context (**\s@**), or date (**\sd**). And when you are finished, you can close and save the file like normal.

The todo.txt-vim package is a great addition to the [todo.sh program][6] I wrote about a few days ago, and with the [todo edit][7] add-on, it can really supercharge your to-do list tracking.

#### Read Reddit in Vim with vim-reddit

![Reddit in Vim][8]

Vim also has a nice add-on for [Reddit][9] called [vim-reddit][10]. It isn't as nice as [Tuir][11], but for a quick review of the latest posts, it works really well. Start by installing the bundle:


```
git clone <https://github.com/DougBeney/vim-reddit.git> ~/.vim/bundle/vim-reddit
vim
```

Now type **:Reddit** and the Reddit frontpage will load. You can load a specific subreddit with **:Reddit name**. Once the article list is onscreen, navigate with the arrow keys or scroll with the mouse. Pressing **o** will open the article in Vim (unless it is a media post, in which case it opens a browser), and pressing **c** brings up the comments. If you want to go right to the page, press **O** instead of **o**. Going back a screen is as easy as **u**. And when you are done with Reddit, type **:bd**. The only drawback is vim-reddit cannot log in or post new stories or comments. Then again, sometimes that is a good thing.

#### Tweet from Vim with twitvim

![Twitter in Vim][12]

And last, we have [twitvim][13], a Vim package for reading and posting to Twitter. This one takes a bit more to set up. Start by installing twitvim from GitHub:


```
`git clone https://github.com/twitvim/twitvim.git ~/.vim/bundle/twitvim`
```

Now you need to edit the **.vimrc** file and set some options. These help the plugin know which libraries it can use to talk to Twitter. Run **vim --version** and see what languages have a **+** next to them—those languages are supported by your copy of Vim.

![Enabled and Disabled things in vim][14]

Since mine says **+perl -python +python3**, I know I can enable Perl and Python 3, but not Python 2 (python).


```
" TwitVim Settings
let twitvim_enable_perl = 1
" let twitvim_enable_python = 1
let twitvim_enable_python3 = 1
```

Now you can start up Vim and log into Twitter by running **:SetLoginTwitter**, which launches a browser window asking you to authorize VimTwit as an application with access to your account. Once you enter

the supplied PIN into Vim, you're good to go.

Twitvim's commands are not as simple as in the other packages. To load up the timeline of your friends and followers, type in **:FriendsTwitter**. To list your mentions and replies, use **:MentionsTwitter**. Posting a new tweet is **:PosttoTwitter &lt;Your message&gt;**. You can scroll through the list and reply to a specific tweet by typing **\r**, and you can start a direct message with someone using **\d**.

And there you have it; you're doing (almost) all the things in Vim!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/vim-task-list-reddit-twitter

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/email_chat_communication_message.png?itok=LKjiLnQu (Chat via email)
[2]: https://opensource.com/article/20/1/send-email-and-check-your-calendar-vim
[3]: https://opensource.com/sites/default/files/uploads/productivity_17-1.png (to-dos and Twitter with Vim)
[4]: https://github.com/freitass/todo.txt-vim
[5]: http://todotxt.org
[6]: https://opensource.com/article/20/1/open-source-to-do-list
[7]: https://github.com/todotxt/todo.txt-cli/wiki/Todo.sh-Add-on-Directory#edit-open-in-text-editor
[8]: https://opensource.com/sites/default/files/uploads/productivity_17-2.png (Reddit in Vim)
[9]: https://reddit.com
[10]: https://github.com/DougBeney/vim-reddit
[11]: https://opensource.com/article/20/1/open-source-reddit-client
[12]: https://opensource.com/sites/default/files/uploads/productivity_17-3.png (Twitter in Vim)
[13]: https://github.com/twitvim/twitvim
[14]: https://opensource.com/sites/default/files/uploads/productivity_17-4.png (Enabled and Disabled things in vim)
