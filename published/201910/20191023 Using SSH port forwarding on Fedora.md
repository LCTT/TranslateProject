[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11515-1.html)
[#]: subject: (Using SSH port forwarding on Fedora)
[#]: via: (https://fedoramagazine.org/using-ssh-port-forwarding-on-fedora/)
[#]: author: (Paul W. Frields https://fedoramagazine.org/author/pfrields/)

在 Fedora 上使用 SSH 端口转发
======

![](https://img.linux.net.cn/data/attachment/album/201910/29/123804dql3aqqlghza9txt.jpg)

你可能已经熟悉使用 [ssh 命令][2]访问远程系统。`ssh` 命令背后所使用的协议允许终端的输入和输出流经[安全通道][3]。但是你知道也可以使用 `ssh` 来安全地发送和接收其他数据吗？一种方法是使用“<ruby>端口转发<rt>port forwarding</rt></ruby>”，它允许你在进行 `ssh` 会话时安全地连接网络端口。本文向你展示了它是如何工作的。

### 关于端口

标准 Linux 系统已分配了一组网络端口，范围是 0 - 65535。系统会保留 0 - 1023 的端口以供系统使用。在许多系统中，你不能选择使用这些低端口号。通常有几个端口用于运行特定的服务。你可以在系统的  `/etc/services` 文件中找到这些定义。

你可以认为网络端口是类似的物理端口或可以连接到电缆的插孔。端口可以连接到系统上的某种服务，类似物理插孔后面的接线。一个例子是 Apache Web 服务器（也称为 `httpd`）。对于 HTTP 非安全连接，Web 服务器通常要求在主机系统上使用端口 80，对于 HTTPS 安全连接通常要求使用 443。

当你连接到远程系统（例如，使用 Web 浏览器）时，你是将浏览器“连接”到你的主机上的端口。这通常是一个随机的高端口号，例如 54001。你的主机上的端口连接到远程主机上的端口（例如 443）来访问其安全的 Web 服务器。

那么，当你有这么多可用端口时，为什么还要使用端口转发呢？这是 Web 开发人员生活中的几种常见情况。

### 本地端口转发

想象一下，你正在名为 `remote.example.com` 的远程系统上进行 Web 开发。通常，你是通过 `ssh` 进入此系统的，但是它位于防火墙后面，而且该防火墙很少允许其他类型的访问，并且会阻塞大多数其他端口。要尝试你的网络应用，能够使用浏览器访问远程系统会很有帮助。但是，由于使用了讨厌的防火墙，你无法通过在浏览器中输入 URL 的常规方法来访问它。

本地转发使你可以通过 `ssh` 连接来建立可通过远程系统访问的端口。该端口在系统上显示为本地端口（因而称为“本地转发”）。

假设你的网络应用在 `remote.example.com` 的 8000 端口上运行。要将那个系统的 8000 端口本地转发到你系统上的 8000 端口，请在开始会话时将 `-L` 选项与 `ssh` 结合使用：

```
$ ssh -L 8000:localhost:8000 remote.example.com
```

等等，为什么我们使用 `localhost` 作为转发目标？这是因为从 `remote.example.com` 的角度来看，你是在要求主机使用其自己的端口 8000。（回想一下，任何主机通常可以通过网络连接 `localhost` 而连接到自身。）现在那个端口连接到你系统的 8000 端口了。`ssh` 会话准备就绪后，将其保持打开状态，然后可以在浏览器中键入 `http://localhost:8000` 来查看你的 Web 应用。现在，系统之间的流量可以通过 `ssh` 隧道安全地传输！

如果你有敏锐的眼睛，你可能已经注意到了一些东西。如果我们要 `remote.example.com` 转发到与 `localhost` 不同的主机名怎么办？如果它可以访问该网络上另一个系统上的端口，那么通常可以同样轻松地转发该端口。例如，假设你想访问也在该远程网络中的 `db.example.com` 的 MariaDB 或 MySQL 服务。该服务通常在端口 3306 上运行。因此，即使你无法 `ssh` 到实际的 `db.example.com` 主机，你也可以使用此命令将其转发：

```
$ ssh -L 3306:db.example.com:3306 remote.example.com
```

现在，你可以在 `localhost` 上运行 MariaDB 命令，而实际上是在使用 `db.example.com` 主机。

### 远程端口转发

远程转发让你可以进行相反操作。想象一下，你正在为办公室的朋友设计一个 Web 应用，并想向他们展示你的工作。不过，不幸的是，你在咖啡店里工作，并且由于网络设置，他们无法通过网络连接访问你的笔记本电脑。但是，你同时使用着办公室的 `remote.example.com` 系统，并且仍然可在这里登录。你的 Web 应用似乎在本地 5000 端口上运行良好。

远程端口转发使你可以通过 `ssh` 连接从本地系统建立端口的隧道，并使该端口在远程系统上可用。在开始 `ssh` 会话时，只需使用 `-R` 选项：

```
$ ssh -R 6000:localhost:5000 remote.example.com
```

现在，当在公司防火墙内的朋友打开浏览器时，他们可以进入 `http://remote.example.com:6000` 查看你的工作。就像在本地端口转发示例中一样，通信通过 `ssh` 会话安全地进行。

默认情况下，`sshd` 守护进程运行在设置的主机上，因此**只有**该主机可以连接它的远程转发端口。假设你的朋友希望能够让其他 `example.com` 公司主机上的人看到你的工作，而他们不在 `remote.example.com` 上。你需要让 `remote.example.com` 主机的所有者将以下选项**之一**添加到 `/etc/ssh/sshd_config` 中：

```
GatewayPorts yes       # 或
GatewayPorts clientspecified
```

第一个选项意味着 `remote.example.com` 上的所有网络接口都可以使用远程转发的端口。第二个意味着建立隧道的客户端可以选择地址。默认情况下，此选项设置为 `no`。

使用此选项，你作为 `ssh` 客户端仍必须指定可以共享你这边转发端口的接口。通过在本地端口之前添加网络地址范围来进行此操作。有几种方法可以做到，包括：

```
$ ssh -R *:6000:localhost:5000                   # 所有网络
$ ssh -R 0.0.0.0:6000:localhost:5000             # 所有网络
$ ssh -R 192.168.1.15:6000:localhost:5000        # 单个网络
$ ssh -R remote.example.com:6000:localhost:5000  # 单个网络
```

### 其他注意事项

请注意，本地和远程系统上的端口号不必相同。实际上，有时你甚至可能无法使用相同的端口。例如，普通用户可能不会在默认设置中转发到系统端口。

另外，可以限制主机上的转发。如果你需要在联网主机上更严格的安全性，那么这你来说可能很重要。 `sshd` 守护程进程的 `PermitOpen` 选项控制是否以及哪些端口可用于 TCP 转发。默认设置为 `any`，这让上面的所有示例都能正常工作。要禁止任何端口转发，请选择 `none`，或仅允许的特定的“主机:端口”。有关更多信息，请在手册页中搜索 `PermitOpen` 来配置 `sshd` 守护进程：

```
$ man sshd_config
```

最后，请记住，只有在 `ssh` 会话处于打开状态时才会端口转发。如果需要长时间保持转发活动，请尝试使用 `-N` 选项在后台运行会话。确保控制台已锁定，以防止在你离开控制台时其被篡夺。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/using-ssh-port-forwarding-on-fedora/

作者：[Paul W. Frields][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/pfrields/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/10/ssh-port-forwarding-816x345.jpg
[2]: https://en.wikipedia.org/wiki/Secure_Shell
[3]: https://fedoramagazine.org/open-source-ssh-clients/
