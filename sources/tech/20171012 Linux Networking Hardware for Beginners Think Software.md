translating by sugarfillet
Linux Networking Hardware for Beginners: Think Software
============================================================

![island network](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/soderskar-island.jpg?itok=wiMaF66b "island network")
Without routers and bridges, we would be lonely little islands; learn more in this networking tutorial.[Creative Commons Zero][3]Pixabay

Last week, we learned about [LAN (local area network) hardware][7]. This week, we'll learn about connecting networks to each other, and some cool hacks for mobile broadband.

### Routers

Network routers are everything in computer networking, because routers connect networks. Without routers we would be lonely little islands. Figure 1 shows a simple wired LAN (local area network) with a wireless access point, all connected to the Internet. Computers on the LAN connect to an Ethernet switch, which connects to a combination firewall/router, which connects to the big bad Internet through whatever interface your Internet service provider (ISP) provides, such as cable box, DSL modem, satellite uplink...like everything in computing, it's likely to be a box with blinky lights. When your packets leave your LAN and venture forth into the great wide Internet, they travel from router to router until they reach their destination.

### [fig-1.png][4]

![simple LAN](https://www.linux.com/sites/lcom/files/styles/floated_images/public/fig-1_7.png?itok=lsazmf3- "simple LAN")
Figure 1: A simple wired LAN with a wireless access point.[Used with permission][1]

A router can look like pretty much anything: a nice little specialized box that does only routing and nothing else, a bigger box that provides routing, firewall, name services, and VPN gateway, a re-purposed PC or laptop, a Raspberry Pi or Arduino, stout little single-board computers like PC Engines...for all but the most demanding uses, ordinary commodity hardware works fine. The highest-end routers use specialized hardware that is designed to move the maximum number of packets per second. They have multiple fat data buses, multiple CPUs, and super-fast memory. (Look up Juniper and Cisco routers to see what high-end routers look like, and what's inside.)

A wireless access point connects to your LAN either as an Ethernet bridge or a router. A bridge extends the network, so hosts on both sides of the bridge are on the same network. A router connects two different networks.

### Network Topology

There are multitudes of ways to set up your LAN. You can put all hosts on a single flat network. You can divide it up into different subnets. You can divide it into virtual LANs, if your switch supports this.

A flat network is the simplest; just plug everyone into the same switch. If one switch isn't enough you can connect switches to each other. Some switches have special uplink ports, some don't care which ports you connect, and you may need to use a crossover Ethernet cable, so check your switch documentation.

Flat networks are the easiest to administer. You don't need routers and don't have to calculate subnets, but there are some downsides. They don't scale, so when they get too large they get bogged down by broadcast traffic. Segmenting your LAN provides a bit of security, and makes it easier to manage larger networks by dividing it into manageable chunks. Figure 2 shows a simplified LAN divided into two subnets: internal wired and wireless hosts, and one for servers that host public services. The subnet that contains the public-facing servers is called a DMZ, demilitarized zone (ever notice all the macho terminology for jobs that are mostly typing on a computer?) because it is blocked from all internal access.

### [fig-2.png][5]

![LAN](https://www.linux.com/sites/lcom/files/styles/floated_images/public/fig-2_4.png?itok=LpXq7bLf "LAN")
Figure 2: A simplified LAN divided into two subnets.[Used with permission][2]

Even in a network as small as Figure 2 there are several ways to set it up. You can put your firewall and router on a single device. You could have a dedicated Internet link for the DMZ, divorcing it completely from your internal network. Which brings us to our next topic: it's all software.

### Think Software

You may have noticed that of the hardware we have discussed in this little series, only network interfaces, switches, and cabling are special-purpose hardware. Everything else is general-purpose commodity hardware, and it's the software that defines its purpose. Linux is a true networking operating system, and it supports a multitude of network operations: VLANs, firewall, router, Internet gateway, VPN gateway, Ethernet bridge, Web/mail/file/etc. servers, load-balancer, proxy, quality of service, multiple authenticators, trunking, failover...you can run your entire network on commodity hardware with Linux. You can even use Linux to simulate an Ethernet switch with LISA (LInux Switching Appliance) and vde2.

There are specialized distributions for small hardware like DD-WRT, OpenWRT, and the Raspberry Pi distros, and don't forget the BSDs and their specialized offshoots like the pfSense firewall/router, and the FreeNAS network-attached storage server.

You know how some people insist there is a difference between a hardware firewall and a software firewall? There isn't. That's like saying there is a hardware computer and a software computer.

### Port Trunking and Ethernet Bonding

Trunking and bonding, also called link aggregation, is combining two Ethernet channels into one. Some Ethernet switches support port trunking, which is combining two switch ports to combine their bandwidth into a single link. This is a nice way to make a bigger pipe to a busy server.

You can do the same thing with Ethernet interfaces, and the bonding driver is built-in to the Linux kernel, so you don't need any special hardware.

### Bending Mobile Broadband to your Will

I expect that mobile broadband is going to grow in the place of DSL and cable Internet. I live near a city of 250,000 population, but outside the city limits good luck getting Internet, even though there is a large population to serve. My little corner of the world is 20 minutes from town, but it might as well be the moon as far as Internet service providers are concerned. My only option is mobile broadband; there is no dialup, satellite Internet is sold out (and it sucks), and haha lol DSL, cable, or fiber. That doesn't stop ISPs from stuffing my mailbox with flyers for Xfinity and other high-speed services my area will never see.

I tried AT&T, Verizon, and T-Mobile. Verizon has the strongest coverage, but Verizon and AT&T are expensive. I'm at the edge of T-Mobile coverage, but they give the best deal by far. To make it work, I had to buy a weBoost signal booster and ZTE mobile hotspot. Yes, you can use a smartphone as a hotspot, but the little dedicated hotspots have stronger radios. If you're thinking you might want a signal booster, I have nothing but praise for weBoost because their customer support is superb, and they will do their best to help you. Set it up with the help of a great little app that accurately measures signal strength, [SignalCheck Pro][8]. They have a free version with fewer features; spend the two bucks to get the pro version, you won't be sorry.

The little ZTE hotspots serve up to 15 hosts and have rudimentary firewalls. But we can do better: get something like the Linksys WRT54GL, replace the stock firmware with Tomato, OpenWRT, or DD-WRT, and then you have complete control of your firewall rules, routing, and any other services you want to set up.

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2017/10/linux-networking-hardware-beginners-think-software

作者：[CARLA SCHRODER][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/cschroder
[1]:https://www.linux.com/licenses/category/used-permission
[2]:https://www.linux.com/licenses/category/used-permission
[3]:https://www.linux.com/licenses/category/creative-commons-zero
[4]:https://www.linux.com/files/images/fig-1png-7
[5]:https://www.linux.com/files/images/fig-2png-4
[6]:https://www.linux.com/files/images/soderskar-islandjpg
[7]:https://www.linux.com/learn/intro-to-linux/2017/10/linux-networking-hardware-beginners-lan-hardware
[8]:http://www.bluelinepc.com/signalcheck/
