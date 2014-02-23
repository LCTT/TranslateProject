Translating by Hao-Ding

Hardware, software, standards
=============================

The idea behind Coova is simple: to provide you with the open (and free) tools and services you need to manage and access your WiFi network, just the way you want to. Our philosophy is that you shouldn't be required to use any specific hardware (like [FON][1] or [Meraki][2]) or software (like [Whisher][3]). From the ground up, Coova is about being open and standards based - compatible with the widest possible range of hardware, protocols, and services. It's about bringing ["Carrier" grade][4] features and services to the open-source/services world. It's also about making dumb routers a bit smarter - recycling is good, right?

With Coova, you can pick and choose the software and services you need - depending on the kind of network you are building and how you want to access it. Here are some typical uses of Coova technologies:

#### Use [CoovaAP][5] for easy configuration of [CoovaChilli][6] (or [WiFiDog][7]):

* with or without using CoovaAAA services,
* using RADIUS or locally defined users,
* using the customizable "Internal" captive portal, or
* configured to use your own portal or RADIUS service.

#### Use [CoovaChilli][6] either in [CoovaAP][5] or in your own firmware or server to:
* enforce a captive portal and authentication using CoovaAAA or any other portal/RADIUS service,
* works with a variety of commercial services (ask your provider),
* integrate with 802.1X authentication to provide accounting and access limitations.

#### Use [CoovaAAA][8] to manage the access to your network:
* with a CoovaChilli/AP captive portal,
* using a patched WiFiDog captive portal,
* using [your own captive portal][9] (no advanced programming needed),
* using our Facebook or standard captive portal applications,
* using a commercial access controller (like Colubris), or
* using any router supporting WPA Enterprise/802.1X (like the AirPort Extreme).

#### Use and share your [CoovaAAA][8] controlled network:
* using one account to login to both your captive portal and your secure WPA Enterprise networks (using any device supporting 802.1X, like your laptop or Nokia phone),
* using your account at any [CoovaAAA][8] location that is being shared with you,
* selectively share your network with only those you choose - individuals or entire realms, or
* share your network based on [OpenID][10] logins or Facebook fans/friends.

#### Use [CoovaFX][11] and [CoovaSX][12] in Firefox or your phone, respectively, to login past a captive portal using the WISPr standard and a pre-configured account - WISPr is supported by CoovaAAA and most commercial access controllers and service providers.

#### Use [JRadius][13] to program your own RADIUS provisioning logic for your network.

If you are building a WiFi network and haven't found anything on this site that can help you, you probably haven't looked hard enough. Though, it has been said, and we do acknowledge, that more documentation is needed. For this, we call out to the development and user community to help out in the Wiki , [forums][14], and [mailing lists][15]. Note: In the Wiki, we do lock pages to prevent SPAM - either create a new page or ask for more permissions on one of the mailing lists.

We are also hoping to hear more about how and where you are using Coova! In fact, a friend of mine was recently vacationing in the Dominican Republic and was pleasantly surprised to find a Coova signal at the Hotel. They were using CoovaAP for their WiFi. Stories like this are terrific -- lets get them in the forum!

-------------------------------------------
via: http://coova.org/node/133

译者：[Akagi201](https://github.com/Akagi201) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]: https://corp.fon.com/en
[2]: https://meraki.cisco.com/
[3]: http://www.whisher.com/
[4]: https://meraki.cisco.com/blog/2008/04/new-carrier-services/
[5]: http://coova.org/CoovaAP
[6]: http://coova.org/CoovaChilli
[7]: http://dev.wifidog.org/
[8]: http://coova.org/CoovaAAA
[9]: http://coova.org/node/80
[10]: http://coova.org/node/71
[11]: http://www.coova.com/CoovaFX
[12]: http://www.coova.com/CoovaSX
[13]: http://coova.org/JRadius
[14]: http://coova.org/forum/
[15]: http://coova.org/MailingLists
