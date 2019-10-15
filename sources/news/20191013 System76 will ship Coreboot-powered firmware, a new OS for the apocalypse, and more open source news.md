[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (System76 will ship Coreboot-powered firmware, a new OS for the apocalypse, and more open source news)
[#]: via: (https://opensource.com/article/19/10/news-october-13)
[#]: author: (Lauren Maffeo https://opensource.com/users/lmaffeo)

System76 will ship Coreboot-powered firmware, a new OS for the apocalypse, and more open source news
======
Catch up on the biggest open source headlines from the past two weeks.
![Weekly news roundup with TV][1]

In this edition of our open source news roundup, we cover System76 shipping Coreboot-powered firmware, a new OS for the apocalypse, and more open source news!

### System76 will ship 2 Linux laptops with Coreboot-powered open source firmware

The Denver-based Linux PC manufacturer announced plans to start shipping two laptop models with its Coreboot-powered open source firmware later this month. Jason Evangelho, Senior Contributor at _Forbes_, cited this move as a march towards offering open source software and hardware from the ground up. 

System76, which also develops [Pop OS][2], is now taking pre-orders for its Galago Pro and Darter Pro laptops. It claims that Coreboot will let users boot from power off to the desktop 29% faster.

Coreboot is a lightweight firmware designed to simplify the boot cycle of systems using it. It requires the minimum number of tasks needed to load and run a modern 32-bit or 64-bit operating system. Coreboot can offer a replacement for proprietary firmware, though it omits features like execution environments. Our own [Don Watkins][3] asked if Coreboot will ship on other System76 machines. Their response, [as reported by _Forbes_][4]:

> _"Yes. Long term, System76 is working to open source all aspects of the computer. Thelio Io, the controller board in the Thelio desktop, is both open hardware and open firmware. This is a long journey but we're picking up speed. It's been less than a year since the our open hardware Thelio desktop was released and we're now producing two laptops with System76 Open Firmware."_

### Collapse OS is an operating system for the post-apocalypse

Virgil Dupras, a software developer based in Quebec, is convinced the world's global supply chain will collapse before 2030. And he's worried that most [electronics will get caught in the crosshairs][5] due to "a very complex supply chain that we won't be able to achieve again for decades (ever?)." 

To prepare for the worst, Dupras built Collapse OS. It's [designed to run][6] on "minimal or improvised machines" and perform simple tasks that are helpful in a post-apocalyptic society. These include editing text files, collecting sources files for MCUs and CPUs, and reading/writing from several storage devices.

Dupras says it's intended for worst-case scenarios, and that a "weak collapse" might not be enough to justify its use. If you err on the side of caution, the Collapse OS project is accepting new contributors [on GitHub][7]. 

Per the project website, Dupras says his goal is for Collapse OS to be as self-contained as possible with the ability for users to install the OS without Internet access or other resources. Ideally, the goal is for Collapse OS to not be used at all.

### ExpressionEngine will stay open source post-acquisition

The team behind open source CMS ExpressEngine was acquired by Packet Tide - EEHarbor's parent company - in early October. [This announcement ][8]comes one year after Digital Locations acquired EllisLab, which develops EE core. 

[In an announcement][9] on ExpressionEngine's website, EllisLab founder Rick Ellis said Digital Locations wasn't a good fit for ExpressionEngine. Citing Digital Location's goals to build an AI business, Ellis realized several months ago that ExpressionEngine needed a new home:

> _"We decided that what was best for ExpressionEngine was to seek a new owner, one that could devote all the resources necessary for ExpressionEngine to flourish. Our top candidate was Packet Tide due to their development capability, extensive catalog of add-ons, and deep roots in the ExpressionEngine community._
>
> _We are thrilled that they immediately expressed enthusiastic interest in becoming the caretakers of ExpressionEngine."_

Ellis says Packet Tide's first goal is to finish building ExpressionEngine 6.0, which will have a new control panel with a dark theme (who doesn't love dark mode?). ExpressionEngine adopted the Apache License Version 2.0 in November 2018, after 16 years as a proprietary tool.

The tool is still marketed as an open source CMS, and EE Harbor developer Tom Jaeger said [in the EE Slack][10] that their plan is to keep ExpressionEngine open source now. But he also left the door open to possible changes. 

### McAfee and IBM Security to lead the Open Source Cybersecurity Alliance

The two tech giants will contribute the initiative's first open source code and content, under guidance from the OASIS consortium. The Alliance aims to share best practices, tech stacks, and security solutions in an open source platform. 

Carol Geyer, chief development officer of OASIS, said the lack of standard language makes it hard for businesses to share data between tools and products. Despite efforts to collaborate, the lack of a standardized format yields more integration costs that are expensive and time-consuming.

In lieu of building connections and integrations, [the Alliance wants members][11] to "develop protocols and standards which enable tools to work together and share information across vendors." 

According to _Tech Republic_, IBM Security will contribute [STIX-Shifter][12], an open source library that offer a universal security system. Meanwhile, McAfee added its [OpenDXL Standard Ontology][13], a cybersecurity messaging format. Other members of the Alliance include CrowdStrike, CyberArk, and SafeBreach.

#### In other news

  * [Paris uses open source to get closer to the citizen][14]
  * [SD Times open source project of the week: ABAP SDK for IBM Watson][15]
  * [Google's keeping Knative development under its thumb 'for the foreseeable future'][16]
  * [Devs engage in soul-searching on future of open source][17]
  * [Why leading Formula 1 teams back 'copycat' open source design idea][18]



_Thanks, as always, to Opensource.com staff members and moderators for their help this week._

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/news-october-13

作者：[Lauren Maffeo][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/lmaffeo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/weekly_news_roundup_tv.png?itok=B6PM4S1i (Weekly news roundup with TV)
[2]: https://system76.com/pop
[3]: https://opensource.com/users/don-watkins
[4]: https://www.forbes.com/sites/jasonevangelho/2019/10/10/system76-will-begin-shipping-2-linux-laptops-with-coreboot-based-open-source-firmware/#15a4da174e64
[5]: https://collapseos.org/why.html
[6]: https://www.digitaltrends.com/cool-tech/collapse-os-after-societys-collapse/
[7]: https://github.com/hsoft/collapseos
[8]: https://wptavern.com/expressionengine-under-new-ownership-will-remain-open-source-for-now
[9]: https://expressionengine.com/blog/expressionengine-has-a-new-owner
[10]: https://eecms.slack.com/?redir=%2Farchives%2FC04CUNNR9%2Fp1570576465005500
[11]: https://www.techrepublic.com/article/mcafee-ibm-join-forces-for-global-open-source-cybersecurity-initiative/
[12]: https://github.com/opencybersecurityalliance/stix-shifter
[13]: https://www.opendxl.com/
[14]: https://www.smartcitiesworld.net/special-reports/special-reports/paris-uses-open-source-to-get-closer-to-the-citizen
[15]: https://sdtimes.com/os/sd-times-open-source-project-of-the-week-abap-sdk-for-ibm-watson/
[16]: https://www.datacenterknowledge.com/google-alphabet/googles-keeping-knative-development-under-its-thumb-foreseeable-future
[17]: https://www.linuxinsider.com/story/86282.html
[18]: https://www.autosport.com/f1/news/146407/why-leading-f1-teams-back-copycat-design-proposal
