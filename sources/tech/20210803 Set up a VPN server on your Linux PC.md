[#]: subject: (Set up a VPN server on your Linux PC)
[#]: via: (https://opensource.com/article/21/8/openvpn-server-linux)
[#]: author: (D. Greg Scott https://opensource.com/users/greg-scott)
[#]: collector: (lujun9972)
[#]: translator: (perfiffer)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Set up a VPN server on your Linux PC
======
The first step in building a VPN is setting up a VPN server.
![Person drinking a hot drink at the computer][1]

Have you been connected to an untrusted network such as a hotel or café WiFi and need to securely browse the internet from your smartphone or laptop? By using a virtual private network (VPN), you can access that untrusted network anonymously and as safely as if you were on a private network.

VPN is an amazing tool for safeguarding private data. By using a VPN, you can connect to a private network on the internet while maintaining anonymity.

There are many VPN services available, and many people have found that the preferred option for securing private data when using untrusted networks is [OpenVPN][2].

OpenVPN creates an encrypted tunnel between two points, preventing a third party from accessing your network traffic data. By setting up your VPN server, you become your own VPN provider. Many popular VPN services use OpenVPN, so why tie your connection to a specific provider when you can have complete control yourself?

### Set up a Linux server

First, install a copy of Linux onto a spare PC. These examples use Fedora, but the steps are mostly the same no matter what Linux distribution you use.

Download a copy of the most recent Fedora ISO from the [Fedora project][3] website. Make a bootable USB drive, plug it into and boot your PC, and install the operating system. If you've never made a bootable USB drive, read about [Fedora Media Writer][4]. If you've never installed Linux, read about [installing Linux in three steps][5].

### Set up networking

After installing the Fedora operating system, log into the console or SSH session.

Apply the latest updates and reboot:


```
`$ sudo dnf update -y && reboot`
```

Log in again and disable the firewall rules:


```
systemctl disable firewalld.service
systemctl stop firewalld.service
```

You may want to add appropriate firewall rules on this system for your internal network. If so, finish setting up and debugging OpenVPN with all firewall rules turned off, and then add your local firewall rules. For more information, read about [setting up firewalls on Linux][6].

### Set up IP addresses

You need a static IP address inside your local network. The commands below assume a Network Manager connection named `ens3` on a device named `ens3`. Your device and connection names might be different, so find them by opening an SSH session or the console and entering:


```
$ sudo nmcli connection show
NAME  UUID                                  TYPE      DEVICE
ens3  39ad55bd-adde-384a-bb09-7f8e83380875  ethernet  ens3
```

You need to ensure that your remote people can find your VPN server. There are two ways to do this. You can set its IP address manually, or you can let your router do most of the work.

#### Configure an IP address manually

Set your static IP address, prefix, gateway, and DNS resolver with the following command but substituting your own IP addresses:


```
$ sudo nmcli connection modify ens3 ipv4.addresses 10.10.10.97/24
$ sudo nmcli connection modify ens3 ipv4.gateway 10.10.10.1
$ sudo nmcli connection modify ens3 ipv4.dns 10.10.10.10
$ sudo nmcli connection modify ens3 ipv4.method manual
$ sudo nmcli connection modify ens3 connection.autoconnect yes
```

Set a hostname:


```
`$ sudo hostnamectl set-hostname OVPNserver2020`
```

If you run a local DNS server, you will want to set up a DNS entry with the hostname pointing to the VPN server IP Address.

Reboot and make sure the system has the correct networking information.

#### Configure an IP address in your router

You probably have a router on your network. You may have purchased it, or you may have gotten one from your internet service provider (ISP). Either way, your router probably has a built-in DHCP server that assigns an IP address to each device on your network. Your new server counts as a device on your network, so you may have noticed an IP address is assigned to it automatically.

The potential problem here is that your router doesn't guarantee that any device will ever get the same IP address after reconnecting. It does _try_ to keep the IP addresses consistent, but they can change depending on how many devices are connected at the time.

However, almost all routers have an interface allowing you to intercede and reserve IP addresses for specific devices.

![Router IP address settings][7]

(Seth Kenlon, [CC BY-SA 4.0][8])

There isn't a universal interface for routers, so search the interface of the router you own for **DHCP** or **Static IP address** options. Assign your server its own reserved IP address so that its network location remains the same no matter what.

### Access your server

By default, your router probably has a firewall built into it. This is normally good because you don't want someone outside your network to be able to brute force their way into any of your computers. However, you must allow traffic destined for your VPN server through your firewall, or else your VPN will be unreachable and, therefore, no use to you. 

You will need at least one public static IP Address from your internet service provider. Set up the public side of your router with its static IP Address, and then put your OpenVPN server on the private side, with its own private static IP Address inside your network. OpenVPN uses UDP port 1194 by default. Configure your router to [port-forward][9] traffic for your public VPN IP Address on UDP port 1194 to UDP port 1194 on your OpenVPN server. If you decide to use a different UDP port, adjust the port number accordingly.

### Get ready for the next step

In this article, you installed and configured an operating system on your server, which is approximately half the battle. In the next article, you'll tackle installing and configuring OpenVPN itself. In the meantime, get familiar with your router and make sure you can reach your server from the outside world. But be sure to close the port forwarding after testing until your VPN is up and running.

* * *

_Parts of this article were adapted from D. Greg Scott's [blog][10] and have been republished with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/openvpn-server-linux

作者：[D. Greg Scott][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/greg-scott
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_tea_laptop_computer_work_desk.png?itok=D5yMx_Dr (Person drinking a hot drink at the computer)
[2]: https://openvpn.net/
[3]: http://getfedora.org
[4]: https://opensource.com/article/20/10/fedora-media-writer
[5]: https://opensource.com/article/21/2/linux-installation
[6]: https://www.redhat.com/sysadmin/secure-linux-network-firewall-cmd
[7]: https://opensource.com/sites/default/files/uploads/reserved-ip.jpg (Router IP address settings)
[8]: https://creativecommons.org/licenses/by-sa/4.0/
[9]: https://opensource.com/article/20/9/firewall
[10]: https://www.dgregscott.com/how-to-build-a-vpn-in-four-easy-steps-without-spending-one-penny/
