让 history 命令显示日期和时间
======

我们都对 `history` 命令很熟悉。它将终端上 bash 执行过的所有命令存储到 `.bash_history` 文件中，来帮助我们复查用户之前执行过的命令。

默认情况下 `history` 命令直接显示用户执行的命令而不会输出运行命令时的日期和时间，即使 `history` 命令记录了这个时间。

运行 `history` 命令时，它会检查一个叫做 `HISTTIMEFORMAT` 的环境变量，这个环境变量指明了如何格式化输出 `history` 命令中记录的这个时间。

若该值为 null 或者根本没有设置，则它跟大多数系统默认显示的一样，不会显示日期和时间。

`HISTTIMEFORMAT` 使用 `strftime` 来格式化显示时间（`strftime` - 将日期和时间转换为字符串）。`history` 命令输出日期和时间能够帮你更容易地追踪问题。

* `%T`： 替换为时间（`%H:%M:%S`）。
* `%F`： 等同于 `%Y-%m-%d` （ISO 8601:2000 标准日期格式）。

下面是 `history` 命令默认的输出。

```
# history
 1 yum install -y mysql-server mysql-client
 2 service mysqld start
 3 sysdig proc.name=sshd
 4 sysdig -c topprocs_net
 5 sysdig proc.name=sshd
 6 sysdig proc.name=sshd | more
 7 sysdig fd.name=/var/log/auth.log | more
 8 sysdig fd.name=/var/log/mysqld.log
 9 sysdig -cl
 10 sysdig -i httplog
 11 sysdig -i proc_exec_time
 12 sysdig -i topprocs_cpu
 13 sysdig -c topprocs_cpu
 14 sysdig -c tracers_2_statsd
 15 sysdig -c topfiles_bytes
 16 sysdig -c topprocs_cpu
 17 sysdig -c topprocs_cpu "fd.name contains sshd"
 18 sysdig -c topprocs_cpu "proc.name contains sshd"
 19 csysdig
 20 sysdig -c topprocs_cpu
 21 rpm --import https://s3.amazonaws.com/download.draios.com/DRAIOS-GPG-KEY.public
 22 curl -s -o /etc/yum.repos.d/draios.repo http://download.draios.com/stable/rpm/draios.repo
 23 yum install -y epel-release
 24 yum update
 25 yum makecache
 26 yum -y install kernel-devel-$(uname -r)
 27 yum -y install sysdig
 28 sysdig
 29 yum install httpd mysql
 30 service httpd start
```

根据需求，有三种不同的设置环境变量的方法。

* 临时设置当前用户的环境变量
* 永久设置当前/其他用户的环境变量
* 永久设置所有用户的环境变量

**注意：** 不要忘了在最后那个单引号前加上空格，否则输出会很混乱的。

### 方法 1：

运行下面命令为为当前用户临时设置 `HISTTIMEFORMAT` 变量。这会一直生效到下次重启。

```
# export HISTTIMEFORMAT='%F %T '
```

### 方法 2：

将 `HISTTIMEFORMAT` 变量加到 `.bashrc` 或 `.bash_profile` 文件中，让它永久生效。

```
# echo 'HISTTIMEFORMAT="%F %T "' >> ~/.bashrc
或
# echo 'HISTTIMEFORMAT="%F %T "' >> ~/.bash_profile
```

运行下面命令来让文件中的修改生效。

```
# source ~/.bashrc
或
# source ~/.bash_profile

```

### 方法 3：

将 `HISTTIMEFORMAT` 变量加入 `/etc/profile` 文件中，让它对所有用户永久生效。

```
# echo 'HISTTIMEFORMAT="%F %T "' >> /etc/profile
```

运行下面命令来让文件中的修改生效。

```
# source /etc/profile
```

输出结果为：

```
# history
 1 2017-08-16 15:30:15 yum install -y mysql-server mysql-client
 2 2017-08-16 15:30:15 service mysqld start
 3 2017-08-16 15:30:15 sysdig proc.name=sshd
 4 2017-08-16 15:30:15 sysdig -c topprocs_net
 5 2017-08-16 15:30:15 sysdig proc.name=sshd
 6 2017-08-16 15:30:15 sysdig proc.name=sshd | more
 7 2017-08-16 15:30:15 sysdig fd.name=/var/log/auth.log | more
 8 2017-08-16 15:30:15 sysdig fd.name=/var/log/mysqld.log
 9 2017-08-16 15:30:15 sysdig -cl
 10 2017-08-16 15:30:15 sysdig -i httplog
 11 2017-08-16 15:30:15 sysdig -i proc_exec_time
 12 2017-08-16 15:30:15 sysdig -i topprocs_cpu
 13 2017-08-16 15:30:15 sysdig -c topprocs_cpu
 14 2017-08-16 15:30:15 sysdig -c tracers_2_statsd
 15 2017-08-16 15:30:15 sysdig -c topfiles_bytes
 16 2017-08-16 15:30:15 sysdig -c topprocs_cpu
 17 2017-08-16 15:30:15 sysdig -c topprocs_cpu "fd.name contains sshd"
 18 2017-08-16 15:30:15 sysdig -c topprocs_cpu "proc.name contains sshd"
 19 2017-08-16 15:30:15 csysdig
 20 2017-08-16 15:30:15 sysdig -c topprocs_cpu
 21 2017-08-16 15:30:15 rpm --import https://s3.amazonaws.com/download.draios.com/DRAIOS-GPG-KEY.public
 22 2017-08-16 15:30:15 curl -s -o /etc/yum.repos.d/draios.repo http://download.draios.com/stable/rpm/draios.repo
 23 2017-08-16 15:30:15 yum install -y epel-release
 24 2017-08-16 15:30:15 yum update
 25 2017-08-16 15:30:15 yum makecache
 26 2017-08-16 15:30:15 yum -y install kernel-devel-$(uname -r)
 27 2017-08-16 15:30:15 yum -y install sysdig
 28 2017-08-16 15:30:15 sysdig
 29 2017-08-16 15:30:15 yum install httpd mysql
 30 2017-08-16 15:30:15 service httpd start
```
--------------------------------------------------------------------------------

via: https://www.2daygeek.com/display-date-time-linux-bash-history-command/

作者：[2daygeek][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/2daygeek/
