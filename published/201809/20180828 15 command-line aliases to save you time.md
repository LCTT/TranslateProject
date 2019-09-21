15 个可以节省你时间的命令别名
======
> 在你安装的 Linux 发行版中默认就包含了一些别名。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_keyboard_laptop_development_blue.png?itok=IfckxN48)

Linux 命令行别名非常适合帮助你提高工作效率。更好的是，在你安装的 Linux 发行版中默认就包含了一些别名。

这是 Fedora 27 中的命令别名的示例：

![](https://opensource.com/sites/default/files/uploads/default.png)

这个 `alias` 命令列出了已有的别名。设置别名也十分简单：

```
alias new_name="command"
```

这里有 15 个命令行别名，可以节省你的时间：

1、安装任何应用实用 / 应用程序：

```
alias install="sudo yum install -y"
```

在这里，根据每个用户的偏好，`sudo` 和 `-y` 是可选的：

![install alias.png][2]

2、更新系统：

```
alias update="sudo yum update -y"
```

3、升级系统：

```
alias upgrade="sudo yum upgrade -y"
```

4、切换 root 用户：

```
alias root="sudo su -"
```

5、切换到 “user” 用户, 其中 `user` 设置为你的用户名：

```
alias user="su user"
```

6、显示列出所有可用端口、状态还有 IP：

```
alias myip="ip -br -c a"
```

7、`ssh` 到你的服务器 `myserver`：

```
alias myserver="ssh user@my_server_ip”
```

8、列出系统中所有进程：

```
alias process="ps -aux"
```

9、检查系统的服务状态：

```
alias sstatus="sudo systemctl status"
```

10、重启系统服务：

```
alias srestart="sudo systemctl restart"
```

11、按名称杀死进程：

```
alias kill="sudo pkill"
```

![kill process alias.png][4]

12、显示系统系统总使用内存和空闲内存 ：

```
alias mem="free -h"
```

13、显示系统 CPU 框架结构、CPU 数量、线程数等：

```
alias cpu="lscpu"
```

14、显示系统总磁盘大小：

```
alias disk="df -h"
```

15、显示当前系统 Linux 发行版本（适用于 CentOS、Fedora 和 Red Hat)：

```
alias os="cat /etc/redhat-release"
```

![system_details alias.png][6]


--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/time-saving-command-line-aliases

作者：[Aarchit Modi][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[MZqk](https://github.com/MZqk)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux 中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/architmodi
[2]:https://opensource.com/sites/default/files/uploads/install.png (install alias.png)
[4]:https://opensource.com/sites/default/files/uploads/kill.png (kill process alias.png)
[6]:https://opensource.com/sites/default/files/uploads/system_details.png (system_details alias.png)
