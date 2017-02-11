How to Manage the Security Vulnerabilities of Your Open Source Product
============================================================


 ![software vulnerabilities](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/security-software-vulnerabilities.jpg?itok=D3joblgb "software vulnerabilities") 
In his upcoming talk at ELC + OpenIoT Summit, Ryan Ware, Security Architect at Intel, will explain how you can navigate the flood of vulnerabilities and manage the security of your product.[Creative Commons Zero][2]Pixabay

The security vulnerabilities that you need to consider when developing open source software can be overwhelming. Common Vulnerability Enumeration (CVE) IDs, zero-day, and other vulnerabilities are seemingly announced every day. With this flood of information, how can you stay up to date?

“If you shipped a product that was built on top of Linux kernel 4.4.1, between the release of that kernel and now, there have been nine CVEs against that kernel version,” says Ryan Ware, Security Architect at Intel, in the Q&A below. “These all would affect your product despite the fact they were not known at the time you shipped.”


 ![Ryan Ware](https://www.linux.com/sites/lcom/files/styles/floated_images/public/ryan-ware_01.jpg?itok=cy13TM9g "Ryan Ware") 

Ryan Ware, Security Architect at Intel[Used with permission][1]

In his upcoming presentation at[ ELC][6] + [OpenIoT Summit,][7] Ryan Ware, Security Architect at Intel, will present strategies for how you can navigate these waters and successfully manage the security of your product. In this preview of his talk, Ware discusses the most common developer mistakes, strategies to stay on top of vulnerabilities, and more.

**Linux.com: Let's start from the beginning. Can you tell readers briefly about the Common Vulnerabilities and Exposures (CVE), 0-day, and other vulnerabilities? What are they, and why are they important?**

Ryan Ware: Excellent questions. Common Vulnerabilities and Exposures (CVE) is a database maintained by the MITRE Corporation (a not-for-profit organization) at the behest of the United States government. It’s currently funded under the US Department of Homeland Security.  It was created in 1999 to house information about all publicly known security vulnerabilities. Each of these vulnerabilities has its own identifier (a CVE-ID) and can be referenced by that. This is how the term CVE, which really applies to the whole database, has morphed into meaning an individual security vulnerability: a CVE.

Many of the vulnerabilities that end up in the CVE database started out life as 0-day vulnerabilities. These are vulnerabilities that for whatever reason haven’t followed a more ordered disclosure process such as Responsible Disclosure. The key is that they’ve become public and exploitable without the software vendor being able to respond with a remediation of some type -- usually a software patch. These and other unpatched software vulnerabilities are critically important because until they are patched, the vulnerability is exploitable. In many ways, the release of a CVE or a 0-Day is like a starting gun going off.  Until you reach the end of the race, your customers are vulnerable.

**Linux.com: How many are there? How do you determine which are pertinent to your product?**

Ryan: Before going into how many, everyone shipping software of any kind needs to keep something in mind. Even if you take all possible efforts to ensure that the software you ship doesn’t have known vulnerabilities in it, your software *does* have vulnerabilities. They are just not known. For example, if you shipped a product that was built on top of Linux kernel 4.4.1, between the release of that kernel and now, there have been nine CVEs against that kernel version. These all would affect your product despite the fact they were not known at the time you shipped.

At this point in time, the CVE database contains 80,957 entries (January 30, 2017) and includes entries going all the way back to 1999 when there were 894 documented issues. The largest number in a year to date was 2014 when 7,946 issues were documented. That said, I believe that the decrease in numbers over the last two years isn’t due to there being fewer security vulnerabilities. This is something I’ll touch on in my talk.

**Linux.com: What are some strategies that developers can use to stay on top of all this information?**

Ryan: There are various ways a developer can float on top of the flood of vulnerability information. One of my favorite tools for doing so is [CVE Details][8]. They present the information from MITRE in a very digestible way. The best feature they have is the ability to create custom RSS feeds so you can follow vulnerabilities for the components you care about. Those with more complex tracking problems may want to start by downloading the MITRE CVE database (freely available) and pulling regular updates. Other excellent tools, such as cvechecker, allow you to check for known vulnerabilities in your software.

For key portions of your software stack, I also recommend one amazingly effective tool: Get involved with the upstream community. These are the people who understand the software you are shipping best. There are no better experts in the world. Work with them.

**Linux.com: How can you know whether your product has all the vulnerabilities covered? Are there tools that you recommend?**

Ryan: Unfortunately, as I said above, you will never have all vulnerabilities removed from your product. Some of the tools I mentioned above are key. However, there is one piece of software I haven’t mentioned yet that is absolutely critical to any product you ship: a software update mechanism. If you do not have the ability to update the product software out in the field, you have no ability to address security concerns when your customers are affected.  You must be able to update, and the easier the update process, the better your customers will be protected.

**Linux.com: What else do developers need to know to successfully manage security vulnerabilities?**

Ryan: There is one mistake that I see over and over. Developers always need to keep in mind the idea of minimizing their attackable surface area. What does this mean? In practice, it means only including the things in your product that your product actually needs! This not only includes ensuring you do not incorporate extraneous software packages into your product, but that you also compile projects with configurations that turn off features you don’t need.

How does this help? Imagine it’s 2014\. You’ve just gone into work to see that the tech news is all Heartbleed all the time. You know you include OpenSSL in your product because you need to do some basic cryptographic functionality but you don’t use TLS heartbeat, the feature with the vulnerability in question. Would you rather:

a. Spend the rest of your work working with customers and partners handholding them through a critical software update fixing a highly visible security issue?

b. Be able to tell customers and partners simply that you compiled your products OpenSSL with the “–DOPENSSL_NO_HEARTBEATS” flag and they aren’t vulnerable, allowing you to focus on new features and other productive activities.

The easiest vulnerability to address is the one you don’t include.

_Embedded Linux Conference + OpenIoT Summit North America will be held on February 21-23, 2017 in Portland, Oregon. [Check out over 130 sessions][5] on the Linux kernel, embedded development & systems, and the latest on the open Internet of Things._

--------------------------------------------------------------------------------

via: https://www.linux.com/news/event/elcna/2017/2/how-manage-security-vulnerabilities-your-open-source-product

作者：[AMBER ANKERHOLZ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/aankerholz
[1]:https://www.linux.com/licenses/category/used-permission
[2]:https://www.linux.com/licenses/category/creative-commons-zero
[3]:https://www.linux.com/files/images/ryan-ware01jpg
[4]:https://www.linux.com/files/images/security-software-vulnerabilitiesjpg
[5]:http://events.linuxfoundation.org/events/embedded-linux-conference/program/schedule?utm_source=linux&utm_campaign=elc17&utm_medium=blog&utm_content=video-blog
[6]:http://events.linuxfoundation.org/events/embedded-linux-conference
[7]:http://events.linuxfoundation.org/events/openiot-summit
[8]:http://www.cvedetails.com/
