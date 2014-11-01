在ubuntu14.04上配置SNMPv3
============================================
简单网络管理协议（SNMP）是用于IP网络设备管理的标准协议。典型的支持SNMP协议的设备有路由器、交换机、服务器、工作站、打印机及数据机柜等等。SNMP一般被网络管理系统用于按照管理员设定的条件来监视网络附加设备。SNMP是因特网协议套件中的一个组成部分，它由IETF机构定义。它包含一系列的网络管理标准，其中有一个应用层协议，一个数据库架构以及一组数据对象。

SNMP将管理数据以变量的形式展示出来，这些变量描述了系统配置。同时这些变量可以被用于管理的应用查询（或者被设置）。

### 为什么需要使用SNMPv3 ###

尽管SNMPv3所增加的加密功能并不影响协议层面，但是新的文本惯例、概念及术语使得它看起来很不一样。

SNMPv3在SNMP的基础之上增强了安全性以及远程配置功能。

最初，SNMP最大的缺点就是安全性弱。SNMP的第一与第二个版本中，身份验证仅仅是在管理员与代理间传送一个明文的密码而已。目前每一个SNMPv3的信息都包含了被编码成8进制的安全参数。这些安全参数的具体意义由所选用的安全模型决定。

SNMPv3提供了重要的安全特性：

- 保密性 —— 加密数据包以防止未经授权的源监听。

- 完整性 —— 数据的完整性特性确保数据在传输的时候没有被干扰，并且包含了可选的数据响应保护机制。

- 身份验证 —— 检查数据是否来自一个合法的源。

### 在ubuntu中安装SNMP服务器及客户端 ###

打开终端运行下列命令

    sudo apt-get install snmpd snmp

安装完成后需要做如下改变。

###配置SNMPv3###

获得从外部守护进程访问的权限 

默认的安装仅提供本地的访问权限，如果想要获得外部访问权限，打开文件 /etc/default/snmpd。

    sudo vi /etc/default/snmpd

改变下列内容

将

    SNMPDOPTS='-Lsd -Lf /dev/null -u snmp -g snmp -I -smux,mteTrigger,mteTriggerConf -p /var/run/snmpd.pid'

改为
    
    SNMPDOPTS='-Lsd -Lf /dev/null -u snmp -I -smux -p /var/run/snmpd.pid -c /etc/snmp/snmpd.conf'

最后重启 snmpd

    sudo /etc/init.d/snmpd restart

###定义 SNMPv3 用户，身份验证以及加密参数 ###

“securityLevel”参数使得SNMPv3有多种不同的用途。

- noAuthNoPriv —— 没有授权，加密以及任何安全保护！

- authNoPriv —— 需要身份认证，但是不对通过网络发送的数据进行加密。 

- autoPriv —— 最可靠模式。需要身份认证而且数据会被加密。

snmpd 的配置以及设置都保存在文件 /etc/snmp/snmpd.conf。使用编辑器编辑文件：

    sudo vi /etc/snmp/snmpd.conf

在文件末尾添加以下内容：

    #
    createUser user1
    createUser user2 MD5 user2password
    createUser user3 MD5 user3password DES user3encryption
    #
    rouser user1 noauth 1.3.6.1.2.1.1
    rouser user2 auth 1.3.6.1.2.1
    rwuser user3 priv 1.3.6.1.2.1

注：如果你需要使用自己的用户名/密码对的话，请注意密码及加密短语的最小长度是8个字符。

同时，你需要做如下的配置以便snmp可以监听来自任何接口的连接请求。

将

    #agentAddress udp:161,udp6:[::1]:161

改为

    agentAddress udp:161,udp6:[::1]:161

保存改变后的snmpd.conf文件并且重启守护进程：

    sudo /etc/init.d/snmpd restart
    
--------------------------------------------------------------------------------

via: http://www.ubuntugeek.com/how-to-configure-snmpv3-on-ubuntu-14-04-server.html

译者：[SPccman](https://github.com/SPccman)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
