[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Cloud control vs local control: What to choose for your home automation)
[#]: via: (https://opensource.com/article/20/11/cloud-vs-local-home-automation)
[#]: author: (Steve Ovens https://opensource.com/users/stratusss)

Cloud control vs local control: What to choose for your home automation
======
Cloud may be more convenient, but local control gives you more privacy
and other options in your Home Assistant ecosystem.
![clouds in windows][1]

There are a lot of factors to consider when investing in a home automation ecosystem. In my first article in this series, I explained [why I picked Home Assistant][2], and in this article, I'll explain some of the foundational issues and technologies in home automation, which may influence how you approach and configure your Internet of Things (IoT) devices.

### Cloud connectivity

Most devices you can buy today are tied to some type of cloud service. While the cloud brings a certain level of convenience, it also opens a host of problems. For starters, there are privacy issues related to a company having access to your personal habits—when you are home, what shows you watch, what time you go to bed, etc. Although most people are not as concerned about these issues as I am, privacy should still be a consideration, even if it is a small one.

Cloud access also creates issues around being reliant on something outside your control. In 2019, Sonos came under fire for [remotely bricking][3] older smart speakers. Speakers usually continue to work for years after their warranty ends; in fact, they usually function until they physically break. There's also the case of Automatic, which produced a cloud-based car tracker. When it announced in May 2020 that it would be [shutting down][4] its services, it advised customers to "please discard your adapter by following standard electronic recycling procedures."

Being dependent on a third-party provider for critical functionality can come back to bite you. [IFTTT][5], a popular service for programming events based on external conditions, recently altered its free plan's [terms and conditions][6] to severely limit the number of events you can create—from an unlimited number to three. This is even though IFTTT charges device manufacturers for certification with its system, which allows products like [Meross smart bulbs][7] to proudly display their compatibility with IFTTT.

![Meross screenshot from Amazon][8]

(Amazon screenshot by Steve Ovens, [CC BY-SA 4.0][9])

Some of these decisions are purely financial, but there are more than a few anecdotal cases where a company blocks a person's access to a device they purchased simply because they [did not like what the user said][10] about them. How crazy is that?

Another consideration with cloud connectivity is a device's responsivity if its signals must travel from your home to a cloud server (which may be halfway around the world) and then back to the device. This can lead to a two-second (or more) delay on any action. For some people, this is not a deal-breaker. For others, that delay is unbearable.

Finally, what happens if there is an internet outage? While most modern home internet connections are quite reliable, they do happen. [Some large][11], well-known cloud [service providers][12] have experienced outages this year. Are you OK trading convenience for possibly having your automations break and losing control of your smart devices for periods of time?

### Local control

There are several ways you can regain control over your smart devices. Commercially, you could try something like [Hubitat][13], which is a proprietary platform that emphasizes local control. I have no experience with these devices, as I don't like to rely on an intermediary.

In my home, I standardized on WiFi (although I may branch out to [Zigbee][14] in the future) and [Home Assistant][15]. Using WiFi means I need to buy or make my devices based on their compatibility with alternative open source firmware, such as [Tasmota][16] or [ESPHome][17]. I admit that neither of these options is "plug-and-play friendly" unless you buy devices from sources like [Shelly][18], which is very friendly to the community, or [CloudFree][19], which has Tasmota installed by default.

(As a small aside, I have both flashed my own devices and purchased them from CloudFree. There are some savings with the DIY approach, but I buy pre-flashed devices for my father's house because this eliminates a lot of hassle.)

I won't go into more detail about alternative firmware, how to flash it, and so on. I simply want to introduce you to the idea that there are options for local control.

### Achieving local control with MQTT

A local control device probably uses either a direct [API][20] call, where Home Assistant talks directly to the device, or Message Queuing Telemetry Transport ([MQTT][21]).

MQTT is one of the most widely used protocols for local IoT communication. I'll share some of the basics, but the Hook Up has an [in-depth video][22] you can watch if you want to learn more, and HiveMQ has an [entire series][23] on MQTT essentials.

MQTT uses three components for communication. The first, the **sender**, is the component that triggers the action. The second, the **broker**, is kind of like a bulletin board where messages are posted. The final component is the **device** that will perform the action. This process is called the _publish-subscribe_ model.

Say you have a button on the wall that you want to use to turn on the projector, lower the blinds, and turn on a fan. The button (sender) posts the _message_ **ON** to a specific section of the broker, called a _topic_. The topic might be something like `/livingroom/POWER`. The fan, the projector, and the blinds _subscribe_ to this topic. When the message **ON** is posted to the topic, all of the devices activate their respective functions, turning on the projector, lowering the blinds, and starting the fan.

Unlike a message board, messages have different Quality of Service (QoS) states. The HiveMQ website has a good explanation of the [three QoS levels][24]. In short:

  * **QoS 0:** The message is sent to the broker in a fire-and-forget way. No attempt is made to verify that the broker received the message.



![MQTTT QoS 0][25]

(© 2015 [HiveMQ][24], reused with permission)

  * **QoS 1**: The message is posted, and the broker replies once the message is received. Multiple messages can be sent before the broker replies. For example, if you are trying to raise the projector's brightness, multiple brightness bars may be inadvertantly adjusted before the broker tells the sender to stop publishing messages.



![MQTTT QoS 1][26]

(© 2015 [HiveMQ][24], reused with permission)

  * **QoS 2:** This is the slowest but safest level. It guarantees that the message is received only once. Similar to TCP, if a message is lost, the sender will resend the message.



![MQTTT QoS 2][27]

(© 2015 [HiveMQ][24], reused with permission)

In addition, MQTT has a **retain** flag that can be enabled on the messages, but it is not set by default. Going back to the bulletin board analogy, it's like if someone posts a message to a bulletin board, but another person walks up to the board, takes the message down, reads it, and throws it away. If a third person looks at the bulletin board five minutes later, they would have no knowledge of the message. However, if the **retain** flag is set to true, it's like leaving the message pinned on the board until a new message is received. This means that no matter when people come to read messages, they will all know the latest message.

In home automation terms, whether or not the **retain** flag is set depends completely on the use case.

In this series, I will use Home Assistant's [Mosquitto MQTT broker][28] add-on. Most of my devices use MQTT; however, I do have a couple of non-critical Tuya devices that require a cloud account. I may replace them with locally controllable ones in the future.

### Wrapping up

Home Assistant is a large, wonderful piece of software. It is complex in some areas, and it will help you to be familiar with these fundamental technologies when you need to troubleshoot and coordinate your setup.

In the next article, I will talk about the "big three" wireless protocols that you are likely to encounter in smart devices: Zigbee, Z-Wave, and WiFi. Don't worry—I'm almost done with the underlying theories, and soon I'll get on with installing Home Assistant.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/cloud-vs-local-home-automation

作者：[Steve Ovens][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/stratusss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cloud-windows-building-containers.png?itok=0XvZLZ8k (clouds in windows)
[2]: https://opensource.com/article/20/11/home-assistant
[3]: https://www.bbc.com/news/technology-51768574
[4]: https://www.cnet.com/roadshow/news/automatic-connected-car-service-dead-may-coronavirus/
[5]: https://ifttt.com/
[6]: https://ifttt.com/plans
[7]: https://www.amazon.ca/meross-Dimmable-Equivalent-Compatible-Required/dp/B07WN2J3C7
[8]: https://opensource.com/sites/default/files/uploads/ifttt_add.png (Meross screenshot from Amazon)
[9]: https://creativecommons.org/licenses/by-sa/4.0/
[10]: https://www.techrepublic.com/article/iot-company-bricks-customers-device-after-negative-review/
[11]: https://www.theverge.com/2020/9/28/21492688/microsoft-outlook-office-teams-azure-outage-down
[12]: https://www.cnn.com/2020/08/30/tech/internet-outage-cloudflare/index.html
[13]: https://hubitat.com/
[14]: https://zigbeealliance.org/
[15]: https://www.home-assistant.io/
[16]: https://tasmota.github.io/docs/
[17]: https://esphome.io/
[18]: https://shelly.cloud/
[19]: https://cloudfree.shop/
[20]: https://en.wikipedia.org/wiki/API
[21]: https://en.wikipedia.org/wiki/MQTT
[22]: https://www.youtube.com/watch?v=NjKK5ab0-Kk
[23]: https://www.hivemq.com/tags/mqtt-essentials/
[24]: https://www.hivemq.com/blog/mqtt-essentials-part-6-mqtt-quality-of-service-levels/
[25]: https://opensource.com/sites/default/files/uploads/ha-config8-qos0.png (MQTTT QoS 0)
[26]: https://opensource.com/sites/default/files/uploads/ha-config8-qos1.png (MQTTT QoS 1)
[27]: https://opensource.com/sites/default/files/uploads/ha-config9-qos2.png (MQTTT QoS 2)
[28]: https://mosquitto.org/
