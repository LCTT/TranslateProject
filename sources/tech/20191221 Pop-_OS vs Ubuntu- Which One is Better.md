[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Pop!_OS vs Ubuntu: Which One is Better?)
[#]: via: (https://itsfoss.com/pop-os-vs-ubuntu/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Pop!_OS vs Ubuntu: Which One is Better?
======

Well, you might find it easy to pick one from the list of [best Linux distributions][1]. However, it is often confusing to compare two similar Linux distros, just like Pop!_OS vs Ubuntu.

Interestingly, Pop!_OS is based on [Ubuntu][2]. So, what is the difference between Pop!_OS and Ubuntu? Why should you choose one over other?

In this article, I’m going to compare Pop!_OS and Ubuntu (both of which happen to be my favorites).

**Note:** _You might find some of the points opinionated, this article is just a reference for the comparison. With constant developments and updates to Linux distros, a lot can change over time._

### Comparing Ubuntu and Pop!_OS

![Pop!_OS Vs Ubuntu][3]

Spotting the similarity helps you distinguish other differences. So, let me start noting down some of the obvious similarities.

Like I mentioned, Pop!_OS is a Linux distribution on top of Ubuntu. So, you get all the benefits of using Ubuntu (technically the same thing at its core) when you use Pop!_OS.

They both ship with the [GNOME desktop environment][4] by default and hence they feature a similar user interface (UI).

Without going into all the under-the-hood differences, I will be highlighting some important ones here.

#### User Experience &amp; Theming

![Pop!_OS][5]

A lot of users think that Pop!_OS is just Ubuntu with a different skin.

From my experience, I’ll mention that it is not entirely true.

Yes, they both rock [GNOME desktop environment][4] – however, Pop!_OS just feels more polished.

In addition to the look and feel, [Ubuntu customizes the GNOME experience][6] by adding a dock and a few more tricks. You might find it better if you like a customized GNOME experience.

But, if you prefer a pure GNOME experience, Pop!_OS gives you that by default.

I cannot convince you enough until you try it out for yourself. But, the overall color scheme, icons, and the theme that goes on in Pop!_OS is arguably more pleasing as a superior user experience.

It can be a subjective thing – but it is what I observed. You can also check out the video tour for Ubuntu 19.10 to check it out for yourself:

#### Ease of Installing Third-Party Apps

![Pop Os PPA][7]

Ubuntu puts a lot of emphasis on Snap packages. This increases the number of application it offers.

But there are some major issues with Snap packages. They take too much of disk space and they take a lot of time to start.

This is why I prefer using the APT version of any application.

Why am I telling you this?

Because Pop!_OS has its [own official PPA][8] which is enabled by default. You’ll find some useful applications like Android Studio, TensorFlow in here. No need to download a 1 GB snap package for the Android Studio. Just use [apt-get install][9] and get done with it.

#### Pre-installed Applications

![Ubuntu installation slideshow][10]

It may not be the biggest deal-breaker for some but having a lot of pre-installed apps could affect the experience and performance. Even if it does not affect the performance – some users just prefer fewer pre-installed apps.

Pop!_OS comes bundled with fewer default apps (potentially less bloatware, if I may call it that) when compared to Ubuntu.

Yet again, this is something subjective. If you want to have more apps pre-installed, you may consider Ubuntu over Pop!_OS.

#### Snap Package Support

![][11]

For users comfortable with the snap packages, Ubuntu’s software center is a slightly better solution to Pop!_OS shop because you can have snap packages listed right in your software center.

You cannot filter the snap packages in the software center but it will be easier to install a snap package when you notice one (look at the details for the source of the app as ‘_Snap store_‘ / ‘_Snapcraft_‘) in the Software Center.

Pop!_OS does support snap packages as well – if you’re confused. But, you won’t find them through the Pop!_OS shop, that’s the only difference here.

If you are not sure what a snap package is and what it does, you can check out our article on [installing snap apps on Linux][12].

#### Separate NVIDIA/AMD ISO File

![ISOs][13]

Technically, it isn’t a part of the comparison internally but it is a factor that some users care for.

So, it is worth highlighting that Pop!_OS provides separate ISOs. One for the systems with NVIDIA graphics card and another for systems with/without AMD graphics.

With Ubuntu 19.10, you get NVIDIA drivers on the Ubuntu ISO but there is no such thing for AMD graphics.

#### Reliability &amp; Issues

Unquestionably, both the [distributions are beginner-friendly][14] and quite reliable. You might want to hold on to a Long Term Support (LTS) release if you want better reliability and fewer issues.

When a new version of Ubuntu comes up, Pop!_OS works on it and potentially fixes the issues that users encounter on Ubuntu’s original release before making the new upgrade available. This gives them a slight edge but that’s nothing substantial because those fixes eventually reach Ubuntu.

#### Performance

The performance will highly depend on what you have installed and the hardware configuration you install it on.

Unless you have a super old system, both distributions seem to perform very well.

I’m rocking an i5-7400 processor coupled with 16 Gigs of RAM (with a GTX 1050ti Graphics Card) and I find the experience good enough on both the distros.

Of course, you could manually do a few optimization tweaks to fit your requirements – if either of them does not work out for your hardware configuration.

But, if you want to get your hands on a System76 laptop, Pop!_OS will prove to be [the Apple of Linux space][15] because Pop!_OS has been tailored for their hardware, unlike Ubuntu.

#### Hardware Compatibility

This is definitely something to consider when comparing other Linux distributions. However, in this case, there’s really no significant difference.

You might consider Pop!_OS to constantly work with newer hardware configurations because they primarily tailor the OS for their laptops with a variety of configurations. And, it’s just an observation – not a fact.

**Wrapping Up**

I know it’s not easy to choose one among the two popular Linux distro without trying them out. If it’s a possibility, I’ll recommend you to give them both a try while keeping this comparison for reference.

What’s your choice between these two? Did I miss something in the comparison? Let me know in the comments below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/pop-os-vs-ubuntu/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/best-linux-distributions/
[2]: https://ubuntu.com/
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/12/pop_os_vs_ubuntu.png?ssl=1
[4]: https://www.gnome.org/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/11/pop-os-UI.jpg?ssl=1
[6]: https://itsfoss.com/gnome-tricks-ubuntu/
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/11/pop-os-ppa.jpg?ssl=1
[8]: https://launchpad.net/~system76/+archive/ubuntu/pop/
[9]: https://itsfoss.com/apt-get-linux-guide/
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/08/install-ubuntu-linux-on-intel-nuc-14_tutorial.jpg?resize=800%2C516&ssl=1
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/11/snapcraft.jpg?ssl=1
[12]: https://itsfoss.com/install-snap-linux/
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/11/iso-amd-nvidia-pop-os.jpg?ssl=1
[14]: https://itsfoss.com/best-linux-beginners/
[15]: https://www.phoronix.com/scan.php?page=news_item&px=System76-Integrated-Vision
