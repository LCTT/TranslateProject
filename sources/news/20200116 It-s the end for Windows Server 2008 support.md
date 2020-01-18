[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (It’s the end for Windows Server 2008 support)
[#]: via: (https://www.networkworld.com/article/3513980/it-s-the-end-for-windows-server-2008-support.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

It’s the end for Windows Server 2008 support
======
Microsoft recommends migrating Server 2008 workloads to Azure cloud services while enterprises modernize their apps for Windows Server 2016 or 2019 deployments.
PaulFleet / Getty Images / Microsoft

This week's Patch Tuesday marked the end of the line for both Windows 7 and Windows Server 2008 (and 2008 R2). No more fixes will be issued for the two aged operating systems, unless you purchase a pricey extended service license.

On the Windows 7 front, Microsoft has done a good job getting Windows 10 deployed through its aggressive (perhaps too aggressive) upgrade program. According to StatCounter, Windows 10 now accounts for 65% of the [worldwide desktop Windows market share][1], and Windows 7 is down to 27%.

**RELATED:** [What to know before upgrading to Windows Server 2019][2]

But while Windows 7 has gotten all the attention, Server 2008 actually has a larger share of holdouts, and in some ways, its end-of-life milestone is more significant. At last July’s Inspire show, a Microsoft executive said in an interview with cloud storage provider and Microsoft partner Carbonite that [60% of its current Windows Server][3] installed base was running Server 2008, accounting for 24 million instances. 

[][4]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][4]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

“There are a lot [of customers sticking with Server 2008],” says analyst Tim Crawford of research and advisory firm [AVOA][5]. “You could categorize them into those that either a) use functions specific to WS2008, and b) those that use a version of an application that is only compatible with WS2008. Upgrading is often easier said than done. Especially if the application is a custom app with lots of tentacles.”

Server 2008 is based on the Windows Vista codebase, which should be reason alone to jettison it. But Windows Server 2016 and Windows Server 2019 are built on Windows 10, which means apps heavily dependent on the OS ecosystem might be hard to move since the internals are so different.

“I do work with folks that are still running Windows Server 2008. They understand the ramifications of EOL for support. But most are in a predicament where they aren’t able to move the applications for a number of reasons, including application compatibility, location, etc.," Crawford says.

For those apps that are challenging to move, he recommends isolating the system as much as possible to protect it, and putting in a plan to do what is needed to the applications to prepare them for movement as quickly as possible.

Microsoft offers and recommends [Azure migration][6], so Server 2008 apps can [run in an Azure instance][7] while they are modernized for Server 2019 and then deployed on premises.

Migration should be the paramount effort, because if you are running Server 2008 then you're using hardware that's at least eight years old and potentially 12 years old. That’s ancient in technology terms, and if nothing else, the hardware is going to fail.

One of the headaches for admins is you cannot migrate Server 2008 directly to 2016 or 2019. You have to upgrade to Server 2012 as an intermediate step. So you are better off biting the bullet and migrating the apps to 2019 rather than spending time on two OS migrations.

Microsoft has provided [resources][8] for Server 2008 users, including a migration guide and help moving to Azure.

Join the Network World communities on [Facebook][9] and [LinkedIn][10] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3513980/it-s-the-end-for-windows-server-2008-support.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://gs.statcounter.com/os-version-market-share/windows/desktop/worldwide#monthly-201807-201908
[2]: https://www.networkworld.com/article/3512020/what-to-know-before-upgrading-from-windows-server-2016-to-server-2019.html
[3]: https://www.carbonite.com/blog/article/2019/07/schuster-azure-migration-and-office-365-top-partner-opportunities
[4]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE21620&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[5]: https://avoa.com/
[6]: https://cloudblogs.microsoft.com/windowsserver/2019/12/17/protect-workloads-still-running-on-windows-server-2008-and-2008-r2/
[7]: https://www.networkworld.com/article/3300165/microsoft-lures-win-server-2008-users-toward-azure.html
[8]: https://www.microsoft.com/en-us/cloud-platform/windows-server-2008
[9]: https://www.facebook.com/NetworkWorld/
[10]: https://www.linkedin.com/company/network-world
