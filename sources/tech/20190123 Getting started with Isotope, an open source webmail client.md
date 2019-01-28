[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Getting started with Isotope, an open source webmail client)
[#]: via: (https://opensource.com/article/19/1/productivity-tool-isotope)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney (Kevin Sonney))

Getting started with Isotope, an open source webmail client
======
Read rich-text emails with Isotope, a lightweight email client and the 11th in our series on open source tools that will make you more productive in 2019.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/newsletter_email_mail_web_browser.jpg?itok=Lo91H9UH)

There seems to be a mad rush at the beginning of every year to find ways to be more productive. New Year's resolutions, the itch to start the year off right, and of course, an "out with the old, in with the new" attitude all contribute to this. And the usual round of recommendations is heavily biased towards closed source and proprietary software. It doesn't have to be that way.

Here's the 11th of my picks for 19 new (or new-to-you) open source tools to help you be more productive in 2019.

### Isotope

As we discussed in the [fourth article in this series][1] (about Cypht), we all spend a whole lot of time dealing with email. There are many options for dealing with it, and I've spent hours upon hours trying to find the best email client that works for me. I think that is an important distinction: What works for me doesn't always work for everyone else. And sometimes what works for me is a full client like [Thunderbird][2], sometimes it is a console client like [Mutt][3], and sometimes it's a web-based interface like [Gmail][4] or [RoundCube][5].

![](https://opensource.com/sites/default/files/uploads/isotope_1.png)

[Isotope][6] is a locally hosted, web-based email client. It is exceptionally lightweight, uses IMAP exclusively, and takes up very little disk space. Unlike Cypht, Isotope has full HTML mail support, which means there are no issues displaying rich-text only emails.

![](https://opensource.com/sites/default/files/uploads/isotope_2_0.png)

Installing Isotope is very easy if you have [Docker][7] installed. You only need to copy the commands from the documentation into a console and press Enter. Point a browser at **localhost** to get the Isotope login screen, and entering your IMAP server, login name, and password will open the inbox view.

![](https://opensource.com/sites/default/files/uploads/isotope_3.png)

At this point, Isotope functions pretty much as you'd expect. Click a message to view it, click the pencil icon to create a new message, etc. You will note that the user interface (UI) is very minimalistic and doesn't have the typical buttons for things like "move to folder," "copy to folder," and "archive." You move messages around with drag and drop, so you don't really miss the buttons anyway.

![](https://opensource.com/sites/default/files/uploads/isotope_4.png)

Overall, Isotope is clean, fast, and works exceptionally well. Even better, it is under active development (the most recent commit was two hours before I wrote this article), so it is constantly getting improvements. You can check out the code and contribute to it on [GitHub][8].


--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/productivity-tool-isotope

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney (Kevin Sonney)
[b]: https://github.com/lujun9972
[1]: https://opensource.com/article/19/1/productivity-tool-cypht-email
[2]: https://www.thunderbird.net/
[3]: http://www.mutt.org/
[4]: https://mail.google.com/
[5]: https://roundcube.net/
[6]: https://blog.marcnuri.com/isotope-mail-client-introduction/
[7]: https://www.docker.com/
[8]: https://github.com/manusa/isotope-mail
