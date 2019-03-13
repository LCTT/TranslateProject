[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Get started with Cypht, an open source email client)
[#]: via: (https://opensource.com/article/19/1/productivity-tool-cypht-email)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney (Kevin Sonney))

Get started with Cypht, an open source email client
======
Integrate your email and news feeds into one view with Cypht, the fourth in our series on 19 open source tools that will make you more productive in 2019.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/email_mail_box_envelope_send_blue.jpg?itok=6Epj47H6)

There seems to be a mad rush at the beginning of every year to find ways to be more productive. New Year's resolutions, the itch to start the year off right, and of course, an "out with the old, in with the new" attitude all contribute to this. And the usual round of recommendations is heavily biased towards closed source and proprietary software. It doesn't have to be that way.

Here's the fourth of my picks for 19 new (or new-to-you) open source tools to help you be more productive in 2019.

### Cypht

We spend a lot of time dealing with email, and effectively [managing your email][1] can make a huge impact on your productivity. Programs like Thunderbird, Kontact/KMail, and Evolution all seem to have one thing in common: they seek to duplicate the functionality of Microsoft Outlook, which hasn't really changed in the last 10 years or so. Even the [console standard-bearers][2] like Mutt and Cone haven't changed much in the last decade.

![](https://opensource.com/sites/default/files/uploads/cypht-1.png)

[Cypht][3] is a simple, lightweight, and modern webmail client that aggregates several accounts into a single view. Along with email accounts, it includes Atom/RSS feeds. It makes reading items from these different sources very simple by using an "Everything" screen that shows not just the mail from your inbox, but also the newest articles from your news feeds.

![](https://opensource.com/sites/default/files/uploads/cypht-2.png)

It uses a simplified version of HTML messages to display mail or you can set it to view a plain-text version. Since Cypht doesn't load images from remote sources (to help maintain security), HTML rendering can be a little rough, but it does enough to get the job done. You'll get plain-text views with most rich-text mail—meaning lots of links and hard to read. I don't fault Cypht, since this is really the email senders' doing, but it does detract a little from the reading experience. Reading news feeds is about the same, but having them integrated with your email accounts makes it much easier to keep up with them (something I sometimes have issues with).

![](https://opensource.com/sites/default/files/uploads/cypht-3.png)

Users can use a preconfigured mail server and add any additional servers they use. Cypht's customization options include plain-text vs. HTML mail display, support for multiple profiles, and the ability to change the theme (and make your own). You have to remember to click the "Save" button on the left navigation bar, though, or your custom settings will disappear after that session. If you log out and back in without saving, all your changes will be lost and you'll end up with the settings you started with. This does make it easy to experiment, and if you need to reset things, simply logging out without saving will bring back the previous setup when you log back in.

![](https://opensource.com/sites/default/files/pictures/cypht-4.png)

[Installing Cypht][4] locally is very easy. While it is not in a container or similar technology, the setup instructions were very clear and easy to follow and didn't require any changes on my part. On my laptop, it took about 10 minutes from starting the installation to logging in for the first time. A shared installation on a server uses the same steps, so it should be about the same.

In the end, Cypht is a fantastic alternative to desktop and web-based email clients with a simple interface to help you handle your email quickly and efficiently.


--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/productivity-tool-cypht-email

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney (Kevin Sonney)
[b]: https://github.com/lujun9972
[1]: https://opensource.com/article/17/7/email-alternatives-thunderbird
[2]: https://opensource.com/life/15/8/top-4-open-source-command-line-email-clients
[3]: https://cypht.org/
[4]: https://cypht.org/install.html
