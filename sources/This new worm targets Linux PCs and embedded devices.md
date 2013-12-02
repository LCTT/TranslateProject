[this is bazz2, if you wanna translate this article, no way :P]
This new worm targets Linux PCs and embedded devices
================================================================================
**The malware spreads by exploiting a 2012 vulnerability in PHP, Symantec researchers said**

IDG News Service - A new worm is targeting x86 computers running Linux and PHP, and variants may also pose a threat to devices such as home routers and set-top boxes based on other chip architectures.

According to security researchers from Symantec, the malware spreads by exploiting a vulnerability in php-cgi, a component that allows PHP to run in the Common Gateway Interface (CGI) configuration. The vulnerability is tracked as CVE-2012-1823 and was patched in PHP 5.4.3 and PHP 5.3.13 in May 2012.

The new worm, which was named Linux.Darlloz, is based on proof-of-concept code released in late October, the Symantec researchers said Wednesday in a [blog post][1].

"Upon execution, the worm generates IP [Internet Protocol] addresses randomly, accesses a specific path on the machine with well-known ID and passwords, and sends HTTP POST requests, which exploit the vulnerability," the Symantec researchers explained. "If the target is unpatched, it downloads the worm from a malicious server and starts searching for its next target."

The only variant seen to be spreading so far targets x86 systems, because the malicious binary downloaded from the attacker's server is in ELF (Executable and Linkable Format) format for Intel architectures.

However, the Symantec researchers claim the attacker also hosts variants of the worm for other architectures including ARM, PPC, MIPS and MIPSEL.

These architectures are used in embedded devices like home routers, IP cameras, set-top boxes and many others.

"The attacker is apparently trying to maximize the infection opportunity by expanding coverage to any devices running on Linux," the Symantec researchers said. "However, we have not confirmed attacks against non-PC devices yet."

The firmware of many embedded devices is based on some type of Linux and includes a Web server with PHP for the Web-based administration interface. These kinds of devices might be easier to compromise than Linux PCs or servers because they don't receive updates very often.

Patching vulnerabilities in embedded devices has never been an easy task. Many vendors don't issue regular updates and when they do, users are often not properly informed about the security issues fixed in those updates.

In addition, installing an update on embedded devices requires more work and technical knowledge than updating regular software installed on a computer. Users have to know where the updates are published, download them manually and then upload them to their devices through a Web-based administration interface.

"Many users may not be aware that they are using vulnerable devices in their homes or offices," the Symantec researchers said. "Another issue we could face is that even if users notice vulnerable devices, no updates have been provided to some products by the vendor, because of outdated technology or hardware limitations, such as not having enough memory or a CPU that is too slow to support new versions of the software."

To protect their devices from the worm, users are advised to verify if those devices run the latest available firmware version, update the firmware if needed, set up strong administration passwords and block HTTP POST requests to -/cgi-bin/php, -/cgi-bin/php5, -/cgi-bin/php-cgi, -/cgi-bin/php.cgi and -/cgi-bin/php4, either from the gateway firewall or on each individual device if possible, the Symantec researchers said.

--------------------------------------------------------------------------------

via: http://www.computerworld.com/s/article/9244409/This_new_worm_targets_Linux_PCs_and_embedded_devices?taxonomyId=122

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.symantec.com/connect/blogs/linux-worm-targeting-hidden-devices
