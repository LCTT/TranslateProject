RHCE 系列（十）：在 RHEL/CentOS 7 中设置 NTP（网络时间协议）服务器
================================================================================

网络时间协议 - NTP - 是运行在传输层 123 号端口的 UDP 协议，它允许计算机通过网络同步准确时间。随着时间的流逝，计算机内部时间会出现漂移，这会导致时间不一致问题，尤其是对于服务器和客户端日志文件，或者你想要复制服务器的资源或数据库。

![在 CentOS 上安装 NTP 服务器](http://www.tecmint.com/wp-content/uploads/2014/09/NTP-Server-Install-in-CentOS.png)

*在 CentOS 和 RHEL 7 上安装 NTP 服务器*

#### 前置要求： ####

- [CentOS 7 安装过程][1]
- [RHEL 安装过程][2]

#### 额外要求： ####

- [注册并启用 RHEL 7 更新订阅][3]
- [在 CentOS/RHCE 7 上配置静态 IP][4]
- [在 CentOS/RHEL 7 上停用并移除不需要的服务][5]

这篇指南会告诉你如何在 CentOS/RHCE 7 上安装和配置 NTP 服务器，并使用 NTP 公共时间服务器池（NTP Public Pool Time Servers）列表中和你服务器地理位置最近的可用节点中同步时间。

#### 步骤一：安装和配置 NTP 守护进程 ####

1、 官方 CentOS /RHEL 7 库默认提供 NTP 服务器安装包，可以通过使用下面的命令安装。

    # yum install ntp

![在 CentOS 上安装 NTP 服务器](http://www.tecmint.com/wp-content/uploads/2014/09/Install-NTP-in-CentOS.png)

*安装 NTP 服务器*

2、 安装完服务器之后，首先到官方  [NTP 公共时间服务器池（NTP Public Pool Time Servers）][6]，选择你服务器物理位置所在的洲，然后搜索你的国家位置，然后会出现 NTP 服务器列表。

![NTP 服务器池](http://www.tecmint.com/wp-content/uploads/2014/09/NTP-Pool-Server.png)

*NTP 服务器池*

3、 然后打开编辑 NTP 守护进程的主配置文件，注释掉来自 pool.ntp.org 项目的公共服务器默认列表，并用类似下面截图中提供给你所在国家的列表替换。（LCTT 译注：中国使用 0.cn.pool.ntp.org 等）

![在 CentOS 中配置 NTP 服务器](http://www.tecmint.com/wp-content/uploads/2014/09/Configure-NTP-Server.png)

*配置 NTP 服务器*

4、 下一步，你需要允许来自你的网络的客户端和这台服务器同步时间。为了做到这点，添加下面一行到 NTP 配置文件，其中 **restrict** 语句控制允许哪些网络查询和同步时间 - 请根据需要替换网络 IP。

    restrict 192.168.1.0 netmask 255.255.255.0 nomodify notrap

nomodify notrap 语句意味着不允许你的客户端配置服务器或者作为同步时间的节点。

5、 如果你需要用于错误处理的额外信息，以防你的 NTP 守护进程出现问题，添加一个 logfile 语句，用于记录所有 NTP 服务器问题到一个指定的日志文件。

    logfile /var/log/ntp.log

![在 CentOS 中启用 NTP 日志](http://www.tecmint.com/wp-content/uploads/2014/09/Enable-NTP-Log.png)

*启用 NTP 日志*

6、 在你编辑完所有上面解释的配置并保存关闭 ntp.conf 文件后，你最终的配置看起来像下面的截图。

![CentOS 中 NTP 服务器的配置](http://www.tecmint.com/wp-content/uploads/2014/09/NTP-Server-Configuration.png)

*NTP 服务器配置*

### 步骤二：添加防火墙规则并启动 NTP 守护进程 ###

7、 NTP 服务使用 OSI 传输层（第四层）的 123 号 UDP 端口。它是为了避免可变延迟的影响所特别设计的。要在 RHEL/CentOS 7 中开放这个端口，可以对 Firewalld 服务使用下面的命令。

	# firewall-cmd --add-service=ntp --permanent
	# firewall-cmd --reload

![在 Firewall 中开放 NTP 端口](http://www.tecmint.com/wp-content/uploads/2014/09/Open-NTP-Port.png)

*在 Firewall 中开放 NTP 端口*

8、 你在防火墙中开放了 123 号端口之后，启动 NTP 服务器并确保系统范围内可用。用下面的命令管理服务。

    # systemctl start ntpd
    # systemctl enable ntpd
    # systemctl status ntpd

![启动 NTP 服务](http://www.tecmint.com/wp-content/uploads/2014/09/Start-NTP-Service.png)

*启动 NTP 服务*

### 步骤三：验证服务器时间同步 ###

9、 启动了 NTP 守护进程后，用几分钟等服务器和它的服务器池列表同步时间，然后运行下面的命令验证 NTP 节点同步状态和你的系统时间。

    # ntpq -p
    # date -R

![验证 NTP 服务器时间](http://www.tecmint.com/wp-content/uploads/2014/09/Verify-NTP-Time-Sync.png)

*验证 NTP 时间同步*

10、 如果你想查询或者和你选择的服务器池同步，你可以使用 ntpdate 命令，后面跟服务器名或服务器地址，类似下面建议的命令行示例。

    # ntpdate -q  0.ro.pool.ntp.org  1.ro.pool.ntp.org

![同步 NTP 同步](http://www.tecmint.com/wp-content/uploads/2014/09/Synchronize-NTP-Time.png)

*同步 NTP 时间*

### 步骤四：设置 Windows NTP 客户端 ###

11、 如果你的 windows 机器不是域名控制器的一部分，你可以配置 Windows 和你的 NTP服务器同步时间。在任务栏右边 -> 时间 -> 更改日期和时间设置 -> 网络时间标签 -> 更改设置 -> 和一个网络时间服务器检查同步 -> 在 Server 空格输入服务器 IP 或 FQDN -> 马上更新 -> OK。

![和 NTP 同步 Windows 时间](http://www.tecmint.com/wp-content/uploads/2014/09/Synchronize-Windows-Time-with-NTP.png)

*和 NTP 同步 Windows 时间*

就是这些。在你的网络中配置一个本地 NTP 服务器能确保你所有的服务器和客户端有相同的时间设置，以防出现网络连接失败，并且它们彼此都相互同步。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/install-ntp-server-in-centos/

作者：[Matei Cezar][a]
译者：[ictlyh](http://motouxiaogui.cn/blog)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/cezarmatei/
[1]:http://www.tecmint.com/centos-7-installation/
[2]:http://www.tecmint.com/redhat-enterprise-linux-7-installation/
[3]:http://www.tecmint.com/enable-redhat-subscription-reposiories-and-updates-for-rhel-7/
[4]:http://www.tecmint.com/configure-network-interface-in-rhel-centos-7-0/
[5]:http://www.tecmint.com/remove-unwanted-services-in-centos-7/
[6]:http://www.pool.ntp.org/en/