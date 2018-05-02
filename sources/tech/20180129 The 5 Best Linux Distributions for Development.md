The 5 Best Linux Distributions for Development
============================================================

![Linux distros for devs](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/king-penguins_1920.jpg?itok=qmy8htw6 "Linux distros for devs")
Jack Wallen looks at some of the best LInux distributions for development efforts.[Creative Commons Zero][6]

When considering Linux, there are so many variables to take into account. What package manager do you wish to use? Do you prefer a modern or old-standard desktop interface? Is ease of use your priority? How flexible do you want your distribution? What task will the distribution serve?

It is that last question which should often be considered first. Is the distribution going to work as a desktop or a server? Will you be doing network or system audits? Or will you be developing? If you’ve spent much time considering Linux, you know that for every task there are several well-suited distributions. This certainly holds true for developers. Even though Linux, by design, is an ideal platform for developers, there are certain distributions that rise above the rest, to serve as great operating systems to serve developers.

I want to share what I consider to be some of the best distributions for your development efforts. Although each of these five distributions can be used for general purpose development (with maybe one exception), they each serve a specific purpose. You may or may not be surprised by the selections.

With that said, let’s get to the choices.

### Debian

The [Debian][14] distribution winds up on the top of many a Linux list. With good reason. Debian is that distribution from which so many are based. It is this reason why many developers choose Debian. When you develop a piece of software on Debian, chances are very good that package will also work on [Ubuntu][15], [Linux Mint][16], [Elementary OS][17], and a vast collection of other distributions.

Beyond that obvious answer, Debian also has a very large amount of applications available, by way of the default repositories (Figure 1).

![Debian apps](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/devel_1.jpg?itok=3mpkS3Kp "Debian apps")
Figure 1: Available applications from the standard Debian repositories.[Used with permission][1]

To make matters even programmer-friendly, those applications (and their dependencies) are simple to install. Take, for instance, the build-essential package (which can be installed on any distribution derived from Debian). This package includes the likes of dkpg-dev, g++, gcc, hurd-dev, libc-dev, and make—all tools necessary for the development process. The build-essential package can be installed with the command sudo apt install build-essential.

There are hundreds of other developer-specific applications available from the standard repositories, tools such as:

*   Autoconf—configure script builder

*   Autoproject—creates a source package for a new program

*   Bison—general purpose parser generator

*   Bluefish—powerful GUI editor, targeted towards programmers

*   Geany—lightweight IDE

*   Kate—powerful text editor

*   Eclipse—helps builders independently develop tools that integrate with other people’s tools

The list goes on and on.

Debian is also as rock-solid a distribution as you’ll find, so there’s very little concern you’ll lose precious work, by way of the desktop crashing. As a bonus, all programs included with Debian have met the [Debian Free Software Guidelines][18], which adheres to the following “social contract”:

*   Debian will remain 100% free.

*   We will give back to the free software community.

*   We will not hide problems.

*   Our priorities are our users and free software

*   Works that do not meet our free software standards are included in a non-free archive.

Also, if you’re new to developing on Linux, Debian has a handy [Programming section in their user manual][19].

### openSUSE Tumbleweed

If you’re looking to develop with a cutting-edge, rolling release distribution, [openSUSE][20] offers one of the best in [Tumbleweed][21]. Not only will you be developing with the most up to date software available, you’ll be doing so with the help of openSUSE’s amazing administrator tools … of which includes YaST. If you’re not familiar with YaST (Yet another Setup Tool), it’s an incredibly powerful piece of software that allows you to manage the whole of the platform, from one convenient location. From within YaST, you can also install using RPM Groups. Open YaST, click on RPM Groups (software grouped together by purpose), and scroll down to the Development section to see the large amount of groups available for installation (Figure 2).


![openSUSE](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/devel_2.jpg?itok=EeCjn1cx "openSUSE")
Figure 2: Installing package groups in openSUSE Tumbleweed.[Creative Commons Zero][2]

openSUSE also allows you to quickly install all the necessary devtools with the simple click of a weblink. Head over to the [rpmdevtools install site][22] and click the link for Tumbleweed. This will automatically add the necessary repository and install rpmdevtools.

By developing with a rolling release distribution, you know you’re working with the most recent releases of installed software.

### CentOS

Let’s face it, [Red Hat Enterprise Linux][23] (RHEL) is the de facto standard for enterprise businesses. If you’re looking to develop for that particular platform, and you can’t afford a RHEL license, you cannot go wrong with [CentOS][24]—which is, effectively, a community version of RHEL. You will find many of the packages found on CentOS to be the same as in RHEL—so once you’re familiar with developing on one, you’ll be fine on the other.

If you’re serious about developing on an enterprise-grade platform, you cannot go wrong starting with CentOS. And because CentOS is a server-specific distribution, you can more easily develop for a web-centric platform. Instead of developing your work and then migrating it to a server (hosted on a different machine), you can easily have CentOS setup to serve as an ideal host for both developing and testing.

Looking for software to meet your development needs? You only need open up the CentOS Application Installer, where you’ll find a Developer section that includes a dedicated sub-section for Integrated Development Environments (IDEs - Figure 3).

![CentOS](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/devel_3.jpg?itok=0oe4zj9j "CentOS")
Figure 3: Installing a powerful IDE is simple in CentOS.[Used with permission][3]

CentOS also includes Security Enhanced Linux (SELinux), which makes it easier for you to test your software’s ability to integrate with the same security platform found in RHEL. SELinux can often cause headaches for poorly designed software, so having it at the ready can be a real boon for ensuring your applications work on the likes of RHEL. If you’re not sure where to start with developing on CentOS 7, you can read through the [RHEL 7 Developer Guide][25].

### Raspbian

Let’s face it, embedded systems are all the rage. One easy means of working with such systems is via the Raspberry Pi—a tiny footprint computer that has become incredibly powerful and flexible. In fact, the Raspberry Pi has become the hardware used by DIYers all over the planet. Powering those devices is the [Raspbian][26] operating system. Raspbian includes tools like [BlueJ][27], [Geany][28], [Greenfoot][29], [Sense HAT Emulator][30], [Sonic Pi][31], and [Thonny Python IDE][32], [Python][33], and [Scratch][34], so you won’t want for the necessary development software. Raspbian also includes a user-friendly desktop UI (Figure 4), to make things even easier.

![Raspbian](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/devel_4.jpg?itok=VLoYak6L "Raspbian")
Figure 4: The Raspbian main menu, showing pre-installed developer software.[Used with permission][4]

For anyone looking to develop for the Raspberry Pi platform, Raspbian is a must have. If you’d like to give Raspbian a go, without the Raspberry Pi hardware, you can always install it as a VirtualBox virtual machine, by way of the ISO image found [here][35].

### Pop!_OS

Don’t let the name full you, [System76][36]’s [Pop!_OS][37] entry into the world of operating systems is serious. And although what System76 has done to this Ubuntu derivative may not be readily obvious, it is something special.

The goal of System76 is to create an operating system specific to the developer, maker, and computer science professional. With a newly-designed GNOME theme, Pop!_OS is beautiful (Figure 5) and as highly functional as you would expect from both the hardware maker and desktop designers.

### [devel_5.jpg][11]

![Pop!_OS](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/devel_5.jpg?itok=n4K7k7Gd "Pop!_OS")
Figure 5: The Pop!_OS Desktop.[Used with permission][5]

But what makes Pop!_OS special is the fact that it is being developed by a company dedicated to Linux hardware. This means, when you purchase a System76 laptop, desktop, or server, you know the operating system will work seamlessly with the hardware—on a level no other company can offer. I would predict that, with Pop!_OS, System76 will become the Apple of Linux.

### Time for work

In their own way, each of these distributions. You have a stable desktop (Debian), a cutting-edge desktop (openSUSE Tumbleweed), a server (CentOS), an embedded platform (Raspbian), and a distribution to seamless meld with hardware (Pop!_OS). With the exception of Raspbian, any one of these distributions would serve as an outstanding development platform. Get one installed and start working on your next project with confidence.

 _Learn more about Linux through the free ["Introduction to Linux" ][13]course from The Linux Foundation and edX._

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/intro-to-linux/2018/1/5-best-linux-distributions-development

作者：[JACK WALLEN ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/jlwallen
[1]:https://www.linux.com/licenses/category/used-permission
[2]:https://www.linux.com/licenses/category/creative-commons-zero
[3]:https://www.linux.com/licenses/category/used-permission
[4]:https://www.linux.com/licenses/category/used-permission
[5]:https://www.linux.com/licenses/category/used-permission
[6]:https://www.linux.com/licenses/category/creative-commons-zero
[7]:https://www.linux.com/files/images/devel1jpg
[8]:https://www.linux.com/files/images/devel2jpg
[9]:https://www.linux.com/files/images/devel3jpg
[10]:https://www.linux.com/files/images/devel4jpg
[11]:https://www.linux.com/files/images/devel5jpg
[12]:https://www.linux.com/files/images/king-penguins1920jpg
[13]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
[14]:https://www.debian.org/
[15]:https://www.ubuntu.com/
[16]:https://linuxmint.com/
[17]:https://elementary.io/
[18]:https://www.debian.org/social_contract
[19]:https://www.debian.org/doc/manuals/debian-reference/ch12.en.html
[20]:https://www.opensuse.org/
[21]:https://en.opensuse.org/Portal:Tumbleweed
[22]:https://software.opensuse.org/download.html?project=devel%3Atools&package=rpmdevtools
[23]:https://www.redhat.com/en/technologies/linux-platforms/enterprise-linux
[24]:https://www.centos.org/
[25]:https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/pdf/developer_guide/Red_Hat_Enterprise_Linux-7-Developer_Guide-en-US.pdf
[26]:https://www.raspberrypi.org/downloads/raspbian/
[27]:https://www.bluej.org/
[28]:https://www.geany.org/
[29]:https://www.greenfoot.org/
[30]:https://www.raspberrypi.org/blog/sense-hat-emulator/
[31]:http://sonic-pi.net/
[32]:http://thonny.org/
[33]:https://www.python.org/
[34]:https://scratch.mit.edu/
[35]:http://rpf.io/x86iso
[36]:https://system76.com/
[37]:https://system76.com/pop
