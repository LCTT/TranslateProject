[#]: subject: "Manage your passwords in the Linux terminal"
[#]: via: "https://opensource.com/article/22/1/manage-passwords-linux-terminal"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "hwlife"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14480-1.html"

在 Linux 终端里管理你的密码
======

> pass 是一个经典的 UNIX 式密码管理系统，使用 GnuPG（GPG）作为加密方式，终端是它的主要界面。

![](https://img.linux.net.cn/data/attachment/album/202204/16/145508xw1uyw4ezbvrmybv.jpg)

如今，我们每个人都有几十个密码。幸运的是，这些密码大部分几乎都是网站的，你可能通过互联网浏览器访问大部分网站，而许多浏览器都有内置的密码管理器。最流行的互联网浏览器也有一个同步的功能，可以帮助你在各种设备上运行的浏览器之间分发密码，所以当你需要时，绝不会找不到你的登录信息。如果这不能够满足你，还有类似 [BitWarden][2] 这样优秀的开源项目也可以托管你加密后的密码，确保只有你自己才能解锁它们。这些方案有助于你轻松维护独特的密码，我使用这些方便系统来管理一些密码。但是我的主密码存储库比以上这些方式简单的多。我主要是使用 [pass][3] ，这是一个经典的 UNIX 式密码管理系统，使用 GnuPG（GPG）作为加密方式，终端是它的主要界面。

### 安装 pass

你可以从你的发行版仓库中安装 `pass` 命令。

在 Fedora、Mageia 和类似的发行版上，你可以用你的包管理器来安装它：

```
$ sudo dnf install pass
```

在 Elementary、Mint 和其它基于 Debian 的发行版上:

```
$ sudo apt install pass
```

在 macOS 上，你可以使用 [Homebrew][4] 来安装它：

```
$ brew install pass
```

### 设置 GnuPG

在使用 `pass` 之前，你需要一个有效的 PGP（<ruby>良好隐私<rt>Pretty Good Privacy</rt></ruby>）密钥。如果你已经维护了一个 PGP 密钥，你可以跳过这个步骤，或者你可以选择为使用 `pass` 而创建一个新的密钥。最常见的开源 PGP 实现是 GnuPG（GPG），它随 Linux 一起提供。对于 macOS，你可以从 [gpgtools.org][5]、Homebrew 或者 [Macports][6] 安装它。要创建 GnuPG 密码，运行这个命令：

```
$ gpg --generate-key
```

你会被提示输入你的名字和电子邮件，并且为密钥创建一个密码。你的密钥是一个数字文件，你的密码只有你自己知道。它俩组合起来能够“加锁”和“解锁”加密信息，比如包含密码的文件。

GPG 密钥更像是一个房门钥匙或者汽车钥匙，如果你失去了它，它“锁起来”的任何东西都会变得无法获得。仅仅知道你的密码是不够的。

如果你已经管理了几个 SSH 密钥，你可能已经习惯了这一点了。如果你对数字加密密钥是个新手，可能得花些时间来适应。备份你的 `~/.gnupg` 目录，这样当你下次心血来潮决定尝试一个令人兴奋的新发行版时，你就不会意外地删除它。

做一个备份，并保持备份安全。

### 设置 pass

要开始使用  `pass` ，你必须初始化一个 _密码仓库_ ，它定义为一个储存位置，配置为使用特定加密密钥。你可以通过与密钥相关联的名称或数字指纹来指明要用于密码存储的 GPG 密钥。你自己的名字通常更容易选择：

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
-----------------------------
pub  ed25519 2022-01-06 [SC] [expires: 2024-01-06]
     2BFF94286461216C907CBA52F067996F13EF10D8
uid  [ultimate] Seth Kenlon &lt;[seth@example.com][7]&gt;
sub  cv25519 2022-01-06 [E] [expires: 2024-01-06]
```

用指纹初始化密码库与用你的名字初始化密码库基本相同：

```
$ pass init 2BFF94286461216C907CBA52F067996F13EF10D8
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
www.example.com.gpg
```

当然，这个文件是不可读的，并且你尝试对它运行 `cat` 或 `less` 时，在你的终端上会显示乱码（如果扰乱了你的显示，可以使用 `reset` 命令来恢复你的终端。）

### 用 pass 编辑密码

我使用不同的用户名称进行不同的上网活动，所以网站的用户名常常和密码同样重要。`pass` 是有这个功能的，即使它默认状态下并不提示你。你可以使用 `pass edit` 命令添加用户名到密码文件：

```
$ pass edit www.example.com
```

这会打开一个编辑器（一般是你设置为 `EDITOR` 或者 `VISUAL` [环境变量][10] 的编辑器） 显示 `www.example.com` 文件的内容。目前，那仅仅是一个密码，但是你可以添加用户名甚至网址或者你想要添加的任何信息。它是个加密了的文件，所以你可以把你要放的任何东西放到里边。

```
bd%dc$3a49af49498bb6f31bc964718C
user: seth123
url: example.com
```

保存文件然后关闭。

### 从 pass 获取密码

要查看密码文件的内容，使用 `pass show` 命令：

```
$ pass show www.example.com
bd%dc$3a49af49498bb6f31bc964718C
user: seth123
url: www.example.org
```

### 查找密码

有时候很难记住一个密码是归入到 `www.example.com` 还是 `example.com`，又或者一些类似 `app.example.com` 的网址。此外，一些网站架构使用不同的 URL 来实现不同的网站功能，所以你可能在 `www.example.com` 网址下填写过密码，你同时也用相同的登录信息在合作网站  `www.example.org` 下使用过密码。

如果有疑问，可以使用 `grep` 命令。`pass grep` 命令显示整个搜索项目的实例，无论是在文件名中还是在文件内容中：

```
$ pass grep example
www.example.com:
url: www.example.org
```

### 在浏览器中使用 pass

我使用 `pass` 来获取互联网密码以外的信息，但是网站是我经常需要密码的地方。我常常在电脑上的某个地方打开一个终端，所以我通过 `Alt+Tab` 键切换到终端用 `pass` 来获取信息并不麻烦。但是我并不这么做是因为有一些插件可以将 `pass` 与网页浏览器整合在一起。

#### pass 托管脚本

首先，安装 `pass` 托管脚本：

```
$ curl -sSL github.com/passff/passff-host/release/latest/download/install_host_app.sh
```

这个脚本放置了一个 Python 脚本，帮助你的浏览器访问你的密码和 GPG 密码。用你所用的浏览器的名字运行它（或者不写参数，查看全部选项）：

```
$ bash ./install_host_app.sh firefox
```

如果你使用多个浏览器，你可以为每一个浏览器安装它。

#### pass 附件

一旦你已经安装了这个托管程序，你可以为你的浏览器安装一个附件或者扩展。在你的浏览器附件或者扩展管理器里搜索 `PassFF` 插件。

![PassFF][12]

安装了这个附件，然后关闭并重新打开浏览器。

导航到一个你在密码仓库中存有密码的网站。在你的登录文本框右侧会显示一个小小的 “P” 图标。

![PassFF browser prompt][14]

点击 “P” 按钮会看到你的密码仓库中与你网站名称匹配的一个列表。

![PassFF browser menu][15]

点击“纸和笔”的图标填写表单，或者通过“纸飞机”的图标填写并自动提交表单。

轻松的密码管理，而且完全整合了！

### 尝试用 pass 作为你的 Linux 密码管理器

对于那些想用日常使用的工具来管理密码和个人信息的用户来说，`pass` 命令是一个很好的选择。如果你已经依赖 GPG 和终端，那么你可能会喜欢 `pass` 系统。对于那些不想让他们的密码被束缚在特定程序上的用户来说，这也是一个重要的选择。可能你并不只使用一个浏览器，或者你不喜欢这种想法，即如果你决定停止使用一个应用程序，可能很难从它那里提取你的密码。使用 `pass` ，你可以在一个 UNIX 式的直接系统中保持对你的秘密的控制。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/1/manage-passwords-linux-terminal

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[hwlife](https://github.com/hwlife)
校对：[wxy](https://github.com/wxy)

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
