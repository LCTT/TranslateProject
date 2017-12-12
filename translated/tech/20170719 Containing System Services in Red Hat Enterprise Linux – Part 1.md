在红帽企业版 Linux 中将系统服务容器化（一）
====================

在 2017 年红帽峰会上，有几个人问我“我们通常用完整的虚拟机来隔离如 DNS 和 DHCP 等网络服务，那我们可以用容器来取而代之吗？”答案是可以的，下面是在当前红帽企业版 Linux 7 系统上创建一个系统容器的例子。     

### 我们的目的  

**创建一个可以独立于任何其它系统服务而更新的网络服务，并且可以从主机端容易地管理和更新。**

让我们来探究一下在容器中建立一个运行在 systemd 之下的 BIND 服务器。在这一部分，我们将了解到如何建立自己的容器以及管理 BIND 配置和数据文件。

在本系列的第二部分，我们将看到如何整合主机中的 systemd 和容器中的 systemd。我们将探究如何管理容器中的服务，并且使它作为一种主机中的服务。

### 创建 BIND 容器

为了使 systemd 在一个容器中轻松运行，我们首先需要在主机中增加两个包：`oci-register-machine` 和 `oci-systemd-hook`。`oci-systemd-hook` 这个钩子允许我们在一个容器中运行 systemd，而不需要使用特权容器或者手工配置 tmpfs 和 cgroups。`oci-register-machine` 这个钩子允许我们使用 systemd 工具如 `systemctl` 和 `machinectl` 来跟踪容器。

```
[root@rhel7-host ~]# yum install oci-register-machine oci-systemd-hook  
```

回到创建我们的 BIND 容器上。[红帽企业版 Linux 7 基础镜像][6]包含了 systemd 作为其初始化系统。我们可以如我们在典型的系统中做的那样安装并激活 BIND。你可以从 [git 仓库中下载这份 Dockerfile][8]。

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

因为我们以 PID 1 来启动一个初始化系统，当我们告诉容器停止时，需要改变 docker CLI 发送的信号。从 `kill` 系统调用手册中 （`man 2 kill`）：

> 唯一可以发送给 PID 1 进程（即 init 进程）的信号，是那些初始化系统明确安装了<ruby>信号处理器<rt>signal handler</rt></ruby>的信号。这是为了避免系统被意外破坏。

对于 systemd 信号处理器，`SIGRTMIN+3` 是对应于 `systemd start halt.target` 的信号。我们也需要为 BIND 暴露 TCP 和 UDP 端口号，因为这两种协议可能都要使用。   

### 管理数据

有了一个可以工作的 BIND 服务，我们还需要一种管理配置文件和区域文件的方法。目前这些都放在容器里面，所以我们任何时候都可以进入容器去更新配置或者改变一个区域文件。从管理的角度来说，这并不是很理想。当要更新 BIND 时，我们将需要重建这个容器，所以镜像中的改变将会丢失。任何时候我们需要更新一个文件或者重启服务时，都需要进入这个容器，而这增加了步骤和时间。

相反的，我们将从这个容器中提取出配置文件和数据文件，把它们拷贝到主机上，然后在运行的时候挂载它们。用这种方式我们可以很容易地重启或者重建容器，而不会丢失所做出的更改。我们也可以使用容器外的编辑器来更改配置和区域文件。因为这个容器的数据看起来像“该系统所提供服务的特定站点数据”，让我们遵循 Linux <ruby>文件系统层次标准<rt>File System Hierarchy</rt></ruby>，并在当前主机上创建 `/srv/named` 目录来保持管理权分离。

```
[root@rhel7-host ~]# mkdir -p /srv/named/etc

[root@rhel7-host ~]# mkdir -p /srv/named/var/named     
```     

*提示：如果你正在迁移一个已有的配置文件，你可以跳过下面的步骤并且将它直接拷贝到 `/srv/named` 目录下。你也许仍然要用一个临时容器来检查一下分配给这个容器的 GID。*

让我们建立并运行一个临时容器来检查 BIND。在将 init 进程以 PID 1 运行时，我们不能交互地运行这个容器来获取一个 shell。我们会在容器启动后执行 shell，并且使用 `rpm` 命令来检查重要文件。    

```
[root@rhel7-host ~]# docker build -t named . 

[root@rhel7-host ~]# docker exec -it $( docker run -d named ) /bin/bash

[root@0e77ce00405e /]# rpm -ql bind
```      

对于这个例子来说，我们将需要 `/etc/named.conf` 和 `/var/named/` 目录下的任何文件。我们可以使用 `machinectl` 命令来提取它们。如果注册了一个以上的容器，我们可以在任一机器上使用 `machinectl status` 命令来查看运行的是什么。一旦有了这些配置，我们就可以终止这个临时容器了。

*如果你喜欢，资源库中也有一个[样例 `named.conf` 和针对 `example.com` 的区域文件][8]。*

```
[root@rhel7-host bind]# machinectl list

MACHINE                          CLASS     SERVICE
8824c90294d5a36d396c8ab35167937f container docker 

[root@rhel7-host ~]# machinectl copy-from 8824c90294d5a36d396c8ab35167937f /etc/named.conf /srv/named/etc/named.conf

[root@rhel7-host ~]# machinectl copy-from 8824c90294d5a36d396c8ab35167937f /var/named /srv/named/var/named

[root@rhel7-host ~]# docker stop infallible_wescoff
```     

### 最终的创建

为了创建和运行最终的容器，添加卷选项以挂载：

- 将文件 `/srv/named/etc/named.conf` 映射为 `/etc/named.conf`  
- 将目录 `/srv/named/var/named` 映射为 `/var/named`  

因为这是我们最终的容器，我们将提供一个有意义的名字，以供我们以后引用。

```
[root@rhel7-host ~]# docker run -d -p 53:53 -p 53:53/udp -v /srv/named/etc/named.conf:/etc/named.conf:Z -v /srv/named/var/named:/var/named:Z --name named-container named
```

在最终容器运行时，我们可以更改本机配置来改变这个容器中 BIND 的行为。这个 BIND 服务器将需要在这个容器分配的任何 IP 上监听。请确保任何新文件的 GID 与来自这个容器中的其余的 BIND 文件相匹配。   

```
[root@rhel7-host bind]# cp named.conf /srv/named/etc/named.conf 

[root@rhel7-host ~]# cp example.com.zone /srv/named/var/named/example.com.zone

[root@rhel7-host ~]# cp example.com.rr.zone  /srv/named/var/named/example.com.rr.zone
```

> 很好奇为什么我不需要在主机目录中改变 SELinux 上下文？^注1

我们将运行这个容器提供的 `rndc` 二进制文件重新加载配置。我们可以使用 `journald` 以同样的方式检查 BIND 日志。如果运行出现错误，你可以在主机中编辑该文件，并且重新加载配置。在主机中使用 `host` 或 `dig`，我们可以检查来自该容器化服务的 example.com 的响应。

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

> 你的区域文件没有更新吗？可能是因为你的编辑器，而不是序列号。^注2

### 终点线

我们已经达成了我们打算完成的目标，从容器中为 DNS 请求和区域文件提供服务。我们已经得到一个持久化的位置来管理更新和配置，并且更新后该配置不变。

在这个系列的第二部分，我们将看到怎样将一个容器看作为主机中的一个普通服务来运行。  

---   

[关注 RHEL 博客](http://redhatstackblog.wordpress.com/feed/)，通过电子邮件来获得本系列第二部分和其它新文章的更新。     

---

### 附加资源
    
- **所附带文件的 Github 仓库：** [https://github.com/nzwulfin/named-container](https://github.com/nzwulfin/named-container)
- **注1：** **通过容器访问本地文件的 SELinux 上下文**    

	你可能已经注意到当我从容器向本地主机拷贝文件时，我没有运行 `chcon` 将主机中的文件类型改变为 `svirt_sandbox_file_t`。为什么它没有出错？将一个文件拷贝到 `/srv` 会将这个文件标记为类型 `var_t`。我 `setenforce 0` （关闭 SELinux）了吗？     
	
	当然没有，这将让 [Dan Walsh 大哭](https://stopdisablingselinux.com/)（LCTT 译注：RedHat 的 SELinux 团队负责人，倡议不要禁用 SELinux）。是的，`machinectl` 确实将文件标记类型设置为期望的那样，可以看一下：

	启动一个容器之前：
	
	```
[root@rhel7-host ~]# ls -Z /srv/named/etc/named.conf
-rw-r-----. unconfined_u:object_r:var_t:s0   /srv/named/etc/named.conf
```

	不过，运行中我使用了一个卷选项可以使 Dan Walsh 先生高兴起来，`:Z`。`-v /srv/named/etc/named.conf:/etc/named.conf:Z` 命令的这部分做了两件事情：首先它表示这需要使用一个私有卷的 SELiunx 标记来重新标记；其次它表明以读写挂载。    

	启动容器之后：
	
	```
[root@rhel7-host ~]# ls -Z /srv/named/etc/named.conf 
-rw-r-----. root 25 system_u:object_r:svirt_sandbox_file_t:s0:c821,c956 /srv/named/etc/named.conf
```

- **注2：** **VIM 备份行为能改变 inode**      

	如果你在本地主机中使用 `vim` 来编辑配置文件，而你没有看到容器中的改变，你可能不经意的创建了容器感知不到的新文件。在编辑时，有三种 `vim` 设定影响备份副本：`backup`、`writebackup` 和 `backupcopy`。
	
	我摘录了 RHEL 7 中的来自官方 VIM [backup_table][9] 中的默认配置。 
	
	```
backup    writebackup
   off      on backup current file, deleted afterwards (default)
```
	所以我们不创建残留下的 `~` 副本，而是创建备份。另外的设定是 `backupcopy`，`auto` 是默认的设置：
	
	```
 "yes" make a copy of the file and overwrite the original one
 "no" rename the file and write a new one
 "auto" one of the previous, what works best
```

	这种组合设定意味着当你编辑一个文件时，除非 `vim` 有理由（请查看文档了解其逻辑），你将会得到一个包含你编辑内容的新文件，当你保存时它会重命名为原先的文件。这意味着这个文件获得了新的 inode。对于大多数情况，这不是问题，但是这里容器的<ruby>绑定挂载<rt>bind mount</rt></ruby>对 inode 的改变很敏感。为了解决这个问题，你需要改变 `backupcopy` 的行为。  

	不管是在 `vim` 会话中还是在你的 `.vimrc`中，请添加 `set backupcopy=yes`。这将确保原先的文件被清空并覆写，维持了 inode 不变并且将该改变传递到了容器中。     

------------

via: http://rhelblog.redhat.com/2017/07/19/containing-system-services-in-red-hat-enterprise-linux-part-1/

作者：[Matt Micene][a]
译者：[liuxinyu123](https://github.com/liuxinyu123)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://rhelblog.redhat.com/2017/07/19/containing-system-services-in-red-hat-enterprise-linux-part-1/
[1]:http://rhelblog.redhat.com/author/mmicenerht/
[2]:http://rhelblog.redhat.com/2017/07/19/containing-system-services-in-red-hat-enterprise-linux-part-1/#repo
[3]:http://rhelblog.redhat.com/2017/07/19/containing-system-services-in-red-hat-enterprise-linux-part-1/#sidebar_1
[4]:http://rhelblog.redhat.com/2017/07/19/containing-system-services-in-red-hat-enterprise-linux-part-1/#sidebar_2
[5]:http://redhatstackblog.wordpress.com/feed/
[6]:https://access.redhat.com/containers
[7]:http://rhelblog.redhat.com/2017/07/19/containing-system-services-in-red-hat-enterprise-linux-part-1/#repo
[8]:https://github.com/nzwulfin/named-container
[9]:http://vimdoc.sourceforge.net/htmldoc/editing.html#backup-table