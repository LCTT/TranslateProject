[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Review of Debian System Administrator’s Handbook)
[#]: via: (https://itsfoss.com/debian-administrators-handbook/)
[#]: author: (Shirish https://itsfoss.com/author/shirish/)

Review of Debian System Administrator’s Handbook
======

_**Debian System Administrator’s Handbook is a free-to-download book that covers all the essential part of Debian that a sysadmin might need.**_

This has been on my to-do review list for quite some time. The book was started by two French Debian Developers Raphael Hertzog and Roland Mas to increase awareness about the Debian project in France. The book was a huge hit among francophone Linux users. The English translation followed soon after that.

### Debian Administrator’s Handbook

![][1]

[Debian Administrator’s Handbook][2] is targeted from a newbie who may be looking to understand what the [Debian project][3] is all about to somebody who might be running a Debian in a production server.

The latest version of the book covers Debian 8 while the current stable version is Debian 9. But it doesn’t mean that book is outdated and is of no use to Debian 9 users. Most of the part of the book is valid for all Debian and Linux users.

Let me give you a quick summary of what this book covers.

#### Section 1 – Debian Project

The first section sets the tone of the book where it gives a solid foundation to somebody who might be looking into Debian as to what it actually means. Some of it will probably be updated to match the current scenario.

#### Section 2 – Using fictional case studies for different needs

The second section deals with the various case-scenarios as to where Debian could be used. The idea being how Debian can be used in various hierarchical or functional scenarios. One aspect which I felt that should have stressed upon is the culture mindshift and openness which at least should have been mentioned.

#### Section 3 & 4- Setups and Installation

The third section goes into looking in existing setups. I do think it should have stressed more into documenting existing setups, migrating partial services and users before making a full-fledged transition. While all of the above seem minor points, I have seen many of them come and bit me on the back during a transition.

Section Four covers the various ways you could install, how the installation process flows and things to keep in mind before installing a Debian System. Unfortunately, UEFI was not present at that point so it was not talked about.

#### Section 5 & 6 – Packaging System and Updates

Section Five starts on how a binary package is structured and then goes on to tell how a source package is structured as well. It does mention several gotchas or tricky ways in which a sys-admin can be caught.

Section Six is perhaps where most of the sysadmins spend most of the time apart from troubleshooting which is another chapter altogether. While it starts from many of the most often used sysadmin commands, the interesting point which I liked was on page 156 which is on better solver algorithims.

#### Section 7 – Solving Problems and finding Relevant Solutions

Section Seven, on the other hand, speaks of the various problem scenarios and various ways when you find yourself with a problem. In Debian and most GNU/Linux distributions, the keyword is ‘patience’. If you are patient then many problems in Debian are resolved or can be resolved after a good night’s sleep.

#### Section 8 – Basic Configuration, Network, Accounts, Printing

Section Eight introduces you to the basics of networking and having single or multiple user accounts on the workstation. It goes a bit into user and group configuration and practices then gives a brief introduction to the bash shell and gets a brief overview of the [CUPS][4] printing daemon. There is much to explore here.

#### Section 9 – Unix Service

Section 9 starts with the introduction to specific Unix services. While it starts with the much controversial, hated and reviled in many quarters [systemd][5], they also shared System V which is still used by many a sysadmin.

#### Section 10, 11 & 12 – Networking and Adminstration

Section 10 makes you dive into network infrastructure where it goes into the basics of Virtual Private Networks (OpenVPN), OpenSSH, the PKI credentials and some basics of information security. It also gets into basics of DNS, DHCP and IPv6 and ends with some tools which could help in troubleshooting network issues.

Section 11 starts with basic configuration and workflow of mail server and postfix. It tries to a bit into depth as there is much to play with. It then goes into the popular web server Apache, FTP File server, NFS and CIFS with Windows shares via Samba. Again, much to explore therein.

Section 12 starts with Advanced Administration topics such as RAID, LVM, when one is better than the other. Then gets into Virtualization, Xen and give brief about lxc. Again, there is much more to explore than shared herein.

![Author Raphael Hertzog at a Debian booth circa 2013 | Image Credit][6]

#### Section 13 – Workstation

Section 13 shares about having schemas for xserver, display managers, window managers, menu management, the different desktops i.e. GNOME, KDE, XFCE and others. It does mention about lxde in the others. The one omission I felt which probably will be updated in a new release would be [Wayland][7] and [Xwayland][8]. Again much to explore in this section as well. This is rectified in the conclusion

#### Section 14 – Security

Section 14 is somewhat comprehensive on what constitues security and bits of threats analysis but stops short as it shares in the introduction of the chapter itself that it’s a vast topic.

#### Section 15 – Creating a Debian package

Section 15 explains the tools and processes to ‘ _debianize_ ‘ an application so it becomes part of the Debian archive and available for distribution on the 10 odd hardware architectures that Debian supports.

### Pros and Cons

Where Raphael and Roland have excelled is at breaking the visual monotony of the book by using a different style and structure wherever possible from the rest of the reading material. This compels the reader to refresh her eyes while at the same time focus on the important matter at the hand. The different visual style also indicates that this is somewhat more important from the author’s point of view.

One of the drawbacks, if I may call it that, is the absolute absence of humor in the book.

### Final Thoughts

I have been [using Debian][9] for a decade so lots of it was a refresher for myself. Some of it is outdated if I look it from a buster perspective but is invaluable as a historical artifact.

If you are looking to familiarize yourself with Debian or looking to run Debian 8 or 9 as a production server for your business wouldn’t be able to recommend a better book than this.

### Download Debian Administrator’s Handbook

The Debian Handbook has been available in every Debian release after 2012. The [liberation][10] of the Debian Handbook was done in 2012 using [ulule][11].

You can download an electronic version of the Debian Administrator’s Handbook in PDF, ePub or Mobi format from the link below:

[Download Debian Administrator’s Handbook][12]

You can also buy the book paperback edition of the book if you want to support the amazing work of the authors.

[Buy the paperback edition][13]

Lastly, if you want to motivate Raphael, you can reward by donating to his PayPal [account][14].

--------------------------------------------------------------------------------

via: https://itsfoss.com/debian-administrators-handbook/

作者：[Shirish][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/shirish/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/02/Debian-Administrators-Handbook-review.png?resize=800%2C450&ssl=1
[2]: https://debian-handbook.info/
[3]: https://www.debian.org/
[4]: https://www.cups.org
[5]: https://itsfoss.com/systemd-features/
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/02/stand-debian-Raphael.jpg?resize=800%2C600&ssl=1
[7]: https://wayland.freedesktop.org/
[8]: https://en.wikipedia.org/wiki/X.Org_Server#XWayland
[9]: https://itsfoss.com/reasons-why-i-love-debian/
[10]: https://debian-handbook.info/liberation/
[11]: https://www.ulule.com/debian-handbook/
[12]: https://debian-handbook.info/get/now/
[13]: https://debian-handbook.info/get/
[14]: https://raphaelhertzog.com/
