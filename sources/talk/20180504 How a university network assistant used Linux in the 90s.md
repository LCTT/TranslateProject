How a university network assistant used Linux in the 90s
======
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/moneyrecycle_520x292.png?itok=SAaIziNr)
In the mid-1990s, I was enrolled in computer science classes. My university’s computer science department provided a SunOS server—a multi-user, multitasking Unix system—for its students. We logged into it and wrote source code for the programming languages we were learning, such as C, C++, and ADA. In those days, well before social networks and instant messaging, we also used the system to communicate with each other, sending emails and using utilities such as `write` and `talk`. We were each also allowed to host a personal website. I enjoyed being able to complete my assignments and contact other users.

It was my first experience with this type of operating environment, but I soon learned about another operating system that could do the same thing: Linux.

While I was a student, I also worked part-time at the university. My first position was as a network installer in the Department of Housing and Residence (H&R). This involved connecting student dormitories to the campus network. As this was the university's first dormitory network service, only two buildings and about 75 students had been connected.

In my second year, the network expanded to cover an additional two buildings. H&R decided to let the university’s Office of Information Technology (OIT) manage this growing operation. I transferred to OIT and started the position of Student Assistant to the OIT Network Manager. That is how I discovered Linux. One of my new responsibilities was to manage the firewall systems that provided network and internet access to the dormitories.

Each student was registered with their hardware MAC address. Registered students could connect to the dorm network and receive an IP address and a route to the internet. Unlike the other expensive SunOS and VMS servers used by the university, these firewalls used low-cost computers running the free and open source Linux operating system. By the end of the year, the system had registered nearly 500 students.

![Red hat Linux install disks][1]

The OIT network staff members were using Linux for HTTP, FTP, and other services. They also used Linux on their personal desktops. That's when I realized I had my hands on a computer system that looked and acted just like the expensive SunOS box in the CS department but without the high cost. Linux could run on commodity x86 hardware, such as a Dell Latitude with 8 MB of RAM and a 133Mhz Intel Pentium CPU. That was the selling point for me! I installed Red Hat Linux 5.2 on a box scavenged from the surplus warehouse and gave my friends login accounts.

While I used my new Linux server to host my website and provide accounts to my friends, it also offered graphics capabilities over the CS department server. Using the X Windows system, I could browse the web with Netscape Navigator, play music with [XMMS][2], and try out different window managers. I could also download and compile other open source software and write my own code.

I learned that Linux offered some pretty advanced features, many of which were more convenient than or superior to more mainstream operating systems. For example, many operating systems did not yet offer simple ways to apply updates. In Linux, this was easy, thanks to [autoRPM][3], an update manager written by Kirk Bauer, which sent the root user a daily email with available updates. It had an intuitive interface for reviewing and selecting software updates to install—pretty amazing for the mid-'90s.

Linux may not have been well-known back then, and it was often received with skepticism, but I was convinced it would survive. And survive it did!

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/5/my-linux-story-student

作者：[Alan Formy-Duval][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/alanfdoss
[1]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/images/life-uploads/red_hat_linux_install_disks.png?itok=VSw6Cke9 (Red hat Linux install disks)
[2]:http://www.xmms.org/
[3]:http://www.ccp14.ac.uk/solution/linux/autorpm_redhat7_3.html
