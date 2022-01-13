[#]: subject: "Zrythm Switches to GTK 4 and libadwaita Ahead of Other Digital Audio Workstations (DAWs)"
[#]: via: "https://news.itsfoss.com/zrythm-gtk4-alpha/"
[#]: author: "Jacob Crume https://news.itsfoss.com/author/jacob/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Zrythm Switches to GTK 4 and libadwaita Ahead of Other Digital Audio Workstations (DAWs)
======

Now that it’s been a while since [GTK 4][1] was unveiled, several applications have started to make the move from GTK 3.

The latest of which is Zrythm. While still in its alpha phase, this change is incredibly large and impactful, so let’s take a look at it!

In case you’re curious, Zrythm is a Digital Audio Workstation, just like LMMS, Ardour, and other options in our [list of best DAWs][2].

Zrythm allows users to edit audio, and make music. It has all the essential features expected from a DAW. And, it seems to be properly working with the various audio servers desktop Linux uses (like Pulseaudio, Pipewire, etc.).

With that out of the way, let’s take a look at Zrythm’s latest release!

### What’s New?

![][3]

Although several cool features have been listed in [the changelog][4], we take a look at the important ones.

Some of the most impactful changes include:

  * The transition to GTK4 and [Libadwaita][5]
  * New searchable preference dialog
  * Various drawing and DSP optimizations



#### GTK4 and Libadwaita

Over the past few months, it has been fascinating to see various levels of complexity app developers are facing over the transition to GTK4. One trend that I have noticed is that generally the complexity of transitioning scales linearly with the complexity of the app.

For an app as complex as Zrythm, this may have been a problem. However, it appears that despite the expected complexity, the developers have managed to do make the change successfully, making Zrythm the first audio editor to transition to GTK 4.

The result of this is a number of new capabilities, some of which include:

  * Improved speed on low-end systems
  * Improved speed when numerous objects are on the screen
  * A more consistent look to blend in with GNOME



Overall, this transition seems to be a considerable step in the right direction by the Zrythm developers, and I’m sure many users will notice the various improvements it brings.

#### New Preferences Dialog &amp; Various Optimizatioons

Linux is known for its customization, and that ability to be customized often extends to its apps too. Zrythm is no exception, even more so with its new preferences’ dialog with this release.

While it does feature some more options, the most notable feature is definitely the addition of a search bar. Thanks to this, many options that would otherwise be hidden in various submenus are now more easily exposed to the user.

In addition to a new searchable preference dialog, the new release brings in a variety of optimizations, which should improve the user experience.

#### A Note About Zrythm’s Development Status

Before you go out and download it, you should know that Zrythm is still in the alpha phase.

Also, it is worth noting that the LV2 plugin support has been temporarily disabled because of the switch to GTK 4. So, you should expect to run into things that are incompatible with GTK 4.

As a result, stability is not guaranteed, and crashes are to be expected. If this still doesn’t put you off, then you can download a pre-built binary from their website using the button below. They also provide optional purchase options if you want to use it with bundled plugins compatible with the DAW out of the box.

[Download Zrythm][6]

_Will you be using Zrythm for your next audio project? How does the DAW fare as something that’s still in alpha? Let us know in the comments below!_

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/zrythm-gtk4-alpha/

作者：[Jacob Crume][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/jacob/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/gtk-4-release/
[2]: https://itsfoss.com/best-daw-linux/
[3]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQzOSIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[4]: https://lists.sr.ht/~alextee/zrythm-announce/%3C7bf37cf8ad0b5ca9aa4d884178392a6f7f26798f.camel@zrythm.org%3E
[5]: https://gitlab.gnome.org/GNOME/libadwaita
[6]: https://www.zrythm.org/en/download.html
