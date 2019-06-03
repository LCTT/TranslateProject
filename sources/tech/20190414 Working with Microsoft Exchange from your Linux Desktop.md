[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Working with Microsoft Exchange from your Linux Desktop)
[#]: via: (https://itsfoss.com/microsoft-exchange-linux-desktop/)
[#]: author: (It's FOSS Community https://itsfoss.com/author/itsfoss/)

Working with Microsoft Exchange from your Linux Desktop
======

Recently I had to do some research (and even magic) to be able to work on my Ubuntu Desktop with Exchange Mail Server from my current employer. I am going to share my experience with you.

### Microsoft Exchange on Linux desktop

I guess many readers might feel confused, I mean, it shouldn’t be that hard if you simply use [Thunderbird][1] or any other [Linux email client][2] with your Office365 Exchange Account, right? Well, for better or for worse it was not this case for me.

Here’s my ordeal and what I did to make Microsoft Exchange work on my Linux desktop.

![][3]

#### The initial problem, no Office365

The first problem encountered in my situation was that we don’t currently use Office365 like probably majority of current people does for hosting their Exchange accounts, we currently use an on premises Exchange server and a very old version of it.

So, this means I didn’t have the luxury of using automatic configuration that comes in majority of email clients to simply connect to Office365.

#### Webmail is always an option… right?

Short answer is yes, however, as I mentioned we are using Exchange 2010, so the webmail interface is not only outdated, it even won’t allow you to have a decent email signature as it has a limit of characters in webmail configuration, so I needed to use an email client if I really wanted to be able to use the email the way I needed.

#### Another problem, I am picky for my email client

I am a regular Google user, I have been using GMail for the past 14 years as my personal email, so I really like how it looks and works. I actually use the webmail as I don’t like to be tied to my email client or even my computer device, if something happens and I need to switch to a newer device I don’t want to have to copy things over, I just want things to be there waiting for me to use them.

This leads me not liking Thunderbird, K-9 or Evolution Mail clients. All of these are capable of being connected to Exchange servers (one way or the other) but again, they don’t meet the standard of a clean, easy and modern GUI I wanted plus they couldn’t even manage my Exchange calendar well (which was a real deal breaker for me).

#### Found some options as email clients!

After some other research I found there were a couple of options for email clients that I could use and that actually would work the way I expected.

These were: [Hiri][4], which had a very modern and innovative user interface and had Exchange Server capabilities and there also was [Mailspring][5] which is a fork of an old foe ([Nylas Mail][6]) and which was my real favorite.

However, Mailspring couldn’t connect directly to an Exchange server (using Exchange’s protocol) unless you use Office365, it required [IMAP][7] (another luxury!) and the IT department at my office was reluctant to activate IMAP for “security reasons”.

Hiri is a good option but it’s not free.

#### No IMAP, no Office365, game over? Not yet!

I have to confess, I was really ready to give up and simply use the old webmail and learn to live with it, however, I gave a last shot on my research capabilities and I found a possible solution: what if I had a way to put a “man in the middle”? What if I was able to make the IMAP to run locally on my computer while my computer simply pull the emails via Exchange protocol? It was a long shot but, could work…

So I started looking here and there and found this [DavMail][8], which works as a Gateway to “talk” with an Exchange server and then locally provide you whatever you need in order to use it. Basically it was like a “translator” between by computer and the Exchange and then provided me with whatever service I needed.

![DavMail Settings][9]

So basically I only had to give DavMail my Exchange Server’s URL (even OWA URL) and set whatever ports I wanted on my local computer to be the new ports where my email client could connect.

This way I was free to basically use ANY client I wanted, at least any client which was capable of using IMAP protocol would work, as long as I configure the same ports I set up as my local ports.

![Mailspring working my office’s on premises Exchange. Information has been blurred due to non-disclosure agreement at my office.][10]

And that was it! I was able to use MailSpring (which is my preferred choice for email client) under my non favorable conditions.

#### Bonus point: this is a multi-platform solution!

What’s best is that this solution will work for any platform! So if you have the same problem while using Windows or macOS, DavMail has a version for all tastes!

![avatar][11]

![avatar][11]

### Helder Martins

Systems Engineer, technology evangelist, Ubuntu user, Linux enthusiast, father and husband.

--------------------------------------------------------------------------------

via: https://itsfoss.com/microsoft-exchange-linux-desktop/

作者：[It's FOSS Community][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/itsfoss/
[b]: https://github.com/lujun9972
[1]: https://www.thunderbird.net/en-US/
[2]: https://itsfoss.com/best-email-clients-linux/
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/04/microsoft-exchange-linux-desktop.png?resize=800%2C450&ssl=1
[4]: https://www.hiri.com/
[5]: https://getmailspring.com/
[6]: https://itsfoss.com/n1-open-source-email-client/
[7]: https://en.wikipedia.org/wiki/Internet_Message_Access_Protocol
[8]: http://davmail.sourceforge.net/
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/04/davmail-exchange-settings.png?resize=800%2C597&ssl=1
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/04/davmail-exchange-settings-1.jpg?ssl=1
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/04/helder-martins-1.jpeg?ssl=1
