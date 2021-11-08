[#]: subject: "openSUSE Leap vs Tumbleweed: What’s the Difference?"
[#]: via: "https://itsfoss.com/opensuse-leap-vs-tumbleweed/"
[#]: author: "John Paul https://itsfoss.com/author/john/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

openSUSE Leap vs Tumbleweed: What’s the Difference?
======

[openSUSE is a very popular Linux distros][1], especially in the enterprise world. [SUSE][2] has been around in one form or another since 1996. During most of that time, they have only had one version.

Then, in 2015, they changed things up and decided to offer two versions: Leap and Tumbleweed.

If you are new to [openSUSE][3], it is easy to get confused between Tumbleweed and Leap. A reader recently asked us to explain the similarities and difference between the two, that’s just what we’ll do today.

### What is the difference between openSUSE Leap and Tumbleweed?

The most significant difference between the two is release schedule. openSUSE Leap releases a new version every few years on a set schedule, similar to Ubuntu and Fedora. Tumbleweed on the other hand is a rolling release that closely follows the openSUSE development cycle, just like Arch or Void.

![openSUSE Tumbleweed vs Leap][4]

You know the advantages of a [rolling release distribution][5], don’t you? It gives you the latest software versions and you don’t have to upgrade your system for a major release because your system keeps on getting updates regularly.

So, you get newer desktop environment releases, kernel versions and more in openSUSE Tumbleweed. You get a cutting edge, fresh system.

On the other hand, openSUSE Leap sticks to older, LTS versions of desktop environments, Linux kernels to give you a rock solid system. There will be system and security patches of course and a major release after every few years to provide your system newer software and kernel.

#### A quick look back at the history of openSUSE release model change

![openSUSE Leap installer][6]

Going from offering one distro option to two might seem like a big leap, so let me give you a little historical background. The Tumbleweed project was [announced][7] in November of 2010 by [Greg Kroah-Hartman][8]. The goal was to create a “repo that is a rolling updated version of openSUSE containing the latest “stable” versions of packages for people to use”. This project wasn’t a new distro, but an add-on for an existing openSUSE install.

This changed in 2014 when the team behind openSUSE decided to base the next release on SUSE Linux Enterprise Server. They named this new release “Leap 42”. (For those unaware, 42 is a reference to the Hitchhiker’s Guide to the Galaxy, where 42 is said to be the answer to life, the universe and everything.) The current version of openSUSE Leap is 15.2.

With this change, Tumbleweed became an official openSUSE distribution Interestingly, according to the openSUSE End of the Year 2020 [Community Survey][9], more people use Tumbleweed as their distro of choice.

### Should you use Leap or Tumbleweed?

![][10]

The next question is, “If the underlying technology is pretty much the same, who should use either of the two options?” Let me break that down for you.

openSUSE Leap is stable and highly tested. It should be used for older systems and computers that needs to run for a long time without any issue. This is because the software available is not the latest and greatest, but the most stable. Because a new revision is only released every 3 years, any workflow you put in place is relatively safe. (Always remember to back up.) Leap sticks with the same Linux kernel for its entire release life cycle.

![openSUSE Leap desktop][11]

With Leap, you will not receive the latest versions of software. You will also receive hardware support at a slower rate. You will need to update your system at least once a year to continue to get updates. Leap is just like Ubuntu LTS.

openSUSE Tumbleweed on the other hand has the latest version of all software, including kernels, drivers, and desktop environments. Since it is a rolling distro, there is hectically no end of life for the version you are using.

The fact that Tumbleweed is constantly receiving updates can also lead to problems, like workflow or tool breakage, and is generally rough around the edges. If this occurs, Tumbleweed does have tools to roll back to a previous state to avoid these issues. Tumbleweed follows Linux kernel releases very closely.

![openSUSE Tumbleweed desktop][12]

Let me summarize things for you to help you make a decision.

You should use Leap if:

  * Stability is important to you
  * You are new to openSUSE
  * You have older hardware
  * You run a server in production
  * If you are setting up a system for a non-technical friend or family member



You should use Tumbleweed if:

  * You want to try out the latest and greatest software
  * You have newer hardware
  * You are more experienced with Linux
  * You are a software developer
  * You need proprietary hardware drivers, such as for Nvidia or Radeon display adapters, or Broadcom Wi-Fi adapters
  * You want the latest kernel version



I hope this cleared the air for you. If you are already using either Leap or Tumbleweed, please let us know your preference and recommendation in the comment section.

--------------------------------------------------------------------------------

via: https://itsfoss.com/opensuse-leap-vs-tumbleweed/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/why-use-opensuse/
[2]: https://en.wikipedia.org/wiki/SUSE_Linux
[3]: https://www.opensuse.org/
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/opensuse-leap-vs-tumbleweed.webp?resize=800%2C264&ssl=1
[5]: https://itsfoss.com/rolling-release/
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/opensuse-leap-installer.png?resize=800%2C600&ssl=1
[7]: https://lists.opensuse.org/archives/list/project@lists.opensuse.org/message/NNRPP2KJ6TJ3QLLYJC2E62JADHT5GWMY/
[8]: https://en.wikipedia.org/wiki/Greg_Kroah-Hartman
[9]: https://en.opensuse.org/End-of-year-surveys/2020/Data#Uses_Tumbleweed_as_Desktop_on_a_regular_basis
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/opensuse-leap-vs-tumbleweed.png?resize=800%2C450&ssl=1
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/opensuse-leap-deaktop.png?resize=800%2C600&ssl=1
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/opensuse-tumbleweed-deaktop.png?resize=800%2C603&ssl=1
