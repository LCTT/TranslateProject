[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to decommission a data center)
[#]: via: (https://www.networkworld.com/article/3439917/how-to-decommission-a-data-center.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

How to decommission a data center
======
Decommissioning a data center is lot more complicated than shutting down servers and switches. Here’s what you should keep in mind.
3dSculptor / Getty Images

About the only thing harder than building a [data center][1] is dismantling one, because the potential for disruption of business is much greater when shutting down a data center than constructing one.

The recent [decommissioning of the Titan supercomputer][2] at the Oak Ridge National Laboratory (ORNL) reveals just how complicated the process can be. More than 40 people were involved with the project, including staff from ORNL, supercomputer manufacturer Cray, and external subcontractors. Electricians were required to safely shut down the 9 megawatt-capacity system, and Cray staff was on hand to disassemble and recycle Titan’s electronics and its metal components and cabinets. A separate crew handled the cooling system. In the end, 350 tons of equipment and 10,800 pounds of refrigerant were removed from the site.

**Read more data center stories**

  * [NVMe over Fabrics creates data-center storage disruption][3]
  * [Data center workloads become more complex][4]
  * [What is data-center management as a service (DMaaS)?][5]
  * [Data center staff aging faster than equipment][6]
  * [Micro-modular data centers set to multiply][7]



While most enterprise IT pros aren’t likely to face decommissioning a computer the size of Titan, it is likely they’ll be involved with dismantling smaller-scale data centers given the trend for companies to [move away from on-premises data centers][8].

The pace of data center closure is going to accelerate over next three or four years, according to Rick Villars, research vice president, datacenter and cloud, at [IDC][9]. "Every company we’ve spoken to is planning to close 10% to 50% of their data centers over the next four years, and in some cases even 100%. No matter who you talk to, they absolutely have on the agenda they want to close data centers," Villars says.

Successfully retiring a data center requires navigating many steps. Here’s how to get started.

### Inventory data-center assets

The first step is a complete inventory. However, given the preponderance of [zombie servers][10] in IT environments, it’s clear that a good number of IT departments don’t have a handle on data-center asset management.

"They need to know what they have. That’s the most basic. What equipment do you have? What apps live on what device? And what data lives on each device?” says Ralph Schwarzbach, who worked as a security and decommissioning expert with Verisign and Symantec before retiring.

All that information should be in a configuration management database (CMDB), which serves as a repository for configuration data pertaining to physical and virtual IT assets. A CMDB “is a popular tool, but having the tool and processes in place to maintain data accuracy are two distinct things," Schwarzbach says.

A CMDB is a necessity for asset inventory, but “any good CMDB is only as good as the data you put in it,” says Al DeRose, a senior IT director responsible for infrastructure design, implementation and management at a large media firm. “If your asset management department is very good at entering data, your CMDB is great. [In] my experience, smaller companies will do a better job of assets. Larger companies, because of the breadth of their space, aren’t so good at knowing what their assets are, but they are getting better.”

### Map dependences among data-center resources

Preparation also includes mapping out dependencies in the data center. The older a data center is, the more dependencies you are likely to find.

It’s important to segment what’s in the data center so that you can move things in orderly phases and limit the risk of something going wrong, says Andrew Wertkin, chief strategy officer with [BlueCat Networks][11], a networking connectivity provider that helps companies migrate to the cloud. "Ask how can I break this into phases that are independent – meaning ‘I can’t move that app front-end because it depends on this database,’" Wertkin says.

The WAN is a good example. Connection points are often optimized, so when you start to disassemble it, you need to know who is getting what in terms of connections and optimized services so you don’t create SLA issues when you break the connection. Changing the IP addresses of well-known servers, even temporarily, also creates connection problems. The solution is to do it in steps, not all at once.

### Questions to ask decomissioning providers

Given the complexities and manpower needs of decommissioning a data center, it’s important to hire a professional who specializes in it.

Experience and track record are everything when it comes to selecting a vendor, says Mike Satter, vice president at [OceanTech][12], which provides data center decommissioning and IT asset disposition services. There are a lot of small companies that say they can decommission a data center and fail because they lack experience and credentials, he says. "I can't tell you how many times we’ve come into a mess where we had to clean up what someone else did. There were servers all over the floor, hardware everywhere," Satter says.

His advice? Ask a lot of questions.

"I love having a client who asks a lot of questions," Satter says. “Don’t be shy to ask for references,” he adds. “If you are going to have someone do work on your house, you look up their references. You better know who the contractor will be. Maybe 10% of the time have I had people actually look into their contractor.”

Among the processes you should ask about and conditions you should expect are:

  * Have the vendor provide you with a detailed statement of work laying out how they will handle every aspect of the data center decommissioning project.
  * Ask the vendor to do a walkthrough with you, prior to the project, showing how they will execute each step.
  * Find out if the vendor outsources any aspect of data center decommissioning, including labor or data destruction.
  * Inquire about responsible recycling (see more below).
  * Ask for references for the last three data center decommissioning clients the vendor serviced.
  * Ask if the vendor will be able to recover value from your retired IT hardware. If so, find out how much and when you could expect to receive the compensation.
  * Ask how data destruction will be handled. If the solution is software based, find out the name of the software.
  * Learn about the vendor’s security protocols around data destruction.
  * Find out where the truck goes when it leaves with the gear.
  * Ask how hazardous materials will be disposed.
  * Ask how metals and other components will be disposed.



### Recycle electronics responsibly

As gear is cleared out of the data center, it’s important to make sure it’s disposed of safely, from both a security and environmental standpoint.

When it comes to electronics recycling, the key certification to look for is the [R2 Standard][13], Satter says. R2 – sometimes referred to as the responsible recycling certification – is a standard for electronics recyclers that requires certified companies to have a policy on managing used and end-of-life electronics equipment, components and materials for reuse, recovery and/or recycling.

But R2 does more than that; it offers a traceable chain of custody for all equipment, tracking who touched every piece and its ultimate fate. R2 certified providers “aren’t outsourced Craigslist tech people. These are people who do it every day," Satter says. "There are techniques to remove that gear. They have a group to do data security on site, and a compliance project manager to make sure compliance is met and the chain of custody is met."

And don’t be cheap, DeRose adds. "When I decommission a data center, I use a well-known company that does asset removal, asset destruction, chain of custody, provides certifications of destruction for hard drives, and proper disposal of toxic materials. All that needs to be very well documented not [only] for the environment’s protection but [also] for the company’s protection. You can’t wake up one morning and find your equipment was found dumped in a landfill or in a rainforest," DeRose says.

Documentation is critical when disposing of electronic waste, echoes Schwarzbach. "The process must capture and store info related to devices being decommissioned: What is the intent for the device, recycling or new service life? What data resides on it? Who owns the data? And [what is] the category of data?"

In the end, it isn't the liability of the disposal company if servers containing customer or medical information turn up at a used computer fair, it's the fault of the owners. "The creator of e-waste is ultimately liable for the e-waste," Schwarzbach says.

### Control who's coming into the data center

Shutting down a data center means one inevitability: You will have to bring in outside consultants to do the bulk of the work, as the ORNL example shows. Chances are, your typical data center doesn't let anywhere near 40 people inside during normal operations. But during decommissioning, you will have a lot of people going in and out, and this is not a step to be taken lightly.

"In a normal scenario, the number of people allowed in the data center is selected. Now, all of a sudden, you got a bunch of contractors coming in to pack and ship, and maybe there’s another 50 people with access to your data center. It’s a process and security nightmare if all these people have access to your boxes and requires a whole other level of vetting," Wertkin says. His solution: Log people in and out and use video cameras.

Any company hired to do a decommissioning project needs to clearly identify the people involved, DeRose says. "You need to know who your company is sending, and they need to show ID.” People are to be escorted in and out and never given a keycard. In addition, contractors should not to be left to decommission any room on their own. There should always be someone on staff overseeing the process, DeRose says.

In short, the decommissioning process means lots of outside, non-staff being given access to your most sensitive systems, so vigilance is mandatory.

None of the steps involved in a data center decommissioning should be hands-off, even when it requires outside experts. For the security and integrity of your data, the IT staff must be fully involved at all times, even if it is just to watch others do their work. When millions of dollars (even depreciated) of server gear goes out the door in the hands of non-employees, your involvement is paramount.

Join the Network World communities on [Facebook][14] and [LinkedIn][15] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3439917/how-to-decommission-a-data-center.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3223692/what-is-a-data-centerhow-its-changed-and-what-you-need-to-know.html
[2]: https://www.networkworld.com/article/3408176/the-titan-supercomputer-is-being-decommissioned-a-costly-time-consuming-project.html
[3]: https://www.networkworld.com/article/3394296/nvme-over-fabrics-creates-data-center-storage-disruption.html
[4]: https://www.networkworld.com/article/3400086/data-center-workloads-become-more-complex-despite-promises-to-the-contrary.html
[5]: https://www.networkworld.com/article/3269265/data-center-management-what-does-dmaas-deliver-that-dcim-doesnt
[6]: https://www.networkworld.com/article/3301883/data-center/data-center-staff-are-aging-faster-than-the-equipment.html
[7]: https://www.networkworld.com/article/3238476/data-center/micro-modular-data-centers-set-to-multiply.html
[8]: https://www.networkworld.com/article/3391465/another-strong-cloud-computing-quarter-puts-pressure-on-data-centers.html
[9]: https://www.idc.com
[10]: https://www.computerworld.com/article/3196355/a-third-of-virtual-servers-are-zombies.html
[11]: https://www.bluecatnetworks.com/
[12]: https://www.oceantech.com/services/data-center-decommissioning/
[13]: https://sustainableelectronics.org/r2-standard
[14]: https://www.facebook.com/NetworkWorld/
[15]: https://www.linkedin.com/company/network-world
