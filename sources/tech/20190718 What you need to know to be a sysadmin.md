[#]: collector: (lujun9972)
[#]: translator: (WangYueScream )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What you need to know to be a sysadmin)
[#]: via: (https://opensource.com/article/19/7/be-a-sysadmin)
[#]: author: (Seth Kenlon https://opensource.com/users/sethhttps://opensource.com/users/marcobravohttps://opensource.com/users/kimvila)

What you need to know to be a sysadmin
======
Kickstart your sysadmin career by gaining these minimum competencies.
![People work on a computer server with devices][1]

The system administrator of yesteryear jockeyed users and wrangled servers all day, in between mornings and evenings spent running hundreds of meters of hundreds of cables. This is still true today, with the added complexity of cloud computing, containers, and virtual machines.

Looking in from the outside, it can be difficult to pinpoint what exactly a sysadmin does, because they play at least a small role in so many places. Nobody goes into a career already knowing everything they need for a job, but everyone needs a strong foundation. If you're looking to start down the path of system administration, here's what you should be concentrating on in your personal or formal training.

### Bash

When you learn the Bash shell, you don't just learn the Bash shell. You learn a common interface to Linux systems, BSD, MacOS, and even Windows (under the right conditions). You learn the importance of syntax, so you can quickly adapt to systems like Cisco routers' command line or Microsoft's PowerShell, and eventually, you can even learn more powerful languages like Python or Go. And you also begin to think procedurally so you can analyze complex problems and break them down into individual components, which is key because _that's_ how systems, like the internet, or an organization's intranet, or a web server, or a backup solution, are designed.

But wait. There's more.

Knowing the Bash shell has become particularly important because of the recent trend toward DevOps and [containers][2]. Your career as a sysadmin may lead you into a world where infrastructure is treated like code, which usually means you'll have to know the basics of scripting, the structure of [YAML-based][3] configuration, and how to [interact][4] with [containers][5] (tiny Linux systems running inside a [sandboxed file][6]). Knowing Bash is the gateway to efficient management of the most exciting open source technology, so go get [Bourne Again][7].

#### Resources

There are many ways to get practice in the Bash shell.

Try a [portable Linux distribution][8]. You don't have to install Linux to use Linux, so grab a spare thumb drive and spend your evenings or weekends getting comfortable with a text-based interface.

There are several excellent [Bash articles][9] available here on opensource.com as well as [on Enable SysAdmin][10].

The problem with telling someone to practice with Bash is that to practice, you must have something to do. And until you know how to use Bash, you probably won't be able to think of anything to do. If that's your situation, go to Over The Wire and play [Bandit][11]. It's a game aimed at absolute beginners, with 34 levels of interactive basic hacking to get you comfortable with the Linux shell.

### Web server setup

Once you're comfortable with Bash, you should try setting up a web server. Not all sysadmins go around setting up web servers or even maintain web servers, but the skills you acquire while installing and starting the HTTP daemon, configuring Apache or Nginx, setting up the [correct permissions][12], and [configuring a firewall][13], are the same skills you need on a daily basis. After a little bit of effort, you may start to notice certain patterns in your labor. There are concepts you probably took for granted before trying to administer production-ready software and hardware, and you're no longer shielded from them in your fledgling role as an administrator. It might be frustrating at first because everyone likes to be good at everything they do, but that's actually a good thing. Let yourself be bad at new skills. That's how you learn.

And besides, the more you struggle through your first steps, the sweeter it is when you finally see that triumphant "it works!" default index.html.

#### Resources

David Both wrote an excellent article on [Apache web server][14] configuration. For extra credit, step through his follow-up article on how to [host multiple sites][15] on one machine.

### DHCP

The Dynamic Host Configuration Protocol (DHCP) is the system that assigns IP addresses to devices on a network. At home, the modem or router your ISP (internet service provider) supports probably has an embedded DHCP server in it, so it's likely out of your purview. If you've ever logged into your home router to adjust the IP address range or set up a static address for some of your network devices, then you're at least somewhat familiar with the concept. You may understand that devices on a network are assigned the equivalent of phone numbers in the form of IP addresses, and you may realize that computers communicate with one another by broadcasting messages addressed to a specific IP address. Message headers are read by routers along the path, each of which works to direct the message to the next most logical router along the path toward its ultimate goal.

Even if you understand these concepts, the inevitable escalation of basic familiarity with DHCP is to set up a DHCP server. Installing and configuring your own DHCP server provides you the opportunity to introduce DHCP collisions on your home network (try to avoid that, if you can, as it will definitely kill your network until it's resolved), control the distribution of addresses, create subnets, and monitor connections and lease times.

More importantly, setting up DHCP and experimenting with different configurations helps you understand inter-networking. You understand how networks represent "partitions" in data transference and what steps you have to take to pass information from one to the other. That's vital for a sysadmin to know because the network is easily one of the most important aspects of the job.

#### Resources

Before running your own DHCP server, ensure that the DHCP server in your home router (if you have one) is inactive. Once you have it up and running, read Archit Modi's [guide to network commands][16] for tips on how to explore your network.

### Network cables

It might sound mundane, but getting familiar with how network cables work not only makes for a really fun weekend but also gives you a whole new understanding of how data gets across the wires. The best way to learn is to go to your local hobby shop and purchase a Cat 5 cutter and crimper and a few Cat 5 terminators. Then head home, grab a spare Ethernet cable, and cut the terminators off. Spend whatever amount of time it takes to get that cable back in commission.

Once you have solved that puzzle, do it again, this time creating a working [crossover cable][17].

You should also start obsessing _now_ about cable management. If you're not naturally inclined to run cables neatly along the floor molding or the edges of a desk or to bind cables together to keep them orderly, then make it a goal to permanently condition yourself with a phobia of messy cables. You won't understand why this is necessary at first, but the first time you walk into a server room, you will immediately know.

### Ansible

[Ansible][18] is configuration management software, and it's a bit of a bridge between sysadmin and DevOps. Sysadmins use Ansible to configure fresh installs of an operating system and to maintain specific states on machines. DevOps uses Ansible to reduce time and effort spent on tooling so that more time and effort gets spent on developing. You should learn Ansible as part of your sysadmin training, with an eye toward the practices of DevOps, because most of what DevOps is pioneering now will end up as part of your workflow in the system administration of the future.

The good thing about Ansible is that you can start using it now. It's cross-platform, and it scales both up and down. Ansible may be overkill for a single-user computer, but then again, Ansible could change the way you spin up virtual machines, or it could help you synchronize the states of all the computers in your home or [home lab][19].

#### Resources

Read "[How to manage your workstation configuration with Ansible][20]" by Jay LaCroix for the quintessential introduction to get started with Ansible on a casual basis.

### Break stuff

Problems arise on computers because of user error, buggy software, administrator (that's you!) error, and any number of other factors. There's no way to predict what's going to fail or why, so part of your personal sysadmin training regime should be to poke at the systems you set up until they fail. The worse you are to your own lab infrastructure, the more likely you are to find weak points. And the more often you repair those weak spots, the more confident you become in your problem-solving skills.

Aside from the rigors of setting up all the usual software and hardware, your primary job as a sysadmin is to find solutions. There will be times when you encounter a problem outside your job description, and it may not even be possible for you to fix it, but it'll be up to you to find a workaround.

The more you break stuff now and work to fix it, the better prepared you will be to work as a sysadmin.

* * *

Are you a working sysadmin? Are there tasks you wish you'd prepared better for? Add them in the comments below!

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/be-a-sysadmin

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sethhttps://opensource.com/users/marcobravohttps://opensource.com/users/kimvila
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003499_01_linux11x_cc.png?itok=XMDOouJR (People work on a computer server with devices)
[2]: https://opensource.com/article/19/6/kubernetes-dump-truck
[3]: https://www.redhat.com/sysadmin/yaml-tips
[4]: https://opensource.com/article/19/6/how-ssh-running-container
[5]: https://opensource.com/resources/what-are-linux-containers
[6]: https://opensource.com/article/18/11/behind-scenes-linux-containers
[7]: https://opensource.com/article/18/7/admin-guide-bash
[8]: https://opensource.com/article/19/6/linux-distros-to-try
[9]: https://opensource.com/tags/bash
[10]: https://www.redhat.com/sysadmin/managing-files-linux-terminal
[11]: http://overthewire.org/wargames/bandit
[12]: https://opensource.com/article/19/6/understanding-linux-permissions
[13]: https://www.redhat.com/sysadmin/secure-linux-network-firewall-cmd
[14]: https://opensource.com/article/18/2/how-configure-apache-web-server
[15]: https://opensource.com/article/18/3/configuring-multiple-web-sites-apache
[16]: https://opensource.com/article/18/7/sysadmin-guide-networking-commands
[17]: https://en.wikipedia.org/wiki/Ethernet_crossover_cable
[18]: https://opensource.com/sitewide-search?search_api_views_fulltext=ansible
[19]: https://opensource.com/article/19/6/create-centos-homelab-hour
[20]: https://opensource.com/article/18/3/manage-workstation-ansible
