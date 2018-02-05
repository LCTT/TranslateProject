IT disaster recovery: Sysadmins vs. natural disasters | HPE
======

![](https://www.hpe.com/content/dam/hpe/insights/articles/2017/11/it-disaster-recovery-sysadmins-vs-natural-disasters/featuredStory/Sysadmins-vs-natural-disasters-1740.jpg.transform/nxt-1043x496-crop/image.jpeg)

Businesses need to keep going even when faced with torrential flooding or earthquakes. Sysadmins who lived through Katrina, Sandy, and other disasters share real-world advice for anyone responsible for IT during an emergency.

In terms of natural disasters, 2017 has been one heck of a year. Hurricanes Harvey, Irma, and Maria brought destruction to Houston, Puerto Rico, Florida, and the Caribbean. On top of that, wildfires burned out homes and businesses in the West.

It'd be easy to respond with yet another finger-wagging article about [preparing for disasters][1]--and surely it's all good advice--but that doesn't help a network administrator cope with the soggy mess. Most of those well-meant suggestions also assume that the powers that be are cheerfully willing to invest money in implementing them.

We're a little more interested in the real world. Instead, let's put that bad news to some good use.

Case in point: One result of a natural disaster is that the boss may suddenly be willing to find budget for disaster recovery planning. As a New York area sysadmin puts it, "The [greatest benefit I found from Hurricane Sandy][2] is our client's interest in investing back into IT, so hopefully you will welcome bigger budgets as well."

Don't expect that willingness to last long, though. Any sysadmin who'd like to suggest infrastructure improvements is urged to make hay while the sun shines. As another Sandy-survivor IT specialist ruefully remarks, "[Initial interest in IT spending lasted the calendar year for us][3]. By the following year, any plans that hadn't already been put in the works got put on the back burner due to 'budgetary constraints,' and then completely forgotten about by around 6 months later."

It can help to remind management of the cold hard facts before they forget that bad natural disasters can happen to good companies. According to the Institute for Business & Home Safety, [25 percent of businesses that close after a natural disaster never reopen][4]. FEMA thinks that's optimistic. By its measure, "[40 percent of small businesses never reopen their doors][5] following a disaster."

If you're a sysadmin, you can help save your business. Here are some of survivors' best ideas based on what they've learned from the past few natural disasters.

### Have a plan

When the lights flicker and the wind howls like a locomotive, it's time to put your business continuity and disaster recovery plans into operation.

Too many sysadmins report that neither were in place when the storms came. That's not surprising. In 2014, the [Disaster Recovery Preparedness Council][6] found that [73 percent of surveyed businesses worldwide didn't have adequate disaster recovery plans][7].

"Adequate" is a key word. As a sysadmin on Reddit wrote in 2016, "[Our disaster plan is a disaster.][8] All our data is backed up to a storage area network [SAN] about 30 miles from here. We have no hardware to get it back online or have even our core servers up and running within a few days. We're a $4 billion a year company that won't spend a few $100K for proper equipment. Or even some servers at a data center. Our executive team said, 'Meh what are the odds of anything happening' when the hardware proposal was brought up."

Another on the same thread put it more succinctly: "Currently my DR plan is to cry in a dark damp corner and hope nobody cared about anything that was lost."

Get the report from 451 Research - Datacenter Modernization: Trends and Challenges

[Transform with Hybrid IT][9]

If you're crying, let's hope you aren't crying alone. Any disaster plan, even one devised by the IT department, has to ascertain that [you can communicate with humans][10], as sysadmin Jim Thompson learned during Katrina: "Make sure you have a plan to communicate with people. During a serious regional disaster, you will not be able to call anyone with a phone in the affected area code."

One option that may appeal to the technically minded: [ham radio][11]. That [made a difference in Puerto Rico][12].

### Make a wish list

The first step is recognizing the problem. "Many companies are not actually interested in disaster recovery, or they address it reluctantly," says [Joshua Brusse][13], a chief architect at [Micro Focus][14]. "Viewing disaster recovery as an aspect of business continuity is a different perspective. All companies deal with business continuity, so disaster recovery should be considered as part of that."

Ensuring that there's an adequate disaster recovery and business continuity plan in place requires the IT department to document its needs. That's true even if--or particularly when--you don't get your way. As one sysadmin remarks, "I like to have a 'thought dump' location where any and all plans/ideas/improvements can be just dumped in with no limitations or restrictions. [This] is [especially helpful for when you propose a change][15], it gets shot down, and six months later that situation you warned about came up." Now you have everything prepared and can start the discussion: "As we discussed back in April…"

So, what can you do when your executive team responds to the business continuity plan with "Meh what are the odds of anything happening?" Shockingly poor judgement as that is, one sysadmin suggests it's also completely normal behavior for the executive layer. In situations this dire, experienced sysadmins say document the events. Be clear that you told the executives what needed to be done and that [they refused to do so][16]. "The general idea is to have a paper trail long enough for them to hang themselves," the sysadmin adds.

If that doesn't work, the experience of bringing back a flooded data center will serve you well in [a new job search][17].

### Protect the physical infrastructure

"[Our office is an old decrepit building][18]," reported one sysadmin after Harvey hammered Houston. "We went into the building blind and the infrastructure in place was terrible. We literally just finished the last of the drops we needed in that building and now it's all under water."

Nonetheless, if you want the data center to keep running--or to get back up and working after a storm--you need to ensure the facility can stand up to not only the kind of disasters expected in your area but the unexpected ones as well. One reason Sandy was devastating is that the New York area wasn't prepped for that sort of weather system. A sysadmin in San Francisco knows why it's important to ensure the company's servers are in a building that can withstand a magnitude 7 earthquake. A business in St. Louis knows how to respond to tornadoes. But you should prepare for every eventuality: a tornado in California, an earthquake in Missouri, or [a zombie apocalypse][19] (which also gives you justification for a chainsaw in the IT budget).

In Houston's case, [most data centers stayed up][20] and running because they were built to withstand storms and floods. [Data Foundry][21]'s chief technology officer, Edward Henigin, says of one of its data centers, "Houston 2 is a purpose-built facility designed to withstand Category 5 hurricane wind speeds. This site has not lost utility power, and we have not had to transition to our backup generators."

That's the good news. The bad news is, as superstorm Sandy showed in 2012, if your [data center isn't ready to handle flooding][22], you're in for a world of trouble. Customers of one failed data center, [Datagram][23], included high-profile sites Gawker, Gizmodo, and Buzzfeed.

Of course, sometimes there's nothing you can do. As one San Juan, Puerto Rico, sysadmin sadly wrote when Irma came through, "Generator took a dump. Server room running on batteries but no [air conditioning]. [Bye bye servers][24]." The sysadmin couldn't fail over to disaster recovery because the MPLS (Multiprotocol Label Switching) line was also down: "Fun day."

To sum up, IT professionals need to know their area, know their risks, and place their servers in data centers that can handle the local conditions.

### An argument for the cloud

The best way to avoid an IT data center failure when a storm rolls through is to make sure the backup data center is elsewhere. That requires sensible decision-making in locating them. Your backup data center should not be in a region that can be affected by the same natural disaster; place your resources in more than one availability zone. Think backup and primary along the same fault line in an earthquake or vulnerable to flooding from linked water sources.

Some sysadmins [use the cloud for redundancy][25]. For example, Microsoft Azure storage is always replicated to ensure durability and high availability. Depending on the options you choose, Azure replication copies your data, either within the same data center or to a second data center. Most public clouds offer similar automatic backup services to help ensure data stays safe no matter what happens to your local data center--unless your cloud provider is in the same storm path.

Expensive? Yes. As expensive as being down for a day or two? No.

Don't trust the public cloud? Consider a colocation (colo) service. With colo, you still own your hardware and run your own applications, but the hardware can be miles away from trouble. For instance, during Harvey, one company "virtually" moved all its resources from Houston to its colo in Austin, Texas. But those local data centers and colocation sites need to be ready to handle disasters; it's one of the criteria you should use in choosing them. For example, a Seattle sysadmin looking for colocation space considered, "It was all about their earthquake and drought protection (overbuilt foundations and water trucks to feed the chillers)."

### When the lights go out

The most [common cause of declared disaster is power failures][26], as Forrester Research analyst Rachel Dines reported in a survey for [Disaster Recovery Journal][27]. While you can work against those in ordinary circumstances, hurricanes, fires, and floods test the equipment past its limits.

One sysadmin's tongue-in-cheek plan? "Turn off what you can before the UPS dies, let crash what you can't. Then, [drink until power comes back on][28]."

A more serious plan driven by IT staff in the wake of 2016's Delta and Southwest outages was for a managed service provider to [deploy uninterruptible power supplies][29] to its clients: "On the critical pieces, we use a combination of SNMP signalling and PowerChute Network Shutdown (PCNS) clients to shut things down in the event of a power failure. Bringing things back up, well... that depends on the client. Some are automatic, and some require manual intervention."

Another approach is to support the data center with utility power from two substations. For example, the [Seattle Westin Building data cente][30]r has multiple 13.4-kilovolt utility feeds, diverse power substations, and multiple 480-volt three-phase transformer vaults.

Serious power failure prevention systems are not "one size fits all" units. Sysadmins should requisition a [custom-designed diesel generator for the data center][31]. Besides being tuned for your specific needs, generators must be capable of jumping to full speed in moments and accept full-power loads without impacting the load performance.

These generators must also be protected. For example, putting your generators on the ground floor in a flood plain is not a smart idea. The data centers on Broad Street in New York had fits during Superstorm Sandy because the backup generators' fuel tanks were in the basement--and they were flooded out. While a ["bucket brigade" relaying 5-gallon buckets of diesel fuel up 17 flights of stairs to the generator][32] kept [Peer 1 Hosting][33] in business, this is not a viable business continuity plan.

As most data center professionals know, if you have time--say, a hurricane is a day away--make sure your generator is working, fully fueled up, and is ready to kick on when the power lines get cut. Of course, you should have been testing your generator every month anyway. You have been doing that? Right? Right!

### Testing your confidence in backups

Ordinary users almost never make backups, and fewer still check to make sure their backups are actually any good. Sysadmins know better.

Some [IT departments are looking into moving their backups to the cloud][34]. But some sysadmins aren't sold on it yet--for good reason. One recently reported, "After [five solid days of restoring [400 GB of] data from Amazon Glacier][35], I owe Amazon nearly $200 in data transfer fees and [I] still have an inconsistent restore state and [am] missing 100 GB of my files."

As a result, some sysadmins still prefer tape backup. Tape is certainly not fashionable, but as operating system guru Andrew S. Tanenbaum says, "[Never underestimate the bandwidth of a station wagon full of tapes hurtling down the highway][36]."

These days, tape can handle 10 terabytes per tape; there are experiments underway that take tape up to 200 TB. Technologies such as the [Linear Tape File System][37] enable you to read tape data as if it were just another network drive.

Yet for many, tape is the [option of absolute last resort][38]. That's fine, because backup should have plenty of options. In this case, says one sysadmin, "we would have to fail with: [Windows] server level VSS [Volume Shadow Storage] snapshots, SAN level volume snapshots, and SAN level offsite archived snapshot copies. But if, hypothetically, something happened that nuked our VM, the SAN, and the backup SAN, we could still get the tapes back and recover the data."

When trouble is coming your way, use replication tools such as [Veeam][39], which create a virtual machine replica of your servers. If there's a failure, the replicas are automatically spun up. No fuss, no muss, as one sysadmin says in the popular sysadmin post, "[I love you Veeam.][40]"

### Network? What network?

Of course, no cloud, no colo, and no remote data center helps you if staff can't reach their services. You don't need a natural disaster to justify redundant Internet connections. All it takes is a backhoe cable cut or severed fiber lines to give you a bad day at work.

"Ideally," one sysadmin wisely observes, "you should have [two wired Internet connections to two ISPs with separate infrastructures][41]. You do not want to find out both ISPs are dependent on the same fiber cable, for example. Nor do you want to use two local ISPs and find out they are both dependent on Level 3 for their upstream bandwidth."

Smart sysadmins know their corporate Internet connections [must be business-class connections with a service-level agreement][42] (SLA) that includes a "time to repair" clause. Better still is to get a [dedicated Internet access][43] (DIA) circuit. Technically, they're no different than any other Internet connection. The difference is that a DIA is not a "best effort" connection. Instead, you get a specified amount of bandwidth that is dedicated for your use and comes with a SLA. They're not cheap, but as the saying goes, "Fast. Reliable. Cheap. Pick any two." When it's your business on the line and a storm is coming your way, "reliable" has to be one of your two picks.

### When the storm skies clear

You can't prepare for all disasters, but you can plan for many of them. With a well-thought-out and tested disaster recovery and business continuity plan that is followed to the letter, your company can stay afloat while your rivals are drowning.

### Sysadmins vs. disasters: Lessons for leaders

  * How many times must your IT staff say this: Don't just make backups. Test backups.
  * No power? No company. Make certain your servers' emergency power is sufficient for your needs and work.
  * If your company survives a natural disaster--or dodges one--wise sysadmins know that this is the time to ask management for the disaster recovery budget they've been postponing. Because next time, you might not be so lucky.



--------------------------------------------------------------------------------

via: https://www.hpe.com/us/en/insights/articles/it-disaster-recovery-sysadmins-vs-natural-disasters-1711.html

作者：[Steven-J-Vaughan-Nichols][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.hpe.com/us/en/insights/contributors/steven-j-vaughan-nichols.html
[1]:https://www.hpe.com/us/en/insights/articles/what-is-disaster-recovery-really-1704.html
[2]:https://www.reddit.com/r/sysadmin/comments/6wricr/dear_houston_tx_sysadmins/
[3]:https://www.reddit.com/r/sysadmin/comments/6wricr/dear_houston_tx_sysadmins/dma6gse/
[4]:https://disastersafety.org/wp-content/uploads/open-for-business-english.pdf
[5]:https://www.fema.gov/protecting-your-businesses
[6]:http://drbenchmark.org/about-us/our-council/
[7]:https://www.prnewswire.com/news-releases/global-benchmark-study-reveals-73-of-companies-are-unprepared-for-disaster-recovery-248359051.html
[8]:https://www.reddit.com/r/sysadmin/comments/3cob1k/what_does_your_disaster_recovery_plan_look_like/csxh8sn/
[9]:https://www.hpe.com/us/en/resources/servers/datacenter-trends-challenges.html?jumpid=in_insights~510287587~451research_datacenter~sjvnSysadmin
[10]:http://www.theregister.co.uk/2015/07/12/surviving_hurricane_katrina
[11]:https://theprepared.com/guides/beginners-guide-amateur-ham-radio-preppers/
[12]:http://www.npr.org/2017/09/29/554600989/amateur-radio-operators-stepped-in-to-help-communications-with-puerto-rico
[13]:http://www8.hp.com/us/en/software/joshua-brusse.html
[14]:https://www.microfocus.com/
[15]:https://www.reddit.com/r/sysadmin/comments/6wricr/dear_houston_tx_sysadmins/dma87xv/
[16]:https://www.hpe.com/us/en/insights/articles/my-boss-asked-me-to-do-what-how-to-handle-worrying-work-requests-1710.html
[17]:https://www.hpe.com/us/en/insights/articles/sysadmin-survival-guide-1707.html
[18]:https://www.reddit.com/r/sysadmin/comments/6wk92q/any_houston_admins_executing_their_dr_plans_this/dm8xj0q/
[19]:https://community.spiceworks.com/how_to/1243-ensure-your-dr-plan-is-ready-for-a-zombie-apocolypse
[20]:http://www.datacenterdynamics.com/content-tracks/security-risk/houston-data-centers-withstand-hurricane-harvey/98867.article
[21]:https://www.datafoundry.com/
[22]:http://www.datacenterknowledge.com/archives/2012/10/30/major-flooding-nyc-data-centers
[23]:https://datagram.com/
[24]:https://www.reddit.com/r/sysadmin/comments/6yjb3p/shutting_down_everything_blame_irma/
[25]:https://www.hpe.com/us/en/insights/articles/everything-you-need-to-know-about-clouds-and-hybrid-it-1701.html
[26]:https://www.drj.com/images/surveys_pdf/forrester/2011Forrester_survey.pdf
[27]:https://www.drj.com
[28]:https://www.reddit.com/r/sysadmin/comments/4x3mmq/datacenter_power_failure_procedures_what_do_yours/d6c71p1/
[29]:https://www.reddit.com/r/sysadmin/comments/4x3mmq/datacenter_power_failure_procedures_what_do_yours/
[30]:https://cloudandcolocation.com/datacenters/the-westin-building-seattle-data-center/
[31]:https://www.techrepublic.com/article/what-to-look-for-in-a-data-center-backup-generator/
[32]:http://www.datacenterknowledge.com/archives/2012/10/31/peer-1-mobilizes-diesel-bucket-brigade-at-75-broad
[33]:https://www.cogecopeer1.com/
[34]:https://www.reddit.com/r/sysadmin/comments/7a6m7n/aws_glacier_archival/
[35]:https://www.reddit.com/r/sysadmin/comments/63mypu/the_dangers_of_cloudberry_and_amazon_glacier_how/
[36]:https://en.wikiquote.org/wiki/Andrew_S._Tanenbaum
[37]:http://www.snia.org/ltfs
[38]:https://www.reddit.com/r/sysadmin/comments/5visaq/backups_how_many_of_you_still_have_tapes/de2d0qm/
[39]:https://helpcenter.veeam.com/docs/backup/vsphere/failover.html?ver=95
[40]:https://www.reddit.com/r/sysadmin/comments/5rttuo/i_love_you_veeam/
[41]:https://www.reddit.com/r/sysadmin/comments/5rmqfx/ars_surviving_a_cloudbased_disaster_recovery_plan/dd90auv/
[42]:https://www.hpe.com/us/en/insights/articles/how-do-you-evaluate-cloud-service-agreements-and-slas-very-carefully-1705.html
[43]:http://www.e-vergent.com/what-is-dedicated-internet-access/
