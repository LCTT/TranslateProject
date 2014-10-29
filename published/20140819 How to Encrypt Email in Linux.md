在Linux中加密邮件
================================================================================
![Kgpg provides a nice GUI for creating and managing your encryption keys.](http://www.linux.com/images/stories/41373/fig-1-kgpg.png)
*Kgpg为了创建了管理加密秘钥提供了一个很好的GUI界面．*

如果你一直在考虑如何加密电子邮件，那么在众多的邮件服务和邮件客户端中挑来挑去一定是件头痛的事情．可以考虑两种加密方法：SSL或TLS加密会保护发送到邮件服务器的登录名和密码．[Gunpg][1]是一款标准的、强大的Linux加密工具，可以加密和认证消息．如果你可以管理自己的GPG加密，并不考虑第三方工具，那它就够了，其它的我们将在稍后讨论．

即便加密了消息，你仍然会暴露在流量分析中，因为消息头部必须是明文形式．所以需要另一款比如[Tor network][2]来隐藏你在互联网上的足迹．我们会看看各种邮件服务和客户端，以及其中的利弊．

### 忘掉Web邮件 ###

如果你使用过GMail, Yahoo，Hotmail或者其它Web邮件提供商的邮件服务，那就忘掉它们吧．你在Web浏览器里输入的任何信息都会暴露在JavaScript攻击中，而且无论服务提供商提供什么保障都是过眼云烟(译者注:此说法靠谱否?)．GMail,Yahoo和Hotmail均提供SSL/TLS加密来防止消息被窃听．但是它们不会提供任何保护来阻碍它们自己的数据挖掘，因此并不会提供端到端的加密．Yahoo和Google都声称将在明年推出端到端的加密．对此我持怀疑态度，因为如果一旦它们的核心业务数据挖掘受到干预，它们就什么都干不了了．

市面上也有各式各样的声称可以为所有类型的电子邮件都能提供安全加密的第三方邮件加密服务，比如[Virtru][3]和[SafeMess][4]．对此我依旧表示怀疑，因为无论是谁，只要持有加密秘钥就可以访问你的消息，所以你还是要依赖于对他们的信任而不是技术．

对等消息可以避免许多使用集中化服务中的缺陷．[RetroShare][5]和[Bitmessage][6]是两种流行的范例．我不知道它们是否如实所述，但这么说肯定有其可取之处．

那Anddroid和iOS又如何呢?假设大部分的Android和iOS应用都没有权限获取你的消息的话，那就是最安全的．不要照搬我说的 -- 在应用将要安装到你的设备上时麻烦读读相关的服务条款并检查所要求的权限．即便在初次安装时它们的条款是可接受的，也记得单方面的条款改变是行业的标准，所以做最坏的打算是最安全的．

### 零知识（Zero Knowledge） ###

[Proton Mail][7]是一款全新的邮件服务，声称采用零知识就可以实现消息加密．认证和消息加密分为两个单独的步骤，Proton遵照Swiss隐私条款，它们不会通过日志记录用户的活动．零知识加密提供真正的安全．这代表只有你拥有你的加密秘钥，如果你丢了它们，你的消息就无法恢复了．

也有许多加密电子邮件服务声称可以保护你的隐私．认真阅读细则，查看红色标注的地方，比如受限的用户数据采集，与好友分享，与执法部门的合作等．这些条款暗示它们会收集和共享用户数据，拥有权限获取你的加密秘钥，并读取你的消息．

### Linux邮件客户端 ###

一款独立的开源邮件客户端，比如, Mutt, Claws, Evolution, Sylpheed和Alpine，可建立你自己控制的GnuPG秘钥，给你大部分的保护．（建立更安全的电子邮件和Web浏览的最容易的方式是运行TAILS live的Linux发行版．详情查看[通过 Tor、TAILS 和 Debian 在网上保护你自己][8]。）

无论你使用的是TAILS还是一款标准Linux发行版，管理GnuPG的方法是相同的，所以下面来学习如何使用GnuPG加密消息．

### 使用GnuPG ###

首先，熟悉一下相关术语。OpenPGP是一种开放的电子邮件加密和认证协议，基于菲利普·齐默曼的Pretty Good Privacy (PGP)。GNU Privacy Guard (GnuPG or GPG)是OpenPGP的GPL实现。GnuPG使用对称公钥加密算法，也就是说会生成一对密钥：一个任何人都可以用来加密发送给你的消息的公钥和一个只有你自己拥有用来解密消息的的私钥。GnuPG执行两个分开的函数：数字化签名消息以证明消息来自你和加密消息。任何人都可以读到你的数字签名消息，但只有那些与你交换密钥的人才可以读取加密消息。切记千万不要与他人分享你的密钥！只能分享公钥。

Seahorse是GnuPG对应的GNOME图形化前端，KGpg是KDE图形化的GnuPG工具。

现在我们执行生成和管理GunPG密钥的基本步骤。这个命令生成一个新的密钥：

    $ gpg --gen-key

这个过程有许多步骤；对于大部分人来说，只需要回答所有的问题，遵循默认设置就好。当你生成你的密钥时，记下来并将其保存在一个安全的地方，因为如果你丢掉了它，你就不能解密任何消息了。**任何关于不要写下密码的建议都是错误的。**我们中的大部分人要记住许多登录名和密码，包括那些我们几乎从来不会用到的，所以全部记住它们是不现实的。你知道当人们不写下他们的密码时会发生什么吗？**他们会选择生成简单的密码并不断重复使用。**你存储在电脑里的任何东西都潜在地会被攻击窃取；一个保存在上锁的柜子里的小本是无法通过渗透获取的，除了物理的入侵，当然入侵者要知道如何去寻找它。

我必须叮嘱你们去弄清楚如何使用新密钥去配置邮件客户端，因为每一个都不同。你可以按照如下操作列出你的密钥：

    $ gpg --list-keys
    /home/carla/.gnupg/pubring.gpg
    ------------------------------
    pub   2048R/587DD0F5 2014-08-13
    uid                  Carla Schroder (my gpg key) 
    sub   2048R/AE05E1E4 2014-08-13

这能快速地获知像密钥的位置、名称（也就是UID）等必要信息。假设你想要把公钥上传到密钥服务器，可以参考实例操作：

    $ gpg --send-keys 'Carla Schroder' --keyserver http://example.com

当你生成了一个新的密钥要上传到公钥服务器，你也应该生成一个撤销证书。不要推迟到以后做———当你生成新密钥时就生成它。你可以给它取任意的名称，比如使用一个像mycodeproject.asc的描述性名称来代替revoke.asc：

    $ gpg --output revoke.asc --gen-revoke 'Carla Schroder'

如果你的密钥变得不可靠了，你可以通过向keyring导入撤销证书来撤销它：

    $ gpg --import ~/.gnupg/revoke.asc

然后生成并上传一个新的密钥来取代它。当它们更新到密钥数据库时，所有使用旧密钥的用户都会被通知。

你必须像保护私钥一样保护撤销证书。将它拷贝到CD或USB存储器中，并加锁，然后从电脑中删除。这是明文密钥，所以你甚至可以将它打印出来。

如果你需要一份复制粘贴的密钥，比如在允许将密钥粘贴到网页表格中的公用keyring中，或者是想将公钥发布到个人站点上，那么你必须生成一份公钥的ASCII-armored版本：

    $ gpg --output carla-pubkey.asc --export -a 'Carla Schroder'

这会生成可见的明文公钥，就像下面这个小例子：

    -----BEGIN PGP PUBLIC KEY BLOCK-----
    Version: GnuPG v1
    mQENBFPrn4gBCADeEXKdrDOV3AFXL7QQQ+i61rMOZKwFTxlJlNbAVczpawkWRC3l
    IrWeeJiy2VyoMQ2ZXpBLDwGEjVQ5H7/UyjUsP8h2ufIJt01NO1pQJMwaOMcS5yTS
    [...]
    I+LNrbP23HEvgAdNSBWqa8MaZGUWBietQP7JsKjmE+ukalm8jY8mdWDyS4nMhZY=
    =QL65
    -----END PGP PUBLIC KEY BLOCK-----

相信上面的教程应该使你学会如何使用GnuPG。如果不够，[The GnuPG manuals][9]上有使用GnuPG和相关全部配置的详细信息。

--------------------------------------------------------------------------------

via: http://www.linux.com/learn/tutorials/784165-how-to-encrypt-email-in-linux

作者：[Carla Schroder][a]
译者：[KayGuoWhu](https://github.com/KayGuoWhu)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.linux.com/component/ninjaboard/person/3734
[1]:http://www.openpgp.org/members/gnupg.shtml
[2]:https://www.torproject.org/
[3]:https://www.virtru.com/
[4]:https://www.safemess.com/
[5]:http://retroshare.sourceforge.net/
[6]:http://retroshare.sourceforge.net/
[7]:https://protonmail.ch/
[8]:http://www.linux.com/learn/docs/718398-protect-yourself-online-with-tor-+tails-and-debian
[9]:https://www.gnupg.org/documentation/manuals.html
