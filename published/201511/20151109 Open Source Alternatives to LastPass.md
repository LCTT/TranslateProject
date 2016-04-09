LastPass 的开源替代品
================================================================================
LastPass是一个跨平台的密码管理程序。在Linux平台中，它可作为Firefox, Chrome和Opera浏览器的插件使用。LastPass Sesame支持Ubuntu/Debian与Fedora系统。此外，LastPass还有安装在Firefox Portable的便携版，可将其安装在USB设备上。再加上适用于Ubuntu/Debian, Fedora和openSUSE的LastPass Pocket, 其具有良好的跨平台覆盖性。虽然LastPass备受好评，但它是一个专有软件。此外，LastPass最近被LogMeIn收购。如果你在找一个开源的替代品，这篇文章可能会对你有所帮助。

我们正面临着信息大爆炸。无论你是要在线经营生意，找工作，还是只为了休闲来进行阅读，互联网都是一个海量的信息源。在这种情况下，长期保留信息是很困难的。然而，及时地获取某些特定信息非常重要。密码就是这样的一个例子。

作为一个电脑用户，你可能会面临在不同服务或网站使用相同或不同密码的困境。这个事情非常复杂，因为有些网站会限制你对密码的选择。比如，一个网站可能会限制密码的最小位数，大写字母，数字或者特殊字符，这使得在所有网站使用统一密码变得不可能。更重要的是，不在不同网站中使用同一密码有安全方面的原因。这样就不可避免地意味着人们经常会有很多密码要记。一个解决方案是将所有的密码写下来。然而，这种做法也极度的不安全。

为了解决需要记忆无穷多串密码的问题，目前比较流行的解决方案是使用密码管理软件。事实上，这类软件对于活跃的互联网用户来说极为实用。它使得你获取、管理和安全保存所有密码变得极为容易，而大多数密码都是用软件或文件系统加密过的。因此，用户只需要记住一个简单的密码就可以获取到其它所有密码。密码管理软件鼓励用户对于不同服务去采用独一无二的，非直观的高强度的密码。

为了让大家更深入地了解Linux软件的质量，我将介绍4款优秀的、可替代LastPass的开源软件。

### KeePassX ###

![KeePassX软件截图](http://www.linuxlinks.com/portal/content/reviews/Utilities/Screenshot-KeePassX.png)

KeePassX是KeePass的多平台移植，是一款开源、跨平台的密码管理软件。这款软件可以帮助你以安全的方式保管密码。你可以将所有密码保存在一个数据库中，而这个数据库被一个主密码或密码盘来保管。这使得用户只需要记住一个单一的主密码或插入密码盘即可解锁整个数据库。

密码数据库使用AES(即Rijndael)或者TwoFish算法进行加密，密钥长度为256位。

该软件功能包括：

- 管理模式丰富
      - 通过标题使每条密码更容易被识别
    - 可设置密码过期时间
    - 可插入附件
    - 可为不同分组或密码自定义标志
    - 在分组中对密码排序
- 搜索功能：可在特定分组或整个数据库中搜索
- 自动键入: 这个功能允许你在登录网站时只需要按下几个键。KeePassX可以帮助你输入剩下的密码。自动键入通过读取当前窗口的标题，对密码数据库进行搜索来获取相应的密码
- 数据库安全性强，用户可通过密码或一个密钥文件（可存储在CD或U盘中）访问数据库（或两者）
- 安全密码自动生成
- 具有预防措施，获取用星号隐藏的密码并检查其安全性
- 加密 - 用256位密钥，通过AES(高级加密标准)或TwoFish算法加密数据库，
- 密码可以导入或导出。可从PwManager文件(*.pwm)或KWallet文件(*.xml)中导入密码，可导出为文本(*.txt)格式。

---
- 软件官网：[www.keepassx.org][1]
- 开发者：KeepassX Team
- 软件许可证：GNU GPL V2
- 版本号：0.4.3

### Encryptr ###

![Encryptr软件截图](http://www.linuxlinks.com/portal/content/reviews/Utilities/Screenshot-Encryptr.png)

Encryptr是一个开源的、零知识（zero-knowledge）的、基于云端的密码管理/电子钱包软件，以Crypton为基础开发。Crypton是一个Javascript库，允许开发者利用其开发应用来上传文件至服务器，而服务器无法知道用户所存储的文件内容。

Encryptr可将你的敏感信息，比如密码、信用卡数据、PIN码、或认证码存储在云端。然而，由于它基于零知识的Cypton框架开发，Encryptr可保证只有用户才拥有访问或读取秘密信息的权限。

由于其跨平台的特性，Encryptr允许用户随时随地、安全地通过一个账户从云端获取机密信息。

软件特性包括：

- 使用非常安全的零知识Crypton框架，只在你的本地加密/解密数据
- 易于使用
- 基于云端
- 可存储三种类型的数据：密码、信用卡账号以及通用的键值对
- 可对每条密码设置“备注”项
- 过滤和搜索密码
- 对密码进行本地加密缓存，以节省载入时间

---
- 软件官网: [encryptr.org][2]
- 开发者: Tommy Williams
- 软件许可证: GNU GPL v3
- 版本号: 1.2.0

### RatticDB ###

![RatticDB软件截图](http://www.linuxlinks.com/portal/content/reviews/Utilities/Screenshot-RatticDB.png)

RatticDB是一个开源的、基于Django的密码管理服务。

RatticDB被设计为一个“密码生命周期管理工具”而不是单单一个“密码存储工具”。RatticDB致力于及时提醒用户哪些密码在何时需要更改。它不提供应用层面的密码加密。

软件特性包括：

- 简洁的ACL设计
- 可改变队列功能，可让用户知晓何时需要更改某应用的密码
- 支持Ansible配置

---

- 软件官网: [rattic.org][3]
- 开发者: Daniel Hall
- 软件许可证: GNU GPL v2
- 版本号: 1.3.1

### Seahorse ###

![Seahorse软件截图](http://www.linuxlinks.com/portal/content/reviews/Security/Screenshot-Seahorse.png)

Seahorse是一个GnuPG（GNU隐私保护软件）的Gnome前端界面。它的目标是提供一个易于使用密钥管理工具，以及一个易于使用的界面来控制加密操作。

Seahorse是一个工具，用来提供安全传输和数据存储服务。数据加密和数字密钥生成操作可以轻易通过GUI来操作，密钥管理操作也可以轻易通过直观的界面来进行。

此外，Seahorse包含一个Gedit插件，可以使用鹦鹉螺文件管理器管理文件，一个管理剪贴板中事物的小程序，一个存储私密密码的代理，还有一个GnuPG和OpenSSH的密钥管理工具。

软件特性包括：

- 对文本进行加密/解密/签名
- 管理密钥及密钥环
- 将密钥及密钥环与密钥服务器同步
- 密码签名及发布
- 将密码缓存起来，无需多次重复键入
- 对密钥及密钥环进行备份
- 可添加一个GDK支持格式的图片作为OpenGPG图片ID
- 生成SSH密钥，对其进行验证及储存
- 多语言支持

---

- 软件官网: [www.gnome.org/projects/seahorse][4]
- 开发者: Jacob Perkins, Jose Carlos, Garcia Sogo, Jean Schurger, Stef Walter, Adam Schreiber
- 软件许可证: GNU GPL v2
- 版本号: 3.18.0

--------------------------------------------------------------------------------

via: http://www.linuxlinks.com/article/20151108125950773/LastPassAlternatives.html

译者：[StdioA](https://github.com/StdioA)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:http://www.keepassx.org/
[2]:https://encryptr.org/
[3]:http://rattic.org/
[4]:http://www.gnome.org/projects/seahorse/
