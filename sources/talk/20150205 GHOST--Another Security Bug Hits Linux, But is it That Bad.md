GHOST: Another Security Bug Hits Linux, But is it That Bad?
================================================================================
> GHOST, a newly announced security vulnerability that affects Linux servers and other systems that use the open source glibc library, is not as dangerous to data privacy as the Shellshock or Heartbleed bugs.

![](http://thevarguy.com/site-files/thevarguy.com/files/imagecache/medium_img/uploads/2015/01/ghost-costume.jpg)

Heartbleed is not even a year behind us, and the open source world has been hit with another major security vulnerability in the form of [GHOST][1], which involves holes in the Linux glibc library. This time, though, the actual danger may not live up to the hype.

The GHOST vulnerability, which was announced last week by security researchers at [Qualys][2], resides in the gethostbyname*() functions of the glibc library. glibc is one of the core building blocks of most Linux systems, and gethostbyname*(), which resolves domain names into IP addresses, is widely used in open source applications.

Attackers can exploit the GHOST security hole to create a buffer overflow, making it possible to execute any kind of code they want and do all sorts of nasty things.

All of the above suggests that GHOST is bad news indeed. Fortunately for the open source community, however, the actual risk appears small. As TrendMicro [points out][3], the bug that makes the exploit possible has been fixed in glibc since May 2013, meaning that any Linux servers or PCs running more recent versions of the software are safe from attack.

In addition, gethostbyname*() has been superseded by newer glibc functions that can better handle modern networking environments. Those include ones that use the IPv6 protocol, which gethostbyname*() doesn't support. As a result, newer applications often don't use the gethostbyname*() functions, and are not at risk.

And perhaps most importantly, there's currently no known way of executing GHOST attacks through the Web. That greatly reduces opportunities for using this vulnerability to steal the data of unsuspecting users or otherwise wreak havoc.

All in all, then, GHOST doesn't seem like a vulnerability that will prove as serious as Heartbleed or Shellshock, two other recent security problems that affected widely used open source software.

--------------------------------------------------------------------------------

via: http://thevarguy.com/open-source-application-software-companies/020415/ghost-another-security-bug-hits-linux-it-bad

作者：[Christopher Tozzi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://thevarguy.com/author/christopher-tozzi
[1]:https://community.qualys.com/blogs/laws-of-vulnerabilities/2015/01/27/the-ghost-vulnerability
[2]:http://qualys.com/
[3]:http://blog.trendmicro.com/trendlabs-security-intelligence/not-so-spooky-linux-ghost-vulnerability/