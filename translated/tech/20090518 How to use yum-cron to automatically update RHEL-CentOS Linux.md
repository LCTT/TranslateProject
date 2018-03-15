translating by shipsw

如何使用 yum-cron 自动更新 RHEL/CentOS Linux
======
yum 命令是 RHEL / CentOS Linux 系统中用来安装和更新软件包的一个工具。知道如何使用 [yum 命令行] 更新系统，但是我想用 cron 手工更新软件包。该如何配置才能使得 yum 使用 [cron 自动更新][2]系统补丁或更新呢？

首先需要安装 yum-cron 软件包。该软件包提供以 cron 命令运行 yum 更新所需的文件。安装这个软件可以使得 yum 以 cron 命令每晚更新。

### CentOS/RHEL 6.x/7.x 上安装 yum cron

输入以下 [yum 命令][3]:  
`$ sudo yum install yum-cron`
![](https://www.cyberciti.biz/media/new/faq/2009/05/How-to-install-yum-cron-on-CentOS-RHEL-server.jpg)

使用 **CentOS/RHEL 7.x** 上的 systemctl 启动服务：
```
$ sudo systemctl enable yum-cron.service 
$ sudo systemctl start yum-cron.service 
$ sudo systemctl status yum-cron.service
```
在  **CentOS/RHEL 6.x** 系统中，运行：
```
$ sudo chkconfig yum-cron on 
$ sudo service yum-cron start
```
![](https://www.cyberciti.biz/media/new/faq/2009/05/How-to-turn-on-yum-cron-service-on-CentOS-or-RHEL-server.jpg)

yum-cron 是 yum 的一个调用接口。使得 cron 调用 yum 变得非常方便。该软件提供元数据更新，更新检查、下载和安装等功能。yum-cron 的不同功能可以使用高配置文件配置，而不是输入一堆复杂的命令行参数。
 
### 配置 yum-cron 自动更新 RHEL/CentOS Linux

使用 vi 等编辑器编辑文件 /etc/yum/yum-cron.conf 和 /etc/yum/yum-cron-hourly.conf：  
`$ sudo vi /etc/yum/yum-cron.conf`
确保更新可用时自动更新
`apply_updates = yes`
可以设置通知 email 地址。注意： localhost 将会被系统名称代替。
`email_from = root@localhost`
email 通知地址列表。
`email_to = your-it-support@some-domain-name`
发送 email 信息的主机名。  
`email_host = localhost`
[CentOS/RHEL 7.x][4] 上不想更新内核的话，添加以下内容：  
`exclude=kernel*`
RHEL/CentOS 6.x 下[添加以下内容来禁用内核更新][5]：
`YUM_PARAMETER=kernel*`
[保存并关闭文件][6]。如果想每小时更新系统的话修改文件 /etc/yum/yum-cron-hourly.conf，否则文件 /etc/yum/yum-cron.conf 将使用以下命令每天运行一次[cat 命令][7]：
`$ cat /etc/cron.daily/0yum-daily.cron`
示例输出：
```
#!/bin/bash
 
# Only run if this flag is set. The flag is created by the yum-cron init
# script when the service is started -- this allows one to use chkconfig and
# the standard "service stop|start" commands to enable or disable yum-cron.
if [[ ! -f /var/lock/subsys/yum-cron ]]; then
 exit 0
fi
 
# Action!
exec /usr/sbin/yum-cron /etc/yum/yum-cron-hourly.conf
[root@centos7-box yum]# cat /etc/cron.daily/0yum-daily.cron
#!/bin/bash
 
# Only run if this flag is set. The flag is created by the yum-cron init
# script when the service is started -- this allows one to use chkconfig and
# the standard "service stop|start" commands to enable or disable yum-cron.
if [[ ! -f /var/lock/subsys/yum-cron ]]; then
 exit 0
fi
 
# Action!
exec /usr/sbin/yum-cron
```

完成配置。现在你的系统将每天自动更新一次。更多细节请参照 yum-cron 的说明手册。  
`$ man yum-cron`

### 方法二 – 使用 shell 脚本

**警告** : 以下命令已经过时了. 不要在 RHEL/CentOS 6.x/7.x 系统中使用。 我写在这里仅仅是因为历史原因，该命令适合 CentOS/RHEL version 4.x/5.x 上运行。

让我们看看如何在 CentOS/RHEL 上配置 yum 安全更新包的检索和安装。你可以使用 CentOS / RHEL 提供的 yum-updatesd 服务。然而，系统提供的服务开销有点大。你可以使用以下的 shell 脚本配置每天后每周的系统更新。

  * **/etc/cron.daily/yumupdate.sh**  每天更新
  * **/etc/cron.weekly/yumupdate.sh** 每周更新



#### 系统更新的示例脚本

以下脚本功能是使用 [cron][8] 定时安装更新更新：
```
#!/bin/bash
YUM=/usr/bin/yum
$YUM -y -R 120 -d 0 -e 0 update yum
$YUM -y -R 10 -e 0 -d 0 update
```

(Code listing -01: /etc/cron.daily/yumupdate.sh)

其中：

  1. 第一条命令更新 yum 自己。
  2. **-R 120** : 设置允许一条命令前的等待最长时间
  3. **-e 0** : 设置错误级别为 0 （范围 0-10）。0 意味着只有关键性错误才会显示。
  4. -d 0 : 设置 debug 级别为 0 。增加或减少打印日志的量。(范围 0-10)
  5. **-y** : 默认同意；任何提示问题默认回答为 yes。



设置脚本的执行权限：    
`# chmod +x /etc/cron.daily/yumupdate.sh`


### 关于作者

作者是 nixCraft 的创始人，一个经验丰富的系统管理员和 Linux/Unix 脚本培训师。他曾与全球客户合作，领域涉及IT，教育，国防和空间研究以及非营利部门等多个行业。请在 [Twitter][9]、[Facebook][10]、[Google+][11] 上关注他。**获取更多有关系统管理、Linux/Unix 和开源话题请关注[我的 RSS/XML 地址][12]**。

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/faq/fedora-automatic-update-retrieval-installation-with-cron/

作者：[Vivek Gite][a]
译者：[shipsw](https://github.com/shipsw)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz/
[1]:https://www.cyberciti.biz/faq/rhel-centos-fedora-linux-yum-command-howto/
[2]:https://www.cyberciti.biz/faq/how-do-i-add-jobs-to-cron-under-linux-or-unix-oses
[3]:https://www.cyberciti.biz/faq/rhel-centos-fedora-linux-yum-command-howto/ (See Linux/Unix yum command examples for more info)
[4]:https://www.cyberciti.biz/faq/yum-update-except-kernel-package-command/
[5]:https://www.cyberciti.biz/faq/redhat-centos-linux-yum-update-exclude-packages/
[6]:https://www.cyberciti.biz/faq/linux-unix-vim-save-and-quit-command/
[7]:https://www.cyberciti.biz/faq/linux-unix-appleosx-bsd-cat-command-examples/ (See Linux/Unix cat command examples for more info)
[8]:https://www.cyberciti.biz/faq/how-do-i-add-jobs-to-cron-under-linux-or-unix-oses
[9]:https://twitter.com/nixcraft
[10]:https://facebook.com/nixcraft
[11]:https://plus.google.com/+CybercitiBiz
[12]:https://www.cyberciti.biz/atom/atom.xml
