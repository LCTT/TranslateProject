9 Good Ways To Protect Your Linux System
================================================================================
Securing your Linux-based system is very important nowadays. But you have to know how to do this. A simple anti-malware software is usually not good enough and you need to take some other steps. Try these,

![](http://www.efytimes.com/admin/useradmin/photo/2Rak10143PM6172014.jpeg)

### 1. Use SELinux ###

[SELinux][1] is a security enhancement to Linux, which allows users and administrators more control over access control. SELinux adds finer granularity to access controls. Instead of only being able to specify who can read, write or execute a file, for example, SELinux lets you specify who can unlink, append only, move a file and so on.

### 2. Subscribe to a Vulnerability Alert Service ###

Your operating system may not necessarily be the one that is vulnerable. In fact, vulnerabilities are most often found in the applications that one installs. In order to avoid this, you must keep your applications updated to the newest version. In addition, subscribe to alert services like [SecurityFocus][2].

### 3. Disable Unused Services and Applications ###

In general, users do not use half of the services and applications on their system for most of the time. These services and applications though are kept running, which could make for an invitation to attackers. It is best to keep unused services stopped.

### 4. Check System Logs ###

Your system logs tell you what activity has happened on the system, including whether an attacker has been successful in or tried to access the system. Being careful is your first line of defense and your system logs should be regularly monitored for this.

### 5. Consider Port Knocking ###

Setting up port knocking is a good way to establish a secure connection with a server. What basically happens is that a special package is sent to the server, which triggers a response/connection from the server. Port knocking is a good defensive manuever for those who have open ports on their systems.

### 6. Use Iptables ###

What is Iptables? This is an application framework, which allows the user to write their own powerful firewall for the system. So, learn how to write a good firewall and use the Iptables framework in order to do well.

### 7. Deny All by Default ###

Firewalls follow two philosophies: one is to allow every bit of traffic and the other is to deny access to everything, prompting you for permission. The second option is the better of the two. You should only allow the traffic that is important to come in.

### 8. Use an Intrusion Detection System ###

An Intrusion Detection System or IDS allows you to manage the traffic and attacks on your system better. [Snort][3]

Encrypted data is harder and sometimes impossible to steal, which is why you should keep your entire drive encrypted. This way if someone does get access to your system, they will still have a very hard time getting by the encryption. According to some reports, most data loss is through stolen machines. 

--------------------------------------------------------------------------------

via: http://www.efytimes.com/e1/fullnews.asp?edid=141368

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://selinuxproject.org/page/Main_Page
[2]:http://www.securityfocus.com/rss/vulnerabilities.xml
[3]:http://www.snort.org/