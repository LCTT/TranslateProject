First 5 Commands When I Connect on a Linux Server
============================================================

 ![First 5 shell commands I type when I connect to a linux server](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/first-5-commands_0.jpg?itok=sITDZBzw "First 5 shell commands I type when I connect to a linux server") 
[Creative Commons Attribution][1][Sylvain Kalache][2][First 5 shell commands I type when I connect to a linux server][3]

After half a decade working as a system administrator/SRE, I know where to start when I am connecting to a Linux server. There is a set of information that you must know about the server in order to properly, well most of the time, debug it.

### First 60 seconds on a Linux server

These commands are well known for experienced software engineers but I realized that for a beginner who is getting started with Linux systems, such as my students at [Holberton School][5], it is not obvious. That’s why I decided to share the list of the first 5 commands I type when I connect on a Linux server.

```
w
history
top
df
netstat
```

These 5 commands are shipped with any Linux distribution so you can use them everywhere without extra installation needed.

### w:

```
[ubuntu@ip-172-31-48-251 ~]$ w
23:40:25 up 273 days, 20:52,  2 users,  load average: 0.33, 0.14, 0.12
USER     TTY      FROM              LOGIN@   IDLE   JCPU   PCPU WHAT
ubuntu pts/0    104-7-14-91.ligh 23:39    0.00s  0.02s  0.00s w
root pts/1    104-7-14-91.ligh 23:40    5.00s  0.01s  0.03s sshd: root [priv]
[ubuntu@ip-172-31-48-251 ~]$ 
```

A lot of great information in there. First, you can see the server [uptime][6] which is the time during which the server has been continuously running. You can then see what users are connected on the server, quite useful when you want to make sure that you are not impacting a colleague’s work. Finally the [load average][7] will give you a good sense of the server health.

### history:

```
[ubuntu@ip-172-31-48-251 ~]$ history
   1  cd /var/app/current/log/
   2  ls -al
   3  tail -n 3000 production.log 
   4  service apache2 status
   5  cat ../../app/services/discourse_service.rb 
```

`History` will tell you what was previously run by the user you are currently connected to. You will learn a lot about what type work was previously performed on the machine, what could have gone wrong with it, and where you might want to start your debugging work.

### top:

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

The next information you want to know: what is currently running on this server. With `top` you can see all running processes, then order them by CPU, memory utilization and catch the ones that are resource intensive.

### df:

```
[ubuntu@ip-172-31-48-251 ~]$ df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/xvda1      7.8G  4.5G  3.3G  58% /
devtmpfs        1.9G   12K  1.9G   1% /dev
tmpfs           1.9G     0  1.9G   0% /dev/shm
```

The next important resource that your server needs to have to be working properly is disk space. Running out of it is a very classic issue.

### netstat:

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

Computers are a big part of our world now because they have the ability to communicate between each other via sockets. It is critical for you to know on what port and IP your server is listening on and what processes are using those.

Obviously this list might change depending on your goal and the amount of existing information you have. For example, when you want to debug specifically for performance, [Netflix came up with a customized list][8]. Do you have a useful command that is not in my top 5? Please share it in the comments section!

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/first-5-commands-when-i-connect-linux-server

作者：[SYLVAIN KALACHE ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
