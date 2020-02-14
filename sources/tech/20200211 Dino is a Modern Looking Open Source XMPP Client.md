[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Dino is a Modern Looking Open Source XMPP Client)
[#]: via: (https://itsfoss.com/dino-xmpp-client/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Dino is a Modern Looking Open Source XMPP Client
======

_**Brief: Dino is a relatively new open-source XMPP client that tries to offer a good user experience while encouraging privacy-focused users to utilize XMPP for messaging.**_

### Dino: An Open Source XMPP Client

![][1]

[XMPP][2] (Extensible Messaging Presence Protocol) is a decentralized model of network to facilitate instant messaging and collaboration. Decentralize means there is no central server that has access to your data. The communication is directly between the end-points.

Some of us might call it an “old school” tech probably because the XMPP clients usually have a very bad user experience or simply just because it takes time to get used to (or set it up).

That’s when [Dino][3] comes to the rescue as a modern XMPP client to provide a clean and snappy user experience without compromising your privacy.

### The User Experience

![][4]

Dino does try to improve the user experience as an XMPP client but it is worth noting that the look and feel of it will depend on your Linux distribution to some extent. Your icon theme or the gnome theme might make it look better or worse for your personal experience.

Technically, the user interface is quite simple and easy to use. So, I suggest you take a look at some of the [best icon themes][5] and [GNOME themes][6] for Ubuntu to tweak the look of Dino.

### Features of Dino

![Dino Screenshot][7]

You can expect to use Dino as an alternative to Slack, [Signal][8] or [Wire][9] for your business or personal usage.

It offers all of the essential features you would need in a messaging application, let us take a look at a list of things that you can expect from it:

  * Decentralized Communication
  * Public XMPP Servers supported if you cannot setup your own server
  * Similar to UI to other popular messengers – so it’s easy to use
  * Image &amp; File sharing
  * Multiple accounts supported
  * Advanced message search
  * [OpenPGP][10] &amp; [OMEMO][11] encryption supported
  * Lightweight native desktop application



### Installing Dino on Linux

You may or may not find it listed in your software center. Dino does provide ready to use binaries for Debian (deb) and Fedora (rpm) based distributions.

**For Ubuntu:**

Dino is available in the universe repository on Ubuntu and you can install it using this command:

```
sudo apt install dino-im
```

Similarly, you can find packages for other Linux distributions on their [GitHub distribution packages page][12].

If you want the latest and greatest, you can also find both **.deb** and .**rpm** files for Dino to install on your Linux distribution (nightly builds) from [OpenSUSE’s software webpage][13].

In either case, head to their [GitHub page][14] or click on the link below to visit the official site.

[Download Dino][3]

**Wrapping Up**

It works quite well without any issues (at the time of writing this and quick testing it). I’ll try exploring more about it and hopefully cover more XMPP-centric articles to encourage users to use XMPP clients and servers for communication.

What do you think about Dino? Would you recommend another open-source XMPP client that’s potentially better than Dino? Let me know your thoughts in the comments below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/dino-xmpp-client/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/02/dino-main.png?ssl=1
[2]: https://xmpp.org/about/
[3]: https://dino.im/
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/02/dino-xmpp-client.jpg?ssl=1
[5]: https://itsfoss.com/best-icon-themes-ubuntu-16-04/
[6]: https://itsfoss.com/best-gtk-themes/
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/02/dino-screenshot.png?ssl=1
[8]: https://itsfoss.com/signal-messaging-app/
[9]: https://itsfoss.com/wire-messaging-linux/
[10]: https://www.openpgp.org/
[11]: https://en.wikipedia.org/wiki/OMEMO
[12]: https://github.com/dino/dino/wiki/Distribution-Packages
[13]: https://software.opensuse.org/download.html?project=network:messaging:xmpp:dino&package=dino
[14]: https://github.com/dino/dino
