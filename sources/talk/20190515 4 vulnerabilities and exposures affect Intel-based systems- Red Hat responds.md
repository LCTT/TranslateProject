[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (4 vulnerabilities and exposures affect Intel-based systems; Red Hat responds)
[#]: via: (https://www.networkworld.com/article/3395497/4-vulnerabilities-and-exposures-affect-intel-based-systems-red-hat-responds.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

4 vulnerabilities and exposures affect Intel-based systems; Red Hat responds
======
Red Hat issued a security advisory on recently disclosed CVEs (common vulnerabilities and exposures) in Intel microprocessors.
![Melissa Riofrio/IDG][1]

Four vulnerabilities were publicly disclosed related to Intel microprocessors. [These vulnerabilities][2] allow unprivileged attackers to bypass restrictions to gain read access to privileged memory. They include these common vulnerabilities and exposures (CVEs):

  * **CVE-2018-12126** \- a flaw that could lead to information disclosure from the processor store buffer
  * **CVE-2018-12127** \- an exploit of the microprocessor load operations that can provide data to an attacker about CPU registers and operations in the CPU pipeline
  * **CVE-2018-12130** \- the most serious of the three issues and involved the implementation of the microprocessor fill buffers and can expose data within that buffer
  * **CVE-2019-11091** \- a flaw in the implementation of the "fill buffer," a mechanism used by modern CPUs when a cache-miss is made on L1 CPU cache



**[ Also read:[Linux hardening: a 15-step checklist for a secure Linux server][3] ]**

### Red Hat customers should update their systems

Security updates will degrade system performance, but Red Hat strongly suggests that customers update their systems whether or not they believe themselves to be at risk.

Red Hat versions affected include:

  * Red Hat Enterprise Linux 5
  * Red Hat Enterprise Linux 6
  * Red Hat Enterprise Linux 7
  * Red Hat Enterprise Linux 8
  * Red Hat Atomic Host
  * Red Hat Enterprise MRG 2
  * Red Hat OpenShift Online v2
  * Red Hat OpenShift Online v3
  * Red Hat Virtualization (RHV/RHV-H)
  * Red Hat OpenStack Platform



For Red Hat, vulnerability information is available at [this Red Hat vulnerabilities site][4].

It is important to understand that an attacker cannot use this vulnerability to target specific data. Attacks would likely require sampling over a period of time, along with the application of statistical methods to reconstruct data that might be of value to them.

Join the Network World communities on [Facebook][5] and [LinkedIn][6] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3395497/4-vulnerabilities-and-exposures-affect-intel-based-systems-red-hat-responds.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2017/08/intel_cpu_background-100730789-large.jpg
[2]: https://www.csoonline.com/article/3395458/the-second-meltdown-new-intel-cpu-attacks-leak-secrets.html
[3]: http://www.networkworld.com/article/3143050/linux/linux-hardening-a-15-step-checklist-for-a-secure-linux-server.html#tk.nww-fsb
[4]: https://access.redhat.com/security/vulnerabilities/mds
[5]: https://www.facebook.com/NetworkWorld/
[6]: https://www.linkedin.com/company/network-world
