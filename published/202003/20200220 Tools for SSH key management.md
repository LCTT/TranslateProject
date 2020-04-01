[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11947-1.html)
[#]: subject: (Tools for SSH key management)
[#]: via: (https://opensource.com/article/20/2/ssh-tools)
[#]: author: (Ben Nuttall https://opensource.com/users/bennuttall)

SSH 密钥管理工具
======

> 常用开源工具的省时快捷方式。

![](https://img.linux.net.cn/data/attachment/album/202003/01/122336zyldgpse6eyrbymt.jpg)

我经常使用 SSH。我发现自己每天都要登录多个服务器和树莓派（与我位于同一房间，并接入互联网）。我有许多设备需要访问，并且获得访问权限的要求也不同，因此，除了使用各种 `ssh` / `scp` 命令选项之外，我还必须维护一个包含所有连接详细信息的配置文件。

随着时间的推移，我发现了一些省时的技巧和工具，你可能也会发现它们有用。

### SSH 密钥

SSH 密钥是一种在不使用密码的情况下认证 SSH 连接的方法，可以用来加快访问速度或作为一种安全措施（如果你关闭了密码访问权限并确保仅允许授权的密钥）。要创建 SSH 密钥，请运行以下命令：

```
$ ssh-keygen
```

这将在 `~/.ssh/` 中创建一个密钥对（公钥和私钥）。将私钥（`id_rsa`）保留在 PC 上，切勿共享。你可以与其他人共享公钥（`id_rsa.pub`）或将其放置在其他服务器上。

### ssh-copy-id

如果我在家中或公司工作时使用树莓派，则倾向于将 SSH 设置保留为默认设置，因为我不担心内部信任网络上的安全性，并且通常将 SSH 密钥（公钥）复制到树莓派上，以避免每次都使用密码进行身份验证。为此，我使用 `ssh-copy-id` 命令将其复制到树莓派。这会自动将你的密钥（公钥）添加到树莓派：

```
$ ssh-copy-id pi@192.168.1.20
```

在生产服务器上，我倾向于关闭密码身份验证，仅允许授权的 SSH 密钥登录。

### ssh-import-id

另一个类似的工具是 `ssh-import-id`。你可以使用此方法通过从 GitHub 导入密钥来授予你自己（或其他人）对计算机或服务器的访问权限。例如，我已经在我的 GitHub 帐户中注册了各个 SSH 密钥，因此无需密码即可推送到 GitHub。这些公钥是有效的，因此 `ssh-import-id` 可以使用它们在我的任何计算机上授权我：

```
$ ssh-import-id gh:bennuttall
```

我还可以使用它来授予其他人访问服务器的权限，而无需询问他们的密钥：

```
$ ssh-import-id gh:waveform80
```

### storm

我还使用了名为 Storm 的工具，该工具可帮助你将 SSH 连接添加到 SSH 配置中，因此你不必记住这些连接细节信息。你可以使用 `pip` 安装它：

```
$ sudo pip3 install stormssh
```

然后，你可以使用以下命令将 SSH 连接信息添加到配置中：

```
$ storm add pi3 pi@192.168.1.20
```

然后，你可以只使用 `ssh pi3` 来获得访问权限。类似的还有 `scp file.txt pi3:` 或 `sshfs pi pi3:`。

你还可以使用更多的 SSH 选项，例如端口号：

```
$ storm add pi3 pi@192.168.1.20:2000
```

你可以参考 Storm 的[文档][2]轻松列出、搜索和编辑已保存的连接。Storm 实际所做的只是管理 SSH 配置文件 `~/.ssh/config` 中的项目。一旦了解了它们是如何存储的，你就可以选择手动编辑它们。配置中的示例连接如下所示：

```
Host pi3
   user pi
   hostname 192.168.1.20
   port 22
```

### 结论

从树莓派到大型的云基础设施，SSH 是系统管理的重要工具。熟悉密钥管理会很方便。你还有其他 SSH 技巧要添加吗？我希望你在评论中分享他们。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/ssh-tools

作者：[Ben Nuttall][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/bennuttall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc_BUS_Apple_520.png?itok=ZJu-hBV1 (collection of hardware on blue backround)
[2]: https://stormssh.readthedocs.io/en/stable/usage.html
