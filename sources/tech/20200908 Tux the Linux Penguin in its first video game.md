[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Tux the Linux Penguin in its first video game, better DNS and firewall on Android, Gitops IDE goes open source, and more open source news)
[#]: via: (https://opensource.com/article/20/9/news-sept-8)
[#]: author: (Lauren Maffeo https://opensource.com/users/lmaffeo)

Tux the Linux Penguin in its first video game, better DNS and firewall on Android, Gitops IDE goes open source, and more open source news
======
Catch up on the biggest open source headlines from the past two weeks.
![][1]

In this week’s edition of our open source news roundup, Gitpod open sources its IDE platform, BraveDNS launches an all-in-one platform, and more open source news.

### Engineers debut an open source-powered robot

Matthias Müller and Vladlen Koltun, two engineers at Intel, have shared their new robot to tackle computer vision tasks. [The robot][2], called "OpenBot", is powered by a smartphone, which acts as a camera and computing unit. 

The OpenBot prototype components cost $50. It's intended to be a low-cost alternative to commercially available radio-controlled models, with more computing power than educational models.

To use OpenBot, users can connect their smartphones to an electromechanical body. They can also use Bluetooth to connect their smartphone to a video game controller like an Xbox or PlayStation. 

Müller and Koltun say they want OpenBot to address two key issues in robotics: Scalability and accessibility. Its source code is still pending [on GitHub][3], although models for 3D-printing the case are up.

### Tux the Linux Penguin gets his video game dues

A new update to [a free and open source 3D kart racer][4] features an unlikely hero: Tux, the Linux penguin.

Born in the early aughts as a project called _TuxKart_, Joerg Henrichs renamed it "Super Tux Kart" in 2006. Lux is the latest open source mascot to feature in the project: Blender and GIMP's mascots are represented as well.

Along with adding Tux to the mix, Super Tux Kart Version 1.2 includes lots of updates. iOS users can create racing servers in-game, while all official tracks are now included in the release built on Android. And since the game is open source [on four platforms][5], all players can make their own changes to submit for review.

### BraveDNS offers three services in one for Android users

It's notoriously tough for Android users to find a firewall, adblocker, and DNS-over-HTTPS client in one product. But if BraveDNS lives up to the hype, this free and open source tool offers all three in one. 

Self-described as “an [OpenSnitch][6]-inspired firewall and network monitor + a [pi-hole][7]-inspired DNS over HTTPS client with blocklists”, BraveDNS uses its own ads, trackers, and spyware-blocking DNS endpoint. Users who need features like custom blocklists and ability to store DNS logs can use the tool's DNS resolver service as a paid option.

Along with a robust [list of firewall features][8], BraveDNS offers to backport support for dual-mode DNS and firewall execution to legacy Android versions. You'll need at least Android 8 Oreo to use the latest version of BraveDNS on their website and Google Play, but their developers pledge to make it compatible down to Android Marshmellow in the near future. 

### Gitpod open sources its IDE platform

With projects like Theia, Xtext, and Open VSX under its belt, Gitpod has been a strong open source presence for 10 years. Now, Gitpod -- an IDE platform for GitHub projects -- is [officially open source][9] as well.

The move marks a big change for Gitpod, which was previously closed to community development from the start. Founders Sven Efftinge and Johannes Landgraf shared that Gitpod now meets GitHub's open source criteria under AGPL license. This allows Gitpod developers to co-collaborate on Kubernetes applications.

Along with Gitpod's open source status, they've expanded into software as well. Self-Hosted, a private cloud platform, is now available for free to unlimited users. Designed for DevOps teams to work on enterprise projects, Self-Hosted's features include collaboration tools, analytics, dashboards, and more.

In other news:

  * [5 open source software applications for virtualization][10]
  * [Building a heavy duty open source ventilator][11]
  * [China looks at Gitee as an open source alternative to Microsoft's GitHub][12]
  * [The future of American industry depends on open source tech][13]



Thanks, as always, to Opensource.com staff members and [Correspondents][14] for their help this week.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/news-sept-8

作者：[Lauren Maffeo][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/lmaffeo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/weekly_news_roundup_tv.png?itok=tibLvjBd
[2]: https://www.inceptivemind.com/openbot-open-source-low-cost-smartphone-powered-robot/15023/
[3]: https://github.com/intel-isl/OpenBot
[4]: https://hothardware.com/news/super-tux-kart-update
[5]: https://supertuxkart.net/Download
[6]: https://github.com/evilsocket/opensnitch
[7]: https://github.com/pi-hole/pi-hole
[8]: https://www.xda-developers.com/bravedns-open-source-dns-over-https-client-firewall-adblocker-android/
[9]: https://aithority.com/it-and-devops/gitpod-goes-open-source-with-its-ide-platform-launches-self-hosted-cloud-package/
[10]: https://searchservervirtualization.techtarget.com/tip/5-open-source-software-applications-for-virtualization
[11]: https://hackaday.com/2020/08/28/building-a-heavy-duty-open-source-ventilator/
[12]: https://www.scmp.com/abacus/tech/article/3099107/china-pins-its-hopes-gitee-open-source-alternative-microsofts-github
[13]: https://www.wired.com/story/opinon-the-future-of-american-industry-depends-on-open-source-tech/
[14]: https://opensource.com/correspondent-program
