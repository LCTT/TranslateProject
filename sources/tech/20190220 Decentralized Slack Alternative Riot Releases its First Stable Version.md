[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Decentralized Slack Alternative Riot Releases its First Stable Version)
[#]: via: (https://itsfoss.com/riot-stable-release/)
[#]: author: (Shirish https://itsfoss.com/author/shirish/)

Decentralized Slack Alternative Riot Releases its First Stable Version
======

Remember [Riot messenger][1]? It’s a decentralized, encrypted open source messaging software based on the [Matrix protocol][2].

I wrote a [detailed tutorial on using Riot on Linux desktop][3]. The software was in beta back then. The first stable version, Riot 1.0 has been released a few days ago. Wonder what’s new?

![][4]

### New Features in Riot 1.0

Let’s look at some of the changes which were introduced in the move to Riot 1.0.

#### New Looks and Branding

![][5]

The first thing that you see is the welcome screen which has a nice background and also a refreshed sky and dark blue logo which is cleaner and clearer than the previous logo.

The welcome screen gives you the option to sign into an existing riot account on either matrix.org or any other homeserver or create an account. There is also the option to talk with the Riot Bot and have a room directory listing.

#### Changing Homeservers and Making your own homeserver

![Make your own homeserver][6]

As you can see, here you can change the homeserver. The idea of riot as was shared before is to have [de-centralized][7] chat services, without foregoing the simplicity that centralized services offer. For those who want to run their own homeservers, you need the new [matrix-syanpse 0.99.1.1 reference homeserver][8].

You can find an unofficial list of matrix homeservers listed [here][9] although it’s far from complete.

#### Internationalization and Languages.

One of the more interesting things are that the UI and everything is now il8n-aware and has been translated to catala, dansk, duetsch, Spanish along with English (US) which is/was the default when I installed. We can hope to see some more improvements in language support going ahead.

#### Favoriting a channel

![Favoriting a channel in Riot][10]

One of the things that has changed from last time is how you favorite a channel. Now as you can see, you select the channel, click on the three vertical dots in it and then either favorite or do whatever you want with it.

#### Making changes to your profile and Settings

![Riot Different settings you can do. ][11]

Just clicking the drop-down box beside your Avatar you get the settings box. You click on the box and it gives a wide variety of settings you can change.

As you can see there are lot more choices and the language is easier than before.

#### Encryption and E2E

![Riot encryption screen][12]

One of the big things which riot has been talked about is Encryption and end-to-end encryption. This is still a work in progress.

The new release brings the focus on two enhancements in encryption: key backup and emoji device verification (still in progress).

With Riot 1.0, you can automatically backup your keys on your server. This key itself will be encrypted with a password so that it is stored securely. With this, you’ll never lose your encrypted message because you won’t lose your encryption key.

You will soon be able to verify your device with emoji now which is easier than matching long strings, isn’t it?

**In the end**

Using Riot requires a bit of patience. Once you get the hang of it, there is nothing like it. This decentralized messaging app becomes an important tool in the arsenal of privacy cautious people.

Riot is an important tool in the continuous effort to keep our data secure and privacy intact. The new major release makes it even more awesome. What do you think?

--------------------------------------------------------------------------------

via: https://itsfoss.com/riot-stable-release/

作者：[Shirish][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/shirish/
[b]: https://github.com/lujun9972
[1]: https://about.riot.im/
[2]: https://matrix.org/blog/home/
[3]: https://itsfoss.com/riot-desktop/
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/02/riot-messenger.jpg?ssl=1
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/02/riot-im-web-1.0-welcome-screen.jpg?ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/02/riot-web-1.0-change-homeservers.jpg?resize=800%2C420&ssl=1
[7]: https://medium.com/s/story/why-decentralization-matters-5e3f79f7638e
[8]: https://github.com/matrix-org/synapse/releases/tag/v0.99.1.1
[9]: https://www.hello-matrix.net/public_servers.php
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/02/riot-web-1.0-channel-preferences.jpg?resize=800%2C420&ssl=1
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/02/riot-web-1.0-settings-1-e1550427251686.png?ssl=1
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/02/riot-web-1.0-encryption.jpg?fit=800%2C572&ssl=1
