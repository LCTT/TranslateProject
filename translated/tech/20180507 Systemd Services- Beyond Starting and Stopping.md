Systemd 服务：比启动停止服务更进一步
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/systemd-minetest-2.jpg?itok=bXO0ggHL)
在上一篇[文章][1]中，我们展示了如何创建一个 systemd 服务并使用普通用户启动和终止游戏服务器。但到目前为止，使用这个服务并不比直接运行服务器高明多少。让我们更进一步，让其可以向玩家发邮件，包括在服务器可用时通知玩家，在服务器关闭前警告玩家：
```
# minetest.service

[Unit]
Description= Minetest server
Documentation= https://wiki.minetest.net/Main_Page

[Service]
Type= simple

ExecStart= /usr/games/minetest --server
ExecStartPost= /home/<username>/bin/mtsendmail.sh "Ready to rumble?" "Minetest Starting up"

TimeoutStopSec= 180
ExecStop= /home/<username>/bin/mtsendmail.sh "Off to bed. Nightie night!" "
  Minetest Stopping in 2 minutes"
ExecStop= /bin/sleep 120
ExecStop= /bin/kill -2 $MAINPID

```

这里涉及几个新的指令。首先是 `ExecStartPost` 指令，该指令可以在主进程启动后马上执行任何你指定的操作。在本例中，你执行了一个自定义脚本 `mtsendmail` (内容如下)，该脚本以邮件形式通知你的朋友服务器已经启动。
```
#!/bin/bash
# mtsendmail
echo $1 | mutt -F /home/<username>/.muttrc -s "$2" my_minetest@mailing_list.com

```

我们使用 [Mutt][2] 这个命令后邮件客户端发送消息。虽然从实际效果来看，上述脚本仅有 1 行，但 systemd unit 的参数中不能包含管道及重定向操作，故我们需要将其封装到脚本中。

顺便提一下，还有一个 `ExecStartPre` 指令，用于在服务主进程执行之前进行指定操作。

接下来我们看到，关闭服务器涉及了好几条指令。`TimeoutStopSec` 指令用于设置 systemd 友好关闭服务的最大等候时间，默认值大约是 90 秒。超过这个最大等候时间，systemd 会强制关闭服务并报错。考虑到你希望在彻底关闭服务器前给用户预留几分钟的时间，你需要将超时时间提高至 3 分钟，这样 systemd 就不会误认为服务关闭时出现问题。

接下来是关闭服务的具体指令部分。虽然没有 `ExecStopPre` 这样的指令，但你可以通过多次使用 `ExecStop` 指令实现关闭服务器前执行操作的目标。多个 `ExecStop` 指令按从上到下的顺序依次运行，这样你就可以在服务器真正关闭前向用户发送消息。

通过这个特性，你首先应该向你的朋友发邮件，警告其服务器即将关闭，然后等待两分钟，最后关闭服务器。可以使用 [Ctrl] + [c] 关闭 Minetest 服务器，该操作会被转换为一个中断信号 ( _SIGINT_ )；当你执行 `kill -2 $MAINPID` 时就会发送该中断信号，其中 `$MAINPID` 是 systemd 变量，用于记录你服务中主进程的 PID 信息。

看上去好多了！如果你此时启动服务，
```
systemctl --user start minetest

```

服务会启动 Minetest 服务器并向你的用户发送邮件。关闭服务的情形基本类似，只不过会额外留给用户 2 分钟时间退出登录。

### 开机自启动

下一步我们让你的服务在主机启动后立即可用，在主机关闭时自动关闭。

我们需要将你的服务文件移动到系统服务目录，即 _/etc/systemd/system/_：
```
sudo mv /home/<username>/.config/systemd/user/minetest.service /etc/systemd/system/

```

如果你希望此时启动该服务，你需要拥有超级用户权限：
```
sudo systemctl start minetest

```

另外，可以使用如下命令检查服务状态：
```
sudo systemctl status minetest

```

你会发现服务很糟糕地处于失败状态，这是因为 systemd 不能通过上下文信息、特征、配置文件得知具体使用哪个用户运行该服务。在 unit 文件中增加 `User` 指令可以解决这个问题。
```
# minetest.service

[Unit]
Description= Minetest server
Documentation= https://wiki.minetest.net/Main_Page

[Service]
Type= simple
User= <username>

ExecStart= /usr/games/minetest --server
ExecStartPost= /home/<username>/bin/mtsendmail.sh "Ready to rumble?"
  "Minetest Starting up"

TimeoutStopSec= 180
ExecStop= /home/<username>/bin/mtsendmail.sh "Off to bed. Nightie night!"
  "Minetest Stopping in 2 minutes"
ExecStop= /bin/sleep 120
ExecStop= /bin/kill -2 $MAINPID

```
systemd 从 `User` 指令中得知应使用哪个用户的环境变量来正确运行该服务。你可以使用 root 用户，但这可能产生安全风险；使用你的个人用户会好一些，但不少管理员的做法是为服务单独创建一个用户，这样可以有效地将服务与其它用户和系统组件相互隔离。

下一步我们让你的服务在系统启动时自动启动，系统关闭时自动关闭。要达到这个目的，你需要 _enable_ 你的服务；但在这之前，你还需要告知 systemd 从哪里 _install_。

对于 systemd 而言，_installing_ 告知 systemd 在系统启动的具体哪个步骤激活你的服务。以 _通用 Unix 打印系统_ _cups.service_ 为例，它的启动在网络框架启动之后、其它打印服务启动之前。又如，_minetest.server_ 需要使用用户邮件（及其它组件），需要等待网络和普通用户对应的服务就绪后才可启动。

你只需要在 unit 中添加一个新段和新指令：
```
...
[Install]
WantedBy= multi-user.target

```

你可以将其理解为“等待多用户系统的全部内容就绪”。systemd 中的 targets 类似于旧系统中的 run levels，可以用于将主机转移到一个或另一个状态，也可以像本例中这样让你的服务等待指定状态出现后运行。

你的最终 _minetest.service_ 文件如下：
```
# minetest.service
[Unit]
Description= Minetest server
Documentation= https://wiki.minetest.net/Main_Page

[Service]
Type= simple
User= <username>

ExecStart= /usr/games/minetest --server
ExecStartPost= /home/<username>/bin/mtsendmail.sh "Ready to rumble?"
  "Minetest Starting up"

TimeoutStopSec= 180
ExecStop= /home/<username>/bin/mtsendmail.sh "Off to bed. Nightie night!"
  "Minetest Stopping in 2 minutes"
ExecStop= /bin/sleep 120
ExecStop= /bin/kill -2 $MAINPID

[Install]
WantedBy= multi-user.target

```

在尝试新的服务之前，你还需要对邮件脚本做一些调整：
```
#!/bin/bash
# mtsendmail

sleep 20
echo $1 | mutt -F /home/<username>/.muttrc -s "$2" my_minetest@mailing_list.com
sleep 10

```

这是因为系统需要一定的时间启动邮件系统（这里等待 20 秒），也需要一定时间完成邮件发送（这里等待 10 秒）。注意脚本中的等待时间数值适用于我的系统，你可能需要针对你的系统调整数值。

大功告成啦。执行如下操作：
```
sudo systemctl enable minetest

```

你的 Minetest 服务将在系统启动时自动启动，在系统关闭时友好关闭并通知你的用户。

### 总结

事实上 Debian, Ubuntu 和一些族类的发行版提供了 _minetest-server_ 这个特别的软件包，可以提供一部分上述功能，（但不包括邮件通知功能）。即使如此，你还是可以建立你独有的自定义服务；事实上，你目前建立的服务比 Debian 默认提供的服务更加通用，可以提供更多功能。

更进一步的说，我们这里描述的流程可以让你将大多数简单服务器转换为服务，类型可以是游戏、网站应用或其它应用。同时，这也是你名副其实地踏入 systemd 大师殿堂的第一步。

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/2018/5/systemd-services-beyond-starting-and-stopping

作者：[Paul Brown][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[pinewall](https://github.com/pinewall)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/bro66
[1]:https://www.linux.com/blog/learn/intro-to-linux/2018/5/writing-systemd-services-fun-and-profit
[2]:http://www.mutt.org/
