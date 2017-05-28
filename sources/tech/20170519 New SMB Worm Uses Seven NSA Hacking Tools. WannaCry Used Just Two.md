> translating by hwlog

### New SMB Worm Uses Seven NSA Hacking Tools. WannaCry Used Just Two


![EternalRocks](https://www.bleepstatic.com/content/posts/2017/05/19/EternalRocks.png)

Researchers have detected a new worm that is spreading via SMB, but unlike the worm component of the WannaCry ransomware, this one is using seven NSA tools instead of two.

The worm's existence first came to light on Wednesday, after it infected the SMB honeypot of [Miroslav Stampar][15], member of the Croatian Government CERT, and creator of the sqlmap tool used for detecting and exploiting SQL injection flaws.

### EternalRocks uses seven NSA tools

The worm, which Stampar named EternalRocks based on worm executable properties found in one sample, works by using six SMB-centric NSA tools to infect a computer with SMB ports exposed online. These are **ETERNALBLUE**, **ETERNALCHAMPION**, **ETERNALROMANCE**, and **ETERNALSYNERGY**, which are SMB exploits used to compromise vulnerable computers, while **SMBTOUCH** and **ARCHITOUCH** are two NSA tools used for SMB reconnaissance operations.

Once the worm has obtained this initial foothold, it then uses another NSA tool, **DOUBLEPULSAR**, to propagate to new vulnerable machines.

![Origina of the EternalRocks name](https://www.bleepstatic.com/images/news/u/986406/Malware/EternalRocks-properties.png)
**Origin of the EternalRocks name**

[The WannaCry ransomware outbreak][16], which affected over 240,000 victims, also used an SMB worm to infect computers and spread to new victims.

Unlike EternalRocks, WannaCry's SMB worm used only ETERNALBLUE for the initial compromise, and DOUBLEPULSAR to propagate to new machines.

### EternalRocks is more complex but less dangerous

As a worm, EternalRocks is far less dangerous than WannaCry's worm component, as it currently does not deliver any malicious content. This, however, does not mean that EternalRocks is less complex. According to Stampar, it's actually the opposite.

For starters, EternalRocks is far more sneaky than WannaCry's SMB worm component. Once it infects a victim, the worm uses a two-stage installation process, with a delayed second stage.

During the first stage, EternalRocks gains a foothold on an infected host, downloads the Tor client, and beacons its C&C server, located on a .onion domain, the Dark Web.

Only after a predefined period of time — currently 24 hours — does the C&C server respond. The role of this long delay is most probably to bypass sandbox security testing environments and security researchers analyzing the worm, as very few will wait a full day for a response from the C&C server.

<twitterwidget class="twitter-tweet twitter-tweet-rendered" id="twitter-widget-0" data-tweet-id="865494946974900224" style="position: static; visibility: visible; display: block; transform: rotate(0deg); width: 500px; margin: 10px auto; max-width: 100%; min-width: 220px;">[View image on Twitter][10] [![View image on Twitter](https://pbs.twimg.com/media/DALa50RUwAAXWlg.jpg:small "View image on Twitter")][5] 

> [ Follow][1] [![](https://pbs.twimg.com/profile_images/687638130694995970/Xtras5w3_normal.png) Miroslav Stampar @stamparm][6]
> 
> Update on [#EternalRocks][7]. Original name is actually "MicroBotMassiveNet" while author's nick is "tmc" [https://github.com/stamparm/EternalRocks/#debug-strings …][8]
> 
> [<time class="dt-updated" datetime="2017-05-19T09:10:50+0000" pubdate="" title="Time posted: 19 May 2017, 09:10:50 (UTC)">5:10 PM - 19 May 2017</time>][9]
> 
> *   [][2]
> 
> *   [ 2525 Retweets][3]
> 
> *   [ 1717 likes][4]

[Twitter Ads info & Privacy][11]</twitterwidget>

### No kill switch domain

Additionally, EternalRocks also uses files with identical names to the ones used by WannaCry's SMB worm, in another attempt to fool security researchers into misclassifying it.

But unlike WannaCry, EternalRocks does not include a kill switch domain, the Achille's heel that security researchers used to stop the WannaCry outbreak.

After the initial dormancy period expires and the C&C server responds, EternalRocks goes into the second stage of its installation process and downloads a second stage malware component in the form of an archive named shadowbrokers.zip.

The name of this file is pretty self-explanatory, as it contains NSA SMB-centric exploits [leaked by the Shadow Brokers group][17] in April 2017.

The worm then starts a rapid IP scanning process and attempts to connect to random IP addresses.

![Content of shadowbrokers.zip](https://www.bleepstatic.com/images/news/u/986406/Malware/EternalRocks-exploits.png)
**The configuration files for NSA tools found in the shadowbrokers.zip archive**

### EternalRocks could be weaponized in an instant

Because of its broader exploit arsenal, the lack of a kill switch domain, and because of its initial dormancy, EternalRocks could pose a serious threat to computers with vulnerable SMB ports exposed to the Internet, if its author would ever decide to weaponize the worm with ransomware, a banking trojan, RATs, or anything else.

At first glance, the worm seems to be an experiment, or a malware author performing tests and fine-tuning a future threat.

This, however, does not mean EternalRocks is harmless. Computers infected with this worm are controllable via C&C server commands and the worm's owner could leverage this hidden communications channel to send new malware to the computers previously infected by EternalRocks.

Furthermore, DOUBLEPULSAR, [an NSA implant with backdoor features][18], remains running on PCs infected with EternalRocks. Unfortunately, the worm's author has not taken any measures to protect the DOUBLEPULSAR implant, which runs in a default unprotected state, meaning other threat actors could use it as a backdoor to machines infected by EternalRocks, by  sending their own malware to those PCs.

IOCs and more info on the worm's infection process are available in a [GitHub repo][19] Stampar set up a few days ago.

### An SMB free-for-all

Currently, there are multiple actors scanning for computers running older and unpatched versions of the SMB services. System administrators have already taken notice and started patching vulnerable PCs or disabling the old SMBv1 protocol, slowly reducing the number of vulnerable machines that EternalRocks can infect.

Furthermore, malware such as [Adylkuzz][20] also shuts down SMB ports, preventing further exploitation from other threats, also contributing to reducing the number of potential targets for EternalRocks and other SMB-hunting malware. Reports from [Forcepoint][21], [Cyphort][22], and [Secdo][23] detail other threats currently targeting computers with SMB ports.

Nonetheless, the faster system administrators patch their systems the better. "The worm is racing with administrators to infect machines before they patch," Stampar told Bleeping Computer in a private conversation. "Once infected, he can weaponize any time he wants, no matter the late patch."

 _Image credits: Miroslav Stampar, BleepingComputer & [Ana María Lora Macias][13]_

--------------------------------------------------------------------------------

作者简介：

Catalin covers various topics such as data breaches, software vulnerabilities, exploits, hacking news, the Dark Web, programming topics, social media, web technology, product launches, and a few more.

---------------

via: https://www.bleepingcomputer.com/news/security/new-smb-worm-uses-seven-nsa-hacking-tools-wannacry-used-just-two/

作者：[CATALIN CIMPANU ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.bleepingcomputer.com/author/catalin-cimpanu/
[1]:https://twitter.com/stamparm
[2]:https://twitter.com/intent/tweet?in_reply_to=865494946974900224
[3]:https://twitter.com/intent/retweet?tweet_id=865494946974900224
[4]:https://twitter.com/intent/like?tweet_id=865494946974900224
[5]:https://twitter.com/stamparm/status/865494946974900224/photo/1
[6]:https://twitter.com/stamparm
[7]:https://twitter.com/hashtag/EternalRocks?src=hash
[8]:https://t.co/xqoxkNYfM7
[9]:https://twitter.com/stamparm/status/865494946974900224
[10]:https://twitter.com/stamparm/status/865494946974900224/photo/1
[11]:https://support.twitter.com/articles/20175256
[12]:https://www.bleepingcomputer.com/news/security/new-smb-worm-uses-seven-nsa-hacking-tools-wannacry-used-just-two/#comment_form
[13]:https://thenounproject.com/search/?q=worm&i=24323
[14]:https://www.bleepingcomputer.com/author/catalin-cimpanu/
[15]:https://about.me/stamparm
[16]:https://www.bleepingcomputer.com/news/security/wana-decrypt0r-ransomware-using-nsa-exploit-leaked-by-shadow-brokers-is-on-a-rampage/
[17]:https://www.bleepingcomputer.com/news/security/shadow-brokers-release-new-files-revealing-windows-exploits-swift-attacks/
[18]:https://www.bleepingcomputer.com/news/security/over-36-000-computers-infected-with-nsas-doublepulsar-malware/
[19]:https://github.com/stamparm/EternalRocks/
[20]:https://www.bleepingcomputer.com/news/security/adylkuzz-cryptocurrency-miner-may-have-saved-you-from-the-wannacry-ransomware/
[21]:https://blogs.forcepoint.com/security-labs/wannacry-multiple-malware-families-using-eternalblue-exploit
[22]:https://www.cyphort.com/eternalblue-exploit-actively-used-deliver-remote-access-trojans/
[23]:http://blog.secdo.com/multiple-groups-exploiting-eternalblue-weeks-before-wannacry
