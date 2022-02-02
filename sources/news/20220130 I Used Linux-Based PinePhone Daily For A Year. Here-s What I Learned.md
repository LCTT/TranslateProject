[#]: subject: "I Used Linux-Based PinePhone Daily For A Year. Here’s What I Learned!"
[#]: via: "https://news.itsfoss.com/pinephone-review/"
[#]: author: "Jacob Crume https://news.itsfoss.com/author/jacob/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

I Used Linux-Based PinePhone Daily For A Year. Here’s What I Learned!
======

When Pine64 announced the PinePhone in 2019, no one could have foreseen the tremendous impact it would have on mobile Linux, desktop Linux, and privacy as a whole.

As one of the [few phones designed specifically to run desktop Linux][1], it had all the features of a low-end Android phone, combined with the versatility of a laptop. Unfortunately, desktop Linux is just that; it is made for _desktops_, not phones.

Fortunately, thanks to the incredible power of the GNOME, KDE, Pine64, and general Linux communities, whole new desktop environments, applications, and distributions were born. Some of the more recognizable of these include Plasma Mobile, [Phosh][2], Megapixels, and Mobian.

With all the key pieces in place, all Pine64 needed to was to sell PinePhones, and sell PinePhones they did. Every community edition (each preloaded with a different distro) pre-ordering round received thousands of orders, one of which was mine.

Since I received my unit in December 2020, the PinePhone has been a key part in my daily life, with me using it as my daily driver for the whole of 2021. Here are my experiences with it.

### It’s Performance Is Like Molasses

![Opening Firefox on the PinePhone][3]

Sporting an Allwinner a64 SoC, the PinePhone has just enough power to do the most basic phone tasks. Even simple things, like opening Firefox, can take almost 20 seconds, no doubt thanks to its measly 4 cores. This is in stark comparison to modern mid-range and high-end Android phones, all of which have 8 core processors running at least at 2 GHz.

Fortunately, the community has again stepped in, implementing thousands of small software optimizations. While still not as performant as it’s Android competitors, this does mean the PinePhone is pretty usable for most phone tasks, and even some desktop-oriented apps when using an external monitor through the included dock.

Despite all of this, the PinePhone is capable enough for most situations, even if it might stutter a bit here and there. But what about the battery? Can it really last all day?

### The Battery Is… Okay

![][4]

While I would love to be able to say that thanks to the PinePhone’s low-power components, the battery life is incredible. Unfortunately, this is not the case, even after all the battery saving improvements that have been implemented.

After charging it overnight, I usually read the news in the morning, followed by some more at lunchtime. Even though this amounts to less than an hour of screen-on time, the battery still drops about 35% pretty consistently, leaving me with just 65% for the afternoon. Fortunately, this is not a major issue, especially as the modem’s deep sleep function works perfectly.

For those of you that don’t know, almost all mobile phones put their modem into a deep sleep mode, which basically powers off everything except for what is required to receive calls and texts. Then, when you receive a call, the modem wakes up itself and the SoC, which then starts ringing.

From my experience, the implementation of deep sleep on the PinePhone has been absolutely incredible, with not a single call being missed. As a result of this, the PinePhones screen-off battery life has been pretty impressive considering its terrible screen-on time. I’ve consistently managed more than 60 hours of battery life with minimal usage, something I can’t say about my Galaxy S20 FE.

### Don’t Expect Fancy Photos

Left: iPhone 4S, Right: PinePhone

With a measly 5 MP rear shooter and an even smaller 2 MP front camera, don’t expect to be taking professional-grade photos. Even many USB webcams offer better image quality, as well as more general features. Heck, the PinePhone’s camera isn’t even capable of taking videos!

The small amount of post-processing done does help clean up the photos a bit, although not enough to make them social media-ready. For comparison, here is the same photo taken on an iPhone 4S (from 2011) and the PinePhone (from 2019).

Between the ancient SoC, average battery life, and lackluster cameras, it is clear the PinePhone’s hardware is definitely not it’s forte. But can the software save it?

### Desktop Environment Or Mobile Environment?

Within the world of mobile Linux, there are three major players in the desktop environment space. These are:

  * Plasma Mobile
  * Phosh
  * [Lomiri][5]



Over the course of my time daily driving the PinePhone, I spent roughly 4 months with each environment. During this time, I found a number of different features, problems, and levels of matureness between them, which I will be discussing here.

#### Plasma Mobile

![Image Credit: KDE Plasma Mobile][6]

Released back in 2015 just after Plasma 5, Plasma Mobile has been silently being developed in the background for almost 7 years. Between the time of its initial release and the release of the PinePhone, the team behind Plasma Mobile managed to create a fairly usable mobile desktop environment.

However, with the release of the PinePhone, this has all changed. Many of the numerous bugs that plagued Plasma Mobile have been ironed out, and immense work was put into improving the UI.

As a KDE project, Plasma Mobile makes extensive use of Kirigami, which results in an extremely consistent and mobile-friendly app ecosystem. Additionally, many of the pre-existing KDE apps also scale perfectly to it.

This app ecosystem is extended even further thanks to the Maui project, which just released their Maui Shell (more on that soon). Thanks to their powerful suite of utility apps, Plasma Mobile is a true Android replacement.

However, that’s not to say that Plasma Mobile is perfect. Even in 2022, there are still a number of remaining bugs and issues. However, this is offset by its mature app ecosystem, extensive use of gestures, and purely mobile focus.

#### Phosh

![Screenshots of Phosh on the PinePhone][7]

Phosh, developed primarily by Purism, is the GTK equivalent of Plasma Mobile. Originally built for the Librem 5, it has been in the works since 2018. At just 4 years old, you may be led to believe that Phosh is immature, but that couldn’t be further from the truth.

In fact, I never encountered a single crash with Phosh for more than 3 months, compared to days between crashes in Plasma Mobile. Of course, being built on GTK and other Gnome technologies, Phosh has a number of apps available. Some popular apps that work perfectly include:

  * Firefox
  * Geary
  * Headlines (Reddit app)
  * Megapixels (Camera app)
  * Gnome Maps



Additionally, many apps designed for Plasma Mobile also work perfectly, even though they use Kirigami. Unfortunately, while many GTK apps are available, they don’t scale anywhere near as well as Kirigami apps do, so developers have to specifically make their apps compatible with Phosh and the PinePhone.

Additionally, GTK is a primarily desktop-oriented UI toolkit, meaning features such as gestures, and even apps being able to fit on the screen are patchy at best, and non-existent at worst.

Fortunately, though, Purism has put a lot of work into the default Gnome apps, which are all perfectly usable and fast.

Overall, Phosh is extremely solid, especially for users of Gnome on desktop and laptop computers. However, it is also held back by its lack of core mobile features, and optimized apps.

#### Lomiri

![Lomiri on the PinePhone][8]

I doubt you will have heard of this, as it only recently had its name changed. Formerly known as Unity 8, it is the default desktop environment of the Ubuntu Touch operating system. It is also available on Manjaro ARM.

Built using Qt Quick, it is probably the most mature desktop environment for the PinePhone. It makes great use of gestures for core system functions, and has a huge range of apps made specifically for it.

However, it also suffers from being only usable on Ubuntu Touch, as none of the apps have been ported to Manjaro. As a result, users of it are subject to Ubuntu Touch’s “locked-down” style, similar to Android and iOS.

While this might be a good thing for typical users, PinePhone owners are generally tinkerers who like control over their device, which is made much harder with Ubuntu Touch.

### Operating Systems

As with any Linux-focused device, there are a huge number of distros and operating systems available. At the time of writing, the Pine64 wiki lists 21 individual operating systems, all in various levels of completeness.

However, amongst these various operating systems, there are 4 that I have had a great experience with on the PinePhone:

  * Manjaro ARM
  * Mobian
  * SailfishOS
  * Ubuntu Touch



While I’m not going to go into detail about each of them, they’re all great choices and perfectly functional for most tasks. With the exception of SailfishOS, they are all also open-source, while SailfishOS is mostly open-source.

### A Note On Android Apps

As you may have guessed by now, app support can be a bit of a problem. Even looking at the almost 400 confirmed working apps on the PinePhone, this pales in comparison to the millions available for Android and iOS.

Fortunately, there are ways around this, the easiest being to emulate Android apps using a compatibility layer. For this, Anbox has been the go-to for a few years now.

#### Anbox

If WINE is a compatibility layer for Windows, then Anbox is the same for Android. After installing it, or opening it as it comes preinstalled with many distributions, it is as simple as running a single command to install an APK file.

From here, the app behave just as any Linux app, albeit with a significant hit to performance.

Recently, a group of people decided they were going to address this, creating a new project called Waydroid.

#### Waydroid

Waydroid is the latest attempt at an Android emulator for the PinePhone, and even at this early stage it looks extremely promising. It manages pretty incredible performance, especially compared to Anbox, thanks to the android apps running directly on the hardware.

As a result, many extremely popular apps work perfectly, such as F-Droid and the Aurora Store.

Additionally, apps installed through Waydroid are integrated really well into Linux, with them being able to be opened and closed just like any other app.

### My Concluding Thoughts On The PinePhone

Over the course of my time with it, I spent time with almost all the different operating systems available for it, as well as every desktop environment. As I said before, its performance was generally quite poor, although Lomiri and Plasma Mobile were smooth enough.

I don’t take photos that often, so the camera got very little use. However, when I did take photos, they were generally good enough, even if they weren’t particularly high quality.

In general, I think the biggest weakness of the PinePhone was actually it’s battery life. This is because even just turning it on to check the time wakes up the modem, causing the battery to drain quickly unless I made an effort not to turn it on.

Fortunately, I always made sure to carry a spare battery with me that I could pop in by removing the back cover. Here, I could also insert an SD card to be used as additional storage or to test a new OS.

As to be expected, the PinePhone is not waterproof, but I did find that using it in the rain appeared to do no damage, although your mileage may vary. When I was inside, I often found myself using it with an external monitor using it’s included dock.

With this setup, I was surprised at how capable the PinePhone was as a laptop. I often found myself editing documents in LibreOffice, and at one point even managed to edit a video using Kdenlive!

Overall, even with its quirks, my year with the PinePhone went quite well, and I never really found my self longing for my Android.

### Getting A PinePhone

If you want to get a PinePhone for yourself, there is a button below that will take you to Pine64’s website. At the time of writing, there are two models available, one with 16 GB of storage and 2 GB of RAM. The other model has 32 GB of storage and 3 GB of RAM.

The model used in this review was the 3 GB version, which costs $199 USD. The 2 GB model costs $149 USD.

[Get A PinePhone][9]

Let’s just hope that the upcoming PinePhone Pro can keep this positive trend up with its more powerful hardware!

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/pinephone-review/

作者：[Jacob Crume][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/jacob/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/linux-phones/
[2]: https://github.com/agx/phosh
[3]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjU0MCIgd2lkdGg9Ijk2MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[4]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQzOSIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[5]: https://lomiri.com/
[6]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjMwMCIgd2lkdGg9IjQ0MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[7]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjI5NSIgd2lkdGg9IjQ0OCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[8]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjM2MiIgd2lkdGg9IjIwNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[9]: https://pine64.com/product-category/pinephone/
