[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to choose a wireless protocol for home automation)
[#]: via: (https://opensource.com/article/20/11/wireless-protocol-home-automation)
[#]: author: (Steve Ovens https://opensource.com/users/stratusss)

How to choose a wireless protocol for home automation
======
Which of the three dominant wireless protocols used in home
automation—WiFi, Z-Wave, and Zigbee—is right for you? Consider the
options in part three of this series.
![Digital images of a computer desktop][1]

In the second article in this series, I talked about [local control vs. cloud connectivity][2] and some things to consider for your home automation setup.

In this third article, I will discuss the underlying technology for connecting devices to [Home Assistant][3], including the dominant protocols that smart devices use to communicate and some things to think about before purchasing smart devices.

### Connecting devices to Home Assistant

Many different devices work with Home Assistant. Some connect through a cloud service, and others work by communicating with a central unit, such as a [SmartThings Hub][4], that Home Assistant communicates with. And still others have a facility to communicate over your local network.

For a device to be truly useful, one of its key features must be wireless connectivity. There are currently three dominant wireless protocols that smart devices use: WiFi, Z-Wave, and Zigbee. I'll do a quick breakdown of each including their pros and cons.

**A note about wireless spectra:** Spectra are measured in hertz (Hz). A gigahertz (GHz) is 1 billion Hz. In general, the larger the number of Hz, the more data can be transmitted and the faster the connection. However, higher frequencies are more susceptible to interference and do not travel very well through solid objects. Lower frequencies can travel further and pass through solid objects more readily, but the trade-off is they cannot send much data.

### WiFi

[WiFi][5] is the most widely known of the three standards. These devices are the easiest to get up and running if you are starting from scratch. This is because almost everyone interested in home automation already has a WiFi router or an access point. In fact, in most countries in the western world, WiFi is considered almost on the same level as running water; if you go to a hotel, you expect a clean, temperature-controlled room with a WiFi password provided at check-in.

Therefore, Internet of Things (IoT) devices that use the WiFi protocol require no additional hardware to get started. Plug in the new device, launch a vendor-provided application or a web browser, enter your credentials, and you're done.

It's important to note that almost all moderate- to low-priced IoT devices use the 2.4GHz wireless spectrum. Why does this matter? Well, 2.4GHz has been around so long that virtually all devices—from cordless phones to smart bulbs—use this spectrum. In most countries, there are generally only about a dozen channels that off-the-shelf devices can broadcast and receive on. Like overloading a cell tower when too many users attempt to make phone calls during an emergency, channels can become overcrowded and susceptible to outside interference.

While well-behaving smart devices use little-to-no bandwidth, if they struggle to send/receive messages due to overcrowding on the spectrum, your automation will have mixed results. A WiFi access point can only communicate with one client at a time. That means the more devices you have on WiFi, the greater the chance that someone on the network will have to wait their turn to communicate.

**Pros:**

  * Ubiquitous
  * Tend to be inexpensive
  * Easy to set up
  * Easy to extend the range
  * Uses existing network
  * Requires no hub



**Cons:**

  * Can suffer from interference from neighboring devices or adjacent networks
  * Uses the most populated 2.4GHz spectrum
  * Your router limits the number of devices
  * Uses more power, which means less or no battery-powered devices
  * Has the potential to impact latency-sensitive activities like gaming over WiFi
  * Most off-the-shelf products require an internet connection



### Z-Wave

[Z-Wave][6] is a closed wireless protocol controlled and maintained by a company named Zensys. Because it is controlled by a single entity, all devices are guaranteed to work together. There is one standard and one implementation. This means that you never have to worry about which device you buy from which manufacturer; they will always work.

Z-Wave operates in the 0.9GHz spectrum, which means it has the largest range of the popular protocols. A central hub is required to coordinate all the devices on a Z-Wave ecosystem. Z-Wave operates on a [mesh network][7] topology, which means that every device acts as a potential repeater for other devices. In theory, this allows a much greater coverage area. Z-Wave limits the number of "hops" to 4. That means that, in order for a signal to get from a device to a hub, it can only travel through four devices. This could be a positive or a negative, depending on your perspective. 

On the one hand, it reduces the ecosystem's maximum latency by preventing packets from traveling through a significant number of devices before reaching the destination. The more devices a signal must go through, the longer it can take for devices to become responsive.

On the other hand, it means that you need to be more strategic about providing a good path from your network's extremities back to the hub. Remember, the lower frequency that enables greater distance also limits the speed and amount of data that can be transferred. This is currently not an issue, but no one knows what size messages future smart devices will want to send.

**Pros:**

  * Z-Wave compatibility guaranteed
  * Form mesh network 
  * Low powered and can be battery powered
  * Mesh networks become more reliable with more devices
  * Uses 0.9GHz and can transmit up to 100 meters
  * Least likely of the three to have signal interference from solid objects or external sources



**Cons:**

  * Closed protocol
  * Costs the most
  * Maximum of four hops in the mesh
  * Can support up to 230 devices per network
  * Uses 0.9GHz, which is the slowest of all protocols



### Zigbee

Unlike Z-Wave, [Zigbee][8] is an open standard. This can be a pro or a con, depending on your perspective. Because it is an open standard, manufacturers are free to alter the implementation to suit their products. To borrow an analogy from one of my favorite YouTube channels, [The Hook Up][9], Zigbee is like going through a restaurant drive-through. Having the same standard means you will always be able to speak to the restaurant and they will be able to hear you. However, if you speak a different language than the drive-through employee, you won't be able to understand each other. Both of you can speak and hear each other, but the meaning will be lost.

Similarly, the Zigbee standard allows all devices on a Zigbee network to "hear" each other, but different implementations mean they may not "understand" each other. Fortunately, more often than not, your Zigbee devices should be able to interoperate. However, there is a non-trivial chance that your devices will not be able to understand each other. When this happens, you may end up with multiple networks that could interfere with each other.

Like Z-Wave, Zigbee employs a mesh network topology but has no limit to the number of "hops" devices can use to communicate with the hub. This, combined with some tweaks to the standard, means that Zigbee theoretically can support more than 65,000 devices on a single network.

**Pros:**

  * Open standard
  * Form mesh network
  * Low-powered and can be battery powered
  * Can support over 65,000 devices
  * Can communicate faster than Z-Wave



**Cons:**

  * No guaranteed compatibility
  * Can form separate mesh networks that interfere with each other
  * Uses the oversaturated 2.4GHz spectrum
  * Transmits only 10 to 30 meters



### Pick your protocol

Perhaps you already have some smart devices. Or maybe you are just starting to investigate your options. There is a lot to consider when you're buying devices. Rather than focusing on the lights, sensors, smart plugs, thermometers, and the like, it's perhaps more important to know which protocol (WiFi, Z-Wave, or Zigbee) you want to use.

Whew! I am finally done laying home automation groundwork. In the next article, I will show you how to start the initial installation and configuration of a Home Assistant virtual machine.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/wireless-protocol-home-automation

作者：[Steve Ovens][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/stratusss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_browser_web_desktop.png?itok=Bw8ykZMA (Digital images of a computer desktop)
[2]: https://opensource.com/article/20/11/cloud-vs-local-home-automation
[3]: https://opensource.com/article/20/11/home-assistant
[4]: https://www.smartthings.com/
[5]: https://en.wikipedia.org/wiki/Wi-Fi
[6]: https://www.z-wave.com/
[7]: https://en.wikipedia.org/wiki/Mesh_networking
[8]: https://zigbeealliance.org/
[9]: https://www.youtube.com/channel/UC2gyzKcHbYfqoXA5xbyGXtQ
