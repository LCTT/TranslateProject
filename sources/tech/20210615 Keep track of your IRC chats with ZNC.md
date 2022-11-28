[#]: subject: (Keep track of your IRC chats with ZNC)
[#]: via: (https://opensource.com/article/21/6/irc-matrix-bridge-znc)
[#]: author: (John 'Warthog9' Hawley https://opensource.com/users/warthog9)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Keep track of your IRC chats with ZNC
======
Create a bridge between IRC and Matrix.
![Chat bubbles][1]

For a bit more than a year, I've been wondering if it is possible to bolt the open source [Matrix][2] communications network to Internet Relay Chat (IRC) in such a way that I can still use my [ZNC][3] IRC bouncer without an extra proliferation of nicknames. The answer, is amusingly, yes. But first, some background.

### What's IRC?

IRC has been around since August 1988, and it's been a staple of real-time communications ever since. It's also one of the early open source projects, as the code for the original IRC server was eventually shared. Over the years, it's been quite useful for meeting many developers' real-time communication needs, although not without its own share of drama. However, it has been resilient and is still widely used despite newer options.

### Enter the bouncer

ZNC solves a specific problem on IRC: IRC is intentionally a very ephemeral system, so no state is saved. When you log into an IRC server, you get nothing except what is happening right then—nothing before, and once you leave, nothing after. This contrasts with more modern systems that give historical context, scrollback, searchability, etc.

Some of this can be handled by clients that are left on continuously, but that's not ideal. Enter the IRC bouncer. A bouncer acts as a middleman to the IRC connection. It connects to IRC and can log in on the user's behalf. It can then relay chats back out to the client (or, in many cases, clients). This can make it seem like a user is always on, which gives some context.

Many folks who use IRC use either a bouncer or a client that runs long-term to keep that context going. ZNC is a relatively popular and well-understood bouncer for IRC. Other services like [IRCCloud][4] can provide this and other features bolted around IRC to make the experience more pleasant and usable.

### Building bridges

Matrix is a newer standard that isn't really a program or a codebase. It's actually a protocol definition that lends itself particularly well to bridging other protocols and provides a framework for real-time encrypted chat. One of its reference implementations is called Synapse, and it happens to be a pretty solid base from which to build. It has a rich set of prebuilt [bridges][5], including Slack, Gitter, XMPP, and email. While not all features translate everywhere, the fact that so many good bridges exist speaks to a great community and a robust protocol.

### The crux of the matter

I've been on IRC for 26 or 27 years; my clients are set up the way I like, and I'm used to interacting with it in certain ways on certain systems. This is great until I want to start interfacing with IRC when I have Matrix, [Mattermost][6], [Rocket.Chat][7], or other systems running. Traditionally, this meant I ended up with an extra nickname every time I logged into IRC. After a while, username[m], username[m]1, username[m]2, and so forth start looking old. Imagine everyone trying to do this, and you understand that this eventually gets untenable.

I've been running a Matrix server with bridges. So why can't I bridge ZNC into Matrix and get the best of all worlds?

It's doable with some prerequisites and prep work (which I won't cover in detail, but there's documentation out there should you wish to set this up for yourself).

  * You need a Matrix server, I'm using [Synapse][8], and it's what I'm going to assume going forward. You will also need admin privileges and access to the low-level system.
  * You need a [ZNC server][3] up and running or a bouncer that acts like ZNC (although your mileage will vary if you aren't using ZNC). You just need a ZNC account; you don't need admin privileges.
  * You need a copy of Heisenbridge, an IRC bridge for Matrix that works differently from a normal IRC bridge. It's possible to run both simultaneously; I am, and the [Heisenbridge README][9] will help you do the same. You'll likely want to run Heisenbridge on the same system you're running Synapse, although it's not required.



I'll assume you have Synapse and a working IRC bouncer set up and working. Now comes the fun part: bolting Heisenbridge into place. Follow the Heisenbridge install guide, except before you restart Synapse and start Heisenbridge, you'll want to make a couple of small changes to the configuration file generated during setup. That config file will look something like this:


```
id: heisenbridge
url: <http://127.0.0.1:9898>
as_token: alongstringtoken
hs_token: anotherlongstringtoken
rate_limited: false
sender_localpart: heisenbridge
namespaces:
 users:
 - regex: '@irc_.*'
   exclusive: true
 aliases: []
 rooms: []
```

  * Change the port it will use because `9898` is also preferred by other bridges. I chose `9897`. As long as it is the same in Synapse and the bridge, it doesn't matter what you use.
  * In the `namespaces` section, take note of the regex for the users. The `matrix-appservice-irc` system uses the same regex, and having both of them run in the same namespace causes issues. I changed mine from `@irc_` to `@hirc`.
  * You need to add `@heisenbridge:your.homeserver.tld` to the admin list on your server. The easiest way to do this is to start up Heisenbridge once, turn it off, and then edit the database to give the user admin privileges (i.e., set `admin=1` on that user). Then restart Heisenbridge.



My updated config file looks like this:


```
id: heisenbridge
url: <http://127.0.0.1:9897>
as_token: alongstringtoken
hs_token: anotherlongstringtoken
rate_limited: false
sender_localpart: heisenbridge
namespaces:
 users:
 - regex: '@hirc_.*'
   exclusive: true
 aliases: []
 rooms: []
```

Then, restart Synapse, start Heisenbridge, and go from there. I started mine using:


```
`python3 -m heisenbridge -c /path/to/heisenbridge.yaml -p 9897`
```

Next, talk to the Heisenbridge user on your home server and set up a network and a server for your bouncer.

If you want to add a server, there are some options that aren't documented. If you want to add a server name and host, issue:


```
`addserver networkname hostname portnumber --tls`
```

Open the network as your user. You'll be invited to a room where you can set the password for the network login (this is likely needed for ZNC), and then you can connect.

> **Security warning:** The password will be stored in clear text, so don't use passwords you don't mind being stored this way, and don't do this on machines you don't trust.

After you hit **Connect**, you should get a flurry of activity as your IRC bouncer pushes its state into Matrix. That should do it!

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/irc-matrix-bridge-znc

作者：[John 'Warthog9' Hawley][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/warthog9
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/talk_chat_communication_team.png?itok=CYfZ_gE7 (Chat bubbles)
[2]: https://matrix.org/
[3]: https://wiki.znc.in/ZNC
[4]: https://www.irccloud.com/
[5]: https://matrix.org/bridges/
[6]: https://mattermost.com/
[7]: http://rocket.chat/
[8]: https://matrix.org/docs/projects/server/synapse
[9]: https://github.com/hifi/heisenbridge
