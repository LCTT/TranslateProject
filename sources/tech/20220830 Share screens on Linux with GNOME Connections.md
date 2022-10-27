[#]: subject: "Share screens on Linux with GNOME Connections"
[#]: via: "https://opensource.com/article/22/8/share-screens-linux-gnome-connections"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Share screens on Linux with GNOME Connections
======
Discover the power of VNC for screen sharing on Linux.

When someone needs to share their screen with you, or you need to share your screen with someone else, you have several options to choose from. Video conferencing software, like the open source [Jitsi][2] web app, and while we call that "screen sharing," it's really *presenting*. You're presenting your screen to others, but they can't interact with it. Sometimes you actually want to share your screen and your mouse cursor with a trusted friend or colleague, and the tool for that is VNC (Virtual Network Computing), and it's built into your Linux desktop.

In any screen sharing scenario, there are two computers and possibly two users. For that reason, this article has two parts. The first part is for the person setting up their computer to *accept* screen sharing requests, and the second part is for the person trying to connect to *someone else's* screen.

### Share my screen on Linux

If you're reading this section, you're the person who needs technical help from a friend, and you want to allow your friend to connect to your screen. You need to configure your desktop to allow screen sharing.

On the GNOME desktop, open the **Settings** application from the **Activities** menu. In the **Settings** window, click on **Sharing**. In the **Sharing** window, click on **Screen Sharing**.

In the **Screen Sharing** window that appears, you have two choices.

You can set a password so the person connecting to your screen must enter a password to connect. This is convenient when you don't expect to be around the computer when your friend plans on viewing your screen.

You can require a notification so that when someone attempts to connect, you're prompted to let them in (or not.)

![GNOME screen sharing settings][3]

If you're on the [KDE Plasma Desktop][4], then the application to configure screer sharing is called **krfb** (it stands for "Remote Frame Buffer", the protocol used by VNC). It's the exact same concept, just with a different layout.

![KDE screen sharing][5]

### Firewall

Normally, your computer's internal firewall keeps people out of your computer. It does that by indiscriminately blocking incoming all connections. In this case, though, you want to permit one kind of traffic, so you need to open a port in your firewall.

On Fedora, CentOS, Mageia, and many other Linux distributions, you have a firewall whether you know it or not. You may not yet have an app to help you configure your firewall, though. To install the default firewall configuration application, launch GNOME **Software** and search for *firewall*.

Once it's installed, launch the Firewall configuration application and scroll through the (very long) list of services to find and enable **vnc-server**.

![Firewalld configuration][6]

After adding `vnc-server`, open the **Options** menu and select **Runtime to permanent** so your new rule persists even after you reboot.

On Debian, Ubuntu, Linux Mint, and others, you may be running a firewall called **ufw**, so install **gufw** instead. In **gufw**, click the plus (**+**) icon at the bottom of the **Rules** tab to add a new rule. In the **Add a new firewall rure** window that appears, search for `vnc` and click the **Add** button.

![ufw configuration][7]

Your computer is now configured to accept VNC requests. You can skip down to the [troubleshooting] section.

### Viewing a shared screen

If you're reading this section, you're the person providing technical help from afar. You need to connect to a friend or colleague's computer, view their screen, and even control their mouse and keyboard. There are many applications for that, including **TigerVNC**, KDE's **krdc**, and GNOME **Connections**.

### GNOME Connections

On your local computer, install the GNOME **Connections** application from GNOME **Software**, or using your package manager:

```
$ sudo dnf install gnome-connections
```

In GNOME **Connections**, click the plus (**+**) icon in the top left to add a destination host. Select the VNC protocol, and enter the user name and host or IP address you want to connect to, and then click the **Connect** button.

![GNOME Connections][8]

If the user you're connecting to has had to create a new port for the purposes of port forwarding, then you must append the non-default port to the address. For instance, say your target user has created port 59001 to accept VNC traffic, and their home router address is 93.184.216.34. In this case, you enter `username@93.184.216.34:59001` (where `username` is the user's actual user name.)

If the user of the remote system has required a password for VNC, then you're prompted for a password before the connection is made. Otherwise, the user on the remote machine receives an alert asking whether they want to allow you to share their screen. As long as they accept, the connection is made and you can view and even control the mouse and keyboard of the remote host.

### Troubleshoooting screen sharing on Linux

Outside of the work environment, it's common that the user wanting to share their screen and the person who needs to see it are on different networks. You're probably at home, with a router that connects you to the Internet (it's the box you get from your ISP when you pay your Internet bill). Your router, whether you realize it or not, is designed to keep unwanted visitors out. That's normally very good, but in this one special case, you want to let someone trusted through so they can connect to your screen.

To let someone into your network, you have to configure your router to allow traffic at a specific "port" (like a ship port, but for packets of data instead of cargo), and then configure that traffic to get forwarded on to your personal computer.

Unfortunately, there's no *single* way that this is done. Every router manufacturer does it a little differently. That means I can't guide you through the exact steps required, because I don't know what router you have, but I can tell you what information you need up front, and what to look for once you're poking around your router.

#### 1. Get your local IP address

You need to know your computer's network IP address. To get that, open GNOME **Settings** and click on **Wi-Fi** in the left column (or **Network** if you're on a wired connection.) In the **Wi-Fi** panel, click the gear icon and find **IPv4 Adress** in the **Details** window that appears. A local IP address starts with 192.168 or 10.

For example, my network IP address is 10.0.1.2. Write down your notwork IP address for later.

#### 2. Get your public IP address

Click this link to obtain your public IP address: [http://ifconfig.me][9]

For example, my public IP address is 93.184.216.34 Write down your public IP address for later.

#### 3. Configure your router

Router interfaces differ from manufacturer to manufacturer, but the idea is the same regardless of what brand of router you have in your home. First, log in to your router. The router's address and login information is often printed on the router itself, or in its documentation. I own a TP-Link GX90 router, and I log in to it by pointing my web browser to 10.0.1.1, but your router might be 192.168.0.1 or some other address.

My router calls port forwarding "Virtual servers," which is a category found in the router's **NAT forwarding** tab. = Other routers may just call it **Port forwarding** or **Firewall** or even **Applications**. It may take a little clicking around to find the right category, or you may need to spend some time studying your router's documentation.

When you find the port forwarding setting (whatever it might be titled in your router), you need to add a new rule that identifies an external port (I use 59001) and sends traffic that arrives at it to an internal one (5900 is the standard VNC port.)

In step 1, you obtained your network IP address. Use it as the destination for traffic coming to port 59001 of your router. Here's an example of what my router configuration looks like, but yours is almost sure to be different:

![router configuration][10]

This configuration sends traffic arriving at external port 59001 to 10.0.1.2 at port 5900, which is precisely what VNC requires.

Now you can tell the friend you're trying to share your screen with to enter your *public* IP address (in this example, that's 93.184.216.34) and port 59001.

### Linux screen sharing and trust

Only share control of your screen with someone you trust. VNC can be complex to setup because there are security and privacy concerns around giving someone other than yourself access to you computer. However, once you've got it set up, you have instant and easy access to sharing your screen when you want to share something cool you're working on, or get help with something that's been confusing you.

Image by: (Seth Kenlon, CC BY-SA 4.0)

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/8/share-screens-linux-gnome-connections

作者：[Seth Kenlon][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/chat_video_conference_talk_team.png
[2]: https://opensource.com/article/20/5/open-source-video-conferencing
[3]: https://opensource.com/sites/default/files/2022-08/Screenshot%20from%202022-08-11%2019-47-19.png
[4]: https://opensource.com/article/22/2/screen-share-linux-kde
[5]: https://opensource.com/sites/default/files/2022-08/kde-desktop-sharing.webp
[6]: https://opensource.com/sites/default/files/2022-08/Screenshot%20from%202022-08-11%2020-09-19.png
[7]: https://opensource.com/sites/default/files/2022-08/gufw-vnc.png
[8]: https://opensource.com/sites/default/files/2022-08/Screenshot%20from%202022-08-12%2005-11-10.png
[9]: http://ifconfig.me
[10]: https://opensource.com/sites/default/files/2022-08/router-port-forward.webp
