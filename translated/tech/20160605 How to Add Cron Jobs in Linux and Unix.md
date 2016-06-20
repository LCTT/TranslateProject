如何在Linux及Unix系统中添加定时任务
======================================


![](https://www.unixmen.com/wp-content/uploads/2016/05/HOW-TO-ADD-CRON-JOBS-IN-LINUX-AND-UNIX-696x334.png)

### 导言

![](http://www.unixmen.com/wp-content/uploads/2016/05/cronjob.gif)

定时任务是用来定期执行计划命令的。你可以将命令组织到脚本当中，这样就可以在设定的时间将其重复执行。`Cron`是Linux系统或者类Unix系统当中最为实用的工具之一。定时服务（守护进程）在系统后台运行，并且会持续地检查 /etc/crontab 文件和 /etc/cron.*/ 目录。它同样也会检测 /var/spool/cron/ 目录。


### crontab 命令

`crontab`是用来安装、卸载或者列出定时配置文件列表的命令。定时配置文件则用于驱动`Vixie Cron`的[cron(8)][1]守护进程。每个用户都可以拥有自己的 crontab 文件，虽然这些文件位于 /var/spool/cron/crontabs 目录中，但这并不意味着你可以直接编辑它们。你需要通过`crontab`命令来编辑或者配置自己的定时任务。


### 定时配置文件的类型

配置文件分为以下不同的类型：

- **UNIX 或 Linux 系统的 crontab** : 此类型通常由类似需要root权限的系统服务或重要任务使用。第六个字段（见下方的字段介绍）为用户名，用来指定此命令以哪个用户身份来执行。如此一来，系统的`crontab`就能够以任意用户的身份来执行操作。

- **用户的 crontabs**: 用户可以使用`corntab`命令来安装属于他们自己的定时任务。 第六个字段为需要运行的命令行, 所有的命令行都会以创建 crontab 的用户的身份运行。

**Note**: This faq features cron implementations written by Paul Vixie and included in many [Linux][2] distributions and Unix like systems such as in the popular 4th BSD edition. The syntax is [compatible][3] with various implementations of crond.

**注意**: 这种问答形式的`Cron`实现是由 Paul Vixie 所写的，并且被许多 [Linux][2] 发行版和类Unix系统（如广受欢迎的第四版BSD）包含其中。它的语法被各种计划任务的实现所[兼容][3]。

该如何安装、创建或编辑我们自己的定时任务呢？

在 Linux 或 Unix 的shell提示符后键入以下命令来编辑你的 crontab 文件。

```
$ crontab -e
```

`crontab`语法（字段介绍）：

语法为：

```
1 2 3 4 5 /path/to/command arg1 arg2
```

或者

```
1 2 3 4 5 /root/ntp_sync.sh
```

说明：

- 1: 分钟 (0-59)
- 2: 小时 (0-23)
- 3: 日期 (0-31)
- 4: 月份 (0-12 [12 == December])
- 5: 一周当中的某天 (0-7 [7 或 0 == 周日])
- /path/to/command – 计划执行的脚本或命令名

便于记忆的格式：

```
* * * * * command to be executed
– – – – –
| | | | |
| | | | —– 一周当中的某天 (0 – 7) (周日=0 or 7)
| | | ——- 月份 (1 – 12)
| | ——— 一月当中的某天 (1 – 31)
| ———– 小时 (0 – 23)
————- 分钟 (0 – 59)
```

简单的`crontab`示例：
 
````
## 每隔5分钟运行一次 backupscript 脚本##
*/5 * * * * /root/backupscript.sh

## 每天的上午1:00运行 backupscript 脚本 ##

0 1 * * * /root/backupscript.sh

## 每月的第一个上午3:15 运行 backupscript 脚本 ##

15 3 1 * * /root/backupscript.sh
```


### 如何使用操作符

操作符允许你为一个字段指定多个值，这里有三个操作符可供使用：

- **星号 (*)** : 此操作符为字段指定所有可用的值。举个例子，在小时字段中，一个星号等同于所有可用的hour值；在月份字段中，一个星号表示所有可用的month值。

- **逗号 (,)** : 这个操作符指定了一个包含多个值的列表，例如：`1,5,10,15,20, 25`.

- **横杠 (–)** : 此操作符指定了一个值的范围，例如：`5-15` 天，等同于使用逗号操作符键入的 `5,6,7,8,9,….,13,14,15`。

- **分隔符 (/)** : 此操作符指定了一个步进值，例如： `0-23/` 可以用于小时字段来指定命令行每小时执行一次。步进值也可以跟在星号操作符后边，如果你希望命令行每2小时执行一次，可以这样写 `*/2`。


### 使用特殊字符保存时间

你可以使用以下8个特殊字符中的其中一个替代头五个字段。这样不但可以保存时间，也可以提高可读性。

特殊字符  |	含义
|:--            |:--
@reboot	        | 在每次启动时运行一次
@yearly	        | 每年运行一次, “0 0 1 1 *”.
@annually	      | (同 @yearly)
@monthly	      | 每月运行一次, “0 0 1 * *”.
@weekly	        | 每周运行一次, “0 0 * * 0”.
@daily	        | 每天运行一次, “0 0 * * *”.
@midnight	      | (同 @daily)
@hourly	        | 每小时运行一次, “0 * * * *”.
 

示例：

```
#### 每小时运行一次 ntpdate ####

@hourly /path/to/ntpdate
```
 

### 关于 /etc/crontab file 和 /etc/cron.d/* 目录的更多内容

/etc/crontab 是系统的 corntabs 文件。通常用于root用户和守护进程配置整个系统的任务。每个独立的用户务必遵照以上的介绍，使用`corntab`命令来编辑自己的任务。/var/spool/cron/ 或者 /var/cron/tabs/ 目录存放了个人用户的 corntab 文件，它必定会备份在用户的home目录当中。

理解默认的 /etc/crontab

典型的 /etc/crontab 文件内容：

```
SHELL=/bin/bash
PATH=/sbin:/bin:/usr/sbin:/usr/bin
MAILTO=root
HOME=/
# run-parts
01 * * * * root run-parts /etc/cron.hourly
02 4 * * * root run-parts /etc/cron.daily
22 4 * * 0 root run-parts /etc/cron.weekly
42 4 1 * * root run-parts /etc/cron.monthly
```

首先，环境必须定义好。如果shell行被忽略了，corn会使用默认的sh shell。如果PATH变量被忽略，就没有默认路径会被使用，并且所有的文件都需要使用绝对路径来定位。如果HOME被忽略，corn会将调用者（用户）的home目录作为默认值使用。

另外，corn 会在/etc/cron.d/ 目录中读取文件。通常情况下，像 sa-update 或者 sysstat 这样的系统守护进程会将他们的定时任务存放在此处。作为root用户或者超级用户，你可以使用以下目录来配置你的定时任务。你可以直接将脚本放到这里。`run-parts`命令会通过 /etc/crontab 目录来运行脚本或者程序。

目录	          |介绍
|:--                |:--
/etc/cron.d/	      | 将所有的脚本文件放在此处，并从 /etc/crontab 文件中调用它们。
/etc/cron.daily/	  | 每天运行的所有的脚本
/etc/cron.hourly/	  | 每小时运行的所有脚本
/etc/cron.monthly/	| 每月运行的所有脚本
/etc/cron.weekly/	  | 每周运行的所有脚本
 

### 备份定时任务

```
# crontab -l > /path/to/file

# crontab -u user -l > /path/to/file
```

--------------------------------------------------------------------------------

via: https://www.unixmen.com/add-cron-jobs-linux-unix/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+unixmenhowtos+%28Unixmen+Howtos+%26+Tutorials%29

作者：[Duy NguyenViet][a]
译者：[mr-ping](https://github.com/mr-ping)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.unixmen.com/author/duynv/
[1]: http://www.manpager.com/linux/man8/cron.8.html
[2]: http://www.linuxsecrets.com/
[3]: http://www.linuxsecrets.com/linux-hardware/
