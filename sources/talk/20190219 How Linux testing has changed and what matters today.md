[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How Linux testing has changed and what matters today)
[#]: via: (https://opensource.com/article/19/2/phoronix-michael-larabel)
[#]: author: (Don Watkins https://opensource.com/users/don-watkins)

How Linux testing has changed and what matters today
======
Michael Larabel, the founder of Phoronix, shares his insights on the evolution of Linux and open hardware.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/mistake_bug_fix_find_error.png?itok=PZaz3dga)

If you've ever wondered how your Linux computer stacks up against other Linux, Windows, and MacOS machines or searched for reviews of Linux-compatible hardware, you're probably familiar with [Phoronix][1]. Along with its website, which attracts more than 250 million visitors a year to its Linux reviews and news, the company also offers the [Phoronix Test Suite][2], an open source hardware benchmarking tool, and [OpenBenchmarking.org][3], where test result data is stored.

According to [Michael Larabel][4], who started Phoronix in 2004, the site "is frequently cited as being the leading source for those interested in computer hardware and Linux. It offers insights regarding the development of the Linux kernel, product reviews, interviews, and news regarding free and open source software."

I recently had the opportunity to interview Michael about Phoronix and his work.

The questions and answers have been edited for length and clarity.

**Don Watkins:** What inspired you to start Phoronix?

**Michael Larabel:** When I started [Phoronix.com][5] in June 2004, it was still challenging to get a mouse or other USB peripherals working on the popular distributions of the time, like Mandrake, Yoper, MEPIS, and others. So, I set out to work on reviewing different hardware components and their compatibility with Linux. Over time, that shifted more from "does the basic device work?" to how well they perform and what features are supported or unsupported under Linux.

It's been interesting to see the evolution and the importance of Linux on hardware rise. Linux was very common to LAMP/web servers, but Linux has also become synonymous with high-performance computing (HPC), Android smartphones, cloud software, autonomous vehicles, edge computing, digital signage, and related areas. While Linux hasn't quite dominated the desktop, it's doing great practically everywhere else.

I also developed the Phoronix Test Suite, with its initial 1.0 public release in 2008, to increase the viability of testing on Linux, engage with more hardware and software vendors on best practices for testing, and just get more test cases running on Linux. At the time, there weren't any really shiny benchmarks on Linux like there were on Windows.

**DW:** Who are your website's readers?

**ML:** Phoronix's audience is as diverse as the content. Initially, it was quite desktop/gamer/enthusiast oriented, but as Linux's dominance has grown in HPC, cloud, embedded, etc., my testing has expanded in those areas and thus so has the readership. Readers tend to be interested in open source/Linux ecosystem advancements, performance, and a slight bent towards graphics processor and hardware driver interests.

**DW:** How important is testing in the Linux world and how has it changed from when you started?

**ML:** Testing has changed radically since 2004. Back then, many open source projects weren't carrying out any continuous integration (CI) or testing for regressions—both functional issues and performance problems. The hardware vendors supporting Linux were mostly trying to get things working and maintained while being less concerned about performance or scratching away at catching up to Mac, Solaris, and Windows. With time, we've seen the desktop reach close parity with (or exceed, depending upon your views) alternative operating systems. Most PC hardware now works out-of-the-box on Linux, most open source projects engage in some form of CI or testing, and more time and resources are afforded to advancing Linux performance. With high-frequency trading and cloud platforms relying on Linux, performance has become of utmost importance.

Most of my testing at Phoronix.com is focused on benchmarking processors, graphics cards, storage devices, and other areas of interest to gamers and enthusiasts, but also interesting server platforms. Readers are also quite interested in testing of software components like the Linux kernel, code compilers, and filesystems. But in terms of the Phoronix Test Suite, its scope is rather limitless, with a framework in which new tests can be easily added and automated. There are currently more than 1,000 different profiles/suites, and new ones are routinely added—from machine learning tests to traditional benchmarks.

**DW:** How important is open source hardware? Where do you see it going?

**ML:** Open hardware is of increasing importance, especially in light of all the security vulnerabilities and disclosures in recent years. Facebook's work on the [Open Compute Project][6] can be commended, as can Google leveraging [Coreboot][7] in its Chromebook devices, and [Raptor Computing Systems][8]' successful, high-performance, open source POWER9 desktops/workstations/servers. [Intel][9] potentially open sourcing its firmware support package this year is also incredibly tantalizing and will hopefully spur more efforts in this space.

Outside of that, open source hardware has had a really tough time cracking the consumer space due to the sheer amount of capital necessary and the complexities of designing a modern chip, etc., not to mention competing with the established hardware vendors' marketing budgets and other resources. So, while I would love for 100% open source hardware to dominate—or even compete in features and performance with proprietary hardware—in most segments, that is sadly unlikely to happen, especially with open hardware generally being much more expensive due to economies of scale.

Software efforts like [OpenBMC][10], Coreboot/[Libreboot][11], and [LinuxBoot][12] are opening up hardware much more. Those efforts at liberating hardware have proven successful and will hopefully continue to be endorsed by more organizations.

As for [OSHWA][13], I certainly applaud their efforts and the enthusiasm they bring to open source hardware. Certainly, for niche and smaller-scale devices, open source hardware can be a great fit. It will certainly be interesting to see what comes about with OSHWA and some of its partners like Lulzbot, Adafruit, and System76.

**DW:** Can people install Phoronix Test Suite on their own computers?

ML: The Phoronix Test Suite benchmarking software is open source under the GPL and can be downloaded from [Phoronix-Test-Suite.com][2] and [GitHub][14]. The benchmarking software works on not only Linux systems but also MacOS, Solaris, BSD, and Windows 10/Windows Server. The Phoronix Test Suite works on x86/x86_64, ARM/AArch64, POWER, RISC-V, and other architectures.

**DW:** How does [OpenBenchmarking.org][15] work with the Phoronix Test Suite?

**ML:** OpenBenchmarking.org is, in essence, the "cloud" component to the Phoronix Test Suite. It stores test profiles/test suites in a package manager-like fashion, allows users to upload their own benchmarking results, and offers related functionality around our benchmarking software.

OpenBenchmarking.org is seamlessly integrated into the Phoronix Test Suite, but from the web interface, it is also where anyone can see the public benchmark results, inspect the open source test profiles to understand their methodology, research hardware and software data, and use similar functionality.

Another component developed as part of the Phoronix Test Suite is [Phoromatic][16], which effectively allows anyone to deploy their own OpenBenchmarking-like environment within their own private intranet/LAN. This allows organizations to archive their benchmark results locally (and privately), orchestrate benchmarks automatically against groups of systems, manage the benchmark systems, and develop new test cases.

**DW:** How can people stay up to date on Phoronix?

**ML:** You can follow [me][17], [Phoronix][18], [Phoronix Test Suite][19], and [OpenBenchMarking.org][20] on Twitter.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/2/phoronix-michael-larabel

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://www.phoronix.com/
[2]: https://www.phoronix-test-suite.com/
[3]: https://openbenchmarking.org/
[4]: https://www.michaellarabel.com/
[5]: http://Phoronix.com
[6]: https://www.opencompute.org/
[7]: https://www.coreboot.org/
[8]: https://www.raptorcs.com/
[9]: https://www.phoronix.com/scan.php?page=news_item&px=Intel-Open-Source-FSP-Likely
[10]: https://en.wikipedia.org/wiki/OpenBMC
[11]: https://libreboot.org/
[12]: https://linuxboot.org/
[13]: https://www.oshwa.org/
[14]: https://github.com/phoronix-test-suite/
[15]: http://OpenBenchmarking.org
[16]: http://www.phoronix-test-suite.com/index.php?k=phoromatic
[17]: https://twitter.com/michaellarabel
[18]: https://twitter.com/phoronix
[19]: https://twitter.com/Phoromatic
[20]: https://twitter.com/OpenBenchmark
