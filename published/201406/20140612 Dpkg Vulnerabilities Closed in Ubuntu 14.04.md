Ubuntu 14.04中Dpkg的漏洞已被修复
================================================================================
![](http://i1-news.softpedia-static.com/images/news2/Dpkg-Vulnerabilities-Closed-in-Ubuntu-14-04-446282-2.jpg)

**Canonical宣布存在于Ubuntu 14.04 LTS，Ubuntu 13.10，Ubuntu 12.10，Ubuntu 12.04 LTS以及Ubuntu 10.04 LTS操作系统中的dpkg漏洞已经被修复。**

Canonical公司刚刚放出dpkg包的一个更新，修复了这个用于所有Ubuntu版本的重要软件中的一个问题。

“我们发现这个问题出现在dpkg在解压源码包的时候，它会使dpkg不能正确地处理某些补丁。如果一位用户或一个自动化系统被欺骗而解压了特别修改过的源码包，远程攻击者就能修改目标解压路径之外的文件，导致拒绝服务攻击或潜在的获取系统权限的风险。”安全通知中这样写道。

想了解这个问题的更多细节描述，你可以查看Canonical的[安全通知][1]。Canonical建议用户尽快升级自己的系统。

如果你将各个发行版系统的libdpkg-perl包升级到最新版本即可修复这个漏洞。要安装这个更新，你只需运行更新管理器/软件更新器即可。

一般来说，一个普通的系统更新就可以完成所有必需的改动，用户不必重启PC或笔记本来应用这个补丁。这个更新同样可以在终端中实现，只需使用 apt-get dist-upgrade 命令。

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/Dpkg-Vulnerabilities-Closed-in-Ubuntu-14-04-446282.shtml

译者：[alim0x](https://github.com/alim0x) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.ubuntu.com/usn/usn-2242-1/
