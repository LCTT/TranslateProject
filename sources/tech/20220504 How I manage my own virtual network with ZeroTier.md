[#]: subject: "How I manage my own virtual network with ZeroTier"
[#]: via: "https://opensource.com/article/22/5/zerotier-network"
[#]: author: "Kevin Sonney https://opensource.com/users/ksonney"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How I manage my own virtual network with ZeroTier
======
ZeroTier is an encrypted virtual network backbone, allowing multiple machines to communicate as if they were on a single network.

![Person drinking a hat drink at the computer][1]
(Image by: [Jonas Leupe][2] on [Unsplash][3])

*Automation is a hot topic right now. In my day job as a site reliability engineer (SRE), part of my remit is to automate as many repeating tasks as possible. But how many of us do that in our daily, not-work, lives? This year, I am focused on automating away the toil so that we can focus on the things that are important.*

While automating everything, I ran into some difficulty with remote sites. I'm not a networking person so I started to look at my options. After researching the various virtual private networks (VPN), hardware endpoints, firewall rules, and everything that goes into supporting multiple remote sites, I was confused, grumpy, and frustrated with the complexity of it all.

Then I found [ZeroTier][4]. ZeroTier is an encrypted virtual network backbone, allowing multiple machines to communicate as if they were on a single network. The code is all open source, and you can self-host the controller or use the [ZeroTierOne][5] service with either free or paid plans. I'm using their free plan right now, and it is robust, solid, and very consistent.

Because I'm using the web service, I'm not going to go into detail about running the controller and root services. ZeroTier has a complete reference on how to do that in their [documentation][6], and it's very good.

After creating my own virtual network in the web user interface, the client installation is almost trivial. ZeroTier has packages for APT, RPM, FreeBSD, and many other platforms, so getting the first node online takes little effort.

Once installed, the client connects to the controller service and generates a unique ID for the node. On Linux, you use the `zerotier-cli` command to join a network, using the `zerotier-cli join NETWORKID` command.

```
$ sudo zerotier-cli info
200 info 469584783a 1.x.x ONLINE
```

You can also use `zerotier-cli` to get a listing of connected and available nodes, change network settings, and leave networks.

![Image of Setting up a New Node][7]
(Image by: Kevin Sonney, CC BY-SA 4.0)

After joining a network, you do have to approve access for the node, either through the web console or by making a call to the application programming interface (API). Both methods are documented on the ZeroTier site. After you have two nodes connected, connecting to each other — no matter where you are or what side of any firewalls you may be on — is exactly what you would expect if you were in the same building on the same network. One of my primary use cases is for [remote access to my Home Assistant setup][8] without needing to open up firewall ports or expose it to the internet (more on my Home Assistant setup and related services later).

One thing I did set up myself is a [Beta ZeroNDS Service][9] for internal DNS. This saved me a lot of complexity for managing my own name service or having to create public records for all my private hosts and IP addresses. I found the instructions to be very straight forward, and was able to have a DNS server for my private network up in about 5 minutes. Each client has to allow Zerotier to set the DNS, which is very simple in the GUI clients. To enable it for use on Linux clients, use:

```
$ sudo zerotier-cli setNETWORKID allowDNS=1
```

No other updates are needed as you add and remove hosts, and it "just works."

```
$ sudo zerotier-cli info
200 info 469584845a 1.x.y ONLINE
$ sudo zerotier-cli join
93afae596398153a 200 join OK
$ sudo zerotier-cli peers
200 peers
<ztaddr> <ver> <role> <lat> <link> <TX> <RX> <path>
61d294b9cb - PLANET 112 DIRECT 7946 2812 50.7.73.34/9993
62f865ae71 - PLANET 264 DIRECT 7946 2681 50.7.76.38/9993
778cde7190 - PLANET 61 DIRECT 2944 2901 103.195.13.66/9993
93afae5963 1.x LEAF 77 DIRECT 2945 2886 35.188.31.177/41848
992fcf1db7 - PLANET RECT 79124 DI47 2813 195. 181.173.159/9993
```

I've barely scratched the surface of the features here. ZeroTier also allows for bridging between ZeroTier networks, advanced routing rules, and a whole lot more. They even have a [Terraform provider][10] and a listing of [Awesome Zerotier Things][11]. As of today, I'm using ZeroTier to connect machines across four physical sites, three of which are behind NAT firewalls. Zerotier is simple to set up, and almost completely painless to manage.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/5/zerotier-network

作者：[Kevin Sonney][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/coffee_tea_laptop_computer_work_desk.png
[2]: https://unsplash.com/@jonasleupe?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/tea-cup-computer?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://github.com/zerotier
[5]: https://www.zerotier.com/pricing
[6]: https://docs.zerotier.com
[7]: https://opensource.com/sites/default/files/2022-04/SecondDay02-2.png
[8]: https://opensource.com/article/22/5/remote-home-assistant
[9]: https://github.com/zerotier/zeronsd
[10]: https://github.com/zerotier/terraform-provider-zerotier
[11]: https://github.com/zerotier/awesome-zerotier
