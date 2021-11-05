[#]: subject: "After Moving From FreeBSD to Void Linux, Project Trident Finally Discontinues"
[#]: via: "https://news.itsfoss.com/project-trident-discontinues/"
[#]: author: "John Paul https://news.itsfoss.com/author/john/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

After Moving From FreeBSD to Void Linux, Project Trident Finally Discontinues
======

Sadly, the [Project Trident][1] team announced that they will be ending development of their Linux distro.

### Story Time!!!

For those of you who have not heard of Project Trident, let me give you a little ride down memory lane. Back in 2005, Kris Moore introduced [PC-BSD][2] as an easy way to set up FreeBSD with a desktop interface. It was acquired the following year by [iXsystems][3]. In September of 2016, the name of the project was changed to TrueOS. The project also became a rolling release based on the Current branch of FreeBSD. Two years later, TrueOS [announced][4] that they would be doing away with the desktop version of their operating system and focusing on the enterprise and server market. The desktop elements [were spun off][5] to a new project: Project Trident.

For a time, the dev team at Project Trident tried their best to create a good desktop experience on top of FreeBSD. However, due to [issues with FreeBSD][6] including “hardware compatibility, communications standards, or package availability continue to limit Project Trident users” they decide to base it on something else. Their solution was to rebase their project on [Void Linux][7] in 2019. For a while, it looked like the future of Project Trident was set. Then 2020 happened.

![Project Trident desktop][8]

### The End of a Project

On October 29th, the Project Trident team posted the following [announcement][9]:

> It is with great sadness that we are announcing that Project Trident will be entering is “sunset” period starting Nov 1 of 2021 and will be closing up shop in March of 2022. The core team of the project has come to this decision together. With changes and events over the past two years in life, jobs, family, etc; our individual priorities have changed as well.
>
> We will keep the Project Trident package repository and websites up and running until the EOL date of March 1, 2022, but we strongly encourage users to begin looking for alternative desktop OS solutions over the coming new year holiday.
>
> Thank you all for your support and encouragement! The project had a good run and we thoroughly enjoyed getting to know many of you over the years.

### The Lumina Project Continues

One constant throughout the PC-BSD/TrueOS/Project Trident saga is the desktop environment in use. In 2012, [Ken Moore][10] (Kris’ younger brother) started working on a Qt-based desktop environment named [Lumina][11]. In 2014, it became the default desktop environment of PC-BSD and has stayed that way down to Project Trident. Lumina stands apart from other desktop environment because it was designed to be operating system agnostic. Other desktop environments like KDE and GNOME have Linux specific code that makes it hard to port to BSD.

![Lumina desktop environment][8]

June of this year, Ken [handed the reigns of Lumina][12] to a fellow Project Trident developer [JT Pennington][13] (also of [BSDNow][14] fame).

The [announcement][12] states:

> After more than 7 years of work, I have decided that it is time to let others take over the development of the Lumina Desktop project going forward. It has been an incredible task which has pushed me into areas of development that I had never previously considered. However, with work and life changes, my time for developing new functionality for Lumina has become nearly non-existent, particularly for the Qt5 -&gt; Qt6 change that will be coming within the next year or so. By passing the torch over to JT (q5sys on GitHub), I am hoping that the project might receive more timely updates, for the benefit of everyone.
>
> Thank you all, and I hope for the continued success of the Lumina Desktop project!!

### Final Thoughts

I always had high hopes for Project Trident. They were small compared to many of the distros that we cover. They weren’t just a reskin of Arch or Ubuntu with one or two new tools. Not only that, but they were working to improve a distro (Void) that shared their ideals. However, life happens, even to the best of us. I wish Ken, JT and the others well as they sunset a project that they have spent many hours working on. Hopefully, we’ll be seeing more from them in the future.

#### Big Tech Websites Get Millions in Revenue, It's FOSS Got You!

If you like what we do here at It's FOSS, please consider making a donation to support our independent publication. Your support will help us keep publishing content focusing on desktop Linux and open source software.

I'm not interested

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/project-trident-discontinues/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://project-trident.org/
[2]: https://en.wikipedia.org/wiki/TrueOS
[3]: http://ixsystems.com/
[4]: https://itsfoss.com/trueos-plan-change/
[5]: https://itsfoss.com/project-trident-interview/
[6]: https://project-trident.org/post/os_migration/
[7]: https://voidlinux.org/
[8]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQzOSIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[9]: https://project-trident.org/post/2021-10-29_sunset/
[10]: https://github.com/beanpole135
[11]: https://lumina-desktop.org/
[12]: https://lumina-desktop.org/post/2021-06-23/
[13]: https://github.com/q5sys
[14]: https://www.bsdnow.tv/
