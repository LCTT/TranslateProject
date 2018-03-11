如何使用 Seahorse 管理 PGP 和 SSH 密钥
============================================================


![Seahorse](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/fish-1907607_1920.jpg?itok=u07bav4m "Seahorse")
学习使用 Seahorse GUI 工具去管理 PGP 和 SSH 密钥。[Creative Commons Zero][6]

安全无异于内心的平静。毕竟，安全是许多用户迁移到 Linux 的最大理由。但是当你可以采用几种方法和技术去确保你的桌面或者服务器系统的安全时，你为什么还要停止使用差不多已经接受的平台呢？

其中一项技术涉及到密钥 —在 PGP 和 SSH 中，PGP 密钥允许你去加密和解密电子邮件和文件，而 SSH 密钥允许你使用一个额外的安全层去登入服务器。

当然，你可以通过命令行接口（CLI）来管理这些密钥，但是，如果你使用一个华丽的 GUI 桌面环境呢？经验丰富的 Linux 用户可能对于摆脱命令行来工作感到很不适应，但是，并不是所有用户都具备与他们相同的技术和水平因此，使用 GUI！

在本文中，我将带你探索如何使用  [Seahorse][14] GUI 工具来管理 PGP 和 SSH 密钥。Seahorse 有非常强大的功能，它可以：

*   加密/解密/签名文件和文本。

*   管理你的密钥和密钥对。

*   同步你的密钥和密钥对到远程密钥服务器。

*   签名和发布密钥。

*   缓存你的密码。

*   备份密钥和密钥对。

*   在任何一个 GDK 支持的格式中添加一个图像作为一个 OpenPGP photo ID。

*   创建、配置、和缓存 SSH 密钥。

对于那些不了解 Seahorse 的人来说，它是一个在 GNOME 密钥对中管理加密密钥和密码的 GNOME 应用程序。不用担心，Seahorse 可以安装在许多的桌面上。并且由于 Seahorse 是在标准仓库中创建的，你可以打开你的桌面应用商店（比如，Ubuntu Software 或者 Elementary OS AppCenter）去安装它。因此，你可以在你的发行版的应用商店中点击去安装它。安装完成后，你就可以去使用这个很方便的工具了。

我们开始去使用它吧。

### PGP 密钥

我们需要做的第一件事情就是生成一个新的 PGP 密钥。正如前面所述，PGP 密钥可以用于加密电子邮件（使用一些工具，像  [Thunderbird][15] 的 [Enigmail][16] 或者使用 [Evolution][17] 内置的加密功能）。一个 PGP 密钥也可以用于加密文件。任何人使用你的公钥都可以解密你的电子邮件和文件。没有 PGP 密钥是做不到的。

使用 Seahorse 创建一个新的 PGP 密钥对是非常简单的。以下是操作步骤：

1.  打开 Seahorse 应用程序

2.  在主面板的左上角点击 + 按钮

3.  选择 PGP Key（如图 1 ）

4.  点击 Continue

5.  当提示时，输入完整的名字和电子邮件地址

6.  点击 Create


![Seahorse](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/seahorse_1.jpg?itok=khLOYC61 "Seahorse")
图 1：使用 Seahorse 创建一个 PGP 密钥。[Used with permission][1]

在创建你的 PGP 密钥期间，你可以点击 Advanced key options 展开选项部分，在那里你可以为密钥添加注释信息、加密类型、密钥长度、以及过期时间（如图 2）。


![PGP](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/seahorse_2.jpg?itok=eWiazwrn "PGP")
图 2：PGP 密钥高级选项[Used with permission][2]

增加注释部分可以很方便帮你记住密钥的用途（或者其它的信息）。
要使用你创建的 PGP，可在密钥列表中双击它。在结果窗口中，点击 Names 和 Signatures 选项卡。在这个窗口中，你可以签名你的密钥（表示你信任这个密钥）。点击 Sign 按钮然后（在结果窗口中）标识 how carefully you’ve checked this key 和 how others will see the signature（如图 3）。


![Key signing](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/seahorse_3.jpg?itok=7USKG9fI "Key signing")
图 3：签名一个密钥表示信任级别。[Used with permission][3]

当你处理其它人的密钥时，密钥签名是非常重要的，因为一个签名的密钥将确保你的系统（和你）做了这项工作并且完全信任这个重要的密钥。

谈到导入的密钥，Seahorse 可以允许你很容易地去导入其他人的公钥文件（这个文件以 .asc 为后缀）。你的系统上有其他人的公钥，意味着你可以解密从他们那里发送给你的电子邮件和文件。然而，Seahorse 在很长的一段时间内都存在一个 [已知的 bug][18]。这个问题是，Seahorse 导入使用 GPG 版本 1，但是显示的是 GPG 版本 2。这意味着，在这个存在了很长时间的 bug 被修复之前，导入公钥总是失败的。如果你想导入一个公钥文件到 Seahorse 中，你只能去使用命令行。因此，如果有人发送给你一个文件 olivia.asc，你想去导入到 Seahorse 中使用它，你将只能运行命令 gpg2 --import olivia.asc。那个密钥将出现在 GnuPG 密钥列表中。你可以打开密钥，点击 I trust signatures 按钮，然后在问题 how carefully you’ve checked the key 中，点击 Sign this key 按钮去标示。

### SSH 密钥

现在我们来谈谈我认为 Seahorse 中最重要的一个方面 — SSH 密钥。Seahorse 不仅可以很容易地生成一个 SSH 密钥，而且它也可以很容易地将生成的密钥发送到服务器上，因此，你可以享受到 SSH 密钥验证的好处。下面是如何生成一个新的密钥以及如何导出它到一个远程服务器上。

1.  打开 Seahorse 应用程序

2.  点击 + 按钮

3.  选择 Secure Shell Key

4.  点击 Continue

5.  提供一个密钥描述信息

6.  点击 Set Up 去创建密钥

7.  输入密钥的验证密钥

8.  点击 OK

9.  输入远程服务器地址和服务器上的登陆名（如图 4）

10.  输入远程用户的密码

11.  点击 OK


![SSH key](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/seahorse_4.jpg?itok=ZxuxT8ry "SSH key")
图 4：上传一个 SSH 密钥到远程服务器。[Used with permission][4]

新密钥将上传到远程服务器上以准备好使用它。如果你的服务器已经设置为使用 SSH 密钥验证，那就一切就绪了。

需要注意的是，在创建一个 SSH 密钥期间，你可以点击 Advanced key options 去展开它，配置加密类型和密钥长度（如图 5）。


![Advanced options](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/seahorse_5.jpg?itok=vUT7pi0z "Advanced options")
图 5：高级 SSH 密钥选项。[Used with permission][5]

### Linux 新手必备

任何 Linux 新手用户都可以很快熟悉使用 Seahorse。即便是它有缺陷，Seahorse 仍然是为你准备的一个极其方便的工具。有时候，你可能希望（或者需要）去加密或者解密一个电子邮件/文件，或者为使用 SSH 验证来管理 SSH 密钥。如果你想去这样做而不希望使用命令行，那么，Seahorse 将是非常适合你的工具。

 _通过来自 Linux 基金会和 edX 的 ["Linux 入门" ][13] 免费课程学习更多 Linux 的知识。_

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2018/2/how-manage-pgp-and-ssh-keys-seahorse

作者：[JACK WALLEN ][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/jlwallen
[1]:https://www.linux.com/licenses/category/used-permission
[2]:https://www.linux.com/licenses/category/used-permission
[3]:https://www.linux.com/licenses/category/used-permission
[4]:https://www.linux.com/licenses/category/used-permission
[5]:https://www.linux.com/licenses/category/used-permission
[6]:https://www.linux.com/licenses/category/creative-commons-zero
[7]:https://www.linux.com/files/images/seahorse1jpg
[8]:https://www.linux.com/files/images/seahorse2jpg
[9]:https://www.linux.com/files/images/seahorse3jpg
[10]:https://www.linux.com/files/images/seahorse4jpg
[11]:https://www.linux.com/files/images/seahorse5jpg
[12]:https://www.linux.com/files/images/fish-19076071920jpg
[13]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
[14]:https://wiki.gnome.org/Apps/Seahorse
[15]:https://www.mozilla.org/en-US/thunderbird/
[16]:https://enigmail.net/index.php/en/
[17]:https://wiki.gnome.org/Apps/Evolution
[18]:https://bugs.launchpad.net/ubuntu/+source/seahorse/+bug/1577198
