linuhap翻译中
Ubuntu Fixes Security Flaw in 14.04 LTS Lock Screen
================================================================================
![](http://www.omgubuntu.co.uk/wp-content/uploads/2013/10/security-key.jpg)

**Canonical has patched a significant security flaw in Ubuntu 14.04 LTS — one that potentially allowed attackers to gain access to a user account without needing to enter a password. **

The ‘[lock screen bypass][1]‘ issue, for which a fix [has now been released][2], was reported on Launchpad earlier this week.

In it, it describes a method through which user accounts ‘locked’ using the new Unity lock screen could be accessed without authorisation.

How? By right-clicking on the indicator applets until the Alt+F2 keyboard shortcut worked. From here, a would-be chancer could issue commands, open apps, access date, and even unlock the session by running the ‘**compiz –replace**‘ command.

A video demo of the loophole [can be viewed on YouTube][3].

The hack was limited to exploit by someone with local access and could not be run remotely.

### Other Lockscreen Issues Patched ###

The new lock screen, for all its glitter, has been keeping Canonical’s security team busy. The Bypass issue has not been the only flaw to have been discovered.

Just days before Ubuntu 14.04 LTS was due to be released, [another critical security issue][4], one which could force a computer to unlock by triggering any readily reproducible crash at the lock screen, was (as in this case, very quickly) fixed. Another shortcut-based loophole is [currently in the process of being fixed][5]. 

### Secure ###

With Ubuntu LTS releases favoured by many businesses, education institutions and enterprise the issues could have proven bad news. But, if anything, these issue have underline just how prompt Canonical is in responding to and fixing issues  — which is hugely reassuring.

It also underlines just how astute the company has been in deciding to only prompt current LTS users to upgrade to 14.04 LTS as of July, when the first point release lands. This extra buffer period of three month gives the Ubuntu community and its super-hero pantheon of developers more time in which to detect and fix security issues such as these.

If you’re running Ubuntu 14.04 LTS remember to check for and install updates often.

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2014/04/ubuntu-fixes-security-flaw-trusty-login-screen

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://bugs.launchpad.net/ubuntu/+source/unity/+bug/1313885
[2]:https://launchpad.net/ubuntu/trusty/+source/unity/7.2.0+14.04.20140423-0ubuntu1.1
[3]:https://www.youtube.com/watch?v=d4UUB0sI5Fc
[4]:https://bugs.launchpad.net/ubuntu/+source/unity/+bug/1308572
[5]:https://bugs.launchpad.net/ubuntu/trusty/+source/unity/+bug/1314247
