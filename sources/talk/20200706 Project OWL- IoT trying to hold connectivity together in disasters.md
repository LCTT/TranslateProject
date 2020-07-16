[#]: collector: (lujun9972)
[#]: translator: (Yufei-Yan)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Project OWL: IoT trying to hold connectivity together in disasters)
[#]: via: (https://www.networkworld.com/article/3564980/project-owl-iot-trying-to-hold-connectivity-together-in-disasters.html)
[#]: author: (Jon Gold https://www.networkworld.com/author/Jon-Gold/)

Project OWL: IoT trying to hold connectivity together in disasters
======
IoT devices configured in a wireless mesh network can be quickly deployed to provide basic connections when natural disasters knock out traditional communications links.
[AK Badwolf][1] [(CC BY 2.0)][2]

An open source project centered on mesh networking, [IoT][3] and LoRa connectivity could help emergency responders and victims stay in contact in the wake of natural disasters, said the head of Project OWL at the recent Open Source Summit.

Project OWL’s target is the disruption in communications that often follows natural disaster. Widespread outages, in both cellular and wired networks, frequently impede the flow of information about emergency services, supplies and a host of other critical concerns that have to be addressed in the wake of a major storm or other catastrophe.

**Learn about 5G and WiFi 6**

  * [How to determine if WiFi 6 is right for you][4]
  * [What is MU-MIMO? Why do you need it in your wireless routers?][5]
  * [When to use 5G, when to use WiFi 6][6]
  * [How enterprises can prep for 5G networks][7]



It does this with an army of “ducks” – small wireless modules that are cheap, simple-to-deploy and don’t require the support of existing infrastructure. Some ducks are solar-powered, others have long-lasting batteries. A duck is equipped with a LoRa radio for communication with other ducks on the network, as well as with Wi-Fi and perhaps Bluetooth or GPS for additional functionality.

The idea is that, when networks are down, users can use their smartphones or laptops to make a [Wi-Fi][8] connection to a duck, which can relay small pieces of information to the rest of the network. Information propagates back along the network until it reaches a “Papaduck,” which is equipped with a satellite connection to the OWL data management system in the cloud. (OWL stands for “organization, whereabouts, and logistics.”) From the cloud, the information can be visualized on a smartphone or web app, or even plugged into existing systems via an API.

The secret sauce is in the ClusterDuck Protocol, the open source firmware that keeps  information flowing even when some modules on the network aren’t functional. It’s designed to work on a wide range of cheap and easily accessed computing hardware – Raspberry Pis and the like – in order to make it easy to set up a ClusterDuck network quickly.

The project was prompted, according to founder Bryan Knouse, by the devastating hurricanes of 2017 and 2018, and the huge difficulties faced by affected communities in responding to them without adequate communications.

“A few of our founding members had been through these disasters, and we asked ‘what do we do about this?’” he said.

The project has a cohort of students and professors at the University of Puerto Rico in Mayaguez, and most of the testing of the system happened there. Knouse said there are currently 17 solar-powered ducks nesting on rooftops and trees around campus, with plans to add more.

“This relationship created an open-source community on the ground, these students and profs are helping us develop this,” he said.

Join the Network World communities on [Facebook][9] and [LinkedIn][10] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3564980/project-owl-iot-trying-to-hold-connectivity-together-in-disasters.html

作者：[Jon Gold][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Jon-Gold/
[b]: https://github.com/lujun9972
[1]: https://www.flickr.com/photos/spiderkat/8487309555/in/photolist-dVZFrn-dDctnA-8WuLez-6RBSHn-bQa5F8-syyFcV-rvxKJT-5bSAh-2Xey4-3D4xww-4t1ZYv-dMgY7k-mHeMk1-xsPw6B-EiD3UR-k1rNkD-atorAv-f58MG9-g2QCe-Zr1wAC-ewx5Px-6vrwz7-8CCPSd-hAC5HZ-aHJC1B-9ovTST-Wqj4Sk-fiJjWG-28ATb9y-6tHHiR-8VZrmy-8iUVNB-DzSQV5-j6gpDL-2c2C5Re-kmbqae-Th4XGx-g325LW-cC1cp-26aa3aC-X7ruJo-jDkSKD-57695d-8Dz2hm-fPsDJr-gxcdoV-iSVsHR-dWWbct-ejvCrM-8ofaVz
[2]: https://creativecommons.org/licenses/by/2.0/legalcode
[3]: https://www.networkworld.com/article/3207535/what-is-iot-the-internet-of-things-explained.html
[4]: https://www.networkworld.com/article/3356838/how-to-determine-if-wi-fi-6-is-right-for-you.html
[5]: https://www.networkworld.com/article/3250268/what-is-mu-mimo-and-why-you-need-it-in-your-wireless-routers.html
[6]: https://www.networkworld.com/article/3402316/when-to-use-5g-when-to-use-wi-fi-6.html
[7]: https://www.networkworld.com/article/3306720/mobile-wireless/how-enterprises-can-prep-for-5g.html
[8]: https://www.networkworld.com/article/3560993/what-is-wi-fi-and-why-is-it-so-important.html
[9]: https://www.facebook.com/NetworkWorld/
[10]: https://www.linkedin.com/company/network-world
