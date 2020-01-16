[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Organize your email with Notmuch)
[#]: via: (https://opensource.com/article/20/1/organize-email-notmuch)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

Organize your email with Notmuch
======
Notmuch indexes, tags, and sorts your email. Learn how to use it in the
fourth article in our series on 20 ways to be more productive with open
source in 2020.
![Filing cabinet for organization][1]

Last year, I brought you 19 days of new (to you) productivity tools for 2019. This year, I'm taking a different approach: building an environment that will allow you to be more productive in the new year, using tools you may or may not already be using.

### Index your email with Notmuch

Yesterday, I talked about how I use OfflineIMAP to [sync my mail][2] to my local machine. Today, I'll talk about how I preprocess all that mail before I read it.

![Notmuch][3]

[Maildir][4] is probably one of the most useful mail storage formats out there. And there are a LOT of tools to help with managing your mail. The one I keep coming back to is a little program called [Notmuch][5] that indexes, tags, and searches mail messages. And there are several programs that work with Notmuch to make it even easier to handle a large amount of mail.

Most Linux distributions include Notmuch, and you can also get it for MacOS. Windows users can access it through Windows Subsystem for Linux ([WSL][6]), but it may require some additional tweaks.

![Notmuch's first run][7]

On Notmuch's very first run, it will ask you some questions and create a **.notmuch-config** file in your home directory. Next, index and tag all your mail by running **notmuch new**. You can verify it with **notmuch search tag:new**; this will find all messages with the "new" tag. That's probably a lot of mail since Notmuch uses the "new" tag to indicate messages that are new to it, so you'll want to clean that up.

Run **notmuch search tag:unread** to find any unread messages; that should result in quite a lot less mail. To remove the "new" tag from messages you've already seen, run **notmuch tag -new not tag:unread**, which will search for all messages without the "unread" tag and remove the "new" tag from them. Now when you run **notmuch search tag:new**, it should show only the unread mail messages.

Tagging messages in bulk is probably more useful, though, since manually updating tags at every run can be really tedious. The **\--batch** command-line option tells Notmuch to read multiple lines of commands and execute them. There is also the **\--input=filename** option, which reads commands from a file and applies them. I have a file called **tagmail.notmuch** that I use to add tags to mail that is "new"; it looks something like this:


```
# Manage sent, spam, and trash folders
-unread -new folder:Trash
-unread -new folder:Spam
-unread -new folder:Sent

# Note mail sent specifically to me (excluding bug mail)
+to-me to:kevin at sonney.com and tag:new and not tag:to-me

# And note all mail sent from me
+sent from:kevin at sonney.com and tag:new and not tag:sent

# Remove the new tag from messages
-new tag:new
```

I can then run **notmuch tag --input=tagmail.notmuch** to bulk-process my mail messages after running **notmuch new**, and then I can search on those tags as well.

Notmuch also supports running pre- and post-new hooks. These scripts, stored in **Maildir/.notmuch/hooks**, define actions to run before (pre-new) and after (post-new) to index new mail with **notmuch new**. In yesterday's article, I talked about using [OfflineIMAP][8] to sync mail from my IMAP server. It's very easy to run it from the "pre-new" hook:


```
#!/bin/bash
# Remove the new tag from messages that are still tagged as new
notmuch tag -new tag:new

# Sync mail messages
offlineimap -a LocalSync -u quiet
```

You can also use the Python application [afew][9], which interfaces with the Notmuch database, to tag things like _Mailing List_ and _Spam_ for you. You can run afew from the post-new hook in a similar way:


```
#!/bin/bash
# tag with my custom tags
notmuch tag --input=~/tagmail.notmuch

# Run afew to tag new mail
afew -t -n
```

I recommend that when using afew to tag messages, you do NOT use the **[ListMailsFilter]** since some mail handlers add obscure or downright junk List-ID headers to mail messages (I'm looking at you, Google).

![alot email client][10]

At this point, any mail reader that supports Notmuch or Maildir can work with my email. I'll sometimes use [alot][11], a Notmuch-specific client, to read mail at the console, but it's not as fancy as some other mail readers.

In the coming days, I'll show you some other mail clients that will likely integrate with tools you already use. In the meantime, check out some of the other tools that work with Maildir mailboxes—you might find a hidden gem I've not tried yet.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/organize-email-notmuch

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/files_documents_organize_letter.png?itok=GTtiiabr (Filing cabinet for organization)
[2]: https://opensource.com/article/20/1/sync-email-offlineimap
[3]: https://opensource.com/sites/default/files/uploads/productivity_4-1.png (Notmuch)
[4]: https://en.wikipedia.org/wiki/Maildir
[5]: https://notmuchmail.org/
[6]: https://docs.microsoft.com/en-us/windows/wsl/install-win10
[7]: https://opensource.com/sites/default/files/uploads/productivity_4-2.png (Notmuch's first run)
[8]: http://www.offlineimap.org/
[9]: https://afew.readthedocs.io/en/latest/index.html
[10]: https://opensource.com/sites/default/files/uploads/productivity_4-3.png (alot email client)
[11]: https://github.com/pazz/alot
