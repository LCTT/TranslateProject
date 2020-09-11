[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Beamforming explained: How it makes wireless communication faster)
[#]: via: (https://www.networkworld.com/article/3445039/beamforming-explained-how-it-makes-wireless-communication-faster.html)
[#]: author: (Josh Fruhlinger https://www.networkworld.com/author/Josh-Fruhlinger/)

Beamforming explained: How it makes wireless communication faster
======
Beamforming uses the science of electromagnetic interference to make Wi-Fi and 5G connections more precise.
Thinkstock

Beamforming is a technique that focuses a wireless signal towards a specific receiving device, rather than having the signal spread in all directions from a broadcast antenna, as it normally would. The resulting more direct connection is faster and more reliable than it would be without beamforming.

Although the principles of beamforming have been known since the 1940s, in recent years beamforming technologies have introduced incremental improvements in Wi-Fi networking. Today, beamforming is crucial to the [5G networks][1] that are just beginning to roll out.

[5G versus 4G: How speed, latency and application support differ][1]

### How beamforming works

A single antenna broadcasting a wireless signal radiates that signal in all directions (unless it's blocked by some physical object). That's the nature of how electromagnetic waves work. But what if you wanted to focus that signal in a specific direction, to form a targeted beam of electromagnetic energy? One technique for doing this involves having multiple antennas in close proximity, all broadcasting the same signal at slightly different times. The overlapping waves will produce interference that in some areas is _constructive_ (it makes the signal stronger) and in other areas is _destructive_ (it makes the signal weaker, or undetectable). If executed correctly, this beamforming process can focus your signal where you want it to go.

[][2]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][2]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

[][3] ojogabonitoo / Getty Images

The mathematics behind beamforming is very complex (the [Math Encounters blog][4] has an introduction, if you want a taste), but the application of beamforming techniques is not new. Any form of energy that travels in waves, including sound, can benefit from beamforming techniques; they were first developed to [improve sonar during World War II][5] and are [still important to audio engineering][6]. But we're going to limit our discussion here to wireless networking and communications.  

### Beamforming benefits and limitations

By focusing a signal in a specific direction, beamforming allows you deliver higher signal quality to your receiver — which in practice means faster information transfer and fewer errors — without needing to boost broadcast power. That's basically the holy grail of wireless networking and the goal of most techniques for improving wireless communication. As an added benefit, because you aren't broadcasting your signal in directions where it's not needed, beamforming can reduce interference experienced by people trying to pick up other signals.

The limitations of beamforming mostly involve the computing resources it requires; there are many scenarios where the time and power resources required by beamforming calculations end up negating its advantages. But continuing improvements in processor power and efficiency have made beamforming techniques affordable enough to build into consumer networking equipment.

### Wi-Fi beamforming routers: 802.11n vs. 802.11ac

Beamforming began to appear in routers back in 2008, with the advent of the [802.11n Wi-Fi standard][7]. 802.11n was the first version of Wi-Fi to support multiple-input multiple-output, or MIMO, technology, which beamforming needs in order to send out multiple overlapping signals. Beamforming with 802.11n equipment never really took off, however, because the spec doesn't lay out how beamforming should be implemented. A few vendors put out proprietary implementations that required purchasing matching routers and wireless cards to work, and they were not popular.

With the emergence of the [802.11ac standard][8] in 2016, that all changed. There's now a set of specified beamforming techniques for Wi-Fi gear, and while 802.11ac routers aren't required by the specification to implement beamforming, if they do (and almost all on the market now do) they do so in a vendor-neutral and interoperable way. While some offerings might tout branded names, such as D-Link's AC Smart Beam, these are all implementations of the same standard. (The even newer [802.11ax standard][9] continues to support ac-style beamforming.)

### Beamforming and MU-MIMO

Beamforming is key for the support of multiuser MIMO, or [MU-MIMO][10], which is becoming more popular as 802.11ax routers roll out. As the name implies, MU-MIMO involves multiple users that can each communicate to multiple antennas on the router. MU-MIMO [uses beamforming][11] to make sure communication from the router is efficiently targeted to each connected client.

### Explicit beamforming vs. implicit beamforming

There are a couple of ways that Wi-Fi beamforming can work. If both the router and the endpoint support 802.11ac-compliant beamforming, they'll begin their communication session with a little "handshake" that helps both parties establish their respective locations and the channel on which they'll communicate; this improves the quality of the connection and is known as _explicit_ beamforming. But there are still plenty of network cards in use that only support 802.11n or even older versions of Wi-Fi. A beamforming router can still attempt to target these devices, but without help from the endpoint, it won't be able to zero in as precisely. This is known as _implicit_ beamforming, or sometimes as _universal_ beamforming, because it works in theory with any Wi-Fi device.

In many routers, implicit beamforming is a feature you can turn on and off. Is enabling implicit beamforming worth it? The [Router Guide suggests][12] that you test how your network operates with it on and off to see if you get a boost from it. It's possible that devices such as phones that you carry around your house can see dropped connections with implicit beamforming.

### 5G beamforming

To date, local Wi-Fi networks is where the average person is most likely to encounter beamforming in the wild. But with the rollout of wide-area 5G networks now under way, that's about to change. 5G uses radio frequencies between 30 and 300 GHz, which can transmit data much more quickly but are also much more prone to interference and encounter more difficulty passing through physical objects. A host of technologies are required to overcome these problems, including smaller cells, massive MIMO — basically cramming tons of antennas onto 5G base stations — and, yes, [beamforming][13]. If 5G takes off in the way that vendors are counting on, the time will come soon enough when we'll all be using beamforming (behind the scenes) every day.

**Learn more about wireless networking**

  * [How to determine if Wi-Fi 6 is right for you][14]
  * [What is 5G? How is it better than 4G?][13]
  * [Cisco exec details how Wi-Fi 6 and 5G will fire-up enterprises][15]
  * [Wi-Fi 6 is coming to a router near you][16]
  * [Wi-Fi analytics get real][17]



Join the Network World communities on [Facebook][18] and [LinkedIn][19] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3445039/beamforming-explained-how-it-makes-wireless-communication-faster.html

作者：[Josh Fruhlinger][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Josh-Fruhlinger/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3330603/5g-versus-4g-how-speed-latency-and-application-support-differ.html
[2]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE20773&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[3]: https://images.idgesg.net/images/article/2019/10/nw_wifi_router_traditional-and-beamformer_foundational_networking_internet-100814037-orig.jpg
[4]: https://www.mathscinotes.com/2012/01/beamforming-math/
[5]: https://apps.dtic.mil/dtic/tr/fulltext/u2/a250189.pdf
[6]: https://www.mathworks.com/company/newsletters/articles/making-all-the-right-noises-shaping-sound-with-audio-beamforming.html
[7]: https://www.networkworld.com/article/2270718/the-role-of-beam-forming-in-11n.html
[8]: https://www.networkworld.com/article/3067702/mu-mimo-makes-wi-fi-better.html
[9]: https://www.networkworld.com/article/3258807/what-is-802-11ax-wi-fi-and-what-will-it-mean-for-802-11ac.html
[10]: https://www.networkworld.com/article/3250268/what-is-mu-mimo-and-why-you-need-it-in-your-wireless-routers.html
[11]: https://www.networkworld.com/article/3256905/13-things-you-need-to-know-about-mu-mimo-wi-fi.html
[12]: https://routerguide.net/enable-beamforming-on-or-off/
[13]: https://www.networkworld.com/article/3203489/what-is-5g-how-is-it-better-than-4g.html
[14]: https://www.networkworld.com/article/3356838/how-to-determine-if-wi-fi-6-is-right-for-you.html
[15]: https://www.networkworld.com/article/3342158/cisco-exec-details-how-wi-fi-6-and-5g-will-fire-up-enterprises-in-2019-and-beyond.html
[16]: https://www.networkworld.com/article/3311921/mobile-wireless/wi-fi-6-is-coming-to-a-router-near-you.html
[17]: https://www.networkworld.com/article/3305583/wi-fi/wi-fi-analytics-get-real.html
[18]: https://www.facebook.com/NetworkWorld/
[19]: https://www.linkedin.com/company/network-world
