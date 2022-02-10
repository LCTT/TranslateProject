[#]: subject: "Try Turris Omnia, the open source router"
[#]: via: "https://opensource.com/article/22/1/turris-omnia-open-source-router"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Try Turris Omnia, the open source router
======
Whether you're a network engineer or a curious hobbyist, you ought to
take a look at the open source Turris Omnia router the next time you're
in the market for network gear.
![Mesh networking connected dots][1]

In the early 2000s, I was fascinated by OpenWrt and wanted nothing more than to run it on a router of my own. Unfortunately, I didn't have a router capable of running custom firmware, and so I spent weekends going to garage sales hoping in vain to stumble upon a "Slug" (the slang term hackers were using for the NSLU2 router). Recently, I got hold of the Turris Omnia, which, aside from having a much cooler name, is a router from the Czech Republic using open source firmware built on top of OpenWrt. It has everything you'd expect from hardware running open source, and quite a lot more, including installable packages so you can add exactly what your home or business network needs the most while ignoring the parts you won't use. If you've viewed routers as simple appliances with no room for customization or even utility beyond DNS and DHCP, then you need to look at the Turris Omnia. It'll change your perception of what a router is, what a router can do for your network, and even how you interact with your entire network.

![The Turris Omnia on my desk][2]

(Seth Kenlon, [CC BY-SA 4.0][3])

### Getting started with Turris Omnia

For all its power, the Turris Omnia feels comfortingly familiar. The steps to get started are essentially the same as with any other router:

  1. Power it on
  2. Join the network it provides
  3. Navigate to 192.168.1.1 in a web browser to configure



If you've bought a router in the past, you'll have performed those same steps before. If you're new to this process, know that it's no more complicated than any other router, and ample documentation comes in the box.

![Configuration][4]

(Seth Kenlon, [CC BY-SA 4.0][3])

### Simple and advanced configuration

After initial setup, when you navigate to the Turris Omnia router, you have a choice between a simple configuration environment or advanced. You have to begin with the simple configuration. In the **Password** panel, you can set a password for the advanced interface, which also grants you SSH access to the router.

The simple interface lets you configure how you connect to the wide-area network (WAN) and set parameters for your local-area network (LAN). It also allows you to set up a personal WiFi access point, a guest network, and install and interact with plugins.

The advanced interface, called LuCI, is exactly what it claims. It's for the network engineer who's familiar with network topography and design, and it's essentially a collection of key and value pairs that you can edit through a simple web interface. If you prefer to edit values directly, you can instead SSH into the router:


```


$ ssh root@192.168.1.1
root@192.168.1.1's password:

BusyBox v1.28.4 () built-in shell (ash)

      ______                _         ____  _____
     /_  __/_  ____________(_)____   / __ \/ ___/
      / / / / / / ___/ ___/ / ___/  / / / /\\__
     / / / /_/ / /  / /  / (__  )  / /_/ /___/ /
    /_/  \\__,_/_/  /_/  /_/____/   \\____//____/  
                                             
 -----------------------------------------------------
 TurrisOS 4.0.1, Turris Omnia
 -----------------------------------------------------
root@turris:~#

```

### Plugins

In addition to the flexibility of its interface, the Turris Omnia also features a package manager. You can install plugins, including Network Attached Storage (NAS) configuration, a Nextcloud server, an SSH honeypot, speed test, OpenVPN, print server, a Tor node, LXC for running containers, and much more.

![Package management for your router][5]

(Seth Kenlon, [CC BY-SA 4.0][3])

With just a few clicks, you can install your own [Nextcloud][6] server so you can run your own cloud services or OpenVPN so you can safely access your network when you're away from home.

### Open source router

The best part about this router is that it's open source and supports open source. You can download Turris OS and many related open source tools from their [gitlab.nic.cz][7]. You don't have to settle for the firmware that ships on the device, either. With 2 GB of RAM and miniPCIe slots, you can run Debian on it. Even the LEDs in the front panel are programmable. This is a hacker's router, and whether you're a network engineer or a curious hobbyist, you ought to take a look at it the next time you're in the market for network gear.

You can get the Turris Omnia and several other router models from the [turris.com][8] website, and then join the community at [forum.turris.cz][9]. They're a friendly bunch of enthusiasts, eager to share knowledge, tips, and cool hacks to further what you can do with your open source router.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/1/turris-omnia-open-source-router

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/mesh_networking_dots_connected.png?itok=ovINTRR3 (Mesh networking connected dots)
[2]: https://opensource.com/sites/default/files/uploads/turris-omnia.jpg (The Turris Omnia on my desk)
[3]: https://creativecommons.org/licenses/by-sa/4.0/
[4]: https://opensource.com/sites/default/files/uploads/turris-omnia-wifi.jpg (Configuration)
[5]: https://opensource.com/sites/default/files/uploads/turris-omnia-packages.jpg (Package management for your router)
[6]: https://opensource.com/tags/nextcloud
[7]: https://gitlab.nic.cz/turris
[8]: https://www.turris.com/en/
[9]: http://forum.turris.cz
