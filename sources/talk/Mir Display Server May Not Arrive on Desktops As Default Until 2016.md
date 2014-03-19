Mir Display Server May Not Arrive on Desktops As Default Until 2016
================================================================================
**Ubuntu’s next generation display server Mir, developed by Canonical as a flexible alternative to Wayland and XServer, could be facing another delay on its way to the desktop. **

![](http://www.omgubuntu.co.uk/wp-content/uploads/2013/06/mir2.jpg)

The technology was initially positioned as a candidate for shipping by default on the desktop later this year but, [in a video address][1] to developers, Mark Shuttleworth has now intimated that Mir may not find its way on to the Ubuntu desktop until the release of Ubuntu 16.04 LTS — in 2016. 

Responding to a question asking when users could expect to find it available on PCs, Shuttleworth replied:

> “I expect Mir to be the display server  [to be default] as soon as it’s rock solid and we have a story we’re really proud of on it. You can run it on your desktop [now], but we don’t want to let a love of technology interfere with our mission to be great for the user. This is a great place for us to set the bar very high in terms of performance…where we have freedom to get it right, without having to worry too much about compatibility.
> 
> By 16.04 it’ll be the default display server…That’s the kind of timeline we’re looking at.”

### Mir Oh Mir ###

It’s not immediately clear what impact, if any, such a delay would mean for Unity 8, scheduled to arrive on desktops this October.

Similarly, it’s also not clear from his words whether the ‘by 16.04′ references a pure Mir experience or something akin to the Mir + Xmir hybrid proposed for Ubuntu 13.10. Either way a slip in timeframe is a hazard of any development process. Display servers are not easy technologies to build, particularly when designing one to span all manner of screen sizes and form factors.

This delay, if as assured as some news outlets are reporting it as being, won’t be the first to scupper Canonical’s plans. Ubuntu [originally intended to land a Mir Hybrid  in Ubuntu 13.10][2], but technical flaws prevented that from happened. Its inclusion in the upcoming release of 14.04 LTS [was also ruled][3] out early on. 

### Mir As It Is ###

As disappointing as the above may read Mir is continuing to evolve at breakneck pace. In fact, while it won’t be default, it will be possible to install a Mir session in Ubuntu 14.04 LTS, bundled with an in-progress version of the Unity 8 desktop. It’s also rocking out as the default on Ubuntu Touch for both phones and tablets.

But on the desktop it looks like things may take a little longer. Unlike on phones and tablets, where Ubuntu is able to make use of Android device drivers [via Hybris][4], there are currently no proprietary AMD, Intel or Nvidia desktop graphics drivers supporting Mir. Upstream support in open-source drivers remain patchy at best, with Canonical [being forced][5] to carry patches to enable functionality.

**The more time Canonical has to refine, iterate and improve on the technology in its desktop form, the better the end user experience of it will be.**

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2014/03/mir-default-display-server-ubuntu-2016

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.youtube.com/watch?v=dWTVe5Mdv0Y&feature=share&t=29m19s
[2]:http://www.omgubuntu.co.uk/2013/10/xmir-longer-default-supported-cards-13-10
[3]:http://www.omgubuntu.co.uk/2013/11/expect-ubuntu-14-04-lts
[4]:http://en.wikipedia.org/wiki/Hybris_(software)
[5]:http://www.omgubuntu.co.uk/2013/09/intel-remove-xmir-support-in-xorg-video-driver