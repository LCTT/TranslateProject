WordPress Can Be Used to Leverage Critical Ghost Flaw in Linux
-----
*Users are advised to apply available patches immediately*

![WordPress validating pingback’s post URL](http://i1-news.softpedia-static.com/images/news2/WordPress-Can-Be-Used-to-Leverage-Critical-Ghost-Flaw-in-Linux-471730-2.jpg)

**The vulnerability revealed this week by security researchers at Qualys, who dubbed it [Ghost](1), could be taken advantage of through WordPress or other PHP applications to compromise web servers.**

The glitch is a buffer overflow that can be triggered by an attacker to gain command execution privileges on a Linux machine. It is present in the glibc’s “__nss_hostname_digits_dots()” function that can be used by the “gethostbyname()” function.

##PHP applications can be used to exploit the glitch

Marc-Alexandre Montpas at Sucuri says that the problem is significant because these functions are used in plenty of software and server-level mechanism.

“An example of where this could be a big issue is within WordPress itself: it uses a function named wp_http_validate_url() to validate every pingback’s post URL,” which is carried out through the “gethostbyname()” function wrapper used by PHP applications, he writes in a blog post on Wednesday.

An attacker could use this method to introduce a malicious URL designed to trigger the vulnerability on the server side and thus obtain access to the machine.

In fact, security researchers at Trustwave created [proof-of-concept](2) code that would cause the buffer overflow using the pingback feature in WordPress.

##Multiple Linux distributions are affected

Ghost is present in glibc versions up to 2.17, which was made available in May 21, 2013. The latest version of glibc is 2.20, available since September 2014.

However, at that time it was not promoted as a security fix and was not included in many Linux distributions, those offering long-term support (LTS) in particular.

Among the impacted operating systems are Debian 7 (wheezy), Red Hat Enterprise Linux 6 and 7, CentOS 6 and 7, Ubuntu 12.04. Luckily, Linux vendors have started to distribute updates with the fix that mitigates the risk. Users are advised to waste no time downloading and applying them.

In order to demonstrate the flaw, Qualys has created an exploit that allowed them remote code execution through the Exim email server. The security company said that it would not release the exploit until the glitch reached its half-life, meaning that the number of the affected systems has been reduced by 50%.

Vulnerable application in Linux are clockdiff, ping and arping (under certain conditions), procmail, pppd, and Exim mail server.

--------------------------------------------------------------------------------

via:http://news.softpedia.com/news/WordPress-Can-Be-Used-to-Leverage-Critical-Ghost-Flaw-in-Linux-471730.shtml

本文发布时间:30 Jan 2015, 17:36 GMT

作者：[Ionut Ilascu][a]

译者：[译者ID](https://github.com/译者ID)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://news.softpedia.com/editors/browse/ionut-ilascu
[1]:http://news.softpedia.com/news/Linux-Systems-Affected-by-14-year-old-Vulnerability-in-Core-Component-471428.shtml
[2]:http://blog.spiderlabs.com/2015/01/ghost-gethostbyname-heap-overflow-in-glibc-cve-2015-0235.html
