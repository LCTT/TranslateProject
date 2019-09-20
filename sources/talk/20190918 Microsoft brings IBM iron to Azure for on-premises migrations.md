[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Microsoft brings IBM iron to Azure for on-premises migrations)
[#]: via: (https://www.networkworld.com/article/3438904/microsoft-brings-ibm-iron-to-azure-for-on-premises-migrations.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

Microsoft brings IBM iron to Azure for on-premises migrations
======
Once again Microsoft shows it has shed its not-invented here attitude to support customers.
Microsoft / Just_Super / Getty Images

When Microsoft launched Azure as a cloud-based version of its Windows Server operating system, it didn't make it exclusively Windows. It also included Linux support, and in just a few years, the [number of Linux instances now outnumbers Windows instances][1].

It's nice to see Microsoft finally shed that not-invented-here attitude that was so toxic for so long, but the company's latest move is really surprising.

Microsoft has partnered with a company called Skytap to offer IBM Power9 instances on its Azure cloud service to run Power-based systems inside of the Azure cloud, which will be offered as Azure virtual machines (VM) along with the Xeon and Epyc server instances that it already offers.

**Also read: [How to make hybrid cloud work][2]**

Skytap is an interesting company. Founded by three University of Washington professors, it specializes in cloud migrations of older on-premises hardware, such as IBM System I or Sparc. It has a data center in its home town of Seattle, with IBM hardware running IBM's PowerVM hypervisor, plus some co-locations in IBM data centers in the U.S. and England.

Its motto is to migrate fast, then modernize at your own pace. So, its focus is on helping legacy systems migrate to the cloud and then modernize the apps, which is what the alliance with Microsoft appears to be aimed at. Azure will provide enterprises with a platform to enhance the value of traditional applications without the major expense of rewriting for a new platform.

Skytap is providing a preview of what’s possible when lifting and extending a legacy IBM i application using DB2 on Skytap and augmenting it with Azure IoT Hub. The application seamlessly spans old and new architectures, demonstrating there is no need to completely rewrite rock-solid IBM i applications to benefit from modern cloud capabilities.

### Migrating to Azure cloud

Under the deal, Microsoft will deploy Power S922 servers from IBM and deploy them in an undeclared Azure region. These machines can run the PowerVM hypervisor, which supports legacy IBM operating systems, as well as Linux.

"Migrating to the cloud by first replacing older technologies is time consuming and risky," said Brad Schick, CEO of Skytap, in a statement. "Skytap’s goal has always been to provide businesses with a path to get these systems into the cloud with little change and less risk. Working with Microsoft, we will bring Skytap’s native support for a wide range of legacy applications to Microsoft Azure, including those dependent on IBM i, AIX, and Linux on Power. This will give businesses the ability to extend the life of traditional systems and increase their value by modernizing with Azure services."

As Power-based applications are modernized, Skytap will then bring in DevOps CI/CD toolchains to accelerate software delivery. After moving to Skytap on Azure, customers will be able to integrate Azure DevOps, in addition to CI/CD toolchains for Power, such as Eradani and UrbanCode.

These sound like first steps, which means there will be more to come, especially in terms of the app migration. If it's only in one Azure region, it sounds like they are testing and finding their legs with this project and will likely expand later this year or next.

Join the Network World communities on [Facebook][3] and [LinkedIn][4] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3438904/microsoft-brings-ibm-iron-to-azure-for-on-premises-migrations.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://www.openwall.com/lists/oss-security/2019/06/27/7
[2]: https://www.networkworld.com/article/3119362/hybrid-cloud/how-to-make-hybrid-cloud-work.html#tk.nww-fsb
[3]: https://www.facebook.com/NetworkWorld/
[4]: https://www.linkedin.com/company/network-world
