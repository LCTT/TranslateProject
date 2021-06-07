[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Linux Server Hardening Using Idempotency with Ansible: Part 2)
[#]: via: (https://www.linux.com/blog/linux-server-hardening-using-idempotency-ansible-part-2)
[#]: author: (Chris Binnie https://www.linux.com/users/chrisbinnie)

Linux Server Hardening Using Idempotency with Ansible: Part 2
======

![][1]

[Creative Commons Zero][2]

In the first part of this series, we introduced something called idempotency, which can provide the ongoing improvements to your server estate’s security posture. In this article, we’ll get a little more hands-on with a look at some specific Ansible examples.

### Shopping List

You will need some Ansible experience before being able to make use of the information that follows. Rather than run through the installation and operation of Ansible let’s instead look at some of the idempotency playbook’s content.

As mentioned earlier there might be hundreds of individual system tweaks to make on just one type of host so we’ll only explore a few suggested Ansible tasks and how I like to structure the Ansible role responsible for the compliance and hardening. You have hopefully picked up on the fact that the devil is in the detail and you should absolutely, unequivocally, understand to as high a level of detail as possible, about the permutations of making changes to your server OS.

Be aware that I will mix and match between OSs in the Ansible examples that follow. Many examples are OS agnostic but as ever you should pay close attention to the detail. Obvious changes like “apt” to “yum” for the package manager is a given.

Inside a “tasks” file under our Ansible “hardening” role, or whatever you decide to name it, these named tasks represent the areas of a system with some example code to offer food for thought. In other words, each section that follows will probably be a single YAML file, such as “accounts.yml”, and each will have with varying lengths and complexity.

Let’s look at some examples with ideas about what should go into each file to get you started. The contents of each file that follow are just the very beginning of a checklist and the following suggestions are far from exhaustive.

#### SSH Server

This is the application that almost all engineers immediately look to harden when asked to secure a server. It makes sense as SSH (the OpenSSH package in many cases) is usually only one of a few ports intentionally prised open and of course allows direct access to the command line. The level of hardening that you should adopt is debatable. I believe in tightening the daemon as much as possible without disruption and would usually make around fifteen changes to the standard OpenSSH server config file, “sshd_config”. These changes would include pulling in a MOTD banner (Message Of The Day) for legal compliance (warning of unauthorised access and prosecution), enforcing the permissions on the main SSHD files (so they can’t be tampered with by lesser-privileged users), ensuring the “root” user can’t log in directly, setting an idle session timeout and so on.

Here’s a very simple Ansible example that you can repeat within other YAML files later on, focusing on enforcing file permissions on our main, critical OpenSSH server config file. Note that you should carefully check every single file that you hard-reset permissions on before doing so. This is because there are horrifyingly subtle differences between Linux distributions. Believe me when I say that it’s worth checking first.

name: Hard reset permissions on sshd server file

file: owner=root group=root mode=0600 path=/etc/ssh/sshd_config

To check existing file permissions I prefer this natty little command for the job:

```
$ stat -c "%a %n" /etc/ssh/sshd_config

644 /etc/ssh/sshd_config
```

As our “stat” command shows our Ansible snippet would be an improvement to the current permissions because 0600 means only the “root” user can read and write to that file. Other users or groups can’t even read that file which is of benefit because if we’ve made any mistakes in securing SSH’s config they can’t be discovered as easily by less-privileged users.

#### System Accounts

At a simple level this file might define how many users should be on a standard server. Usually a number of users who are admins have home directories with public keys copied into them. However this file might also include performing simple checks that the root user is the only system user with the all-powerful superuser UID 0; in case an attacker has altered user accounts on the system for example.

#### Kernel

Here’s a file that can grow arms and legs. Typically I might affect between fifteen and twenty sysctl changes on an OS which I’m satisfied won’t be disruptive to current and, all going well, any future uses of a system. These changes are again at your discretion and, at my last count (as there’s between five hundred and a thousand configurable kernel options using sysctl on a Debian/Ubuntu box) you might opt to split off these many changes up into different categories.

Such categories might include network stack tuning, stopping core dumps from filling up disk space, disabling IPv6 entirely and so on. Here’s an Ansible example of logging network packets that shouldn’t been routed out onto the Internet, namely those packets using spoofed private IP Addresses, called “martians”.

name: Keep track of traffic that shouldn’t be routed onto the Internet

lineinfile: dest="/etc/sysctl.conf" line="{{item.network}}" state=present

with_items:

\- { network: 'net.ipv4.conf.all.log_martians = 1' }

\- { network: 'net.ipv4.conf.default.log_martians = 1' }

Pay close attention that you probably don’t want to use the file “/etc/sysctl.conf” but create a custom file under the directory “/etc/sysctl.d/” or similar. Again, check your OS’s preference, usually in the comments of the pertinent files. If you’ve not seen martian packets being enabled before then type “dmesg” (sometimes only as the “root” user) to view kernel messages and after a week or two of logging being in place you’ll probably see some traffic polluting your logs. It’s much better to know how attackers are probing your servers than not. A few log entries for reference can only be of value. When it comes to looking after servers, ignorance is certainly not bliss.

#### Network

As mentioned you might want to include hardening the network stack within your kernel.yml file, depending on whether there’s many entries or not, or simply for greater clarity. For your network.yml file have a think about stopping old-school broadcast attacks flooding your LAN and ICMP oddities from changing your routing in addition.

#### Services

Usually I would stop or start miscellaneous system services (and potentially applications) within this Ansible file. If there weren’t many services then rather than also using a “cron.yml” file specifically for “cron” hardening I’d include those here too.

There’s a bundle of changes you can make around cron’s file permissions etc. If you haven’t come across it, on some OSs, there’s a “cron.deny” file for example which blacklists certain users from accessing the “crontab” command. Additionally you also have a multitude of cron directories under the “/etc” directory which need permissions enforced and improved, indeed along with the file “/etc/crontab” itself. Once again check with your OS’s current settings before altering these or “bad things” ™ might happen to your uptime.

In terms of miscellaneous services being purposefully stopped and certain services, such as system logging which is imperative to a healthy and secure system, have a quick look at the Ansible below which I might put in place for syslog as an example.

name: Insist syslog is definitely installed (so we can receive upstream logs)

apt: name=rsyslog state=present

name: Make sure that syslog starts after a reboot

service: name=rsyslog state=started enabled=yes

#### IPtables

The venerable Netfilter which, from within the Linux kernel offers the IPtables software firewall the ability to filter network packets in an exceptionally sophisticated manner, is a must if you can enable it sensibly. If you’re confident that each of your varying flavours of servers (whether it’s a webserver, database server and so on) can use the same IPtables config then copy a file onto the filesystem via Ansible and make sure it’s always loaded up using this YAML file.

Next time, we’ll wrap up our look at specific system suggestions and talk a little more about how the playbook might be used.

Chris Binnie’s latest book, Linux Server Security: Hack and Defend, shows you how to make your servers invisible and perform a variety of attacks. You can find out more about DevSecOps, containers and Linux security on his website: [https://www.devsecops.cc][3]

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/linux-server-hardening-using-idempotency-ansible-part-2

作者：[Chris Binnie][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/chrisbinnie
[b]: https://github.com/lujun9972
[1]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/artificial-intelligence-3382507_1280.jpg?itok=PHazitpd
[2]: /LICENSES/CATEGORY/CREATIVE-COMMONS-ZERO
[3]: https://www.devsecops.cc/
