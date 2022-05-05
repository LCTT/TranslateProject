[#]: subject: "Troubleshooting “Unacceptable TLS certificate” Error in Linux"
[#]: via: "https://itsfoss.com/unacceptable-tls-certificate-error-linux/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14288-1.html"

在 Linux 中解决 “Unacceptable TLS certificate” 的问题
======

当涉及到 SSL/TLS 证书时，你可能会遇到各种问题，有些与浏览器有关，有些则是网站后台的问题。

其中一个错误是 Linux 中的 “Unacceptable TLS certificate”。

不幸的是，对此没有“一劳永逸”的答案。然而，有一些潜在的解决方案，你可以尝试，在此，我打算为你强调这些。

### 你什么时候会遇到这个 TLS 证书问题？

![][1]

在我的例子中，我是在通过终端添加 Flathub 仓库时注意到这个问题的，这个步骤可以让你在 [设置 Flatpak][2] 时访问大量的 Flatpak 集合。

然而，在安装 Flatpak 应用或通过终端使用来自第三方仓库的 Flatpak 参考文件时，你也可能会遇到这个错误。

一些用户在 Linux 上使用他们组织推荐的 VPN 服务工作时注意到这个问题。

那么，如何解决这个问题呢？为什么这是一个问题？

嗯，从技术上讲，这是两件事中的一个：

  * 你的系统不接受该证书（并说它是无效的）。
  * 该证书与用户连接的域不匹配。

如果是第二种情况，你得联系网站的管理员，从他们那里解决这个问题。

但是，如果是第一种情况，你有几种方法来处理它。

### 1、在使用 Flatpak 或添加 GNOME 在线账户时修复 “Unacceptable TLS certificate”

如果你试图添加 Flathub 远程或一个新的 Flatpak 应用，并在终端中注意到这个错误，你可以简单地输入：

```
sudo apt install --reinstall ca-certificates
```

这应该会重新安装受信任的 CA 证书，以防止列表中出现某种问题。

![][3]

在我的例子中，当试图添加 Flathub 仓库时，我遇到了错误，通过在终端输入上述命令解决了这个问题。

所以，我认为任何与 Flatpak 有关的 TLS 证书问题都可以用这个方法解决。

### 2、在使用工作 VPN 时修复 “Unacceptable TLS certificate”

如果你使用你的组织的 VPN 来访问与工作有关的材料，你可能要把证书添加到你的 Linux 发行版中的可信 CA 列表中。

请注意，你需要 VPN 服务或你组织的管理员分享根证书的 .CRT 版本，才能开始使用。

接下来，你需要进入 `/usr/local/share/ca-certificates` 目录。

你可以下面创建一个目录，并使用任何名称来标识你组织的证书。然后，将 .CRT 文件添加到该目录。

例如，它是 `/usr/local/share/ca-certificates/organization/xyz.crt`。

请注意，你需要有 root 权限来添加证书或在 `ca-certificates` 目录下创建目录。

当你添加了必要的证书，你所要做的就是输入以下命令更新证书支持列表：

```
sudo update-ca-certificates
```

而且，每当你试图连接到你公司的 VPN 时，你的系统应将该证书视为有效。

### 总结

不可接受的 TLS 证书并不是一个常见的错误，但你可以在各种使用情况下发现它，比如连接到 GNOME 在线账户。

如果上述两种方法都不能解决这个错误，那么你所连接的域/服务有可能存在配置错误。在这种情况下，你将不得不联系他们来解决这个问题。

你是否遇到过这个错误？你是如何解决的？你是否知道这个问题的其他解决方案（有可能是容易操作的）？请在下面的评论中告诉我你的想法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/unacceptable-tls-certificate-error-linux/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/02/unacceptable-tls-certificate.png?resize=800%2C450&ssl=1
[2]: https://itsfoss.com/flatpak-guide/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/02/tls-certificate-troubleshoot.png?resize=800%2C506&ssl=1
