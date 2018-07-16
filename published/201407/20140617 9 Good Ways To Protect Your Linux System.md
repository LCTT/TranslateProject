保护你的Linux系统的九个老生常谈
================================================================================
在现在这个世道中，保障基于Linux的系统的安全是十分重要的。但是，你得知道怎么干。一个简单反恶意程序软件是远远不够的，你需要采取其它措施来协同工作。那么试试下面这些手段吧。

![](http://www.efytimes.com/admin/useradmin/photo/2Rak10143PM6172014.jpeg)

### 1. 使用SELinux ###

[SELinux][1]是用来对Linux进行安全加固的，有了它，用户和管理员们就可以对访问控制进行更多控制。SELinux为访问控制添加了更细的颗粒度控制。与仅可以指定谁可以读、写或执行一个文件的权限不同的是，SELinux可以让你指定谁可以删除链接、只能追加、移动一个文件之类的更多控制。（LCTT译注：虽然NSA也给SELinux贡献过很多代码，但是目前尚无证据证明SELinux有潜在后门）

### 2. 订阅漏洞警报服务 ###

安全缺陷不一定是在你的操作系统上。事实上，漏洞多见于安装的应用程序之中。为了避免这个问题的发生，你必须保持你的应用程序更新到最新版本。此外，订阅漏洞警报服务，如[SecurityFocus][2]。

### 3. 禁用不用的服务和应用 ###

通常来讲，用户大多数时候都用不到他们系统上的服务和应用的一半。然而，这些服务和应用还是会运行，这会招来攻击者。因而，最好是把这些不用的服务停掉。（LCTT译注：或者干脆不安装那些用不到的服务，这样根本就不用关注它们是否有安全漏洞和该升级了。）

### 4. 检查系统日志 ###

你的系统日志告诉你在系统上发生了什么活动，包括攻击者是否成功进入或试着访问系统。时刻保持警惕，这是你第一条防线，而经常性地监控系统日志就是为了守好这道防线。

### 5. 考虑使用端口试探 ###

设置[端口试探（Port knocking）][4]是建立服务器安全连接的好方法。一般做法是发生特定的包给服务器，以触发服务器的回应/连接（打开防火墙）。端口敲门对于那些有开放端口的系统是一个很好的防护措施。

下面是来自 http://www.portknocking.org/ 的示意图：

![](http://www.portknocking.org/images/portknocking-explained-01.png)![](http://www.portknocking.org/images/portknocking-explained-02.png)![](http://www.portknocking.org/images/portknocking-explained-03.png)![](http://www.portknocking.org/images/portknocking-explained-04.png)

### 6. 使用Iptables ###

Iptables是什么？这是一个应用框架，它允许用户自己为系统建立一个强大的防火墙。因此，要提升安全防护能力，就要学习怎样一个好的防火墙以及怎样使用Iptables框架。

### 7. 默认拒绝所有 ###

防火墙有两种思路：一个是允许每一点通信，另一个是拒绝所有访问，提示你是否许可。第二种更好一些。你应该只允许那些重要的通信进入。（LCTT译注：即默认许可策略和默认禁止策略，前者你需要指定哪些应该禁止，除此之外统统放行；后者你需要指定哪些可以放行，除此之外全部禁止。）

### 8. 使用入侵检测系统 ###

入侵检测系统，或者叫IDS，允许你更好地管理系统上的通信和受到的攻击。[Snort][3]是目前公认的Linux上的最好的IDS。

### 9. 使用全盘加密 ###

加密的数据更难窃取，有时候根本不可能被窃取，这就是你应该对整个驱动器加密的原因。采用这种方式后，如果有某个人进入到你的系统，那么他看到这些加密的数据后，就有得头痛了。根据一些报告，大多数数据丢失源于机器被盗。

--------------------------------------------------------------------------------

via: http://www.efytimes.com/e1/fullnews.asp?edid=141368

译者：[GOLinux](https://github.com/GOLinux) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://selinuxproject.org/page/Main_Page
[2]:http://www.securityfocus.com/rss/vulnerabilities.xml
[3]:http://www.snort.org/
[4]:http://en.wikipedia.org/wiki/Port_knocking
