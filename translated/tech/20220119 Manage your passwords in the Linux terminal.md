[#]: subject: "Manage your passwords in the Linux terminal"
[#]: via: "https://opensource.com/article/22/1/manage-passwords-linux-terminal"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "hwlife"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

在 Linux 终端里管理你的密码
======
Pass 是一个经典的类 UNIX 密码管理系统，使用 GnuPG (GPG) 作为加密方式，并且终端作为它的主要界面。

![Linux keys on the keyboard for a desktop computer][1]

这些日子里，我们有了几十个密码。幸运的是，这些密码大部分几乎都是用于网站的，而且你通过互联网浏览器访问了许多网站，许多浏览器都有内置的密码管理器。最普遍的互联网浏览器也有一个同步的功能帮助你所有设备上运行的浏览器之间分发共享密码，所以当你需要它的时候，绝不会找不到你的登录信息。如过这不能够满足你，还有类似 [BitWarden][2] 这样优秀的开源项目可以托管你的加密的密码，确保只有你自己才能解锁它们。这些方案帮助你轻松的维护唯一的密码，同时用这些方便的系统来选择密码。但是我的主密码存储库比以上这些方式简单的多。我主要是使用 [pass][3] ，一个经典的类 UNIX 密码管理系统，使用 GnuPG (GPG) 作为加密方式，并且终端作为它的主要界面。

### 安装 pass

你可以从你的发行版仓库中安装 `pass` 命令。

在 Fedora，Mageia和类似的发行版上，你可以用你的包管理器来安装它：


```
`$ sudo dnf install pass`
```

在 Elementary ，Mint 和其它基于 Debian 的发行版上:


```
`$ sudo apt install pass`
```

在 macOS ,你可以使用 [Homebrew][4] 来安装它：


```
`$ brew install pass`
```

### 设置 GnuPG

在使用 `pass` 之前，你需要一个有效的 PGP ("Pretty Good Privacy") 密钥。如果你已经维护了一个 PGP 密钥，你可以跳过这个步骤，或者你可以选择为使用 `pass` 而创建一个新的密钥。最喜闻乐见的开源 PGP 协议是 Linux 附带的 GnuPG (GPG) ，你可以在 macOS 上从 [gpgtools.org][5] ，Homebrew 或者 [Macports][6] 来安装它。要创建 GnuPG 密码，运行这个命令：

```
`$ gpg --generate-key`
```

提示你输入你的名字和电子邮件并且为密钥创建密码。你的密钥是一个数字文件，你的密码只有你自己知道。它俩组合起来能够加密和解锁加密的信息，比如包含密码的文件。

GPG 密钥更像是一个房门钥匙或者车钥匙，如果你是去它，它加密的任何东西将不能在获得。光知道你的密码是不够的。

如果你已经管理了几个 SSH 密钥，你可能就知道怎么回事了。如果你对数字加密密钥是个新手，可能得花些时间来使用。备份你的 `~/.gnupg` 目录，你不能随意删除它，除非下次你一时兴起决定尝试一个新的发行版。

做一个备份保持备份安全。

### 设置 pass

要开始使用  `pass` ， 你必须初始化一个 _密码仓库_ ，定义为一个已设置的使用指定加密密钥的储存位置。您可以通过与密钥相关联的名称或数字指纹来指示要用于密码存储的GPG密钥。你自己的名字通常更容易选择：


```


$ pass init seth
mkdir: created directory '/home/seth/.password-store/'
Password store initialized for seth

```

如果你忘记了你的名称，你可以使用 `gpg` 命令查看数字指纹和关联你名称的密钥：


```


$ gpg --list-keys
gpg --list-keys
/home/seth/.gnupg/pubring.kbx
\-----------------------------
pub  ed25519 2022-01-06 [SC] [expires: 2024-01-06]
     2BFF94286461216C907CBA52F067996F13EF10D8
uid  [ultimate] Seth Kenlon &lt;[seth@example.com][7]&gt;
sub  cv25519 2022-01-06 [E] [expires: 2024-01-06]

```

用数字指纹初始化一个和你的名称基本相同的密码仓库：


```
`$ pass init 2BFF94286461216C907CBA52F067996F13EF10D8`
```

### 存储密码

使用 `pass add` 命令添加密码到你的密码仓库：


```


$ pass add [www.example.com][8]
Enter password for [www.example.com][8]:

```

提示你键入你要添加的密码。

密码现在存储到了你的密码仓库中。你可以自己查看一下：

```


$ ls /root/.password-store/
[www.example.com.gpg][9]

```

当然，这个文件是不可读的，并且你尝试对它运行 `cat` 或 `less` 时，在你的终端上会显示乱码(如果显示太过杂乱，可以使用 `reset` 命令来恢复你的终端。)


### 用 pass 编辑密码

我使用不同的用户名称进行不同的上网活动，所以网站的用户名常常和密码同样重要。`pass` 是有这个功能的，即使它默认状态下并不提示你。你可以使用 `pass edit` 命令添加用户名到密码文件：


```
`$ pass edit www.example.com`
```

这会打开一个编辑器 (特别是你已经设置了你的 `EDITOR` 或者 `VISUAL` [环境变量][10]) 显示 `www.example.com` 文件的内容。目前，那仅仅是一个密码，但是你可以添加用户名甚至网址或者你想要添加的任何信息。它是个加密了的文件，所以你可以把你要放的任何东西放到里边。


```


bd%dc$3a49af49498bb6f31bc964718C
user: seth123
url: example.com

```

保存文件然后关闭。

### 从 pass 获取密码

要查看密码文件的内容，使用 `pass show` 命令：


```


$ pass show [www.example.com][8]
bd%dc$3a49af49498bb6f31bc964718C
user: seth123
url: [www.example.org][11]

```

### 查找密码

有时候很难记住是否在 `www.example.com` 或者仅仅是 `example.com` 又或者一些类似 `app.example.com` 的网址中填写过密码。此外，一些网站架构使用不同的 URLs 来实现不同的网站功能，所以你可能在  `www.example.com` 网址下填写过密码，你同时也用相同的登录信息在合作网站  `www.example.org` 下使用过密码。

如果有疑问，使用 `grep` 命令。 `pass grep` 命令显示整个搜索项目的实例，无论是在文件名中还是在文件内容中：


```


$ pass grep example
[www.example.com][8]:
url: [www.example.org][11]

```

### 在浏览器中使用 pass

除了互联网密码，我还使用 `pass` 来查看信息，但是上网站是我经常需要密码的地方。我常常在电脑上有一个终端打开，所以我通过 **Alt+Tab** 键切换到终端用 `pass` 来获取信息。但是我并不这么做是因为有了网络浏览器整合了 `pass` 的插件。


#### Pass 托管脚本

首先，安装 `pass` 托管脚本：


```
`$ curl -sSL github.com/passff/passff-host/release/latest/download/install_host_app.sh`
```

这个脚本放置了一个 Python 脚本帮助你的浏览器访问你的密码和 GPG 密码。与其所用的浏览器同时运行(或者不运行，查看整个选项)：


```
`$ bash ./install_host_app.sh firefox`
```

如果你使用多个浏览器，你可以为每一个浏览器安装它。

#### Pass 附件

一旦你已经安装了这个托管程序，你可以为你的浏览器安装一个附件或者扩展。在你的浏览器附件或者扩展管理器里搜索 `PassFF` 插件。


![PassFF][12]

(Seth Kenlon, [CC BY-SA 4.0][13])

安装了这个附件，然后关闭并重新打开浏览器。


导航到一个你在密码仓库存存有密码的网站。在你的登录文本框右侧会显示一个小 **P** 的图标。

![PassFF browser prompt][14]

(Seth Kenlon, [CC BY-SA 4.0][13])

点击 **P** 按钮会看到在你的密码仓库有一个与你网站名称匹配的列表。

![PassFF browser menu][15]

(Seth Kenlon, [CC BY-SA 4.0][13])

点击纸和笔的图标填写表单或者通过纸飞机的图标填写并自动提交表单。

轻松的密码管理并完全整合了!

### 尝试用 pass 作为你的 Linux 密码管理器

对于希望使用日常使用的工具管理密码和个人信息的用户来说，`pass` ”命令是一个很好的选择。如果你已经依赖 GPG 和终端，那么你可能会喜欢 `pass` 系统。对于用户不想让他们的密码和特定的程序挂钩，这也是一个重要的选择。可能你并不适用一个浏览器，或者你不喜欢这种想法，如果你决定停止使用它，从程序中提取密码就会变的困难。使用 `pass` ，你可以在类 UNIX 和直接的系统里保持着对你秘密的控制。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/1/manage-passwords-linux-terminal

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[hwlife](https://github.com/hwlife)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/linux_keyboard_desktop.png?itok=I2nGw78_ (Linux keys on the keyboard for a desktop computer)
[2]: http://bitwarden.com
[3]: https://www.passwordstore.org/
[4]: https://opensource.com/article/20/6/homebrew-mac
[5]: https://gpgtools.org/
[6]: https://opensource.com/article/20/11/macports
[7]: mailto:seth@example.com
[8]: http://www.example.com
[9]: http://www.example.com.gpg
[10]: https://opensource.com/article/19/8/what-are-environment-variables
[11]: http://www.example.org
[12]: https://opensource.com/sites/default/files/uploads/passff.jpg (PassFF)
[13]: https://creativecommons.org/licenses/by-sa/4.0/
[14]: https://opensource.com/sites/default/files/uploads/passff-button-web.jpg (PassFF browser prompt)
[15]: https://opensource.com/sites/default/files/uploads/passff-menu-web.jpg (PassFF browser menu)
