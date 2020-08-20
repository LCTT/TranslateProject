[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12279-1.html)
[#]: subject: (How to Execute a Command or Script at Reboot or Startup)
[#]: via: (https://www.2daygeek.com/execute-run-linux-scripts-command-at-reboot-startup/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

如何在重启或启动时执行命令或脚本
======

![](https://img.linux.net.cn/data/attachment/album/202006/04/091837g664qu0y206aqoo9.jpg)

众总所周知 Linux 可以在启动时添加服务。例如，如果要在[启动时添加][1] Apache Httpd 服务，你可以在 `chkconfig` 和 `systemctl` 命令的帮助下完成此操作。

有时你需要在启动时添加自定义脚本、命令或服务，该怎么做？你可以使用以下三种方法来做到。

在本文中，我们将通过示例向你展示如何使用这些方法。

### 方法 1：如何使用 /etc/rc.d/rc.local 文件在重启或启动时运行脚本或命令

传统上，`/etc/rc.local` 文件是在切换到多用户运行级别的过程结束时，在所有正常的计算机服务启动之后执行的。

此方法也适用于 systemd 系统。

你需要将你的脚本位置添加到 `/etc/rc.d/rc.local` 文件中以在启动时运行。

确保该文件有运行权限：

```
# chmod +x /etc/rc.d/rc.local
```

作为演示，我们将创建一个简单的示例脚本。你可以根据需要创建任何脚本。

```
# vi /opt/scripts/run-script-on-boot.sh

#!/bin/bash
date > /root/on-boot-output.txt
hostname > /root/on-boot-output.txt
```

脚本完成后，设置可执行权限：

```
# chmod +x /opt/scripts/run-script-on-boot.sh
```

最后，将该脚本添加到文件底部：

```
# vi /etc/rc.d/rc.local

/opt/scripts/run-script-on-boot.sh
```

[重启系统][2]进行检查：

```
# reboot
```

### 方法 2：如何使用 crontab 在重启或启动时执行命令或脚本

cron 在特定时间在后台自动执行计划的作业。可以在 [cron 任务][3]中使用特殊的字符串 `@reboot` 来完成。`@reboot` 是一个特殊的字符串，它允许用户在启动时运行任何命令或脚本。

此示例在系统重启时运行 `/opt/scripts/run-script-on-boot.sh` 文件。我们将使用与上面相同的脚本。

为此，只需在 crontab 文件中添加以下条目：

```
# crontab -e

@reboot /opt/scripts/run-script-on-boot.sh
```

重启系统进行检查：

```
# reboot
```

### 方法 3：如何使用 systemd 服务单元在重启或启动时运行命令或脚本

此方法仅适用于 systemd 系统。该方法非常简单。

我们将使用上面相同的脚本进行演示。

为此，你需要创建一个 systemd 启动脚本并将其放在 `/etc/systemd/system/` 目录中。

这是我们的示例 systemd 启动单元脚本：

```
# vi sample-on-boot-script.service

[Unit]
Description=Run a Custom Script at Startup
After=default.target

[Service]
ExecStart=/opt/scripts/run-script-on-boot.sh

[Install]
WantedBy=default.target
```

将单元脚本放置在 systemd 所在位置后，运行以下命令更新 systemd 配置文件并启用服务：

```
# systemctl daemon-reload
# systemctl enable sample-on-boot-script.service
```

重启系统进行检查：

```
# reboot
```

### 额外提示

如果你想在后台运行脚本，你需要在最后加上 `&` 符号

```
/Path/To/My_Script &
```

如果你想以不同用户运行命令，使用以下格式：

```
su - $USER -c /Path/To/My_Script
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/execute-run-linux-scripts-command-at-reboot-startup/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/enable-disable-services-on-boot-linux-chkconfig-systemctl-command/
[2]: https://www.2daygeek.com/6-commands-to-shutdown-halt-poweroff-reboot-the-linux-system/
[3]: https://www.2daygeek.com/linux-crontab-cron-job-to-schedule-jobs-task/
