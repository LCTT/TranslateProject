[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Session: An Open Source Private Messenger That Doesn’t Need Your Phone Number)
[#]: via: (https://itsfoss.com/session-messenger/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Session: An Open Source Private Messenger That Doesn’t Need Your Phone Number
======

_**Brief: Our open source software highlight of the week is Session. It is a fork of another increasingly popular private messenger Signal. Session doesn’t even need your phone number to operate.**_

### Session: A private messenger in true sense

![][1]

Privacy concerned people are always in the search of an ultimate service that lets you communicate securely while respecting our privacy across multiple platforms.

Recently, I came across an interesting open-source messaging app “[Session][2]” by [Loki Foundation][3], which is technically a fork of another [open source encrypted messenger Signal][4].

In this article, I’ll be sharing my experience with the Session app while highlighting the features it offers.

Session is fairly new to the scene – I’ve mentioned some of the bugs that I encountered at the bottom of the article.

### Features of Session Messenger

I’ll highlight the key features of Session that will help you decide if it’s good enough for you to try.

#### Session does not require a phone number

![][5]

For privacy-enthusiasts, registering the phone number with Signal or other such applications is a potential risk.

But, with Session, you do not need a phone number, simply click on “**Create Account**” after you install it on your desktop or phone and it will simply generate a random (unique) **Session ID**.

It’ll look something like this: **05652245af9a8bfee4f5a8138fd5c……..**

So, you just have to share your Session ID with the contact you want to add. Or, you can also opt to get the **QR Code** after account creation which you can share with your friends to add you back.

#### Session uses blockchain (and other crypto tech)

![Session ID][6]

For the users who’re aware of what a [blockchain][7] is – they’ve been waiting for real-world applications that an average user can utilize. Session is one such example that utilizes blockchain at its core and you don’t need to know it’s there.

If you’re curious about how it works, you can take a look at their [official blog post][8] explaining it.

#### Cross-Platform Support

![][9]

For something strictly privacy-focused, you’d also want it to be available across multiple platforms.

Of course, primarily, I’d focus on the Linux and Android support but it also supports Windows/Mac/iOS. So, you can easily sync between multiple devices cross-platform.

#### Includes Essential Privacy Options

![][10]

Undoubtedly, it offers some essential privacy-focused features that will help make the experience more secure.

For starters, you have the following options:

  * **Message TTL**: This lets you control how long the message exists before the recipient sees the message.
  * **Read Receipts**: Let others know that you’ve seen the message or if your message has been read.



#### Session uses a decentralized network and protects your metadata

Even though Session isn’t a peer-to-peer technology, it does not have a central server for the network.

It takes a decentralized approach to how the messages are transmitted (or routed). If you’ve no idea what I’m talking about, you can follow Session’s official blog post to know the [difference between centralization and decentralization][11] and explore how it potentially works.

And, this approach of network helps them to protect the metadata (the information associated with a message like IP address).

#### Other Features

Not just limited to the latest/greatest privacy-friendly features, but it also supports group chats, voice messages, and also allows you to send attachments.

### Installing Session on Linux

If you head to the [official download page][12], you will be able to download an .**AppImage** file. In case you have no clue how it works, you should take a look at our article on [how to use AppImage][13].

In either case, you can also head to their [GitHub releases page][14] and grab the **.deb** file.

[Download Session][12]

### My Experience On Using Session App

I’ve managed to try it on multiple platforms. For the desktop, I utilized the .AppImage file on **Pop!_OS 19.10** to run Session.

Overall, the user experience was impressive and had no UI glitches.

It’s also easy to recover your account once you’ve backed up your secret code (which is known as **seed**) from the settings.

![][15]

But, I also noticed a couple of issues- which can be fixed/improved:

  * Delay in accepting a friend request
  * The way of linking devices is not intuitive
  * Sometimes when you reply from two separate devices (using the same ID), the receiver gets two different conversations.



**Conclusion**

Of course, nothing’s ever perfect. For now, I’m thinking of keeping it installed and considering Session’s features, it is definitely something a privacy-focused user should try.

What do you think about it? Feel free to let me know your thoughts in the comments below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/session-messenger/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/02/session-app.jpg?ssl=1
[2]: https://getsession.org/
[3]: https://loki.foundation/
[4]: https://itsfoss.com/signal-messaging-app/
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/02/session-create.jpg?ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/03/session-application-id.jpg?ssl=1
[7]: https://en.wikipedia.org/wiki/Blockchain
[8]: https://getsession.org/how-session-protects-your-anonymity-with-blockchain-and-crypto/
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/02/session-cross-platform.jpg?ssl=1
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/02/session-settings.jpg?fit=800%2C512&ssl=1
[11]: https://getsession.org/centralisation-vs-decentralisation-in-private-messaging/
[12]: https://getsession.org/download/
[13]: https://itsfoss.com/use-appimage-linux/
[14]: https://github.com/loki-project/session-desktop/releases
[15]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/02/session-seed.jpg?ssl=1
