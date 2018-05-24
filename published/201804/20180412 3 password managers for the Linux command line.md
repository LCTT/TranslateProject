3 个 Linux 命令行密码管理器
=====

> 给在终端窗口花费大量时间的人们的密码管理器。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/password.jpg?itok=ec6z6YgZ)

我们都希望我们的密码安全可靠。为此，许多人转向密码管理应用程序，如 [KeePassX][1] 和 [Bitwarden][2]。

如果你在终端中花费了大量时间而且正在寻找更简单的解决方案，那么你需要了解下诸多的 Linux 命令行密码管理器。它们快速，易于使用且安全。

让我们来看看其中的三个。

### Titan

[Titan][3] 是一个密码管理器，也可作为文件加密工具。我不确定 Titan 在加密文件方面效果有多好；我只是把它看作密码管理器，在这方面，它确实做的很好。

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/titan.png?itok=5QoQ1aY7)

Titan 将你的密码存储在加密的 [SQLite 数据库][4]中，你可以在第一次启动该应用程序时创建并添加主密码。告诉 Titan 增加一个密码，它需要一个用来识别它的名字、用户名、密码本身、URL 和关于密码的注释。

你可以让 Titan 为你生成一个密码，你可以通过条目名称或数字 ID、名称、注释或使用正则表达式来搜索数据库，但是，查看特定的密码可能会有点笨拙，你要么必须列出所有密码滚动查找你想要使用的密码，要么你可以通过使用其数字 ID（如果你知道）列出条目的详细信息来查看密码。

### Gopass

[Gopass][5] 被称为“团队密码管理器”。不要因此感到失望，它对个人的使用也很好。

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/gopass.png?itok=1Uodlute)

Gopass 是用 Go 语言编写的经典 Unix 和 Linux [Pass][6] 密码管理器的更新版本。安装纯正的 Linux 方式，你可以[编译源代码][7]或[使用安装程序][8]以在你的计算机上使用 gopass。 

在开始使用 gopass 之前，确保你的系统上有 [GNU Privacy Guard (GPG)][9] 和 [Git][10]。前者对你的密码存储进行加密和解密，后者将提交到一个 [Git 仓库][11]。如果 gopass 是给个人使用，你仍然需要 Git。你不需要担心提交到仓库。如果你感兴趣，你可以[在文档中][12]了解这些依赖关系。

当你第一次启动 gopass 时，你需要创建一个密码存储库并生成一个[密钥][13]以确保存储的安全。当你想添加一个密码（gopass 中称之为“secret”）时，gopass 会要求你提供一些信息，比如 URL、用户名和密码。你可以让 gopass 为你添加的“secret”生成密码，或者你可以自己输入密码。 

根据需要，你可以编辑、查看或删除密码。你还可以查看特定的密码或将其复制到剪贴板，以将其粘贴到登录表单或窗口中。


### Kpcli

许多人选择的是开源密码管理器 [KeePass][14] 和 [KeePassX][15]。 [Kpcli][16] 将 KeePass 和 KeePassX 的功能带到你的终端窗口。

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/kpcli.png?itok=kMmOHTJz)

Kpcli 是一个键盘驱动的 shell，可以完成其图形化的表亲的大部分功能。这包括打开密码数据库、添加和编辑密码和组（组帮助你组织密码），甚至重命名或删除密码和组。

当你需要时，你可以将用户名和密码复制到剪贴板以粘贴到登录表单中。为了保证这些信息的安全，kpcli 也有清除剪贴板的命令。对于一个小终端应用程序来说还不错。

你有最喜欢的命令行密码管理器吗？何不通过发表评论来分享它？

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/4/3-password-managers-linux-command-line

作者：[Scott Nesbitt][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/scottnesbitt
[1]:https://www.keepassx.org/
[2]:https://opensource.com/article/18/3/managing-passwords-bitwarden
[3]:https://www.titanpasswordmanager.org/
[4]:https://en.wikipedia.org/wiki/SQLite
[5]:https://www.justwatch.com/gopass/
[6]:https://www.passwordstore.org/
[7]:https://github.com/justwatchcom/gopass
[8]:https://justwatch.com/gopass/#install
[9]:https://www.gnupg.org
[10]:https://git-scm.com/
[11]:https://git-scm.com/book/en/v2/Git-Basics-Getting-a-Git-Repository
[12]:https://github.com/justwatchcom/gopass/blob/master/docs/setup.md
[13]:http://searchsecurity.techtarget.com/definition/private-key
[14]:https://keepass.info/
[15]:https://www.keepassx.org
[16]:http://kpcli.sourceforge.net/
