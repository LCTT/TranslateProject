[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Counterfeit Cisco switches raise network security alarms)
[#]: via: (https://www.networkworld.com/article/3566705/counterfeit-cisco-switches-raise-network-security-alarms.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

Counterfeit Cisco switches raise network security alarms
======
F-Secure details enterprise security threats posed by counterfeit network gear.
Unreal Engine 5

In a disconcerting event for IT security professionals, counterfeit versions of Cisco Catalyst 2960-X Series switches were discovered on an unnamed business network, and the fake gear was found to be designed to circumvent typical authentication procedures, according to a [report][1] from F-Secure.

[F-Secure][2] says its investigators found that while the counterfeit Cisco 2960-X units did not have any backdoor-like features, they did employ various measures to fool security controls. For example, one of the units exploited what F-Secure believes to be a previously undiscovered software vulnerability to undermine secure boot processes that provide protection against firmware tampering. 

**Read more about Cisco:**

  * [Cisco bumps up ISR/ASR router performance and capacity][3]
  * [Cisco spotlights new IT roles you've never heard of][4]
  * [What the new Cisco certification requirements mean for you][5]
  * [Cisco goes after wireless IoT with Fluidmesh acquisition][6]



"Counterfeit units such as these can be easily modified to introduce backdoors within an organization. We emphasize that this is _not_ what happened in this instance, but the attack execution would be mostly identical, which is why we think it is important to highlight such issues," said [Dmitry Janushkevich][7], a senior consultant with F-Secure Consulting's hardware security team and lead author of the report.

"In this instance the motivation is purely economic as this is done just to sell counterfeit units for a profit. However, the techniques and opportunities are identical to attacks aimed at compromising the security of organizations."

Still, in this case, the security functions were bypassed, weakening the security posture of the device. This could give attackers who have already gained code execution via a network-based attack, for example, an easier way to gain persistence, and therefore impact the security of the whole organization, Janushkevich said.

This story began in 2019 when the unnamed company had some network switches fail after a software upgrade – not an uncommon occurrence in a counterfeit device, experts say. While the device lost its primary function as a network switch when the software upgrade was installed, it could still be accessed via the console, F-Secure reported. Reverting the software version did not fix the problem, likely pointing to evidence of data being overwritten during the update process, according to F-Secure.

"Counterfeit devices quite often work smoothly for a long time, which makes it hard to detect them. In this particular case, the hardware failure initiated a wider investigation to which the F-Secure Hardware Security team was called and asked to analyze the suspected counterfeit Cisco Catalyst 2960-X series switches," Janushkevich said. While negotiating a replacement with the vendor, the company found out they had unknowingly bought counterfeit devices.

The counterfeits were physically and operationally similar to authentic Cisco switches, Janushkevich said. One of the switch's engineering suggests that the counterfeiters either invested heavily in replicating Cisco's original design, or had access to proprietary engineering documentation to help them create a convincing copy, Janushkevich said.

According to the F-Secure report, the two fake switches employed different hardware approaches to circumventing boot-time software authentication. For example, the "Counterfeit A" switch contained add-on circuitry that exploited a race condition in the SLIMpro ROM code to bypass SLIMpro software verification. SLIMpro code brings encryption and authentication for network devices.

The design of the "Counterfeit B" switch was changed to incorporate the modification of Counterfeit A and replaced the EEPROM completely with an unknown integrated circuit. This signified a considerable resource investment in design, manufacture, and testing of such forged products compared to the more low-cost, ad-hoc approach used in Counterfeit A, F-Secure reported.

As for the previously unknown vulnerability, F-Secure said a TOCTOU ([time-of-check to time-of-use][8]) bug affecting SLIMpro ROM code was exploited in the wild to bypass software signature checks against the SLIMpro secure processing unit. By extension, the issue affects genuine 2960-X series switches as well. While one previously published report regarding issues in the Cisco Catalyst secure boot process was accessible, at the time of writing its paper, no public information was available detailing this or similar issues affecting the Catalyst 2960-X series, F-Secure said.

For its part, [Cisco][9] is aware of the F-Secure report and issued a statement:

"Maintaining the integrity and high quality of Cisco products and services is a top priority for Cisco. Counterfeit products pose serious risks to network quality, performance, safety, and reliability. To protect our customers, Cisco actively monitors the global counterfeit market as well as implements a holistic and pervasive [Value Chain Security Architecture][10] comprised of various security controls to prevent counterfeiting. Cisco also has a Brand Protection team dedicated to detecting, deterring, and dismantling counterfeit activities. Combatting widespread counterfeiting and protecting intellectual property rights are sizeable challenges facing the entire technology industry."

Indeed there have been a number of counterfeit [take-downs][11] involving [Cisco][12] gear over the years. For example, in April of 2019, Cisco's Brand Protection team said it worked with U.S. Customs and Border Protection to seize $626,880 worth of counterfeit Cisco products in one day. The Wall Street Journal reported in December that Cisco had won an injunction against a number of manufacturers in China to stop selling counterfeit networking products. The injunction also required online markets such as Amazon, Alibaba and eBay to remove fake Cisco-branded gear from their websites. 

While selling counterfeit hardware might be the goal of many nefarious actors, software presents another profitable target, experts say.

Normally counterfeiting of the hardware platform wouldn't be lucrative, because the hardware itself is a relatively small part of the list price. The value is in the software, which is controlled by licensing to each unit's serial number," said Neil Anderson, practice director of network solutions for systems integrator [World Wide Technology][13]. The value is in the hack they used to defeat Cisco's software licensing authentication, he said.

"To me this comes to having a solid chain-of-custody between the OEM – distributor – integrator partner – customer," Anderson said. "Meaning, WWT always procures our Cisco equipment directly from Cisco distributors with Cisco in the loop on all orders, and in many cases, we deploy it for our customers."

F-Secure included the following advice to help organizations avoid falling prey to counterfeit devices: 

  * Source all your devices from authorized resellers. 
  * Have clear internal processes and policies that govern procurement processes. 
  * Ensure all devices run the latest available software provided by vendors. 
  * Make note of even physical differences between different units of the same product, no matter how subtle they may be. 



Join the Network World communities on [Facebook][14] and [LinkedIn][15] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3566705/counterfeit-cisco-switches-raise-network-security-alarms.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://labs.f-secure.com/publications/the-fake-cisco
[2]: https://www.f-secure.com/us-en
[3]: https://www.networkworld.com/article/3564719/cisco-bumps-up-israsr-router-performance-and-capacity.html
[4]: https://www.networkworld.com/article/3541363/cisco-spotlights-new-it-roles-youve-never-heard-of.html
[5]: https://www.networkworld.com/article/3446043/10-things-to-know-about-the-new-cisco-certification-requirements.html
[6]: https://www.networkworld.com/article/3535907/cisco-goes-after-wireless-iot-with-fluidmesh-acquisition.html
[7]: https://twitter.com/infosecdj?lang=en
[8]: https://cwe.mitre.org/data/definitions/367.html
[9]: https://blogs.cisco.com/networking/trustworthy-networking-is-not-just-technological-its-cultural?dtid=osscdc000283
[10]: https://www.cisco.com/c/en/us/about/trust-center/global-value-chain-security.html
[11]: https://www.infoworld.com/article/2653167/fbi-worried-as-dod-sold-counterfeit-cisco-gear.html
[12]: https://blogs.cisco.com/partner/cisco-takes-action-against-counterfeiters-to-protect-customers-and-partners
[13]: https://nam05.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.wwt.com%2F&data=02%7C01%7C%7Cc479b70f68fa45e3c12708d829b9fa1f%7C3aedb78fc8e04326888a74230d1978ff%7C0%7C0%7C637305226026207179&sdata=UZGRzL%2BptN%2BunzNkDVkEhQL8x2mg9Gx6JFsUVXPAMWI%3D&reserved=0
[14]: https://www.facebook.com/NetworkWorld/
[15]: https://www.linkedin.com/company/network-world
