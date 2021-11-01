[#]: subject: "Rotate and archive logs with the Linux logrotate command"
[#]: via: "https://opensource.com/article/21/10/linux-logrotate"
[#]: author: "Ayush Sharma https://opensource.com/users/ayushsharma"
[#]: collector: "lujun9972"
[#]: translator: "perfiffer"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13909-1.html"

使用 logrotate 命令轮转和归档日志
======

> 使用此 Linux 命令保持日志文件更新。

![](https://img.linux.net.cn/data/attachment/album/202110/22/113833i6ikk4dzdm3y3hkk.jpg)

日志非常适合找出应用程序在做什么或对可能的问题进行故障排除。几乎我们处理的每个应用程序都会生成日志，我们希望我们自己开发的应用程序也生成日志。日志越详细，我们拥有的信息就越多。但放任不管，日志可能会增长到无法管理的大小，反过来，它们可能会成为它们自己的问题。因此，最好将它们进行裁剪，保留我们需要的那些，并将其余的归档。

### 基本功能

`logrotate` 实用程序在管理日志方面非常出色。它可以轮转日志、压缩日志、通过电子邮件发送日志、删除日志、归档日志，并在你需要时开始记录最新的。

运行 `logrotate` 非常简单——只需要运行 `logrotate -vs state-file config-file`。在上面的命令中，`v` 选项开启详细模式，`s` 指定一个状态文件，最后的 `config-file` 是配置文件，你可以指定需要做什么。

### 实战演练

让我们看看在我们的系统上静默运行的 `logrotate` 配置，它管理我们在 `/var/log` 目录中找到的大量日志。查看该目录中的当前文件。你是否看到很多 `*.[number].gz` 文件？这就是 `logrotate` 正在做的。你可以在 `/etc/logrotate.d/rsyslog` 下找到此配置文件。我的配置文件如下：

```
/var/log/syslog
{
        rotate 7
        daily
        missingok
        notifempty
        delaycompress
        compress
        postrotate
                reload rsyslog > /dev/null 2>&1 || true
        endscript
}

/var/log/mail.info
/var/log/mail.warn
/var/log/mail.err
/var/log/mail.log
/var/log/daemon.log
/var/log/kern.log
/var/log/auth.log
/var/log/user.log
/var/log/lpr.log
/var/log/cron.log
/var/log/debug
/var/log/messages

{
        rotate 4
        weekly
        missingok
        notifempty
        compress
        delaycompress
        sharedscripts
        postrotate
                reload rsyslog > /dev/null 2>&1 || true
        endscript
}
```

该文件首先定义了轮转 `/var/log/syslog` 文件的说明，这些说明包含在后面的花括号中。以下是它们的含义：

  * `rotate 7`: 保留最近 7 次轮转的日志。然后开始删除超出的。
  * `daily`: 每天轮转日志，与 `rotate 7` 一起使用，这意味着日志将保留过去 7 天。其它选项是每周、每月、每年。还有一个大小参数，如果日志文件的大小增加超过指定的限制（例如，大小 10k、大小 10M、大小 10G 等），则将轮转日志文件。如果未指定任何内容，日志将在运行 `logrotate` 时轮转。你甚至可以在 cron 中运行 `logrotate` 以便在更具体的时间间隔内使用它。 
  * `missingok`: 如果日志文件缺失也没关系。不要惊慌。
  * `notifempty`: 日志文件为空时不轮转。
  * `compress`: 开启压缩，使用 `nocompress` 关闭它。
  * `delaycompress`: 如果压缩已打开，则将压缩延迟到下一次轮转。这允许至少存在一个轮转但未压缩的文件。如果你希望昨天的日志保持未压缩以便进行故障排除，那么此配置会很有用。如果某些程序在重新启动/重新加载之前可能仍然写入旧文件，这也很有帮助，例如 Apache。 
  * `postrotate/endscript`: 轮转后运行此部分中的脚本。有助于做清理工作。还有一个 `prerotate/endscript` 用于在轮转开始之前执行操作。 

你能弄清楚下一节对上面配置中提到的所有文件做了什么吗？第二节中唯一多出的参数是 `sharedscripts`，它告诉 `logrotate` 在所有日志轮转完成之前不要运行 `postrotate/endscript` 中的部分。它可以防止脚本在每一次轮转时执行，只在最后一次轮转完成时执行。

### 看点新的东西

我使用下面的配置来处理我系统上的 `Nginx` 的访问和错误日志。

```
/var/log/nginx/access.log
/var/log/nginx/error.log  {
        size 1
        missingok
        notifempty
        create 544 www-data adm
        rotate 30
        compress
        delaycompress
        dateext
        dateformat -%Y-%m-%d-%s
        sharedscripts
        extension .log
        postrotate
                service nginx reload
        endscript
}
```

上面的脚本可以使用如下命令运行：

```
logrotate -vs state-file /tmp/logrotate
```

第一次运行该命令会给出以下输出：

```
reading config file /tmp/logrotate
extension is now .log

Handling 1 logs

rotating pattern: /var/log/nginx/access.log
/var/log/nginx/error.log   1 bytes (30 rotations)
empty log files are not rotated, old logs are removed
considering log /var/log/nginx/access.log
  log needs rotating
considering log /var/log/nginx/error.log
  log does not need rotating
rotating log /var/log/nginx/access.log, log-&gt;rotateCount is 30
Converted ' -%Y-%m-%d-%s' -&gt; '-%Y-%m-%d-%s'
dateext suffix '-2021-08-27-1485508250'
glob pattern '-[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]-[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
glob finding logs to compress failed
glob finding old rotated logs failed
renaming /var/log/nginx/access.log to /var/log/nginx/access-2021-08-27-1485508250.log
creating new /var/log/nginx/access.log mode = 0544 uid = 33 gid = 4
running postrotate script
* Reloading nginx configuration nginx
```

第二次运行它：

```
reading config file /tmp/logrotate
extension is now .log

Handling 1 logs

rotating pattern: /var/log/nginx/access.log
/var/log/nginx/error.log   1 bytes (30 rotations)
empty log files are not rotated, old logs are removed
considering log /var/log/nginx/access.log
  log needs rotating
considering log /var/log/nginx/error.log
  log does not need rotating
rotating log /var/log/nginx/access.log, log-&gt;rotateCount is 30
Converted ' -%Y-%m-%d-%s' -&gt; '-%Y-%m-%d-%s'
dateext suffix '-2021-08-27-1485508280'
glob pattern '-[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]-[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
compressing log with: /bin/gzip
renaming /var/log/nginx/access.log to /var/log/nginx/access-2021-08-27-1485508280.log
creating new /var/log/nginx/access.log mode = 0544 uid = 33 gid = 4
running postrotate script
* Reloading nginx configuration nginx
```

第三次运行它：

```
reading config file /tmp/logrotate
extension is now .log

Handling 1 logs

rotating pattern: /var/log/nginx/access.log
/var/log/nginx/error.log   1 bytes (30 rotations)
empty log files are not rotated, old logs are removed
considering log /var/log/nginx/access.log
  log needs rotating
considering log /var/log/nginx/error.log
  log does not need rotating
rotating log /var/log/nginx/access.log, log-&gt;rotateCount is 30
Converted ' -%Y-%m-%d-%s' -&gt; '-%Y-%m-%d-%s'
dateext suffix '-2021-08-27-1485508316'
glob pattern '-[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]-[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
compressing log with: /bin/gzip
renaming /var/log/nginx/access.log to /var/log/nginx/access-2021-08-27-1485508316.log
creating new /var/log/nginx/access.log mode = 0544 uid = 33 gid = 4
running postrotate script
* Reloading nginx configuration nginx
```

状态文件的内容如下所示：

```
logrotate state -- version 2
"/var/log/nginx/error.log" 2021-08-27-9:0:0
"/var/log/nginx/access.log" 2021-08-27-9:11:56
```

- [下载 Linux logrotate 备忘单][2]

本文首发于[作者个人博客][3]，经授权改编。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/10/linux-logrotate

作者：[Ayush Sharma][a]
选题：[lujun9972][b]
译者：[perfiffer](https://github.com/perfiffer)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ayushsharma
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/oliver-paaske-unsplash.jpg?itok=bv0sZSSB (Logs stacked up and to the right in front of a green tree forest)
[2]: https://opensource.com/downloads/logrotate-cheat-sheet
[3]: https://notes.ayushsharma.in/2017/01/fiddling-with-logrotate
