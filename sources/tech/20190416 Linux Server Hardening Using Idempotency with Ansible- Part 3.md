[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Linux Server Hardening Using Idempotency with Ansible: Part 3)
[#]: via: (https://www.linux.com/blog/linux-server-hardening-using-idempotency-ansible-part-3)
[#]: author: (Chris Binnie https://www.linux.com/users/chrisbinnie)

Linux Server Hardening Using Idempotency with Ansible: Part 3
======

![][1]

[Creative Commons Zero][2]

In the previous articles, we introduced idempotency as a way to approach your server’s security posture and looked at some specific Ansible examples, including the kernel, system accounts, and IPtables. In this final article of the series, we’ll look at a few more server-hardening examples and talk a little more about how the idempotency playbook might be used.

#### **Time**

Due to its reduced functionality, and therefore attack surface, the preference amongst a number of OSs has been to introduce “chronyd” over “ntpd”. If you’re new to “chrony” then fret not. It’s still using the NTP (Network Time Protocol) that we all know and love but in a more secure fashion.

The first thing I do with Ansible within the “chrony.conf” file is alter the “bind address” and if my memory serves there’s also a “command port” option. These config options allow Chrony to only listen on the localhost. In other words you are still syncing as usual with other upstream time servers (just as NTP does) but no remote servers can query your time services; only your local machine has access.

There’s more information on the “bindcmdaddress 127.0.0.1” and “cmdport 0” on this Chrony page (<https://chrony.tuxfamily.org/faq.html>) under “2.5. How can I make chronyd more secure?” which you should read for clarity. This premise behind the comment on that page is a good idea: “you can disable the internet command sockets completely by adding cmdport 0 to the configuration file”.

Additionally I would also focus on securing the file permissions for Chrony and insist that the service starts as expected just like the syslog config above. Otherwise make sure that your time sources are sane, have a degree of redundancy with multiple sources set up and then copy the whole config file over using Ansible.

#### **Logging**

You can clearly affect the level of detail included in the logs from a number pieces of software on a server. Thinking back to what we’ve looked at in relation to syslog already you can also tweak that application’s config using Ansible to your needs and then use the example Ansible above in addition.

#### **PAM**

Apparently PAM (Pluggable Authentication Modules) has been a part of Linux since 1997. It is undeniably useful (a common use is that you can force SSH to use it for password logins, as per the SSH YAML file above). It is extensible, sophisticated and can perform useful functions such as preventing brute force attacks on password logins using a clever rate limiting system. The syntax varies a little between OSes but if you have the time then getting PAM working well (even if you’re only using SSH keys and not passwords for your logins) is a worthwhile effort. Attackers like their own users on a system with lots of usernames, something innocuous such as “webadmin” or similar might be easy to miss on a server, and PAM can help you out in this respect.

#### **Auditd**

We’ve looked at logging a little already but what about capturing every “system call” that a kernel makes. The Linux kernel is a super-busy component of any system and logging almost every single thing that a system does is an excellent way of providing post-event forensics. This article will hopefully shed some light on where to begin: <http://www.admin-magazine.com/Archive/2018/43/Auditing-Docker-Containers-in-a-DevOps-Environment>. Note the comments in that article about performance, there’s little point in paying extra for compute and disk IO resource because you’ve misconfigured your logging so spend some time getting it correct would be my advice.

For concerns over disk space I will usually change a few lines in the file “/etc/audit/auditd.conf” in order to prevent there firstly being too many log files created and secondly logs that grow very large without being rotated. This is also on the proviso that logs are being ingested upstream via another mechanism too. Clearly the files permissions and the service starting are also the basics you need to cover here too. Generally file permissions for auditd are tight as it’s a “root” oriented service so there’s less changes needed here generally.

#### **Filesystems**

With a little reading you can discover which filesystems that are made available to your OS by default. You should disable these (at the “modprode.d” file level) with Ansible to prevent weird and wonderful things being attached unwittingly to your servers. You are reducing the attack surface with this approach. The Ansible might look something like this below for example.

```
name: Make sure filesystems which are not needed are forced as off

lineinfile: dest="/etcmodprobe.d/harden.conf" line='install squashfs /bin/true' state=present
```

#### **SELinux**

The old, but sometimes avoided due to complexity, security favourite, SELinux, should be set to “enforcing” mode. Or, at the every least, set to log sensibly using “permissive” mode. Permissive mode will at least fill your auditd logs up with any correct rule matches nicely. In terms of what Ansible looks like it’s simple and is along these lines:

```
name: Configure SElinux to be running in permissive mode

replace: path=”/etc/selinux/config” regexp='SELINUX=disabled'  replace='SELINUX=permissive'
```

#### **Packages**

Needless to say the compliance hardening playbook is also a good place to upgrade all the packages (with some selective exclusions) on the system. Pay attention to the section relating to reboots and idempotency in a moment however. With other mechanisms in place you might not want to update packages here but instead as per the Automation Documents article mentioned in a moment.

### **Idempotency**

Now we’ve run through some of the aspects you would want to look at when hardening on a server, let’s think a little more about how the playbook might be used.

When it comes to cloud platforms most of my professional work has been on AWS and therefore, more often than not, a fresh AMI is launched and then a playbook is run over the top of it. There’s a mountain of detail in one way of doing that in this article (<http://www.admin-magazine.com/Archive/2018/45/AWS-Automation-Documents>) which you may be pleased to discover accommodates a mechanism to spawn a script or playbook.

It is important to note, when it comes to idempotency, that it may take a little more effort initially to get your head around the logic involved in being able to re-run Ansible repeatedly without disturbing the required status quo of your server estate.

One thing to be absolutely certain of however (barring rare edge cases) is that after you apply your hardening for the very first time, on a new AMI or server build, you will require a reboot. This is an important element due to a number of system facets not being altered correctly without a reboot. These include applying kernel changes so alterations become live, writing auditd rules as immutable config and also starting or stopping services to improve the security posture.

Note though that you’re probably not going to want to execute all plays in a playbook every twenty or thirty minutes, such as updating all packages and stopping and restarting key customer-facing services. As a result you should factor the logic into your Ansible so that some tasks only run once initially and then maybe write a “completed” placeholder file to the filesystem afterwards for referencing. There’s a million different ways of achieving a status checker.

The nice thing about Ansible is that the logic for rerunning playbooks is implicit and unlike shell scripts which for this type of task can be arduous to code the logic into. Sometimes, such as updating the GRUB bootloader for example, trying to guess the many permutations of a system change can be painful.

### **Bedtime Reading**

I still think that you can’t beat trial and error when it comes to computing. Experience is valued for good reason.

Be warned that you’ll find contradictory advice sometimes from the vast array of online resources in this area. Advice differs probably because of the different use cases. The only way to harden the varying flavours of OS to my mind is via a bespoke approach. This is thanks to the environments that servers are used within and the requirements of the security framework or standard that an organisation needs to meet.

For OS hardening details you can check with resources such as the NSA ([https://www.nsa.gov][3]), the Cloud Security Alliance (<https://cloudsecurityalliance.org/working-groups/security-guidance/#_overview>), proprietary training organisations such as GIAC ([https://www.giac.org][4]) who offer resources (<https://www.giac.org/paper/gcux/97/red-hat-linux-71-installation-hardening-checklist/102167>), the diverse CIS Benchmarks ([https://www.cisecurity.org][5]) for industry consensus-based benchmarking, the SANS Institute (<https://uk.sans.org/score/checklists>), NIST’s Computer Security Research ([https://csrc.nist.gov][6]) and of course print media too.

### **Conclusion**

Hopefully, you can see how powerful an idempotent server infrastructure is and are tempted to try it for yourself.

The ever-present threat of APT (Advanced Persistent Threat) attacks on infrastructure, where a successful attacker will sit silently monitoring events and then when it’s opportune infiltrate deeper into an estate, makes this type of configuration highly valuable.

The amount of detail that goes into the tests and configuration changes is key to the value that such an approach will bring to an organisation. Like the tests in a CI/CD pipeline they’re only as ever as good as their coverage.

Chris Binnie’s latest book, Linux Server Security: Hack and Defend, shows you how to make your servers invisible and perform a variety of attacks. You can find out more about DevSecOps, containers and Linux security on his website: [https://www.devsecops.cc][7]

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/linux-server-hardening-using-idempotency-ansible-part-3

作者：[Chris Binnie][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/chrisbinnie
[b]: https://github.com/lujun9972
[1]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/tech-1495181_1280.jpg?itok=5WcwApNN
[2]: /LICENSES/CATEGORY/CREATIVE-COMMONS-ZERO
[3]: https://www.nsa.gov/
[4]: https://www.giac.org/
[5]: https://www.cisecurity.org/
[6]: https://csrc.nist.gov/
[7]: https://www.devsecops.cc/
