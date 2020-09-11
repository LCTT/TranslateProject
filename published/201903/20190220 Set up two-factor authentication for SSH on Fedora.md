[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10646-1.html)
[#]: subject: (Set up two-factor authentication for SSH on Fedora)
[#]: via: (https://fedoramagazine.org/two-factor-authentication-ssh-fedora/)
[#]: author: (Curt Warfield https://fedoramagazine.org/author/rcurtiswarfield/)

在 Fedora 上为 SSH 设置双因子验证
======

![](https://fedoramagazine.org/wp-content/uploads/2019/02/twofactor-auth-ssh-816x345.png)

每天似乎都有一个安全漏洞的新闻报道，说我们的数据会因此而存在风险。尽管 SSH 是一种远程连接系统的安全方式，但你仍然可以使它更安全。本文将向你展示如何做到这一点。

此时<ruby>双因子验证<rt>two-factor authentication</rt></ruby>（2FA）就有用武之地了。即使你禁用密码并只允许使用公钥和私钥进行 SSH 连接，但如果未经授权的用户偷窃了你的密钥，他仍然可以借此访问系统。

使用双因子验证，你不能仅仅使用 SSH 密钥连接到服务器，你还需要提供手机上的验证器应用程序随机生成的数字。

本文展示的方法是<ruby>基于时间的一次性密码<rt>Time-based One-time Password</rt></ruby>（TOTP）算法。[Google Authenticator][1] 用作服务器应用程序。默认情况下，Google Authenticator 在 Fedora 中是可用的。

至于手机，你可以使用与 TOTP 兼容的任何可以双路验证的应用程序。Andorid 或 iOS 有许多可以与 TOTP 和 Google Authenticator 配合使用的免费应用程序。本文与 [FreeOTP][2] 为例。

### 安装并设置 Google Authenticator

首先，在你的服务器上安装 Google Authenticator。
```
$ sudo dnf install -y google-authenticator
```

运行应用程序：

```
$ google-authenticator
```

该应用程序提供了一系列问题。下面的片段展示了如何进行合理的安全设置：

```
Do you want authentication tokens to be time-based (y/n) y
Do you want me to update your "/home/user/.google_authenticator" file (y/n)? y
```

这个应用程序为你提供一个密钥、验证码和恢复码。把它们放在安全的地方。如果你丢失了手机，恢复码是访问服务器的**唯一**方式。

### 设置手机验证

在你的手机上安装验证器应用程序（FreeOTP）。如果你有一台安卓手机，那么你可以在 Google Play 中找到它，也可以在苹果 iPhone 的 iTunes 商店中找到它。

Google Authenticator 会在屏幕上显示一个二维码。打开手机上的 FreeOTP 应用程序，选择添加新账户，在应用程序顶部选择二维码形状工具，然后扫描二维码即可。设置完成后，在每次远程连接服务器时，你必须提供验证器应用程序生成的随机数。

### 完成配置

应用程序会向你询问更多的问题。下面示例展示了如何设置合理的安全配置。

```
Do you want to disallow multiple uses of the same authentication token? This restricts you to one login about every 30s, but it increases your chances to notice or even prevent man-in-the-middle attacks (y/n) y
By default, tokens are good for 30 seconds. In order to compensate for possible time-skew between the client and the server, we allow an extra token before and after the current time. If you experience problems with poor time synchronization, you can increase the window from its default size of +-1min (window size of 3) to about +-4min (window size of 17 acceptable tokens).
Do you want to do so? (y/n) n
If the computer that you are logging into isn't hardened against brute-force login attempts, you can enable rate-limiting for the authentication module. By default, this limits attackers to no more than 3 login attempts every 30s.
Do you want to enable rate-limiting (y/n) y
```

现在，你必须设置 SSH 来利用新的双路验证。

### 配置 SSH

在完成此步骤之前，**确保你已使用公钥建立了一个可用的 SSH 连接**，因为我们将禁用密码连接。如果出现问题或错误，一个已经建立的连接将允许你修复问题。

在你的服务器上，使用 [sudo][3] 编辑 `/etc/pam.d/sshd` 文件。

```
$ sudo vi /etc/pam.d/ssh
```

注释掉 `auth substack password-auth` 这一行：

```
#auth       substack     password-auth
```

将以下行添加到文件底部：

```
auth sufficient pam_google_authenticator.so
```

保存并关闭文件。然后编辑 `/etc/ssh/sshd_config` 文件：

```
$ sudo vi /etc/ssh/sshd_config
```

找到 `ChallengeResponseAuthentication` 这一行并将其更改为 `yes`：

```
ChallengeResponseAuthentication yes
```

找到 `PasswordAuthentication` 这一行并将其更改为 `no`：

```
PasswordAuthentication no
```

将以下行添加到文件底部：

```
AuthenticationMethods publickey,password publickey,keyboard-interactive
```

保存并关闭文件，然后重新启动 SSH：

```
$ sudo systemctl restart sshd
```

### 测试双因子验证

当你尝试连接到服务器时，系统会提示你输入验证码：

```
[user@client ~]$ ssh user@example.com
Verification code:
```

验证码由你手机上的验证器应用程序随机生成。由于这个数字每隔几秒就会发生变化，因此你需要在它变化之前输入它。

![][4]

如果你不输入验证码，你将无法访问系统，你会收到一个权限被拒绝的错误：

```
[user@client ~]$ ssh user@example.com
Verification code:
Verification code:
Verification code:
Permission denied (keyboard-interactive).
[user@client ~]$
```

### 结论

通过添加这种简单的双路验证，现在未经授权的用户访问你的服务器将变得更加困难。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/two-factor-authentication-ssh-fedora/

作者：[Curt Warfield][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/rcurtiswarfield/
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Google_Authenticator
[2]: https://freeotp.github.io/
[3]: https://fedoramagazine.org/howto-use-sudo/
[4]: https://fedoramagazine.org/wp-content/uploads/2019/02/freeotp-1.png
