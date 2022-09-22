[#]: subject: "3 steps to protect your home network"
[#]: via: "https://opensource.com/article/22/9/protect-home-network"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lkxed"
[#]: translator: "PeterPan0106"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

3 steps to protect your home network
======
Who has access to your home network? With the Internet of Things (IoT) commonplace, there are sometimes more services running on your home network than you realize. Protect it from unwanted traffic.

The typical setup for Internet connectivity today is for your home to have a **router**, usually a little physical box located somewhere in your house, that acts as a gateway to the rest of the world. The router creates a local network, and you connect your devices to it, including your computer, mobile, TV, game console, and anything else that needs to connect to the Internet or to each other. It's deceptively easy to think of this setup as there being two "sides" of your router: On one side there's the Internet, and on the other, your devices. That's an awful colloquial, though, because in reality there's an entire worldwide *network of computers* on one side of your router, and your digital life on the other. When you use the Internet directly, you're logging onto a shared area of somebody else's computer. When you're not using the Internet, it doesn't go away, and there are lots of scripts and programs out there designed to visit millions upon millions of routers in an attempt to find open ports or services. With the Internet of Things (IoT) commonplace, there are sometimes more services running on your home network than you realize. Here are three steps you can take to audit and protect your home network from unwanted traffic.

### 1. Think about protocol

Part of your router's job is to keep the Internet separate from your home network. But when you access the Internet, you invite some portion of the Internet into your home. You're making an exception to the general rule that the Internet should stay off your network.

On many websites, what's allowed through your router is just text. When you visit your favorite blog site to read up on the latest tech news, for instance, you're downloading a page or two of text. You read the text, and then move on. That's a simple one-to-one transaction.

However, the HTTPS protocol is robust and the applications running on the Internet are full of variety. When you visit Opensource.com, for instance, you're not just downloading text. You get graphics, and maybe a cheat sheet or ebook. You're also downloading cookies in the background, which helps site administrators understand who visits the site, which has led to improved mobile support, a new design for greater accessibility, and content that readers enjoy. You may not think about cookies or traffic analysis as something you interact with when you're on the Internet, but it's something that gets "snuck" into page interactions because the HTTPS protocol is designed to be broad and, in many ways, high trust. When you visit a website over HTTPS (that is, in a web browser), you're implicitly agreeing to automatic downloads of files that you're probably not conscious of, but that you trust are useful and unobtrusive. For a model of file sharing designed for less trust, you might try the [Gemini][3] or [Gopher][4] space.

You make a similar agreement when you join a video conference. Not only are you downloading text on the page, cookies for traffic monitoring, but also a video and audio feed.

Some sites are designed for even more. There are sites designed to allow people to share their computer screen, and sometimes even the control of their computer. In the best case scenario, this helps a remote technician repair a problem on someone's computer, but in practice users can be tricked into visiting sites only to have financial credentials and personal data stolen.

You'd rightfully be suspicious if a website offering text articles required you to grant it permission to look through your webcam while you read. You should cultivate the same level of suspicion when an appliance requires Internet access. When you connect a device to your network, it's important to consider what implicit agreement you're making. A device designed to control lighting in your house shouldn't *require* Internet access to function, but many do, and many don't make it clear what permissions you're granting that device. Many IoT devices *want* access to the Internet so that you can access the device over the Internet while you're away from home. That's part of the appeal of a "smart home". However, it's impossible to know what code many of these devices run. When possible, use open source and trusted software, such as [Home Assistant][5] to interface with your living space.

### 2. Create a guest network

Many modern routers make it trivial to create a second network (usually called a "guest network" in the configuration panels) for your home. You probably don't feel like you need a second network, but actually a guest network can be useful to have around. Its eponymous and most obvious use case is that a guest network provides people visiting your house access to the Internet without you telling them your network password. In the foyer of my house, I have a sign identifying the guest network name and password. Anyone who visits can join that network for access to the Internet.

The other use case is for IoT, edge devices, and my home lab. When I purchased "programmable" Christmas lights last year, I was surprised to find that in order to connect to the lights, they had to be connected to the Internet. OF course, the $50 lights from a nameless factory didn't come with source code included, or any way to interface or inspect with the firmware embedded in the power brick, and so I wasn't confident in what I was agreeing to by connecting them to the Internet. They've been permanently relegated to my guest network.

Every router vendor is different, so there's no single instruction on how to create a "sandboxed" guest network on yours. Generally, you access your home router through a web browser. Your router's address is sometimes printed on the bottom of the router, and it begins with either 192.168 or 10.

Navigate to your router's address and log in with the credentials you were provided when you got your Internet service. It's often as simple as `admin` with a numeric password (sometimes, this password is printed on the router, too). If you don't know the login, call your Internet provider and ask for details.

In the graphical interface, find the panel for "Guest network." This option is in the **Advanced** configuration of my router, but it could be somewhere else on yours, and it may not even be called "Guest network" (or it may not even be an option.)

![Creating a guest network][7]

Image by: (Opensource.com, CC BY-SA 4.0)

It may take a lot of clicking around and reading. If you find that you have the option, then you can set up a guest network for visitors, including people walking through your front door and applications running on a lightbulb.

### 3. Firewall your firewall

Your router probably has a firewall running by default. A firewall keeps unwanted traffic off your network, usually by limiting incoming packets to HTTP and HTTPS (web browser traffic) and a few other utility protocols, and by rejecting traffic you didn't initiate. You can verify that a firewall is running by logging onto your router and looking for "Firewall" or "Security" settings.

However, many devices can run firewalls of there own. This is important because a network is a *network* because devices connect to one another. Placing firewalls "between" devices is like locking a door to a room inside your house. Guests may roam the halls, but without the right key they're not invited into your office.

On Linux, you can configure your firewall using [firewalld][8] interface and the [firewall-cmd][9] command. On other operating systems, the firewall is sometimes in a control panel labeled as "security" or "sharing" (and sometimes both.) Most default firewall settings allow only outgoing traffic (that's the traffic you initiate by, for instance, opening a browser and navigating to a website) and incoming traffic that's responding to your requests (that's the web data responding to your navigation). Incoming traffic that you didn't initiate is blocked.

You can customize this setup as needed, should you want to allow specific traffic, such as an [SSH connection][10], a [VNC connection][11], or a [game server][12] host.

### Monitor your network

These techniques help build up your awareness of what's happening around you. The next step is to [monitor your network][13]. You can start simple, for instance by running [Fail2ban][14] on a test server on your guest network. Take a look at logs, if your router provides them. You don't have to know everything about TCP/IP and packets and other advanced subjects to see that the Internet is a busy and noisy place, and seeing that for yourself is great inspiration to take precautions when you set up a new device, whether it's IoT, mobile, a desktop or laptop, a game console, or a [Raspberry Pi][15], in your home.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/9/protect-home-network

作者：[Seth Kenlon][a]
选题：[lkxed][b]
译者：[PeterPan0106](https://github.com/PeterPan0106)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/wfh_work_home_laptop_work.png
[2]: https://opensource.com/article/20/1/open-source-networking
[3]: https://opensource.com/article/20/10/gemini-internet-protocol
[4]: https://opensource.com/article/16/12/yearbook-compute-its-1989#gopher
[5]: https://opensource.com/article/20/12/home-assistant
[6]: https://opensource.com/article/20/11/wireless-protocol-home-automation
[7]: https://opensource.com/sites/default/files/2022-08/router-guest-network.jpg
[8]: https://opensource.com/article/19/7/make-linux-stronger-firewalls
[9]: https://www.redhat.com/sysadmin/secure-linux-network-firewall-cmd
[10]: https://www.redhat.com/sysadmin/access-remote-systems-ssh
[11]: https://www.redhat.com/sysadmin/accessing-remote-desktops
[12]: https://opensource.com/article/18/5/maptool
[13]: https://opensource.com/article/19/2/network-monitoring-tools
[14]: https://www.redhat.com/sysadmin/protect-systems-fail2ban
[15]: https://opensource.com/article/22/3/raspberry-pi-projects-2022
