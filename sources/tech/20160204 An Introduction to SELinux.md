An Introduction to SELinux
===============================

![](https://www.linux.com/images/stories/66866/jack2-selinux_a.png)

>Figure 1: The getenforce command reporting SELinux is set to Enforcing.

Way back in kernel 2.6, a new security system was introduced to provide a mechanism for supporting access control security policies. This system was [Security Enhanced Linux (SELinux)][1] and was introduced by the [National Security Administration (NSA)][2] to incorporate a strong Mandatory Access Control architecture into the subsystems of the Linux kernel.

If you’ve spent your entire Linux career either disabling or ignoring SELinux, this article is dedicated to you — an introduction to the system that lives “under the hood” of your Linux desktop or server to limit privilege or even eliminate the possibility of damage should programs or daemons become compromised.

Before I begin, you should know that SELinux is primarily a tool for Red Hat Linux and its derivatives. The likes of Ubuntu and SUSE (and their derivatives) make use of AppArmor. SELinux and AppArmor are significantly different. You can install SELinux on SUSE, openSUSE, Ubuntu, etc., but it’s an incredibly challenging task unless you’re very well versed in Linux.

With that said, let me introduce you to SELinux.

### DAC vs. MAC

The old-guard standard form of access control on Linux was Discretionary Access Control (DAC). With this form, an application or daemon runs under either User ID (UID) or Set owner User ID (SUID) and holds object permissions (for files, sockets, and other processes) of that user. This made it easier for malicious code to be run with a permission set that would grant it access to crucial subsystems.

Mandatory Access Control (MAC), on the other hand, enforces the separation of information based on both confidentiality and integrity to enable the confinement of damage. The confinement unit operates independently of the traditional Linux security mechanisms and has no concept of a superuser.

### How SELinux Works

Consider these pieces of the SELinux puzzle:

- Subjects

- Objects

- Policy

- Mode

When a subject (such as an application) attempts to access an object (such as a file), the SELinux Security Server (inside the kernel) runs a check against the Policy Database. Depending on the current mode, if the SELinux Security Server grants permission, the subject is given access to the object. If the SELinux Security Server denies permission, a denied message is logged in /var/log/messages.

Sounds relatively simple, right? There’s actually more to it than that, but for the sake of introduction, those are the important steps.

### The Modes

SELinux has three modes (which can be set by the user). These modes will dictate how SELinux acts upon subject request. The modes are: 

- Enforcing — SELinux policy is enforced and subjects will be denied or granted access to objects based on the SELinux policy rules

- Permissive — SELinux policy is not enforced and does not deny access, although denials are logged

- Disabled — SELinux is completely disabled

Out of the box, most systems have SELinux set to Enforcing. How do you know what mode your system is currently running? You can use a simple command to report the mode; that command is getenforce. This command is incredibly simple to use (as it has the singular purpose of reporting the SELinux mode). To use this tool, open up a terminal window and issue the command getenforce. The report will come back with either, Enforcing, Permissive, or Disabled (see Figure 1 above).

Setting the SELinux mode is actually quite simple — depending upon the mode you want to set. Understand this: It is never recommended to set SELinux to Disable. Why? When you do this, you open up the possibility that files on your disk will be mislabeled and require a re-label to fix. It is also not possible to change the mode of a system when it has been booted in Disabled mode. Your best modes are either Enabled or Permissive.

You can change the SELinux mode from the command line or in the /etc/selinux/config file. To set the mod via command line, you use the setenforce tool. To set the mode to Enforcing, do the following:

1. Open up a terminal window

2. Issue the command su and then enter your administrator password

3. Issue the command setenforce 1

4. Issue the command getenforce to ensure the mode has been set (Figure 2) 

![](https://www.linux.com/images/stories/66866/jack-selinux_b.png)

>Figure 2: Setting the SELinux mode to Enforcing.

To set the mode to Permissive, do this:

1. Open up a terminal window

2. Issue the command su and then enter your administrator password

3. Issue the command setenforce 0

4. Issue the command getenforce to ensure the mode has been set (Figure 3)

![](https://www.linux.com/images/stories/66866/jack-selinux_c.png)

>Figure 3: Setting the SELinux mode to Permissive.

NOTE: Setting the mode via command line overrides the setting in the SELinux config file.

If you’d prefer to set the mode in the SELinux command file, open up that particular file in your favorite text editor and look for the line:

>SELINUX=permissive

You can change the mode to suit your preference and then save the file.

There is also a third method of changing the SELinux mode (via the bootloader), but I don’t recommend it for a beginning user.

### Policy Type

There are two types of SELinux policies:

- Targeted — only targeted network daemons (dhcpd, httpd, named, nscd, ntpd, portmap, snmpd, squid, and syslogd) are protected

- Strict — full SELinux protection for all daemons

You can change the policy type within the /etc/selinux/config file. Open the file in your favorite text editor and look for the line:

>SELINUXTYPE=targeted

Change the option in that line to either targeted or strict to match your needs.

### Checking the Full SELinux Status

There is a handy SELinux tool you might want to know about that will display a detailed status report of your SELinux-enabled system. The command is run from a terminal window like this:

>sestatus -v

You should see output similar to that shown in Figure 4.

![](https://www.linux.com/images/stories/66866/jack-selinux_d.png)

>Figure 4: The output of the sestatus -v command.

### Just Scratching the Surface

As you might expect, I have only scratched the surface of SELinux. It is quite a complex system and will require diving much deeper to obtain a solid understanding of how it works for you and how you can make it better work for your desktops and servers. I still have yet to cover troubleshooting and creating custom SELinux policies.

SELinux is a powerful tool that any Linux administrator should know. Now that you’ve been introduced, I highly recommend you return to Linux.com (when more tutorials on the subject are posted) or take a look at the [NSA SELinux documentation][3] for very in-depth tutorials.


--------------------------------------------------------------------------------

via: https://www.linux.com/learn/docs/ldp/883671-an-introduction-to-selinux

作者：[Jack Wallen][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/community/forums/person/93
[1]: http://selinuxproject.org/page/Main_Page
[2]: https://www.nsa.gov/research/selinux/
[3]: https://www.nsa.gov/research/selinux/docs.shtml
