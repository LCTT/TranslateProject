Driving cars into the future with Linux
===========================================

![](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/open-snow-car-osdc-lead.png?itok=IgYZ6mNY)

I don't think much about it while I'm driving, but I sure do love that my car is equipped with a system that lets me use a few buttons and my voice to call my wife, mom, and children. That same system allows me to choose whether I listen to music streaming from the cloud, satellite radio, or the more traditional AM/FM radio. I also get weather updates and can direct my in-vehicle GPS to find the fastest route to my next destination. [In-vehicle infotainment][1], or IVI as it's known in the industry, has become ubiquitous in today's newest automobiles.

A while ago, I had to travel hundreds of miles by plane and then rent a car. Happily, I discovered that my rental vehicle was equipped with IVI technology similar to my own car. In no time, I was connected via Bluetooth, had uploaded my contacts into the system, and was calling home to let my family know I arrived safely and my hosts to let them know I was en route to their home.

In a recent [news roundup][2], Scott Nesbitt cited an article that said Ford Motor Company is getting substantial backing from a rival automaker for its open source [Smart Device Link][3] (SDL) middleware framework, which supports mobile phones. SDL is a project of the [GENIVI Alliance][4], a nonprofit committed to building middleware to support open source in-vehicle infotainment systems. According to [Steven Crumb][5], executive director of GENIVI, their [membership][6] is broad and includes Daimler Group, Hyundai, Volvo, Nissan, Honda, and 170 others.

In order to remain competitive in the industry, automotive companies need a middleware system that can support the various human machine interface technologies available to consumers today. Whether you own an Android, iOS, or other device, automotive OEMs want their units to be able to support these systems. Furthermore, these IVI systems must be adaptable enough to support the ever decreasing half-life of mobile technology. OEMs want to provide value and add services in their IVI stacks that will support a variety of options for their customers. Enter Linux and open source software.

In addition to GENIVI's efforts, the [Linux Foundation][7] sponsors the [Automotive Grade Linux][8] (AGL) workgroup, a software foundation dedicated to finding open source solutions for automotive applications. Although AGL will initially focus on IVI systems, they envision branching out to include [telematics][9], heads up displays, and other control systems. AGL has over 50 members at this time, including Jaguar, Toyota, and Nissan, and in a [recent press release][10] announced that Ford, Mazda, Mitsubishi, and Subaru have joined.

To find out more, we interviewed two leaders in this emerging field. Specifically, we wanted to know how Linux and open source software are being used and if they are in fact changing the face of the automotive industry. First, we talk to [Alison Chaiken][11], a software engineer at Peloton Technology and an expert on automotive Linux, cybersecurity, and transparency. She previously worked for Mentor Graphics, Nokia, and the Stanford Linear Accelerator. Then, we chat with [Steven Crumb][12], executive director of GENIVI, who got started in open source in high-performance computing environments (supercomputers and early cloud computing). He says that though he's not a coder anymore, he loves to help organizations solve real business problems with open source software.

### Interview with Alison Chaiken (by [Deb Nicholson][13])

#### How did you get interested in the automotive software space?

I was working on [MeeGo][14] in phones at Nokia in 2009 when the project was cancelled. I thought, what's next? A colleague was working on [MeeGo-IVI][15], an early automotive Linux distribution. "Linux is going to be big in cars," I thought, so I headed in that direction.

#### Can you tell us what aspects you're working on these days?

I'm currently working for a startup on an advanced cruise control system that uses real-time Linux to increase the safety and fuel economy of big-rig trucks. I love working in this area, as no one would disagree that trucking can be improved.

#### There have been a few stories about hacked cars in recent years. Can open source solutions help address this issue?

I presented a talk on precisely this topic, on how Linux can (and cannot) contribute to security solutions in automotive at Southern California Linux Expo 2016 ([Slides][16]). Notably, GENIVI and Automotive Grade Linux have published their code and both projects take patches via Git. Please send your fixes upstream! Many eyes make all bugs shallow.

#### Law enforcement agencies and insurance companies could find plenty of uses for data about drivers. How easy will it be for them to obtain this information?

Good question. The Dedicated Short Range Communication Standard (IEEE-1609) takes great pains to keep drivers participating in Wi-Fi safety messaging anonymous. Still, if you're posting to Twitter from your car, someone will be able to track you.

#### What can developers and private citizens do to make sure civil liberties are protected as automotive technology evolves?

The Electronic Frontier Foundation (EFF) has done an excellent job of keeping on top of automotive issues, having commented through official channels on what data may be stored in automotive "black boxes" and on how DMCA's Provision 1201 applies to cars.

#### What are some of the exciting things you see coming for drivers in the next few years?

Adaptive cruise control and collision avoidance systems are enough of an advance to save lives. As they roll out through vehicle fleets, I truly believe that fatalities will decline. If that's not exciting, I don't know what is. Furthermore, capabilities like automated parking assist will make cars easier to drive and reduce fender-benders.

#### What needs to be built and how can people get involved?

Automotive Grade Linux is developed in the open and runs on cheap hardware (e.g. Raspberry Pi 2 and moderately priced Renesas Porter board) that anyone can buy. GENIVI automotive Linux middleware consortium has lots of software publicly available via Git. Furthermore, there is the ultra cool [OSVehicle open hardware][17] automotive platform.

#### There are many ways for Linux software and open hardware folks with moderate budgets to get involved. Join us at #automotive on Freenode IRC if you have questions.

### Interview with Steven Crumb (by Don Watkins)

#### What's so huge about GENIVI's approach to IVI?

GENIVI filled a huge gap in the automotive industry by pioneering the use of free and open source software, including Linux, for non-safety-critical automotive software like in-vehicle infotainment (IVI) systems. As consumers came to expect the same functionality in their vehicles as on their smartphones, the amount of software required to support IVI functions grew exponentially. The increased amount of software has also increased the costs of building the IVI systems and thus slowed time to market.

GENIVI's use of open source software and a community development model has saved automakers and their software suppliers significant amounts of money while significantly reducing the time to market. I'm excited about GENIVI because we've been fortunate to lead a revolution of sorts in the automotive industry by slowly evolving organizations from a highly structured and proprietary methodology to a community-based approach. We're not done yet, but it's been a privilege to take part in a transformation that is yielding real benefits.

#### How do your major members drive the direction of GENIVI?

GENIVI has a lot of members and non-members contributing to our work. As with many open source projects, any company can influence the technical output by simply contributing code, patches, and time to test. With that said, BMW, Mercedes-Benz, Hyundai Motor, Jaguar Land Rover, PSA, Renault/Nissan, and Volvo are all active adopters of and contributors to GENIVI—and many other OEMs have IVI solutions in their cars that extensively use GENIVI's software.

#### What licenses cover the contributed code?

GENIVI employs a number of licenses ranging from (L)GPLv2 to MPLv2 to Apache 2.0. Some of our tools use the Eclipse license. We have a [public licensing policy][18] that details our licensing preferences.

#### How does a person or group get involved? How important are community contributions to the ongoing success of the project?

GENIVI does its development completely in the open ([projects.genivi.org][19]) and thus, anyone interested in using open software in automotive is welcome to participate. That said, the alliance can fund its continued development in the open through companies [joining GENIVI][20] as members. GENIVI members enjoy a wide variety of benefits, not the least of which is participation in the global community of 140 companies that has been developed over the last six years.

Community is hugely important to GENIVI, and we could not have produced and maintained the valuable software we developed over the years without an active community of contributors. We've worked hard to make contributing to GENIVI as simple as joining an [email list][21] and connecting to the people in the various software projects. We use standard practices employed by many open source projects and provide high-quality tools and infrastructure to help developers feel at home and be productive.

Regardless of someone's familiarity with the automotive software, they are welcome to join our community. People have modified cars for years, so for many people there is a natural draw to anything automotive. Software is the new domain for cars, and GENIVI wants to be the open door for anyone interested in working with automotive, open source software.

-------------------------------
via: https://opensource.com/business/16/5/interview-alison-chaiken-steven-crumb

作者：[Don Watkins][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[1]: https://en.wikipedia.org/wiki/In_car_entertainment
[2]: https://opensource.com/life/16/1/weekly-news-jan-9
[3]: http://projects.genivi.org/smartdevicelink/home
[4]: http://www.genivi.org/
[5]: https://www.linkedin.com/in/stevecrumb
[6]: http://www.genivi.org/genivi-members
[7]: http://www.linuxfoundation.org/
[8]: https://www.automotivelinux.org/
[9]: https://en.wikipedia.org/wiki/Telematics
[10]: https://www.automotivelinux.org/news/announcement/2016/01/ford-mazda-mitsubishi-motors-and-subaru-join-linux-foundation-and
[11]: https://www.linkedin.com/in/alison-chaiken-3ba456b3
[12]: https://www.linkedin.com/in/stevecrumb
[13]: https://opensource.com/users/eximious
[14]: https://en.wikipedia.org/wiki/MeeGo
[15]: http://webinos.org/deliverable-d026-target-platform-requirements-and-ipr/automotive/
[16]: http://she-devel.com/Chaiken_automotive_cybersecurity.pdf
[17]: https://www.osvehicle.com/
[18]: http://projects.genivi.org/how
[19]: http://projects.genivi.org/
[20]: http://genivi.org/join
[21]: http://lists.genivi.org/mailman/listinfo/genivi-projects
