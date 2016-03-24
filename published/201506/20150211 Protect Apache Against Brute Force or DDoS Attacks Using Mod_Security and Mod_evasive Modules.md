在Apache中使用mod\_security和mod\_evasive来抵御暴力破解和DDos攻击
================================================================================

对于那些需要在因特网上提供服务或托管主机的人来说，保证您的系统在面对攻击时的安全是一个重要的事情。

mod\_security（一个开源的用于Web应用入侵检测及防护的引擎，可以无缝地集成到Web服务器）和mod\_evasive是两个在服务器端对抗暴力破解和(D)Dos攻击的非常重要的工具。

mod\_evasive，如它的名字一样，在受攻击时提供避实就虚的功能，它像一个雨伞一样保护Web服务器免受那些威胁。

![](http://www.tecmint.com/wp-content/uploads/2012/06/Install-Mod_Security-Mod_evasive-in-CentOS.jpg)

*安装mod\_security和mod\_evasive来保护Apache*

在这篇文章中我们将讨论如何安装、配置以及在RHEL/CentOS6、7和Fedora 21-15上将它们整合到Apache。另外，我们会模拟攻击以便验证服务器做出了正确的反应。

以上以您的系统中安装有LAMP服务器为基础，所以，如果您没有安装，请先阅读下面链接的文章再开始阅读本文。

- [在RHEL/CentOS 7中安装LAMP][1]

（LCTT 译注：本文有修改。原文为了在RHEL/CentOS 7或Fedora 21中使用同样的工具，而删除了自带的 firewalld，使用了旧式的iptables。译者以为这样并不恰当，因此，译文中做了相应删节，并增加了firewalld的相应脚本。）

### 步骤 1: 安装mod\_security和mod\_evasive ###

另外，在安装LAMP后，您还需要在RHEL/CentOS 7/6中[开启EPEL仓库][3]来安装这两个包。Fedora用户不需要开启这个仓库，因为epel已经是Fedora项目的一部分了。

    # yum update && yum install mod_security mod_evasive

当安装结束后，您会在/etc/httpd/conf.d下找到这两个工具的配置文件。

    # ls -l /etc/httpd/conf.d

![](http://www.tecmint.com/wp-content/uploads/2012/06/mod_security-mod_evasive-Configurations.png)

*mod\_security + mod\_evasive 配置文件*

现在，为了整合这两个模块到Apache，并在启动时加载它们。请确保下面几行出现在mod\_evasive.conf和mod\_security.conf的顶层部分，它们分别为：

    LoadModule evasive20_module modules/mod_evasive24.so
    LoadModule security2_module modules/mod_security2.so

请注意modules/mod\_security2.so和modules/mod\_evasive24.so都是从/etc/httpd到模块源文件的相对路径。您可以通过列出/etc/httpd/modules的内容来验证（如果需要的话，修改它）：

    # cd /etc/httpd/modules
    # pwd
    # ls -l | grep -Ei '(evasive|security)'

![](http://www.tecmint.com/wp-content/uploads/2012/06/Verify-mod_security-mod_evasive-Modules.png)

*验证mod\_security + mod\_evasive模块*

接下来重启Apache并且核实它已加载了mod\_evasive和mod\_security：

    # service httpd restart 		[在RHEL/CentOS 6和Fedora 20-18上]
    # systemctl restart httpd 		[在RHEL/CentOS 7和Fedora 21上]

----------

    # httpd -M | grep -Ei '(evasive|security)'     [输出已加载的静态模块和动态模块列表]
    
![](http://www.tecmint.com/wp-content/uploads/2012/06/Check-mod_security-mod_evasive-Loaded.png)

*检查mod\_security + mod\_evasive模块已加载*

### 步骤 2: 安装一个核心规则集并且配置mod\_security ###

简单来说，一个核心规则集（即CRS）为web服务器提供特定状况下如何反应的指令。mod\_security的开发者们提供了一个免费的CRS，叫做OWASP（[开放Web应用安全项目]）ModSecurity CRS，可以从下面的地址下载和安装。

####下载OWASP CRS到为之创建的目录####

	# mkdir /etc/httpd/crs-tecmint
	# cd /etc/httpd/crs-tecmint
    # wget https://github.com/SpiderLabs/owasp-modsecurity-crs/tarball/master

![](http://www.tecmint.com/wp-content/uploads/2012/06/Download-mod_security-Core-Rules.png)

*下载mod\_security核心规则*

#### 解压CRS文件并修改文件夹名称####

    # tar xzf master
    # mv SpiderLabs-owasp-modsecurity-crs-ebe8790 owasp-modsecurity-crs


![](http://www.tecmint.com/wp-content/uploads/2012/06/Extract-mod_security-Core-Rules.png)

*解压mod\_security核心规则*

####现在，是时候配置mod\_security了####

将示例的规则文件（owasp-modsecurity-crs/modsecurity_crs_10_setup.conf.example）拷贝为同名的配置文件。

    # cp modsecurity_crs_10_setup.conf.example modsecurity_crs_10_setup.conf

并通过将下面的几行插入到web服务器的主配置文件/etc/httpd/conf/httpd.conf来告诉Apache将这个文件和该模块放在一起使用。如果您选择解压打包文件到另一个文件夹，那么您需要修改Include的路径：

    <IfModule security2_module>
        Include crs-tecmint/owasp-modsecurity-crs/modsecurity_crs_10_setup.conf
        Include crs-tecmint/owasp-modsecurity-crs/base_rules/*.conf
    </IfModule>

最后，建议您在/etc/httpd/modsecurity.d目录下创建自己的配置文件，在那里我们可以用我们自定义的文件夹（接下来的示例中，我们会将其命名为tecmint.conf）而无需修改CRS文件的目录。这样做能够在CRS发布新版本时更加容易的升级。

    <IfModule mod_security2.c>
    	SecRuleEngine On
    	SecRequestBodyAccess On
    	SecResponseBodyAccess On 
    	SecResponseBodyMimeType text/plain text/html text/xml application/octet-stream 
    	SecDataDir /tmp
    </IfModule>

您可以在[SpiderLabs的ModSecurity GitHub][5]仓库中参考关于mod\_security目录的更完整的解释。

### 步骤 3: 配置mod\_evasive ###

mod\_evasive被配置为使用/etc/httpd/conf.d/mod\_evasive.conf中的指令。与mod\_security不同，由于在包升级时没有规则来更新，因此我们不需要独立的文件来添加自定义指令。

默认的mod\_evasive.conf开启了下列的目录（注意这个文件被详细的注释了，因此我们剔掉了注释以重点显示配置指令）：

    <IfModule mod_evasive24.c>
        DOSHashTableSize    3097
        DOSPageCount        2
        DOSSiteCount        50
        DOSPageInterval     1
        DOSSiteInterval     1
        DOSBlockingPeriod   10
    </IfModule>

这些指令的解释：

- DOSHashTableSize: 这个指令指明了哈希表的大小，它用来追踪基于IP地址的活动。增加这个数字将使得站点访问历史的查询变得更快，但如果被设置的太大则会影响整体性能。
- DOSPageCount: 在DOSPageInterval间隔内可由一个用户发起的针对特定的URI（例如，一个Apache 提供服务的文件）的同一个请求的数量。
- DOSSiteCount: 类似DOSPageCount，但涉及到整个站点总共有多少的请求可以在DOSSiteInterval间隔内被发起。
- DOSBlockingPeriod: 如果一个用户超过了DOSSPageCount的限制或者DOSSiteCount，他的源IP地址将会在DOSBlockingPeriod期间内被加入黑名单。在DOSBlockingPeriod期间，任何从这个IP地址发起的请求将会遭遇一个403禁止错误。

尽可能的试验这些值，以使您的web服务器有能力处理特定大小的负载。

**一个小警告**: 如果这些值设置的不合适，则您会蒙受阻挡合法用户的风险。

您也许还会用到以下其它有用的指令：

#### DOSEmailNotify ####

如果您运行有一个邮件服务器，您可以通过Apache发送警告消息。注意，如果SELinux已开启，您需要授权apache用户SELinux的权限来发送email。您可以通过下面的命令来授予权限：

    # setsebool -P httpd_can_sendmail 1

接下来，将这个指令和其他指令一起加入到mod\_evasive.conf文件。

    DOSEmailNotify you@yourdomain.com

如果这个指令设置了合适的值，并且您的邮件服务器在正常的运行，则当一个IP地址被加入黑名单时，会有一封邮件被发送到相应的地址。

#### DOSSystemCommand ####

它需要一个有效的系统命令作为参数，

    DOSSystemCommand </command>

这个指令指定当一个IP地址被加入黑名单时执行的命令。它通常结合shell脚本来使用，比如在脚本中添加一条防火墙规则来阻挡某个IP进一步的连接。

#####写一个shell脚本在防火墙阶段处理IP黑名单#####

当一个IP地址被加入黑名单，我们需要阻挡它进一步的连接。我们需要下面的shell脚本来执行这个任务。在/usr/local/bin下创建一个叫做scripts-tecmint的文件夹（或其他的名字），以及一个叫做ban_ip.sh的文件。

**用于iptables防火墙**

    #!/bin/sh
    # 由mod_evasive检测出，将被阻挡的IP地址
    IP=$1
    # iptables的完整路径
    IPTABLES="/sbin/iptables"
    # mod_evasive锁文件夹
    mod_evasive_LOGDIR=/var/log/mod_evasive
    # 添加下面的防火墙规则 (阻止所有从$IP流入的流量)
    $IPTABLES -I INPUT -s $IP -j DROP
    # 为了未来的检测，移除锁文件
    rm -f "$mod_evasive_LOGDIR"/dos-"$IP"

**用于firewalld防火墙**

    #!/bin/sh
    # 由mod_evasive检测出，将被阻挡的IP地址
    IP=$1
    # firewalld-cmd的完整路径
    FIREWALL_CMD="/usr/bin/firewall-cmd"
    # mod_evasive锁文件夹
    mod_evasive_LOGDIR=/var/log/mod_evasive
    # 添加下面的防火墙规则 (阻止所有从$IP流入的流量)
    $FIREWALL_CMD --zone=drop --add-source $IP
    # 为了未来的检测，移除锁文件
    rm -f "$mod_evasive_LOGDIR"/dos-"$IP"

我们的DOSSystemCommand指令应该是这样的：

    DOSSystemCommand "sudo /usr/local/bin/scripts-tecmint/ban_ip.sh %s"

上面一行的%s代表了由mod_evasive检测到的攻击IP地址。

#####将apache用户添加到sudoers文件#####

请注意，如果您不给予apache用户以无需终端和密码的方式运行我们脚本（关键就是这个脚本）的权限，则这一切都不起作用。通常，您只需要以root权限键入visudo来存取/etc/sudoers文件，接下来添加下面的两行即可：

    apache ALL=NOPASSWD: /usr/local/bin/scripts-tecmint/ban_ip.sh
    Defaults:apache !requiretty

![](http://www.tecmint.com/wp-content/uploads/2012/06/Add-Apache-User-to-Sudoers.png)

*添加Apache用户到Sudoers*

**重要**: 在默认的安全策略下您只能在终端中运行sudo。由于这个时候我们需要在没有tty的时候运行sudo，我们必须像下图中那样注释掉下面这一行：

    #Defaults requiretty

![](http://www.tecmint.com/wp-content/uploads/2012/06/Disable-tty-for-Sudo.png)

*为Sudo禁用tty*

最后，重启web服务器：

    # service httpd restart 		[在RHEL/CentOS 6和Fedora 20-18上]
    # systemctl restart httpd 		[在RHEL/CentOS 7和Fedora 21上]

### 步骤4: 在Apache上模拟DDos攻击 ###

有许多工具可以在您的服务器上模拟外部的攻击。您可以google下“tools for simulating ddos attacks”来找一找相关的工具。

注意，您（也只有您）将负责您模拟所造成的结果。请不要考虑向不在您自己网络中的服务器发起模拟攻击。

假如您想对一个由别人托管的VPS做这些事情，您需要向您的托管商发送适当的警告或就那样的流量通过他们的网络获得允许。Tecmint.com不会为您的行为负责！

另外，仅从一个主机发起一个Dos攻击的模拟无法代表真实的攻击。为了模拟真实的攻击，您需要使用许多客户端在同一时间将您的服务器作为目标。

我们的测试环境由一个CentOS 7服务器[IP 192.168.0.17]和一个Windows组成，在Windows[IP 192.168.0.103]上我们发起攻击：

![](http://www.tecmint.com/wp-content/uploads/2012/06/Confirm-Host-IPAddress.png)
I
*确认主机IP地址*

请播放下面的视频（YT 视频，请自备梯子： https://www.youtube.com/-U_mdet06Jk ），并跟从列出的步骤来模拟一个Dos攻击：

然后攻击者的IP将被防火墙阻挡:

![](http://www.tecmint.com/wp-content/uploads/2012/06/Blocked-Attacker-IP.png)

*阻挡攻击者的IP地址*

### 结论 ###

在开启mod\_security和mod\_evasive的情况下，模拟攻击会导致CPU和RAM用量在源IP地址被加入黑名单之前出现短暂几秒的使用峰值。如果没有这些模块，模拟攻击绝对会很快将服务器击溃，并使服务器在攻击期间无法提供服务。

我们很高兴听见您打算使用（或已经使用过）这些工具。我们期望得到您的反馈，所以，请在留言处留下您的评价和问题，谢谢！

### 参考链接 ###

- [https://www.modsecurity.org/][6]
- [http://www.zdziarski.com/blog/?page_id=442][7]

--------------------------------------------------------------------------------

via: http://www.tecmint.com/protect-apache-using-mod_security-and-mod_evasive-on-rhel-centos-fedora/

作者：[Gabriel Cánepa][a]
译者：[wwy-hust](https://github.com/wwy-hust)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:http://www.tecmint.com/install-lamp-in-centos-7/
[2]:https://linux.cn/article-4425-1.html
[3]:https://linux.cn/article-2324-1.html
[4]:https://www.owasp.org/index.php/Category:OWASP_ModSecurity_Core_Rule_Set_Project
[5]:https://github.com/SpiderLabs/ModSecurity/wiki/Reference-Manual#Configuration_Directives
[6]:https://www.modsecurity.org/
[7]:http://www.zdziarski.com/blog/?page_id=442