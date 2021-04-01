[#]: subject: (Advances in open source CAD software, new open source project aims to bring Linux to Apple, and more)
[#]: via: (https://opensource.com/article/21/4/open-source-news)
[#]: author: (Lauren Maffeo https://opensource.com/users/lmaffeo)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Advances in open source CAD software, new open source project aims to bring Linux to Apple, and more
======
Get the latest news to know in this open source news roundup.
![Globe up in the clouds][1]

In this edition of our open source news roundup, IBM's Call for Code aims to solve climate change, the Linux Foundation launches a new signing service, and more.

### FreeCAD 0.19 released for advancing open source CAD software

FreeCAD 0.19's migration from Python 2 to Python 3 and Qt4 to Qt5 is complete. This newest major feature release includes updates to its navigation cube, dynamic properties, backup file handling, [and more][2].

FreeCAD 0.19 includes several new features, as well. Icon theme management, a dark stylesheet, a WebGL exporter, Arch Fence, and Arch Truss tools are just a few of the update's new additions.

Want to learn more? Visit the [FreeCAD wiki][3] for project updates and to learn how you can contribute.

### Open source team details complexities in bringing Linux to Apple's M1 Macs

The Asahi Linux project aims to bring Linux to the Apple Silicon platform. Hector Martin, one of the project's co-founders, recently [wrote a blog post][4] to share how it's going. This project update is especially welcome for those who want to learn how Apple's new chip works.

Martin doesn't mince words when explaining his project's challenges. The bespoke boot process for Apple Silicon Macs means the Asahi Linux project must choose one of two competing standards: [UEFI][5] plus [ACPI][6] or [ARM64 Linux boot protocol][7] plus [DeviceTree][8].

Martin also shared a custom bootloader named m1n1, which aims to replicate Apple nuances. One of his [key goals][9] "is to turn it into a very thin VM hypervisor that can boot macOS and intercept its accesses to the M1 hardware."

### Call for Code seeks open source solutions to climate change

IBM's Call for Code is [back in business.][10] For the fourth year in a row, the tech giant is searching for open source solutions to big global problems.

This year's Call for Code seeks solutions to tackle climate change. The winner will earn $200,000 in prize money and mentorship from IBM.

That mentorship involves acceptance to IBM's Code and Response Initiative, a four-year program that will develop the winning idea through global testing and eventual launch. Thus far, more than 30 Call for Code solutions have started field testing for deployments.

Interested applicants can learn more and [apply to join][11] Call for Code on IBM's website.

### Linux Foundation announces new open source software-signing service

As open source software keeps getting more mainstream, the calls to boost security are growing in tandem. To meet the demand, the Linux Foundation launched a new open source software-signing service.

This [nonprofit sigstore][12] gives developers a space to securely sign documents, like release files and container images, at no charge. David A. Wheeler, the Linux Foundation's director of open source supply chain security, says he aims to create [reproducible builds][13].

The sigstore's code and operational tooling are still a work in progress, but Wheeler's vision for a reproducible build could [lead to][14] a software build of materials (SBOM). An SBOM would allow anyone to see the code behind the sigstore.

### APAC leads in open source adoption

[Red Hat's State of Enterprise Open Source 2021][15] report is out, and it contains some news about which global regions lead the way in open source adoption.

When it comes to using open source software (OSS) within IT infrastructure and containerized applications, two-thirds of survey respondents in the Asia-Pacific (APAC) region report using OSS to [modernize their infrastructure][16]. More than half—56%—of APAC respondents said they use OSS for DevOps, while 51% use it for digital transformation.

Regarding more futuristic use cases, like integrating OSS into artificial intelligence (AI) pipelines, 51% of APAC-based respondents say they already are. By contrast, 48% of US-based respondents said the same, as did 45% in the Europe, the Middle East, and Africa (EMEA) region.

Perhaps most surprisingly, lower cost—a standard rationale to use OSS—wasn't one of the APAC region's main motives. Higher-quality software (33%), access to the latest innovations (30%), and trust by the smartest software engineers (30%) were the top three reasons APAC-based respondents want to use OSS.

In other news:

  * [_Red Hat statement about Richard Stallman's return to the Free Software Foundation board_][17]
  * [_Harness embraces open source and pledges to support community 'like an enterprise customer'_][18]
  * [_Scarf helps open source developers track how their projects are being used_][19]
  * [_Microsoft's new Power Fx is an open source language based on Excel_][20]



--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/open-source-news

作者：[Lauren Maffeo][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/lmaffeo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cloud-globe.png?itok=_drXt4Tn (Globe up in the clouds)
[2]: https://www.phoronix.com/scan.php?page=news_item&px=FreeCAD-0.19
[3]: https://wiki.freecadweb.org/Release_notes_0.19
[4]: https://asahilinux.org/2021/03/progress-report-january-february-2021/
[5]: https://en.wikipedia.org/wiki/Unified_Extensible_Firmware_Interface
[6]: https://en.wikipedia.org/wiki/Advanced_Configuration_and_Power_Interface
[7]: https://www.kernel.org/doc/Documentation/arm64/booting.txt
[8]: https://www.devicetree.org/
[9]: https://9to5mac.com/2021/03/15/asahi-linux-project-port-m1-macs/
[10]: https://www.itpro.co.uk/development/software-development/358980/fourth-annual-call-for-code-seeks-open-source-solutions-to
[11]: https://developer.ibm.com/callforcode/
[12]: https://sigstore.dev/
[13]: https://reproducible-builds.org/
[14]: https://www.zdnet.com/article/linux-foundation-announces-new-open-source-software-signing-service/
[15]: https://www.redhat.com/en/blog/state-enterprise-open-source-2021-four-results-may-surprise-you
[16]: https://www.computerweekly.com/news/252497326/APAC-leads-in-open-source-adoption
[17]: https://www.redhat.com/en/blog/red-hat-statement-about-richard-stallmans-return-free-software-foundation-board
[18]: https://venturebeat.com/2021/03/18/harness-embraces-open-source-and-pledges-to-support-community-like-an-enterprise-customer/
[19]: https://techcrunch.com/2021/03/03/scarf-helps-open-source-developers-track-how-their-projects-are-being-used/
[20]: https://www.techrepublic.com/article/microsofts-new-power-fx-is-an-open-source-language-based-on-excel/
