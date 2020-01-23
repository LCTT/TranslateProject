[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (One open source chat tool to rule them all)
[#]: via: (https://opensource.com/article/20/1/open-source-chat-tool)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

One open source chat tool to rule them all
======
BitlBee brings multiple chat applications into a single interface. Find
out how to set up and use BitlBee in the ninth in our series on 20 ways
to be more productive with open source in 2020.
![Person using a laptop][1]

Last year, I brought you 19 days of new (to you) productivity tools for 2019. This year, I'm taking a different approach: building an environment that will allow you to be more productive in the new year, using tools you may or may not already be using.

### Bring all your chats into one interface with BitlBee

Instant messaging and chat have become a staple of the online world. And if you are like me, you probably have about five or six different apps running to talk to your friends, co-workers, and others. It really is a pain to keep up with it all. Thankfully, you can use one app (OK, two apps) to consolidate a lot of those chats into a single point.

![BitlBee on XChat][2]

[BitlBee][3] is an application that you run as a service that can bridge a standard IRC client with a whole bunch of messaging services. And since it is essentially an IRC server, you have a wealth of clients to choose from.

BitlBee is included with almost all Linux distributions. Installing on Ubuntu (my Linux desktop of choice) goes something like this:


```
`sudo apt install bitlbee-libpurple`
```

On  other distributions, the name of the package may be slightly different, but a search for _bitlbee_ should reveal your options.

You'll notice I use the libpurple version of BitlBee. This version allows me to use all the protocols available in the [libpurple][4] instant messaging library, which was originally developed for [Pidgin][5].

Once the package is installed, the service should start automatically. Now, using an IRC client ([XChat][6] in these pictures), I can connect to the service on port 6667 (the standard IRC port).

![Initial BitlBee connection][7]

You will be automatically connected to the control channel **&amp;bitlbee**. This channel is unique to you—every person gets their own on multi-user systems. This is where you can configure the services.

The full documentation is available at any time by typing **help** in the control channel. Explore here, then register an account on the server with the **register** command.


```
`register <mypassword>`
```

Now, any configuration changes you make on the server—IM accounts, settings, etc.—will be saved when you type **save**. Whenever you connect, use **identify &lt;mypassword&gt;** to connect to your account and load all those settings.

![purple settings][8]

The command **help purple** will show you all the available protocols that libpurple provides. For example, I've installed the [**telegram-purple**][9] package, which adds the ability to connect to Telegram. I can add an account by using my phone number with the **account add** command.


```
`account add telegram +15555555`
```

BitlBee will show that it has added the account. You can list your accounts with **account list**. Since I only have one account, I can log into it with **account 0 on**, and it will go through the Telegram login process, list all my friends and chats, and I am good to go.

But what about Slack, one of the most common chat systems out there? Well, you can install the [**slack-libpurple**][10] plugin, and do the same for Slack. If you aren't comfortable compiling and installing things, this may not be for you.

Follow the instructions on the plugin page, and after you have installed it, restart the BitlBee service. Now when you run **help purple**, Slack should be listed. Adding a Slack account happens the same as with all the other protocols.


```
account add slack [ksonney@myslack.slack.com][11]
account 1 set password my_legcay_API_token
account 1 on
```

And what do you know? You're connected to Slack, and you can add the Slack channels you're interested in with the **chat add** command. For example:


```
`chat add 1 happyparty`
```

adds the Slack channel happyparty as the local channel #happyparty. You can use the standard IRC **/join** command to access the channel now. Pretty cool.

BitlBee and an IRC client help me keep (most of) my chats and instant messages in a single place and reduces my distractions because I no longer have to find and switch to whichever app just pinged me.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/open-source-chat-tool

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: https://opensource.com/sites/default/files/uploads/productivity_9-1.png (BitlBee on XChat)
[3]: https://www.bitlbee.org/
[4]: https://developer.pidgin.im/wiki/WhatIsLibpurple
[5]: http://pidgin.im/
[6]: http://xchat.org/
[7]: https://opensource.com/sites/default/files/uploads/productivity_9-2.png (Initial BitlBee connection)
[8]: https://opensource.com/sites/default/files/uploads/productivity_9-3.png (purple settings)
[9]: https://github.com/majn/telegram-purple
[10]: https://github.com/dylex/slack-libpurple
[11]: mailto:ksonney@myslack.slack.com
