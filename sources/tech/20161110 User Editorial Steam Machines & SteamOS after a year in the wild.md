jayjay823 翻译中

User Editorial: Steam Machines & SteamOS after a year in the wild
====


On this day, last year, [Valve released Steam Machines onto the world][2], after the typical Valve delays. While the state of the Linux desktop regarding gaming has improved, Steam Machines have not taken off as a platform, and SteamOS remains stagnant. What happened with these projects from Valve? Why were they created, why did they fail, and what could have been done to make them succeed?

**Context**

In 2012, when Windows 8 released, it included an app store, much like iOS and Android. With the new touch-friendly user interface Microsoft debuted, there was a new set of APIs available called “WinRT,” for creating these immersive touch-friendly applications in the UI language called “Metro.” Applications created with this new API, however, could only be distributed via the Windows Store, with Microsoft taking out a 30% cut, just like the other stores. To Gabe Newell, CEO of Valve, this was unacceptable, and he saw the risks of Microsoft using its position to push the Windows Store and Metro applications to crush Valve, like what they had done to Netscape using Internet Explorer.

To Valve, the strength of the PC running Windows was it that was an open platform, where anyone could run whatever they want without control over the operating system or hardware vendor. The alternative to these proprietary platforms closing in on third-party application stores like Steam was to push a truly open platform that grants freedoms to change, to everyone – Linux. Linux is just a kernel, but you can easily create an operating system with it and other software like the GNU core utilities and Gnome, such as Ubuntu. While pushing Ubuntu and other Linux distributions would allow Valve a sanctuary platform in case Microsoft or Apple turned hostile, Linux gave them possibilities to create a new platform.

**Conception**

Valve seemed to have found an opportunity in the console space, if we can call Steam Machines consoles. To achieve the user interface expectations of a console, being used on a large screen television from afar, Big Picture Mode was created. A core principle of the machines was openness; the software was able to be swapped out for Windows, as an example, and the CAD designs for the controller are available for people’s projects.

Originally, Valve had planned to create their own box as a “flagship” machine. However, these only shipped as prototypes to testers in 2013\. They would also let other OEMs like Dell create their own Steam Machines as well, and allow a variety of pricing and specification options. A company called “Xi3” showed their small box, small enough to fit into a palm, as a possible candidate to become a premiere Steam Machine, which created more hype around Steam Machines. Ultimately, Valve decided to only go with OEM partners to make and advertise Steam Machines, rather than doing it themselves.

More “out there” ideas were considered. Biometrics, gaze tracking, and motion controllers were considered for the controller. Of them, the released Steam Controller had a gyroscope, and the HTC Vive controllers had various tracking and motion features that may have been originally intended for the original controller concepts. The controller was also originally intended to be more radical in its approach, with a touchscreen in the middle that had customizable, context-sensitive actions. Ultimately, the launch controller was more conservative, but still had features like the dual trackpads and advanced software that gave it flexibility. Valve had also considered making a version of Steam Machines and SteamOS for smaller hardware like laptops. This ultimately never bore any fruit, though the “Smach Z” handheld could be compared to this.

In [September 2013][3], Valve had announced Steam Machines and SteamOS, with an expected release in the middle of 2014\. The aforementioned 300 prototype machines were released to testers in December, and in January, 2000 more machines were provided to developers. SteamOS was released for testers experienced with Linux to try out. With the feedback given, Valve had decided to delay the release until November 2015.

The late launch caused problems with partners; Dell’s Steam Machine was launched a year early running Windows as the Alienware Alpha, with extra software to improve usability with a controller.

**Launch**

With the launch, Valve and their OEM partners released their machines, and Valve also released the Steam Controller and the Steam Link. A retail presence was established with GameStop and other brick and mortar stores providing space. Before release, some OEMs pulled out of the launch; Origin PC and Falcon Northwest, two high-end boutique builders. They had claimed performance issues and limitations had made them decide not to ship SteamOS.

The machines had launched to mixed reviews. The Steam Link was praised and many had considered buying one for their existing PC instead of buying a Steam Machine for the living room. The Steam Controller reception was muddled, due to its rich feature set but high learning curve. The Steam Machines themselves ultimately launched to the muddiest reception, however. Reviewers like LinusTechTips noticed glaring defects with the SteamOS software, including performance issues. Many of the machines were criticized for their high price point and poor value, especially when compared to the option of building a PC from the perspective of a PC gamer, or the price in comparison to other consoles. The use of SteamOS was criticized over compatibility, bugs, and lower performance than Windows. Of the available options, the Alienware Steam Machine was considered to be the most interesting option due to its value relative to other machines and small form factor.

By using Debian Linux as the base, Valve had many “launch titles” for the platform, as they had a library of pre-existing Linux titles. The initial availability of games was seen as favourable over other consoles. However, many titles originally announced for the platform never came out, or came out much later. Rocket League and Mad Max only came out only recently after the initial announcements a year ago, and titles like The Witcher 3 and Batman: Arkham Knight never came for the platform, despite initial promises from Valve or publishers. In the case of The Witcher 3, the developer, CD Projekt Red, had denied they ever announced a port, despite their game appearing in a list of titles on sale that had or were announced to have Linux and SteamOS support. In addition, many “AAA” titles have not been ported; though this situation continues to improve over time.

**Neglect**

With the Steam Machines launched, developers at Valve had moved on to other projects. Of the projects being worked on, virtual reality was seen as the most important, with about a third of employees working on it as of June. Valve had seen virtual reality as something to develop, and Steam as the prime ecosystem for delivering VR. Using HTC to manufacture, they had designed their own virtual reality headset and controllers, and would continue to develop new revisions. However, Linux and Steam Machines had fallen to the wayside with this focus. SteamVR, until recently, did not support Linux (it's still not public yet, but it was shown off at SteamDevDays on Linux), which put into question Valve’s commitments to Steam Machines and Linux as an open platform with a future.

There has been little development to SteamOS itself. The last major update, SteamOS 2.0 was mostly synchronizing with upstream Debian and required a reinstallation, and continued patches simply continue synchronizing with upstream sources. While Valve has made improvements to projects like Mesa, which have improved performance for many users, it has done little with Steam Machines as a product.

Many features continue to go undeveloped. Steam’s built in functionality like chat and broadcasting continue to be weak, but this affects all platforms that Steam runs on. More pressingly, services like Netflix, Twitch, and Spotify are not integrated into the interface like most major consoles, but accessing them requires using the browser, which can be slow and clunky, if it even achieves what is wanted, or to bring in software from third-party sources, which requires using the terminal, and the software might not be very usable using a controller –this is a poor UX for what’s considered to be an appliance.

Valve put little effort into marketing the platform, preferring to leave this to OEMs. However, most OEMs were either boutique builders or makers or barebones builders. Of the OEMs, only Dell was the major player in the PC market, and the only one who pushed Steam Machines with advertisements.

Sales were not strong. With 500,000 controllers sold 7 months on (stated in June 2016), including those bundled with a Steam Machine. This puts retail Steam Machines, not counting machines people have installed SteamOS on, in the low hundred thousand mark. Compared to the existing PC and console install bases, this is low.

**Post-mortem thoughts**

So, with the story of what happened, can we identify why Steam Machines failed, and ways they could succeed in the future?

_Vision and purpose_

Steam Machines did not make clear what they were in the market, nor did any advantages particularly stand out. On the PC flank, building PCs had become popular and is a cheaper option with better upgrade and flexibility options. On the console flank, they were outflanked by consoles with low initial investment, despite a possibly higher TCO with game prices, and a far simpler user experience.

With PCs, flexibility is seen as a core asset, with users being able to use their machines beyond gaming, doing work and other tasks. While Steam Machines were just PCs running SteamOS with no restrictions, the SteamOS software and marketing had solidified their view as consoles to PC gamers, compounded by the price and lower flexibility in hardware with some options. In the living room where these machines could have made sense to PC gamers, the Steam Link offered a way to access content on a PC in another room, and small form factor hardware like NUCs and Mini-ITX motherboards allowed for custom built PCs that are more socially acceptable in living rooms. The SteamOS software was also available to “convert” these PCs into Steam Machines, but people seeking flexibility and compatibility often opted for a Linux or Windows desktop. Recent strides in Windows and desktop Linux have simplified maintenance tasks associated with desktop-experience computers, automating most of it.

With consoles, simplicity is a virtue. Even as they have expanded in their roles, with media features often a priority, they are still a plug and play experience where compatibility and experience are guaranteed, with a low barrier of entry. Consoles also have long life cycles, ranging from four to seven years, and the fixed hardware during this life cycle allow developers to target and optimize especially for their specifications and features. New mid-life upgrades like “Scorpio” and PlayStation 4 Pro may change the unified experience previously shared by users, but manufactures are requiring games to work on the original model consoles to avoid the most problematic aspects. To keep users attached to the systems, social networks and exclusive games are used. Games also come on discs that can be freely reused and resold, which is a positive for retailers and users. Steam Machines have none of these guarantees; they carry PC complexity and higher initial prices despite a living room friendly exterior.

_Reconciliation_

With this, Steam Machines could be seen as a “worst of both worlds” product, carrying the burdens of both kinds of product, without showing clearly as one or the other, or some kind of new product category. There also exist many deficiencies that neither party experiences, like lack of AAA titles that appear on consoles and Windows PCs, and lack of clients for services like Netflix. Despite this, Valve has shown little effort into improving the product or even trying to resolve the seemingly contradictory goals like the mutual distrust of PC and console gaming.

Some things may make it impossible to reconcile the two concepts into one category or the other, though. Things like graphics settings and mods may make it hard to create a foolproof experience, and the complexity of the underlying system appears from time to time.

One of the most complex parts is the concept of having a lineup – users need to evaluate not only the costs and specifications of a system, but its value and value relative to other systems. You need some way for the user to know that their hardware can run any given game, either by some automated benchmark system with comparison, or a grading system, though these need to be simple and need to support (almost) every game in the library. In addition, you also need to worry about how these systems and grades will age – what does a “2016 Grade A” machine mean three years from now?

_Valve, effort, and organization_

Valve’s organizational structure may be detrimental to creating platforms like Steam Machines, let alone maintaining services like Steam. Their mostly leaderless structure with people supposedly moving their desks to ad-hoc units working on projects that they alone decide to work on can be great for creative endeavours, as well as research and development. It’s said Valve only hires what they consider to be the “cream of the crop,” with very strict standards, tying them to what they deem more "worthy" work. This view may be inaccurate though; as cliques often exist, the word of Gabe Newell is more important than the “leaked” employee handbook lets on, and people hired and then fired as needed, as a form of contractor working on certain aspects.

However, this leaves projects that aren’t glamorous or interesting, but need persistent and often mundane work, to wither on the vine. Customer support for Valve has been a constant headache, with enraged users felt ignored, and Valve sometimes only acting when legally required to do so, like with the automated refund system that was forced into action by Australian and European legislation, or the Counter-Strike: Global Offensive item gambling site controversy involving the gambling commission of Washington State that’s still ongoing.

This has affected Steam Machines as a result. With the launch delayed by a year, some partners’ hands were forced, by Dell launching the Alienware Steam Machine a year earlier as the Alienware Alpha – causing the hardware to be outdated on launch. These delays may have also affected game availability as well. The opinions of developers and hardware partners as a result of the delayed and non-monumental launch are not clear. Valve’s platform for virtual reality simply wasn’t available on Linux, and as such, SteamOS, until recently, even as SteamVR was receiving significant developer effort.

The “long game”

Valve is seen as playing a “long game” with Steam Machines and SteamOS, though it appears as if there is no roadmap. An example of Valve aiming for the long term is with Steam, from its humble and initially reviled beginnings as a patching platform for their games to the popular distribution and social network it is today. It also helped that Steam was required to play Valve’s games like Half-Life 2 and Counter-Strike 1.6\. However, it doesn’t seem as if Valve is putting in the effort to Steam Machines as they did with Steam before. There is also entrenched competition that Steam in the early days never really dealt with. Their competition includes arguably Valve itself, with Steam on Windows.

_Gambit_

With the lack of developments in Steam Machines, one wonders if the platform was a bargaining chip of sorts. Steam Machines had been originally started over Valve’s Linux efforts took fruit because of concerns that Microsoft and Apple would have pushed them out of the market with native app stores, and Steam Machines grew so Valve would have a safe haven in case this happened, and a bargaining chip so Valve can remind the developers of its host platforms of possible independence. When these turned out to be non-threatening, Valve slowed down development. I don’t see this however; Valve has expended a lot of goodwill with hardware partners and developers trying to push this, only to halt it. You could say both Microsoft and Valve called each other’s bluffs – Microsoft with a locked-down Windows 8, and Valve’s capability as an independent player.

Even then, who is to say developers wouldn’t follow Microsoft with a locked-in platform, if they can offer superior deals to publishers, or better customer relationships? In addition, now Microsoft is pushing Xbox on Windows integration with cross-buy, Xbox Live integration, and Xbox exclusive games on Windows, all while preserving Windows as an open platform – arguably more a threat to Steam.

Another point you could argue is that all of this with Steam Machines was simply to push Linux adoption with PC gaming, and Steam Machines were simply to make it more palatable to publishers and developers by implying a large push and continued support. However, this made it an awfully expensive gambit, and developers continued to support Linux before and after Steam Machines, and could have backfired with developers pulling out of Linux due to the lack of the Promised Land of SteamOS coming.

**My opinions on what could have been done**

I think there’s an interesting product with Steam Machines, and that there is a market for it, but lack of interest and effort, as well as possible confusion in what it should have been has been damaging for it. I see Steam Machines as a way to cut out the complexity of PC gaming of worrying about parts, life cycles, and maintenance; while giving the advantages like cheap games, mods, and an open platform that can be fiddled with if the user desires. However, they need to get core aspects like pricing, marketing, lineup, and software right.

I think Steam Machines can make compromises on things like upgradability (Though it’s possible to preserve this – but it should be done with attention to user experience.) and choices, to reduce friction. PCs would still exist to these options. The paralysis of choice is a real dilemma, and the sheer amount of poorly valued options available with Steam Machines didn't help. Valve needs a flagship machine to lead Steam Machines. Arguably, the Alienware model was close, but it wasn’t made officially so. There’s good industrial design talent in Valve, and if they focused on their own machine, and with effort put in, it might be worth it. A company like Dell or HTC can manufacture for Valve, bringing their experience in. Defining life cycles and only having one or two specifications updated periodically would help, especially if they worked with developers to establish this is a baseline that should be supported. I’m not sure with OEMs; if Valve is putting their effort behind one machine, they might be made redundant and ultimately only hindering development of the platform.

Addressing the software issues is essential. The lack of integration with services like Netflix and Twitch that exist fluidly on console and easily put into place on PC, despite living room user interface issues, are holding Steam Machines back. Although Valve has slowly been acquiring movie licenses for distribution on Steam, people will use existing and trusted streaming sources. This needs to be addressed, especially as people use their consoles as parts of their home theatre. Fixing issues with the Steam client and platform are essential, and feature parity with other platforms is a good idea. Performance issues with Linux and its graphics stack are also a problem, but this is slowly improving. Getting ports of games will also be another issue. Game porting shops like Feral Interactive and Aspyr Media help the library, but they need to be contracted by publishers and developers, and they often use wrappers that add overhead. Valve has helped studios directly with porting, such as with Rocket League, but this has rarely happened and when it did, slowly at the typical Valve pace. The monolith of AAA games can’t be ignored either – the situation has improved dramatically, but studios like Bethesda are still reluctant to port, especially with a small user base, lack of support from Valve with Steam Machines even if Linux is doing relatively well, and the lack of extra DRM like Denuvo.

Valve also needs to put effort into the other bits beyond hardware and software. With one machine, they have an interest and can subsidize the hardware effectively. This would put it into parity with consoles, and possibly cheaper than custom built PCs. Efforts to marketing the product to market segments that would be interested in the machines are essential, whatever they are. (I myself would be interested in the machines. I don’t like the hassle of dealing with PC building or the premium on prebuilt machines, but consoles often lack the games I want to play, and I have an existing library of games on Steam I acquired cheaply.) Retail partners may not be effective, due to their interest in selling and reselling physical copies of games.

Even with my suggestions towards the platform and product, I’m not sure how effective it would be to help Steam Machines achieve their full potential and do well in the marketplace. Ultimately, learning from not just your own mistakes, but the mistakes of previous entrants like 3DO and Pippin who relied on an open platform or were descended from desktop-experience computing, which are relevant to Valve’s current situation, and the future of Nintendo's Switch, which steps into the realm of possible confusion between values.

_Note: Clearing up done by liamdawe, all thoughts are from the submitter._ 

This article was submitted by a guest, we encourage anyone to [submit their own articles][1].

--------------------------------------------------------------------------------

via: https://www.gamingonlinux.com/articles/user-editorial-steam-machines-steamos-after-a-year-in-the-wild.8474

作者：[calvin][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.gamingonlinux.com/profiles/5163
[1]:https://www.gamingonlinux.com/submit-article/
[2]:https://www.gamingonlinux.com/articles/steam-machines-steam-link-steam-controller-officially-released-steamos-sale.6201
[3]:https://www.gamingonlinux.com/articles/valve-announces-steam-machines-you-can-win-one-too.2469
