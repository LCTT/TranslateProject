[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Red Hat Responds to Zombieload v2)
[#]: via: (https://www.networkworld.com/article/3453596/red-hat-responds-to-zombieload-v2.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Red Hat Responds to Zombieload v2
======
Red Hat calls for updating Linux software to address Intel processor flaws that can lead to data-theft exploits
Stephen Lawson/IDG

Three Common Vulnerabilities and Exposures (CVEs) opened yesterday track three flaws in certain Intel processors, which, if exploited, can put sensitive data at risk.

Of the flaws reported, the newly discovered Intel processor flaw is a variant of the Zombieload attack discovered earlier this year and is only known to affect Intel’s Cascade Lake chips.

[[Get regularly scheduled insights by signing up for Network World newsletters.]][1]

Red Hat strongly suggests that all Red Hat systems be updated even if they do not believe their configuration poses a direct threat, and it is providing resources to their customers and to the enterprise IT community.

[][2]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][2]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

The three CVEs are:

  * CVE-2018-12207 - Machine Check Error on Page Size Change
  * CVE-2019-11135 - TSX Asynchronous Abort
  * CVE-2019-0155 and CVE-2019-0154 - i915 graphics driver



### CVE-2018-12207

Red Hat rates this vulnerability as important. It is a vulnerability that could allow a local and unprivileged attacker to bypass security controls and cause a system-wide denial of service.

The hardware flaw was found in Intel microprocessors and is related to the Instruction Translation Lookaside Buffer (ITLB). It caches translations from virtual to physical addresses and is intended to improve performance. However, a delay in invalidating cached entries after cache page changes could lead to a processor using an invalid address translation causing a machine check error exception and moving the system into a hang state.

This kind of scenario could be crafted by an attacker to take a system down.

### CVE-2019-11135

Red Hat rates this vulnerability as moderate. This Transactional Synchronization Extensions (TSX) Asynchronous Abort is a Microarchitectural Data Sampling (MDS) flaw. A local attacker using custom code could use this flaw to gather information from cache contents on the processor and processors that support simultaneous multithreading (SMT) and TSX.

### CVE-2019-0155, CVE-2019-0154

Red Hat rates the **CVE-2019-0155** flaw as important and the CVE-2019-0154 as moderate. Both flaws are related to the i915 graphics driver.

CVE-2019-0155 allows allows an attacker to bypass conventional memory security restrictions, allowing write access to privileged memory that ought to be restricted.

CVE-2019-0154 could allow an local attacker to create an invalid system state when the Graphics Processing Unit (GPU) is in low power mode, leading to the system becoming inaccessible.

The only affected graphics card affected by CVE-2019-0154 is on the **i915** kernel module. The **lsmod** command can be used to indicate vulnerability. Any output like that shown below (i.e., starting with i915) indicates that this system is vulnerable:

```
$ lsmod | grep ^i915
i915          2248704 10
```

### Additional resources

Red Hat has provided details and further instructions to its customers and others in the following links:

<https://access.redhat.com/security/vulnerabilities/ifu-page-mce>

[https://access.redhat.com/solutions/tsx-asynchronousabort][3] [][4]

<https://access.redhat.com/solutions/i915-graphics>

Join the Network World communities on [Facebook][5] and [LinkedIn][6] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3453596/red-hat-responds-to-zombieload-v2.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/newsletters/signup.html
[2]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE20773&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[3]: https://access.redhat.com/solutions/tsx-asynchronousabort%20
[4]: https://access.redhat.com/solutions/i915-graphics
[5]: https://www.facebook.com/NetworkWorld/
[6]: https://www.linkedin.com/company/network-world
