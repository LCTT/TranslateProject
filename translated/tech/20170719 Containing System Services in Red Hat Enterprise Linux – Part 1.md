# 红帽企业版 Linux 包含的系统服务 - 第一部分     

在 2017 年红帽峰会上，有几个人问我“我们通常用完整的虚拟机来隔离如 DSN 和 DHCP 等网络服务，那我们可以用容器来取而代之吗？”。答案是可以的，下面是在当前红帽企业版 Linux 7 系统上创建一个系统容器的例子。     
## **我们的目的**  
### *创建一个可以独立于任何其他系统服务来进行更新的网络服务，并且可以从主机端容易管理和更新。* 
让我们来探究在一个容器中建立一个运行在 systemd 之下的 BIND 服务器。在这一部分，我们将看到建立自己的容器以及管理 BIND 配置和数据文件。   
在第二部分，我们将看到主机中的 systemd 怎样和容器中的 systmed 整合。我们将探究管理容器中的服务，并且使它作为一种主机中的服务。     
## **创建 BIND 容器**   
为了使 systemd 在一个容器中容易运行，我们首先需要在主机中增加两个包:`oci-register-machine` 和 `oci-systemd-hook`。`oci-systemd-hook` 这个钩子允许我们在一个容器中运行 systemd，而不需要使用特权容器或者手工配置 tmpfs 和 cgroups。`oci-register-machine` 这个钩子允许我们使用 systemd 工具如 `systemctl` 和 `machinectl` 来跟踪容器。     

```
[root@rhel7-host ~]# yum install oci-register-machine oci-systemd-hook  
```   

回到创建我们的 BIND 容器上。[红帽企业版 Linux 7 基础映像](https://access.redhat.com/containers)包含 systemd 作为一个 init 系统。我们安装并激活 BIND 正如我们在典型系统中做的那样。你可以从资源库中的 [git 仓库中下载这份 Dockerfile](http://rhelblog.redhat.com/2017/07/19/containing-system-services-in-red-hat-enterprise-linux-part-1/#repo)。    

```
[root@rhel7-host bind]# vi Dockerfile

# Dockerfile for BIND
FROM registry.access.redhat.com/rhel7/rhel
ENV container docker
RUN yum -y install bind && \
    yum clean all && \
    systemctl enable named
STOPSIGNAL SIGRTMIN+3
EXPOSE 53
EXPOSE 53/udp
CMD [ "/sbin/init" ]  
```    

因为我们以 PID 1 来启动一个 init 系统，当我们告诉容器停止时，需要改变 docker CLI 发送的信号。从 `kill` 系统调用手册中(man 2 kill):      

```
The only signals that can be sent to process ID 1, the init 
process, are those for which init has explicitly installed 
signal handlers. This is done to assure the system is not 
brought down accidentally.
```    

对于 systemd 信号句柄，`SIGRTMIN+3`是对应于 `systemd start halt.target` 的信号。我们也应该暴露 TCP 和 UDP 端口号用来 BIND ，因为这两种协议可能都在使用中。   
## **管理数据**    
有了一个实用的 BIND 服务，我们需要一种管理配置和区域文件的方法。目前这些都在容器里面，所以我们任何时候都可以进入容器去更新配置或者改变一个区域文件。从管理者角度来说，这并不是很理想。当要更新 BIND 时，我们将需要重建这个容器，所以映像中的改变将会丢失。任何时候我们需要更新一个文件或者重启服务时，都需要进入这个容器，而这增加了步骤和时间。     
相反的，我们将从这个容器中提取配置和数据文件，把它们拷贝到主机，然后在运行的时候挂载它们。这种方式我们可以很容易地重启或者重建容器，而不会丢失做出的更改。我们也可以使用容器外的编辑器来更改配置和区域文件。因为这个容器的数据看起来像“该系统服务的特定站点数据”，让我们遵循文件系统层次并在当前主机上创建 `/srv/named` 目录来保持管理权分离。      

```
[root@rhel7-host ~]# mkdir -p /srv/named/etc

[root@rhel7-host ~]# mkdir -p /srv/named/var/named     
```     

 ***提示：如果你正在迁移一个存在的配置文件，你可以跳过下面的步骤并且将它直接拷贝到 `/srv/named` 目录下。你可能仍然想检查以一个临时容器分配给这个容器的 GID。***     
让我们建立并运行一个临时容器来检查 BIND。在将 init 进程作为 PID 1 运行时，我们不能交互地运行这个容器来获取一个 shell。我们会在容器 启动后执行 shell，并且使用 `rpm` 命令来检查重要文件。    

```
[root@rhel7-host ~]# docker build -t named . 

[root@rhel7-host ~]# docker exec -it $( docker run -d named ) /bin/bash

[root@0e77ce00405e /]# rpm -ql bind
```      

对于这个例子来说，我们将需要 `/etc/named.conf` 和 `/var/named/` 目录下的任何文件。我们可以使用 `machinectl` 命令来提取它们。如果有一个以上的容器注册了，我们可以使用 `machinectl status` 命令来查看任一机器上运行的是什么。一旦有了这个配置我们就可以终止这个临时容器了。   
*如果你喜欢，资源库中也有一个[样例 `named.conf` 和针对 `example.com` 的区域文件](http://rhelblog.redhat.com/2017/07/19/containing-system-services-in-red-hat-enterprise-linux-part-1/#repo)*      

```
[root@rhel7-host bind]# machinectl list

MACHINE                          CLASS     SERVICE
8824c90294d5a36d396c8ab35167937f container docker 

[root@rhel7-host ~]# machinectl copy-from 8824c90294d5a36d396c8ab35167937f /etc/named.conf /srv/named/etc/named.conf

[root@rhel7-host ~]# machinectl copy-from 8824c90294d5a36d396c8ab35167937f /var/named /srv/named/var/named

[root@rhel7-host ~]# docker stop infallible_wescoff
```     

## **最终的创建**     
为了创建和运行最终的容器，添加卷选项到挂载:   
- 将文件 `/srv/named/etc/named.conf` 映射为 `/etc/named.conf`  
- 将目录 `/srv/named/var/named` 映射为 `/var/named`  

因为这是我们最终的容器，我们将提供一个有意义的名字，以供我们以后引用。     
```
[root@rhel7-host ~]# docker run -d -p 53:53 -p 53:53/udp -v /srv/named/etc/named.conf:/etc/named.conf:Z -v /srv/named/var/named:/var/named:Z --name named-container named
```   

在最终容器运行时，我们可以更改本机配置来改变这个容器中 BIND 的行为。这个 BIND 服务器将需要在这个容器分配的任何 IP 上监听。确保任何新文件的 GID 与来自这个容器中的剩余 BIND 文件相匹配。   

```
[root@rhel7-host bind]# cp named.conf /srv/named/etc/named.conf 

[root@rhel7-host ~]# cp example.com.zone /srv/named/var/named/example.com.zone

[root@rhel7-host ~]# cp example.com.rr.zone  /srv/named/var/named/example.com.rr.zone
```    
> [很好奇为什么我不需要在主机目录中改变 SELinux 上下文？](http://rhelblog.redhat.com/2017/07/19/containing-system-services-in-red-hat-enterprise-linux-part-1/#sidebar_1)  

我们将运行这个容器提供的 `rndc` 二进制文件重新加载配置。我们可以使用 `journald` 以同样的方式检查 BIND 日志。如果运行出现错误，你可以在主机中编辑这个文件，并且重新加载配置。在主机中使用 `host` 或 `dig`, 我们可以检查来自针对 example.com 而包含的服务的响应。     
```
[root@rhel7-host ~]# docker exec -it named-container rndc reload       
server reload successful

[root@rhel7-host ~]# docker exec -it named-container journalctl -u named -n
-- Logs begin at Fri 2017-05-12 19:15:18 UTC, end at Fri 2017-05-12 19:29:17 UTC. --
May 12 19:29:17 ac1752c314a7 named[27]: automatic empty zone: 9.E.F.IP6.ARPA
May 12 19:29:17 ac1752c314a7 named[27]: automatic empty zone: A.E.F.IP6.ARPA
May 12 19:29:17 ac1752c314a7 named[27]: automatic empty zone: B.E.F.IP6.ARPA
May 12 19:29:17 ac1752c314a7 named[27]: automatic empty zone: 8.B.D.0.1.0.0.2.IP6.ARPA
May 12 19:29:17 ac1752c314a7 named[27]: reloading configuration succeeded
May 12 19:29:17 ac1752c314a7 named[27]: reloading zones succeeded
May 12 19:29:17 ac1752c314a7 named[27]: zone 1.0.10.in-addr.arpa/IN: loaded serial 2001062601
May 12 19:29:17 ac1752c314a7 named[27]: zone 1.0.10.in-addr.arpa/IN: sending notifies (serial 2001062601)
May 12 19:29:17 ac1752c314a7 named[27]: all zones loaded
May 12 19:29:17 ac1752c314a7 named[27]: running

[root@rhel7-host bind]# host www.example.com localhost
Using domain server:
Name: localhost
Address: ::1#53
Aliases: 
www.example.com is an alias for server1.example.com.
server1.example.com is an alias for mail
```    
> [你的区域文件没有更新吗？可能是因为你的编辑器，而不是序列号。](http://rhelblog.redhat.com/2017/07/19/containing-system-services-in-red-hat-enterprise-linux-part-1/#sidebar_2)      

## **终点线**    

我们已经知道我们打算完成什么。从容器中为 DNS 请求和区域文件提供服务。更新之后，我们已经得到一个持久化的位置来管理更新和配置。    
在这个系列的第二部分，我们将看到怎样将一个容器看作为主机中的一个普通服务。        

---   

[跟随 RHEL 博客](http://redhatstackblog.wordpress.com/feed/)通过电子邮件来获得本系列第二部分和其它新文章的更新。     

---

## **额外的资源**    
**附带文件的 Github 仓库:**[**https://github.com/nzwulfin/named-container**](https://github.com/nzwulfin/named-container)  
**侧边栏 1:** **通过容器访问本地文件的 SELinux 上下文**    
你可能已经注意到当我从容器向本地主机拷贝文件时，我没有运行 `chcon` 将主机中的文件类型改变为 `svirt_sandbox_file_t`。为什么它没有终止？将一个文件拷贝到 `/srv` 本应该将这个文件标记为类型 `var_t`。我 `setenforce 0` 了吗？     
当然没有，这将让 Dan Walsh 大哭(译注:未知人名)。是的，`machinectl` 确实将文件标记类型设置为期望的那样，可以看一下:    
启动一个容器之前:
```
[root@rhel7-host ~]# ls -Z /srv/named/etc/named.conf

-rw-r-----. unconfined_u:object_r:var_t:s0   /srv/named/etc/named.conf
```     

After starting the container:   
不，运行中我使用了一个卷选项使 Dan Walsh 高兴，`:Z`。`-v /srv/named/etc/named.conf:/etc/named.conf:Z`命令的这部分做了两件事情:首先它表示这需要使用一个私有的卷 SELiunx 标记来重新标记，其次它表明以读写挂载。    
启动容器之后:   
```
[root@rhel7-host ~]# ls -Z /srv/named/etc/named.conf 

-rw-r-----. root 25 system_u:object_r:svirt_sandbox_file_t:s0:c821,c956 /srv/named/etc/named.conf
```     

**侧边栏 2:** **VIM 备份行为改变 inode**      
如果你在本地主机中使用 `vim` 来编辑配置文件，并且你没有看到容器中的改变，你可能不经意的创建了容器感知不到的新文件。在编辑中时，有三种 `vim` 设定影响背负副本:backup, writebackup 和 backupcopy。    
我从官方 VIM backup_table 中剪下了应用到 RHEL 7 中的默认配置    
[[http://vimdoc.sourceforge.net/htmldoc/editing.html#backup-table](http://vimdoc.sourceforge.net/htmldoc/editing.html#backup-table)]   
```
backup    writebackup

   off      on backup current file, deleted afterwards (default)
```
So we don’t create tilde copies that stick around, but we are creating backups. The other setting is backupcopy, where auto is the shipped default:   
所以我们不创建停留的副本，但我们将创建备份。另外的设定是 backupcopy，`auto` 是默认的设置:     
```
"yes" make a copy of the file and overwrite the original one
 "no" rename the file and write a new one
 "auto" one of the previous, what works best
```

这种组合设定意味着当你编辑一个文件时，除非 `vim` 有理由不去(检查文件逻辑)，你将会得到包含你编辑之后的新文件，当你保存时它会重命名原先的文件。这意味着这个文件获得了新的 inode。对于大多数情况，这不是问题，但是这里绑定挂载到一个容器对 inode 的改变很敏感。为了解决这个问题，你需要改变 backupcopy 的行为。  
Either in the vim session or in your .vimrc, add set backupcopy=yes. This will make sure the original file gets truncated and overwritten, preserving the inode and propagating the changes into the container.   
不管是在 `vim` 会话还是在你的 `.vimrc`中，添加 `set backupcopy=yes`。这将确保原先的文件被截断并且被覆写，维持了 inode 并且在容器中产生了改变。     

------------

via: http://rhelblog.redhat.com/2017/07/19/containing-system-services-in-red-hat-enterprise-linux-part-1/

作者：[Matt Micene ][a]
译者：[liuxinyu123](https://github.com/liuxinyu123)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出













