（再次）在 Ubuntu 16.04 上配置 MSMTP
======
这篇文章是在我之前的博客中发表过的在 Ubuntu 16.04 上配置 MSMTP 的一个副本。我再次发表是为了后续，我并不知道它是否能在更高版本上工作。由于我没有再托管自己的 Ubuntu/MSMTP 服务器了，所以我现在看不到有更新的，但是如果我需要重新设置，我会创建一个更新的帖子！无论如何，这是我现有的。

我之前写了一篇在 Ubuntu 12.04 上配置 msmtp 的文章，但是正如我在之前的文章中暗示的那样，当我升级到 Ubuntu 16.04 后出现了一些问题。接下来的内容基本上是一样的，但 16.04 有一些小的更新。和以前一样，这里假定你使用 Apache 作为 Web 服务器，但是我相信如果你选择其他的 Web 服务器，也应该相差不多。

我使用 [msmtp][1] 发送来自这个博客的邮件俩通知我评论和更新等。这里我会记录如何配置它通过 Google Apps 帐户发送电子邮件，虽然这应该与标准帐户一样。

首先，我们需要安装 3 个软件包：
`sudo apt-get install msmtp msmtp-mta ca-certificates`
安装完成后，就需要一个默认配置。默认情况下，msmtp 会在 `/etc/msmtprc` 中查找，所以我使用 vim 创建了这个文件，尽管任何文本编辑器都可以做到这一点。这个文件看起来像这样：
```
# Set defaults.
defaults
# Enable or disable TLS/SSL encryption.
tls on
tls_starttls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt
# Setup WP account's settings.
account
host smtp.gmail.com
port 587
auth login
user
password
from
logfile /var/log/msmtp/msmtp.log

account default :

```

任何大写项（即``）都是需要替换为你特定的配置。日志文件是一个例外，当然你也可以将活动/警告/错误放在任何你想要的地方。

文件保存后，我们将更新上述配置文件的权限 ，如果该文件的权限过于开放，msmtp 将不会运行，并且创建日志文件的目录。
```
sudo mkdir /var/log/msmtp
sudo chown -R www-data:adm /var/log/msmtp
sudo chmod 0600 /etc/msmtprc

```

接下来，我选择为 msmtp 日志配置 logrotate，以确保日志文件不会太大并让日志目录更加整洁。为此，我们创建 `/etc/logrotate.d/msmtp` 并使用按以下内容配置。请注意，这是可选的，你可以选择不这样做，或者你可以选择以不同方式配置日志。
```
/var/log/msmtp/*.log {
rotate 12
monthly
compress
missingok
notifempty
}

```

现在配置了日志，我们需要通过编辑 `/etc/php/7.0/apache2/php.ini` 告诉 PHP 使用 msmtp，并将 sendmail 路径从
`sendmail_path =`
变成
`sendmail_path = "/usr/bin/msmtp -C /etc/msmtprc -a -t"`
这里我遇到了一个问题，即使我指定了帐户名称，但是当我测试它时，它并没有正确发送电子邮件。这就是为什么  `account default : ` 这行被放在 msmtp 配置文件的末尾。要测试配置，请确保 PHP 文件已保存并运行 `sudo service apache2 restart`，然后运行 `php -a` 并执行以下命令
```
mail ('personal@email.com', 'Test Subject', 'Test body text');
exit();

```

此时发生的任何错误都将显示在输出中，因此错误诊断会相对容易。如果一切顺利，你现在应该可以使用 PHP sendmail（至少 WordPress 可以）中用 Gmail（或 Google Apps）从 Ubuntu 服务器发送电子邮件。

我没有说这是最安全的配置，所以当你看到并且意识要这个非常不安全，或者有其他严重的错误，请让我知道，我会相应地更新。


--------------------------------------------------------------------------------

via: https://codingproductivity.wordpress.com/2018/01/18/configuring-msmtp-on-ubuntu-16-04-again/

作者：[JOE][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://codingproductivity.wordpress.com/author/joeb454/
[1]:http://msmtp.sourceforge.net/
