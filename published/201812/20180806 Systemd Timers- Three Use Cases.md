Systemd 定时器：三种使用场景
======

> 继续 systemd 教程，这些特殊的例子可以展示给你如何更好的利用 systemd 定时器单元。

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/timer-analogue-1078057.jpg?itok=IKS4TrkE)

在这个 systemd 系列教程中，我们[已经在某种程度上讨论了 systemd 定时器单元][1]。不过，在我们开始讨论 sockets 之前，我们先来看三个例子，这些例子展示了如何最佳化利用这些单元。

### 简单的类 cron 行为

我每周都要去收集 [Debian popcon 数据][2]，如果每次都能在同一时间收集更好，这样我就能看到某些应用程序的下载趋势。这是一个可以使用 cron 任务来完成的典型事例，但 systemd 定时器同样能做到：

```
# 类 cron 的 popcon.timer

[Unit]
Description= 这里描述了下载并处理 popcon 数据的时刻

[Timer]
OnCalendar= Thu *-*-* 05:32:07
Unit= popcon.service

[Install]
WantedBy= basic.target
```

实际的 `popcon.service` 会执行一个常规的 `wget` 任务，并没有什么特别之处。这里的新内容是 `OnCalendar=` 指令。这个指令可以让你在一个特定日期的特定时刻来运行某个服务。在这个例子中，`Thu` 表示 “在周四运行”，`*-*-*` 表示“具体年份、月份和日期无关紧要”，这些可以翻译成 “不管年月日，只在每周四运行”。

这样，你就设置了这个服务的运行时间。我选择在欧洲中部夏令时区的上午 5:30 左右运行，那个时候服务器不是很忙。

如果你的服务器关闭了，而且刚好错过了每周的截止时间，你还可以在同一个计时器中使用像 anacron 一样的功能。

```
# 具备类似 anacron 功能的 popcon.timer

[Unit]
Description= 这里描述了下载并处理 popcon 数据的时刻

[Timer]
Unit=popcon.service
OnCalendar=Thu *-*-* 05:32:07
Persistent=true

[Install]
WantedBy=basic.target
```

当你将 `Persistent=` 指令设为真值时，它会告诉 systemd，如果服务器在本该它运行的时候关闭了，那么在启动后就要立刻运行服务。这意味着，如果机器在周四凌晨停机了（比如说维护），一旦它再次启动后，`popcon.service` 将会立刻执行。在这之后，它的运行时间将会回到例行性的每周四早上 5:32.

到目前为止，就是这么简单直白。

### 延迟执行

但是，我们提升一个档次，来“改进”这个[基于 systemd 的监控系统][3]。你应该记得，当你接入摄像头的时候，系统就会开始拍照。假设你并不希望它在你安装摄像头的时候拍下你的脸。你希望将拍照服务的启动时间向后推迟一两分钟，这样你就有时间接入摄像头，然后走到画框外面。

为了完成这件事，首先你要更改 Udev 规则，将它指向一个定时器：

```
ACTION=="add", SUBSYSTEM=="video4linux", ATTRS{idVendor}=="03f0", 
ATTRS{idProduct}=="e207", TAG+="systemd", ENV{SYSTEMD_WANTS}="picchanged.timer", 
SYMLINK+="mywebcam", MODE="0666"
```

这个定时器看起来像这样：

```
# picchanged.timer

[Unit]
Description= 在摄像头接入的一分钟后，开始运行 picchanged

[Timer]
OnActiveSec= 1 m
Unit= picchanged.path

[Install]
WantedBy= basic.target
```

在你接入摄像头后，Udev 规则被触发，它会调用定时器。这个定时器启动后会等上一分钟（`OnActiveSec= 1 m`），然后运行 `picchanged.path`，它会[监视主图片的变化][4]。`picchanged.path` 还会负责接触 `webcan.service`，这个实际用来拍照的服务。

### 在每天的特定时刻启停 Minetest 服务器

在最后一个例子中，我们认为你决定用 systemd 作为唯一的依赖。讲真，不管怎么样，systemd 差不多要接管你的生活了。为什么不拥抱这个必然性呢？

你有个为你的孩子设置的 Minetest 服务。不过，你还想要假装关心一下他们的教育和成长，要让他们做作业和家务活。所以你要确保 Minetest 只在每天晚上的一段时间内可用，比如五点到七点。

这个跟之前的“_在特定时间启动服务_”不太一样。写个定时器在下午五点启动服务很简单…：

```
# minetest.timer

[Unit]
Description= 在每天下午五点运行 minetest.service

[Timer]
OnCalendar= *-*-* 17:00:00
Unit= minetest.service

[Install]
WantedBy= basic.target
```

…可是编写一个对应的定时器，让它在特定时刻关闭服务，则需要更大剂量的横向思维。

我们从最明显的东西开始 —— 设置定时器：

```
# stopminetest.timer

[Unit]
Description= 每天晚上七点停止 minetest.service

[Timer]
OnCalendar= *-*-* 19:05:00
Unit= stopminetest.service

[Install]
WantedBy= basic.target
```

这里棘手的部分是如何去告诉 `stopminetest.service` 去 —— 你知道的 —— 停止 Minetest. 我们无法从 `minetest.service` 中传递 Minetest 服务器的 PID. 而且 systemd 的单元词汇表中也没有明显的命令来停止或禁用正在运行的服务。

我们的诀窍是使用 systemd 的 `Conflicts=` 指令。它和 systemd 的 `Wants=` 指令类似，不过它所做的事情_正相反_。如果你有一个 `b.service` 单元，其中包含一个 `Wants=a.service` 指令，在这个单元启动时，如果 `a.service` 没有运行，则 `b.service` 会运行它。同样，如果你的 `b.service` 单元中有一行写着 `Conflicts= a.service`，那么在 `b.service` 启动时，systemd 会停止 `a.service`.

这种机制用于两个服务在尝试同时控制同一资源时会发生冲突的场景，例如当两个服务要同时访问打印机的时候。通过在首选服务中设置 `Conflicts=`，你就可以确保它会覆盖掉最不重要的服务。

不过，你会在一个稍微不同的场景中来使用 `Conflicts=`. 你将使用 `Conflicts=` 来干净地关闭 `minetest.service`：

```
# stopminetest.service

[Unit]
Description= 关闭 Minetest 服务
Conflicts= minetest.service

[Service]
Type= oneshot
ExecStart= /bin/echo "Closing down minetest.service"
```

`stopminetest.service` 并不会做特别的东西。事实上，它什么都不会做。不过因为它包含那行 `Conflicts=`，所以在它启动时，systemd 会关掉 `minetest.service`.

在你完美的 Minetest 设置中，还有最后一点涟漪：你下班晚了，错过了服务器的开机时间，可当你开机的时候游戏时间还没结束，这该怎么办？`Persistent=` 指令（如上所述）在错过开始时间后仍然可以运行服务，但这个方案还是不行。如果你在早上十一点把服务器打开，它就会启动 Minetest，而这不是你想要的。你真正需要的是一个确保 systemd 只在晚上五到七点启动 Minetest 的方法：

```
# minetest.timer

[Unit]
Description= 在下午五到七点内的每分钟都运行 minetest.service

[Timer]
OnCalendar= *-*-* 17..19:*:00
Unit= minetest.service

[Install]
WantedBy= basic.target
```

`OnCalendar= *-*-* 17..19:*:00` 这一行有两个有趣的地方：(1) `17..19` 并不是一个时间点，而是一个时间段，在这个场景中是 17 到 19 点；以及，(2) 分钟字段中的 `*` 表示服务每分钟都要运行。因此，你会把它读做 “在下午五到七点间的每分钟，运行 minetest.service”

不过还有一个问题：一旦 `minetest.service` 启动并运行，你会希望 `minetest.timer` 不要再次尝试运行它。你可以在 `minetest.service` 中包含一条 `Conflicts=` 指令：

```
# minetest.service

[Unit]
Description= 运行 Minetest 服务器
Conflicts= minetest.timer

[Service]
Type= simple
User= <your user name>

ExecStart= /usr/bin/minetest --server
ExecStop= /bin/kill -2 $MAINPID

[Install]
WantedBy= multi-user.targe
```

上面的 `Conflicts=` 指令会保证在 `minstest.service` 成功运行后，`minetest.timer` 就会立即停止。

现在，启用并启动 `minetest.timer`：

```
systemctl enable minetest.timer
systemctl start minetest.timer
```

而且，如果你在六点钟启动了服务器，`minetest.timer` 会启用；到了五到七点，`minetest.timer` 每分钟都会尝试启动 `minetest.service`。不过，一旦 `minetest.service` 开始运行，systemd 会停止 `minetest.timer`，因为它会与 `minetest.service` “冲突”，从而避免计时器在服务已经运行的情况下还会不断尝试启动服务。

在首先启动某个服务时杀死启动它的计时器，这么做有点反直觉，但它是有效的。

### 总结

你可能会认为，有更好的方式来做上面这些事。我在很多文章中看到过“过度设计”这个术语，尤其是在用 systemd 定时器来代替 cron 的时候。

但是，这个系列文章的目的不是为任何具体问题提供最佳解决方案。它的目的是为了尽可能多地使用 systemd 来解决问题，甚至会到荒唐的程度。它的目的是展示大量的例子，来说明如何利用不同类型的单位及其包含的指令。我们的读者，也就是你，可以从这篇文章中找到所有这些的可实践范例。

尽管如此，我们还有一件事要做：下回中，我们会关注 sockets 和 targets，然后我们将完成对 systemd 单元的介绍。

你可以在 Linux 基金会和 edX 中，通过免费的 [Linux 介绍][5]课程中，学到更多关于 Linux 的知识。

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/intro-to-linux/2018/8/systemd-timers-two-use-cases-0

作者：[Paul Brown][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[StdioA](https://github.com/StdioA)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/bro66
[1]:https://linux.cn/article-10182-1.html
[2]:https://popcon.debian.org/
[3]:https://www.linux.com/blog/intro-to-linux/2018/6/systemd-services-reacting-change
[4]:https://www.linux.com/blog/learn/intro-to-linux/2018/6/systemd-services-monitoring-files-and-directories
[5]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
