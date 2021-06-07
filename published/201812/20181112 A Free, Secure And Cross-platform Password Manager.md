一个免费、安全、跨平台的密码管理器
======

![](https://www.ostechnix.com/wp-content/uploads/2018/11/buttercup-Password-Manager-720x340.png)

在这个现代化的互联网时代，你一定在许多网站上有多个账户，它可能是个人或官方邮箱账户、社交或专业网络账户、GitHub 账户和电子商务账户等。因此，对于不同的账户，你应该设置多个不同的密码。我相信你应该已经意识到为多个账户设置相同的密码是件疯狂又危险的事情。如果攻击者设法破解了你的一个账户，那么他/她很可能尝试使用相同的密码访问你的其他账户。所以，**强烈建议为不同的账户设置不同的密码**。

不过，记住好几个密码是很困难的。你可以把它们写在纸上，但那也不是一个有效的方法，你可能会在一段时间后失去它们。这时密码管理器就派上用场了。密码管理器就像一个存储库，你可以在其中存储不同账户的所有密码，并用一个主密码将其锁定。这样，你需要记住的就只剩下主密码了。之前我们介绍过一个叫 [KeeWeb][1] 的开源密码管理器，今天，我们将介绍另外一款密码管理器 ——— Buttercup。

### 关于 Buttercup

Buttercup 是一个自由、开源、安全、跨平台的密码管理器，使用 **NodeJS** 编写。它可以帮助你将不同账户的所有登录凭证存储到加密存档中，该存档可以保存在本地系统或任何远程服务（如 DropBox、OwnCloud、NextCloud 和基于 WebDAV 的服务）中。它使用强大的 **256 位 AES 加密算法**，用主密码保存你的敏感数据。所以，除了拥有主密码的人以外，没有人可以访问你的登录信息。Buttercup 目前支持 Linux、Mac OS 和 Windows，还提供了一个浏览器扩展和移动应用程序。因此，你也可以在 Android 和 iOS 设备中的桌面应用程序和浏览器扩展程序中使用相同的存档。

### 安装 Buttercup 密码管理器

Buttercup 目前在 Linux 平台上有 .deb、.rpm 软件包、可移植的 AppImage 和 tar 归档文件等安装包。转到其 [发布页][2] 下载安装你想要的版本。

Buttercup 桌面应用程序在 [AUR][3] 中也可用，你可以使用 AUR 帮助程序（如 [Yay][4]）在基于 Arch 的系统上安装，如下所示：

```
$ yay -S buttercup-desktop
```

如果你已经下载了方便的 AppImage 文件，使用如下命令让它执行：

```
$ chmod +x buttercup-desktop-1.11.0-x86_64.AppImage
```

然后，使用命令启动它：

```
$ ./buttercup-desktop-1.11.0-x86_64.AppImage
```

运行此命令后，会提示是否要将 Buttercup AppImage 集成到你的系统中。如果选择 “Yes”，则会将其添加到应用程序菜单并安装图标。如果不这样做，你仍然可以通过双击 AppImage 或在终端中使用上述命令启动应用程序。

### 添加存档

第一次启动时，会看到下面的欢迎界面：

![](https://www.ostechnix.com/wp-content/uploads/2018/11/buttercup-1.png)

我们还没有添加任何存档，所以让我们添加一个吧。单击 “New Archive File” 按钮，输入存档文件的名称，并选择它的保存位置。

![](https://www.ostechnix.com/wp-content/uploads/2018/11/buttercup-2.png)

你可以随意命名。我把它命名为 “mypass”，存档将以 .bcup 为扩展名保存在你选择的位置。

如果你已经创建了一个，只需单击 “Open Archive File” 来选择它。

接下来，Buttercup 将提示你为新创建的存档输入主密码，建议提供一个强级别的密码，以保护存档不会被未经授权访问。

![](https://www.ostechnix.com/wp-content/uploads/2018/11/buttercup-3.png)

现在我们已经创建了一个存档并使用主密码对其进行了保护。类似地，你可以创建任意数量的存档，并使用密码保护它们。

让我们继续在存档中添加账户的详细信息。

### 在存档中添加条目（登录凭证）

创建或打开存档后，你将看到下面的界面。

![](https://www.ostechnix.com/wp-content/uploads/2018/11/buttercup-4.png)

它就像一个保险库，我们将保存不同账户的登录凭证。如你所见，我们并没有添加任何条目。让我们添加一些。

点击右下角的 “ADD ENTRY” 按钮来添加新的条目，输入你想要保存的账户的信息。

![](https://www.ostechnix.com/wp-content/uploads/2018/11/buttercup-5-1.png)

在每个条目下面都有一个 “ADD NEW FIELD” 选项，可以用来添加其他的细节。只需点击它，然后添加要包含在条目中的字段。

添加完所有条目后，你将在 Buttercup 界面的右侧窗格中看到它们。

![][6]

### 添加新的分组

你还可以将登录的详细信息分组到不同的名称下，以便于识别。例如，你可以将所有邮箱账户分组到一个名为 “my_mails” 的名称下。默认情况下，你的登录详细信息将保存在 “General” 群组下。要创建新的群组，请点击 “NEW GROUP” 按钮并输入名称。在新的群组中创建新条目时，与上述的步骤相同，只需单击组名并开始添加条目。

### 管理和访问登录的详细信息

存储在存档中的数据可以随时编辑、移动到其他组或彻底删除。例如，如果要将用户名或密码复制到剪切板，请右击该条目，然后选择 “Copy to Clipboard”。

![][7]

要进一步编辑/修改数据，只需点击所选条目下的 “Edit” 按钮。

### 在远程保存存档

默认情况下，Buttercup 会将数据保存在本地系统上。但是，你可以将它们保存在不同的远程服务（例如 Dropbox、OwnCloud、NextCloud 和基于 WebDAV 的服务）上。

要连接这些服务，请点击 “File -> Connect Cloud Sources”。

![](https://www.ostechnix.com/wp-content/uploads/2018/11/buttercup-8.png)

接下来，选择要连接的服务并对其授权以保存数据。

![][8]

你还可以在添加存档时在 Buttercup 的欢迎界面连接这些服务。

### 导入/导出

Buttercup 允许你向其他密码管理器（例如 1Password、Lastpass 和 KeePass）导入导出数据。你也可以导出数据，在另一个系统或设备（例如 Android）中访问它们。你还可以将 Buttercup 保险库导出为 CSV 格式文件。

![][9]

Buttercup 是一个简单但成熟、功能齐全的密码管理器。多年来它一直在积极开发。如果你需要密码管理器，Buttercup 可能是个不错的选择。有关更多的详细信息，请参阅项目网站和 GitHub 页面。

那就介绍到这里，希望它对你有用。更多的精彩内容即将到来，敬请关注！

谢谢！

### 资源

- [Buttercup 网站](https://buttercup.pw/)
- [Buttercup GitHub 仓库](https://github.com/buttercup/buttercup-desktop)

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/buttercup-a-free-secure-and-cross-platform-password-manager/

作者：[SK][a]
选题：[lujun9972][b]
译者：[seriouszyx](https://github.com/seriouszyx)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-10211-1.html
[2]: https://github.com/buttercup/buttercup-desktop/releases/latest
[3]: https://aur.archlinux.org/packages/buttercup-desktop/
[4]: https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/
[5]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[6]: http://www.ostechnix.com/wp-content/uploads/2018/11/buttercup-6.png
[7]: http://www.ostechnix.com/wp-content/uploads/2018/11/buttercup-7.png
[8]: http://www.ostechnix.com/wp-content/uploads/2018/11/buttercup-9.png
[9]: http://www.ostechnix.com/wp-content/uploads/2018/11/buttercup-10.png
