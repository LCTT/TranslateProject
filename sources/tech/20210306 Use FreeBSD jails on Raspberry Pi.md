[#]: subject: "Use FreeBSD jails on Raspberry Pi"
[#]: via: "https://opensource.com/article/21/3/bastille-raspberry-pi"
[#]: author: "Peter Czanik https://opensource.com/users/czanik"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Use FreeBSD jails on Raspberry Pi
======
Create and maintain your containers (aka jails) at scale on FreeBSD with Bastille.

![Parts, modules, containers for software][1]

Image by: Opensource.com

Containers became widely popular because of Docker on Linux, but there are [much earlier implementations][2], including the [jail][3] system on FreeBSD. A container is called a "jail" in FreeBSD terminology. The jail system was first released in FreeBSD 4.0 way back in 2000, and it has continuously improved since. While 20 years ago it was used mostly on large servers, now you can run it on your Raspberry Pi.

### Jails vs. containers on Linux

Container development took a very different path on FreeBSD than on Linux. On FreeBSD, containerization was developed as a strict security feature in the late '90s for virtual hosting and its flexibility grew over the years. Limiting a container's computing resources was not part of the original concept; this was added later.

When I started to use jails in production in 2001, it was quite painful. I had to prepare my own scripts to automate working with them.

On the Linux side, there were quite a few attempts at containerization, including [lxc][4].

Docker brought popularity, accessibility, and ease of use to containers. There are now many other tools on Linux (for example, I prefer to use [Podman on my laptop][5]). And Kubernetes allows you to work with containers at really large scale.

[Bastille][6] is one of several tools available in [FreeBSD ports][7] to manage jails. It is comparable to Docker or Podman and allows you to create and maintain jails at scale instead of manually. It has a template system to automatically install and configure applications within jails, similar to Dockerfile. It also supports advanced FreeBSD functionality, like ZFS or VNET.

### Install FreeBSD on Raspberry Pi

Installing [BSD on Raspberry Pi][8] is pretty similar to installing Linux. You download a compressed image from the FreeBSD website and `dd` it to an SD card. You can also use a dedicated image writer tool; there are many available for all operating systems (OS). Download and write an image from the command line with:

```
wget https://download.freebsd.org/ftp/releases/arm64/aarch64/ISO-IMAGES/13.0/FreeBSD-13.0-BETA1-arm64-aarch64-RPI.img.xz
xzcat FreeBSD-13.0-BETA1-arm64-aarch64-RPI.img.xz | dd of=/dev/XXX
```

That writes the latest beta image available for 64-bit Raspberry Pi boards; check the [download page][9] if you use another Raspberry Pi board or want to use another build. Replace `XXX` with your SD card's device name, which depends on your OS and how the card connects to your machine. I purposefully did not use a device name so that you won't overwrite anything if you just copy and paste the instructions mindlessly. I did that and was lucky to have a recent backup of my laptop, but it was *not* a pleasant experience.

Once you've written the SD card, put it in your Raspberry Pi and boot it. The first boot takes a bit longer than usual; I suspect the partition sizes are being adjusted to the SD card's size. After a while, you will receive the familiar login prompt on a good old text-based screen. The username is **root**, and the password is the same as the user name. The SSH server is enabled by default, but don't worry; the root user cannot log in. It is still a good idea to change the password to something else. The network is automatically configured by DHCP for the Ethernet connection (I did not test WiFi).

The easiest way to configure Bastille on the system is to SSH into Raspberry Pi and copy and paste the commands and configuration in this article. You have a couple of options, depending on how much you care about industry best practices or are willing to treat it as a test system. You can either enable root login in the SSHD configuration (scary, but this is what I did at first) or create a regular user that can log in remotely. In the latter case, make sure that the user is part of the "wheel" group so that it can use `su -` to become root and use Bastille:

```
root@generic:~ # adduser
Username: czanik
Full name: Peter Czanik
Uid (Leave empty for default):
Login group [czanik]:
Login group is czanik. Invite czanik into other groups? []: wheel
Login class [default]:
Shell (sh csh tcsh bash rbash git-shell nologin) [sh]: bash
Home directory [/home/czanik]:
Home directory permissions (Leave empty for default):
Use password-based authentication? [yes]:
Use an empty password? (yes/no) [no]:
Use a random password? (yes/no) [no]:
Enter password:
Enter password again:
Lock out the account after creation? [no]:
Username   : czanik
Password   : *****
Full Name  : Peter Czanik
Uid        : 1002
Class      :
Groups     : czanik wheel
Home       : /home/czanik
Home Mode  :
Shell      : /usr/local/bin/bash
Locked     : no
OK? (yes/no): yes
adduser: INFO: Successfully added (czanik) to the user database.
Add another user? (yes/no): no
Goodbye!
```

The fifth line adds the user to the wheel group. Note that you might have a different list of shells on your system, and Bash is not part of the base system. Install Bash before adding the user:

```
pkg install bash
```

PKG needs to bootstrap itself on the first run, so invoking the command takes a bit longer this time.

### Get started with Bastille

Managing jails with the tools in the FreeBSD base system is possible—but not really convenient. Using a tool like Bastille can simplify it considerably. It is not part of the base system, so install it:

```
pkg install bastille
```

As you can see from the command's output, Bastille has no external dependencies. It is a shell script that relies on commands in the FreeBSD base system (with an exception I'll note later when explaining templates).

If you want to start your containers on boot, enable Bastille:

```
sysrc bastille_enable="YES"
```

Start with a simple use case. Many people use containers to install different development tools in different containers to avoid conflicts or simplify their environments. For example, no sane person wants to install Python 2 on a brand-new system—but you might need to run an ancient script every once in a while. So, create a jail for Python 2.

Before creating your first jail, you need to bootstrap a FreeBSD release and configure networking. Just make sure that you bootstrap the same or an older release than the host is running. For example:

```
bastille bootstrap 12.2-RELEASE
```

It downloads and extracts this release under the `/usr/local/bastille` directory structure.

Networking can be configured in many different ways using Bastille. One option that works everywhere—on your local machine and in the cloud—is using cloned interfaces. This allows jails to use an internal network that does not interfere with the external network. Configure and start this internal network:

```
sysrc cloned_interfaces+=lo1
sysrc ifconfig_lo1_name="bastille0"
service netif cloneup
```

With this network setup, services in your jails are not accessible from the outside network, nor can they reach outside. You need forward ports from your host's external interface to the jails and to enable network access translation (NAT). Bastille integrates with BSD's [PF firewall][10] for this task. The following `pf.conf` configures the PF firewall such that Bastille can add port forwarding rules to the firewall dynamically:

```
ext_if="ue0"

set block-policy return
scrub in on $ext_if all fragment reassemble
set skip on lo

table <jails> persist
nat on $ext_if from <jails> to any -> ($ext_if)

rdr-anchor "rdr/*"

block in all
pass out quick modulate state
antispoof for $ext_if inet
pass in inet proto tcp from any to any port ssh flags S/SA modulate state
```

You also need to enable and start PF for these rules to take effect. Note that if you work through an SSH connection, starting PF will terminate your connection, and you will need to log in again:

```
sysrc pf_enable="YES"
service pf restart
```

### Create your first jail

To create a jail, Bastille needs a few parameters. First, it needs a name for the jail you're creating. It is an important parameter, as you will always refer to a jail by its name. I chose the name of the most famous Hungarian jail for the most elite criminals, but in real life, jail names often refer to the jail's function, like `syslogserver`. You also need to set the FreeBSD release you're using and an internet protocol (IP) address. I used a random `10.0.0.0/8` IP address range, but if your internal network already uses addresses from that, then using the `192.168.0.0/16` is probably a better idea:

```
bastille create csillag 12.2-RELEASE 10.17.89.51
```

Your new jail should be up and running within a few seconds. It is a complete FreeBSD base system without any extra packages. So install some packages, like my favorite text editor, inside the jail:

```
root@generic:~ # bastille pkg csillag install joe
[csillag]:
Updating FreeBSD repository catalogue...
FreeBSD repository is up to date.
All repositories are up to date.
The following 1 package(s) will be affected (of 0 checked):

New packages to be INSTALLED:
        joe: 4.6,1

Number of packages to be installed: 1

The process will require 2 MiB more space.
442 KiB to be downloaded.

Proceed with this action? [y/N]: y
[csillag] [1/1] Fetching joe-4.6,1.txz: 100%  442 KiB 452.5kB/s    00:01    
Checking integrity... done (0 conflicting)
[csillag] [1/1] Installing joe-4.6,1...
[csillag] [1/1] Extracting joe-4.6,1: 100%
```

You can install multiple packages at the same time. Install Python 2, Bash, and Git:

```
bastille pkg csillag install bash python2 git
```

Now you can start working in your new, freshly created jail. There are no network services installed in it, but you can reach it through its console:

```
root@generic:~ # bastille console csillag
[csillag]:
root@csillag:~ # python2
Python 2.7.18 (default, Feb  2 2021, 01:53:44)
[GCC FreeBSD Clang 10.0.1 (git@github.com:llvm/llvm-project.git llvmorg-10.0.1- on freebsd12
Type "help", "copyright", "credits" or "license" for more information.
>>>
root@csillag:~ # logout

root@generic:~ #
```

### Work with templates

The previous example manually installed some packages inside a jail. Setting up jails manually is no fun, even if Bastille makes it easy. Templates make the process even easier; they are similar to Dockerfiles but not entirely the same concept. You bootstrap templates for Bastille just like FreeBSD releases and then apply them to jails. When you apply a template, it will install the necessary packages and change configurations as needed.

To use templates, you need to install Git on the host:

```
pkg install git
```

For example, to bootstrap the `syslog-ng` template, use:

```
bastille bootstrap https://gitlab.com/BastilleBSD-Templates/syslog-ng
```

Create a new jail, apply the template, and redirect an external port to it:

```
bastille create alcatraz 12.2-RELEASE 10.17.89.50
bastille template alcatraz BastilleBSD-Templates/syslog-ng
bastille rdr alcatraz tcp 514 514
```

To test the new service within the jail, use telnet to connect port 514 of your host and enter some random text. Use the `tail` command within your jail to see what you just entered:

```
root@generic:~ # tail /usr/local/bastille/jails/alcatraz/root/var/log/messages
Feb  6 03:57:27 alcatraz sendmail[3594]: gethostbyaddr(10.17.89.50) failed: 1
Feb  6 04:07:13 alcatraz syslog-ng[1186]: Syslog connection accepted; fd='23', client='AF_INET(192.168.1.126:50104)', local='AF_INET(0.0.0.0:514)'
Feb  6 04:07:18 192.168.1.126 this is a test
Feb  6 04:07:20 alcatraz syslog-ng[1186]: Syslog connection closed; fd='23', client='AF_INET(192.168.1.126:50104)', local='AF_INET(0.0.0.0:514)'
```

Since I'm a [syslog-ng][11] evangelist, I used the syslog-ng template in my example, but there are many more available. Check the full list of [Bastille templates][12] to learn about them.

### What's next?

I hope that this article inspires you to try FreeBSD and Bastille on your Raspberry Pi. It was just enough information to get you started; to learn about all of Bastille's cool features—like auditing your jails for vulnerabilities and updating software within them—in the [documentation][13].

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/bastille-raspberry-pi

作者：[Peter Czanik][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/czanik
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/containers_modules_networking_hardware_parts.png
[2]: https://opensource.com/article/18/1/history-low-level-container-runtimes
[3]: https://docs.freebsd.org/en/books/handbook/jails/
[4]: https://opensource.com/article/18/11/behind-scenes-linux-containers
[5]: https://opensource.com/article/18/10/podman-more-secure-way-run-containers
[6]: https://bastillebsd.org/
[7]: https://www.freebsd.org/ports/
[8]: https://opensource.com/article/19/3/netbsd-raspberry-pi
[9]: https://www.freebsd.org/where/
[10]: https://en.wikipedia.org/wiki/PF_(firewall)
[11]: https://www.syslog-ng.com/
[12]: https://gitlab.com/BastilleBSD-Templates/
[13]: https://bastille.readthedocs.io/en/latest/
