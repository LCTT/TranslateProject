Ubuntu Updates for the Meltdown / Spectre Vulnerabilities
============================================================

![](https://insights.ubuntu.com/wp-content/uploads/0372/Screenshot-from-2018-01-04-12-39-25.png)

*   For up-to-date patch, package, and USN links, please refer to: [https://wiki.ubuntu.com/SecurityTeam/KnowledgeBase/SpectreAndMeltdown][2]

Unfortunately, you’ve probably already read about one of the most widespread security issues in modern computing history — colloquially known as “[Meltdown][5]” ([CVE-2017-5754][6]) and “[Spectre][7]” ([CVE-2017-5753][8] and [CVE-2017-5715][9]) — affecting practically every computer built in the last 10 years, running any operating system.  That includes [Ubuntu][10].

I say “unfortunately”, in part because there was a coordinated release date of January 9, 2018, agreed upon by essentially every operating system, hardware, and cloud vendor in the world.  By design, operating system updates would be available at the same time as the public disclosure of the security vulnerability.  While it happens rarely, this an industry standard best practice, which has broken down in this case.

At its heart, this vulnerability is a CPU hardware architecture design issue.  But there are billions of affected hardware devices, and replacing CPUs is simply unreasonable.  As a result, operating system kernels — Windows, MacOS, Linux, and many others — are being patched to mitigate the critical security vulnerability.

Canonical engineers have been working on this since we were made aware under the embargoed disclosure (November 2017) and have worked through the Christmas and New Years holidays, testing and integrating an incredibly complex patch set into a broad set of Ubuntu kernels and CPU architectures.

Ubuntu users of the 64-bit x86 architecture (aka, amd64) can expect updated kernels by the original January 9, 2018 coordinated release date, and sooner if possible.  Updates will be available for:

*   Ubuntu 17.10 (Artful) — Linux 4.13 HWE

*   Ubuntu 16.04 LTS (Xenial) — Linux 4.4 (and 4.4 HWE)

*   Ubuntu 14.04 LTS (Trusty) — Linux 3.13

*   Ubuntu 12.04 ESM** (Precise) — Linux 3.2
    *   Note that an [Ubuntu Advantage license][1] is required for the 12.04 ESM kernel update, as Ubuntu 12.04 LTS is past its end-of-life

Ubuntu 18.04 LTS (Bionic) will release in April of 2018, and will ship a 4.15 kernel, which includes the [KPTI][11] patchset as integrated upstream.

Ubuntu optimized kernels for the Amazon, Google, and Microsoft public clouds are also covered by these updates, as well as the rest of Canonical’s [Certified Public Clouds][12] including Oracle, OVH, Rackspace, IBM Cloud, Joyent, and Dimension Data.

These kernel fixes will not be [Livepatch-able][13].  The source code changes required to address this problem is comprised of hundreds of independent patches, touching hundreds of files and thousands of lines of code.  The sheer complexity of this patchset is not compatible with the Linux kernel Livepatch mechanism.  An update and a reboot will be required to active this update.

Furthermore, you can expect Ubuntu security updates for a number of other related packages, including CPU microcode, GCC and QEMU in the coming days.

We don’t have a performance analysis to share at this time, but please do stay tuned here as we’ll followup with that as soon as possible.

Thanks,
[@DustinKirkland][14]
VP of Product
Canonical / Ubuntu

### About the author

 ![Dustin's photo](https://insights.ubuntu.com/wp-content/uploads/6f45/kirkland.jpg) 

Dustin Kirkland is part of Canonical's Ubuntu Product and Strategy team, working for Mark Shuttleworth, and leading the technical strategy, road map, and life cycle of the Ubuntu Cloud and IoT commercial offerings. Formerly the CTO of Gazzang, a venture funded start-up acquired by Cloudera, Dustin designed and implemented an innovative key management system for the cloud, called zTrustee, and delivered comprehensive security for cloud and big data platforms with eCryptfs and other encryption technologies. Dustin is an active Core Developer of the Ubuntu Linux distribution, maintainer of 20+ open source projects, and the creator of Byobu, DivItUp.com, and LinuxSearch.org. A Fightin' Texas Aggie Class of 2001 graduate, Dustin lives in Austin, Texas, with his wife Kim, daughters, and his Australian Shepherds, Aggie and Tiger. Dustin is also an avid home brewer.

[More articles by Dustin][3]

--------------------------------------------------------------------------------

via: https://insights.ubuntu.com/2018/01/04/ubuntu-updates-for-the-meltdown-spectre-vulnerabilities/

作者：[Dustin Kirkland][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://insights.ubuntu.com/author/kirkland/
[1]:https://www.ubuntu.com/support/esm
[2]:https://wiki.ubuntu.com/SecurityTeam/KnowledgeBase/SpectreAndMeltdown
[3]:https://insights.ubuntu.com/author/kirkland/
[4]:https://insights.ubuntu.com/author/kirkland/
[5]:https://en.wikipedia.org/wiki/Meltdown_(security_vulnerability)
[6]:https://people.canonical.com/~ubuntu-security/cve/2017/CVE-2017-5754.html
[7]:https://en.wikipedia.org/wiki/Spectre_(security_vulnerability)
[8]:https://people.canonical.com/~ubuntu-security/cve/2017/CVE-2017-5753.html
[9]:https://people.canonical.com/~ubuntu-security/cve/2017/CVE-2017-5715.html
[10]:https://wiki.ubuntu.com/SecurityTeam/KnowledgeBase/SpectreAndMeltdown
[11]:https://lwn.net/Articles/742404/
[12]:https://partners.ubuntu.com/programmes/public-cloud
[13]:https://www.ubuntu.com/server/livepatch
[14]:https://twitter.com/dustinkirkland
