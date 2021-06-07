[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11181-1.html)
[#]: subject: (Manage your passwords with Bitwarden and Podman)
[#]: via: (https://fedoramagazine.org/manage-your-passwords-with-bitwarden-and-podman/)
[#]: author: (Eric Gustavsson https://fedoramagazine.org/author/egustavs/)

使用 Bitwarden 和 Podman 管理你的密码
======

![][1]

在过去的一年中，你可能会遇到一些试图向你推销密码管理器的广告。比如 [LastPass][2]、[1Password][3] 或 [Dashlane][4]。密码管理器消除了记住所有网站密码的负担。你不再需要使用重复或容易记住的密码。相反，你只需要记住一个可以解锁所有其他密码的密码。

通过使用一个强密码而​​不是许多弱密码，这可以使你更安全。如果你有基于云的密码管理器（例如 LastPass、1Password 或 Dashlane），你还可以跨设备同步密码。不幸的是，这些产品都不是开源的。幸运的是，还有其他开源替代品。

### 开源密码管理器

替代方案包括 Bitwarden、[LessPass][5] 或 [KeePass][6]。Bitwarden 是一款[开源密码管理器][7]，它会将所有密码加密存储在服务器上，它的工作方式与 LastPass、1Password 或 Dashlane 相同。LessPass 有点不同，因为它专注于成为无状态密码管理器。这意味着它根据主密码、网站和用户名生成密码，而不是保存加密的密码。另一方面，KeePass 是一个基于文件的密码管理器，它的插件和应用具有很大的灵活性。

这三个应用中的每一个都有其自身的缺点。Bitwarden 将所有东西保存在一个地方，并通过其 API 和网站接口暴露给网络。LessPass 无法保存自定义密码，因为它是无状态的，因此你需要使用它生成的密码。KeePass 是一个基于文件的密码管理器，因此无法在设备之间轻松同步。你可以使用云存储和 [WebDAV][8] 来解决此问题，但是有许多客户端不支持它，如果设备无法正确同步，你可能会遇到文件冲突。

本文重点介绍 Bitwarden。

### 运行非官方的 Bitwarden 实现

有一个名为 [bitwarden_rs][9] 的服务器及其 API 的社区实现。这个实现是完全开源的，因为它可以使用 SQLite 或 MariaDB/MySQL，而不是官方服务器使用的专有 Microsoft SQL Server。

有一点重要的是要认识到官方和非官方版本之间存在一些差异。例如，[官方服务器已经由第三方审核][10]，而非官方服务器还没有。在实现方面，非官方版本缺少[电子邮件确认和采用 Duo 或邮件码的双因素身份验证][11]。

让我们在 SELinux 中运行服务器。根据 bitwarden_rs 的文档，你可以如下构建一个 Podman 命令：

```
$ podman run -d \
 --userns=keep-id \
 --name bitwarden \
 -e SIGNUPS_ALLOWED=false \
 -e ROCKET_PORT=8080 \
 -v /home/egustavs/Bitwarden/bw-data/:/data/:Z \
 -p 8080:8080 \
 bitwardenrs/server:latest
```

这将下载 bitwarden_rs 镜像并在用户命名空间下的用户容器中运行它。它使用 1024 以上的端口，以便非 root 用户可以绑定它。它还使用 `:Z` 更改卷的 SELinux 上下文，以防止在 `/data` 中的读写权限问题。

如果你在某个域下托管它，建议将此服务器放在 Apache 或 Nginx 的反向代理下。这样，你可以使用 80 和 443 端口指向容器的 8080 端口，而无需以 root 身份运行容器。

### 在 systemd 下运行

Bitwarden 现在运行了，你可能希望保持这种状态。接下来，创建一个使容器保持运行的单元文件，如果它没有响应则自动重新启动，并在系统重启后开始运行。创建文件 `/etc/systemd/system/bitwarden.service`：

```
[Unit]
Description=Bitwarden Podman container
Wants=syslog.service

[Service]
User=egustavs
Group=egustavs
TimeoutStartSec=0
ExecStart=/usr/bin/podman run 'bitwarden'
ExecStop=-/usr/bin/podman stop -t 10 'bitwarden'
Restart=always
RestartSec=30s
KillMode=none

[Install]
WantedBy=multi-user.target
```

现在使用 [sudo][12] 启用并启动该服务：

```
$ sudo systemctl enable bitwarden.service && sudo systemctl start bitwarden.service
$ systemctl status bitwarden.service
bitwarden.service - Bitwarden Podman container
    Loaded: loaded (/etc/systemd/system/bitwarden.service; enabled; vendor preset: disabled)
    Active: active (running) since Tue 2019-07-09 20:23:16 UTC; 1 day 14h ago
  Main PID: 14861 (podman)
     Tasks: 44 (limit: 4696)
    Memory: 463.4M
```

成功了！Bitwarden 现在运行了并将继续运行。

### 添加 LetsEncrypt

如果你有域名，强烈建议你使用类似 LetsEncrypt 的加密证书运行你的 Bitwarden 实例。Certbot 是一个为我们创建 LetsEncrypt 证书的机器人，这里有个[在 Fedora 中操作的指南][13]。

生成证书后，你可以按照 [bitwarden_rs 指南中关于 HTTPS 的部分来][14]。只要记得将 `:Z` 附加到 LetsEncrypt 来处理权限，而不用更改端口。

* * *

照片由 [CMDR Shane][15] 拍摄，发表在 [Unsplash][16] 上。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/manage-your-passwords-with-bitwarden-and-podman/

作者：[Eric Gustavsson][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/egustavs/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/07/bitwarden-816x345.jpg
[2]: https://www.lastpass.com
[3]: https://1password.com/
[4]: https://www.dashlane.com/
[5]: https://lesspass.com/
[6]: https://keepass.info/
[7]: https://bitwarden.com/
[8]: https://en.wikipedia.org/wiki/WebDAV
[9]: https://github.com/dani-garcia/bitwarden_rs/
[10]: https://blog.bitwarden.com/bitwarden-completes-third-party-security-audit-c1cc81b6d33
[11]: https://github.com/dani-garcia/bitwarden_rs/wiki#missing-features
[12]: https://fedoramagazine.org/howto-use-sudo/
[13]: https://certbot.eff.org/instructions
[14]: https://github.com/dani-garcia/bitwarden_rs/wiki/Enabling-HTTPS
[15]: https://unsplash.com/@cmdrshane?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[16]: https://unsplash.com/search/photos/password?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
