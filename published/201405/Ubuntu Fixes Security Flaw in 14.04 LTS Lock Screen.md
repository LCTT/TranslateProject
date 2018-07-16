Ubuntu修复了14.04 LTS 上锁屏的安全漏洞
================================================================================
![](http://www.omgubuntu.co.uk/wp-content/uploads/2013/10/security-key.jpg)

**Canonical公司已经修补了Ubuntu 14.04 LTS上一个重大的安全漏洞 — 这个漏洞可能让攻击者不需要输入密码而获取一个用户账户。**

“[锁屏绕开][1]”问题在本周早些时候已经发表在了Launchpad上，漏洞修复[现在已经发布][2]。

它描述了一种方法，通过这个方法可以在没有授权的情况下访问那些使用新的Unity锁屏并处于锁屏状态的用户账户。

如何做呢？右键点击指示器程序直到Alt+F2快捷键能奏效。这时，你就可以发出命令，打开程序，访问日期，甚至通过运行‘**compiz –replace**‘命令打开会话。

漏洞演示的一个视频[可以在YouTube上看到][3]。

这个漏洞的攻击仅能影响到本地环境，并不能远程运行。

### 其他锁屏问题的修复 ###

这个闪闪发光的新锁屏一直使Canonical的安全团队很忙。锁屏绕开问题并不是唯一被发现的漏洞。
就在前几天由于要发布Ubuntu 14.04 LTS，[另一个重要的安全问题][4]被修复（在这种情况下，修复得非常快），这个漏洞可以在锁定的屏幕上通过触发任意一个容易可重复的崩溃强制电脑解锁。另一个基于快捷键的漏洞[当前正在修复的过程中][5]。

### 安全 ###

随着受很多商业，教育机构和企业喜爱的Ubuntu LTS（长期支持版）的发布，这些问题可能是坏消息。但是，如果有问题的话，这都显示Canonical公司在应对和修复问题上是多么迅速——这是非常让人放心的。

这也表明了该公司在决定在七月份时只提示当前LTS用户升级到 14.04 LTS 是多么机敏。这三个月的额外的缓冲时间给ubuntu社区和它的开发者的超级英雄殿堂更多时间去检测和修复安全问题比如以上这些问题。

如果你正在使用Ubuntu 14.04 LTS，记得经常检查和安装更新。

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2014/04/ubuntu-fixes-security-flaw-trusty-login-screen

译者：[linuhap](https://github.com/linuhap) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://bugs.launchpad.net/ubuntu/+source/unity/+bug/1313885
[2]:https://launchpad.net/ubuntu/trusty/+source/unity/7.2.0+14.04.20140423-0ubuntu1.1
[3]:https://www.youtube.com/watch?v=d4UUB0sI5Fc
[4]:https://bugs.launchpad.net/ubuntu/+source/unity/+bug/1308572
[5]:https://bugs.launchpad.net/ubuntu/trusty/+source/unity/+bug/1314247