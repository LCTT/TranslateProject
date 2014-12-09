[yupmoon translating]



5 Best Open Source Web Browser Security Apps
================================================================================
The Web browser acts as the gateway for myriad online services these days. Computer security problems are far from solved, and technology advances provide new ways for malware to infect our devices and enter our business networks. For example, smartphones and tablets offer fresh new fields for malware—and its malicious cousin, "[malvertising][1]"—to exploit.

Malvertising, or malicious advertising, injects malware into legitimate ads and ad networks. Granted, you could argue that there's a thin line between "legitimate" ads and ad networks and not-legitimate ads and ad networks. But don’t get distracted. Privacy and security are inextricably linked, and protecting your privacy is part of protecting your security.

Firefox, Chrome, and Opera are the best Web browsers; they offer the best performance, the most compatibility, and the best security. These five open source security apps install in your Web browser, and they protect you from a variety of threats.

### Protect Your Privacy: Open Source Web Browser Security Apps ###

#### 1. [AdBlock][2] ####

Ad networks are wonderful malware vectors. A single ad network serves thousands of sites, so compromising one ad network equals many thousands of compromised machines. AdBlock, and its derivatives—[AdBlock Plus][2], [AdBlock Pro][3], and [AdBlock Edge][4]—are all great tools for blocking ads, which has the added benefit of making cluttery annoying ads-infested sites more usable.

Of course there is a downside: harming sites that depend on ad revenues. All of them have one-click whitelists, so you can selectively turn off ad-blocking on sites that you want to support. (Really, my dear Webmeisters, if you don't want your site visitors blocking your ads then don't be obnoxious.)

![](http://www.smallbusinesscomputing.com/imagesvr_ce/5731/fig-1-easylist_1.jpg)

Figure 1: Selecting additional filters for your Ad Blocker.

Ad blockers do more than block ads; they also block Web-tracking bugs and malicious domains. To turn on additional filter lists, click on your ad blocker icon > click **Preferences**, and go to the **Filter Subscriptions** tab. Click the **Add Filter Subscription** button, and then add **Easy Privacy + EasyList**. The Malware Domains filter is a good one to include as well; it blocks domains that are known to host malware and spyware. Adblock works with Firefox, Chrome, Opera, Safari, Internet Explorer, and Android.

#### 2. [HTTPS Everywhere][5] ####

HTTPS Everywhere browser extension ensures that you will never accidentally connect to a Web site with HTTP when HTTPS is available. HTTPS means your connection is encrypted with SSL (secure sockets layer), which is a commonly-used protocol for encrypting Web and email connections. HTTPS Everywhere is available for Firefox, Chrome, and Opera.

When you install HTTPS Everywhere, it asks if you want to enable the SSL Observatory. Say yes, as it offers additional protections against man-in-the-middle and bogus SSL certificate attacks. HTTPS Everywhere works with Firefox, Chrome, Opera, Android.

#### 3. [Social Fixer][6] ####

Social Fixer tames Facebook. It gives you mighty powers to filter your news feed so that you see what you want to see, creates tabbed feeds organized by topic, hides whatever you don't want to see, displays pictures full-sized on mouse-over, disables the Theater view of images, and lots more.

It's not really designed to be a security tool, but Social Fixer offers two important security features:

- It anonymizes Facebook pages for screenshots by replacing profile pictures with generic icons, and it changes usernames to fake names
- It reliably blocks Facebook games, which are notorious sources of trouble

![](http://www.smallbusinesscomputing.com/imagesvr_ce/2858/fig-2-socialfixer_1.jpg)

Figure 2: Anonymizing a Facebook screen with Social Fixer.

#### 4. [Privacy Badger][7] ####

The Electronic Frontier Foundation's Privacy Badger is a superb tracker-and spy-ads blocker. These days Web pages are composed of content from multiple sources: ad servers, comments servers, content farms, image farms, third-party login servers, and gosh knows what-all.

AdBlock is good at blocking this junk, but Privacy Badger is better. It doesn't rely on filter lists, which have to be maintained by humans somewhere, but rather algorithms and policy methods, and you can easily override it if it blocks something in error. Privacy Badger works with Firefox and Chrome.

![](http://www.smallbusinesscomputing.com/imagesvr_ce/9256/fig-3-privacybadger_1.jpg)

Figure 3: Privacy Badger blocks tracking sites.

Privacy Badger should just work. Click on its icon to see what it's blocking on any site you're visiting. Try it on Huffingtonpost.com, one of the champions of stuffing the maximum number of third-party components into each and every page (Figure 3).

The sliders tell the status of each site: red means that site is completely blocked, so it can't set cookies or serve up any content to you. Yellow indicates a third-party domain that appears to be trying to track you, but it is on Privacy Badger's whitelist of allowed domains. Green is for a third-party domain that is not yet classified as a tracker, but this could change as you visit **multiple** sites and Privacy Badger observes its behavior.

You can set the sliders yourself according to your preference; for example, on one site I visited Privacy Badger blocked bazaarvoice.com, which some shopping sites use to host their customer reviews.

#### 5. [Disconnect][8] ####

Disconnect is another anti-tracker and anti-cookie tool with a great feature set. It runs on Firefox, Chrome, Internet Explorer, and Safari, and offers special iOS and Android versions. Not only does it foil trackers, it also secures your wireless transmissions (Wi-fi, 3G, and 4G) with its own virtual private network, protecting you from wiretapping and malvertising. It protects you from widgetjacking, which is a technique used by attackers to gain access to your sites that require logins. With widgetjacking they don't even need your password; they use stolen cookies.

Disconnect also provides a safe search feature that lets you use your favorite search engines while blocking their snoopy data-mining habits.

Just assume that everyone on the Web is out to get you. It's all abstract and behind the scenes, and not obvious like someone bashing a window to get into your house. But the threats are numerous and real, and you have to take precautions to protect yourself.

Carla Schroder is the author of The Book of Audacity, Linux Cookbook, Linux Networking Cookbook,and hundreds of Linux how-to articles. She's the former managing editor of Linux Planet and Linux Today.

--------------------------------------------------------------------------------

via: http://www.smallbusinesscomputing.com/biztools/5-best-open-source-web-browser-security-apps.html

作者：[Carla Schroder][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.smallbusinesscomputing.com/author/Carla-Schroder-6080.html
[1]:http://www.webopedia.com/TERM/M/malvertising.html
[2]:https://getadblock.com/
[3]:https://chrome.google.com/webstore/detail/adblock-pro/ocifcklkibdehekfnmflempfgjhbedch?hl=en-US
[4]:https://addons.mozilla.org/en-us/firefox/addon/adblock-edge/
[5]:https://www.eff.org/Https-everywhere
[6]:http://socialfixer.com/
[7]:https://www.eff.org/privacybadger
[8]:https://disconnect.me/
