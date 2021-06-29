[#]: subject: (Dark and Light Only! Ubuntu 21.10 Looks to Ditch the Standard Mixed Color Theme)
[#]: via: (https://news.itsfoss.com/ubuntu-21-10-theme-change/)
[#]: author: (Ankush Das https://news.itsfoss.com/author/ankush/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Dark and Light Only! Ubuntu 21.10 Looks to Ditch the Standard Mixed Color Theme
======

Ubuntu’s default “Yaru” community theme is an excellent choice. However, Ubuntu’s team has been tweaking it for a while since Ubutu 19.10 to match their branding and offer a good-looking experience.

I liked the default themes available with Ubuntu 20.04. Up until now, you got standard, light, and dark theme options to choose from.

![][1]

But starting with [Ubuntu 21.10][2], you will no longer find the “**Standard**” (or mixed) theme available to pick. It all comes down to two choices that include light and dark theme only.

Now, why is this happening? What exactly is the Standard theme offering now?

Here’s what you need to know …

### Ubuntu’s Standard Theme is Problematic

![][1]

If you have used Ubuntu, you probably know that Ubuntu’s Standard theme refers to a mixed theme. It features a dark window bar (or the titlebar of applications) and the rest follows a light theme pattern.

With **Ubuntu and GNOME’s default theme color conflicts** and **lack of theming API** for GTK (and Gnome shell), it is already [problematic][3] to customize and work on Ubuntu’s desktop theme.

Moreover, GTK 3 and GTK 4 do not support having a separate background color for the headerbar from the rest of the window. Hence, it is tough to keep bug-free implementations for every GTK application.

And that is the reason the Yaru community design team recently [proposed][4] to remove the mixed theme.

Ubuntu’s team has agreed to this decision and the change has been merged. You should no longer find the mixed theme in Ubuntu 21.10 but only the dark and light themes as your option.

In other words, “Yaru” will be the light theme, and “Yaru dark” will be the dark theme when using [GNOME Tweaks][5]. There will be no “Yaru-light” anymore.

### Will They Bring Back the Mixed Theme?

Unless there are changes in the upstream — GNOME providing a theming API and GTK 3/4 supporting more customizability for headerbar, the mixed theme is gone for good.

So, with Ubuntu 21.10 and any future releases, you get fully light and fully dark themes, which should offer a seamless user experience across any GTK application.

### A Potential Rebranding in Ubuntu 21.10

While the Brand and Visual team at Canonical agreed to the default Yaru theme changes, they also want to work closely with the Yaru community design team for the upcoming rebranding, as mentioned by a designer in this [GitHub thread][4]:

![][6]

So, what exactly do we know about the upcoming rebranding for Ubuntu 21.10? Nothing yet.

But considering that Ubuntu 20.04 shaped up with attractive branding and visuals, I’m excited about this one. Most probably, the default color scheme will change – but what what will it change to?

Let’s wait for that! Feel free to share your thoughts on this development on Ubuntu’s future design in the comments below.

First noticed at: [OMG! Ubuntu][7]

#### Big Tech Websites Get Millions in Revenue, It's FOSS Got You!

If you like what we do here at It's FOSS, please consider making a donation to support our independent publication. Your support will help us keep publishing content focusing on desktop Linux and open source software.

I'm not interested

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/ubuntu-21-10-theme-change/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjUzNSIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[2]: https://news.itsfoss.com/ubuntu-21-10-release-schedule/
[3]: https://github.com/ubuntu/yaru/discussions/2677
[4]: https://github.com/ubuntu/yaru/issues/2913
[5]: https://itsfoss.com/gnome-tweak-tool/
[6]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjE1OCIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[7]: https://www.omgubuntu.co.uk/2021/06/ubuntu-21-10-yarn-theme-change
