KeeWeb：一个开源且跨平台的密码管理工具
======

![](https://www.ostechnix.com/wp-content/uploads/2018/10/keeweb-720x340.png)

如果你长时间使用互联网，那很可能在很多网站上都有很多帐户。所有这些帐户都必须有密码，而且必须记住所有的密码，或者把它们写下来。在纸上写下密码可能不安全，如果有多个密码，记住它们实际上是不可能的。这就是密码管理工具在过去几年中大受欢迎的原因。密码管理工具就像一个中央存储库，你可以在其中存储所有帐户的所有密码，并为它设置一个主密码。使用这种方法，你唯一需要记住的只有主密码。

**KeePass** 就是一个这样的开源密码管理工具，它有一个官方客户端，但功能非常简单。也有许多 PC 端和手机端的其他密码管理工具，并且与 KeePass 存储加密密码的文件格式兼容。其中一个就是 **KeeWeb**。

KeeWeb 是一个开源、跨平台的密码管理工具，具有云同步，键盘快捷键和插件等功能。KeeWeb使用 Electron 框架，这意味着它可以在 Windows、Linux 和 Mac OS 上运行。

### KeeWeb 的使用

有两种方式可以使用 KeeWeb。第一种无需安装，直接在网页上使用，第二中就是在本地系统中安装 KeeWeb 客户端。

#### 在网页上使用 KeeWeb

如果不想在系统中安装应用，可以去 [https://app.keeweb.info/][1] 使用KeeWeb。

![](https://www.ostechnix.com/wp-content/uploads/2018/10/KeeWeb-webapp.png)

网页端具有桌面客户端的所有功能，当然也需要联网才能进行使用。

#### 在计算机中安装 KeeWeb

如果喜欢客户端的舒适性和离线可用性，也可以将其安装在系统中。

如果使用 Ubuntu/Debian，你可以去 [发布页][2] 下载 KeeWeb 最新的 .deb 文件，然后通过下面的命令进行安装：

```
$ sudo dpkg -i KeeWeb-1.6.3.linux.x64.deb
```

如果用的是 Arch，在 [AUR][3] 上也有 KeeWeb，可以使用任何 AUR 助手进行安装，例如 [Yay][4]：

```
$ yay -S keeweb
```

安装后，从菜单中或应用程序启动器启动 KeeWeb。默认界面如下：

![](https://www.ostechnix.com/wp-content/uploads/2018/10/KeeWeb-desktop-client.png)

### 总体布局

KeeWeb 界面主要显示所有密码的列表，在左侧展示所有标签。单击标签将对密码进行筛选，只显示带有那个标签的密码。在右侧，显示所选帐户的所有字段。你可以设置用户名、密码、网址，或者添加自定义的备注。你甚至可以创建自己的字段并将其标记为安全字段，这在存储信用卡信息等内容时非常有用。你只需单击即可复制密码。 KeeWeb 还显示账户的创建和修改日期。已删除的密码会保留在回收站中，可以在其中还原或永久删除。

![](https://www.ostechnix.com/wp-content/uploads/2018/10/KeeWeb-general-layout.png)

### KeeWeb 功能

#### 云同步

KeeWeb 的主要功能之一是支持各种远程位置和云服务。除了加载本地文件，你可以从以下位置打开文件：

1. WebDAV Servers
2. Google Drive
3. Dropbox
4. OneDrive

这意味着如果你使用多台计算机，就可以在它们之间同步密码文件，因此不必担心某台设备无法访问所有密码。

#### 密码生成器

![](https://www.ostechnix.com/wp-content/uploads/2018/10/KeeWeb-password-generator.png)

除了对密码进行加密之外，为每个帐户创建新的强密码也很重要。这意味着，如果你的某个帐户遭到入侵，攻击者将无法使用相同的密码进入其他帐户。

为此，KeeWeb 有一个内置密码生成器，可以生成特定长度、包含指定字符的自定义密码。

#### 插件

![](https://www.ostechnix.com/wp-content/uploads/2018/10/KeeWeb-plugins.png)

你可以使用插件扩展 KeeWeb 的功能。其中一些插件用于更改界面语言，而其他插件则添加新功能，例如访问 https://haveibeenpwned.com 以查看密码是否暴露。

#### 本地备份

![](https://www.ostechnix.com/wp-content/uploads/2018/10/KeeWeb-backup.png)

无论密码文件存储在何处，你都应该在计算机上保留一份本地备份。幸运的是，KeeWeb 内置了这个功能。你可以备份到特定路径，并将其设置为定期备份，或者只在文件更改时进行备份。

### 结论

我实际使用 KeeWeb 已经好几年了，它完全改变了我存储密码的方式。云同步是我长期使用 KeeWeb 的主要功能，这样我不必担心在多个设备上保存多个不同步的文件。如果你想要一个具有云同步功能的密码管理工具，KeeWeb 就是你应该关注的东西。

------

via: https://www.ostechnix.com/keeweb-an-open-source-cross-platform-password-manager/

作者：[EDITOR][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[jlztan](https://github.com/jlztan)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/editor/
[1]: https://app.keeweb.info/
[2]: https://github.com/keeweb/keeweb/releases/latest
[3]: https://aur.archlinux.org/packages/keeweb/
[4]: https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/
