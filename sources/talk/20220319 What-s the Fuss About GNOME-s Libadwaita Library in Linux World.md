[#]: subject: "What’s the Fuss About GNOME’s Libadwaita Library in Linux World?"
[#]: via: "https://news.itsfoss.com/gnome-libadwaita-library/"
[#]: author: "Jacob Crume https://news.itsfoss.com/author/jacob/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

What’s the Fuss About GNOME’s Libadwaita Library in Linux World?
======

Back in March 2020, the GNOME project announced a new library called Libadwaita. This promised to fix numerous fundamental issues with GTK, the library GNOME uses to build its desktop environment.

Unfortunately, this announcement also resulted in some significant community backlash. While this hasn’t really slowed the adoption of Libadwaita, it seems that some users are now starting to boycott GNOME because of it.

But what impact does Libadwaita have in the real world? And how does this differ for users and developers?

### Main Features Of Libadwaita

While it was originally meant to be a solution to the many GNOME-specific libraries developers needed to use, it has since grow into much more. As Adrian Plazas said in his [blog][1]:

> GNOME needs a blessed library implementing its HIG (Human Interface Guidelines) rapidly, developed in collaboration with its design team.
>
> […]
>
> To solve both GTK’s need of independence and GNOME’s need to move faster, we are creating the libadwaita project. This new libadwaita library intends to extend that concept by being the missing code part of Adwaita. The library will be implemented as a direct GTK 4 continuation and replacement of libhandy, and it will be developed by libhandy’s current developers.

Adrian Plazas

Basically, Libadwaita is meant to be a GNOME-specific version of GTK4, with the GNOME project in complete control of the look and feel of apps. However, it also incorporates a number of other features:

  * Adaptive widgets so that apps can work on both desktops, laptops, tablets, and smartphones (like the PinePhone)
  * New Adwaita version, following the latest trends in UI design
  * Built-in styles for buttons and other widgets
  * Built-in in-app notifications
  * Improved and more customizable animations
  * Speed and fluidity improvements



While all these features are awesome, a select few have divided the community, mostly between developers and users. As someone who has made a number of small little projects with Libadwaita and GTK3 (without Libadwaita), as well as a GNOME user, I want to talk about the different perspectives of different people.

### User Perspective

![][2]

Unfortunately, Libadwaita has been met by immense backlash by some GNOME users. This all stems from one key change in Libadwaita: The inability to theme it. This is because the Adwaita theme is built right into Libadwaita, meaning that it would need to be recompiled every time the theme was changed.

This is a fundamental aspect of Libadwaita, for better or for worse. As a result, some users have decided that this is an attempt by GNOME to lock down their app ecosystem.

However, this does not mean that Libadwaita is dead in the water. From the very beginning, the GNOME developers have been adamant that a theming API would come soon, and it looks like this will happen.

While this wouldn’t solve the issue of incompatibility of existing GTK and GNOME themes, it would solve some more fundamental issues. As has been said numerous times, the CSS theming that GTK currently users is much more of a band-aid fix to the problem of theming than a permanent solution. And, as with many open-source projects, this band-aid fix has been built upon to the extent now that there is very little chance of going back.

Libadwaita would go some steps to fixing this, but at the cost of the existing app ecosystem. With all this hate, however, developers continue to implement it. Why might this be?

### Developer Perspective

![][2]

As you saw in the feature list before, there are a huge number of features that help developers tremendously. For me, this has been the ability to create convergent apps, and the sole reason I use Libadwaita.

Unfortunately, as with almost every new GNOME library, there is minimal language-specific documentation available. This is instead replaced with a much more generic, automatically-generated documentation system.

While this is better than nothing, it is still quite lacklustre, especially considering the incredible community of developers GNOME has.

### A Better Solution?

Now, I hope that I have explained everyone’s position on Libadwaita, except mine. To be honest, I actually quite enjoy developing with it, even with all its teething problems. Unfortunately, I am also a huge fan of theming, and have found Libadwaita apps quite jarring compared to everything else.

However, I think there is a solution. As I said before, Libadwaita was created in response to the faster development pace GNOME needed. However, couldn’t this be achieved through a branch from GTK 4?

This would allow GTK to inherit all the exciting features in Libadwaita, as well as allowing a more unified approach to GNOME libraries. As I said before in [my Flutter article][3], I believe that desktop Linux is too fragmented, and this extends to GTK.

What do you think about Libadwaita? Do you support it, or are you going to be boycotting GNOME? Please, I would love to hear your opinions in the comments below!

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/gnome-libadwaita-library/

作者：[Jacob Crume][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/jacob/
[b]: https://github.com/lujun9972
[1]: https://aplazas.pages.gitlab.gnome.org/blog/blog/2021/03/31/introducing-libadwaita.html
[2]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQzOSIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[3]: https://news.itsfoss.com/no-flutter-on-linux-desktop/
