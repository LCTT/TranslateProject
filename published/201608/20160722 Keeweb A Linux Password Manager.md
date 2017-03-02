Linux 下的密码管理器：Keeweb
================================

![](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/keeweb_1.png?608)

如今，我们依赖于越来越多的线上服务。我们每注册一个线上服务，就要设置一个密码；如此，我们就不得不记住数以百计的密码。这样对于每个人来说，都很容易忘记密码。我将在本文中介绍 Keeweb，它是一款 Linux 密码管理器，可以为你离线或在线地安全存储所有的密码。

当谈及 Linux 密码管理器时，我们会发现有很多这样的软件。我们已经在 LinuxAndUbuntu 上讨论过像 [Keepass][1] 和 [Encryptr，一个基于零知识系统的密码管理器][2] 这样的密码管理器。Keeweb 则是另外一款我们将在本文讲解的 Linux 密码管理器。

### Keeweb 可以离线或在线存储密码

Keeweb 是一款跨平台的密码管理器。它可以离线存储你所有的密码，并且能够同步到你自己的云存储服务上，例如 OneDrive、Google Drive、Dropbox 等。Keeweb 并没有它提供它自己的在线数据库来的同步你的密码。

要使用 Keeweb 连接你的线上存储服务，只需要点击界面中的“more”，然后再点击你想要使用的服务即可。

![](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/keeweb.png?685)

现在，Keeweb 会提示你登录到你的云盘。登录成功后，给 Keeweb 授权使用你的账户。

![](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/authenticate-dropbox-with-keeweb_orig.jpg?649)

### 使用 Keeweb 存储密码

使用 Keeweb 存储你的密码是非常容易的。你可以使用一个复杂的密码加密你的密码文件。Keeweb 也允许你使用一个秘钥文件来锁定密码文件，但是我并不推荐这种方式。如果某个家伙拿到了你的秘钥文件，他只需要简单点击一下就可以解锁你的密码文件。

#### 创建密码

想要创建一个新的密码，你只需要简单地点击 `+` 号，然后你就会看到所有需要填充的输入框。根据你的需要创建更多的密码记录。

#### 搜索密码

![](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/search-passwords_orig.png)

Keeweb 拥有一个图标库，这样你就可以轻松地找到各种特定的密码记录。你可以改变图标的颜色、下载更多的图标，甚至可以直接从你的电脑中导入图标。这对于密码搜索来说，异常好使。

相似的服务的密码可以分组，这样你就可以在一个文件夹里找到它们。你也可以给密码打上标签并把它们存放在不同分类中。

![](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/tags-passwords-in-keeweb.png?283)

### 主题

![](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/themes.png?304)

如果你喜欢类似于白色或者高对比度的亮色主题，你可以在“设置 > 通用 > 主题”中修改。（Keeweb）有四款可供选择的主题，其中两款为暗色，另外两款为亮色。

### 不喜欢 Linux 密码管理器？没问题！ 

我已经发表过文章介绍了另外两款 Linux 密码管理器，它们分别是 Keepass 和 Encryptr，在 Reddit 和其它社交媒体上有些关于它们的争论。有些人反对使用任何密码管理器，也有人持相反意见。在本文中，我想要澄清的是，存放密码文件是我们自己的责任。我认为像 keepass 和 Keeweb 这样的密码管理器是非常好用的，因为它们并没有自己的云来存放你的密码。这些密码管理器会创建一个文件，然后你可以将它存放在你的硬盘上，或者使用像 VeraCrypt 这样的应用给它加密。我个人不使用也不推荐使用那些将密码存储在它们自己数据库的服务。

--------------------------------------------------------------------------------

via: http://www.linuxandubuntu.com/home/keeweb-a-linux-password-manager

译者：[ChrisLeeGit](https://github.com/chrisleegit)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.linuxandubuntu.com/home/keeweb-a-linux-password-manager
[1]: http://www.linuxandubuntu.com/home/keepass-password-management-tool-creates-strong-passwords-and-keeps-them-secure
[2]: http://www.linuxandubuntu.com/home/encryptr-zero-knowledge-system-based-password-manager-for-linux
