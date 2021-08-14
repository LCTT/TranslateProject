[#]: subject: (GNOME Web Canary is Now Available to Test Bleeding Edge Features)
[#]: via: (https://news.itsfoss.com/gnome-web-canary/)
[#]: author: (Ankush Das https://news.itsfoss.com/author/ankush/)
[#]: collector: (lujun9972)
[#]: translator: (zd200572)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

GNOME Web Canary is Now Available to Test Bleeding Edge Features
======

Epiphany or [GNOME Web][1] is a minimal and yet capable browser for Linux distributions. You should find it as the default browser for elementary OS.

With GNOME 40, the Epiphany browser has had some [improvements and additions][2].

Behind the scenes, it regularly gets some exciting improvements and feature additions. And for that, you can opt for the Tech Preview version of GNOME Web tailored for early testers.

Now, a new Canary flavor has been introduced that you can use to test features that are not yet available even in the tech preview build.

### GNOME Web Canary Flavor

![][3]

GNOME Web’s “Canary” builds let you test features that are not even available in the latest [WebKitGTK][4] version.

Do note that the canary builds are supposed to be extremely unstable, even worse than the development builds available as a tech preview.

However, with the help of a Canary build, an end-user can test things way early in the process of development that can help find disastrous bugs.

Not just limited to end-user early testing, a canary build also makes things easier for a GNOME Web developer.

They no longer have to build WebKitGTK separately in order to implement and test a new feature.

Even though there was a Flatpak SDK available to ease the process for developers, it was still a time-consuming task.

Now, with that out of the way, the development pace can potentially improve as well.

### How to Get the Canary Build?

First, you need to add the WebKit SDK Flatpak remote using the commands below:

```
flatpak --user remote-add --if-not-exists webkit https://software.igalia.com/flatpak-refs/webkit-sdk.flatpakrepo
flatpak --user install https://nightly.gnome.org/repo/appstream/org.gnome.Epiphany.Canary.flatpakref
```

Once done, you can install the Canary by using the [Flatpakref file][5] provided.

Testing a Canary build gives more users the ability to help GNOME Web developers in the process. So, it is definitely a much-needed addition to improve the development of the GNOME Web browser.

For more technical details, you might want to take a look at the [announcement post][6] by one of the developers.

#### Big Tech Websites Get Millions in Revenue, It's FOSS Got You!

If you like what we do here at It's FOSS, please consider making a donation to support our independent publication. Your support will help us keep publishing content focusing on desktop Linux and open source software.

I'm not interested

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/gnome-web-canary/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://wiki.gnome.org/Apps/Web/
[2]: https://news.itsfoss.com/gnome-web-new-tab/
[3]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjY0MiIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[4]: https://webkitgtk.org
[5]: https://nightly.gnome.org/repo/appstream/org.gnome.Epiphany.Canary.flatpakref
[6]: https://base-art.net/Articles/introducing-the-gnome-web-canary-flavor/
