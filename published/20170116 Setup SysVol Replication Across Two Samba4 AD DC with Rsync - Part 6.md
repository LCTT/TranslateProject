Samba 系列（六）：使用 Rsync 命令同步两个 Samba4 AD DC 之间的 SysVol 目录
============================================================

这篇文章讲的是在两个 **Samba4 活动目录域控制器**之间，通过一些强大的 Linux 工具来完成 SysVol 的复制操作，比如 [Rsync 数据同步工具][2]，[Cron 任务调度进程][3]和 [SSH 协议][4]。

### 需求：

-  [Samba 系列（五）：将另一台 Ubuntu DC 服务器加入到 Samba4 AD DC 实现双域控主机模][1]

### 第一步：配置 DC 服务器时间同步

1、在两个域控制器之间复制 **sysvol** 目录的内容之前，你得保证这两个服务器时间设置准确且一致。

如果这两个服务器的时间延迟大于 5 分钟，并且时钟也不同步，你将会遇到 AD 账号和域复制的各种问题。

为了解决多个域控制器之间时间漂移的问题，你需要在服务器上执行如下命令来[安装和配置 NTP 服务][5]。

```
# apt-get install ntp
```

2、在 NTP 服务安装完成之后，打开主配置文件，把默认的 pool 值注释（在每行 pool 参数前添加 # ），并且添加新的 pool 值，指向已安装了 **NTP** 服务端的主 **Samba4 AD DC FQDN**，如下所示。

```
# nano /etc/ntp.conf
```

把下面几行添加到 `ntp.conf` 配置文件。

```
pool 0.ubuntu.pool.ntp.org iburst
#pool 1.ubuntu.pool.ntp.org iburst
#pool 2.ubuntu.pool.ntp.org iburst
#pool 3.ubuntu.pool.ntp.org iburst
pool adc1.tecmint.lan
# Use Ubuntu's ntp server as a fallback.
pool ntp.ubuntu.com
```

[
 ![Configure NTP for Samba4](http://www.tecmint.com/wp-content/uploads/2017/01/Configure-NTP-for-Samba4.png) 
][6]

*Samba4 配置 NTP 服务*

3、先不要关闭该文件，在文件末尾添加如下内容，这是为了让其它客户端能够查询并[与这个 NTP 服务器同步时间][7]，并发出 NTP 签署请求，以防主 DC 离线：

```
restrict source notrap nomodify noquery mssntp
ntpsigndsocket /var/lib/samba/ntp_signd/
```

4、最后，关闭并保存该配置文件，然后重启 NTP 服务以应用更改。等待几分钟后时间同步完成，执行 `ntpq` 命令打印出 **adc1** 时间同步情况。

```
# systemctl restart ntp
# ntpq -p
```

[
 ![Synchronize NTP Time with Samba4 AD](http://www.tecmint.com/wp-content/uploads/2017/01/Synchronize-Time.png) 
][8]

*与 Samba4 AD 同步 NTP 时间*

### 第二步：通过 Rsync 命令来复制第一个 DC 服务器上的 SysVol 目录

默认情况下，**Samba4 AD DC** 不会通过 **DFS-R**（<ruby>分布式文件系统复制<rt>Distributed File System Replication</rt></ruby>）或者 **FRS**（<ruby>文件复制服务<rt>File Replication Service</rt></ruby>）来复制 SysVol 目录。

这意味着只有在第一个域控制器联机时，<ruby>**组策略对象**<rt>Group Policy objects</rt></ruby>才可用。否则组策略设置和登录脚本不会应用到已加入域的 Windosws 机器上。

为了克服这个障碍，以及基本实现 SysVol 目录复制的目的，我们通过执行一个[基于 SSH 的身份认证][10]并使用 SSH 加密通道的[Linux 同步命令][9]来从第一个域控制器安全地传输 **GPO** 对象到第二个域控制器。

这种方式能够确保 **GPO** 对象在域控制器之间的一致性，但是也有一个很大的缺点。它只能进行单向同步，因为在同步 GPO 目录的时候， **rsync** 命令会从源 DC 服务器传输所有的更改到目标 DC 服务器，

源 DC 服务器上不存在的组策略对象也会从目标 DC 服务器上删除，为了限制并避免任何冲突，所有的 GPO 编辑操作只能在第一个 DC 服务器上执行。

5、要进行 **SysVol** 复制，先到[第一个 AD DC 服务器上生成 SSH 密钥][11]，然后使用下面的命令把该密钥传输到第二个 DC 服务器。

在生成密钥的过程中不要设置密码，以便在无用户干预的情况下进行传输。

```
# ssh-keygen -t RSA  
# ssh-copy-id root@adc2  
# ssh adc2 
# exit 
```

[
 ![Generate SSH Key on Samba4 DC](http://www.tecmint.com/wp-content/uploads/2017/01/Generate-SSH-Key.png) 
][12]

*在 Samba4 DC 服务器上生成 SSH 密钥*

6、 当你确认 root 用户可以从第一个 **DC** 服务器以免密码方式登录到第二个 **DC** 服务器时，执行下面的 `rsync` 命令，加上 `--dry-run` 参数来模拟 SysVol 复制过程。注意把对应的参数值替换成你自己的数据。

```
# rsync --dry-run -XAavz --chmod=775 --delete-after  --progress --stats  /var/lib/samba/sysvol/ root@adc2:/var/lib/samba/sysvol/
```

7、如果模拟复制过程正常，那么再次执行去掉 `--dry-run` 参数的 `rsync` 命令，来真实的在域控制器之间复制 GPO 对象。

```
# rsync -XAavz --chmod=775 --delete-after  --progress --stats  /var/lib/samba/sysvol/ root@adc2:/var/lib/samba/sysvol/
```

[
 ![Samba4 AD DC SysVol Replication](http://www.tecmint.com/wp-content/uploads/2017/01/SysVol-Replication-for-Samba4-DC.png) 
][13]

*Samba4 AD DC SysVol 复制*

8、在 SysVol 复制完成之后，登录到目标域控制器，然后执行下面的命令来列出其中一个 GPO 对象目录的内容。

从第一个 DC 服务器上执行这个命令时，列出的 GPO 对象也要相同。

```
# ls -alh /var/lib/samba/sysvol/your_domain/Policiers/
```

[
 ![Verify Samba4 DC SysVol Replication](http://www.tecmint.com/wp-content/uploads/2017/01/Verify-Samba4-DC-SysVol-Replication.png) 
][14]

*验证 Samba4 DC SysVol 复制结果是否正常*

9、为了自动完成**组策略**复制的过程（通过网络传输 sysvol 目录），你可以使用 root 账号设置一个任务来执行同步命令，如下所示，设置为每隔 5 分钟执行一次该命令。

```
# crontab -e 
```

添加一条每隔 5 分钟运行的同步命令，并把执行结果以及错误信息输出到日志文件 `/var/log/sysvol-replication.log` 。如果执行命令异常，你可以查看该文件来定位问题。

```
*/5 * * * * rsync -XAavz --chmod=775 --delete-after  --progress --stats  /var/lib/samba/sysvol/ root@adc2:/var/lib/samba/sysvol/ > /var/log/sysvol-replication.log 2>&1
```

10、如果以后 **SysVol ACL** 权限有问题，你可以通过下面的命令来检测和修复这些异常。

```
# samba-tool ntacl sysvolcheck
# samba-tool ntacl sysvolreset
```
[
 ![Fix SysVol ACL Permissions](http://www.tecmint.com/wp-content/uploads/2017/01/Fix-SysVol-ACL-Permissions.png) 
][15]

*修复 SysVol ACL 权限问题*

11、如果第一个 **Samba4 AD DC** 的 **FSMO** 角色，即“PDC 模拟器”不可用，你可以强制 **Microsoft Windows** 系统上的**组策略管理控制台**只连接到第二个域控制器，通过选择更改域控制器选项和手动选择目标机器，如下图所示。

[
 ![Change Samba4 Domain Controller](http://www.tecmint.com/wp-content/uploads/2017/01/Change-Samba4-Domain-Controller.png) 
][16]

*更改 Samba4 域控制器*

[
 ![Select Samba4 Domain Controller](http://www.tecmint.com/wp-content/uploads/2017/01/Select-Samba4-Domain-Controller.png) 
][17]


*选择 Samba4 域控制器*

当你从**组策略管理控制台**连接到第二个 **DC** 服务器时，你应该避免对**组策略**做任何更改。否则，当第一个 **DC** 服务器恢复正常后， **rsync 命令**将会删除在第二个 DC 服务器上所做的更改。

--------------------------------------------------------------------------------

作者简介：

![](http://2.gravatar.com/avatar/be16e54026c7429d28490cce41b1e157?s=128&d=blank&r=g)

Matei Cezar -- 我是一个电脑迷，开源软件和 Linux 系统爱好者，有超过 4 年的 Linux 桌面、服务器版本系统和 bash 编程经验。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/samba4-ad-dc-sysvol-replication/

作者：[Matei Cezar][a]
译者：[rusking](https://github.com/rusking)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/cezarmatei/
[1]:https://linux.cn/article-8358-1.html
[2]:http://www.tecmint.com/rsync-local-remote-file-synchronization-commands/
[3]:http://www.tecmint.com/11-cron-scheduling-task-examples-in-linux/
[4]:http://www.tecmint.com/5-best-practices-to-secure-and-protect-ssh-server/
[5]:http://www.tecmint.com/install-and-configure-ntp-server-client-in-debian/
[6]:http://www.tecmint.com/wp-content/uploads/2017/01/Configure-NTP-for-Samba4.png
[7]:http://www.tecmint.com/how-to-synchronize-time-with-ntp-server-in-ubuntu-linux-mint-xubuntu-debian/
[8]:http://www.tecmint.com/wp-content/uploads/2017/01/Synchronize-Time.png
[9]:http://www.tecmint.com/rsync-local-remote-file-synchronization-commands/
[10]:http://www.tecmint.com/ssh-passwordless-login-using-ssh-keygen-in-5-easy-steps/
[11]:http://www.tecmint.com/ssh-passwordless-login-using-ssh-keygen-in-5-easy-steps/
[12]:http://www.tecmint.com/wp-content/uploads/2017/01/Generate-SSH-Key.png
[13]:http://www.tecmint.com/wp-content/uploads/2017/01/SysVol-Replication-for-Samba4-DC.png
[14]:http://www.tecmint.com/wp-content/uploads/2017/01/Verify-Samba4-DC-SysVol-Replication.png
[15]:http://www.tecmint.com/wp-content/uploads/2017/01/Fix-SysVol-ACL-Permissions.png
[16]:http://www.tecmint.com/wp-content/uploads/2017/01/Change-Samba4-Domain-Controller.png
[17]:http://www.tecmint.com/wp-content/uploads/2017/01/Select-Samba4-Domain-Controller.png
