[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (BitTorrent Client Deluge 2.0 Released: Here’s What’s New)
[#]: via: (https://itsfoss.com/deluge-2-release/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

BitTorrent Client Deluge 2.0 Released: Here’s What’s New
======

You probably already know that [Deluge][1] is one of the [best Torrent clients available for Linux users][2]. However, the last stable release was almost two years back.

Even though it was in active development, a major stable release wasn’t there – until recently. The latest version while we write this happens to be 2.0.2. So, if you haven’t downloaded the latest stable version – do try it out.

In either case, if you’re curious, let us talk about what’s new.

![Deluge][3]

### Major improvements in Deluge 2.0

The new release introduces multi-user support – which was a much needed addition.

In addition to that, there has been several performance improvements to handle more torrents with faster loading times.

Also, with version 2.0, Deluge used Python 3 with minimal support for Python 2.7. Even for the user interface, they migrated from GTK UI to GTK3.

As per the release notes, there are several more significant additions/improvements, which include:

  * Multi-user support.
  * Performance updates to handle thousands of torrents with faster loading times.
  * A New Console UI which emulates GTK/Web UIs.
  * GTK UI migrated to GTK3 with UI improvements and additions.
  * Magnet pre-fetching to allow file selection when adding torrent.
  * Fully support libtorrent 1.2 release.
  * Language switching support.
  * Improved documentation hosted on ReadTheDocs.
  * AutoAdd plugin replaces built-in functionality.



### How to install or upgrade to Deluge 2.0

![][4]

You should follow the official [installation guide][5] (using PPA or PyPi) for any Linux distro. However, if you are upgrading, you should go through the note mentioned in the release note:

“_Deluge 2.0 is not compatible with Deluge 1.x clients or daemons so these will require upgrading too._ _Also_ _third-party Python scripts may not be compatible if they directly connect to the Deluge client and will need migrating._“

So, they insist to always make a backup of your [config][6] before a major version upgrade to guard against data loss.

[][7]

Suggested read  Ubuntu's Snap Apps Website Gets Much Needed Improvements

And, if you are an author of a plugin, you need to upgrade it make it compatible with the new release.

Direct download app packages not yet available for Windows and Mac OS. However, the release note mentions that they are being worked on.

As an alternative, you can install them manually by following the [installation guide][5] in the updated official documentation.

**Wrapping Up**

What do you think about the latest stable release? Do you utilize Deluge as your BitTorrent client? Or do you find something else as a better alternative?

Let us know your thoughts in the comments below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/deluge-2-release/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://dev.deluge-torrent.org/
[2]: https://itsfoss.com/best-torrent-ubuntu/
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/06/deluge.jpg?fit=800%2C410&ssl=1
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/06/Deluge-2-release.png?resize=800%2C450&ssl=1
[5]: https://deluge.readthedocs.io/en/latest/intro/01-install.html
[6]: https://dev.deluge-torrent.org/wiki/Faq#WheredoesDelugestoreitssettingsconfig
[7]: https://itsfoss.com/snap-store/
