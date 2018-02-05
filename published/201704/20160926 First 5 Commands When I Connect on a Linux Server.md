连接到 Linux 服务器时首先要运行的 5 个命令
============================================================

 ![当我连接到 Linux 服务器时运行的前 5 个命令](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/first-5-commands_0.jpg?itok=sITDZBzw "当我连接到 Linux 服务器时运行的前 5 个命令") 

[Creative Commons Attribution][1][Sylvain Kalache][2][当我连接到 Linux 服务器时运行的前 5 个命令][3]

作为一个系统管理员/SRE 工作 5 年后，我知道当我连接到一台 Linux 服务器时我首先应该做什么。这里有一系列关于服务器你必须了解的信息，以便你可以（在大部分时间里）更好的调试该服务器。

### 连上 Linux 服务器的第一分钟

这些命令对于有经验的软件工程师来说都非常熟悉，但我意识到对于一个刚开始接触 Linux 系统的初学者来说，例如我在 [Holberton 学校][5]任教的学生，却并非如此。这也是我为什么决定分享当我连上 Linux 服务器首先要运行的前 5 个命令的原因。

```
w
history
top
df
netstat
```

这 5 个命令在任何一个 Linux 发行版中都有，因此不需要额外的安装步骤你就可以直接使用它们。

### w:

```
[ubuntu@ip-172-31-48-251 ~]$ w
23:40:25 up 273 days, 20:52,  2 users,  load average: 0.33, 0.14, 0.12
USER     TTY      FROM              LOGIN@   IDLE   JCPU   PCPU WHAT
ubuntu pts/0    104-7-14-91.ligh 23:39    0.00s  0.02s  0.00s w
root pts/1    104-7-14-91.ligh 23:40    5.00s  0.01s  0.03s sshd: root [priv]
[ubuntu@ip-172-31-48-251 ~]$ 
```

这里列出了很多有用的信息。首先，你可以看到服务器运行时间 [uptime][6]，也就是服务器持续运行的时间。然后你可以看到有哪些用户连接到了服务器，当你要确认你没有影响你同事工作的时候这非常有用。最后 [load average][7] 能很好的向你展示服务器的健康状态。

### history

```
[ubuntu@ip-172-31-48-251 ~]$ history
   1  cd /var/app/current/log/
   2  ls -al
   3  tail -n 3000 production.log 
   4  service apache2 status
   5  cat ../../app/services/discourse_service.rb 
```

`history` 能告诉你当前连接的用户之前运行了什么命令。你可以看到很多关于这台机器之前在执行什么类型的任务、可能出现了什么错误、可以从哪里开始调试工作等信息。

### top

```
top - 23:47:54 up 273 days, 21:00,  2 users,  load average: 0.02, 0.07, 0.10
Tasks:  79 total,   2 running,  77 sleeping,   0 stopped,   0 zombie
Cpu(s):  1.0%us,  0.0%sy,  0.0%ni, 98.7%id,  0.0%wa,  0.0%hi,  0.0%si,  0.3%st
Mem:   3842624k total,  3128036k used,   714588k free,   148860k buffers
Swap:        0k total,        0k used,        0k free,  1052320k cached

 PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND                                                                                                                                                                                                                      
21095 root      20   0  513m  21m 4980 S  1.0  0.6   1237:05 python                                                                                                                                                                                                                        
1380 healthd   20   0  669m  36m 5712 S  0.3  1.0 265:43.82 ruby                                                                                                                                                                                                                          
19703 dd-agent  20   0  142m  25m 4912 S  0.3  0.7  11:32.32 python                                                                                                                                                                                                                        
   1 root      20   0 19596 1628 1284 S  0.0  0.0   0:10.64 init                                                                                                                                                                                                                          
   2 root      20   0     0    0    0 S  0.0  0.0   0:00.00 kthreadd                                                                                                                                                                                                                      
   3 root      20   0     0    0    0 S  0.0  0.0  27:31.42 ksoftirqd/0                                                                                                                                                                                                                   
   4 root      20   0     0    0    0 S  0.0  0.0   0:00.00 kworker/0:0                                                                                                                                                                                                                   
   5 root       0 -20     0    0    0 S  0.0  0.0   0:00.00 kworker/0:0H                                                                                                                                                                                                                  
   7 root      20   0     0    0    0 S  0.0  0.0  42:51.60 rcu_sched                                                                                                                                                                                                                     
   8 root      20   0     0    0    0 S  0.0  0.0   0:00.00 rcu_bh
```

你想知道的下一个信息：服务器当前在执行什么工作。使用 `top` 命令你可以看到所有正在执行的进程，然后可以按照 CPU、内存使用进行排序，并找到占用资源的进程。

### df

```
[ubuntu@ip-172-31-48-251 ~]$ df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/xvda1      7.8G  4.5G  3.3G  58% /
devtmpfs        1.9G   12K  1.9G   1% /dev
tmpfs           1.9G     0  1.9G   0% /dev/shm
```

你服务器正常工作需要的下一个重要资源就是磁盘空间。磁盘空间消耗完是非常典型的问题。

### netstat

```
[ubuntu@ip-172-31-48-251 ec2-user]# netstat -lp
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address               Foreign Address             State       PID/Program name   
tcp        0      0 *:http                      *:*                         LISTEN      1637/nginx          
tcp        0      0 *:ssh                       *:*                         LISTEN      1209/sshd           
tcp        0      0 localhost:smtp              *:*                         LISTEN      1241/sendmail       
tcp        0      0 localhost:17123             *:*                         LISTEN      19703/python        
tcp        0      0 localhost:22221             *:*                         LISTEN      1380/puma 2.11.1 (t 
tcp        0      0 *:4242                      *:*                         LISTEN      18904/jsvc.exec     
tcp        0      0 *:ssh                       *:*                         LISTEN      1209/sshd           
```

计算机已成为我们世界的重要一部分，因为它们有通过网络进行相互交流的能力。知道你的服务器正在监听什么端口、IP地址是什么、以及哪些进程在使用它们，这对于你来说都非常重要。

显然这个列表会随着你的目的和你已有的信息而变化。例如，当你需要调试性能的时候，[Netflix 就有一个自定义的列表][8]。你有任何不在我 Top 5 中的有用命令吗？在评论部分和我们一起分享吧！

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/first-5-commands-when-i-connect-linux-server

作者：[SYLVAIN KALACHE][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/sylvainkalache
[1]:https://www.linux.com/licenses/category/creative-commons-attribution
[2]:https://twitter.com/sylvainkalache
[3]:https://www.flickr.com/photos/sylvainkalache/29587668230/in/dateposted/
[4]:https://www.linux.com/files/images/first-5-commandsjpg-0
[5]:https://www.holbertonschool.com/
[6]:http://whatis.techtarget.com/definition/uptime-and-downtime
[7]:http://blog.scoutapp.com/articles/2009/07/31/understanding-load-averages
[8]:http://techblog.netflix.com/2015/11/linux-performance-analysis-in-60s.html
