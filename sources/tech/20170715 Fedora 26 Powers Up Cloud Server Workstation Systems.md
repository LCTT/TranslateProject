tratranslating-----geekpi

Fedora 26 Powers Up Cloud, Server, Workstation Systems
============================================================


[**What Every CSO Must Know About Open Source | Download the White Paper**][9]
[][10]Flexera Software shares application security strategies for security and engineering teams to manage open source.
**[Download Now!][3]**

The [Fedora Project][4] this week announced the general availability of Fedora 26, the latest version of the fully open source Fedora operating system.

![Fedora 26 Powers Up Cloud, Server, Workstation Systems](http://www.linuxinsider.com/ai/631127/fedora.jpg)

Fedora Linux is the community version of Red Hat Enterprise Linux, or RHEL. Fedora 26 comprises a set of base packages that form the foundation of three distinct editions targeting different users.

Fedora Atomic Host edition is an operating system for running container-based workloads. Fedora Server edition installs the Fedora Server OS on a hard drive. Fedora Workstation edition is a user-friendly operating system for laptops and desktop computers, suitable for a broad range of users -- from hobbyists and students to professionals in corporate environments.

All three editions share a common base and some common strengths. All of the Fedora editions are released twice a year.

The Fedora Project is a testing ground for innovations and new features. Some will be implemented in upcoming releases of RHEL, said Matthew Miller, Fedora Project Leader.

"Fedora is not directly involved in those productization decisions," he told LinuxInsider. "Fedora provides a look at many ideas and technologies, and it is a great place for Red Hat Enterprise Linux customers to get involved and provide feedback."

### Package Power

The Fedora developers updated and improved the packages powering all three editions. They made numerous bug fixes and performance tweaks in Fedora 26 to provide an enhanced user experience across Fedora's use cases.

These packages include the following improvements:

*   Updated compilers and languages, including GNU Compiler Collection 7, Go 1.8, Python 3.6 and Ruby 2.4;

*   DNF 2.0, the latest version of Fedora's next-generation package management system with improved backward compatibility with Yum;

*   A new storage configuration screen for the Anaconda installation program, which enables bottom-up configuration from devices and partitions; and

*   Fedora Media Writer updates that enable users to create bootable SD cards for ARM-based devices, like Raspberry Pi.

The cloud tools are essential to users with a cloud presence, especially programmers, noted Roger L. Kay, president of [Endpoint Technologies Associates][5].

"Kubernetes is essential for programmers interested in writing from the hybrid cloud, which is arguably one of the more important developments in the industry at the moment," he told LinuxInsider. "Cloud -- public, private and hybrid -- is key to the future of enterprise computing."

### Fedora 26 Atomic Host Makeover

Linux containers and container orchestration engines have been expanding in popularity. Fedora 26 Atomic Host offers a minimal-footprint operating system tailored for running container-based workloads across environments, from bare metal to the cloud.

Fedora 26 Atomic Host updates are delivered roughly every two weeks, a schedule that lets users keep pace with upstream innovation.

Fedora 26 Atomic Host is available for Amazon EC2\. Images for OpenStack, Vagrant, and standard installer ISO images are available on the [Fedora Project][6]website.

A minimal Fedora Atomic container image also made its debut with Fedora 26.

### Cloud Hosting

The latest release brings new capabilities and features to Fedora 26 Atomic Host:

*   Containerized Kubernetes as an alternative to built-in Kubernetes binaries, enabling users to run different versions of the container orchestration engine more easily;

*   The latest version of rpm-ostree, which includes support for direct RPM install, a reload command, and a clean-up command;

*   System Containers, which provide a way of installing system infrastructure software, like networking or Kubernetes, on Fedora Atomic Host in a container; and

*   Updated versions of Docker, Atomic and Cockpit for enhanced container building, system support and workload monitoring.

Containerizing Kubernetes is important for Fedora Atomic Host for two big reasons, according to the Fedora Project's Miller.

"First, it lets us remove it from the base image, reducing the size and complexity there," he explained. "Second, providing it in a container makes it easy to swap in different versions without disrupting the base or causing trouble for people who are not ready for a change quite yet."

### Server-Side Services

Fedora 26 Server provides a flexible, multi-role platform for data center operations. It also allows users to customize this edition of the Fedora operating system to fit their unique needs.

New features for Fedora 26 Server include FreeIPA 4.5, which improves running the security information management solution in containers, and SSSD file caching to speed up the resolution of user and group queries.

Fedora 26 Server edition later this month will add a preview of Fedora's modularity technology delivered as "Boltron." As a modular operating system, Boltron enables different versions of different applications to run on the same system, essentially allowing for leading-edge runtimes to be paired with stable databases.

### Workstation Workout

Among the new tools and features for general users is updated GNOME desktop functionality. Devs will get enhanced productivity tools.

Fedora 26 Workstation comes with GNOME 3.24 and numerous updated functionality tweaks. Night Light subtly changes screen color based on time of day to reduce effect on sleep patterns. [LibreOffice][7] 5.3 is the latest update to the open source office productivity suite.

GNOME 3.24 provides mature versions of Builder and Flatpak to give devs better application development tools for easier access across the board to a variety of systems, including Rust and Meson.

### Not Just for Devs

The inclusion of updated cloud tools in a Linux distro targeting enterprise users is significant, according to Scott Sellers, CEO of [Azul Systems][8].

"The cloud is a primary development and production platform for emerging companies, as well as some of the largest enterprises on the planet," he told LinuxInsider.

"Given the cutting-edge nature of the Fedora community, we would expect a strong cloud focus in any Fedora release, and Fedora 26 does not disappoint," Sellers said.

The other feature set of immediate interest to the Fedora developer and user community is the work the Fedora team did in terms of modularity, he noted.

"We will be looking at these experimental features closely," Sellers said.

### Supportive Upgrade Path

Users of Fedora, more than users of other Linux distros, have a vested interest in upgrading to Fedora 26, even if they are not heavy cloud users, according to Sellers.

"One of the primary advantages of this distro is to get an early look at production-grade advanced technologies that [eventually] will be integrated into RHEL," he said. "Early reviews of Fedora 26 suggest that it is very stable, with lots of bug fixes as well as performance enhancements."

Users interested in upgrading from earlier Fedora editions may find an easier approach than wiping existing systems to install Fedora 26, noted Fedora's Miller. Fedora maintains two releases at a time, plus a month of overlap.

"So, if you are on Fedora 24, you should upgrade in the next month," he said. "Happy Fedora 25 users can take their time. This is one of the advantages of Fedora over fast-moving rolling releases."

### Faster Delivery

Users can schedule their own upgrades rather than having to take them when the distro makes them.

That said, users of Fedora 23 or earlier should upgrade soon. The community no longer produces security updates for those releases.

--------------------------------------------------------------------------------

作者简介：

Jack M. Germain has been an ECT News Network reporter since 2003. His main areas of focus are enterprise IT, Linux and open source technologies. He has written numerous reviews of Linux distros and other open source software. Email Jack.


---------------

via: http://www.linuxinsider.com/story/84674.html

作者：[ Jack M. Germain][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:jack.germain@newsroom.ectnews.comm
[1]:http://www.linuxinsider.com/story/84674.html?rss=1#
[2]:http://www.linuxinsider.com/perl/mailit/?id=84674
[3]:http://www.linuxinsider.com/story/84674.html?rss=1
[4]:https://getfedora.org/
[5]:http://www.ndpta.com/
[6]:https://getfedora.org/
[7]:http://www.libreoffice.org/
[8]:https://www.azul.com/
[9]:http://www.linuxinsider.com/story/84674.html?rss=1
[10]:http://www.linuxinsider.com/story/84674.html?rss=1
