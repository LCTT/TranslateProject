moro：一个用于追踪工作时间的命令行生产力工具
======

![](https://www.ostechnix.com/wp-content/uploads/2018/03/Moro-720x340.jpg)

保持对你的工作小时数的追踪将让你知晓在一个特定时间区间内你所完成的工作总量。在网络上有大量的基于 GUI 的生产力工具可以用来追踪工作小时数。但我却不能找到一个基于 CLI 的工具。今天我偶然发现了一个简单而奏效的叫做 Moro  的追踪工作时间数的工具。Moro 是一个芬兰词汇，意为“Hello”。通过使用 Moro，你可以找到你在完成某项特定任务时花费了多少时间。这个工具是自由开源软件，它是通过 NodeJS 编写的。

### Moro - 一个追踪工作时间的命令行生产力工具

由于 Moro 是使用 NodeJS 编写的，保证你的系统上已经安装了 NodeJS。如果你没有安装好 NodeJS，跟随下面的链接在你的 Linux 中安装 NodeJS 和 NPM。

- [如何在 Linux 上安装 NodeJS](https://www.ostechnix.com/install-node-js-linux/)

NodeJS 和NPM一旦装好，运行下面的命令来安装 Moro。

```
$ npm install -g moro
```

### 用法

Moro 的工作概念非常简单。它记录了你的工作开始时间，结束时间和在你的系统上的休息时间。在每天结束时，它将会告知你已经工作了多少时间。

当你到达办公室时，只需键入：

```
$ moro
```

示例输出：
```
♥ Moro \o/
√ You clocked in at: 9:20
```

Moro 将会把这个时间注册为你的开始时间。

当你离开办公室时，再次键入：

```
$ moro
```

示例输出：

```
♥ Moro \o/
√ You clocked out at: 19:22
ℹ Today looks like this so far:
┌──────────────────┬─────────────────────────┐
│ Today you worked │ 9 Hours and 72 Minutes │
├──────────────────┼─────────────────────────┤
│ Clock in │ 9:20 │
├──────────────────┼─────────────────────────┤
│ Clock out │ 19:22 │
├──────────────────┼─────────────────────────┤
│ Break duration │ 30 minutes │
├──────────────────┼─────────────────────────┤
│ Date │ 2018-03-19 │
└──────────────────┴─────────────────────────┘
ℹ Run moro --help to learn how to edit your clock in, clock out or break duration for today
```

Moro 将会把这个时间注册为你的结束时间。

现在，Moro 将会从结束时间减去开始时间，然后从总的时间减去另外的 30 分钟作为休息时间，并给你在那天总的工作时间。抱歉，我的数学计算过程解释实在糟糕。假设你在早上 10:00 来工作并在晚上 17:30 离开。所以，你总共在办公室呆了 7:30 小时（例如 17:30-10）。然后在总的时间减去休息时间（默认是 30 分钟）。因此，你的总工作时间是 7 小时。明白了？很好！

**注意：**不要像我在写这个手册的时候一样把 “moro” 和 “more” 弄混了。

查看你注册的所有小时数，运行：

```
$ moro report --all
```

以防万一，如果你忘记注册开始时间或者结束时间，你一样可以在之后指定这些值。

例如，将上午 10 点注册为开始时间，运行：

```
$ moro hi 10:00
♥ Moro \o/
√ You clocked in at: 10:00
⏰ Working until 18:00 will make it a full (7.5 hours) day
```

注册 17:30 作为结束时间：

```
$ moro bye 17:30
♥ Moro \o/
√ You clocked out at: 17:30
ℹ Today looks like this so far:

┌──────────────────┬───────────────────────┐
│ Today you worked │ 7 Hours and 0 Minutes │
├──────────────────┼───────────────────────┤
│ Clock in │ 10:00 │
├──────────────────┼───────────────────────┤
│ Clock out │ 17:30 │
├──────────────────┼───────────────────────┤
│ Break duration │ 30 minutes │
├──────────────────┼───────────────────────┤
│ Date │ 2018-03-19 │
└──────────────────┴───────────────────────┘
ℹ Run moro --help to learn how to edit your clock in, clock out or break duration for today
```

你已经知道 Moro 默认将会减去 30 分钟的休息时间。如果你需要设置一个自定义的休息时间，你可以简单使用以下命令：

```
$ moro break 45
```

现在，休息时间是 45 分钟了。

若要清除所有的数据：

```
$ moro clear --yes
♥ Moro \o/
√ Database file deleted successfully
```

#### 添加笔记

有时候，你想要在工作时添加笔记。不必去寻找一个独立的作笔记的应用。Moro 将会帮助你添加笔记。要添加笔记，只需运行：

```
$ moro note mynotes
```

要在之后搜索所有已经注册的笔记，只需做：

```
$ moro search mynotes
```

#### 修改默认设置

默认的完整工作时间是 7.5 小时。这是因为开发者来自芬兰，这是官方的工作小时数。但是你也可以修改这个设置为你的国家的工作小时数。

举个例子，要将其设置为 7 小时，运行：

```
$ moro config --day 7
```

同样地，默认的休息时间也可以像下面这样从 30 分钟修改：

```
$ moro config --break 45
```

#### 备份你的数据

正如我已经说了的，Moro 将时间追踪信息存储在你的家目录，文件名是 `.moro-data.db`。

但是，你可以保存备份数据库到不同的位置。要这样做的话，像下面这样将 `.moro-data.db` 文件移到你选择的一个不同的位置并告知 Moro 使用那个数据库文件。

```
$ moro config --database-path /home/sk/personal/moro-data.db
```

在上面的每一个命令，我都已经把默认的数据库文件分配到了 `/home/sk/personal` 目录。

需要帮助的话，运行：

```
$ moro --help
```

正如你所见，Moro 是非常简单而又能用于追踪你完成你的工作使用了多少时间的。对于自由职业者和任何想要在一定时间范围内完成事情的人，它将会是有用的。

并且，这些只是今天的内容。希望这些内容能够有所帮助。更多的好东西将会出现。请保持关注！

干杯！


--------------------------------------------------------------------------------

via: https://www.ostechnix.com/moro-a-command-line-productivity-tool-for-tracking-work-hours/

作者：[SK][a]
译者：[leemeans](https://github.com/leemeans)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
