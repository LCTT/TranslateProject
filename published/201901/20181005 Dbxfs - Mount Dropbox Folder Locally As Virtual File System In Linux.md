dbxfs：在 Linux 中本地挂载 Dropbox 文件夹
======

![](https://www.ostechnix.com/wp-content/uploads/2018/10/dbxfs-720x340.png)

不久前，我们总结了所有 [在本地挂载 Google Drive][1] 作为虚拟文件系统，并从 Linux 系统访问存储在 Google Drive 中的文件的方法。今天，我们将学习使用 `dbxfs` 将 Dropbox 文件夹挂载到本地文件系统中。`dbxfs` 用于在类 Unix 操作系统中本地挂载 Dropbox 文件夹作为虚拟文件系统。虽然在 Linux 中很容易[安装 Dropbox 客户端][2]，但这种方法与官方方法略有不同。它是一个命令行 dropbox 客户端，且无需磁盘空间即可访问。`dbxfs` 是自由开源的，并且是用 Python 3.5+ 编写的。

### 安装 dbxfs

`dbxfs` 官方支持 Linux 和 Mac OS。但是，它应该适用于任何提供 **FUSE 兼容库**或能够挂载 SMB 共享的 POSIX 系统。由于它是用 Python 3.5 编写的，因此可以使用 pip3 包管理器进行安装。如果尚未安装 pip，请参阅以下指南。

- [如何使用 pip 管理 Python 包][13]

并且也要安装 FUSE 库。

在基于 Debian 的系统上，运行以下命令以安装 FUSE：

```
$ sudo apt install libfuse2
```

在 Fedora 上：

```
$ sudo dnf install fuse
```

安装完所有必需的依赖项后，运行以下命令以安装 `dbxfs`：

```
$ pip3 install dbxfs
```

### 在本地挂载 Dropbox 文件夹

创建一个挂载点以将 Dropbox 文件夹挂载到本地文件系统中。

```
$ mkdir ~/mydropbox
```

然后，使用 `dbxfs` 在本地挂载 dropbox 文件夹，如下所示：

```
$ dbxfs ~/mydropbox
```

你将被要求生成一个访问令牌：

![](https://www.ostechnix.com/wp-content/uploads/2018/10/Generate-access-token-1.png)

要生成访问令牌，只需在 Web 浏览器中输入上面输出的 URL，然后单击 **允许** 以授权 Dropbox 访问。你需要登录 Dropbox 帐户才能完成授权过程。

下一个页面将生成新的授权码。复制代码并返回终端将其粘贴到 cli-dbxfs 提示符中以完成该过程。

然后，系统会要求你保存凭据以供将来访问。根据你是要保存还是拒绝，输入 `Y` 或 `N`。然后，你需要为新的访问令牌输入两次密码。

最后，输入 `Y` 接受 `/home/username/mydropbox` 作为默认挂载点。如果你要设置不同的路径，输入 `N` 并输入你选择的位置。

![Generate access token 2][4]

完成了！从现在开始，你可以看到你的 Dropbox 文件夹已挂载到本地文件系统中。

![](https://www.ostechnix.com/wp-content/uploads/2018/10/Dropbox-in-file-manager.png)

### 更改访问令牌存储路径

默认情况下，`dbxfs` 会将 Dropbox 访问令牌存储在系统密钥环或加密文件中。但是，你可能希望将其存储在 gpg 加密文件或其他地方。如果是这样，请在 [Dropbox 开发者应用控制台][5]上创建个人应用来获取访问令牌。

![](https://www.ostechnix.com/wp-content/uploads/2018/10/access-token.png)

创建应用后，单击下一步中的**生成**按钮。此令牌可用于通过 API 访问你的 Dropbox 帐户。不要与任何人共享你的访问令牌。

![](https://www.ostechnix.com/wp-content/uploads/2018/10/Create-a-new-app.png)

创建访问令牌后，使用任何你选择的加密工具对其进行加密，例如 [Cryptomater][6]、[Cryptkeeper][7]、[CryptGo][8]、[Cryptr][9]、[Tomb][10]、[Toplip][11] 和 [**GnuPG][12] 等，并在你喜欢的位置保存。

接下来编辑 dbxfs 配置文件并添加以下行：

```
"access_token_command": ["gpg", "--decrypt", "/path/to/access/token/file.gpg"]
```

你可以通过运行以下命令找到 dbxfs 配置文件：

```
$ dbxfs --print-default-config-file
```

有关更多详细信息，请参阅 dbxfs 帮助：

```
$ dbxfs -h
```

如你所见，使用 `dbxfs` 在你的文件系统中本地挂载 Dropfox 文件夹并不复杂。经过测试，`dbxfs` 如常工作。如果你有兴趣了解它是如何工作的，请尝试一下，并在下面的评论栏告诉我们你的体验。

就是这些了。希望这篇文章有用。还有更多好东西。敬请期待！

干杯!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/dbxfs-mount-dropbox-folder-locally-as-virtual-file-system-in-linux/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[1]: https://www.ostechnix.com/how-to-mount-google-drive-locally-as-virtual-file-system-in-linux/
[2]: https://www.ostechnix.com/install-dropbox-in-ubuntu-18-04-lts-desktop/
[3]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[4]: http://www.ostechnix.com/wp-content/uploads/2018/10/Generate-access-token-2.png
[5]: https://dropbox.com/developers/apps
[6]: https://www.ostechnix.com/cryptomator-open-source-client-side-encryption-tool-cloud/
[7]: https://www.ostechnix.com/how-to-encrypt-your-personal-foldersdirectories-in-linux-mint-ubuntu-distros/
[8]: https://www.ostechnix.com/cryptogo-easy-way-encrypt-password-protect-files/
[9]: https://www.ostechnix.com/cryptr-simple-cli-utility-encrypt-decrypt-files/
[10]: https://www.ostechnix.com/tomb-file-encryption-tool-protect-secret-files-linux/
[11]: https://www.ostechnix.com/toplip-strong-file-encryption-decryption-cli-utility/
[12]: https://www.ostechnix.com/an-easy-way-to-encrypt-and-decrypt-files-from-commandline-in-linux/
[13]:https://www.ostechnix.com/manage-python-packages-using-pip/
