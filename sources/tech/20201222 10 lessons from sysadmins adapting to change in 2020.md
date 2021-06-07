[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (10 lessons from sysadmins adapting to change in 2020)
[#]: via: (https://opensource.com/article/20/12/sysadmin)
[#]: author: (Alan Formy-Duval https://opensource.com/users/alanfdoss)

10 lessons from sysadmins adapting to change in 2020
======
Adapting to change was a major theme in 2020, and throughout all the
turmoil, we could count on sysadmins to keep us up and running.
![Tips and gears turning][1]

While 2020 will certainly be remembered for elections, protests, and most of all, the COVID-19 pandemic, a lot of other things changed in 2020, including a whole lot of cool changes in technology. Through it all, we could count on system administrators to do what they do best. Perhaps more so than ever, as we all moved from physical offices to working from home. We generated more load than ever on our infrastructure as more users relied on virtual private networks and videoconference tools to get their daily work done.

Every year, we publish many articles to help systems administrators do their jobs better. Of the many articles we published this year, we believe these 10 offer the best insights for sysadmins in 2020. Several provide good examples of the importance of keeping up with change—which, after all, is the only thing we could count on this year.

  1. [Manage network connections from the Linux command line with nmcli][2]: Dave McKay gives an overview of NetworkManager's `nmcli` command for network management in Linux. Using `nmcli` in place of `ifconfig` is strongly recommended in the latest versions of Linux.
  2. [5 new sudo features you need to know in 2020][3]: Following the theme of keeping up with change, Peter Czanik shows five new features of the `sudo` command. This crucial sysadmin tool gains power with recording and auditing capabilities and support for Python.
  3. [Start using systemd as a troubleshooting tool][4]: It's clear that systemd is here to stay. Correspondent David Both invites us on his journey from SystemV to systemd in yet another example of how system administrators need to adapt. In this article (part of an ongoing series), David demonstrates how to troubleshoot a problematic Apache HTTP service using systemd logs and status output.
  4. [5 ops hacks for sysadmins][5]: Server counts continue to rise alongside the demands on system administrators managing bare-metal hosts, containers, or virtual machines. As Stephen Bancroft starts this article: "As a sysadmin, every day I am faced with problems I need to solve quickly because there are users and managers who expect things to run smoothly." He discusses five tools, some "oldies but goodies," that remain extremely useful in 2020.
  5. [Load balance network traffic with HAProxy][6]: Load balancers are an important component of a high-availability infrastructure. They can be deployed for anything from large distributed enterprise applications down to your home lab. A great option for the latter is HAProxy, and Jim O'Connell shows how to set it up.
  6. [An SRE's guide to Memcached for building scalable applications][7]: After reading about load balancers, check out this article by Correspondent Moshe Zadka, as he takes you deeper into the application stack with an overview of Memcached. Moshe, a site reliability engineer, explains Memcached's value for high-performance systems that must respond to repeated requests under heavy load.
  7. [Why making mistakes makes me a better sysadmin][8]: Ben Cotton, the Fedora Linux Project's program manager, reminds us that we can learn from our mistakes. He explains that we can learn to avoid repeating mistakes through practice and testing. Now if only 2020 had a dry-run option!
  8. [10 Ansible modules for Linux system automation][9]: Automation is a great way to avoid those mistakes Ben writes about. Ricardo Gerardi specializes in automation, and in this article, he shows how to use Ansible to automate daily Linux system administration tasks, such as package installation and user creation, that are repetitive and, therefore, error-prone.
  9. [How I use Cockpit for my home's Linux server management][10]: Cockpit is a fairly new graphical tool for Linux system management. It is browser-based and handles local and remote management equally well. After using similar tools over the years, I wrote this article because I am impressed at how quickly Cockpit can be put to use. Installation is simple, and it is easy for any busy system administrator to learn.
  10. [4 ways I contribute to open source as a Linux systems administrator][11]: Open source projects and the communities that support them have taken a prominent role in 2020. In this article, Elizabeth Joseph shares some ways to get involved. She encourages system administrators and other open source users to join and contribute to projects. So, get involved and help make 2021 an even better year!



What sysadmin topics would you like to learn about on Opensource.com? Please share your ideas in the comments. We're always looking for new contributors, so please check out our [Contributor guidelines][12] if you want to write an article you think our readers would enjoy.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/sysadmin

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/gears_devops_learn_troubleshooting_lightbulb_tips_520.png?itok=HcN38NOk (Tips and gears turning)
[2]: https://opensource.com/article/20/7/nmcli
[3]: https://opensource.com/article/20/10/sudo-19
[4]: https://opensource.com/article/20/5/systemd-troubleshooting-tool
[5]: https://opensource.com/article/20/1/ops-hacks-sysadmins
[6]: https://opensource.com/article/20/11/load-balancing-haproxy
[7]: https://opensource.com/article/20/3/sre-memcached
[8]: https://opensource.com/article/20/8/sysadmin-mistakes
[9]: https://opensource.com/article/20/10/ansible-modules-linux
[10]: https://opensource.com/article/20/11/cockpit-server-management
[11]: https://opensource.com/article/20/7/open-source-sysadmin
[12]: https://opensource.com/how-submit-article
