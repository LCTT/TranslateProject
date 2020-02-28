[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Getting started with Linux firewalls)
[#]: via: (https://opensource.com/article/20/2/firewall-cheat-sheet)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Getting started with Linux firewalls
======
A firewall is your computer's first line of defense against network
intrusion. Download our cheat sheet to make sure you're secure.
![Cheat Sheet cover image][1]

A sensible firewall is your computer's first line of defense against network intrusion. When you're at home, you're probably behind a firewall built into the router supplied by your internet service provider. When you're away from home, though, the only firewall you have is the one running on your computer, so it's important to configure and control the firewall on your Linux computer. If you run a Linux server, it's just as important to know how to manage your firewall so that you can protect it from unwanted traffic both locally and remotely.

### Install a firewall

Many Linux distributions ship with a firewall already installed, and traditionally that was **iptables**. It is extremely effective and customizable, but it can be complex to configure. Luckily, developers have produced several frontends to help users control their firewall without writing lengthy iptables rules.

On Fedora, CentOS, Red Hat, and similar distributions, the firewall software installed by default is **firewalld**, which is configured and controlled with the **firewall-cmd** command. On Debian and most other distributions, firewalld is available to install from your software repository. Ubuntu ships with the Uncomplicated Firewall (ufw), so to use firewalld, you must enable the **universe** repository:


```
$ sudo add-apt-repository universe
$ sudo apt install firewalld
```

You must also deactivate ufw:


```
`$ sudo systemctl disable ufw`
```

There's no reason _not_ to use ufw. It's an excellent firewall frontend. However, this article focuses on firewalld because of its wide availability and integration into systemd, which is shipped with nearly every distribution.

Regardless of your distribution, for a firewall to be effective, it must be active, and it should be loaded at boot time:


```
`$ sudo systemctl enable --now firewalld`
```

### Understanding firewall zones

Firewalld aims to make firewall configuration as simple as possible. It does this by establishing _zones_. A zone is a set of sensible, common rules that suit the everyday needs of most users. There are nine by default:

  * **trusted:** All network connections are accepted. This is the least paranoid firewall setting and should only be used in a trusted environment, such as a test lab or in a family home where everyone on the local network is known to be friendly.
  * **home, work, internal:** In these three zones, most incoming connections are accepted. They each exclude traffic on ports that usually expect no activity. Any of them is a reasonable setting for use in a home setting where there is no reason to expect network traffic to obscure ports, and you generally trust the other users on the network.
  * **public:** For use in public areas. This is a paranoid setting, intended for times when you do not trust other computers on the network. Only selected common and mostly safe incoming connections are accepted.
  * **dmz:** DMZ stands for demilitarized zone. This zone is intended for computers that are publically accessible, located on an organization's external network with limited access to the internal network. For personal computers, this is usually not a useful zone, but it is an important option for certain types of servers.
  * **external:** For use on external networks with masquerading enabled (meaning the addresses of your private network are mapped to and hidden behind a public IP address). Similar to the dmz zone, only selected incoming connections are accepted, including SSH.
  * **block:** Only network connections initiated within this system are possible, and all incoming network connections are rejected with an **icmp-host-prohibited** message. This is an extremely paranoid setting and is an important option for certain types of servers or personal computers in an untrusted or hostile environment.
  * **drop:** Any and all incoming network packets are dropped with no reply. Only outgoing network connections are possible. The only setting more paranoid than this one is turning off your WiFi and unplugging your Ethernet cable.



You can read about each zone and any other zones defined by your distribution or sysadmin by looking at the configuration files in **/usr/lib/firewalld/zones**. For instance, here's the FedoraWorkstation zone that ships with Fedora 31:


```
$ cat /usr/lib/firewalld/zones/FedoraWorkstation.xml
&lt;?xml version="1.0" encoding="utf-8"?&gt;
&lt;zone&gt;
  &lt;short&gt;Fedora Workstation&lt;/short&gt;
  &lt;description&gt;Unsolicited incoming network packets are rejected from port 1 to 1024, except for select network services. Incoming packets that are related to outgoing network connections are accepted. Outgoing network connections are allowed.&lt;/description&gt;
  &lt;service name="dhcpv6-client"/&gt;
  &lt;service name="ssh"/&gt;
  &lt;service name="samba-client"/&gt;
  &lt;port protocol="udp" port="1025-65535"/&gt;
  &lt;port protocol="tcp" port="1025-65535"/&gt;
&lt;/zone&gt;
```

### Getting your current zone

You can see what zone you're in at any time with the **\--get-active-zones** option:


```
`$ sudo firewall-cmd --get-active-zones`
```

In response, you receive the name of the active zone along with the network interface assigned to it. On a laptop, that usually means you have a WiFi card in the default zone:


```
FedoraWorkstation
  interfaces: wlp61s0
```

### Change your current zone

To change your zone, reassign your network interface to a different zone. For instance, to change the example **wlp61s0** card to the public zone:


```
$ sudo firewall-cmd --change-interface=wlp61s0 \
\--zone=public
```

You can change the active zone for an interface any time you please and for any reason—whether you're going out to a café and feel the need to increase your laptop's security policy, or you're going to work and need to open up some ports to get on the intranet, or for any other reason. The options for **firewall-cmd** auto-complete when you press the **Tab** key, so as long as you remember the keywords "change" and "zone," you can stumble through the command until you learn it by memory.

### Learn more

There's a lot more you can do with your firewall, including customizing existing zones, setting a default zone, and more. The more comfortable with firewalls you get, the more secure your online activities are, so we've created a [cheat sheet][2] for quick and easy reference.

### Download your [firewall cheat sheet][2]

David Both shares how he replaced his dedicated network firewall computer with a Raspberry Pi 2.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/firewall-cheat-sheet

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coverimage_cheat_sheet.png?itok=lYkNKieP (Cheat Sheet cover image)
[2]: https://opensource.com/downloads/firewall-cmd-cheat-sheet
