在 Linux 上使用 systemd 设置定时器
======
> 学习使用 systemd 创建启动你的游戏服务器的定时器。

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/clock-650753_1920.jpg?itok=RiRyCbAP)

之前，我们看到了如何[手动的][1]、[在开机与关机时][2]、[在启用某个设备时][3]、[在文件系统发生改变时][4] 启用与禁用 systemd 服务。

定时器增加了另一种启动服务的方式，基于……时间。尽管与定时任务很相似，但 systemd 定时器稍微地灵活一些。让我们看看它是怎么工作的。

### “定时运行”

让我们展开[本系列前两篇文章][2]中[你所设置的][1] [Minetest][5]  服务器作为如何使用定时器单元的第一个例子。如果你还没有读过那几篇文章，可以现在去看看。

你将通过创建一个定时器来“改进” Minetest 服务器，使得在服务器启动 1 分钟后运行游戏服务器而不是立即运行。这样做的原因可能是，在启动之前可能会用到其他的服务，例如发邮件给其他玩家告诉他们游戏已经准备就绪，你要确保其他的服务（例如网络）在开始前完全启动并运行。

最终，你的 `minetest.timer` 单元看起来就像这样：

```
# minetest.timer
[Unit]
Description=Runs the minetest.service 1 minute after boot up

[Timer]
OnBootSec=1 m
Unit=minetest.service

[Install]
WantedBy=basic.target
```

一点也不难吧。

如以往一般，开头是 `[Unit]` 和一段描述单元作用的信息，这儿没什么新东西。`[Timer]` 这一节是新出现的，但它的作用不言自明：它包含了何时启动服务，启动哪个服务的信息。在这个例子当中，`OnBootSec` 是告诉 systemd 在系统启动后运行服务的指令。

其他的指令有：

* `OnActiveSec=`，告诉 systemd 在定时器启动后多长时间运行服务。
* `OnStartupSec=`，同样的，它告诉 systemd 在 systemd 进程启动后多长时间运行服务。
* `OnUnitActiveSec=`，告诉 systemd 在上次由定时器激活的服务启动后多长时间运行服务。
* `OnUnitInactiveSec=`，告诉 systemd 在上次由定时器激活的服务停用后多长时间运行服务。

继续 `minetest.timer` 单元，`basic.target` 通常用作<ruby>后期引导服务<rt>late boot services</rt></ruby>的<ruby>同步点<rt>synchronization point</rt></ruby>。这就意味着它可以让 `minetest.timer` 单元运行在安装完<ruby>本地挂载点<rt>local mount points</rt></ruby>或交换设备，套接字、定时器、路径单元和其他基本的初始化进程之后。就像在[第二篇文章中 systemd 单元][2]里解释的那样，`targets` 就像<ruby>旧的运行等级<rt>old run levels</rt></ruby>一样，可以将你的计算机置于某个状态，或像这样告诉你的服务在达到某个状态后开始运行。

在前两篇文章中你配置的 `minetest.service` 文件[最终][2]看起来就像这样：

```
# minetest.service
[Unit]
Description= Minetest server
Documentation= https://wiki.minetest.net/Main_Page

[Service]
Type= simple
User=

ExecStart= /usr/games/minetest --server
ExecStartPost= /home//bin/mtsendmail.sh "Ready to rumble?" "Minetest Starting up"

TimeoutStopSec= 180
ExecStop= /home//bin/mtsendmail.sh "Off to bed. Nightie night!" "Minetest Stopping in 2 minutes"
ExecStop= /bin/sleep 120
ExecStop= /bin/kill -2 $MAINPID

[Install]
WantedBy= multi-user.target
```

这儿没什么需要修改的。但是你需要将 `mtsendmail.sh`（发送你的 email 的脚本）从：

```
#!/bin/bash
# mtsendmail
sleep 20
echo $1 | mutt -F /home/<username>/.muttrc -s "$2" my_minetest@mailing_list.com
sleep 10
```

改成：

```
#!/bin/bash
# mtsendmail.sh
echo $1 | mutt -F /home/paul/.muttrc -s "$2" pbrown@mykolab.com
```

你做的事是去除掉 Bash 脚本中那些蹩脚的停顿。Systemd 现在来做等待。

### 让它运行起来

确保一切运作正常，禁用 `minetest.service`：

```
sudo systemctl disable minetest
```

这使得系统启动时它不会一同启动；然后，相反地，启用 `minetest.timer`：

```
sudo systemctl enable minetest.timer
```

现在你就可以重启服务器了，当运行 `sudo journalctl -u minetest.*` 后，你就会看到 `minetest.timer` 单元执行后大约一分钟，`minetest.service` 单元开始运行。

![minetest timer][7]

*图 1：minetest.timer 运行大约 1 分钟后 minetest.service 开始运行*

### 时间的问题

`minetest.timer` 在 systemd 的日志里显示的启动时间为 09:08:33 而 `minetest.service` 启动时间是 09:09:18，它们之间少于 1 分钟，关于这件事有几点需要说明一下：首先，请记住我们说过 `OnBootSec=` 指令是从引导完成后开始计算服务启动的时间。当 `minetest.timer` 的时间到来时，引导已经在几秒之前完成了。

另一件事情是 systemd 给自己设置了一个<ruby>误差幅度<rt>margin of error</rt></ruby>（默认是 1 分钟）来运行东西。这有助于在多个<ruby>资源密集型进程<rt>resource-intensive processes</rt></ruby>同时运行时分配负载：通过分配 1 分钟的时间，systemd 可以等待某些进程关闭。这也意味着 `minetest.service` 会在引导完成后的 1~2 分钟之间启动。但精确的时间谁也不知道。

顺便一提，你可以用 `AccuracySec=` 指令[修改误差幅度][9]。

你也可以检查系统上所有的定时器何时运行或是上次运行的时间：

```
systemctl list-timers --all
```

![check timer][11]

*图 2：检查定时器何时运行或上次运行的时间*

最后一件值得思考的事就是你应该用怎样的格式去表示一段时间。Systemd 在这方面非常灵活：`2 h`，`2 hours` 或 `2hr` 都可以用来表示 2 个小时。对于“秒”，你可以用 `seconds`，`second`，`sec` 和 `s`。“分”也是同样的方式：`minutes`，`minute`，`min` 和 `m`。你可以检查 `man systemd.time` 来查看 systemd 能够理解的所有时间单元。

### 下一次

下次你会看到如何使用日历中的日期和时间来定期运行服务，以及如何通过组合定时器与设备单元在插入某些硬件时运行服务。

回头见！

在 Linux 基金会和 edx 上通过免费课程 [“Introduction to Linux”][12] 学习更多关于 Linux 的知识。

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/intro-to-linux/2018/7/setting-timer-systemd-linux

作者：[Paul Brown][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[LuuMing](https://github.com/LuuMing)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/bro66
[1]:https://linux.cn/article-9700-1.html
[2]:https://linux.cn/article-9703-1.html
[3]:https://www.linux.com/blog/intro-to-linux/2018/6/systemd-services-reacting-change
[4]:https://www.linux.com/blog/learn/intro-to-linux/2018/6/systemd-services-monitoring-files-and-directories
[5]:https://www.minetest.net/
[6]:/files/images/minetest-timer-1png
[7]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/minetest-timer-1.png?itok=TG0xJvYM (minetest timer)
[8]:/licenses/category/used-permission
[9]:https://www.freedesktop.org/software/systemd/man/systemd.timer.html#AccuracySec=
[10]:/files/images/minetest-timer-2png
[11]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/minetest-timer-2.png?itok=pYxyVx8- (check timer)
[12]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
