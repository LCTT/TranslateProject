在 Ubuntu 和 Debian 上启用双因子身份验证的三种备选方案
=====

> 如何为你的 SSH 服务器安装三种不同的双因子身份验证方案。

如今，安全比以往更加重要，保护 SSH 服务器是作为系统管理员可以做的最为重要的事情之一。传统地，这意味着禁用密码身份验证而改用 SSH 密钥。无疑这是你首先应该做的，但这并不意味着 SSH 无法变得更加安全。

双因子身份验证就是指需要两种身份验证才能登录。可以是密码和 SSH 密钥，也可以是密钥和第三方服务，比如 Google。这意味着单个验证方法的泄露不会危及服务器。

以下指南是为 SSH 启用双因子验证的三种方式。

当你修改 SSH 配置时，总是要确保有一个连接到服务器的第二终端。第二终端意味着你可以修复你在 SSH 配置中犯的任何错误。打开的终端将一直保持，即便 SSH 服务重启。

### SSH 密钥和密码

SSH 支持对登录要求不止一个身份验证方法。

在 `/etc/sh/sshd_config` 中的 SSH 服务器配置文件中的 `AuthenticationMethods` 选项中设置了身份验证方法。

当在 `/etc/ssh/sshd_config` 中添加下一行时，SSH 需要提交一个 SSH 密钥，然后提示输入密码: 

```
AuthenticationMethods "publickey,password"
```

如果你想要根据使用情况设置这些方法，那么请使用以下附加配置:

```
Match User jsmith
    AuthenticationMethods "publickey,password"
```

当你已经编辑或保存了新的 `sshd_config` 文件，你应该通过运行以下程序来确保你没有犯任何错误：

```
sshd -t
```

任何导致 SSH 不能启动的语法或其他错误都将在这里标记出来。当 `ssh-t` 运行时没有错误，使用 `systemctl` 重新启动 SSH：

```
systemctl restart sshd
```

现在，你可以使用新终端登录，以核实你会被提示输入密码并需要 SSH 密钥。如果你用 `ssh-v`，例如：

```
ssh -v jsmith@example.com
```

你将可以看到登录的每一步。

注意，如果你确实将密码设置成必需的身份验证方法，你要确保将 `PasswordAuthentication` 选项设置成 `yes`。

### 使用 Google Authenticator 的 SSH

Google 在 Google 自己的产品上使用的双因子身份验证系统可以集成到你的 SSH 服务器中。如果你已经使用了Google Authenticator，那么此方法将非常方便。

虽然 libpam-google-authenticator 是由 Google 编写的，但它是[开源][1]的。此外，Google Authenticator 是由 Google 编写的，但并不需要 Google 帐户才能工作。多亏了 [Sitaram Chamarty][2] 的贡献。

如果你还没有在手机上安装和配置 Google Authenticator，请参阅 [这里][3]的说明。

首先，我们需要在服务器上安装 Google Authenticatior 安装包。以下命令将更新你的系统并安装所需的软件包：

```
apt-get update
apt-get upgrade
apt-get install libpam-google-authenticator
```

现在，我们需要在你的手机上使用 Google Authenticatior APP 注册服务器。这是通过首先运行我们刚刚安装的程序完成的:

```
google-authenticator
```

运行这个程序时，会问到几个问题。你应该以适合你的设置的方式回答，然而，最安全的选项是对每个问题回答 `y`。如果以后需要更改这些选项，您可以简单地重新运行 `google-authenticator` 并选择不同的选项。

当你运行 `google-authenticator` 时，一个二维码会被打印到终端上，有些代码看起来像这样:

```
Your new secret key is: VMFY27TYDFRDNKFY
Your verification code is 259652
Your emergency scratch codes are:
  96915246
  70222983
  31822707
  25181286
  28919992
```

你应该将所有这些代码记录到一个像密码管理器一样安全的位置。“scratch codes” 是单一的使用代码，即使你的手机不可用，它总是允许你访问。

要将服务器注册到 Authenticator APP 中，只需打开应用程序并点击右下角的红色加号即可。然后选择扫描条码选项，扫描打印到终端的二维码。你的服务器和应用程序现在连接。

回到服务器上，我们现在需要编辑用于 SSH 的 PAM (可插入身份验证模块)，以便它使用我们刚刚安装的身份验证器安装包。PAM 是独立系统，负责 Linux 服务器上的大多数身份验证。

需要修改的 SSH PAM 文件位于 `/etc/pam.d/sshd` ，用以下命令编辑:

```
nano /etc/pam.d/sshd
```
 
在文件顶部添加以下行:

```
auth required pam_google_authenticator.so
```

此外，我们还需要注释掉一行，这样 PAM 就不会提示输入密码。改变这行：

```
# Standard Un*x authentication.
@include common-auth
```

为如下：

```
# Standard Un*x authentication.
# @include common-auth
``` 

接下来，我们需要编辑 SSH 服务器配置文件：

```
nano /etc/ssh/sshd_config
```

改变这一行：

```
ChallengeResponseAuthentication no
```

为：

```
ChallengeResponseAuthentication yes
```
 
接下来，添加以下代码行来启用两个身份验证方案：SSH 密钥和谷歌认证器（键盘交互）：

```
AuthenticationMethods "publickey,keyboard-interactive"
```
 
在重新加载 SSH 服务器之前，最好检查一下在配置中没有出现任何错误。执行以下命令：

```
sshd -t
```

如果没有标识出任何错误，用新的配置重载 SSH：

```
systemctl reload sshd.service
```
 
现在一切都应该开始工作了。现在，当你登录到你的服务器时，你将需要使用 SSH 密钥，并且当你被提示输入：

```
Verification code:
```

打开 Authenticator APP 并输入为您的服务器显示的 6 位代码。

### Authy

[Authy][4] 是一个双重身份验证服务，与 Google 一样，它提供基于时间的代码。然而，Authy 不需要手机，因为它提供桌面和平板客户端。它们还支持离线身份验证，不需要 Google 帐户。

你需要从应用程序商店安装 Authy 应用程序，或 Authy [下载页面][5]所链接的桌面客户端。

安装完应用程序后，需要在服务器上使用 API 密钥。这个过程需要几个步骤:

1. 在[这里][6]注册一个账户。
2. 向下滚动到 “Authy” 部分。
3. 在帐户上启用双因子认证（2FA）。
4. 回 “Authy” 部分。
5. 为你的服务器创建一个新的应用程序。
6. 从新应用程序的 “General Settings” 页面顶部获取 API 密钥。你需要 “PRODUCTION API KEY”旁边的眼睛符号来显示密钥。如图：

![](https://bash-prompt.net/images/guides/2FA/twilio-authy-api.png)

在某个安全的地方记下 API 密钥。

现在，回到服务器，以 root 身份运行以下命令：

```
curl -O 'https://raw.githubusercontent.com/authy/authy-ssh/master/authy-ssh'
bash authy-ssh install /usr/local/bin
```
 
当提示时输入 API 键。如果输入错误，你始终可以编辑 `/usr/local/bin/authy-ssh` 再添加一次。

Authy 现已安装。但是，在为用户启用它之前，它不会开始工作。启用 Authy 的命令有以下形式：

```
/usr/local/bin/authy-ssh enable <system-user> <your-email> <your-phone-country-code> <your-phone-number>
```
 
root 登录的一些示例细节：

```
/usr/local/bin/authy-ssh enable root john@example.com 44 20822536476
```
 
如果一切顺利，你会看到：

```
User was registered
```

现在可以通过运行以下命令来测试 Authy：

```
authy-ssh test
```

最后，重载 SSH 实现新的配置：

```
systemctl reload sshd.service
```
 
Authy 现在正在工作，SSH 需要它才能登录。

现在，当你登录时，你将看到以下提示:

```
Authy Token (type 'sms' to request a SMS token):
```
 
你可以输入手机或桌面客户端的 Authy APP 上的代码。或者你可以输入 `sms`， Authy 会给你发送一条带有登录码的短信。

可以通过运行以下命令卸载 Authy：

```
/usr/local/bin/authy-ssh uninstall
```

--------------------------------------------------------------------------------

via: https://bash-prompt.net/guides/ssh-2fa/

作者：[Elliot Cooper][a]
译者：[cielllll](https://github.com/cielllll)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://bash-prompt.net
[1]:https://github.com/google/google-authenticator-libpam
[2]:https://plus.google.com/115609618223925128756
[3]:https://support.google.com/accounts/answer/1066447?hl=en
[4]:https://authy.com/
[5]:https://authy.com/download/
[6]:https://www.authy.com/signup
[7]:/images/guides/2FA/twilio-authy-api.png

