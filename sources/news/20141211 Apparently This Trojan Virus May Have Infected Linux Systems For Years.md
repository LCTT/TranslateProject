Apparently This Trojan Virus May Have Infected Linux Systems For Years
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/12/trojan-word-cloud.jpg)

One of the first few argument in [why should you switch to Linux][1] is that Linux is secure and virus free. It is widely perceived by most of the Linux users that Linux is immune to viruses, which is true to an extent but not entirely.

Like any other OS, Linux too is not immune to malware, trojan, rootkit, virus etc. There have been several [famous Linux viruses][2]. But if you compare those to that of Windows, the number is infinitesimal. So, why am I talking about Linux viruses today then? Because a new trojan has been detected in market which might be impacting Linux systems.

### Turla infects Linux systems as well ###

Few months back a sophisticated cyber espionage program, nicknamed [Turla][3], was detected. It was supposed to be originated in Russia, allegedly with Russian government backing. The spyware program was targeting government organizations in Europe and the United States for four years.

In a recent report, researchers at [Kaspersky][4] has found that Turla was not only affecting Windows system but also Linux operating system. Kaspersky researchers have termed it the ‘missing piece of Turla puzzle’. As per the report:

> “This newly found Turla component supports Linux for broader system support at victim sites. The attack tool takes us further into the set alongside the Snake rootkit and components first associated with this actor a couple years ago. We suspect that this component was running for years at a victim site, but do not have concrete data to support that statement just yet.”

### What is this Linux module of Turla and how dangerous it is? ###

Going by the Kaspersky report,

> The Linux Turla module is a C/C++ executable statically linked against multiple libraries, greatly increasing its file size. It was stripped of symbol information, more likely intended to increase analysis effort than to decrease file size. Its functionality includes hidden network communications, arbitrary remote command execution, and remote management. Much of its code is based on public sources.

Report also mentions that this trojan doesn’t require elevated privileges (read root) while running arbitrary remote commands and it cannot be discovered by commonly used administrative tools. Personally, I doubt their claims.

So, as a Linux desktop user, should you be scared? In my opinion, it is too early to go in to panic mode as we experienced with [ShellShock Linux bug][5]. Turla was originally intended for government organization, not common users. Let’s wait and watch for more concrete news. I’ll keep on updating this article. Till then enjoy Linux.

--------------------------------------------------------------------------------

via: http://itsfoss.com/apparently-trojan-virus-infected-linux-systems-years/

作者：[Abhishek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/Abhishek/
[1]:http://itsfoss.com/reasons-switch-linux-windows-xp/
[2]:http://www.unixmen.com/meet-linux-viruses/
[3]:http://www.reuters.com/article/2014/03/07/us-russia-cyberespionage-insight-idUSBREA260YI20140307
[4]:https://securelist.com/blog/research/67962/the-penquin-turla-2/
[5]:http://itsfoss.com/linux-shellshock-check-fix/