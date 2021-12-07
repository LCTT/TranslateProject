[#]: subject: "GNOME has a Brand New Text Editor and it is Likely to Replace Gedit in GNOME 42"
[#]: via: "https://news.itsfoss.com/gnome-text-editor-to-replace-gedit/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

GNOME has a Brand New Text Editor and it is Likely to Replace Gedit in GNOME 42
======

Gedit is the default text editor for the GNOME desktop environment. It is a popular option and an effective text editor that offers all the essentials with a simple user interface.

But, with GNOME evolving, there is a new text editor that hasn’t yet replaced gedit. And, looking at its next release, it might just be ready to replace gedit in the upcoming GNOME 42 release with a bunch of improvements.

[Christian Hergert][1] shares more details about it in his [blog post][2] and on Twitter.

In this article, let me highlight those new improvements to GNOME Text Editor.

### Preferences Dialogue Makes a Comeback

The preferences setting was moved to the sidebar as part of an experiment in its previous release.

![][3]

But, it did not prove to be as convenient and good-looking.

So, the preferences dialogue is coming back (as shown in the screenshot below) that aims to blend in with the design language of other GNOME apps without being clunky.

![Credits: Christian Hergert ][4]

Looks pretty sweet to me and should give a better user experience compared to the sidebar implementation for sure!

### Improved Open ‘Popover’ Feature

![Credits: Christian Hergert ][5]

When you try to open a recent file or search for something, a popover appears to quickly look for any recent files without launching a new dialogue box.

This saves time and is a nice feature to have. With the upcoming release for text editor, this has received some slight improvements to appear slimmer and more effective.

In other words, you will find it improved for keyboard navigation by simply hitting Ctrl + K and then looking for the file you want.

### Introducing Recoloring Support

The upcoming release for GNOME’s text editor will let you easily apply different style-scheme (or themes) that affects the entire application.

The blog post mentions more about it:

> The most visual piece of work this week was in introducing recoloring support. It builds atop [libadwaita][6] and uses a CSS provider to override the colors in the theme. I expect there will be a recoloring API in the not-too distant future for libadwaita which will provide this for us.

Here’s a sample of what it looks like when you apply a style-scheme:

![Credits: Christian Hergert ][7]

You can find some of the themes bundled and can look for more as you explore. You can find more screenshot in Christian’s blog post.

![Credits: Christian Hergert ][7]

You can also find some other technical changes and a vim emulation easter egg by Christian as you explore the [blog post for more details][2].

### Will GNOME Text Editor Replace Gedit?

As of now, there is no official confirmation on this. However, looking at the [development activity for gedit][8] (currently as 41 alpha version) with no significant additions in the past few releases, it could mean that the new GNOME Text Editor will replace gedit in GNOME 42.

In fact, GNOME’s new text editor plans to officially replace gedit as mentioned in its [GitLab page][9], but will it happen with GNOME 42? Its developer, Christian Hergert, mentions in his blog

> [Text Editor][9] has really been shaping up in the past couple weeks as we race towards getting things ready for GNOME 42.

This could be taken as a hint that GNOME 42 may seem the inclusion of this new text editor.

It’s not just GNOME. [KDE also has revamped Kate][10] by adding features for developers. You’ve got plenty of [open source text editors][11] to choose from.

We shall keep an eye on it when it releases. What do you think?

#### Big Tech Websites Get Millions in Revenue, It's FOSS Got You!

If you like what we do here at It's FOSS, please consider making a donation to support our independent publication. Your support will help us keep publishing content focusing on desktop Linux and open source software.

I'm not interested

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/gnome-text-editor-to-replace-gedit/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://twitter.com/hergertme
[2]: https://blogs.gnome.org/chergert/2021/12/03/text-editor-happenings/
[3]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjYwMyIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[4]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjEwMjQiIHdpZHRoPSI2NzciIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgdmVyc2lvbj0iMS4xIi8+
[5]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjUyMiIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[6]: https://gnome.pages.gitlab.gnome.org/libadwaita/doc/main/
[7]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjU3NyIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[8]: https://gitlab.gnome.org/GNOME/gedit
[9]: https://gitlab.gnome.org/GNOME/gnome-text-editor
[10]: https://news.itsfoss.com/kate/
[11]: https://itsfoss.com/best-modern-open-source-code-editors-for-linux/
