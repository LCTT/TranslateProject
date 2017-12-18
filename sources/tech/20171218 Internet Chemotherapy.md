Internet Chemotherapy
======

12/10 2017

### 1. Internet Chemotherapy

Internet Chemotherapy was a 13 month project between Nov 2016 - Dec 2017.
It has been known under names such as 'BrickerBot', 'bad firmware 
upgrade', 'ransomware', 'large-scale network failure' and even 
'unprecedented terrorist actions.' That last one was a little harsh, 
Fernandez, but I guess I can't please everybody.

You can download the module which executes the http and telnet-based 
payloads from this router at http://91.215.104.140/mod_plaintext.py. Due to 
platform limitations the module is obfuscated single threaded python, but
the payloads are in plain view and should be easy to figure out for any 
programmer worth his/her/hir salt. Take a look at the number of payloads, 
0-days and techniques and let the reality sink in for a moment. Then 
imagine what would've happened to the Internet in 2017 if I had been a 
blackhat dedicated to building a massive DDoS cannon for blackmailing the 
biggest providers and companies. I could've disrupted them all and caused 
extraordinary damage to the Internet in the process.

My ssh crawler is too dangerous to publish. It contains various levels of 
automation for the purpose of moving laterally through poorly designed 
ISP networks and taking them over through only a single breached router. 
My ability to commandeer and secure hundreds of thousands of ISP routers 
was the foundation of my anti-IoT botnet project as it gave me great 
visibility of what was happening on the Internet and it gave me an 
endless supply of nodes for hacking back. I began my non-destructive ISP 
network cleanup project in 2015 and by the time Mirai came around I was 
in a good position to react. The decision to willfully sabotage other 
people's equipment was nonetheless a difficult one to make, but the 
colossally dangerous CVE-2016-10372 situation ultimately left me with no 
other choice. From that moment on I was all-in.

I am now here to warn you that what I've done was only a temporary band-
aid and it's not going to be enough to save the Internet in the future. 
The bad guys are getting more sophisticated, the number of potentially 
vulnerable devices keep increasing, and it's only a matter of time before 
a large scale Internet-disrupting event will occur. If you are willing to 
believe that I've disabled over 10 million vulnerable devices over the 13-
month span of the project then it's not far-fetched to say that such a 
destructive event could've already happened in 2017.

YOU SHOULD WAKE UP TO THE FACT THAT THE INTERNET IS ONLY ONE OR TWO 
SERIOUS IOT EXPLOITS AWAY FROM BEING SEVERELY DISRUPTED. The damage of 
such an event is immeasurable given how digitally connected our societies 
have become, yet CERTs, ISPs and governments are not taking the gravity 
of the situation seriously enough. ISPs keep deploying devices with 
exposed control ports and although these are trivially found using 
services like Shodan the national CERTs don't seem to care. A lot of 
countries don't even have CERTs. Many of the world's biggest ISPs do not 
have any actual security know-how in-house, and are instead relying on 
foreign vendors for help in case anything goes wrong. I've watched large 
ISPs withering for months under conditioning from my botnet without them 
being able to fully mitigate the vulnerabilities (good examples are BSNL, 
Telkom ZA, PLDT, from time to time PT Telkom, and pretty much most large 
ISPs south of the border). Just look at how slow and ineffective Telkom 
ZA was in dealing with its Aztech modem problem and you will begin to 
understand the hopelessness of the current situation. In 99% of the 
problem cases the solution would have simply been for the ISPs to deploy 
sane ACLs and CPE segmentation, yet months later their technical staff 
still hasn't figured this out. If ISPs are unable to mitigate weeks and 
months of continuous deliberate sabotage of their equipment then what 
hope is there that they would notice and fix a Mirai problem on their 
networks? Many of the world's biggest ISPs are catastrophically negligent
and this is the biggest danger by a landslide, yet paradoxically it 
should also be the easiest problem to fix.

I've done my part to try to buy the Internet some time, but I've gone as 
far as I can. Now it's up to you. Even small actions are important. Among 
the things you can do are:

* Review your own ISP's security through services such as Shodan and take 
  them to task over exposed telnet, http, httpd, ssh, tr069 etc. ports on 
  their networks. Refer them to this document if you have to. There's no 
  good reason why any of these control ports should ever be accessible 
  from the outside world. Exposing control ports is an amateur mistake. 
  If enough customers complain they might actually do something about it!

* Vote with your wallet! Refuse to buy or use 'intelligent' products 
  unless the manufacturer can prove that the product can and will receive 
  timely security updates. Find out about the vendor's security track 
  record before giving them your hard-earned money. Be willing to pay a 
  little bit more for credible security.

* Lobby your local politicians and government officials for improved 
  security legislation for IoT (Internet of Things) devices such as 
  routers, IP cameras and 'intelligent' devices. Private or public 
  companies currently lack the incentives for solving this problem in the 
  immediate term. This matter is as important as minimum safety 
  requirements for cars and general electrical appliances.

* Consider volunteering your time or other resources to underappreciated 
  whitehat organizations such as GDI Foundation or Shadowserver 
  Foundation. These organizations and people make a big difference and 
  they can significantly amplify the impact of your skillset in helping
  the Internet.
  
* Last but not least, consider the long-shot potential of getting IoT 
  devices designated as an 'attractive nuisance' through precedent-
  setting legal action. If a home owner can be held liable for a 
  burglar/trespasser getting injured then I don't see why a device owner 
  (or ISP or manufacturer) shouldn't be held liable for the damage that 
  was caused by their dangerous devices being exploitable through the 
  Internet. Attribution won't be a problem for Layer 7 attacks. If any 
  large ISPs with deep pockets aren't willing to fund such precedent 
  cases (and they might not since they fear that such precedents could 
  come back to haunt them) we could even crowdfund such initiatives over 
  here and in the EU. ISPs: consider your volumetric DDoS bandwidth cost 
  savings in 2017 as my indirect funding of this cause and as evidence 
  for its potential upside.

### 2. Timeline

Here are some of the more memorable events of the project:

* Deutsche Telekom Mirai disruption in late November 2016. My hastily 
  assembled initial TR069/64 payload only performed a 'route del default' 
  but this was enough to get the ISP's attention to the problem and the
  resulting headlines alerted other ISPs around the world to the 
  unfolding disaster.
  
* Around January 11-12 some Mirai-infected DVRs with exposed control port 
  6789 ended up getting bricked in Washington DC, and this made numerous
  headlines. Gold star to Vemulapalli for determining that Mirai combined
  with /dev/urandom had to be 'highly sophisticated ransomware'. Whatever
  happened to those 2 unlucky souls in Europe?
  
* In late January 2017 the first genuine large-scale ISP takedown occured 
  when Rogers Canada's supplier Hitron carelessly pushed out new firmware 
  with an unauthenticated root shell listening on port 2323 (presumably 
  this was a debugging interface that they forgot to disable). This epic 
  blunder was quickly discovered by Mirai botnets, and the end-result was 
  a large number of bricked units.
  
* In February 2017 I noticed the first Mirai evolution of the year, with 
  both Netcore/Netis and Broadcom CLI-based modems being attacked. The 
  BCM CLI would turn out to become one of the main Mirai battlegrounds of 
  2017, with both the blackhats and me chasing the massive long tail of 
  ISP and model-specific default credentials for the rest of the year. 
  The 'broadcom' payloads in the above source may look strange but 
  they're statistically the most likely sequences to disable any of the 
  endless number of buggy BCM CLI firmwares out there.
  
* In March 2017 I significantly increased my botnet's node count and 
  started to add more web payloads in response to the threats from IoT 
  botnets such as Imeij, Amnesia and Persirai. The large-scale takedown 
  of these hacked devices created a new set of concerns. For example, 
  among the leaked credentials of the Avtech and Wificam devices there 
  were logins which strongly implied airports and other important 
  facilities, and around April 1 2017 the UK government officials 
  warned of a 'credible cyber threat' to airports and nuclear 
  facilities from 'hacktivists.' Oops.
  
* The more aggressive scanning also didn't escape the attention of 
  civilian security researchers, and in April 6 2017 security company 
  Radware published an article about my project. The company trademarked 
  it under the name 'BrickerBot.' It became clear that if I were to 
  continue increasing the scale of my IoT counteroffensive I had to come 
  up with better network mapping/detection methods for honeypots and 
  other risky targets.
  
* Around April 11th 2017 something very unusual happened. At first it 
  started like so many other ISP takedowns, with a semi-local ISP called 
  Sierra Tel running exposed Zyxel devices with the default telnet login 
  of supervisor/zyad1234. A Mirai runner discovered the exposed devices 
  and my botnet followed soon after, and yet another clash in the epic 
  BCM CLI war of 2017 took place. This battle didn't last long. It 
  would've been just like any of the hundreds of other ISP takedowns in 
  2017 were it not for something very unusual occuring right after the 
  smoke settled. Amazingly, the ISP didn't try to cover up the outage as 
  some kind of network issue, power spike or a bad firmware upgrade. They 
  didn't lie to their customers at all. Instead, they promptly published 
  a press release about their modems having been vulnerable which allowed 
  their customers to assess their potential risk exposure. What did the 
  most honest ISP in the world get for its laudable transparency? Sadly 
  it got little more than criticism and bad press. It's still the most 
  depressing case of 'why we can't have nice things' to me, and probably 
  the main reason for why 99% of security mistakes get covered up and the 
  actual victims get left in the dark. Too often 'responsible disclosure'
  simply becomes a euphemism for 'coverup.'
  
* On April 14 2017 DHS warned of 'BrickerBot Threat to Internet of 
  Things' and the thought of my own government labeling me as a cyber 
  threat felt unfair and myopic. Surely the ISPs that run dangerously 
  insecure network deployments and the IoT manufacturers that peddle
  amateurish security implementations should have been fingered as the 
  actual threat to Americans rather than me? If it hadn't been for me 
  millions of us would still be doing their banking and other sensitive 
  transactions over hacked equipment and networks. If anybody from DHS 
  ever reads this I urge you to reconsider what protecting the homeland 
  and its citizens actually means.
  
* In late April 2017 I spent some time on improving my TR069/64 attack 
  methods, and in early May 2017 a company called Wordfence (now Defiant)
  reported a significant decline in a TR069-exploiting botnet that had 
  previously posed a threat to Wordpress installations. It's noteworthy 
  that the same botnet temporarily returned a few weeks later using a 
  different exploit (but this was also eventually mitigated).
  
* In May 2017 hosting company Akamai reported in its Q1 2017 State of the 
  Internet report an 89% decrease in large (over 100 Gbps) DDoS attacks 
  compared with Q1 2016, and a 30% decrease in total DDoS attacks. The 
  largest attack of Q1 2017 was 120 Gbps vs 517 Gbps in Q4 2016. As large 
  volumetric DDoS was one of the primary signatures of Mirai this felt 
  like concrete justification for all the months of hard work in the IoT 
  trenches.
  
* During the summer I kept improving my exploit arsenal, and in late July 
  I performed some test runs against APNIC ISPs. The results were quite
  surprising. Among other outcomes a few hundred thousand BSNL and MTNL 
  modems were disabled and this outage become headline news in India. 
  Given the elevated geopolitical tensions between India and China at the 
  time I felt that there was a credible risk of the large takedown being
  blamed on China so I made the rare decision to publically take credit 
  for it. Catalin, I'm very sorry for the abrupt '2 day vacation' that 
  you had to take after reporting the news. 
  
* Previously having worked on APNIC and AfriNIC, on August 9th 2017 I 
  also launched a large scale cleanup of LACNIC space which caused 
  problems for various providers across the subcontinent. The attack made 
  headlines in Venezuela after a few million cell phone users of Movilnet 
  lost service. Although I'm personally against government surveillance 
  of the Internet the case of Venezuela is noteworthy. Many of the 
  LACNIC ISPs and networks have been languishing for months under  
  persistent conditioning from my botnet, but Venezuelan providers have 
  been quick to fortify their networks and secure their infrastructure. 
  I believe this is due to Venezuela engaging in far more invasive deep 
  packet inspection than the other LACNIC countries. Food for thought.
  
* In August 2017 F5 Labs released a report called "The Hunt for IoT: The 
  Rise of Thingbots" in which the researchers were perplexed over the 
  recent lull in telnet activity. The researchers speculated that the 
  lack of activity may be evidence that one or more very large cyber 
  weapons are being built (which I guess was in fact true). This piece
  is to my knowledge the most accurate assessment of the scope of my
  project but fascinatingly the researchers were unable to put two and 
  two together in spite of gathering all the relevant clues on a single 
  page.
  
* In August 2017 Akamai's Q2 2017 State of the Internet report announces 
  the first quarter in 3 years without the provider observing a single 
  large (over 100 Gbps) attack, and a 28% decrease in total DDoS attacks 
  vs Q1 2017. This seems like further validation of the cleanup effort. 
  This phenomenally good news is completely ignored by the mainstream 
  media which operates under an 'if it bleeds it leads' mentality even 
  when it comes to information security. This is yet another reason why 
  we can't have nice things.
  
* After the publication of CVE-2017-7921 and 7923 in September 2017 I 
  decided to take a closer look at Hikvision devices, and to my horror 
  I realized that there's a technique for botting most of the vulnerable 
  firmwares that the blackhats hadn't discovered yet. As a result I 
  launched a global cleanup initiative around mid-September. Over a 
  million DVRs and cameras (mainly Hikvision and Dahua) were disabled 
  over a span of 3 weeks and publications such as IPVM.com wrote several 
  articles about the attacks. Dahua and Hikvision wrote press releases
  mentioning or alluding to the attacks. A huge number of devices finally
  got their firmwares upgraded. Seeing the confusion that the cleanup 
  effort caused I decided to write a quick summary for the CCTV people at 
  http://depastedihrn3jtw.onion.link/show.php?md5=62d1d87f67a8bf485d43a05ec32b1e6f
  (sorry for the NSFW language of the pastebin service). The staggering 
  number of vulnerable units that were online months after critical 
  security patches were available should be the ultimate wakeup call to 
  everyone about the utter dysfunctionality of the current IoT patching 
  process.
  
* Around September 28 2017 Verisign releases a report saying that DDoS 
  attacks declined 55% in Q2 2017 vs Q1, with a massive 81% attack peak 
  decline.
  
* On November 23rd 2017 the CDN provider Cloudflare reports that 'in 
  recent months, Cloudflare has seen a dramatic reduction in simple 
  attempts to flood our network with junk traffic.' Cloudflare speculates 
  it could've partly been due to their change in policies, but the 
  reductions also line up well with the IoT cleanup activities.
  
* At the end of November 2017 Akamai's Q3 2017 State of the Internet 
  report sees a small 8% increase in total DDoS attacks for the quarter. 
  Although this was a significant reduction compared to Q3 2016 the 
  slight uptick serves as a reminder of the continued risks and dangers.
  
* As a further reminder of the dangers a new Mirai strain dubbed 'Satori' 
  reared its head in November-December of 2017. It's particularly 
  noteworthy how quickly the botnet managed to grow based on a single 
  0-day exploit. This event underlines the current perilous operating 
  state of the Internet, and why we're only one or two severe IoT 
  exploits away from widespread disruption. What will happen when nobody 
  is around to disable the next threat? Sinkholing and other whitehat/
  'legal' mitigations won't be enough in 2018 just like they weren't 
  enough in 2016. Perhaps in the future governments will be able to 
  collaborate on a counterhacking task force with a global mandate for 
  disabling particularly severe existential threats to the Internet, but 
  I'm not holding my breath.

* Late in the year there were also some hysterical headlines regarding a 
  new botnet that was dubbed 'Reaper' and 'IoTroop'. I know some of you 
  will eventually ridicule those who estimated its size at 1-2 million 
  but you should understand that security researchers have very limited 
  knowledge of what's happening on networks and hardware that they don't 
  control. In practice the researchers could not possibly have known or 
  even assumed that most of the vulnerable device pool had already been 
  disabled by the time the botnet emerged. Give the 'Reaper' one or two 
  new unmitigated 0-days and it'll become as terrifying as our worst 
  fears.

### 3. Parting Thoughts

I'm sorry to leave you in these circumstances, but the threat to my own 
safety is becoming too great to continue. I have made many enemies. If 
you want to help look at the list of action items further up. Good luck.

There will also be those who will criticize me and say that I've acted 
irresponsibly, but that's completely missing the point. The real point 
is that if somebody like me with no previous hacking background was able 
to do what I did, then somebody better than me could've done far worse 
things to the Internet in 2017. I'm not the problem and I'm not here to
play by anyone's contrived rules. I'm only the messenger. The sooner you 
realize this the better.

-Dr Cyborkian a.k.a. janit0r, conditioner of 'terminally ill' devices.

--------------------------------------------------------------------------------

via：https://ghostbin.com/paste/q2vq2

作者：janit0r
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，
[Linux中国](https://linux.cn/) 荣誉推出
