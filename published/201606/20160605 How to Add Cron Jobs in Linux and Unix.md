如何在 Linux 及 Unix 系统中添加定时任务
======================================

![](https://www.unixmen.com/wp-content/uploads/2016/05/HOW-TO-ADD-CRON-JOBS-IN-LINUX-AND-UNIX-696x334.png)

### 导言

![](http://www.unixmen.com/wp-content/uploads/2016/05/cronjob.gif)

定时任务 (cron job) 被用于安排那些需要被周期性执行的命令。利用它，你可以配置某些命令或者脚本，让它们在某个设定的时间周期性地运行。`cron` 是 Linux 或者类 Unix 系统中最为实用的工具之一。cron 服务（守护进程）在系统后台运行，并且会持续地检查 `/etc/crontab` 文件和 `/etc/cron.*/ `目录。它同样也会检查 `/var/spool/cron/` 目录。

### crontab 命令

`crontab` 是用来安装、卸载或者列出定时任务列表的命令。cron 配置文件则用于驱动 `Vixie Cron` 的 [cron(8)][1] 守护进程。每个用户都可以拥有自己的 crontab 文件，虽然这些文件都位于 `/var/spool/cron/crontabs` 目录中，但并不意味着你可以直接编辑它们。你需要通过 `crontab` 命令来编辑或者配置你自己的定时任务。

### 定时配置文件的类型

配置文件分为以下不同的类型：

- **UNIX 或 Linux 系统的 crontab** : 此类型通常由那些需要 root 或类似权限的系统服务和重要任务使用。第六个字段（见下方的字段介绍）为用户名，用来指定此命令以哪个用户身份来执行。如此一来，系统的 `crontab` 就能够以任意用户的身份来执行操作。

- **用户的 crontab**: 用户可以使用 `crontab` 命令来安装属于他们自己的定时任务。 第六个字段为需要运行的命令, 所有的命令都会以创建该 crontab 任务的用户的身份运行。

**注意**: 这种问答形式的 `Cron` 实现由 Paul Vixie 所编写，并且被包含在许多 [Linux][2] 发行版本和类 Unix 系统（如广受欢迎的第四版 BSD）中。它的语法被各种 crond 的实现所[兼容][3]。

那么我该如何安装、创建或者编辑我自己的定时任务呢？

要编辑你的 crontab 文件，需要在 Linux 或 Unix 的 shell 提示符后键入以下命令：

```
$ crontab -e
```

`crontab` 语法（字段介绍）

语法为：

```
1 2 3 4 5 /path/to/command arg1 arg2
```

或者

```
1 2 3 4 5 /root/ntp_sync.sh
```

其中：

- 第1个字段：分钟 (0-59)
- 第2个字段：小时 (0-23)
- 第3个字段：日期 (0-31)
- 第4个字段：月份 (0-12 [12 代表 December])
- 第5个字段：一周当中的某天 (0-7 [7 或 0 代表星期天])
- /path/to/command - 计划执行的脚本或命令的名称

便于记忆的格式：

```
* * * * * 要执行的命令
----------------
| | | | |
| | | | ---- 周当中的某天 (0 - 7) (周日为 0 或 7)
| | | ------ 月份 (1 - 12)
| | -------- 一月当中的某天 (1 - 31)
| ---------- 小时 (0 - 23)
------------ 分钟 (0 - 59)
```

简单的 `crontab` 示例：
 
````
## 每隔 5 分钟运行一次 backupscript 脚本 ##
*/5 * * * * /root/backupscript.sh

## 每天的凌晨 1 点运行 backupscript 脚本 ##

0 1 * * * /root/backupscript.sh

## 每月的第一个凌晨 3:15 运行 backupscript 脚本 ##

15 3 1 * * /root/backupscript.sh
```

### 如何使用操作符

操作符允许你为一个字段指定多个值，这里有三个操作符可供使用：

- **星号 (*)** : 此操作符为字段指定所有可用的值。举个例子，在小时字段中，一个星号等同于每个小时；在月份字段中，一个星号则等同于每月。

- **逗号 (,)** : 这个操作符指定了一个包含多个值的列表，例如：`1,5,10,15,20,25`.

- **横杠 (-)** : 此操作符指定了一个值的范围，例如：`5-15` ，等同于使用逗号操作符键入的 `5,6,7,8,9,...,13,14,15`。

- **分隔符 (/)** : 此操作符指定了一个步进值，例如： `0-23/` 可以用于小时字段来指定某个命令每小时被执行一次。步进值也可以跟在星号操作符后边，如果你希望命令行每 2 小时执行一次，则可以使用 `*/2`。

### 如何禁用邮件输出

默认情况下，某个命令或者脚本的输出内容（如果有的话）会发送到你的本地邮箱账户中。若想停止收到 `crontab` 发送的邮件，需要添加 `>/dev/null 2>&1` 这段内容到执行的命令的后面，例如：

```
0 3 * * * /root/backup.sh >/dev/null 2>&1
```

如果想将输出内容发送到特定的邮件账户中，比如说 vivek@nixcraft.in 这个邮箱， 则你需要像下面这样定义一个 MAILTO 变量：

```
MAILTO="vivek@nixcraft.in"
0 3 * * * /root/backup.sh >/dev/null 2>&1
```

访问 “[禁用 Crontab 命令的邮件提示](http://www.cyberciti.biz/faq/disable-the-mail-alert-by-crontab-command/)” 查看更多信息。


### 任务：列出你所有的定时任务

键入以下命令：

```
# crontab -l
# crontab -u username -l
```

要删除所有的定时任务，可以使用如下命令：

```
# 删除当前定时任务 #
crontab -r
```

```
## 删除某用户名下的定时任务，此命令需以 root 用户身份执行 ##
crontab -r -u username
```

### 使用特殊字符串来节省时间

你可以使用以下 8 个特殊字符串中的其中一个替代头五个字段，这样不但可以节省你的时间，还可以提高可读性。

特殊字符  		|含义
|:--            |:--
@reboot	        | 在每次启动时运行一次
@yearly	        | 每年运行一次,等同于  “0 0 1 1 *”.
@annually	    | (同 @yearly)
@monthly	    | 每月运行一次, 等同于 “0 0 1 * *”.
@weekly	        | 每周运行一次, 等同于 “0 0 * * 0”.
@daily	        | 每天运行一次, 等同于 “0 0 * * *”.
@midnight	    | (同 @daily)
@hourly	        | 每小时运行一次, 等同于 “0 * * * *”.

示例：

#### 每小时运行一次 ntpdate 命令 ####

```
@hourly /path/to/ntpdate
```
 
### 关于 `/etc/crontab` 文件和 `/etc/cron.d/*` 目录的更多内容

** /etc/crontab ** 是系统的 crontab 文件。通常只被 root 用户或守护进程用于配置系统级别的任务。每个独立的用户必须像上面介绍的那样使用 `crontab` 命令来安装和编辑自己的任务。`/var/spool/cron/` 或者 `/var/cron/tabs/` 目录存放了个人用户的 crontab 文件，它必定会备份在用户的家目录当中。

###理解默认的 `/etc/crontab` 文件

典型的 `/etc/crontab` 文件内容是这样的：

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

首先，环境变量必须被定义。如果 SHELL 行被忽略，cron 会使用默认的 sh shell。如果 PATH 变量被忽略，就没有默认的搜索路径，所有的文件都需要使用绝对路径来定位。如果 HOME 变量被忽略，cron 会使用调用者（用户）的家目录替代。

另外，cron 会读取 `/etc/cron.d/`目录中的文件。通常情况下，像 sa-update 或者 sysstat 这样的系统守护进程会将他们的定时任务存放在此处。作为 root 用户或者超级用户，你可以使用以下目录来配置你的定时任务。你可以直接将脚本放到这里。`run-parts`命令会通过 `/etc/crontab` 文件来运行位于某个目录中的脚本或者程序。

目录	          		|描述
|:--                |:--
/etc/cron.d/	    | 将所有的脚本文件放在此处，并从 /etc/crontab 文件中调用它们。
/etc/cron.daily/	| 运行需要 每天   运行一次的脚本
/etc/cron.hourly/	| 运行需要 每小时 运行一次的脚本
/etc/cron.monthly/	| 运行需要 每月   运行一次的脚本
/etc/cron.weekly/	| 运行需要 每周   运行一次的脚本
 
### 备份定时任务

```
# crontab -l > /path/to/file

# crontab -u user -l > /path/to/file
```

--------------------------------------------------------------------------------

via: https://www.unixmen.com/add-cron-jobs-linux-unix/

作者：[Duy NguyenViet][a]
译者：[mr-ping](https://github.com/mr-ping)
校对：[FSSlc](https://github.com/FSSlc)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.unixmen.com/author/duynv/
[1]: http://www.manpager.com/linux/man8/cron.8.html
[2]: http://www.linuxsecrets.com/
[3]: http://www.linuxsecrets.com/linux-hardware/