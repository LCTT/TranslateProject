[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Discussing Past, Present and Future of FreeBSD Project)
[#]: via: (https://itsfoss.com/freebsd-interview-deb-goodkin/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Discussing Past, Present and Future of FreeBSD Project
======

[FreeBSD][1] is one of the most popular BSD distributions. It is used on desktop, servers and embedded devices for more than two decades.

We talked to Deb Goodkin, executive director, [FreeBSD Foundation][2] and discussed the past, present and future of FreeBSD project.

![][3]

**It’s FOSS: FreeBSD has been in the scene for more than 25 years. How do you see the journey of FreeBSD? **

Over the years, we’ve seen a lot of innovation happening on and with FreeBSD. When the Foundation came into play 20 years ago, we were able to step in and help accelerate changes in the operating system. Over the years, we’ve increased our marketing support, to provide more advocacy and educational material, and to increase the awareness and use of FreeBSD.

In addition, we’ve increased our staff of software developers to allow us to quickly step in to fix bugs, review patches, implement workarounds to hardware issues, and implement new features and functionality. We have also increased the number of development projects we are funding to improve various areas of FreeBSD.

The history of stability and reliability, along with all the improvements and growth with FreeBSD, is making it a compelling choice for companies, universities, and individuals.

**It’s FOSS: We know that Netflix uses FreeBSD extensively. What other companies or groups rely on FreeBSD? How do they contribute to BSD/FreeBSD (if they do at all)?**

Sony’s Playstation 4 uses a modified version of FreeBSD as their operating system, Apple with their MacOS and iOS, NetApp in their ONTAP product, Juniper Networks  in [JunOS][4], Trivago in their backend infrastructure, University of Cambridge in security research including the Capability Hardware Enhanced RISC Instruction (CHERI) project, University of Notre Dame in their Engineering Department, Groupon in their datacenter, LA Times in their data center, as well as, other notable companies like Panasonic, and Nintendo.

I listed a variety of organizations to highlight the different FreeBSD use cases. Companies like [Netflix support FreeBSD][5] by supporting the Project financially, as well as, by upstreaming their code. Some of the companies, like Sony, take advantage of the BSD license and don’t give back at all. 

![Deb Goodkin And Friend Promoting FreeBSD At Oscon][6]

**It’s FOSS: Linux is ruling the servers and cloud computing. It seems that BSD is lagging in that field?**

I wouldn’t characterize it as lagging, per se. Linux distributions do have a much higher market share than FreeBSD, but our strength falls in those two markets. FreeBSD does extremely well in these markets, because it provides a consistent and reliable foundation, and tends to just work. Known for having long term API stability, the user will integrate once and upgrade on their terms as both FreeBSD and their product evolves. 

**It’s FOSS: Do you see the emergence of Linux as a threat to BSD? **

Sure, [there are so many Linux distributions][7] already, and most of them are supported by for profit companies. In fact, companies like Intel have many Linux developers on staff, so Linux is easily supported on their hardware.

However, thanks to the continuing education efforts and as our market share continues to grow, more developers will be available to support companies’ various FreeBSD use cases. 

**It’s FOSS: Let’s talk about desktop. Recently, the devs of Project Trident announced that they were moving away from FreeBSD as a base. They said that they made this decision because FreeBSD is slow to review updates and support for new hardware. For example, the most recent version of Telegram on FreeBSD is 9 releases behind the version available on Linux. How would you respond to their comments?**

There are quite a few FreeBSD distros for the desktop, with various focuses. The latest, is [FuryBSD][8], which coincidentally was started by iXsystems employees, but is independent of iXsystems, just like Project Trident is. In addition to FuryBSD, you may want to check out [NomadBSD][9] and [MidnightBSD][10].

Regarding supporting new hardware, we’ve stepped up our efforts to get FreeBSD working on more popular newer laptops. For example, the Foundation recently purchased a couple of the latest generation Lenovo X1 Carbon laptops and sponsored work to make sure that peripherals are supported out-of-the-box.

**It’s FOSS: Why should a desktop user consider choosing FreeBSD?**

There are many reasons people should consider using FreeBSD on their desktop! Just to highlight a few, it has rock solid stability; high performance; supports [ZFS][11] to protect your data; a community that is friendly, helpful, and approachable; excellent documentation to easily find answers; over 30,000 open source software packages that are easy to install, allowing you to easily set up your environment without a lot of extras, and that includes many choices of popular GUIs, and it follows the POLA philosophy ([Principle of Least Astonishment][12]) which means, don’t break things that work and upgrades are generally painless (even across major releases). 

**It’s FOSS: Are there any plans to make it easier to install FreeBSD as a desktop system? The current focus seems to be on servers.**

The Foundation is supporting efforts to make sure FreeBSD works on the latest hardware and peripherals that appear in desktop systems, and will continue to support making FreeBSD easy to deploy, monitor, and configure to provide a great toolbox for building a desktop on top of it. That allows others to take as much or as little of FreeBSD to build a desktop version to produce a specific user experience they desire.

Like I mentioned above, there are other FreeBSD distributions that have taken these FreeBSD components and created their own desktop versions.

**It’s FOSS: What are your plans/roadmap for FreeBSD in the coming years?**

The FreeBSD Foundation’s purpose is to support the FreeBSD Project. While we’re an entirely separate entity, we work closely with the Core Team and the community to help move the Project forward. The Foundation identifies key areas we should support in the coming years, based on input from users and what we are seeing in the industry. 

In 2019, we embarked on an even broader spectrum advocacy project to recruit new members throughout the world, while raising awareness about the benefits of learning FreeBSD. We are funding development projects including WiFi improvements, supporting OpenJDK, ZFS RAID-Z expansion, security, toolchain, performance improvements, and other features to keep FreeBSD innovative.

The FreeBSD Foundation will continue to host workshops and expand the amount of training opportunities and materials we provide. Finally, the [BSD Certification program][13] recently launched through Linux Professional Institute with greater availability. 

**It’s FOSS: How can we bring more people to the BSD hold?**

We need more PR for FreeBSD and get more tech journalists like yourself to write about FreeBSD. We also need more trainings and classes that include FreeBSD in universities, trainings/workshops at technical conferences, more FreeBSD contributors giving talks at those conferences, more technical journalists, as well as, users writing about FreeBSD, and finally we need case studies from companies and organizations successfully using FreeBSD. It all takes having more resources! We’re working on all of the above. 

**It’s FOSS: Any message you would like to convey to our readers?**

Readers should consider getting involved with the largest and oldest democratically run open source project!

Whether you want to learn systems programming or how an operating system works, the small size of the operating system makes it a great platform to learn from. The size of the Project makes it easier for anyone to make a notable contribution, and there is a strong mentorship culture to support new contributors.

Being a democratically run project, allows your voice to be heard and work in the areas you are interested in. I hope your readers will go to [freebsd.org][1] and try it out themselves.

--------------------------------------------------------------------------------

via: https://itsfoss.com/freebsd-interview-deb-goodkin/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.freebsd.org/
[2]: https://www.freebsdfoundation.org/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/02/deb-goodkin-interview.png?ssl=1
[4]: https://www.juniper.net/us/en/products-services/nos/junos/
[5]: https://itsfoss.com/netflix-freebsd-cdn/
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/02/FreeBSDFoundation_Deb_Goodkin_and_friend_promoting_FreeBSD_at_OSCON.jpg?ssl=1
[7]: https://itsfoss.com/best-linux-distributions/
[8]: https://itsfoss.com/furybsd/
[9]: https://itsfoss.com/nomadbsd/
[10]: https://itsfoss.com/midnightbsd-1-0-release/
[11]: https://itsfoss.com/what-is-zfs/
[12]: https://en.wikipedia.org/wiki/Principle_of_least_astonishment
[13]: https://www.lpi.org/our-certifications/bsd-overview
