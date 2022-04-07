[#]: subject: "Xfce Terminal 1.0.0 is a Feature-Packed Major Upgrade After a Year"
[#]: via: "https://news.itsfoss.com/xfce-terminal-1-0-0-release/"
[#]: author: "Jacob Crume https://news.itsfoss.com/author/jacob/"
[#]: collector: "lujun9972"
[#]: translator: "geelpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Xfce Terminal 1.0.0 is a Feature-Packed Major Upgrade After a Year
======

The popular terminal emulator found on almost all Xfce-powered distributions, Xfce Terminal has just released its first major upgrade under a new maintainer (and a new versioning scheme).

Let us take a look at some highlights of the release.

### New Maintainer &amp; Versioning Scheme

Igor Zakharov was leading the development from 2016 until 2020. Unfortunately, it was left unmaintained in 2021 when the new maintainer, [Sergios][1] Anestis Kefalidis (also a developer of Thunar file manager), took over the responsibility.

And, since Sergios took over the project, the versioning scheme has changed. After consultation with the community, Thunar’s old versioning scheme was adopted.

For instance, version 1.1.x will be the development release, and 1.2.0 will be the next major upgrade.

Now, with the release of Xfce Terminal 1.0.0, a number of exciting new features have been packed in.

### New Features

Some new features in Xfce Terminal 1.0.0 include:

  * Improved customization options
  * Overlay scrollbar support
  * Command-line option improvements
  * More use of XfceTitledDialog



#### Better Customization Options

As with many application updates these days, Xfce Terminal 1.0.0 includes plenty of new customization options. Perhaps my favorite, the image background feature now has a ‘Fill’ style option. This is accompanied by the ability to temporarily disable the unsafe paste dialog, which has also been revamped.

Finally, XFCE Terminal has also become one of the first apps to support the new XFCE shortcuts editor. As a result, users no longer need to dive into configuration files, instead of being given a simple UI to use.

![][2]

With so many new customization options, I’m sure many people would be happy with a release containing just these. But alas! The developer has managed to squeeze in yet more exciting new features, the next of which is the improved command-line arguments.

#### Better Command Line Arguments

With this release, ‘–tab’ and ‘–window’ command line arguments have been fixed to be more intuitive. This fixes a rather [longstanding bug][3] in XFCE Terminal that has been known for almost 6 years.

Despite the long wait, it has now been fixed. Better late than never, eh?

Anyway, it is always great to see bugs squashed with every new release, and this trend continues here.

#### More Use Of Xfce-Specific Widgets

Although I’m sure many users will probably see this as a downgrade, XFCE Terminal’s use of more XFCE-specific widgets brings numerous advantages. While it does mean more dependencies for non-XFCE users, it means better integration with XFCE.

It is safe to say that most of the Xfce terminal users stick to the same desktop environment. So, this change should result in greater consistency and UX improvements.

#### Other Changes

Other changes in this release include:

  * ‘Scrolling on ouput’ preference improvements
  * Right-click behavior customization options
  * Code reworking for a smaller codebase



For a full list of features, feel free to refer to the [release notes][4]. The release notes also mention future plans for the next major release, v1.2.0.

### Wrapping Up

Overall, Xfce Terminal 1.0.0 is looking to be a great release and goes to show the dedication of its new maintainer.

If you want to try Xfce Terminal 1.0.0, it should be landing in your distribution’s repositories in the following weeks, if not already.

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/xfce-terminal-1-0-0-release/

作者：[Jacob Crume][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/jacob/
[b]: https://github.com/lujun9972
[1]: https://www.youtube.com/channel/UCu8-J-XWcXQhoCopBiJ5-uw/videos
[2]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjUwOSIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[3]: https://bugzilla.xfce.org/show_bug.cgi?id=12926
[4]: http://users.uoa.gr/~sdi1800073/sources/xfce_blog12.html
