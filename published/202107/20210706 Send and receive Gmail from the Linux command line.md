[#]: subject: (Send and receive Gmail from the Linux command line)
[#]: via: (https://opensource.com/article/21/7/gmail-linux-terminal)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13573-1.html)

在 Linux 命令行中收发 Gmail 邮件
======

> 即使你用的是诸如 Gmail 的托管邮件服务，你也可以通过 Mutt 在终端里收发电子邮件。

![](https://img.linux.net.cn/data/attachment/album/202107/12/104952frwgx4oz4xrinbxl.jpg)

我喜欢在 Linux 终端上读写电子邮件的便捷，因此我是 [Mutt][2] 这个轻量简洁的电子邮件客户端的忠实用户。对于电子邮件服务来说，不同的系统配置和网络接入并不会造成什么影响。这个客户端通常隐藏在我 Linux 终端的 [某个标签页或者某个终端复用器的面板][3] 上，需要用的时候随时可以调出来，不需要使用的时候放到后台，就不需要在桌面上一直放置一个电子邮件客户端的应用程序。

当今我们大多数人使用的都是托管电子邮件账号，在这种使用场景中并不会与电子邮件协议发生过多的直接交互。而 Mutt（以及更早的 ELM）是在更简单的时代创建的，那时候检查邮件只是对 `uucp` 的调用，以及对 `/var/mail` 的读取。当然 Mutt 也很与时俱进，随着各种流行的协议（如 POP、IMAP、LDAP）出现，它都实现了良好的支持。因此，即使我们使用的是 Gmail 这种邮件服务，也可以与 Mutt 无缝衔接。

如今在大多数情况下，用户都不会拥有自己的电子邮件服务器，大部分用户都会选择 Gmail，因此下文会以 Mutt + Gmail 为例作介绍。如果你比较注重电子邮件隐私，不妨考虑 [ProtonMail][4] 或者 [Tutanota][5]，它们都提供完全加密的电子邮件服务。其中 Tutanota 包含很多 [开源组件][6]，而 ProtonMail 则为付费用户提供 [IMAP 桥接][7]，简化了在非浏览器环境下的邮件访问。不过，很多公司、学校和组织都没有自己的电子邮件服务，而是使用 Gmail 提供的邮件服务，这样一来，大部分用户都会有一个 Gmail 邮箱。

当然，如果你自己就 [拥有电子邮件服务器][8]，那么使用 Mutt 就更简单了。下面我们开始介绍。

### 安装 Mutt

在 Linux 系统上，一般可以直接从发行版提供的软件库中安装 Mutt，另外需要在家目录中创建一个 `.mutt` 目录以存放配置文件：

```
$ sudo dnf install mutt
$ mkdir ~/.mutt
```

在 MacOS 上，可以通过 [MacPorts][9] 或者 [Homebrew][10] 安装；在 Windows 上则可以使用 [Chocolatey][11] 安装。

Mutt 是一个<ruby>邮件用户代理<rt>Mail User Agent</rt></ruby>（MUA），因此它的作用是读取、编写以及向外部邮件池发送邮件。向邮件服务器实际传输邮件是其它应用或邮件服务的工作，尽管它们可以和 Mutt 进行协作，让我们看起来是 Mutt 完成了所有功能，但实际上并非如此。在弄懂了两者之间的区别之后，我们会对 Mutt 的配置更加清楚。

这也是为什么除了 Mutt 之外，我们还需要视乎进行通信的服务种类选择一些辅助应用程序。在本文中我使用的是 IMAP 服务，这可以让我本地的电子邮件副本与电子邮件服务提供商的远程邮件副本保持同步。如果你选择 POP 服务，配置的难度就更下一个台阶了，也无需依赖其它外部工具。我们需要 OfflineIMAP 这个 Python 应用程序来实现 IMAP 的集成，这个应用程序可以在 [它的 GitHub 存储库][12] 获取。

OfflineIMAP 目前仍然在从 Python 2 移植到 Python 3，目前需要手动安装，但以后你也可以通过 `python3 -m pip` 命令进行安装。

OfflineIMAP 依赖于 `imaplib2` 库，这个库也在努力开发当中，所以我更喜欢手动安装。同样地，也是通过 Git 将代码库克隆到本地，进入目录后使用 `pip` 安装。

首先安装 `rfc6555` 依赖：

```
$ python3 -m pip install --user rfc6555
```

然后从源码安装 `imaplib2`：

```
$ git clone git@github.com:jazzband/imaplib2.git
$ pushd imaplib2.git
$ python3 -m pip install --upgrade --user .
$ popd
```

最后从源码安装 OfflineIMAP：

```
$ git clone git@github.com:OfflineIMAP/offlineimap3.git
$ pushd offlineimap3.git
$ python3 -m pip install --upgrade --user .
$ popd
```

如果你使用的是 Windows 上的 Cygwin，那么你还需要安装  [Portlocker][14]。

### 配置 OfflineIMAP

OfflineIMAP 默认使用 `~/.offlineimaprc` 这个配置文件，在它的代码库中会有一个名为 `offlineimap.conf` 的配置模板，可以直接将其移动到家目录下：

```
$ mv offlineimap3.git/offlineimap.conf ~/.offlineimaprc`
```

你可以使用任何文本编辑器打开浏览这个配置文件，它的注释很完善，便于了解各个可用的配置项。

以下是我的 `.offlineimaprc` 配置文件，为了清晰起见，我把其中的注释去掉了。对于你来说其中有些配置项的值可能会略有不同，但或许会为你的配置带来一些启发：

```
[general]
ui = ttyui
accounts = %your-gmail-username%
pythonfile = ~/.mutt/password_prompt.py
fsync = False

[Account %your-gmail-username%]
localrepository = %your-gmail-username%-Local
remoterepository = %your-gmail-username%-Remote
status_backend = sqlite
postsynchook = notmuch new

[Repository %your-gmail-username%-Local]
type = Maildir
localfolders = ~/.mail/%your-gmail-username%-gmail.com
nametrans = lambda folder: {'drafts':  '[Gmail]/Drafts',
                            'sent':    '[Gmail]/Sent Mail',
                            'flagged': '[Gmail]/Starred',
                            'trash':   '[Gmail]/Trash',
                            'archive': '[Gmail]/All Mail',
                            }.get(folder, folder)

[Repository %your-gmail-username%-Remote]
maxconnections = 1
type = Gmail
remoteuser = %your-gmail-username%@gmail.com
remotepasseval = '%your-gmail-API-password%'
## remotepasseval = get_api_pass()
sslcacertfile = /etc/ssl/certs/ca-bundle.crt
realdelete = no
nametrans = lambda folder: {'[Gmail]/Drafts':    'drafts',
                            '[Gmail]/Sent Mail': 'sent',
                            '[Gmail]/Starred':   'flagged',
                            '[Gmail]/Trash':     'trash',
                            '[Gmail]/All Mail':  'archive',
                            }.get(folder, folder)
folderfilter = lambda folder: folder not in ['[Gmail]/Trash',
                                             '[Gmail]/Important',
                                             '[Gmail]/Spam',
                                             ]
```

配置文件里有两个可以替换的值，分别是 `%your-gmail-username%` 和  `%your-gmail-API-password%`。其中第一个值需要替换为 Gmail 用户名，也就是邮件地址中 `@gmail.com` 左边的部分。而第二个值则需要通过双因素身份验证（2FA）后从 Google 获取（即使你在查收邮件时不需要使用 2FA）。

### 为 Gmail 设置双因素身份验证（2FA）

Google 希望用户通过 Gmail 网站收发电子邮件，因此当你在 Gmail 网站以外操作电子邮件时，实际上是被 Google 作为“开发者”看待（尽管你没有进行任何开发工作）。也就是说，Google 会认为你正在创建一个应用程序。要获得开发者层面的应用程序密码，就必须设置双因素身份验证。完成了这个过程以后，就可以获得一个应用程序密码，Mutt 可以通过这个密码在浏览器以外的环境登录到你的电子邮箱中。

为了安全起见，你还可以在 Google 的 [账号安全][15] 页面中添加一个用于找回的电子邮件地址。

在账号安全页面中，点击“<ruby>两步验证<rt>2-step Verification</rt></ruby>”开始设置 2FA，设置过程中需要用到一部手机。

激活 2FA 之后，账号安全页面中会出现“<ruby>应用程序密码<rt>App Passwords</rt></ruby>”选项，点击就可以为 Mutt 创建一个新的应用程序密码。在 Google 生成密码之后，将其替换 `.offlineimaprc` 配置文件中的 `%your-gmail-API-password%` 值。

直接将应用程序密码记录在 `.offlineimaprc` 文件中，这种以纯文本形式存储的做法有一定的风险。长期以来我都是这样做的，而且感觉良好，因为我的家目录是加密的。但出于安全考虑，我现在已经改为使用 GnuPG 加密应用程序密码，这部分内容不在本文的讨论范围，关于如何设置 GPG 密码集成，可以参考我的 [另一篇文章][16]。

### 在 Gmail 启用  IMAP

在你永远告别 Gmail 网页界面之前，还有最后一件事：你必须启用 Gmail 账户的 IMAP 访问。

在 Gmail 网站页面中，点击右上角的“cog”图标，选择“<ruby>查看所有设置<rt>See all settings</rt></ruby>”。在 Gmail 设置页面中，点击“POP/IMAP”标签页，并选中“<ruby>启用 IMAP<rt>enable IMAP</rt></ruby>”，然后保存设置。

现在就可以在浏览器以外访问你的 Gmail 电子邮件了。

### 配置 Mutt

Mutt 的配置过程相对简单。和 [.bashrc][17]、[.zshrc][18]、`.emacs` 这些配置文件一样，网络上有很多优秀的 .muttrc 配置文件可供参照。我自己的 `.muttrc` 配置文件则借鉴了 [Kyle Rankin][19]、[Paul Frields][20] 等人的配置项和想法。下面列出我的配置文件的一些要点：

```
set ssl_starttls=yes
set ssl_force_tls=yes

set from='tux@example.com'
set realname='Tux Example'

set folder = imaps://imap.gmail.com/
set spoolfile = imaps://imap.gmail.com/INBOX
set postponed="imaps://imap.gmail.com/[Gmail]/Drafts"
set smtp_url="smtp://smtp.gmail.com:25"
set move = no
set imap_keepalive = 900
set record="imaps://imap.gmail.com/[Gmail]/Sent Mail"

# Paths
set folder           = ~/.mail
set alias_file       = ~/.mutt/alias
set header_cache     = "~/.mutt/cache/headers"
set message_cachedir = "~/.mutt/cache/bodies"
set certificate_file = ~/.mutt/certificates
set mailcap_path     = ~/.mutt/mailcap
set tmpdir           = ~/.mutt/temp
set signature        = ~/.mutt/sig
set sig_on_top       = yes

# Basic Options
set wait_key = no
set mbox_type = Maildir
unset move               # gmail does that

# Sidebar Patch
set sidebar_visible = yes
set sidebar_width   = 16
color sidebar_new color221 color233

## Account Settings
# Default inbox
set spoolfile = "+example.com/INBOX"

# Mailboxes to show in the sidebar.
mailboxes +INBOX \
          +sent \
          +drafts

# Other special folder
set postponed = "+example.com/drafts"

# navigation
macro index gi "<change-folder>=example.com/INBOX<enter>" "Go to inbox"
macro index gt "<change-folder>=example.com/sent" "View sent"
```

整个配置文件基本是开箱即用的，只需要将其中的 `Tux Example`和 `example.com` 替换为你的实际值，并将其保存为 `~/.mutt/muttrc` 就可以使用了。

### 启动 Mutt

在启动 Mutt 之前，需要先启动 `offlineimap` 将远程邮件服务器上的邮件同步到本地。在首次启动的时候耗时可能会比较长，只需要让它整晚运行直到同步完成就可以了。

在同步完成后，启动 Mutt：

```
$ mutt
```

Mutt 会提示你打开用于管理电子邮件的目录权限，并展示收件箱的视图。

![Mutt email client][22]

### 学习使用 Mutt

在学习使用 Mutt 的过程中，你可以找到最符合你使用习惯的 `.muttrc` 配置。例如我的 `.muttrc` 配置文件集成了使用 Emacs 编写邮件、使用 LDAP 搜索联系人、使用 GnuPG 对邮件进行加解密、链接获取、HTML 视图等等一系列功能。你可以让 Mutt 做到任何你想让它做到的事情，你越探索，就能发现越多。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/gmail-linux-terminal

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-window-focus.png?itok=g0xPm2kD (young woman working on a laptop)
[2]: http://www.mutt.org/
[3]: https://opensource.com/article/21/5/linux-terminal-multiplexer
[4]: https://protonmail.com
[5]: https://tutanota.com
[6]: https://github.com/tutao/tutanota
[7]: https://protonmail.com/bridge/
[8]: https://www.redhat.com/sysadmin/configuring-email-server
[9]: https://opensource.com/article/20/11/macports
[10]: https://opensource.com/article/20/6/homebrew-mac
[11]: https://opensource.com/article/20/3/chocolatey
[12]: https://github.com/OfflineIMAP/offlineimap3
[13]: mailto:git@github.com
[14]: https://pypi.org/project/portalocker
[15]: https://myaccount.google.com/security
[16]: https://opensource.com/article/21/6/enter-invisible-passwords-using-python-module
[17]: https://opensource.com/article/18/9/handy-bash-aliases
[18]: https://opensource.com/article/19/9/adding-plugins-zsh
[19]: https://twitter.com/kylerankin
[20]: https://twitter.com/stickster
[21]: mailto:tux@example.com
[22]: https://opensource.com/sites/default/files/mutt.png (Mutt email client)
