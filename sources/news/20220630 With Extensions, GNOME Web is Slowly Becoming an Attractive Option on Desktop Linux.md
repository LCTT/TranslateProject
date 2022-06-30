[#]: subject: "With Extensions, GNOME Web is Slowly Becoming an Attractive Option on Desktop Linux"
[#]: via: "https://news.itsfoss.com/gnome-web-extensions-dev/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

With Extensions, GNOME Web is Slowly Becoming an Attractive Option on Desktop Linux
======
GNOME Web is looking to shape up as the perfect Linux browser. Do you think so?

![gnome web][1]

GNOME Web (Epiphany) is one of the [best browsers available for Linux users][2].

It offers a minimal, and a unique user experience.

Unfortunately, the uniqueness does not incentivize users to use it as their primary web browser.

But, it looks like that could change soon…

GNOME Web is finally adding support for WebExtensions, as revealed by one of the developers (**Patrick a.k.a TingPing**).

This is all a part of the GNOME 43 feature set.

### GNOME Web with WebExtensions

![][3]

A minimal-looking browser, with extension support, what more can I ask for?

I don’t know about you, but I’ve been bummed by the fact that GNOME Web did not have extension support.

So, this makes me excited!

For now, this is experimental support for **Epiphany 43.alpha** version. So, you can only test it as an adventure with GNOME Web’s beta/alpha builds available.

The developer mentions:

> Epiphany 43.alpha supports the basic structure described above. We are currently modeling our behavior after Firefox’s ManifestV2 API which includes compatibility with Chrome extensions where possible. Supporting ManifestV3 is planned alongside V2 in the future.

You will have to explicitly enable the extension support using the terminal, and then install the extensions by downloading + adding the **.xpi** files for the extensions.

[Mozilla’s Firefox add-ons web portal][4] is the one you need to visit for the extensions.

![][5]

You can install the latest development version for Epiphany (GNOME Web) and enable extensions using the following commands:

```
flatpak remote-add --if-not-exists gnome-nightly https://nightly.gnome.org/gnome-nightly.flatpakrepo
flatpak install gnome-nightly org.gnome.Epiphany.Devel
flatpak run --command=gsettings org.gnome.Epiphany.Devel set org.gnome.Epiphany.web:/org/gnome/epiphany/web/ enable-webextensions true
```

Note that it is actively in development, and may not work as expected. You may want to keep an eye on the terminal for any errors and resolve that if it did not work for you on the first try.

For more technical details, you can read [TingPing’s blog post][6].

### Your Next Daily Driver?

GNOME Web is an entirely unique alternative to Firefox and Chrome/Chromium-based browsers on Linux.

So, with the upcoming support for extensions, would you be willing to give it a try as your main browser?

*What do you think about the improvements arriving in GNOME Web (or Epiphany)?*

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/gnome-web-extensions-dev/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/wp-content/uploads/2022/06/gnome-web-adds-extensions-support.jpg
[2]: https://itsfoss.com/best-browsers-ubuntu-linux/
[3]: https://news.itsfoss.com/wp-content/uploads/2022/06/gnome-web-extensions.png
[4]: https://addons.mozilla.org/en-US/firefox/extensions/
[5]: https://news.itsfoss.com/wp-content/uploads/2022/06/gnome-web-extensions-1.png
[6]: https://blog.tingping.se/2022/06/29/WebExtensions-Epiphany.html
