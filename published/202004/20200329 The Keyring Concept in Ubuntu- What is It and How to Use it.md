[#]: collector: (lujun9972)
[#]: translator: (messon007)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12093-1.html)
[#]: subject: (The Keyring Concept in Ubuntu: What is It and How to Use it?)
[#]: via: (https://itsfoss.com/ubuntu-keyring/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

解读 Ubuntu 里的密钥环概念
======

![][3]

如果你用过 Ubuntu 或者其他的 Linux 发行版里的[自动登录功能][1], 你可能遇到过这种弹出消息：

> 请输入密码以解锁你的登录密钥环
> 
> 登录密钥环在你登录系统时未解锁。

![Enter Password To Unlock Your Login Keyring Ubuntu][2]

如果你一直点击取消，它会不断弹出几次才会消失。你可能想知道，为什么你会一直看到这个密钥环信息呢？

让我来告诉你吧。它其实不是错误，而是一个安全特性。

奇怪吗？下面就让我来解释下 Linux 里的密钥环概念。

### Linux 里的密钥环是什么。为什么需要它？

在现实生活中你为什么要用钥匙环（也叫[钥匙链][4]）？你用它把一把或多把钥匙串到一起, 以便于携带和查找。

Linux 里也是类似的。密钥环特性使你的系统可以将各种密码放在一起，并将其保存在一个地方。

大多数 Linux 桌面环境，如 GNOME、KDE、Xfce 等采用 [GNOME 密钥环][5]来提供这个功能。

该密钥环保存了 ssh 密钥、GPG 密钥以及使用此功能的应用程序（例如 Chromium 浏览器）的密钥。默认情况下，**“密钥环”通过主密码来保护**，该密码通常是帐户的登录密码。

系统上的每个用户都有自己的密钥环，（通常）密码与用户帐户本身的密码相同。当你使用密码登录系统时，你的密匙环将使用你帐户的密码自动解锁。

当你[启用 Ubuntu 中的自动登录功能时][1]时，就有问题了。这意味着你无需输入密码即可登录系统。在这种情况下，你的密钥环不会自动解锁。

#### 密钥环是一个安全特性

记得我说过密钥环是一个安全特性吗？现在想象一下你在 Linux 电脑上开启了自动登录功能。有权访问你电脑的任何人无需密码就能进入你的系统。但是你可能不会在意，因为你只是用它来访问互联网。

但是，如果你在 Ubuntu 中使用 Chromium 或 [Google Chrome][6] 之类的浏览器，并使用它来保存各种网站的登录密码，那么你将遇到麻烦。任何人都可以使用浏览器并利用你在浏览器中保存的密码登录网站。这不很危险吗？

这就是为什么当你使用 Chrome 时，它将反复地提示你先解锁密钥环。这确保了只有知道密钥环密码（即账户密码）的人才能使用在浏览器中保存的密码来登录它们相关的网站。

如果你反复取消解锁密钥环的提示，它最终将消失，并允许你使用浏览器。但是，保存的密码将不会被解锁，你在 Chromium/Chome 浏览器上将会看到“同步暂停”的提示。

![Sync paused in Google Chrome][7]

#### 如果密钥环一直存在，为什么你从来没有见过它呢?

如果你在你的 Linux 系统上从没见过它的话，这个问题就很有道理。

如果你从没有用过自动登录功能（或者修改你的账户密码），你可能都没有意识到这个特性的存在。

这是因为当你通过你的密码登录系统时，你的密钥环被你的账户密码自动解锁了。

Ubuntu（和其他发行版）在执行普通的管理任务如修改用户、安装新软件等需要输入密码，无论你是否是自动登录的。但是对于日常任务像使用浏览器，它不需要输入密码因为密钥环已经被解锁了。

当你切换到自动登录时，你不再需要输入登录密码。这意味着密钥环没有被自动解锁，因此当你使用利用了密钥环特性的浏览器时，它将提示你来解锁密钥环。

#### 你可以轻松地管理密钥环和密码

这个密钥环放在哪里？它的核心是一个守护任务（一个后台自动运行的程序）。

别担心。你不必通过终端来操作守护任务。大多数桌面环境都自带一个可以和这个守护进程进行交互的图形化应用程序。KDE 上有 KDE 钱包，GNOME 和其他桌面上叫做“密码和密钥”（之前叫 [Seahorse][8]）。

![Password And Keys App in Ubuntu][9] 

你可以用这个 GUI 程序来查看哪些应用程序在用密钥环来管理/保护密码。

你可以看到，我的系统有自动创建的登录密钥环。也有一个存储 GPG 和 SSH 密钥的密钥环。那个[证书][10]用来保存证书机构颁发的证书（如 HTTPS 证书）。

![Password and Keys application in Ubuntu][11]

你也可以使用这个应用程序来手动保存网站的密码。例如，我创建了一个新的叫做“Test”的被密码保护的密钥环，并手动存储了一个密码。

这比在一个文本文件中保存一批密码要好一些。至少在这种情况下，你的密码只有在你通过密码解锁了密钥环时才允许被看到。

![Saving New Password Seahorse][12] 

这里有一个潜在的问题，如果你格式化你的系统，手动保存的密码必然会丢失。通常，你会备份你的个人文件，但并不是所有的用户特定数据，如密钥环文件。

有一种办法能解决它。密钥环数据通常保存在 `~/.local/share/keyrings` 目录。在这里你可以看到所有的密钥环，但是你不能直接看到它们的内容。如果你移除密钥环的密码（我会在这篇文章的后面描述操作步骤），你可以像一个普通的文本文件一样读取密钥环的内容。你可以将这个解锁后的密钥环文件完整地复制下来，并在其他的 Linux 机器上运行“密码和密钥”应用程序导入到其中。

总结一下目前为止所学的内容：

  * 大多数 Linux 系统缺省已经安装并激活了密钥环特性
  * 系统上的每个用户都拥有他自己的密钥环
  * 密钥环通常是用账户密码锁定的（保护）
  * 当你通过密码登录时密钥环会被自动解锁
  * 对于自动登录，密钥环不会自动解锁，因此当你试图使用依赖密钥环的应用程序时会被提示先解锁它
  * 并不是所有的浏览器或应用程序利用了密钥环特性
  * （Linux 上）安装一个 GUI 程序可以和密钥环交互
  * 你可以用密钥环来手动存储加密格式的密码
  * 你可以自己修改密钥环密码
  * 你可以通过导出（需要先解锁密钥环）并导入到其他计算机上的方式来获取手工保存的密码。

### 修改密钥环密码

假设你修改了你的账户密码。当你登录时，你的系统试图通过新的登录密码来自动解锁密钥环。但是密钥环还在使用老的登录密码。

这种情况下，你可以修改密钥环密码为新的登录密码，这样密码环才能在你登录系统时自动解锁。

从菜单中打开“密码和密钥”应用程序：

![Look for Password and Keys app in the menu][9]

在“Login”密钥环上右击并点击“修改密码”：

![Change Keyring Password][13]

#### 如果你不记得老的登录密码怎么办？

你可能知道在 [Ubuntu 上重置忘记的密码很容易][14]。但是密钥环在这种场景下还是有问题。你修改了账户密码，但是你不记得仍然被密钥环使用的老的账户密码。

你不能修改它因为你不知道老的密码。怎么办？

这种情况下，你将不得不移除整个密钥环。你可以通过“密码和密钥”应用程序来操作：

![Delete Keyring Ubuntu][15]

它会提示你进行确认：

![Delete Keyring][16]

另外，你也可以手动删除 `~/.local/share/keyrings` 目录下的密钥环文件。

老的密钥环文件被移除后，你再打开 Chrome/Chromium 时，它会提示你创建一个新的密钥环。

![New Keyring Password][17]

你可以用新的登录密码，密钥环就会被自动解锁了。

### 禁用密钥环密码

在你想用自动登录但又不想手动解锁密钥环时，你可以把禁用密钥环密码作为一个规避方法。记住你正在禁用一个安全特性，因此请三思。

操作步骤和修改密钥环相似。打开“密码和密钥”应用程序，然后修改密钥环密码。

技巧在于当它提示修改密码时，不要输入新密码，而是点击“继续”按钮。这将移除密钥环的密码。

![Disable Keyring password by not setting any password at all][18]

这种方法，密钥环没有密码保护，并将一直处于解锁状态。

--------------------------------------------------------------------------------

via: https://itsfoss.com/ubuntu-keyring/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[messon007](https://github.com/messon007)
校对：[wxy](https://github.com/wxy)

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
