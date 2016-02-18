Ricky Gong 翻译中

Linux Systems Patched for Critical glibc Flaw
=================================================

**Google exposed a critical flaw affecting major Linux distributions. The glibc flaw could have potentially led to remote code execution.**

Linux users today are scrambling to patch a critical flaw in the core glibc open-source library that could be exposing systems to a remote code execution risk. The glibc vulnerability is identified as CVE-2015-7547 and is titled, "getaddrinfo stack-based buffer overflow."

The glibc, or GNU C Library, is an open-source implementation of the C and C++ programming language libraries and is part of every major Linux distribution. Google engineers came across the CVE-2015-7547 issue when they were attempting to connect into a certain host system and a segmentation fault (segfault) occurred, causing the connection to crash. Further investigation revealed that glibc was at fault and the crash could potentially achieve an arbitrary remote code execution condition.

"The glibc DNS client side resolver is vulnerable to a stack-based buffer overflow when the getaddrinfo() library function is used," Google wrote in a blog post. "Software using this function may be exploited with attacker-controlled domain names, attacker-controlled DNS [Domain Name System] servers, or through a man-in-the-middle attack."

Actually exploiting the CVE-2015-7547 issue is not trivial, but it is possible. To prove that the issue can be exploited, Google has published proof-of-concept (PoC) code on GitHub that demonstrates if an end user or system is vulnerable.

"The server code triggers the vulnerability and therefore will crash the client code," the GitHub PoC page states.

Mark Loveless, senior security researcher at Duo Security, explained that the main risk of CVE-2015-7547 is to Linux client-based applications that rely on DNS responses.

"There are some specific conditions, so not every single application will be impacted, but it appears that several command-line utilities, including the popular SSH [Secure Shell] client could trigger the flaw," Loveless told eWEEK. "We deem this serious mainly because of the existing risks to Linux systems, but also because of the potential for other issues."

Other issues could potentially include a risk of an email-based attack that triggers the vulnerable glibc  getaddrinfo() library call. Also of note is the fact that the vulnerability was in the code for years before it was discovered.

Google's engineers were not the first or only group to discover the security risk in glibc. The issue was first reported to a glibc bug [tracker](https://sourceware.org/bugzilla/show_bug.cgi?id=1866) on July 13, 2015. The roots of the flaw go back even further with the actual code commit that introduced the flaw first in glibc 2.9, which was released in May 2008.

Linux vendor Red Hat also independently was looking at the bug in glibc and on Jan. 6, 2016, Google and Red Hat developers confirmed that they had been independently working on the same vulnerability as part of the initial private discussion with upstream glibc maintainers.

"Once it was confirmed that both teams were working on the same vulnerability, we collaborated on potential fixes, mitigations and regression testing," Florian Weimer, principal software engineer for product security at Red Hat, told eWEEK. "We also worked together to make the test coverage as wide as possible to catch any related problems in the code to help prevent future issues."

It took years to discover that there was a security issue with the glibc code because that flaw isn't obvious or immediately apparent.

"To diagnose bugs in a networking component, like a DNS resolver, it is common to look at packet traces which were captured while the issue was encountered," Weimer said. "Such packet captures were not available in this case, so some experimentation was needed to reproduce the exact scenario that triggered the bug."

Weimer added that once the packet captures were available, considerable effort went into validating the fix, leading to a series of refinements culminating in the regression test suite that was contributed upstream to the glibc project.

In many cases in Linux, the Security Enhanced Linux (SELinux) mandatory access security controls can mitigate the risk of potential vulnerabilities, but that's not the case with the new glibc issue.

"The risk is a compromise of important system functionality due to the execution of arbitrary code supplied by an attacker," Weimer said. "A suitable SELinux policy can contain some of the damage an attacker might do and constrain their access to the system, but DNS is used by many applications and system components, so SELinux policies offer only limited containment for this issue."

Alongside the vulnerability disclosure today, there is now a patch available to mitigate the potential risk of CVE-2015-7547.

------------------------------------------------------------------------------

via: http://www.eweek.com/security/linux-systems-patched-for-critical-glibc-flaw.html

作者：[Michael Kerner][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://twitter.com/TechJournalist
