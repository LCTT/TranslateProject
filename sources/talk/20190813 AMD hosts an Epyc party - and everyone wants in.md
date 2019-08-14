[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (AMD hosts an Epyc party — and everyone wants in)
[#]: via: (https://www.networkworld.com/article/3431380/amd-hosts-an-epyc-party-and-everyone-wants-in.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

AMD hosts an Epyc party — and everyone wants in
======
With the release of its second generation of Epyc processors, the Epyc 7002 series, AMD finds it has a lot of new friends -- companies that want to use their technology.
![AMD][1]

Last week, AMD launched the second generation of its Epyc server processor, the Epyc 7002 series a.k.a. “Rome,” and it’s a far cry from the days when it held a release party for the Opteron and no one showed up. These days, AMD has a whole lot of friends.

Of course, it helps to deliver a part people want, and it looks like the Epyc 7002 is all that. It builds considerably upon the first generation, code-named “Naples,” delivered two years ago. One chip packs up to 64 cores and two threads per core, double the max of 32 cores in Naples. It has eight memory channels and up to 128 lanes of PCI Express Gen 4.

**[ Also read: [What is quantum computing (and why enterprises should care)][2] ]**

The Epyc 7002 achieves this massive core count through “chiplets,” eight small chips in the CPU die with eight cores each and connected by a high-speed interconnect. A single monolithic 64-core die is impractical from a manufacturing standpoint. There is so much more that can go wrong with 64 cores than 16. Plus, AMD is manufacturing this on a 7nm process (Intel is just getting to 10nm), so it has that added challenge.

AMD also doubled the AVX performance with Rome, another big step. AVX, or Advanced Vector Extensions, are vital for specific tasks that are floating point-intensive, which is most high-performance computing (HPC) workloads, especially anything in visualization.

Another key differentiator for Rome is Secure Memory Encryption (SME) and Secure Encrypted Virtualization (SEV). This is due to a secure processor isolated from the rest of the CPU. SME limits the ability of the hypervisor administrator to view data being moved through memory in virtual machines (VMs). This protects against attempts to “sniff” a virtual machine for sensitive data or accidental leaks.

SEV is the other piece of the security puzzle. It fully and completely encrypts a virtual machine and keeps it isolated from the others. This helps to eliminate the potential for tampering and protects against an untrusted hypervisor.

And, yes, AMD has closed all vulnerabilities to [Meltdown and Spectre][3].

**[ [Get certified as an Apple Technical Coordinator with this seven-part online course from PluralSight.][4] ]**

### Companies at the Epyc party

With that, let’s run down some of the news that accompanied the launch of Rome.

  * HPE, already an Epyc customer, announced plans to triple their AMD-based portfolio with a broad range of servers, starting with the HPE ProLiant DL385 and HPE ProLiant DL325 servers. HPE announced it set 37 [world record benchmarks][5] with the new processor, which is normally a snooze for me because those world records are broken every month. But these are impressive. For database virtualization, the DL325 and DL385 blasted the old record by 321%. In power efficiency, the Epyc-equipped server beat the previous record by 28%. Numbers like those are sure to get the attention of any organizations looking to improve virtualization, cloud computing, enterprise infrastructure, and data-intensive workloads. A two-socket ProLiant DL385 beat the previous virtualization world record by 61% in performance and offers a 29% better price-to-performance ratio. These are not small numbers by any means.
  * Dell Technologies said it will offer a complete portfolio of newly redesigned, optimized PowerEdge servers for Epyc. The systems, purpose-built to enable AMD’s innovations and newly designed Dell EMC features, will deliver enhanced overall server performance, security, and management. Customers can expect the new systems to begin rolling out soon.
  * Lenovo introduced two new servers, the Lenovo ThinkSystem SR635 and SR655, both single-socket servers and targeted at edge networks. Lenovo claims a lower TCO of up to 46% and up to 73% on software licensing, since software licenses are often on a per-socket basis. Lenovo also talked about potential hyperconverged infrastructure (HCI) solutions with the second-generation Epyc processor.
  * VMware and AMD announced a close collaboration to deliver support for new security and other features of the Epyc processors within VMware vSphere. That’s about all they said for now.
  * Google announced it has deployed Epyc processors in its internal infrastructure production data center environment and in late 2019 will support new general-purpose machines powered by second-generation AMD Epyc processors on Google Cloud Compute Engine, as well.
  * Twitter announced it will deploy Epyc-based servers across its data center infrastructure later this year, reducing TCO by 25%.
  * Microsoft announced the preview of new Azure virtual machines for general-purpose applications, as well as limited previews of cloud-based remote desktops and HPC workloads based on Epyc processors today.



Join the Network World communities on [Facebook][6] and [LinkedIn][7] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3431380/amd-hosts-an-epyc-party-and-everyone-wants-in.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/08/amd-epyc-rome-processor-2-100808203-large.jpg
[2]: https://www.networkworld.com/article/3275367/what-s-quantum-computing-and-why-enterprises-need-to-care.html
[3]: https://www.networkworld.com/article/3253898/researchers-find-malware-samples-that-exploit-meltdown-and-spectre.html
[4]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fapple-certified-technical-trainer-10-11
[5]: http://h17007.www1.hpe.com/us/en/enterprise/servers/benchmarks/index.aspx
[6]: https://www.facebook.com/NetworkWorld/
[7]: https://www.linkedin.com/company/network-world
