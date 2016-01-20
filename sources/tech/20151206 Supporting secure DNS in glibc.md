zpl1025
Supporting secure DNS in glibc
========================

Credit: Jonathan Corbet

One of the many weak links in Internet security is the domain name system (DNS); it is subject to attacks that, among other things, can mislead applications regarding the IP address of a system they wish to connect to. That, in turn, can cause connections to go to the wrong place, facilitating man-in-the-middle attacks and more. The DNSSEC protocol extensions are meant to address this threat by setting up a cryptographically secure chain of trust for DNS information. When DNSSEC is set up properly, applications should be able to trust the results of domain lookups. As the discussion over an attempt to better integrate DNSSEC into the GNU C Library shows, though, ensuring that DNS lookups are safe is still not a straightforward problem.

In a sense, the problem was solved years ago; one can configure a local nameserver to perform full DNSSEC verification and use that server via glibc calls in applications. DNSSEC can even be used to increase security in other areas; it can, for example, carry SSH or TLS key fingerprints, allowing applications to verify that they are talking to the right server. Things get tricky, though, when one wants to be sure that DNS results claiming to have DNSSEC verification are actually what they claim to be — when one wants the security that DNSSEC is meant to provide, in other words.

The /etc/resolv.conf problem

Part of the problem, from the glibc perspective, is that glibc itself does not do DNSSEC verification. Instead, it consults /etc/resolv.conf and asks the servers found therein to do the lookup and verification; the results are then returned to the application. If the application is using the low-level res_query() interface, those results may include the "authenticated data" (AD) flag (if the nameserver has set it) indicating that DNSSEC verification has been successfully performed. But glibc knows nothing about the trustworthiness of the nameserver that has provided those results, so it cannot tell the application anything about whether they should really be trusted.

One of the first steps suggested by glibc maintainer Carlos O'Donell is to add an option (dns-strip-dnssec-ad-bit) to the resolv.conf file telling glibc to unconditionally remove the AD bit. This option could be set by distributions to indicate that the DNS lookup results cannot be trusted at a DNSSEC level. Once things have been set up so that the results can be trusted, that option can be removed. In the meantime, though, applications would have a way to judge the DNS lookup results they get from glibc, something that does not exist now.

What would a trustworthy setup look like? The standard picture looks something like this: there is a local nameserver, accessed via the loopback interface, as the only entry in /etc/resolv.conf. That nameserver would be configured to do verification and, in the case that verification fails, simply return no results at all. There would, in almost all cases, be no need to worry about whether applications see the AD bit or not; if the results are not trustworthy, applications will simply not see them at all. A number of distributions are moving toward this model, but the situation is still not as simple as some might think.

One problem is that this scheme makes /etc/resolv.conf into a central point of trust for the system. But, in a typical Linux system, there are no end of DHCP clients, networking scripts, and more that will make changes to that file. As Paul Wouters pointed out, locking down this file in the short term is not really an option. Sometimes those changes are necessary: when a diskless system is booting, it may need name-resolution service before it is at a point where it can start up its own nameserver. A system's entire DNS environment may change depending on which network it is attached to. Systems in containers may be best configured to talk to a nameserver on the host. And so on.

So there seems to be a general belief that /etc/resolv.conf cannot really be trusted on current systems. Ideas to add secondary configuration files (/etc/secure-resolv.conf or whatever) have been floated, but they don't much change the basic nature of the situation. Beyond that, some participants felt that even a local nameserver running on the loopback interface is not really trustworthy; Zack Weinberg suggested that administrators might intentionally short out DNSSEC validation, for example.

Since the configuration cannot be trusted on current systems, the reasoning goes, glibc needs to have a way to indicate to applications when the situation has improved and things can be trusted. That could include the AD-stripping option described above (or, conversely, an explicit "this nameserver is trusted" option); that, of course, would require that the system be locked down to a level where surprising changes to /etc/resolv.conf no longer happen. A variant, as suggested by Petr Spacek, is to have a way for an application to ask glibc whether it is talking to a local nameserver or not.

Do it in glibc?

An alternative would be to dispense with the nameserver and have glibc do DNSSEC validation itself. There is, however, resistance to putting a big pile of cryptographic code into glibc itself. That would increase the size of the library and, it is felt, increase the attack surface of any application using it. A variant of this idea, suggested by Zack, would be to put the validation code into the name-service caching daemon (nscd) instead. Since nscd is part of glibc, it is under the control of the glibc developers and there could be a certain amount of confidence that DNSSEC validation is being performed properly. The location of the nscd socket is well known, so the /etc/resolv.confissues don't come into play. Carlos worried, though, that this approach might deter adoption by users who do not want the caching features of nscd; in his mind, that seems to rule out the nscd option.

So, in the short term, at least, it seems unlikely that glibc will take on the full task of performing validated DNSSEC lookups. That means that, if security-conscious applications are going to use glibc for their name lookups, the library will have to provide an indication of how trustworthy the results received from a separate nameserver are. And that will almost certainly require explicit action on the part of the distributor and/or system administrator. As Simo Sorce put it:

A situation in which glibc does not use an explicit configuration option to signal applications that it is using a trusted resolver is not useful ... no scratch that, it is actively harmful, because applications developers will quickly realize they cannot trust any information coming from glibc and will simply not use it for DNSSEC related information.

Configuring a system to properly use DNSSEC involves change to many of the components of that system — it is a distribution-wide problem that will take time to solve fully. The role that glibc plays in this transition is likely to be relatively small, but it is an important one: glibc is probably the only place where applications can receive some assurance that their DNS results are trustworthy without implementing their own resolver code. Running multiple DNSSEC implementations on a system seems like an unlikely path to greater security, so it would be good to get this right.

The glibc project has not yet chosen a path by which it intends to get things right, though some sort of annotation in /etc/resolv.conf looks like a likely outcome. Any such change would then have to get into a release; given the conservative nature of glibc development, it may already be late for the 2.23 release, which is likely to happen in February. So higher DNSSEC awareness in glibc may not happen right away, but there is at least some movement in that direction.

--------------------------- 

via: https://lwn.net/Articles/663474/ 

作者：Jonathan Corbet 

译者：[译者ID](https://github.com/译者ID) 

校对：[校对者ID](https://github.com/校对者ID) 

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出
