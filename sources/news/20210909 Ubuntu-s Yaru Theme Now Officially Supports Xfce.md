[#]: subject: "Ubuntu’s Yaru Theme Now Officially Supports Xfce"
[#]: via: "https://news.itsfoss.com/yaru-xfce-support/"
[#]: author: "Jacob Crume https://news.itsfoss.com/author/jacob/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Ubuntu’s Yaru Theme Now Officially Supports Xfce
======

Back when [Ubuntu 20.04][1] was released, the Ubuntu team stunned everyone with the new Yaru theme’s beautiful visuals and simplicity. It keeps on getting better with each Ubuntu release. It has become the symbolism of Ubuntu now.

However, the Yaru theme was not well supported for other desktop environments like Xfce.

Fortunately, this is set to change with a recent pull request on the [project’s GitHub page][2]. Here, we will be looking at this change, as well as how to try out these changes for yourself.

### Yaru on Xfce

![][3]

This update started in late July, when developer [Muqtxdir][4] opened [a pull request on the Yaru GitHub page][5] to add support for the XFCE desktop environment. Over the course of a month, the awesome developers there worked tirelessly on improving Muqtxdir’s work, with a result that is truly stunning.

![][3]

One interesting change is the panel, which now looks similar to the panel found in the GNOME desktop environment.

### If you want to try it right away (not recommended)

If you are already using XFCE, trying out the Yaru theme is as simple as following the instructions on here. For this, I will be assuming that you are using Xubuntu, however the commands can be easily adapted for other distributions.

```
sudo apt install git meson sassc libglib2.0-dev libxml2-utils
git clone https://github.com/ubuntu/yaru
cd yaru && meson build -Dxfwm4=true && sudo ninja -C build install
```

_**If you don’t quite feel comfortable building it from source, I suspect that it will be available with Xubuntu 21.10, which is only a month away now.**_

Either way, I am really excited about this change, especially as it gives XFCE a much more modern and simplistic look. Plus, it also gives users a major reason to upgrade to Xubuntu 21.10.

What do you think about the Yaru theme on XFCE? Let me know in the comments below!

_Source: [Linux Uprising][6]_

#### Big Tech Websites Get Millions in Revenue, It's FOSS Got You!

If you like what we do here at It's FOSS, please consider making a donation to support our independent publication. Your support will help us keep publishing content focusing on desktop Linux and open source software.

I'm not interested

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/yaru-xfce-support/

作者：[Jacob Crume][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/jacob/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/download-ubuntu-20-04/
[2]: https://github.com/ubuntu/yaru
[3]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQzOSIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[4]: https://github.com/Muqtxdir
[5]: https://github.com/ubuntu/yaru/pull/2971
[6]: https://www.linuxuprising.com/2021/09/ubuntus-yaru-theme-gets-official.html
