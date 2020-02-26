[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to set up your own fast, private open source mesh network)
[#]: via: (https://opensource.com/article/20/2/mesh-network-freemesh)
[#]: author: (Spencer Thomason https://opensource.com/users/spencerthomason)

How to set up your own fast, private open source mesh network
======
FreeMesh is an affordable, performant, privacy-respecting mesh system
that installs in less than 10 minutes.
![people on top of a connected globe][1]

The [FreeMesh][2] system promises to bring fully open source mesh networking to the masses. I recently had a chance to test it; it installed quickly, and the performance was great—especially for the price.

### Why mesh and open source?

The reason to use open source is simple: privacy. With FreeMesh, your data is your own. It doesn't track or collect data. Don't trust it? You can easily check—it's open source, after all! With some other popular mesh solutions, say those provided by very large tech conglomerates, would you trust them with your data?

Another important factor: updates. FreeMesh says it is committed to pushing out security and performance updates regularly. What about 10 years from now? With an open source solution, you are free to update the product for as long as you want.

So why mesh? In a mesh network, multiple wireless routers work together to broadcast a single, very large wireless network. Each router in a mesh network intelligently communicates with the other(s) to provide the best "path" for your data. The following images from FreeMesh's website highlight the difference between using a single wireless router and a mesh network. The red network represents a single wireless router, and the green is a mesh network.

![Single-router network][3] | ![Mesh network][4]
---|---

### Get the equipment

To get started with FreeMesh, [order a kit][5]. Two kits are available: standard and 4G LTE.

The 4G LTE kit, as the name suggests, supports cellular data connections. This feature is a rarity in the consumer networking space, and it will be _very_ useful to some folks. You can set up a portable mesh network anywhere with power and cell service with full fast-failover capability.

The FreeMesh kits come with a primary router and two nodes. The router and nodes use 802.11ac, 802.11r, and 802.11s standards. The included firmware runs a customized version of [OpenWrt][6], a Linux distro for embedded devices.

The FreeMesh router has some really good specs:

  * **CPU:** Dual-core 880MHz MediaTek MT7621AT (two cores/four threads!)
  * **RAM:** DDR3 512MB
  * **Interfaces:** 1x GbE WAN, 4x GbE LAN, 1x USB 2.0 ports, 1x microSD card slot, 1x SIM slot
  * **Antenna:** 2x 5dBi 2.4GHz, 2x 5dBi 5GHz, 2x 3dBi 3G/4G (built-in)
  * **4G LTE modem:** LTE category 4 module, 150Mbps downlink and 50Mbps uplink



### Setup

Setup is easy, and FreeMesh's [README][7] offers simple instructions and diagrams. Start by setting up the primary router first. Then follow these simple steps:

  1. Connect the first node (blue WAN port) to the primary router (yellow LAN port).
![FreeMesh setup step 1][8]
  2. Wait about 30 to 60 seconds. The node will flash its LEDs when the setup is complete.
![FreeMesh setup step 2][9]
  3. Move the node to another location.



That's it! There is no manual setup required for the nodes; you simply plug them into the primary router, and it does the rest. You can add more nodes the same way; just repeat the steps above.

### Features

Out of the box, FreeMesh runs a combination of OpenWRT and LuCI. It has all the features you'd expect from a router. Want to install new features or packages? SSH in and start hacking!

![Real-time load on FreeMesh network][10]

![Overview of FreeMesh network][11]

![OpenWrt status report][12]

### Performance

After setting up the FreeMesh system, I moved the nodes to various places around my house. I used [iPerf][13] to test the bandwidth and was getting around 150Mbps. WiFi can be affected by any number of environmental variables, so your mileage may vary. Distance between the nodes and the primary router also plays a large factor in bandwidth.

However, the real advantage of a mesh network isn't its top-end speed but much better average speed across a space. Even at the far reaches of my home, I was still able to stream videos and work without interruption. I was even able to work in my backyard. I simply repositioned one of the nodes in front of a window before heading outside.

### Conclusion

FreeMesh is really compelling; it offers performance, privacy, and price, all in a simple, open source package.

In my experience, setup is a breeze, and it is more than fast enough. The range is excellent and far exceeds any single-router setup. You are free to hack and customize your FreeMesh setup, but I didn't feel the need to. It has everything I need out of the box.

If you are looking for an affordable, performant, privacy-respecting mesh system that installs in less than 10 minutes, you might want to consider FreeMesh.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/mesh-network-freemesh

作者：[Spencer Thomason][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/spencerthomason
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bus-networking.png?itok=fHmulI9p (people on top of a connected globe)
[2]: https://freemeshwireless.com/
[3]: https://opensource.com/sites/default/files/uploads/singlerouternetwork.png (Single-router network)
[4]: https://opensource.com/sites/default/files/uploads/meshnetwork.png (Mesh network)
[5]: https://freemeshwireless.com/#pricing
[6]: https://openwrt.org/
[7]: https://gitlab.com/slthomason/freemesh/-/blob/master/README.md
[8]: https://opensource.com/sites/default/files/uploads/connecttorouter.png (FreeMesh setup step 1)
[9]: https://opensource.com/sites/default/files/uploads/setupcomplete.png (FreeMesh setup step 2)
[10]: https://opensource.com/sites/default/files/uploads/freemeshrealtimeload.png (Real-time load on FreeMesh network)
[11]: https://opensource.com/sites/default/files/uploads/freemeshwirelessoverview.png (Overview of FreeMesh network)
[12]: https://opensource.com/sites/default/files/uploads/openwrt.png (OpenWrt status report)
[13]: https://opensource.com/article/20/1/internet-speed-tests
