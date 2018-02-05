You GNOME it: Windows and Apple devs get a compelling reason to turn to Linux
======

![](https://regmedia.co.uk/2018/01/05/shutterstock_penguins_celebrate.jpg?x=442&y=293&crop=1)

**Open Source Insider** The biggest open source story of 2017 was unquestionably Canonical's decision to stop developing its Unity desktop and move Ubuntu to the GNOME Shell desktop.

What made the story that much more entertaining was how well Canonical pulled off the transition. [Ubuntu 17.10][1] was quite simply one of the best releases of the year and certainly the best release Ubuntu has put out in a good long time. Of course since 17.10 was not an LTS release, the more conservative users - which may well be the majority in Ubuntu's case - still haven't made the transition.

![Woman takes a hammer to laptop][2]

Ubuntu 17.10 pulled: Linux OS knackers laptop BIOSes, Intel kernel driver fingered

Canonical pulled Ubuntu 17.10 downloads from its website last month due to a "bug" that could corrupt BIOS settings on some laptops. Lenovo laptops appear to be the most common source of problems, though users also reported problems with Acer and Dell.

The bug is actually a result of Canonical's decision to enable the Intel SPI driver, which allows BIOS firmware updates. That sounds nice, but it's not ready for prime time. Clearly. It's also clearly labeled as such and disabled in the upstream kernel. For whatever reason Canonical enabled it and, as it says on the tin, the results were unpredictable.

According to chatter on the Ubuntu mailing list, a fix is a few days away, with testing happening now. In the mean time, if you've been affected (for what it's worth, I have a Lenovo laptop and was *not* affected) OMGUbuntu has some [instructions that might possibly help][4].

It's a shame it happened because the BIOS issue seriously mars what was an otherwise fabulous release of Ubuntu.

Meanwhile, the repercussions of Canonical's move to GNOME are still being felt in the open source world and I believe this will continue to be one of the biggest stories in 2018 for several reasons. The first is that so many have yet to actually make the move to GNOME-based Ubuntu. That will change with 18.04, which is an LTS release set to arrive later this year. Users upgrading between LTS releases will get their first taste of Ubuntu with GNOME come April.

### You got to have standards: Suddenly it's much, much more accessible

The second, and perhaps much bigger, reason Ubuntu without Unity will continue to be a big story in the foreseeable future is that with Ubuntu using GNOME Shell, almost all the major distributions out there now ship primarily with GNOME, making GNOME Shell the de facto standard Linux desktop. That's not to say GNOME is the only option, but for a new user, landing on the Ubuntu downloads webpage or the Fedora download page or the Debian download page, the default links will get you GNOME Shell on the desktop.

That makes it possible for Linux and open source advocates to make a more appealing case for the platform. The ubiquity of GNOME is something that hasn't been the case previously. And it may not be good news for KDE fans, but I believe it's going to have a profound impact on the future of desktop Linux and open source development more generally because it dovetails nicely with something that I believe has been a huge story in 2017 and will continue to be a huge story in 2018 - Flatpak/Snap packages.

Combine a de facto standard desktop with a standard means of packaging applications and you have a platform that's just as easy to develop for as any other, say Windows or macOS.

The development tools in GNOME, particularly the APIs and GNOME Builder tool that arrived earlier this year with GNOME 3.20, offer developers a standardised means of targeting the Linux desktop in a way that simply hasn't been possible until now. Combine that with the ability to package applications _independent of distro_ and you have a much more compelling platform for developers.

That just might mean that developers not currently targeting Linux will be willing to take another look.

Now this potential utopia has some downsides. As already noted it leaves KDE fans a little out in the cold. It also leaves my favourite distro looking a little less necessary than it used to. I won't be abandoning Arch Linux any time soon, but I'll have a lot harder time making a solid case for Arch with Flatpak/Snap packages having more or less eliminated the need for the Arch User Repository. That's not going to happen overnight, but I do think it will eventually get there.

### What to look forward to...

There are two other big stories to watch in 2018. The first is Amazon Linux 2, Amazon's new home-grown Linux distro, based - loosely it seems - on RHEL 7. While Amazon Linux 2 screams vendor lock-in to me, it will certainly appeal to the millions of companies already heavily invested in the AWS system.

It also appears, from my limited testing, to offer some advantages over other images on EC2. One is speed: AL2 has been tuned to the AWS environment, but perhaps the bigger advantage is the uniformity and ease of moving from development to production entirely through identical containers.

![Still from Mr Robot][5]

 Mozilla's creepy Mr Robot stunt in Firefox flops in touching tribute to TV show's 2nd season

The last story worth keeping an eye on is Firefox. The once, and possibly future, darling of open source development had something of a rough year. Firefox 57 with the Quantum code re-write was perhaps the most impressive release since Firefox 1.0, but that was followed up by the rather disastrous Mr Robot tie-in promo fiasco that installed unwanted plugins in users situations, an egregious breach of trust that would have made even Chrome developers blush.

I think there are going to be a lot more of these sorts of gaffes in 2018. Hopefully not involving Firefox, but as open source projects struggle to find different ways to fund themselves and attain higher levels of recognition, we should expect there to be plenty of ill-advised stunts of this sort.

I'd say pop some popcorn, because the harder that open source projects try to find money, the more sparks - and disgruntled users - are going fly. ®

--------------------------------------------------------------------------------

via: https://www.theregister.co.uk/2018/01/08/desktop_linux_open_source_standards_accessible/

作者：[Scott Gilbertson][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:
[1]:https://www.theregister.co.uk/2017/10/20/ubuntu_1710/
[2]:https://regmedia.co.uk/2017/12/14/shutterstock_laptop_hit.jpg?x=174&y=115&crop=1
[3]:https://www.theregister.co.uk/2017/12/21/ubuntu_lenovo_bios/
[4]:http://www.omgubuntu.co.uk/2018/01/ubuntu-17-10-lenovo-fix
[5]:https://regmedia.co.uk/2017/12/18/mr_robot_still.jpg?x=174&y=115&crop=1
[6]:https://www.theregister.co.uk/2017/12/18/mozilla_mr_robot_firefox_promotion/
