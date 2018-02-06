LKRG: Linux to Get a Loadable Kernel Module for Runtime Integrity Checking
======
![LKRG logo][1]

Members of the open source community are working on a new security-focused project for the Linux kernel. Named Linux Kernel Runtime Guard (LKRG), this is a loadable kernel module that will perform runtime integrity checking of the Linux kernel.

Its purpose is to detect exploitation attempts for known and unknwon security vulnerabilities against the Linux kernel and attempt to block attacks.

LKRG will also detect privilege escalation for running processes, and kill the running process before the exploit code runs.

### Project under development since 2011. First versions released.

Since the project is in such early development, current versions of LKRG will only report kernel integrity violations via kernel messages, but a full exploit mitigation system will be deployed as the system matures.

Work on this project started in 2011, and LKRG has gone through a "re-development" phase, as LKRG member Alexander Peslyak described the process.

The first public version of LKRG —LKRG v0.0— is now live and available for download on [this page][2]. A wiki is also available [here][3], and a [Patreon page][4] for supporting the project has also been set up.

While LKRG will remain an open source project, LKRG maintainers also have plans for an LKRG Pro version that will include distro-specific LKRG builds and support for the detection of specific exploits, such as container escapes. The team plans to use the funds from LKRG Pro to fund the rest of the project.

### LKRG is a kernel module. Not a patch.

A similar project is Additional Kernel Observer (AKO), but AKO differs from LKRG because it's a kernel load-on module and not a patch. The LKRG team chose to create a kernel module because patching the kernel has a direct impact on the security, system stability, and performance.

By offering a kernel module this also makes LKRG easier to deploy on a per-system basis without having to tinker with core kernel code, a very complicated and error-prone process.

LKRG kernel modules are currently available for main Linux distros such as RHEL7, OpenVZ 7, Virtuozzo 7, and Ubuntu 16.04 to latest mainlines.

### Not a perfect solution

But LKRG's creators are warning users not to consider their tool as unbreakable and 100% secure. They said LKRG is "bypassable by design," and only provides "security through diversity."

```
While LKRG defeats many pre-existing exploits of Linux kernel vulnerabilities, and will likely defeat many future exploits (including of yet unknown vulnerabilities) that do not specifically attempt to bypass LKRG, it is bypassable by design (albeit sometimes at the expense of more complicated and/or less reliable exploits). Thus, it can be said that LKRG provides security through diversity, much like running an uncommon OS kernel would, yet without the usability drawbacks of actually running an uncommon OS.
```

LKRG is similar to Windows-based antivirus software, which also works at the kernel level to detect exploits and malware. Nonetheless, the LKRG team says their product is much safer then antivirus and other endpoint security software because it has a much smaller codebase, hence a smaller footprint for introducing new bugs and vulnerabilities at the kernel level.

### Current LKRG version adds a 6.5% performance dip

Peslyak says LKRG is most suited for Linux machines that can't be rebooted right in the aftermath of a security flaw to patch the kernel. LKRG allows owners to continue to run the machine with a security measure in place until patches for critical vulnerabilities can be tested and deployed during planned maintenance windows.

Tests showed that installing LKRG v0.0 added a 6.5% performance impact, but Peslyak says this will be reduced as development moves forward.

Tests also showed that LKRG detected exploitation attempts for CVE-2014-9322 (BadIRET), CVE-2017-5123 (waitid(2) missing access_ok), and CVE-2017-6074 (use-after-free in DCCP protocol), but failed to detect CVE-2016-5195 (Dirty COW). The team said LKRG failed to spot the Dirty COW privilege escalation because of the previously mentioned "bypassable by design" strategy.

```
In case of Dirty COW the LKRG "bypass" happened due to the nature of the bug and this being the way to exploit it, it's also a way for future exploits to bypass LKRG by similarly directly targeting userspace. It remains to be seen whether such exploits become common (unlikely unless LKRG or similar become popular?) and what (negative?) effect on their reliability this will have (for kernel vulnerabilities where directly targeting the userspace isn't essential and possibly not straightforward).
```


--------------------------------------------------------------------------------

via: https://www.bleepingcomputer.com/news/linux/lkrg-linux-to-get-a-loadable-kernel-module-for-runtime-integrity-checking/

作者：[Catalin Cimpanu][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.bleepingcomputer.com/author/catalin-cimpanu/
[1]:https://www.bleepstatic.com/content/posts/2018/02/04/LKRG-logo.png
[2]:http://www.openwall.com/lkrg/
[3]:http://openwall.info/wiki/p_lkrg/Main
[4]:https://www.patreon.com/p_lkrg
