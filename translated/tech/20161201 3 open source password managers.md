3 款开源的密码管理器
============================================================

> 使用一款安全开源的密码管理器来储存唯一、复杂的密码来保护你数据及账户的安全。

![Open source password managers](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/locks_keys_bridge_paris.png?itok=S4HMI29u) 

*图片来自 : [Jason Baker][1]. [CC BY-SA 4.0][2]*

为你使用的每个站点和服务维护一份唯一、复杂的密码是安全专家每年给公众最常提的建议。

然而不管说过多少遍，几乎每周我们都能听到 XX 网站又被黑了的新闻，问题是这些网站的用户们就爱用一些像“12345”或“password”这样的口令来保护他们的账号。

或许用户对经典的密码做了足够的变形，符合了网站所要求的最低的密码规则。但不幸的是，“Pa$$w0rd!”也不是真正意义上的安全密码。从这方面来说，大多数单词、短语及数字的组合或替换对于密码破解工具而言都太容易破解了，密码越短越容易破解。

最棒的密码应该是长长的，任何可能的字符的随机或者伪随机组合，每个使用场景都用不同的密码。但对一个普通人而言怎么可能记住上百甚至上千个他们创建的独立的账户密码呢？简短的答案是：不能。甚至不管是在现实世界或者数码世界不应该明文记录下任何一个密码。

或许最简单地保存这些复杂、唯一密码的方法是使用密码管理器，它提供了一种访问这些强密码的简单方式。虽然像 LastPass 这样商业解决方案很受欢迎，但是还有一些开源方案。另外对于密码，可以审计你的密码管理器的源码也是很重要的，因为它可以确保你的密码被正确地加密，并且没有后门。

所以不用多说，下面有几款你可以考虑的密码管理器。

### KeePass

[KeePass][3] 是一个 GPLv2 授权的密码管理器，主要设计用于 Windows ，但是同样可以在其它平台运行。KeePass 提供多个强加密选项、便于导出、多用户密钥、高级搜索特性等等。其为桌面用途设计，也有可以直接运行在浏览器中的插件，并且如果你想要在不同的机器间随身携带你的密码，它可以运行在 U 盘中。想要了解更多 KeePass 信息，你可以从在 Ricardo Frydman 的这篇[旧贴][4]中找到。

[KeePassX][5]，是 KeePass 的 Linux 移植版本，是另一个你可以考虑的项目。KeePassX 与 KeePass 2 密码文件兼容，并且已经被移植到不同的操作系统上。事实上，KeePass 的[非官方版本][6]列表覆盖了日常使用的所有系统。

### Padlock

[Padlock][7] 是一个最近新进的开源密码管理器。目前在 Windows、iOS、Android 上可用，Linux 版本正在开发中，Padlock 被设计成为了一个“极简风”的密码管理器。它的[源码][8]以 [GPLv3][9] 授权的形式发布在 Github 上。项目同样也正在开发一个[云后端][10]，同样是开源的，这对那些厌烦了管理密码文件或者在多台电脑间设置同步的人而言是一个很好的补充。

### Passbolt

[Passbolt][11] 是另一个相对较新的选择，它有 Firefox 和 Chrome 的插件，支持移动设备，还有正在开发的命令行。它基于 OpenPGP，你可以查看在线的一些功能[演示][12]（虽然这需要你安装浏览器插件）。以 [AGPLv3 授权][13]发布，你可以在 [Github][14] 上查看它的源码或者浏览一下项目的[路线图][15]来了解下目前和将来计划的功能。

* * *

使用一款你信任的密码管理器以及用复杂的密码并不能代替其他安全预防措施，它也不是万无一失的。但是对于许多用户而言，它是让你的数字生活保持安全的很重要的一部分。这些的确不是唯一的选择。还有一些更老的选择，比如 [Clipperz][16] 和 [Password Safe][17]，还有我有兴趣想尝试一下的基于 web 的工具 [RatticDB][18]。

你会使用哪款密码管理器？为什么呢？

--------------------------------------------------------------------------------

via: https://opensource.com/article/16/12/password-managers

作者：[Jason Baker][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 组织编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jason-baker
[1]:https://opensource.com/users/jason-baker
[2]:https://creativecommons.org/licenses/by-sa/4.0/
[3]:http://keepass.info/
[4]:https://opensource.com/business/16/5/keepassx
[5]:https://www.keepassx.org/
[6]:http://keepass.info/download.html
[7]:https://padlock.io/
[8]:https://github.com/MaKleSoft/padlock
[9]:https://github.com/MaKleSoft/padlock/blob/master/LICENSE
[10]:https://github.com/maklesoft/padlock-cloud
[11]:https://www.passbolt.com/
[12]:https://demo.passbolt.com/auth/login
[13]:https://github.com/passbolt/passbolt_browser_extension/blob/master/LICENCE
[14]:https://github.com/passbolt
[15]:https://www.passbolt.com/roadmap
[16]:https://clipperz.is/
[17]:https://pwsafe.org/
[18]:http://rattic.org/
