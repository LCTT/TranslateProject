为何 Linux 安装者需要添加安全功能
============================================================

> _由于安全问题越来越严重，Linux 发行版需要在安装程序中突出显示基本安全选项，而不是用户稍后可以手动添加的选项。_

十二年前，Linux 发行版努力使安装变得简单。在 Ubuntu 和 Fedora 的领导下，它们很早就实现了这一目标。现在，随着对安全性越来越关注，它们需要稍微转变下方向，并在安装程序中突出显示基本安全选项，而不是用户稍后可以手动添加的选项。

当然，在最好的情况下，说服用户来设置安全功能都是困难的。太多用户不愿意添加如非特权用户帐户或密码一样简单的功能，他们显然更喜欢用重装或者以每小时 80 美元的价格咨询专家来减少风险。

然而，如果一般用户不会注意安全，那他可能会在安装过程中注意。他们可能永远不会再想到它，但也许在安装过程中，当他们的注意力集中时，特别是如果有可见的解释，他们可能被说服选择一个复选框。

这种转变也并不伟大。许多安装程序已经提供了自动登录的选择 - 一个不包含个人数据的安装功能或许是可以接受的，但很可能不会被那些觉得登录不方便的用户使用。同样感谢 Ubuntu，它选择加密文件系统 - 至少在主目录中是这样 - 它已经成为许多安装程序的标准。我真正建议的是这样的。

此外，外部安装程序如 Firefox 已经无缝合并了隐私浏览，[Signal Private Messenger][8] 是一个替代标准 Android 手机和联系人应用程序。

这些建议远不是激进的。它只需要意志和想象力来实现它。

### Linux 安全第一步

应该将什么类型的安全功能添加到安装程序？

首先是防火墙。有许多图形界面程序可以设置设置防火墙。尽管十七年的经验，但是为了解释 Byron 谈论 Coleridge 的形而上学的猜测，我有时希望有人解释他们的解释。

尽管有良好的意图，大多数防火墙工具让处理 iptables 似乎很直接。[Bastille Linux][9]，一个现在已经停止维护加固系统，可以用于安装一个基本的防火墙，我看不出为什么其他发行版不能做同样的事情。

一些工具在安装后就可以使用，并且对安装者而言可以没有困难地添加。例如，[Grub 2][10]，大多数发行版使用的引导管理器包含了基本密码保护。但不可否认的是，密码仍可以通过 Live CD 绕过，但它仍然在日常情况下提供一定程度的保护，包括远程登录。

类似地，一个后安装的密码管理器（如 [pwgen][11]）可以添加到安装程序的设置帐户部分。这些工具强制可接受密码的长度，以及它们的大小写字母，数字和特殊字符的组合。它们许多都可以为你生成密码，有些甚至可以记住密码。

还有些工具可以在安装中添加。例如，安装程序可以请求定期备份的计划，并添加一个 cronjob 和一个简单的备份工具，如[kbackup][12]。

那么加密电子邮件怎么办？如今最流行的邮件阅读器包括了加密邮件的能力，但是设置和使用加密需要用户采取额外的设置，这使常见的任务复杂化，以至于用户会忽略它。然而，看看 Signal 在手机上的加密有多么简单，很显然，在笔记本电脑和工作站上加密会更容易。这大多数发行版可能都喜欢对等加密，而不喜欢 Signal 那样的集中式服务器，但像 [Ring][13] 这样的程序可以提供这种功能。

无论在安装程序中添加了什么功能，也许预防措施也可以扩展到生产力软件，如 LibreOffice。大多数安全工作都集中在电子邮件、网络浏览和聊天中，但文字处理程序和电子表格，以及他们的宏语言，是一个明显的恶意软件感染的来源和隐私关注。除了像 [Qubes OS][14]或 [Subgraph][15] 这样的几个意外之外，很少有人努力将生产力软件纳入其安全预防措施 - 这可能会留下一个空白的安全漏洞。

### 适应现代

当然，在意安全的用户也许会采取一些安全的方法。然而，这样的用户可以是信任自己。

我关心的是那些不太了解或不太愿意自己做修补的用户。我们越来越需要易于使用的安全性，并且亟待解决。

这些例子只是开始。它们中的大多数已经存在，并且需要以这样的方式来实现它们，使得用户不能忽略它们，并且能够以最少的知识来使用它们。可能实现所有这些只需要一个程序员，包括原型、UI 设计和测试，且不用超过一个月。

然而，直到添加这些功能后，大多数主流的 Linux 发行版几乎不能说是对安全性关注。毕竟，如果用户从不使用它们，那怎么会是好工具？

--------------------------------------------------------------------------------

via: http://www.datamation.com/security/why-linux-installers-need-to-add-security-features.html

作者：[Bruce Byfield][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.datamation.com/author/Bruce-Byfield-6030.html
[1]:http://www.datamation.com/feedback/http://www.datamation.com/security/why-linux-installers-need-to-add-security-features.html
[2]:http://www.datamation.com/author/Bruce-Byfield-6030.html
[3]:http://www.datamation.com/e-mail/http://www.datamation.com/security/why-linux-installers-need-to-add-security-features.html
[4]:http://www.datamation.com/print/http://www.datamation.com/security/why-linux-installers-need-to-add-security-features.html
[5]:http://www.datamation.com/security/why-linux-installers-need-to-add-security-features.html#comment_form
[6]:http://www.datamation.com/security/why-linux-installers-need-to-add-security-features.html#
[7]:http://www.datamation.com/author/Bruce-Byfield-6030.html
[8]:https://whispersystems.org/
[9]:http://bastille-linux.sourceforge.net/
[10]:https://help.ubuntu.com/community/Grub2/Passwords
[11]:http://pwgen-win.sourceforge.net/downloads.html
[12]:http://kbackup.sourceforge.net/
[13]:https://savannah.gnu.org/projects/ring/
[14]:https://www.qubes-os.org/
[15]:https://subgraph.com/sgos/
