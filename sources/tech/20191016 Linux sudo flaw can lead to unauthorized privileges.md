[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Linux sudo flaw can lead to unauthorized privileges)
[#]: via: (https://www.networkworld.com/article/3446036/linux-sudo-flaw-can-lead-to-unauthorized-privileges.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Linux sudo flaw can lead to unauthorized privileges
======
Exploiting a newly discovered sudo flaw in Linux can enable certain users with to run commands as root despite restrictions against it.
Thinkstock

A newly discovered and serious flaw in the [**sudo**][1] command can, if exploited, enable users to run commands as root in spite of the fact that the syntax of the  **/etc/sudoers** file specifically disallows them from doing so.

Updating **sudo** to version 1.8.28 should address the problem, and Linux admins are encouraged to do so as soon as possible. 

[[Get regularly scheduled insights by signing up for Network World newsletters.]][2]

How the flaw might be exploited depends on specific privileges granted in the **/etc/sudoers** file. A rule that allows a user to edit files as any user except root, for example, would actually allow that user to edit files as root as well. In this case, the flaw could lead to very serious problems.

[][3]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][3]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

For a user to exploit the flaw, **a user** needs to be assigned privileges in the **/etc/sudoers **file that allow that user to run commands as some other users, and the flaw is limited to the command privileges that are assigned in this way.  

This problem affects versions prior to 1.8.28. To check your sudo version, use this command:

```
$ sudo -V
Sudo version 1.8.27     <===
Sudoers policy plugin version 1.8.27
Sudoers file grammar version 46
Sudoers I/O plugin version 1.8.27
```

The vulnerability has been assigned [CVE-2019-14287][4] in the **Common Vulnerabilities and Exposures** database. The risk is that any user who has been given the ability to run even a single command as an arbitrary user may be able to escape the restrictions and run that command as root – even if the specified privilege is written to disallow running the command as root.

The lines below are meant to give the user "jdoe" the ability to edit files with **vi** as any user except root (**!root** means "not root") and nemo the right to run the **id** command as any user except root:

```
# affected entries on host "dragonfly"
jdoe dragonfly = (ALL, !root) /usr/bin/vi
nemo dragonfly = (ALL, !root) /usr/bin/id
```

However, given the flaw, either of these users would be able to circumvent the restriction and edit files or run the **id** command as root as well.

The flaw can be exploited by an attacker to run commands as root by specifying the user ID "-1" or "4294967295."  

The response of "1" demonstrates that the command is being run as root (showing root's user ID).

Joe Vennix from Apple Information Security both found and analyzed the problem.

Join the Network World communities on [Facebook][5] and [LinkedIn][6] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3446036/linux-sudo-flaw-can-lead-to-unauthorized-privileges.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3236499/some-tricks-for-using-sudo.html
[2]: https://www.networkworld.com/newsletters/signup.html
[3]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE20773&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[4]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-14287
[5]: https://www.facebook.com/NetworkWorld/
[6]: https://www.linkedin.com/company/network-world
