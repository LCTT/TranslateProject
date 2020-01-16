[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Keep your email in sync with OfflineIMAP)
[#]: via: (https://opensource.com/article/20/1/sync-email-offlineimap)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

Keep your email in sync with OfflineIMAP
======
Mirroring your email to a local folder is the first step in taming your
message pileup. Learn how in the third article in our series on 20 ways
to be more productive with open source in 2020.
![email or newsletters via inbox and browser][1]

Last year, I brought you 19 days of new (to you) productivity tools for 2019. This year, I'm taking a different approach: building an environment that will allow you to be more productive in the new year, using tools you may or may not already be using.

### Sync your email locally with OfflineIMAP

I have a love/hate relationship with email. I love the way it allows me to communicate with people all over the world. But, like many of you, I get a lot of mail, much of it from lists as well as spammers, advertisers, and the like. And it builds up.

![The OfflineIMAP "blinkenlights" UI][2]

Almost all the tools I've tried (outside of the big mail providers) that work really well with large amounts of mail have one thing in common: they all rely on a local copy of your mail stored in [Maildir][3] format. And the most useful tool for that is [OfflineIMAP][4]. OfflineIMAP is a Python script that mirrors IMAP mailboxes to a local Maildir folder tree. I use it to create a local copy of my mail and keep it in sync. Most Linux distributions include it, and it is available via Python's pip package manager.

The sample minimal configuration file is a good template to start with; begin by copying it to **~/.offlineimaprc**. Mine looks something like this:


```
[general]
accounts = LocalSync
ui=Quiet
autorefresh=30

[Account LocalSync]
localrepository = LocalMail
remoterepository = MirrorIMAP

[Repository MirrorIMAP]
type = IMAP
remotehost = my.mail.server
remoteuser = myusername
remotepass = mypassword
auth_mechanisms = LOGIN
createfolder = true
ssl = yes
sslcacertfile = OS-DEFAULT

[Repository LocalMail]
type = Maildir
localfolders = ~/Maildir
sep = .
createfolder = true
```

What my configuration does is define two repositories: the remote IMAP server and the local Maildir folder. There is also the **Account** that tells OfflineIMAP what to sync when it runs. You can define multiple accounts linked to different repositories. This allows you to copy from one IMAP server to another as a backup, in addition to making a copy locally.

The first run of OfflineIMAP will take a while if you have a lot of mail. But once it is done, future runs take a _lot_ less time. You can also run OfflineIMAP as a cron job (my preference) or as a daemon constantly syncing between repositories. The documentation covers all of this, as well as advanced configuration options for things like Gmail.

Now that my mail is copied locally, there is a whole range of tools I can work with to speed up searching, filing, and managing mail. And I'll talk about that tomorrow.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/sync-email-offlineimap

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/newsletter_email_mail_web_browser.jpg?itok=Lo91H9UH (email or newsletters via inbox and browser)
[2]: https://opensource.com/sites/default/files/uploads/productivity_3-1.png (The OfflineIMAP "blinkenlights" UI)
[3]: https://en.wikipedia.org/wiki/Maildir
[4]: http://www.offlineimap.org/
