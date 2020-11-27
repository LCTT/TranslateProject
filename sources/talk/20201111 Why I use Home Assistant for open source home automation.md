[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Why I use Home Assistant for open source home automation)
[#]: via: (https://opensource.com/article/20/11/home-assistant)
[#]: author: (Steve Ovens https://opensource.com/users/stratusss)

Why I use Home Assistant for open source home automation
======
Home automation can be a slippery slope. The right open source tools can
get you on firmer footing.
![Houses in a row][1]

Home automation is a slippery slope; you have been warned! In this multipart series, I will discuss home automation using the open source project Home Assistant. This introductory article will cover my journey to [Home Assistant][2], what the application does, and why it's important.

### How my journey began

Some time ago, when I set out on this journey, my goal was not lofty. I was solving a need. You see, I have a fairly sizable [homelab][3]. Nothing on the scale of some notable YouTubers, but I have eight machines ranging from 16GB RAM all the way up to 96GB. I have a Netgear 10G Ethernet switch as the backbone of my networking infrastructure. However, I have a small problem. Every once in a while, this switch's state table fills up, and then it crashes, taking the network with it. This is a known issue with this model (although it was not known to me ahead of time). The only way to resolve the issue, without replacing the switch, is to power it off for a few seconds and then power it back on.

This would not seem like a big deal. Especially because I live in an apartment, so I don't even have to travel up or down a flight of stairs to do this. However, I work for Red Hat as a senior OpenShift consultant, which means I am often on the road (at least pre-COVID). I use my lab almost every day for work-related activities, and my family uses the network as well for things like playing games, watching our Blu-ray collection, etc. So, it's a giant pain to have the network go down when I don't have physical access. My solution was to get a smart plug and join it to a completely different network with nothing else on it, completely firewalled off from other equipment. If the Netgear switch needs to be rebooted, I should be able to access the smart plug remotely to reboot the switch.

### My journey away from the cloud

Being privacy-conscious, perhaps bordering on the tinfoil hat breed, I am immediately uncomfortable with a "cloud"-connected anything. We run [Plex][4], [Kodi][5], [Nextcloud][6], and a host of other services because, well, I am "that guy." But I'm not "anti-cloud." In fact, a large part of my day job is working with the big three: AWS, Google Compute, and Azure. But when it comes to standing up services that I rely on, I have an almost irrational need to host things locally.

After doing a significant amount of digging and speaking to my coworker Alex Kretzschmar (who also hosts the [Self-Hosted][7] podcast), I discovered alternative firmware projects, such as [Tasmota][8] and [ESPHome][9], available for certain wireless chipsets. I'll cover the different chipsets and protocols (Zigbee, WiFi, Z-Wave, and the like) in a future article, but suffice it to say, you are not stuck buying products that are dependent on the cloud. There are online stores such as [CloudFree][10] that sell devices pre-flashed with Tasmota. There are even companies like [Shelly][11] that produce high-quality products with an optional cloud component, but the buyer maintains local control.

Anyway, back to my story. I bought a plug, flashed the firmware to run Tasmota, and remotely power-cycled my switch on occasion, and that was the end of it, right? Well, if it was, I imagine I would not be writing this article. I currently have 43 Internet of Things (IoT) devices—from sensors I built to smart bulbs, smart LED strips, infrared blasters, and more. Remember how I said home automation is a slippery slope?

Did I mention that I have had virtually no experience with soldering, electronic theory/repairs, or anything remotely related to home automation? In fact, outside of Linux and related technology, I am one of the least "handy" people I know. Sure, I can punch a hole in a wall or put some screws in a board, but up to the age of 30, the only tools that I ever owned were a Dremel and some screwdrivers for installing computer components.

Why mention this? So you understand exactly how far behind square one I was when I started. If I can take this on, so can you!

### Centralized local control

Great, I have a ton of IoT devices, and I can toggle things on and off from a phone. For a while, I was satisfied with simply calling up the Tasmota web UI and using its sparse but functional controls.

![Tasmota user interface][12]

(Steve Ovens, [CC BY-SA 4.0][13])

Even my wife, God bless her willingness and patience while I constantly learned and attempted new things, got used to using the Tasmota interface. After a while, as the number of devices grew, this method of managing things became untenable and did not scale well at all.

I began to poke around to learn how other people were managing their "smart homes." Let's be honest; at this point, it wasn't a smart home as much as a small but growing number of lights we could remotely control.

The big open source projects in this area are [openHAB][14] and [Home Assistant][15]. This series won't compare them in any manner. Partly, it's because I am not qualified for this, as I have only been using Home Assistant for the last year or so, but also because for me to feel comfortable making such a comparison, I would have to set up openHAB as a drop-in replacement and, frankly, I have too much invested in Home Assistant to explore this avenue.

### About Home Assistant

You may be wondering what Home Assistant is and what it has to offer. Imagine a house that reacts to its inhabitants, like in sci-fi movies. Perhaps you have a couple of bedside lamps, a TV, some floor lighting, a fan, and a few other gizmos in your bedroom. As you walk into the bedroom, the lights turn on. Big deal, you say; we have had this technology for some time. Of course, you are right. But what if it's late and your significant other is already in bed? You might be in for a rather cold greeting if the lights come on as you enter the bedroom. Yikes!

What if, instead, when you walk into the room at night, the floor LED lights turn on to a soft glow—enough so that you can move around without killing yourself but not bright enough to wake a sleeping partner. You climb into bed, and a few minutes later, the floor lighting turns off. This is what Home Assistant can do for you.

"But wait!" I hear you screaming at your monitor. "I can just ask Alexa or Google to turn off my lights for me." You're correct again, of course. However, what happens when these services suffer some sort of disruption? Also, you may need to consider how loudly you need to speak to trigger the listening device. And remember that thing I said about privacy? Do you really want these big companies to learn your habits? Even discarding the privacy issue, consider that others may use your home as well. This means visitors need to know what commands you have available for controlling your smart devices.

Lots of "smart" products on the market can set timers, schedules, and scenes, but none of them can really _react_ to any given situation. This is where a home automation hub like Home Assistant comes into play.

At its core, Home Assistant is software that helps centralize all of the sensors, gizmos, and gadgets you have in your home. With all of these products working together in concert, you can set all kinds of conditions that would not otherwise be possible.

Has someone entered the room? Is it a certain time of the day? Is the room warmer than a certain value? Is someone in bed? All of these data points are of limited use on their own, but together, you can use them to set the brightness of a light at dusk, turn a fan on because it's above 26ºC (80ºF) in the room, but don't turn on Steve's desk lamp because his side of the bed is occupied.

If you can imagine it, you can accomplish it using Home Assistant and the right sensor inputs.

### Sustainable and open source

One thing I like about Home Assistant is that it seems to be reaching a critical mass of adoption from various vendors. But more important to me is that the company behind it, [Nabu Casa][16], creates a focal point for the community. The company hired developers directly from the community, and it does not penalize you if you don't pay a monthly fee. The revenue Nabu Casa generates comes from value-added items, like being able to access your local Home Assistant easily and from anywhere in the world.

This is important because it means that there is a path forward for the project, and it has a sustainable income for future development. Unlike "open core" models, Home Assistant is fully open source, which means that if the community disagrees strongly enough with Nabu Casa's direction, it could fork Home Assistant at its current state and take a divergent path. Because my family has chosen to make this piece of software integral to how we interact with our devices, that Home Assistant has a revenue stream and is fully open source are invaluable to me.

In the next article, I will discuss some of the common standards for IoT devices as well as the benefits of local control. Future articles will walk through the basics of installing Home Assistant, setting up essential add-ons (e.g., MQTT), Node-RED, the Community Store, making backups, and more.

In the meantime, comment or [tweet][17] at me if you would like to explore something specific in-depth. If I have used it, I can talk about it.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/home-assistant

作者：[Steve Ovens][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/stratusss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/house_home_colors_live_building.jpg?itok=HLpsIfIL (Houses in a row)
[2]: https://www.home-assistant.io/
[3]: https://opensource.com/article/19/3/home-lab
[4]: https://www.plex.tv/
[5]: https://opensource.com/article/19/1/manage-your-media-kodi
[6]: https://nextcloud.com/
[7]: https://selfhosted.show/
[8]: https://tasmota.github.io/docs/
[9]: https://esphome.io/
[10]: https://cloudfree.shop/
[11]: https://shelly.cloud/
[12]: https://opensource.com/sites/default/files/uploads/tasmota_ui.png (Tasmota user interface)
[13]: https://creativecommons.org/licenses/by-sa/4.0/
[14]: https://www.openhab.org/
[15]: https://opensource.com/article/18/3/smart-home-assistant
[16]: https://www.nabucasa.com/
[17]: https://twitter.com/linuxovens
