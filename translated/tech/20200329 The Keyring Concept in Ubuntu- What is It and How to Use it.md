[#]: collector: (lujun9972)
[#]: translator: (messon007)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (The Keyring Concept in Ubuntu: What is It and How to Use it?)
[#]: via: (https://itsfoss.com/ubuntu-keyring/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

解读Ubuntu里的密钥环概念
======

如果您用过[ubuntu里的自动登录功能][1]或者其他的Linux发行版, 您可能遇到过这种弹出消息：

**请输入密码以解锁您的登录密钥环
  登录密钥环在您登录系统时未解锁**

![Enter Password To Unlock Your Login Keyring Ubuntu][2]

你需要点击多次取消才能让它消失。你可能想知道为什么系统会多次反复提示这个密钥环消息?

让我来告诉你答案。它其实并没有出错，它只是一个安全特性。

奇怪吗？下面就让我来解释下Linux里的密钥环概念。

### Linux里的密钥环是什么以及为什么需要它?

![][3]

在现实生活中您为什么要用钥匙环(也叫[钥匙链][4])? 您用它把一把或多把钥匙串到一起, 以便于携带和查找。

Linux里也是类似的。密钥环特性使您的系统可以将各种密码放在一起，并将其保存在一个地方。

大多数Linux桌面环境像GNOME, KDE, Xfce等采用[gnome的密钥环][5]实现来提供这个功能。

该密钥环保存了ssh密钥，GPG密钥以及使用此功能的应用程序（例如Chromium浏览器）的密钥。 默认情况下，**“密钥环”通过主密码来保护**，该密码通常是帐户的登录密码。

系统上的每个用户都有自己的密钥环，（通常）密码与用户帐户本身的密码相同。 当您使用密码登录系统时，您的密匙环将使用您帐户的密码自动解锁。

当您[启用Ubuntu中的自动登录功能时][1]时，就有问题了。这意味着您无需输入密码即可登录系统。 在这种情况下，您的密钥环不会自动解锁。

#### 密钥环是一个安全特性

记得我说过密钥环是一个安全特性吗？现在想象一下您在您的Linux电脑上开启了自动登录功能。有权访问您电脑的任何人无需密码就能进入您的系统。但是您可能不会在意，因为您只是用它来访问互联网。

但是，如果您使用Chromium或[Ubuntu中的Google Chrome][6]之类的浏览器，并使用它来保存各种网站的登录密码，那么您将遇到麻烦。任何人都可以使用浏览器并利用您在浏览器中保存的密码登录网站。那不就是风险吗？

这就是为什么当您使用Chrome时，它将反复地提示您先解锁密钥环。这确保了只有知道密钥环密码的人才能使用在浏览器中保存的密码来登录它们相关的网站。

如果您反复取消解锁密钥环的提示，它最终将消失并允许您使用浏览器。但是，保存的密码将不会被解锁，您在Chromium/Chome浏览器上将会看到'同步暂停'的提示。

![Sync paused in Google Chrome][7]

#### 如果密钥环总是存在的，为什么您从来没有见过它呢?

如果您在您的Linux系统上从没见过它的话，这就是一个有效的问题。

如果您从没有用过自动登录功能(或者修改您的账户密码)，您可能都没有意识到这个特性的存在。

这是因为当您通过您的密码登录系统时，您的密钥环被您的账户密码自动解锁了。

Ubuntu(和其他发行版)对于通用的管理任务像修改用户, 安装新软件等需要输入密码，无论您是否是自动登录的。但是对于日常任务像使用浏览器，它不需要输入密码因为密钥环已经被解锁了。

当您切换到自动登录时，您不再需要输入登录密码。这意味着密钥环没有被自动解锁，因此当您使用利用了密钥环特性的浏览器时，它将提示您来解锁密钥环。

#### 您可以容易地管理密钥环和密码

这个密钥环放在哪里？它的核心是一个守护任务(一个后台自动运行的程序)。

别担心。您不必通过终端来操作守护任务。大多数桌面环境都自带有图形化的应用程序可以和守护进程进行交互。KDE上有KDE钱包，GNOME和其他桌面上叫做密码和密钥(原来叫[海马][8])。

![Password And Keys App in Ubuntu][9] 

您可以用这个GUI程序来查看什么应用程序在用密钥环来管理/保护密码。

您可以看到，我的系统有自动创建的登录密钥环。也有一个存储GPG和SSH密钥的密钥环。那个[证书][10]是用来保存证书机构颁发的证书(像HTTPS证书)的。

![Password and Keys application in Ubuntu][11]

您也可以使用这个应用程序来手动保存网站的密码。例如，我创建了一个新的叫做'Test'的被密码保护的密钥环，并手动存储了一个密码。

这比保存一批密码在一个文本文件中要好一些。至少在这种情况下，您的密码只有在您通过密码解锁了密钥环时才允许被看到。

![Saving New Password Seahorse][12] 

一个潜在的问题是如果您格式化您的系统，手动保存的密码必然会丢失。通常，您会备份您的个人文件，但并不是所有的用户特定数据如密钥环文件。

有一种办法能解决它。密钥环数据通常保存在~/.local/share/keyrings目录。在这里您可以看到所有的密钥环但是您不能直接看到它们的内容。如果您移除密钥环的密码(我会在这篇文章的后面描述操作步骤)，您可以像一个普通的文本文件一样读取密钥环的内容。您可以完整地拷贝这个解锁后的密钥环文件并在其他的Linux机器(安装了密码和密钥应用)上导入到密码和密钥应用程序。

总结一下目前为止所学的内容：
  * 大多数Linux缺省已经安装并激活了密钥环特性
  * 系统上的每个用户都拥有他自己的密钥环
  * 密钥环通常被账户密码锁定(保护)
  * 当您通过密码登录时密钥环会被自动解锁
  * 对于自动登录，密钥环不会自动解锁，因此当您试图使用依赖密钥环的应用程序时会被提示先解锁它
  * 并不是所有的浏览器或应用程序利用了密钥环特性
  * (Linux上)安装了一个GUI程序可以和密钥环交互
  * 您可以用密钥环来手动以加密格式来存储密码
  * 您可以自己修改密钥环密码
  * 您可以通过导出(需要先解锁密钥环)并导入(到其他计算机上)的方式来获取手工保存的密码。



### 修改密钥环密码

假设您修改了您的账户密码。当您登录时，您的系统试图通过新的登录密码来自动解锁密钥环。但是密钥环还在使用老的登录密码。

这种情况下，您可以修改密钥环密码为新的登录密码，这样密码环才能在您登录系统时自动解锁。

从菜单中打开密码和密钥应用程序：

![Look for Password and Keys app in the menu][9]

在登录密钥环上右击并点击修改密码：

![Change Keyring Password][13]

如果您不记得老的登录密码怎么办？

您可能知道[Ubuntu上复位忘记的密码是很容易的][14]。但是密钥环在这种场景下还是有问题。您修改了账户密码但是您不记得仍然被密钥环使用的老的账户密码。

您不能修改它因为您不知道老的密码。怎么办？

这种情况下，您将不得不移除整个密钥环。您可以通过密码和密钥应用程序来操作：

![Delete Keyring Ubuntu][15]

它会提示您进行确认：

![Delete Keyring][16]

另外，您也可以手动删除~/.local/share/keyrings目录下的密钥环文件。

老的密钥环文件被移除后，您再打开Chrome/Chromium时，它会提示您创建一个新的密钥环。

![New Keyring Password][17]

您可以用新的登录密码，密钥环就会被自动解锁了。

### 禁用密钥环密码

在您想用自动登录但又不想手动解锁密钥环时，您可以把禁用密钥环密码作为一个规避方法。记住您正在禁用一个安全特性，因此请三思。

操作步骤和修改密钥环相似。打开密码和密钥应用程序，然后修改密钥环密码。

技巧在于当它提示修改密码时，不要输入新密码，而是点击继续按钮。这将移除密钥环的密码。

![Disable Keyring password by not setting any password at all][18]

这种方法，密钥环没有密码保护并将一直处于解锁状态。

--------------------------------------------------------------------------------

via: https://itsfoss.com/ubuntu-keyring/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[messon007](https://github.com/messon007)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/ubuntu-automatic-logon/
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/03/enter-password-to-unlock-your-login-keyring-ubuntu.jpg?ssl=1
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/03/keyring-concept-ubuntu-1.png?ssl=1
[4]: https://en.wikipedia.org/wiki/Keychain
[5]: https://wiki.archlinux.org/index.php/GNOME/Keyring
[6]: https://itsfoss.com/install-chrome-ubuntu/
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/sync-paused-keyring-ubuntu.jpg?ssl=1
[8]: https://wiki.debian.org/Seahorse
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/password-and-keys-app-ubuntu.jpg?ssl=1
[10]: https://help.ubuntu.com/lts/serverguide/certificates-and-security.html
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/keyring-pasword-ubuntu.png?ssl=1
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/saving-new-password-seahorse.png?ssl=1
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/change-keyring-password.png?ssl=1
[14]: https://itsfoss.com/how-to-hack-ubuntu-password/
[15]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/delete-keyring-ubuntu.jpg?ssl=1
[16]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/03/delete-keyring.jpg?ssl=1
[17]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/new-keyring-password.jpg?ssl=1
[18]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/disable-keyring-password-ubuntu.png?ssl=1
