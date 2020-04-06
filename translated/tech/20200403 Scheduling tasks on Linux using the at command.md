[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Scheduling tasks on Linux using the at command)
[#]: via: (https://www.networkworld.com/article/3535808/scheduling-tasks-on-linux-using-the-at-command.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Scheduling tasks on Linux using the at command
在 Linux 上使用 at 命令来管理任务
======
The at command makes it easy to schedule Linux tasks to be run at any time or date you choose. Check out what it can do for you.
at 命令很容易安排 Linux 任务在你选择的任何时间或日期运行，看看它能为你做什么。

romkaz / Getty Images

When you want commands or scripts to run at some particular time, you don’t have to sit with your fingers hovering over the keyboard waiting to press the enter key or even be at your desk at the right time. Instead, you can set your task to be run through the **at** command. In this post, we’ll look at how tasks are scheduled using **at**, how you can precisely select the time you want your process to run and how to view what’s been scheduled to run using **at**.
当你想要命令或脚本在某个特定时间运行时，你不需要用你的手指在键盘上盘旋等待按下 enter 键，甚至在特定时间坐在办公桌前。相反，你可以通过 **at** 命令来设置任务。在本文中，我们将研究如何使用 **at** 来安排任务，如何精确选择要运行的时间以及如何查看使用 **at** 安排的时间。

### at vs cron

For those who’ve been scheduling tasks on Linux systems using **cron**, the **at** command is something like **cron** in that you can schedule tasks to run at a selected time, but **cron** is used for jobs that are run periodically – even if that means only once a year. Most **cron** jobs are set up to be run daily, weekly or monthly, though you control how often and when.
对于那些使用 **cron** 在 Linux 系统上计划任务的人来说，**at** 命令类似于 **cron**，因为你可以计划在选定时间运行的任务，但是 **cron** 用于定期运行的工作-即使着意味着每年仅一次。大多数 **cron** 作业都设置为每天，每周或每月运行，尽管你可以控制频率和时间。

The **at** command, on the other hand, is used for tasks which are run only once. Want to reboot your system at midnight tonight? No problem, **at** can do that for you assuming you have the proper permissions. If you want the system rebooted every Saturday night at 2 a.m., use **cron** instead.
另一方面，**at** 命令用于仅运行一次的任务。是否想在今晚午夜重启系统？没问题，假设你拥有适当的权限，**at** 可以为你完成此操作。如果你希望系统在每个星期六晚上凌晨 2 点重启，请改用 **cron**。

### 使用 at

The **at** command is easy to use ,and there are only a few things to remember. A simple use of **at** might look like this:
**at** 命令易于使用，只需记住几件事。**at** 的简单用法如下所示：
```
$ at 5:00PM
at> date >> thisfile
at> <EOT>
```

After typing “at” and the time the command should be run, **at** prompts you for the command to be run (in this case, the **date** command). Type **^D** to complete your request.
在输入 "at" 并允许命令的时间后，**at** 会提示你运行该命令（在这种情况下，是 "date" 命令）。输入 **^D** 来完成请求。

Assuming we set up this **at** command earlier than 5 p.m., the date and time will be added to the end of a file named “thisfile” later the same day. Otherwise, the command will run at 5 p.m. the following day.
假设我们在下午 5 点之前设置此 **at** 命令，那么日期和时间将在当天晚些时候添加到名为 "thisfile" 的文件的末尾。否则，该命令将在下午 5 点运行。

You can enter more than one command when interacting with the **at** command. If you want more than one command to be run at the same time, simply specify more than one command line:
与 **at** 命令进行交互时，可以输入多个命令。如果要同时运行多个目录，只需指定多个命令行即可：
[][1]

```
$ at 6:22
warning: commands will be executed using /bin/sh
at> echo first >> thisfile
at> echo second >> thisfile
at> <EOT>
```

In the commands above, we’re using a regular user account and adding some simple text to a file in that user’s home directory. If it’s after 6:22 a.m. when this command is run, the command will run the following day because 6:22 is taken to mean 6:22 a.m. If you want it to run at 6:22 p.m., either use 6:22 PM or 18:22. “6:22 PM” also works.
在上面的命令中，我们使用常规账户，将一些简单的文本添加到该用户主目录的文件中。如果运行此命令的时间是上午 6:22 之后，则该命令将在第二天运行，因为 6:22 表示上午 6:22。如果要使其在下午 6:22 运行，使用 6:22 PM 或者 18:22。

You can use **at** to schedule commands to run on specific dates either by specifying the dates or specifying dates and times like “10:00AM April 15 2021” or “noon + 5 days” (run at noon five days from today). Here are some examples:
你可以通过指定日期或指定日期和时间，例如 “2021 年 4 月 15 日上午 10:00”或“中午 + 5 天”（从今天起中午五点运行），使用 **at** 来安排命令在特定日期运行。以下是些例子：

```
at 6PM tomorrow
at noon April 15 2021
at noon + 5 days
at 9:15 + 1000 days
```

After you specify the command to run and press **^D**, you will notice that the **at** command has assigned a job number to each request. This number will show up in the **at** command's job queue.
指定要运行的命令并按下 **^D** 后，你会注意到 **at** 命令已为每个请求分配了作业编号，此数字将显示在 **at** 命令的作业队列中。

```
$ at noon + 1000 days
warning: commands will be executed using /bin/sh
at> date >> thisfile
at> <EOT>
job 36 at Tue Dec 27 12:00:00 2022        <== job # is 36
```

### Checking the queue检查队列

You can look at the queue of **at** jobs with the **atq** (at queue) command:
你可以使用 **atq**(at queue) 命令来查看 **at** 作业队列：

```
$ atq
32      Thu Apr  2 03:06:00 2020 a shs
35      Mon Apr  6 12:00:00 2020 a shs
36      Tue Dec 27 12:00:00 2022 a shs
34      Thu Apr  2 18:00:00 2020 a shs
```

If you need to cancel one of the jobs in the queue, use the **atrm** (at remove) command along with the job number.
如果你需要取消队列中作业之一，使用 **atrm**(at remote) 命令和作业编号：

```
$ atrm 32
$ atq
35      Mon Apr  6 12:00:00 2020 a shs
36      Tue Dec 27 12:00:00 2022 a shs
34      Thu Apr  2 18:00:00 2020 a shs
```

You can look into the details of a scheduled task using the **at -c** command. Additional details (the active search path, etc.) are also available, but the bottom lines of the output will show you what command has been scheduled to run.
你可以使用 **at -c** 命令来查看计划任务的详细信息。还可以提供其它详细信息（活动的搜索路径等），但是输出的底行将显示已计划运行的命令。

```
$ at -c 36 | tail -6
cd /home/shs || {
         echo 'Execution directory inaccessible' >&2
         exit 1
}
date >> thisfile
```

Notice that the command shown begins with testing whether the user’s directory can be entered with a **cd** command. The job will exit with an error if this is not the case. Otherwise the command specified when the **at** command was issued will be run. Read the command as "move into /home/shs OR exit with the error shown".
注意，显示的命令首先测试是否可以通过 **cd** 命令输入用户目录。如果不是这种情况，作业将退出并出现错误。否则，将运行发出 **at** 目录时指定的命令。将命令读为 "move into /home/shs 或退出并显示错误"。

### Running jobs as root以 root 身份运行作业

To run **at** jobs as root, simply use **sudo** with your **at** command like this:
要以 root 身份运行 **at** 作业，只需将 **sudo** 与你的 **at** 命令一起使用，如下所示：

```
$ sudo at 8PM
[sudo] password for shs:
warning: commands will be executed using /bin/sh
at> reboot now
at> <EOT>
job 37 at Wed Apr  1 16:00:00 2020
```

Notice that the root task shows up in the queue with **root** as the one to execute it.
注意，根任务以 **root** 作为执行任务显示在队列中。

```
35      Mon Apr  6 12:00:00 2020 a shs
36      Tue Dec 27 12:00:00 2022 a shs
37      Wed Apr  1 20:00:00 2020 a root         <==
```

### 运行脚本

You can also use the **at** command to run scripts. Here's an example:
你可以使用 **at** 命令来运行脚本，这是一个例子：

```
$ at 4:30PM
warning: commands will be executed using /bin/sh
at> bin/tryme
at> <EOT>
```

### Denying use of the at command 拒绝使用 at 命令

The **/etc/at.deny** file provides a way to disallow users from being able to make use of the **at** command. By default, it will probably include a list of disallowed accounts like **ftp** and **nobody**. An **/etc/at.allow** file could be used to do the opposite but, generally, only the **at.deny** file is configured.
**/etc/at.deny** 文件提供了一种禁止用户使用 **at** 命令的方法。默认情况下，它可能会包含不允许的账户列表，例如 ftp 和 nobody。可以使用 **/etc/at.allow** 文件执行相反的操作，但是通常只配置 **at.deny** 文件。

**总结**

The **at** command is very versatile and easy to use when you want to schedule a one-time task – even if you want it to run this afternoon or years in the future.
当你要计划一项一次性任务时，即使你希望在今天下午或将来运行该任务，**at** 命令也非常通用且易于使用。

Join the Network World communities on [Facebook][2] and [LinkedIn][3] to comment on topics that are top of mind.
加入 [Facebook][2] 和 [LinkedIn][3] 上的网络世界社区，评论最火的主题。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3535808/scheduling-tasks-on-linux-using-the-at-command.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/blog/itaas-and-the-corporate-storage-technology/?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE22140&utm_content=sidebar (ITAAS and Corporate Storage Strategy)
[2]: https://www.facebook.com/NetworkWorld/
[3]: https://www.linkedin.com/company/network-world
