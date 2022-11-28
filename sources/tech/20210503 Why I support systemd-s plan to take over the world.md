[#]: subject: (Why I support systemd's plan to take over the world)
[#]: via: (https://opensource.com/article/21/5/systemd)
[#]: author: (David Both https://opensource.com/users/dboth)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Why I support systemd's plan to take over the world
======
There is no nefarious plan, just one to bring service management into
the 21st century.
![A rack of servers, blue background][1]

Over the years, I have read many articles and posts about how systemd is trying to replace everything and take over everything in Linux. I agree; it is taking over pretty much everything.

But not really "everything-everything." Just "everything" in that middle ground of services that lies between the kernel and things like the GNU core utilities, graphical user interface desktops, and user applications.

Examining Linux's structure is a way to explore this. The following figure shows the three basic software layers found in the operating system. The bottom is the Linux kernel; the middle layer consists of services that may perform startup tasks, such as launching various other services like Network Time Protocol (NTP), Dynamic Host Configuration Protocol (DHCP), Domain Name System (DNS), secure shell (SSH), device management, login services, gettys, Network Manager, journal and log management, logical volume management, printing, kernel module management, local and remote filesystems, sound and video, display management, swap space, system statistics collection, and much more. There are also tens of thousands of new and powerful applications at the top layer.

![systemd services][2]

systemd and the services it manages with respect to the kernel and application programs, including tools used by the sysadmin. (David Both, [CC BY-SA 4.0][3])

This diagram (as well as sysadmins' collective experience over the last several years) makes it clear that systemd is indeed intended to completely replace the old SystemV init system. But I also know (and explained in the previous articles in this systemd series) that it significantly extends the capabilities of the init system.

It is also important to recognize that, although Linus Torvalds rewrote the Unix kernel as an exercise, he did nothing to change the middle layer of system services. He simply recompiled SystemV init to work with his completely new kernel. SystemV is much older than Linux and has needed a complete change to something totally new for decades.

So the kernel is new and is refreshed frequently through the leadership of Torvalds and the work of thousands of programmers around the planet. All of the programs on the top layer of the image above also contribute.

But until recently, there have been no significant enhancements to the init system and management of system services.

In authoring systemd, [Lennart Poettering][4] has done for system services what Linus Torvalds did for the kernel. Like Torvalds and the Linux kernel, Poettering has become the leader and arbiter of what happens inside this middle system services layer. And I like what I see.

### More data for the admin

The new capabilities of systemd include far more status information about services, whether they're running or not. I like having more information about the services I am trying to monitor. For example, look at the DHCPD service. Were I to use the SystemV command, `service dhcpd status`, I would get a simple message that the service is running or stopped. Using the systemd command, `systemctl status dhcpd`, I get much more useful information.

This data is from the server on my personal network:


```
[root@yorktown ~]# systemctl status dhcpd
● dhcpd.service - DHCPv4 Server Daemon
     Loaded: loaded (/usr/lib/systemd/system/dhcpd.service; enabled; vendor preset: disabled)
     Active: active (running) since Fri 2021-04-09 21:43:41 EDT; 4 days ago
       Docs: man:dhcpd(8)
             man:dhcpd.conf(5)
   Main PID: 1385 (dhcpd)
     Status: "Dispatching packets..."
      Tasks: 1 (limit: 9382)
     Memory: 3.6M
        CPU: 240ms
     CGroup: /system.slice/dhcpd.service
             └─1385 /usr/sbin/dhcpd -f -cf /etc/dhcp/dhcpd.conf -user dhcpd -group dhcpd --no-pid

Apr 14 20:51:01 yorktown.both.org dhcpd[1385]: DHCPREQUEST for 192.168.0.7 from e0:d5:5e:a2🇩🇪a4 via eno1
Apr 14 20:51:01 yorktown.both.org dhcpd[1385]: DHCPACK on 192.168.0.7 to e0:d5:5e:a2🇩🇪a4 via eno1
Apr 14 20:51:14 yorktown.both.org dhcpd[1385]: DHCPREQUEST for 192.168.0.8 from e8:40:f2:3d:0e:a8 via eno1
Apr 14 20:51:14 yorktown.both.org dhcpd[1385]: DHCPACK on 192.168.0.8 to e8:40:f2:3d:0e:a8 via eno1
Apr 14 20:51:14 yorktown.both.org dhcpd[1385]: DHCPREQUEST for 192.168.0.201 from 80:fa:5b:63:37:88 via eno1
Apr 14 20:51:14 yorktown.both.org dhcpd[1385]: DHCPACK on 192.168.0.201 to 80:fa:5b:63:37:88 via eno1
Apr 14 20:51:24 yorktown.both.org dhcpd[1385]: DHCPREQUEST for 192.168.0.6 from e0:69:95:45:c4:cd via eno1
Apr 14 20:51:24 yorktown.both.org dhcpd[1385]: DHCPACK on 192.168.0.6 to e0:69:95:45:c4:cd via eno1
Apr 14 20:52:41 yorktown.both.org dhcpd[1385]: DHCPREQUEST for 192.168.0.5 from 00:1e:4f:df:3a:d7 via eno1
Apr 14 20:52:41 yorktown.both.org dhcpd[1385]: DHCPACK on 192.168.0.5 to 00:1e:4f:df:3a:d7 via eno1
[root@yorktown ~]#
```

Having all this information available in a single command is empowering and simplifies problem determination for me. I get more information right at the start. I not only see that the service is up and running but also some of the most recent log entries.

Here is another example that uses a non-operating-system tool. [BOINC][5], the Berkeley Open Infrastructure Network Computing Client, is used to create ad hoc supercomputers out of millions of home computers around the world that are signed up to participate in the computational stages of many types of scientific studies. I am signed up with the [IBM World Community Grid][6] and participate in studies about COVID-19, mapping cancer markers, rainfall in Africa, and more.

The information from this command gives me a more complete picture of how this service is faring:


```
[root@yorktown ~]# systemctl status boinc-client.service
● boinc-client.service - Berkeley Open Infrastructure Network Computing Client
     Loaded: loaded (/usr/lib/systemd/system/boinc-client.service; enabled; vendor preset: disabled)
     Active: active (running) since Fri 2021-04-09 21:43:41 EDT; 4 days ago
       Docs: man:boinc(1)
   Main PID: 1389 (boinc)
      Tasks: 18 (limit: 9382)
     Memory: 1.1G
        CPU: 1month 1w 2d 3h 42min 47.398s
     CGroup: /system.slice/boinc-client.service
             ├─  1389 /usr/bin/boinc
             ├─712591 ../../projects/www.worldcommunitygrid.org/wcgrid_mcm1_map_7.43_x86_64-pc-linux-gnu -SettingsFile MCM1_0174482_7101.txt -DatabaseFile dataset&gt;
             ├─712614 ../../projects/www.worldcommunitygrid.org/wcgrid_mcm1_map_7.43_x86_64-pc-linux-gnu -SettingsFile MCM1_0174448_7280.txt -DatabaseFile dataset&gt;
             ├─713275 ../../projects/www.worldcommunitygrid.org/wcgrid_opn1_autodock_7.17_x86_64-pc-linux-gnu -jobs OPN1_0040707_05092.job -input OPN1_0040707_050&gt;
             ├─713447 ../../projects/www.worldcommunitygrid.org/wcgrid_mcm1_map_7.43_x86_64-pc-linux-gnu -SettingsFile MCM1_0174448_2270.txt -DatabaseFile dataset&gt;
             ├─713517 ../../projects/www.worldcommunitygrid.org/wcgrid_opn1_autodock_7.17_x86_64-pc-linux-gnu -jobs OPN1_0040871_00826.job -input OPN1_0040871_008&gt;
             ├─713657 ../../projects/www.worldcommunitygrid.org/wcgrid_mcm1_map_7.43_x86_64-pc-linux-gnu -SettingsFile MCM1_0174525_7317.txt -DatabaseFile dataset&gt;
             ├─713672 ../../projects/www.worldcommunitygrid.org/wcgrid_mcm1_map_7.43_x86_64-pc-linux-gnu -SettingsFile MCM1_0174529_1537.txt -DatabaseFile dataset&gt;
             └─714586 ../../projects/www.worldcommunitygrid.org/wcgrid_opn1_autodock_7.17_x86_64-pc-linux-gnu -jobs OPN1_0040864_01640.job -input OPN1_0040864_016&gt;

Apr 14 19:57:16 yorktown.both.org boinc[1389]: 14-Apr-2021 19:57:16 [World Community Grid] Finished upload of OPN1_0040707_05063_0_r181439640_0
Apr 14 20:57:36 yorktown.both.org boinc[1389]: 14-Apr-2021 20:57:36 [World Community Grid] Sending scheduler request: To report completed tasks.
Apr 14 20:57:36 yorktown.both.org boinc[1389]: 14-Apr-2021 20:57:36 [World Community Grid] Reporting 1 completed tasks
Apr 14 20:57:36 yorktown.both.org boinc[1389]: 14-Apr-2021 20:57:36 [World Community Grid] Not requesting tasks: don't need (job cache full)
Apr 14 20:57:38 yorktown.both.org boinc[1389]: 14-Apr-2021 20:57:38 [World Community Grid] Scheduler request completed
Apr 14 20:57:38 yorktown.both.org boinc[1389]: 14-Apr-2021 20:57:38 [World Community Grid] Project requested delay of 121 seconds
Apr 14 21:38:03 yorktown.both.org boinc[1389]: 14-Apr-2021 21:38:03 [World Community Grid] Computation for task MCM1_0174482_7657_1 finished
Apr 14 21:38:03 yorktown.both.org boinc[1389]: 14-Apr-2021 21:38:03 [World Community Grid] Starting task OPN1_0040864_01640_0
Apr 14 21:38:05 yorktown.both.org boinc[1389]: 14-Apr-2021 21:38:05 [World Community Grid] Started upload of MCM1_0174482_7657_1_r1768267288_0
Apr 14 21:38:09 yorktown.both.org boinc[1389]: 14-Apr-2021 21:38:09 [World Community Grid] Finished upload of MCM1_0174482_7657_1_r1768267288_0
[root@yorktown ~]#
```

The key is that the BOINC client runs as a daemon and should be managed by the init system. All software that runs as a daemon should be managed by systemd. In fact, even software that still provides SystemV start scripts is managed by systemd.

### systemd standardizes configuration

One of the problems I have had over the years is that, even though "Linux is Linux," not all distributions store their configuration files in the same places or use the same names or even formats. With the huge numbers of Linux hosts in the world, that lack of standardization is a problem. I have also encountered horrible config files and SystemV startup files created by developers trying to jump on the Linux bandwagon and who have no idea how to create software for Linux—and especially the services that must be included in the Linux startup sequence.

The systemd unit files standardize configuration and enforce a startup methodology and organization that provides a level of safety from poorly written SystemV start scripts. They also provide tools that the sysadmin can use to monitor and manage services.

Lennart Poettering wrote a short blog post describing [standard names and locations][7] for common critical systemd configuration files. This standardization makes the sysadmin's job easier. It also makes it easier to automate administrative tasks in environments with multiple Linux distributions. Developers also benefit from this standardization.

### Sometimes, the pain

Any undertaking as massive as replacing and extending an entire init system will cause some level of pain during the transition. I don't mind learning the new commands and how to create configuration files of various types, such as targets, timers, and so on. It does take some work, but I think the results are well worth the effort.

New configuration files and changes in the subsystems that own and manage them can also seem daunting at first. Not to mention that sometimes new tools such as systemd-resolvd can break the way things have worked for a long time, as I point out in [_Resolve systemd-resolved name-service failures with Ansible_][8].

Tools like scripts and Ansible can mitigate the pain while we wait for changes that resolve the pain.

### Conclusion

As I write in [_Learning to love systemd_][9], I can work with either SystemV or systemd init systems, and I have reasons for liking and disliking each:

> "…the real issue and the root cause of most of the controversy between SystemV and systemd is that there is [no choice][10] on the sysadmin level. The choice of whether to use SystemV or systemd has already been made by the developers, maintainers, and packagers of the various distributions—but with good reason. Scooping out and replacing an init system, by its extreme, invasive nature, has a lot of consequences that would be hard to tackle outside the distribution design process."

Because this wholesale replacement is such a massive undertaking, the developers of systemd have been working in stages for several years and replacing various parts of the init system and services and tools that were not parts of the init system but should have been. Many of systemd's new capabilities are made possible only by its tight integration with the services and tools used to manage modern Linux systems.

Although there has been some pain along the way and there will undoubtedly be more, I think the long-term plan and goals are good ones. The advantages of systemd that I have experienced are quite significant.

There is no nefarious plan to take over the world, just one to bring service management into the 21st century.

### Other resources

There is a great deal of information about systemd available on the internet, but much is terse, obtuse, or even misleading. In addition to the resources mentioned in this article, the following web pages offer more detailed and reliable information about systemd startup. This list has grown since I started this series of articles to reflect the research I have done.

  * [5 reasons sysadmins love systemd][11]
  * The Fedora Project has a good, practical [guide to systemd][12]. It has pretty much everything you need to know to configure, manage, and maintain a Fedora computer using systemd.
  * The Fedora Project also has a good [cheat sheet][13] that cross-references the old SystemV commands to comparable systemd ones.
  * The [systemd.unit(5) manual page][14] contains a nice list of unit file sections and their configuration options, along with concise descriptions of each.
  * Fedora Magazine has a good description of the [Unit file structure][15] as well as other important information. 
  * For detailed technical information about systemd and the reasons for creating it, check out Freedesktop.org's [description of systemd][16]. This page is one of the best I have found because it contains many links to other important and accurate documentation.
  * Linux.com's "More systemd fun" offers more advanced systemd [information and tips][17].



There is also a series of deeply technical articles for Linux sysadmins by Lennart Poettering, the designer and primary developer of systemd. He wrote these articles between April 2010 and September 2011, but they are just as relevant now as they were then. Much of everything else good written about systemd and its ecosystem is based on these papers. These links are all available at [FreeDesktop.org][18].

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/systemd

作者：[David Both][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rack_server_sysadmin_cloud_520.png?itok=fGmwhf8I (A rack of servers, blue background)
[2]: https://opensource.com/sites/default/files/uploads/systemd-architecture_0.png (systemd services)
[3]: https://creativecommons.org/licenses/by-sa/4.0/
[4]: https://en.wikipedia.org/wiki/Lennart_Poettering
[5]: https://boinc.berkeley.edu/
[6]: https://www.worldcommunitygrid.org/
[7]: http://0pointer.de/blog/projects/the-new-configuration-files
[8]: https://opensource.com/article/21/4/systemd-resolved
[9]: https://opensource.com/article/20/4/systemd
[10]: http://www.osnews.com/story/28026/Editorial_Thoughts_on_Systemd_and_the_Freedom_to_Choose
[11]: https://opensource.com/article/21/4/sysadmins-love-systemd
[12]: https://docs.fedoraproject.org/en-US/quick-docs/understanding-and-administering-systemd/index.html
[13]: https://fedoraproject.org/wiki/SysVinit_to_Systemd_Cheatsheet
[14]: https://man7.org/linux/man-pages/man5/systemd.unit.5.html
[15]: https://fedoramagazine.org/systemd-getting-a-grip-on-units/
[16]: https://www.freedesktop.org/wiki/Software/systemd/
[17]: https://www.linux.com/training-tutorials/more-systemd-fun-blame-game-and-stopping-services-prejudice/
[18]: http://www.freedesktop.org/wiki/Software/systemd
