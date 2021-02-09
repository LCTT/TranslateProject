[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12504-1.html)
[#]: subject: (Bypass your Linux firewall with SSH over HTTP)
[#]: via: (https://opensource.com/article/20/7/linux-shellhub)
[#]: author: (Domarys https://opensource.com/users/domarys)

借助 HTTP 通过 SSH 绕过 Linux 防火墙
======

> 需要远程工作的看一下。使用这个有用的开源解决方案，从任何地方快速地连接和访问你的所有设备。

![](https://img.linux.net.cn/data/attachment/album/202008/10/231746xs4363yc03cptzbc.jpg)

随着对连接和远程工作的需求的增长，访问远程计算资源变得越来越重要。但是，提供对设备和硬件的外部访问的要求使此任务变得复杂而有风险。旨在减少此类麻烦的 [ShellHub][2] 是一个云服务器，允许从任何外部网络常规访问这些设备。

ShellHub 是一个 Apache 2.0 许可的开源解决方案，它可满足所有这些需求，并允许用户通过一个帐户连接和管理多个设备。它的开发是为了方便开发者和程序员的工作，使得任何硬件架构的 Linux 设备的远程访问成为可能。

仔细观察，ShellHub 方案使用 HTTP 传输层来封装 SSH 协议。这种传输层的选择可以在大多数网络上无缝使用，因为大多数公司的防火墙规则和策略通常都可以使用并接受它。

下面这些示例使用 2020 年 6 月 10 日发布的 ShellHub 版本 0.3.2。

### 使用 ShellHub

要访问该平台，只需进入 [shellhub.io][3] 并注册一个自己的帐户。你的注册数据将帮助开发团队了解用户资料并提供有关如何改进平台的更多信息。

![ShellHub registration form][4]

*图 1：[shellhub.io][5] 中的注册表格*

ShellHub 有直观、简洁的界面，这让所有的信息和功能都能以最快的方式呈现。注册后，你会看到一块仪表板，这时可以注册你的第一台设备。

### 添加设备

要启用通过 ShellHub 连接设备，你需要生成一个标识符，它用于在设备连接到服务器时对你的设备进行身份验证。

此标识必须配置在代理（ShellHub 客户端）内部，该代理必须与镜像一起保存在设备中，或者必须添加为 Docker 容器。

ShellHub 默认使用 Docker 运行代理，这非常方便，因为它在现有系统上提供了一种无痛的添加方式，支持 Docker 是唯一的要求。要添加设备，你需要粘贴命令行，它显示在 ShellHub Cloud 的对话框中（请参见图 2）。

![Figure 2: Adding a device to the ShellHub Cloud][6]

*图 2：将设备添加到 ShellHub Cloud*

设备默认使用它的 MAC 地址作为其主机名。在内部，该设备由其密钥标识，这是在设备注册期间生成的，用于与服务器进行身份验证。

### 访问设备

要访问你的设备，只需进入仪表板中的“查看所有设备”，或单击左侧菜单上的“设备”。这将列出你所有已注册的设备。

设备状态可在页面上轻松看到。在线设备旁边会显示一个绿色图标，可以单击终端图标进行连接。你接着输入密码，最后单击”连接“按钮，请参见（图 3）。

![Figure 3: Accessing a device using the terminal on the web][7]

*图 3：使用网络上的终端访问设备*

另一种访问设备的方法是从类似 [PuTTY][8]、[Termius][9] 之类的 SSH 客户端，甚至 Linux 终端访问。我们可以使用称为 SSHID 的 ShellHub 标识作为连接的目的地址（例如 `ssh username@SSHID`）。图 4 说明了如何使用在终端中使用 Linux SSH 客户端连接到我们的计算机。

![Figure 4: Connecting to a device using the Linux terminal][11]

*图 4：使用 Linux 终端连接到设备*

无论你何时登录 ShellHub Cloud 平台，你都可以访问仪表板上的所有已注册设备，这样你可以随时随地访问它们。ShellHub 通过一个开源平台，以透明的方式为您与远程机器保持通信安全的过程增加了简单性。

在 [GitHub][2] 上加入 ShellHub 社区，或随时通过 [Gitter][12] 或通过电子邮件 [contato@ossystems.com.br][13] 向开发团队发送你的建议或反馈。我们很乐意收到社区成员的贡献！

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/linux-shellhub

作者：[Domarys][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/domarys
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/terminal_command_linux_desktop_code.jpg?itok=p5sQ6ODE (Terminal command prompt on orange background)
[2]: https://github.com/shellhub-io/shellhub
[3]: https://www.shellhub.io/
[4]: https://opensource.com/sites/default/files/uploads/shellhub_registration_form_0.png (ShellHub registration form)
[5]: https://opensource.com/article/20/7/www.shellhub.io
[6]: https://opensource.com/sites/default/files/figure2.gif
[7]: https://opensource.com/sites/default/files/figure3.gif
[8]: https://www.putty.org/
[9]: https://termius.com/
[10]: mailto:username@SSHID
[11]: https://opensource.com/sites/default/files/figure4.gif
[12]: https://gitter.im/shellhub-io/community?at=5e39ad8b3aca1e4c5f633e8f
[13]: mailto:contato@ossystems.com.br
