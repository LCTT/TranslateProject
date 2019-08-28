[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11278-1.html)
[#]: subject: (Managing credentials with KeePassXC)
[#]: via: (https://fedoramagazine.org/managing-credentials-with-keepassxc/)
[#]: author: (Marco Sarti https://fedoramagazine.org/author/msarti/)

使用 KeePassXC 管理凭据
======

![][1]

[上一篇文章][2]我们讨论了使用服务器端技术的密码管理工具。这些工具非常有趣而且适合云安装。在本文中，我们将讨论 KeePassXC，这是一个简单的多平台开源软件，它使用本地文件作为数据库。

这种密码管理软件的主要优点是简单。无需服务器端技术专业知识，因此可供任何类型的用户使用。

### 介绍 KeePassXC

KeePassXC 是一个开源的跨平台密码管理器：它是作为 KeePassX 的一个分支开始开发的，这是个不错的产品，但开发不是非常活跃。它使用 256 位密钥的 AES 算法将密钥保存在加密数据库中，这使得在云端设备（如 pCloud 或 Dropbox）中保存数据库相当安全。

除了密码，KeePassXC 还允许你在加密皮夹中保存各种信息和附件。它还有一个有效的密码生成器，可以帮助用户正确地管理他的凭据。

### 安装

这个程序在标准的 Fedora 仓库和 Flathub 仓库中都有。不幸的是，在沙箱中运行的程序无法使用浏览器集成，所以我建议通过 dnf 安装程序：

```
sudo dnf install keepassxc
```

### 创建你的皮夹

要创建新数据库，有两个重要步骤：

* 选择加密设置：默认设置相当安全，增加转换轮次也会增加解密时间。
* 选择主密钥和额外保护：主密钥必须易于记忆（如果丢失它，你的皮夹就会丢失！）而足够强大，一个至少有 4 个随机单词的密码可能是一个不错的选择。作为额外保护，你可以选择密钥文件（请记住：你必须始终都有它，否则无法打开皮夹）和/或 YubiKey 硬件密钥。

![][3]

![][4]

数据库文件将保存到文件系统。如果你想与其他计算机/设备共享，可以将它保存在 U 盘或 pCloud 或 Dropbox 等云存储中。当然，如果你选择云存储，建议使用特别强大的主密码，如果有额外保护则更好。

### 创建你的第一个条目

创建数据库后，你可以开始创建第一个条目。对于 Web 登录，请在“条目”选项卡中输入用户名、密码和 URL。你可以根据个人策略指定凭据的到期日期，也可以通过按右侧的按钮下载网站的 favicon 并将其关联为条目的图标，这是一个很好的功能。

![][5]

![][6]

KeePassXC 还提供了一个很好的密码/口令生成器，你可以选择长度和复杂度，并检查对暴力攻击的抵抗程度：

![][7]

### 浏览器集成

KeePassXC 有一个适用于所有主流浏览器的扩展。该扩展允许你填写所有已指定 URL 条目的登录信息。

必须在 KeePassXC（工具菜单 -> 设置）上启用浏览器集成，指定你要使用的浏览器：

![][8]

安装扩展后，必须与数据库建立连接。要执行此操作，请按扩展按钮，然后按“连接”按钮：如果数据库已打开并解锁，那么扩展程序将创建关联密钥并将其保存在数据库中，该密钥对于浏览器是唯一的，因此我建议对它适当命名：

![][9]

当你打开 URL 字段中的登录页并且数据库是解锁的，那么这个扩展程序将为你提供与该页面关联的所有凭据：

![][10]

通过这种方式，你可以通过 KeePassXC 获取互联网凭据，而无需将其保存在浏览器中。

### SSH 代理集成

KeePassXC 的另一个有趣功能是与 SSH 集成。如果你使用 ssh 代理，KeePassXC 能够与之交互并添加你上传的 ssh 密钥到条目中。

首先，在常规设置（工具菜单 -> 设置）中，你必须启用 ssh 代理并重启程序：

![][11]

此时，你需要以附件方式上传你的 ssh 密钥对到条目中。然后在 “SSH 代理” 选项卡中选择附件下拉列表中的私钥，此时会自动填充公钥。不要忘记选择上面的两个复选框，以便在数据库打开/解锁时将密钥添加到代理，并在数据库关闭/锁定时删除：

![][12]

现在打开和解锁数据库，你可以使用皮夹中保存的密钥登录 ssh。

唯一的限制是可以添加到代理的最大密钥数：ssh 服务器默认不接受超过 5 次登录尝试，出于安全原因，建议不要增加此值。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/managing-credentials-with-keepassxc/

作者：[Marco Sarti][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/msarti/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/08/keepassxc-816x345.png
[2]: https://linux.cn/article-11181-1.html
[3]: https://fedoramagazine.org/wp-content/uploads/2019/08/Screenshot-from-2019-08-17-07-33-27.png
[4]: https://fedoramagazine.org/wp-content/uploads/2019/08/Screenshot-from-2019-08-17-07-48-21.png
[5]: https://fedoramagazine.org/wp-content/uploads/2019/08/Screenshot-from-2019-08-17-08-30-07.png
[6]: https://fedoramagazine.org/wp-content/uploads/2019/08/Screenshot-from-2019-08-17-08-43-11.png
[7]: https://fedoramagazine.org/wp-content/uploads/2019/08/Screenshot-from-2019-08-17-08-49-22.png
[8]: https://fedoramagazine.org/wp-content/uploads/2019/08/Screenshot-from-2019-08-17-09-48-09.png
[9]: https://fedoramagazine.org/wp-content/uploads/2019/08/Screenshot-from-2019-08-17-09-05-57.png
[10]: https://fedoramagazine.org/wp-content/uploads/2019/08/Screenshot-from-2019-08-17-09-13-29.png
[11]: https://fedoramagazine.org/wp-content/uploads/2019/08/Screenshot-from-2019-08-17-09-47-21.png
[12]: https://fedoramagazine.org/wp-content/uploads/2019/08/Screenshot-from-2019-08-17-09-46-35.png
