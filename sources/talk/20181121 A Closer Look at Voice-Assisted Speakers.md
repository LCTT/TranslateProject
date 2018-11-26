[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: subject: (A Closer Look at Voice-Assisted Speakers)
[#]: via: (https://www.linux.com/blog/2018/11/closer-look-voice-assisted-speakers)
[#]: author: (Eric Brown https://www.linux.com/users/ericstephenbrown)
[#]: url: ( )

A Closer Look at Voice-Assisted Speakers
====== 

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/anavi-elc.png?itok=vN-QXvJf)

U.S. consumers are expected to drop a bundle this Black Friday on smart speakers and home hubs. A Nov. 15 [Canalys report][1] estimates that shipments of voice-assisted speakers grew 137 percent in Q3 2018 year-to-year and are on the way to 75 million-unit sales in 2018. At the recent [Embedded Linux Conference and Open IoT Summit][2] in Edinburgh, embedded Linux developer and [Raspberry Pi HAT][3] creator Leon Anavi of the Konsulko Group reported on the latest smart speaker trends.

As Anavi noted in his “Comparison of Voice Assistant SDKs for Embedded Linux Devices” talk, conversing with computers became a staple of science fiction over half a century ago. Voice technology is interesting “because it combines AI, big data, IoT, and application development,” said Anavi.

In Q3 2017, Amazon and Google owned the industry with 74.7 percent and 24.6 percent, respectively, said Canalys. A year later, the percentages were down to 31.9 and 29.8. China-based Alibaba and Xiaomi almost equally split another 21.8 percent share, followed by 17.4 percent for “others,” which mostly use Amazon Alexis, and increasingly, Google Assistant.

Despite the success of the mostly Linux-driven smart speaker market, Linux application developers have not jumped into voice app development in the numbers one might expect. In part, this is due to reservations about Google and [Amazon privacy safeguards][4], as well as the proprietary nature of the hardware and cloud software.

“Privacy is a concern with smart speakers,” said Anavi. “You can’t fully trust a corporation if the product is not open source.”

Anavi summarized the Google and Amazon SDKs but spent more time on the fully open source Mycroft Mark. Although Anavi clearly prefers Mycroft, he encouraged developers to investigate all the platforms. “There is a huge demand in the market for these devices and a lot of opportunity for IoT integration, from writing new skills to integrating voice assistants in consumer electronics devices,” said Anavi.

### Alexa/Echo

Amazon’s Alexa debuted in the Echo smart speaker four years ago. Amazon has since expanded to the Echo branded Dot, Spot, Tap, and Plus speakers, as well as the Echo Show and new [Echo Show 2][5] display hubs.

The market leading Echo devices run on Amazon’s Linux- and Android-based Fire OS. The original Echo and Dot ran on the Cortex-A8-based TI DM3725 SoC while more recent devices have moved to an Armv8 MediaTek MT8163V SoC with 256MB RAM and 4GB flash.

Thanks to Amazon’s wise decision to release an Apache 2.0 licensed Alexa Voice Services (AVS) SDK, Alexa also runs on most third-party hubs. The SDK includes an Alexa Skills Kit for creating custom Skills. The cloud platform required to make Alexa devices work is not open source, however, and commercial vendors must sign an agreement and undergo a certification process.

Alexa runs on a variety of hardware [including the Raspberry Pi][6], as well as smart devices ranging from the Ecobee4 Smart Thermostat to the LG Hub Robot. Microsoft recently began [selling Echo devices][7], and earlier this year partnered with Amazon to integrate Alexa with its own Cortana voice agent in devices. This week, Microsoft announced that users can [voice-activate Skype calls][8] via Alexa on Echo devices.

### Google Assistant/Home

The Google Assistant voice agent debuted on the Google Home smart speaker in 2016. It has since expanded to the Echo Dot-like Home Mini, which like the Home runs on a 1.2GHz dual-core Cortex-A7 Marvell Armada 1500 Mini Plus with 512MB RAM and 4GB flash. This year’s [Home Max][9] offered improved speakers and advanced to a 1.5GHz, quad-core Cortex-A53 processor. More recently, Google launched the touchscreen enabled [Google Home Hub][10].

The Google Home devices run on a version of the Linux-based Google Cast OS. Like Alexa, the Python driven [Google Assistant SDK][11] lets you add the voice agent to third-party devices. However, it’s still in preview stage and lacks an open source license. Developers can create applications with [Google Actions][12].

Last year, Google [launched][13] a version of its Google Assistant SDK for the Raspberry Pi 3 and began selling an [AIY Voice Kit][14]</a> that runs on the Pi. There’s also a kit that runs on the Orange Pi, said Anavi.

This year, Google has aggressively [courted hardware partners][15] to produce home hub devices that combine Assistant with Google’s proprietary [Android Things][16]. The devices run on a variety of Arm-based SoCs led by the Qualcomm SD212 Home Hub Platform.

The SDK expansion has resulted in a variety of third-party devices running Assistant, including the Lenovo Smart Display and the just released [LG XBOOM AI ThinQ WK9][17] touchscreen hubs. Sales of Google Home devices outpaced Echo earlier this year, although Amazon regained the lead in Q3, says Canalys.

Like Alexa, but unlike Mycroft, Google Assistant offers multilingual support. The latest version supports follow-up questions without having to repeat the activation word, and there’s a voice match feature that can recognize up to six users. A new Google Duplex feature accomplishes real-world tasks through natural phone conversations.

### Mycroft/Mark

Anavi’s favorite smart speaker is the Linux-driven, open source (Apache 2.0 and CERN) [Mycroft][18]. The Raspberry Pi based [Mycroft Mark 1][19] speaker was certified by the Open Source Hardware Association (OSHA).

The [Mycroft Mark II][20] launched on Kickstarter in January and has received $450,000 in funding. This Xilinx [Zynq UltraScale+ MPSoC][21] driven home hub integrates Aaware’s far-field [Sound Capture][22] technology. A [Nov. 15 update post][23] revealed that the Mark II will miss its December ship date.

Kansas City-based Mycroft has raised $2.5 million from institutional investors and is now seeking funding on [StartEngine][24]. Mycroft sees itself as a software company and is encouraging other companies to build the Mycroft Core platform and Mycroft AI voice agent into products. The company offers an enterprise server license to corporate customers for $1,500 a month, and there’s a free, Raspbian based [Picroft][25] application for the Raspberry Pi. A Picroft hardware kit is under consideration.

Mycroft promises that user data will never be saved without an opt-in (to improve machine learning algorithms), and that it will never be used for marketing purposes. Like Alexa and Assistant, however, it’s not available offline without a cloud service, a feature that would better ensure privacy. Anavi says the company is working on an offline option.

The Mycroft AI agent is enabled via a Python based Mycroft Pulse SDK, and a Mycroft Skills Manager is available for Skills development. Like Alexa and Assistant, Mycroft supports custom wake words. The new version uses its homegrown [Precise][26] wake-word listener technology in place of the earlier PocketSphinx. There’s also an optional device and account management stack called Mycroft Home.

For text-to-speech (TTS), Mycroft defaults to the open source [Mimic][27], which is co-developed with VocaliD. It also supports eSpeak, MaryTTS, Google TTS, and FATTS.

Mycroft lacks its own speech to-text (STT) engine, which Anavi calls “the biggest challenge for an open source voice assistant.” Instead, it defaults to Google STT and supports [IBM Watson STT][28] and [wit.ai][29].

Mycroft is collaborating with Mozilla on its open source [DeepSpeech][30] STT, an open source TensorFlow implementation of [Baidu’s DeepSpeech][31] platform. Baidu trails Alibaba and Xiaomi in the [Chinese voice assistant][32] market but is one of the fastest growing voice AI companies. Just as Alibaba uses its homegrown, Alexa-like AliGenie agent on its Tmall Genie speaker, Baidu loads its [speakers][33] with its DeepSpeech-driven [DuerOS][34] voice platform. Xiaomi has used Alexa and Cortana.

Mycroft is the most mature of several alternative voice AI projects that promise improved privacy safeguards. A recent [VentureBeat][35] article reported on emerging privacy-oriented technologies including [Snips][36] and [SoundHound][37].

Anavi concluded with some demo videos showing off his soothing, Bulgarian AI whisperer vocal style. “I try to be polite with these things,” said Anavi. “Someday they may rule the world and I want to survive.”

Anavi’s video presentation can be seen here:
<https://www.youtube.com/embed/_dF0cMr3Aag?enablejsapi=1>

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/2018/11/closer-look-voice-assisted-speakers

作者：[Eric Brown][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/ericstephenbrown
[b]: https://github.com/lujun9972
[1]: https://www.canalys.com/newsroom/amazon-reclaims-top-spot-in-smart-speaker-market-in-q3-2018
[2]: https://events.linuxfoundation.org/events/elc-openiot-europe-2018/
[3]: http://linuxgizmos.com/phat-adds-ir-to-the-raspberry-pi/
[4]: https://qz.com/1288743/amazon-alexa-echo-spying-on-users-raises-a-data-privacy-problem/
[5]: https://www.techadvisor.co.uk/review/digital-home/amazon-echo-show-2-3685964/
[6]: https://www.linux.com/news/event/open-source-summit-na/2017/3/add-skills-your-raspberry-pi-alexa
[7]: https://www.theverge.com/2018/11/17/18099978/microsoft-store-amazon-echo-devices
[8]: https://www.engadget.com/2018/11/19/alexa-can-now-make-skype-calls/
[9]: https://store.google.com/us/product/google_home_max?hl=en-US
[10]: https://arstechnica.com/gadgets/2018/10/google-home-hub-under-the-hood-its-nothing-like-other-google-smart-displays/
[11]: https://developers.google.com/assistant/sdk/overview
[12]: https://developers.google.com/actions/
[13]: http://linuxgizmos.com/google-assistant-sdk-dev-preview-brings-voice-agent-to-the-raspberry-pi/
[14]: http://linuxgizmos.com/googles-updated-aiy-vision-and-voice-kits-ship-with-raspberry-pi-zero-wh/
[15]: http://linuxgizmos.com/android-things-and-google-assistant-appear-in-new-smart-speakers-smart-displays-and-coms/
[16]: https://www.linux.com/blog/2018/5/android-things-10-offers-free-ota-updates-restrictions
[17]: https://www.engadget.com/2018/11/20/lg-wk9-google-assistant-smart-speaker/
[18]: https://mycroft.ai/
[19]: http://linuxgizmos.com/open-source-echo-like-gizmo-is-halfway-to-kickstarter-gold/
[20]: http://linuxgizmos.com/open-source-voice-assistant-promises-user-privacy/
[21]: http://linuxgizmos.com/16nm-zynq-soc-mixes-cortex-a53-fpga-cortex-r5/
[22]: https://aaware.com/technology/
[23]: https://www.kickstarter.com/projects/aiforeveryone/mycroft-mark-ii-the-open-voice-assistant/posts/2344940
[24]: https://www.startengine.com/mycroft-ai
[25]: https://mycroft.ai/documentation/picroft/#hardware-prerequisites
[26]: https://mycroft.ai/documentation/precise/
[27]: https://mycroft.ai/documentation/mimic/
[28]: http://linuxgizmos.com/whipping-up-ibm-watson-voice-services-with-openwhisk/
[29]: https://wit.ai/
[30]: https://github.com/mozilla/DeepSpeech
[31]: http://research.baidu.com/Blog/index-view?id=90
[32]: https://www.cbinsights.com/research/china-voice-assistants-smart-speakers-ai/
[33]: https://www.theverge.com/ces/2018/1/8/16866068/baidu-smart-speakers-dueros-ces-2018
[34]: https://dueros.baidu.com/en/index.html
[35]: https://venturebeat.com/2018/07/14/alexa-alternatives-have-a-secret-weapon-privacy/
[36]: https://snips.ai/
[37]: https://soundhound.com/
