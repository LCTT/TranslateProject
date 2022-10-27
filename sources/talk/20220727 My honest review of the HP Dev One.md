[#]: subject: "My honest review of the HP Dev One"
[#]: via: "https://opensource.com/article/22/7/hp-dev-one-review"
[#]: author: "Anderson Silva https://opensource.com/users/ansilva"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

My honest review of the HP Dev One
======
Here are my first impressions of the hardware, running the pre-installed Pop!_OS, and running Fedora on HP's new Linux-based laptop.

![Working from home at a laptop][1]

Image by:

Opensource.com

A few weeks ago, HP joined the bandwagon of major laptop manufacturers releasing a Linux-based laptop, the [HP Dev One][2]. The brand joins others such as Lenovo and Dell, offering a laptop with a pre-installed distribution of Linux in the US market. HP joined forces with smaller Linux-based laptop brand System76 to pre-install Pop!_OS as their distribution of choice on the device. Pop!_OS is a Ubuntu-based distribution, which System76 started (and is currently the primary maintainer) to maximize the features of its own laptops sold on its website.

This article is a quick look at the HP Dev One, including first impressions of the hardware itself and running the pre-installed Pop!_OS and then Fedora on it after a few days. It is not about comparing them, just a few notes on how well they did on the HP Dev One.

### HP Dev One hardware

I haven’t owned an HP laptop in over a decade. I don’t even remember why I distanced myself from the brand, but somehow it just happened. So, when I read about the HP Dev One, several things sparked my interest. Here’s a list of them. Some may be silly or nit-picking, but they still carried some weight in my decision:

* The most obvious reason was it came with Linux and not Windows.
* I have never used Pop!_OS, so the fact that HP chose Pop!_OS made me curious to use it.
* I have never owned an AMD-based laptop. The HP Dev One comes with an AMD RYZEN™ 7 PRO 5850U Processor with eight cores and 16 threads.
* The specs versus price seemed good. The price is $1099 USD, which is very reasonable compared to other brands with similar specs.
* No Windows key on the keyboard. Instead, it says “super,” which I think is cool.
* Upgradeable RAM. The laptop comes with 16 GB of RAM, but unlike so many laptops nowadays, it is not soldered on the board, so you can upgrade it (more on upgrading below).
* The laptop was in stock with a commitment for fast shipping.
* Reviews were favorable.

For all of the reasons above, I ordered it, and two days later, I had the HP Dev One on my doorstep.

![HP Dev One super key][3]

Image by:

(Anderson Silva, CC BY-SA 4.0)

By the time the laptop arrived, the extra 64 GB of RAM I had ordered had also arrived, so the first thing I wanted to do was upgrade the RAM. It turned out that the bottom plate of the HP Dev One has very small, special (yet not proprietary) screws, so I had to run to the hardware store to get the proper screwdriver.

![HP Dev One RAM upgrade][4]

Image by:

(Anderson Silva, CC BY-SA 4.0)

I agree with [other online reviews][5] regarding the quality of the laptop. It does feel sturdy. The trackpad feel is good enough, and I had no issue with it. I found the keyboard not to be as good as some other reviewers claim. To me, the keys are a little heavy, and they feel almost a bit like silicone or rubber. I didn't find it terribly comfortable. In fact, I am typing this article in the HP Dev One, and I almost feel like I need to take a break here and there to let my fingertips rest.

The 1080p screen is bright, but also very reflective. If you are a Thinkpad trackpoint fan, you will definitely enjoy this feature on the HP Dev One. The backlit keyboard is nice, and the built-in camera cover is something more laptops should adopt.

![HP Dev One top view][6]

Image by:

(Anderson Silva, CC BY-SA 4.0)

One question or possible issue I have with the HP Dev One is the fact that their website talks about the one-year customer service and warranty on the machine, but I haven’t been able to find a way to extend that warranty or even upgrade to something more premium like an onsite or next day part replacement in case I were ever to need it.

### Pop!_OS on HP Dev One

As previously mentioned, I’ve never used Pop!_OS. I’ve used Ubuntu and many other distributions, but to me, Pop!_OS was a relatively familiar yet new experience. Here are a few notes:

#### The good

* Coming from a Fedora and mostly vanilla GNOME background, the four-finger gesture in Pop!_OS took a little getting used to, but once I got into it, it made navigating their implementation of GNOME borderline fun.
* The Pop!_OS’s software shop is called Pop!_Shop. It contains a great variety of software without any need to enable special repositories. It is easy to use, and installation is fast.
* The integration between Pop!_OS and the hardware really is well done. Congratulations to both System76 and HP engineers for putting this machine together.
* Pop!_OS has a nice built-in feature for backup and restoring your installation w/o destroying your home directory.
* I installed Steam and a few games, and it worked pretty well.
* I ran a couple of test containers with podman, and it worked very nicely as well.
* I installed a virtual machine, and it ran very smoothly, too.

#### The not so good

* The default wallpaper that comes with the HP Dev One looks a bit fuzzy to me. For such a nice machine, it feels like the wallpaper is running at the wrong resolution. To be fair, there are other wallpapers to choose from in the Settings.
* The out-of-the-box fonts for Pop!_OS could be better. I find them hard to read, and in my opinion, it makes the UI too crammed.
* Adding the USB-C powered 4K monitor worked OK, but my eyes noticed slight flickering in some parts of the screen. Could this be an X11 issue, given that Pop!_OS defaults to X11?

### Fedora on HP Dev One

I played around with Pop!_OS for about two days before deciding to boot into Fedora using a live USB media. I did that first to see what type of hardware detection Fedora could do out of the box. To my surprise, everything worked right away. That’s when I decided to wipe the entire 1 TB SSD and install Fedora on the HP Dev One. As promised, this is not a Fedora vs. Pop!_OS comparison article; it is merely a few notes on both distributions running on this Linux-focused hardware.

In case you haven’t read my bio in this article, and for the sake of transparency, I am a Fedora contributor, so it is fair for me to say that I am biased towards the Fedora distribution, but don’t let that make you think I recommend Fedora over Pop!_OS on the HP Dev One. They are both great distributions, and they both run very nicely on it. Take your pick!

I can tell you that Fedora runs smoothly on the HP Dev One, and although there may be some performance tuning to match some of the benchmark numbers against Pop!_OS, I have been very pleased with its performance. Using the three-finger gestures to move between virtual desktops is a lot more natural to me than the four-finger ones in Pop!_OS, and I’ve been able to run Steam and Proton-based games on Fedora just like Pop!_OS.

The only comparison I will make is that when using the secondary USB-C 4K monitor with Fedora, I did not experience any flickering. Was it because of Wayland?

### Final thoughts

I’ve had the HP Dev One for a little over four days now, and I’ve run Pop!_OS and Fedora on it so far. I even restored Pop!_OS after a full Fedora installation, which was a very easy process. Somehow, Pop!_OS detected it was an HP Dev One and did all the needed installation, including the HP-based wallpapers, without me having to do any extra steps.

As I finished this article, yet again, I went back to Fedora (force of habit), but I wouldn’t have any issue staying on Pop!_OS on the HP Dev One. Who knows, maybe I might even try different distributions in the future.

At the end of the day, the HP Dev One is a solid Linux laptop without a Windows key and no AMD, Intel, or Windows stickers on it. It is fast, feels well built, and is reasonably priced especially given how quickly it ships to you (US only). I would love to see HP provide more documentation on their website about extending the warranty, and I hope they will be able to make this laptop available in other parts of the world.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/7/hp-dev-one-review

作者：[Anderson Silva][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ansilva
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/wfh_work_home_laptop_work.png
[2]: https://hpdevone.com/
[3]: https://opensource.com/sites/default/files/2022-07/superkey.jpg
[4]: https://opensource.com/sites/default/files/2022-07/ram.jpg
[5]: https://www.techrepublic.com/article/system76-hp-perfect-dev-one/
[6]: https://opensource.com/sites/default/files/2022-07/topview.jpg
