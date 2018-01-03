translating by lujun9972
How To Display Date And Time In History Command
======
We all are familiar with History command. It stores/keep all the commands executed by bash in terminal into `.bash_history` file, which will help us to recheck the previously executed commands by user for further investigation.

By default history command shows only the commands executed by users and it doesn't print the date and time but it logs the time when you ran a command.

Whenever you run history command, it looks for an environment variable called `HISTTIMEFORMAT`, which tells how to format date & time with history command.

If the value is null or not set then it will shows default results like how most of the systems shows (Without date and time).

HISTTIMEFORMAT takes values from strftime (strftime - convert date and time to a string). When you have date and time in history command output, it might help you to track the issue easily.

  * **%T :** Replaced by the time ( %H : %M : %S ).
  * **%F :** Equivalent to %Y - %m - %d (the ISO 8601:2000 standard date format).



See below default history command output.
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

We can set this environment variable in three ways based on our requirements.

  * Temporarily to current user
  * Permanently to current/other user
  * Permanently to all users



**Note :** Don 't forget to add space before the last single-quotes, otherwise the output would be messy.

### Method-1 :

Run the following command to set HISTTIMEFORMAT variable temporarily to current user. This will go away after reboot.
```
# export HISTTIMEFORMAT='%F %T '

```

### Method-2 :

Append following HISTTIMEFORMAT variable to `.bashrc` or `.bash_profile` file to make it permanent for every user.
```
# echo 'HISTTIMEFORMAT="%F %T "' >> ~/.bashrc
or
# echo 'HISTTIMEFORMAT="%F %T "' >> ~/.bash_profile

```

Run the following command to to effect the changes made to the file.
```
# source ~/.bashrc
or
# source ~/.bash_profile

```

### Method-3 :

Append following HISTTIMEFORMAT variable to `/etc/profile` file to make it permanent to all users.
```
# echo 'HISTTIMEFORMAT="%F %T "' >> /etc/profile

```

Run the following command to to effect the changes made to the file.
```
# source /etc/profile

```

See the sample output.
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
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/2daygeek/
