[#]: subject: (Element: A Cross-Platform Decentralized Open-Source Messaging App)
[#]: via: (https://itsfoss.com/element/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Element: A Cross-Platform Decentralized Open-Source Messaging App
======

There are many open-source messaging applications available, especially if you are looking for [WhatsApp replacements][1] on both desktop and mobile.

Element is one of them, which is a decentralized alternative for private messaging that you can use to interact with individuals, communities, or businesses.

### Element: Privacy-Friendly Open-Source Messenger Built on Matrix Network

![][2]

Matrix is an open standard for secure and decentralized communication. And Element is the messaging client that uses that.

Element is also a part of the Matrix.org Foundation — so you will find most of the same team responsible for this.

Originally, it was known as [Riot][3], which we covered back then. But, after the [rebranding][4], it is now known as “Element”, which comes with an improved user experience and constantly focusing on making decentralized communication common for instant messaging.

![][5]

Element is not just another open-source messenger, it gives you the ability to do a lot of things.

Here, let me highlight some of the key features along with some details about it that follows as you read on.

### Features of Element

![][6]

Element is more of an all-in-one messenger than a replacement of something. You could choose it as an [open-source alternative to Slack][7] or a private alternative to any instant messenger like Telegram.

Some of the options that you get with it are:

  * End-to-End encryption chat room
  * Public communities (may not be encrypted)
  * Direct voice call
  * Conference call in the community
  * Meet Jitsi integration (one of the [open-source alternatives to Zoom][8])
  * File sharing
  * Emoji and Sticker support
  * Moderation tools for managing communities
  * Extensive anti-spam options
  * Ability to bridge other services like Slack, Discord, IRC, and more
  * Offers paid managed hosting to have control over your data
  * Cross-signed device verification for message privacy/security
  * Fine grained notification settings
  * Email notifications
  * Ability to restore using encryption keys
  * Make yourself discoverable to the entire Matrix network using your email or number



The features offered by Element may sound to be overwhelming for a user who just wants private messaging.

But fortunately, all those features do not get in the way unless you explicitly access/configure them. So that’s a good thing.

First, let me address the installation instructions for Linux and I’ll give you some insights on how my experience with Element was (on both Linux desktop and Android).

### Installing Element in Linux

Element officially supports Debian/Ubuntu for installation. You can just add the package repository and install element.

The commands used for this is:

```
sudo apt install -y wget apt-transport-https

sudo wget -O /usr/share/keyrings/riot-im-archive-keyring.gpg https://packages.riot.im/debian/riot-im-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/riot-im-archive-keyring.gpg] https://packages.riot.im/debian/ default main" | sudo tee /etc/apt/sources.list.d/riot-im.list

sudo apt update

sudo apt install element-desktop
```

Do note that they are still using Riot.im domain to host packages even after rebranding — so not to be confused with the older Riot messaging app.

You can also find it in AUR for Arch-based distros — but I’m not quite sure about how well it works.

Unfortunately, there’s no [Flatpak][9] or [Snap][10] package available. So, if you are using a distribution that isn’t officially supported by Element, the best place to explore solutions/raise issues will be their [GitHub page][11].

Now, before you get started using it, let me give you some heads up with my thoughts on it.

### Element on Linux and Android: Here’s What You Need to Know

To start with — the user experience is fantastic on both Android and desktop. I tried it on Linux Mint, and it worked flawlessly.

You do not need a mobile number to sign up. Just create a username and add an email account to it, and you’re done.

![][12]

One can opt for a paid homeserver (your own matrix network) or just join the free Matrix homeserver offered.

**Keep in mind,** if you are signing up for free, you may not get to experience all the features — like the ability to see who’s online. You can only do that with your own server, the free Matrix server restricts certain functionalities like that to be able to accommodate an unlimited number of free users.

When signing in to a mobile device, you will have to verify the session by scanning a QR code prompted on Element’s desktop app.

Once done, you can explore and join public communities available or create your own.

Most of the existing public communities do not have end-to-end encryption enabled. So make sure you know what you are doing before messaging in any of the public communities.

While Element supports bridging IRC, Slack, and others or adding bots to a community — it is just not supported for an encrypted community. So, you need to have an unencrypted community to be able to use bots and bridges.

![][13]

A **word of caution**:

Element is getting popular, and scammers/spammers are attracted to the platform because it does not need any valuable personal information to get started.

So **make sure that you do not trust anyone and keep your identity safe** by not using your real profile picture or work email, especially if you are joining the public communities.

Element is constantly improving and offers plenty of features for several use-cases. I don’t see a problem with it being an open-source Discord replacement as well (in some way).

I was impressed with the level of notification controls that it gives and an added email notification option (which is enabled by default). You can choose to have notifications based on the keywords that you find interesting, what an exciting feature to have!

![][14]

Overall, Element may not be the perfect replacement for everything you use right now but it is shaping up to be an all-in-one alternative to many proprietary options.

I’ve had a good experience with Element so far and I’m confident about its future. What do you think? Willing to try Element on Linux?

Feel free to let me know your thoughts on this.

--------------------------------------------------------------------------------

via: https://itsfoss.com/element/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/private-whatsapp-alternatives/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/06/element-io.png?resize=800%2C531&ssl=1
[3]: https://itsfoss.com/riot-desktop/
[4]: https://itsfoss.com/riot-to-element/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/06/element-ui.png?resize=800%2C602&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/06/element-settings.png?resize=800%2C673&ssl=1
[7]: https://itsfoss.com/open-source-slack-alternative/
[8]: https://itsfoss.com/open-source-video-conferencing-tools/
[9]: https://itsfoss.com/what-is-flatpak/
[10]: https://itsfoss.com/install-snap-linux/
[11]: https://github.com/vector-im
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/06/element-sign-in.png?resize=800%2C581&ssl=1
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/06/element-bridge-bots.png?resize=800%2C517&ssl=1
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/06/element-notifications.png?resize=800%2C547&ssl=1
