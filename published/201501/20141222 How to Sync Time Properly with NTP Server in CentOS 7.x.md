CentOS 7.x中正确设置时间与时钟服务器同步
================================================================================
**Chrony**是一个开源的自由软件，它能帮助你保持系统时钟与时钟服务器（NTP）同步，因此让你的时间保持精确。它由两个程序组成，分别是chronyd和chronyc。chronyd是一个后台运行的守护进程，用于调整内核中运行的系统时钟和时钟服务器同步。它确定计算机增减时间的比率，并对此进行补偿。chronyc提供了一个用户界面，用于监控性能并进行多样化的配置。它可以在chronyd实例控制的计算机上工作，也可以在一台不同的远程计算机上工作。

在像CentOS 7之类基于RHEL的操作系统上，已经默认安装有Chrony。

### Chrony配置 ###

当Chrony启动时，它会读取/etc/chrony.conf配置文件中的设置。CentOS 7操作系统上最重要的设置有：

**server** - 该参数可以多次用于添加时钟服务器，必须以"server "格式使用。一般而言，你想添加多少服务器，就可以添加多少服务器。

    server 0.centos.pool.ntp.org
    server 3.europe.pool.ntp.org

**stratumweight** - stratumweight指令设置当chronyd从可用源中选择同步源时，每个层应该添加多少距离到同步距离。默认情况下，CentOS中设置为0，让chronyd在选择源时忽略源的层级。

**driftfile** - chronyd程序的主要行为之一，就是根据实际时间计算出计算机增减时间的比率，将它记录到一个文件中是最合理的，它会在重启后为系统时钟作出补偿，甚至可能的话，会从时钟服务器获得较好的估值。

**rtcsync** - rtcsync指令将启用一个内核模式，在该模式中，系统时间每11分钟会拷贝到实时时钟（RTC）。

**allow / deny** - 这里你可以指定一台主机、子网，或者网络以允许或拒绝NTP连接到扮演时钟服务器的机器。

    allow 192.168.4.5
    deny 192.168/16

**cmdallow / cmddeny** - 跟上面相类似，只是你可以指定哪个IP地址或哪台主机可以通过chronyd使用控制命令

**bindcmdaddress** - 该指令允许你限制chronyd监听哪个网络接口的命令包（由chronyc执行）。该指令通过cmddeny机制提供了一个除上述限制以外可用的额外的访问控制等级。

    bindcmdaddress 127.0.0.1
    bindcmdaddress ::1

**makestep** - 通常，chronyd将根据需求通过减慢或加速时钟，使得系统逐步纠正所有时间偏差。在某些特定情况下，系统时钟可能会漂移过快，导致该调整过程消耗很长的时间来纠正系统时钟。该指令强制chronyd在调整期大于某个阀值时步进调整系统时钟，但只有在因为chronyd启动时间超过指定限制（可使用负值来禁用限制），没有更多时钟更新时才生效。

### 使用chronyc ###

你也可以通过运行chronyc命令来修改设置，命令如下：

**accheck** - 检查NTP访问是否对特定主机可用

**activity** - 该命令会显示有多少NTP源在线/离线

![](http://blog.linoxide.com/wp-content/uploads/2014/10/chrony-activity.jpg)

**add server** - 手动添加一台新的NTP服务器。

**clients** - 在客户端报告已访问到服务器

**delete** - 手动移除NTP服务器或对等服务器

**settime** - 手动设置守护进程时间

**tracking** - 显示系统时间信息

你可以通过使用帮助命令查看完整的命令列表：

![](http://blog.linoxide.com/wp-content/uploads/2014/10/commands.jpg)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/chrony-time-sync/

作者：[Adrian Dinu][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/adriand/
