[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Disney’s Streaming Service is Having Troubles with Linux)
[#]: via: (https://itsfoss.com/disney-plus-linux/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Disney’s Streaming Service is Having Troubles with Linux
======

You might be already using Amazon Prime Video (comes free with [Amazon Prime membership][1]) or [Netflix on your Linux system][2]. Google Chrome supports these streaming services out of the box. You can also [watch Netflix on Firefox in Linux][3] but you have to explicitly enable DRM content.

However we just learned that Disney’s upcoming streaming service, Disney+ does not work in the same way.

A user, Hans de Goede, on [LiveJournal][4] revealed this from his experience with Disney+ in the testing period. In fact, the upcoming streaming service Disney+ does not support Linux at all, at least for now.

### The trouble with Disney+ and DRM

![][5]

As Hans explains in his [post][4], he subscribed to the streaming service in the testing period because of the availability of Disney+ in Netherlands.

Hans tested it on Fedora with mainstream browsers like Firefox and Chrome. However, every time, an error was encountered – “**Error Code 83**“.

So, he reached out to Disney support to solve the issue – but interestingly they weren’t even properly aware of the issue as it took them a week to give him a response.

Here’s how he puts his experience:

> So I mailed the Disney helpdesk about this, explaining how Linux works fine with Netflix, AmazonPrime video and even the web-app from my local cable provider. They promised to get back to me in 24 hours, the eventually got back to me in about a week. They wrote: “We are familiar with Error 83. This often happens if you want to play Disney + via the web browser or certain devices. Our IT department working hard to solve this. In the meantime, I want to advise you to watch Disney + via the app on a phone or tablet. If this error code still occurs in a few days, you can check the help center …” this was on September 23th.

They just blatantly advised him to use his phone/tablet to access the streaming service instead. That’s genius!

### Disney should reconsider their DRM implementation

What is DRM?

Digital Rights Management ([DRM][6]) technologies attempt to control what you can and can’t do with the media and hardware you’ve purchased.

Even though they want to make sure that their content remains protected from pirates (which won’t make a difference either), it creates a problem with the support for multiple platforms.

How on earth do you expect more people to subscribe to your streaming service when you do not even support platforms like Linux? So many media center devices run on Linux. This will be a big setback if Disney continues like this.

To shed some light on the issue, a user on [tweakers.net][7] found out that it is a [Widevine][8] error. Here, it generally means that your device is incompatible with the security level of DRM implemented.

It turns out that it isn’t just limited to Linux – but a lot of users are encountering the same error on other platforms as well.

In addition to the wave of issues, the Widevine error also points to a fact that Disney+ may not even work on Chromebooks, some Android smartphones, and Linux desktops in general.

Seriously, Disney?

### Go easy, Disney!

A common DRM (low-level security) implementation with Disney+ should make it accessible on every platform including Linux systems.

Disney+ might want to re-think about the DRM implementation if they want to compete with other streaming platforms like Netflix and Amazon Prime Video.

Personally, I would prefer to stay with Netflix if Disney does not care about supporting multiple platforms.

It is not actually about supporting “Linux” but conveniently making the streaming service available for more platforms which could justify its subscription fee.

What do you think about this? Let me know your thoughts in the comments below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/disney-plus-linux/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://www.amazon.com/tryprimefree?tag=chmod7mediate-20
[2]: https://itsfoss.com/watch-netflix-in-ubuntu-linux/
[3]: https://itsfoss.com/netflix-firefox-linux/
[4]: https://hansdegoede.livejournal.com/22338.html
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/10/disney-plus-linux.jpg?resize=800%2C450&ssl=1
[6]: https://www.eff.org/issues/drm
[7]: https://tweakers.net/nieuws/157224/disney+-start-met-gratis-proefperiode-van-twee-maanden-in-nederland.html?showReaction=13428408#r_13428408
[8]: https://www.widevine.com/
