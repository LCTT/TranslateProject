Why Mainframes Aren't Going Away Any Time Soon
======

![](http://www.datacenterknowledge.com/sites/datacenterknowledge.com/files/styles/article_featured_standard/public/ibm%20z13%20mainframe%202015%20getty.jpg?itok=uB8agshi)

IBM's last earnings report showed the [first uptick in revenue in more than five years.][1] Some of that growth was from an expected source, cloud revenue, which was up 24 percent year over year and now accounts for 21 percent of Big Blue's take. Another major boost, however, came from a spike in mainframe revenue. Z series mainframe sales were up 70 percent, the company said.

This may sound somewhat akin to a return to vacuum tube technology in a world where transistors are yesterday's news. In actuality, this is only a sign of the changing face of IT.

**Related:** [One Click and Voilà, Your Entire Data Center is Encrypted][2]

Modern mainframes definitely aren't your father's punch card-driven machines that filled entire rooms. These days, they most often run Linux and have found a renewed place in the data center, where they're being called upon to do a lot of heavy lifting. Want to know where the largest instance of Oracle's database runs? It's on a Linux mainframe. How about the largest implementation of SAP on the planet? Again, Linux on a mainframe.

"Before the advent of Linux on the mainframe, the people who bought mainframes primarily were people who already had them," Leonard Santalucia explained to Data Center Knowledge several months back at the All Things Open conference. "They would just wait for the new version to come out and upgrade to it, because it would run cheaper and faster.

**Related:** [IBM Designs a “Performance Beast” for AI][3]

"When Linux came out, it opened up the door to other customers that never would have paid attention to the mainframe. In fact, probably a good three to four hundred new clients that never had mainframes before got them. They don't have any old mainframes hanging around or ones that were upgraded. These are net new mainframes."

Although Santalucia is CTO at Vicom Infinity, primarily an IBM reseller, at the conference he was wearing his hat as chairperson of the Linux Foundation's Open Mainframe Project. He was joined in the conversation by John Mertic, the project's director of program management.

Santalucia knows IBM's mainframes from top to bottom, having spent 27 years at Big Blue, the last eight as CTO for the company's systems and technology group.

"Because of Linux getting started with it back in 1999, it opened up a lot of doors that were closed to the mainframe," he said. "Beforehand it was just z/OS, z/VM, z/VSE, z/TPF, the traditional operating systems. When Linux came along, it got the mainframe into other areas that it never was, or even thought to be in, because of how open it is, and because Linux on the mainframe is no different than Linux on any other platform."

The focus on Linux isn't the only motivator behind the upsurge in mainframe use in data centers. Increasingly, enterprises with heavy IT needs are finding many advantages to incorporating modern mainframes into their plans. For example, mainframes can greatly reduce power, cooling, and floor space costs. In markets like New York City, where real estate is at a premium, electricity rates are high, and electricity use is highly taxed to reduce demand, these are significant advantages.

"There was one customer where we were able to do a consolidation of 25 x86 cores to one core on a mainframe," Santalucia said. "They have several thousand machines that are ten and twenty cores each. So, as far as the eye could see in this data center, [x86 server workloads] could be picked up and moved onto this box that is about the size of a sub-zero refrigerator in your kitchen."

In addition to saving on physical data center resources, this customer by design would likely see better performance.

"When you look at the workload as it's running on an x86 system, the math, the application code, the I/O to manage the disk, and whatever else is attached to that system, is all run through the same chip," he explained. "On a Z, there are multiple chip architectures built into the system. There's one specifically just for the application code. If it senses the application needs an I/O or some mathematics, it sends it off to a separate processor to do math or I/O, all dynamically handled by the underlying firmware. Your Linux environment doesn't have to understand that. When it's running on a mainframe, it knows it's running on a mainframe and it will exploit that architecture."

The operating system knows it's running on a mainframe because when IBM was readying its mainframe for Linux it open sourced something like 75,000 lines of code for Linux distributions to use to make sure their OS's were ready for IBM Z.

"A lot of times people will hear there's 170 processors on the Z14," Santalucia said. "Well, there's actually another 400 other processors that nobody counts in that count of application chips, because it is taken for granted."

Mainframes are also resilient when it comes to disaster recovery. Santalucia told the story of an insurance company located in lower Manhattan, within sight of the East River. The company operated a large data center in a basement that among other things housed a mainframe backed up to another mainframe located in Upstate New York. When Hurricane Sandy hit in 2012, the data center flooded, electrocuting two employees and destroying all of the servers, including the mainframe. But the mainframe's workload was restored within 24 hours from the remote backup.

The x86 machines were all destroyed, and the data was never recovered. But why weren't they also backed up?

"The reason they didn't do this disaster recovery the same way they did with the mainframe was because it was too expensive to have a mirror of all those distributed servers someplace else," he explained. "With the mainframe, you can have another mainframe as an insurance policy that's lower in price, called Capacity BackUp, and it just sits there idling until something like this happens."

Mainframes are also evidently tough as nails. Santalucia told another story in which a data center in Japan was struck by an earthquake strong enough to destroy all of its x86 machines. The center's one mainframe fell on its side but continued to work.

The mainframe also comes with built-in redundancy to guard against situations that would be disastrous with x86 machines.

"What if a hard disk fails on a node in x86?" the Open Mainframe Project's Mertic asked. "You're taking down a chunk of that cluster potentially. With a mainframe you're not. A mainframe just keeps on kicking like nothing's ever happened."

Mertic added that a motherboard can be pulled from a running mainframe, and again, "the thing keeps on running like nothing's ever happened."

So how do you figure out if a mainframe is right for your organization? Simple, says Santalucia. Do the math.

"The approach should be to look at it from a business, technical, and financial perspective -- not just a financial, total-cost-of-acquisition perspective," he said, pointing out that often, costs associated with software, migration, networking, and people are not considered. The break-even point, he said, comes when at least 20 to 30 servers are being migrated to a mainframe. After that point the mainframe has a financial advantage.

"You can get a few people running the mainframe and managing hundreds or thousands of virtual servers," he added. "If you tried to do the same thing on other platforms, you'd find that you need significantly more resources to maintain an environment like that. Seven people at ADP handle the 8,000 virtual servers they have, and they need seven only in case somebody gets sick.

"If you had eight thousand servers on x86, even if they're virtualized, do you think you could get away with seven?"

--------------------------------------------------------------------------------

via: http://www.datacenterknowledge.com/hardware/why-mainframes-arent-going-away-any-time-soon

作者：[Christine Hall][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.datacenterknowledge.com/archives/author/christine-hall
[1]:http://www.datacenterknowledge.com/ibm/mainframe-sales-fuel-growth-ibm
[2]:http://www.datacenterknowledge.com/design/one-click-and-voil-your-entire-data-center-encrypted
[3]:http://www.datacenterknowledge.com/design/ibm-designs-performance-beast-ai
