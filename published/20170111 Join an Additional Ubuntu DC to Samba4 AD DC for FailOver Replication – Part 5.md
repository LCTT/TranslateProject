Samba 系列（五）：将另一台 Ubuntu DC 服务器加入到 Samba4 AD DC 实现双域控主机模式
============================================================

这篇文章将讲解如何使用 **Ubuntu 16.04** 服务器版系统来创建第二台 **Samba4** 域控制器，并将其加入到已创建好的 **Samba AD DC** 林环境中，以便为一些关键的 AD DC 服务提供负载均衡及故障切换功能，尤其是为那些重要的服务，比如 DNS 服务和使用 SAM 数据库的 AD DC LDAP 模式。

#### 需求

这篇文章是 **Samba4 AD DC** 系列的第**五**篇，前边几篇如下：

1、[在 Ubuntu16.04 系统上使用 Samba4 软件来创建活动目录架构（一）][1]

2、[在 Linux 命令行下管理 Samba4 AD 架构（二）][2]

3、[使用 Windows 10 系统的 RSAT 工具来管理 Samba4 活动目录架构 （三）][3]

4、[在 Windows 系统下管理 Samba4 AD 域管制器 DNS 和组策略（四）][4]

### 第一步：为设置 Samba4 进行初始化配置

1、在开始把第二个 DC 服务器加入到 **Samba4 AD DC** 域环境之前，你需要注意一些初始化设置信息，首先，确保这个新系统的**主机名**包含描述性名称。

假设第一个域服务器的主机名叫做 `adc1` ，你可以把第二个域服务器命名为 `adc2`，以保持域控制器名称的一致性。

执行下面的命令来修改系统**主机名**：

```
# hostnamectl set-hostname adc2
```

或者你也可以手动编辑 `/etc/hostname` 文件，在新的一行输入你想设置的主机名。

```
# nano /etc/hostname
```

这里添加主机名。

```
adc2
```

2、下一步，打开本地系统解析文件并添加一个条目，包含主域控制器的 IP 地址和 FQDN 名称。如下图所示：

在这篇教程中，主域控服务器的主机名为 `adc1.tecmint.lan` ，其对应的 IP 地址为 192.168.1.254 。

```
# nano /etc/hosts
```

添加如下行：

```
IP_of_main_DC		FQDN_of_main_DC 	short_name_of_main_DC
```
[
 ![Set Hostname for Samba4 AD DC](http://www.tecmint.com/wp-content/uploads/2017/01/Set-Hostname-for-Samba4-AD-DC.jpg) 
][5]

*为 Samba4 AD DC 服务器设置主机名*

3、下一步，打开 `/etc/network/interfaces` 配置文件并设置一个静态 IP 地址，如下图所示：

注意 `dns-nameservers` 和 `dns-search` 这两个参数的值。为了使 DNS 解析正常工作，需要把这两个值设置成主 Samba4 AD DC 服务器的 IP 地址和域名。

重启网卡服务以让修改的配置生效。检查 `/etc/resolv.conf` 文件，确保该网卡上配置的这两个 DNS 的值已更新到这个文件。

```
# nano /etc/network/interfaces
```

编辑并替换你自定义的 IP 设置：

```
auto ens33
iface ens33 inet static
address 192.168.1.253
netmask 255.255.255.0
brodcast 192.168.1.1
gateway 192.168.1.1
dns-nameservers 192.168.1.254
dns-search tecmint.lan
```

重启网卡服务并确认生效。

```
# systemctl restart networking.service
# cat /etc/resolv.conf
```
[
 ![Configure DNS for Samba4 AD](http://www.tecmint.com/wp-content/uploads/2017/01/Configure-DNS-for-Samba4-AD.jpg) 
][6]

*配置 Samba4 AD 服务器的 DNS*

当你通过简写名称（用于构建 FQDN 名）查询主机名时， `dns-search` 值将会自动把域名添加上。

4、为了测试 DNS 解析是否正常，使用一系列 ping 命令测试，命令后分别为简写名， FQDN 名和域名，如下图所示：

在所有测试用例中，**Samba4 AD DC DNS** 服务器都应该返回主域控服务器的 IP 地址。

[
 ![Verify DNS Resolution for Samba4 AD](http://www.tecmint.com/wp-content/uploads/2017/01/Verify-DNS-Resolution-for-Samba4-AD.png) 
][7]

*验证 Samba4 AD 环境 DNS 解析是否正常*

5、最后你需要注意的是确保这个主机跟域控服务器时间同步。你可以通过下面的命令在系统上安装 **NTP** 客户端工具来实现时间同步功能：

```
# apt-get install ntpdate
```

6、假设你想手动强制本地服务器与 **samba4 AD DC** 服务器时间同步，使用 `ntpdate` 命令加上主域控服务器的主机名，如下所示：

```
# ntpdate adc1
```
[
 ![Time Synchronize with Samba4 AD](http://www.tecmint.com/wp-content/uploads/2017/01/Time-Synchronize-with-Samba4-AD.png) 
][8]

*与 Samba4 AD 服务器进行时间同步*

### 第 2 步：安装 Samba4 必须的依赖包

7、为了让 **Ubuntu 16.04** 系统加入到你的域中，你需要通过下面的命令从 Ubuntu 官方软件库中安装 **Samba4 套件、 Kerberos 客户端** 和其它一些重要的软件包以便将来使用：

```
# apt-get install samba krb5-user krb5-config winbind libpam-winbind libnss-winbind
```
[
 ![Install Samba4 in Ubuntu](http://www.tecmint.com/wp-content/uploads/2017/01/Install-Samba4-in-Ubuntu.png) 
][9]

*在 Ubuntu 系统中安装 Samba4*

8、在安装的过程中，你需要提供 Kerberos 域名。输入大写的域名然后按回车键完成安装过程。

[
 ![Configure Kerberos Authentication for Samba4](http://www.tecmint.com/wp-content/uploads/2017/01/Configure-Kerberos-Authentication-for-Samba4.png) 
][10]

*为 Samba4 配置 Kerberos 认证*

9、所有依赖包安装完成后，通过使用 `kinit` 命令为域管理员请求一个 Kerberos 票据以验证设置是否正确。使用 `klist` 命令来列出已授权的 kerberos 票据信息。

```
# kinit domain-admin-user@YOUR_DOMAIN.TLD
# klist
```
[
 ![Verify Kerberos on Samba4 Domain](http://www.tecmint.com/wp-content/uploads/2017/01/Verify-Kerberos-on-Samba4-Domain.png) 
][11]

*在 Samba4 域环境中验证 Kerberos*

### 第 3 步：以域控制器的身份加入到 Samba4 AD DC

10、在把你的机器集成到 **Samba4 DC** 环境之前，先把系统中所有运行着的 Samba4 服务停止，并且重命名默认的 Samba 配置文件以便从头开始。在域控制器配置的过程中， Samba 将会创建一个新的配置文件。

```
# systemctl stop samba-ad-dc smbd nmbd winbind
# mv /etc/samba/smb.conf /etc/samba/smb.conf.initial
```

11、在准备加入域前，先启动 **samba-ad-dc** 服务，之后使用域管理员账号运行 `samba-tool` 命令将服务器加入到域。

```
# samba-tool domain join your_domain -U "your_domain_admin"
```

加入域过程部分截图:

```
# samba-tool domain join tecmint.lan DC -U "tecmint_user"
```

输出示例：

```
Finding a writeable DC for domain 'tecmint.lan'
Found DC adc1.tecmint.lan
Password for [WORKGROUP\tecmint_user]:
workgroup is TECMINT
realm is tecmint.lan
checking sAMAccountName
Deleted CN=ADC2,CN=Computers,DC=tecmint,DC=lan
Adding CN=ADC2,OU=Domain Controllers,DC=tecmint,DC=lan
Adding CN=ADC2,CN=Servers,CN=Default-First-Site-Name,CN=Sites,CN=Configuration,DC=tecmint,DC=lan
Adding CN=NTDS Settings,CN=ADC2,CN=Servers,CN=Default-First-Site-Name,CN=Sites,CN=Configuration,DC=tecmint,DC=lan
Adding SPNs to CN=ADC2,OU=Domain Controllers,DC=tecmint,DC=lan
Setting account password for ADC2$
Enabling account
Calling bare provision
Looking up IPv4 addresses
Looking up IPv6 addresses
No IPv6 address will be assigned
Setting up share.ldb
Setting up secrets.ldb
Setting up the registry
Setting up the privileges database
Setting up idmap db
Setting up SAM db
Setting up sam.ldb partitions and settings
Setting up sam.ldb rootDSE
Pre-loading the Samba 4 and AD schema
A Kerberos configuration suitable for Samba 4 has been generated at /var/lib/samba/private/krb5.conf
Provision OK for domain DN DC=tecmint,DC=lan
Starting replication
Schema-DN[CN=Schema,CN=Configuration,DC=tecmint,DC=lan] objects[402/1550] linked_values[0/0]
Schema-DN[CN=Schema,CN=Configuration,DC=tecmint,DC=lan] objects[804/1550] linked_values[0/0]
Schema-DN[CN=Schema,CN=Configuration,DC=tecmint,DC=lan] objects[1206/1550] linked_values[0/0]
Schema-DN[CN=Schema,CN=Configuration,DC=tecmint,DC=lan] objects[1550/1550] linked_values[0/0]
Analyze and apply schema objects
Partition[CN=Configuration,DC=tecmint,DC=lan] objects[402/1614] linked_values[0/0]
Partition[CN=Configuration,DC=tecmint,DC=lan] objects[804/1614] linked_values[0/0]
Partition[CN=Configuration,DC=tecmint,DC=lan] objects[1206/1614] linked_values[0/0]
Partition[CN=Configuration,DC=tecmint,DC=lan] objects[1608/1614] linked_values[0/0]
Partition[CN=Configuration,DC=tecmint,DC=lan] objects[1614/1614] linked_values[28/0]
Replicating critical objects from the base DN of the domain
Partition[DC=tecmint,DC=lan] objects[97/97] linked_values[24/0]
Partition[DC=tecmint,DC=lan] objects[380/283] linked_values[27/0]
Done with always replicated NC (base, config, schema)
Replicating DC=DomainDnsZones,DC=tecmint,DC=lan
Partition[DC=DomainDnsZones,DC=tecmint,DC=lan] objects[45/45] linked_values[0/0]
Replicating DC=ForestDnsZones,DC=tecmint,DC=lan
Partition[DC=ForestDnsZones,DC=tecmint,DC=lan] objects[18/18] linked_values[0/0]
Committing SAM database
Sending DsReplicaUpdateRefs for all the replicated partitions
Setting isSynchronized and dsServiceName
Setting up secrets database
Joined domain TECMINT (SID S-1-5-21-715537322-3397311598-55032968) as a DC
```

[
 ![Join Domain to Samba4 AD DC](http://www.tecmint.com/wp-content/uploads/2017/01/Join-Domain-to-Samba4-AD-DC.png) 
][12]

*把域加入到 Samba4 AD DC*

12、在已安装了 Samba4 套件的 Ubuntu 系统加入域之后，打开 Samba 主配置文件添加如下行：

```
# nano /etc/samba/smb.conf
```

添加以下内容到 `smb.conf` 配置文件中。

```
dns forwarder = 192.168.1.1
idmap_ldb:use rfc2307 = yes
template shell = /bin/bash
winbind use default domain = true
winbind offline logon = false
winbind nss info = rfc2307
winbind enum users = yes
winbind enum groups = yes
```

使用你自己的 **DNS 转发器 IP** 地址替换掉上面 `dns forwarder` 地址。 Samba 将会把域权威区之外的所有 DNS 解析查询转发到这个 IP 地址。

13、最后，重启 samba 服务以使修改的配置生效，然后执行如下命令来检查活动目录复制功能是否正常。

```
# systemctl restart samba-ad-dc
# samba-tool drs showrepl
```

[
 ![Configure Samba4 DNS](http://www.tecmint.com/wp-content/uploads/2017/01/Configure-Samba4-DNS.png) 
][13]

*配置 Samba4 DNS*

14、另外，还需要重命名原来的 `/etc `下的 kerberos 配置文件，并使用在加入域的过程中 Samba 生成的新配置文件 krb5.conf 替换它。

Samba 生成的新配置文件在 `/var/lib/samba/private` 目录下。使用 Linux 的符号链接将该文件链接到 `/etc` 目录。

```
# mv /etc/krb6.conf /etc/krb5.conf.initial
# ln -s /var/lib/samba/private/krb5.conf /etc/
# cat /etc/krb5.conf
```
[
 ![Configure Kerberos](http://www.tecmint.com/wp-content/uploads/2017/01/Configure-Kerberos.jpg) 
][14]

*配置 Kerberos*

15、同样，使用 samba 的 `krb5.conf` 配置文件验证 Kerberos 认证是否正常。通过以下命令来请求一个管理员账号的票据并且列出已缓存的票据信息。

```
# kinit administrator
# klist
```
[
 ![Verify Kerberos Authentication with Samba](http://www.tecmint.com/wp-content/uploads/2017/01/Verify-Kerberos-Authentication-with-Samba.jpg) 
][15]

*使用 Samba 验证 Kerberos 认证是否正常*

### 第 4 步：验证其它域服务

16、你首先要做的一个测试就是验证 **Samba4 DC DNS** 解析服务是否正常。要验证域 DNS 解析情况，使用 `host` 命令，加上一些重要的 AD DNS 记录，进行域名查询，如下图所示：

每一次查询，DNS 服务器都应该返回两个 IP 地址。

```
# host your_domain.tld
# host -t SRV _kerberos._udp.your_domain.tld  # UDP Kerberos SRV record
# host -t SRV _ldap._tcp.your_domain.tld  # TCP LDAP SRV record
```
[
 ![Verify Samba4 DC DNS](http://www.tecmint.com/wp-content/uploads/2017/01/Verify-Samba4-DC-DNS.png) 
][16]

*验证 Samba4 DC DNS *

17、这些 DNS 记录也可以从注册过的[已安装了 RSAT 工具的 Windows 机器][17]上查询到。打开 DNS 管理器，展开到你的域 tcp 记录，如下图所示：

[
 ![Verify DNS Records on Windows RSAT Tool](http://www.tecmint.com/wp-content/uploads/2017/01/Verify-DNS-Records-on-Windows-RSAT-Tool.png) 
][18]

*通过 Windows RSAT 工具来验证 DNS 记录*

18、下一个验证是检查域 LDAP 复制同步是否正常。使用 `samba-tool` 工具，在第二个域控制器上创建一个账号，然后检查该账号是否自动同步到第一个 Samba4 AD DC 服务器上。

在 adc2 上：

```
# samba-tool user add test_user
```

在 adc1 上：

```
# samba-tool user list | grep test_user
```
[
 ![Create User Account on Samba4 AD](http://www.tecmint.com/wp-content/uploads/2017/01/Create-User-Account-on-Samba4-AD.jpg) 
][19]

*在 Samba4 AD 服务器上创建账号*

[
 ![Verify Replication on Samba4 AD](http://www.tecmint.com/wp-content/uploads/2017/01/Verify-Replication-on-Samba4-AD.jpg) 
][20]

*在 Samba4 AD 服务器上验证同步功能*

19、你也可以从 **Microsoft AD DC** 控制台创建一个账号，然后验证该账号是否都出现在两个域控服务器上。

默认情况下，这个账号都应该在两个 samba 域控制器上自动创建完成。在 `adc1` 服务器上使用 `wbinfo` 命令查询该账号名。

[
 ![Create Account from Microsoft AD UC](http://www.tecmint.com/wp-content/uploads/2017/01/Create-Account-from-Microsoft-AD-UC.png) 
][21]

*从 Microsoft AD UC 创建账号*

[
 ![Verify Account Replication On Samba4 AD](http://www.tecmint.com/wp-content/uploads/2017/01/Verify-Account-Replication-On-Samba4-AD.png) 
][22]

*在 Samba4 AD 服务器上验证账号同步功能*

20、实际上，打开 Windows 机器上的 **AD DC** 控制台，展开到域控制器，你应该看到两个已注册的 DC 服务器。

[
 ![Verify Samba4 Domain Controllers](http://www.tecmint.com/wp-content/uploads/2017/01/Verify-Samba4-Domain-Controllers.png) 
][23]

*验证 Samba4 域控制器*

### 第 5 步：启用 Samba4 AD DC 服务

21、要在整个系统启用 Samba4 AD DC 的服务，首先你得禁用原来的不需要的 Samba 服务，然后执行如下命令仅启用 samba-ad-dc 服务：

```
# systemctl disable smbd nmbd winbind
# systemctl enable samba-ad-dc
```
[
 ![Enable Samba4 AD DC Services](http://www.tecmint.com/wp-content/uploads/2017/01/Enable-Samba4-AD-DC-Services.png) 
][24]

*启用 Samba4 AD DC 服务*

22、如果你从 Microsoft 客户端远程管理 Samba4 域控制器，或者有其它 Linux 或 Windows 客户机集成到当前域中，请确保在它们的网卡 DNS 服务器地址设置中提及 `adc2` 服务器的 IP 地址，以实现某种程序上的冗余。

下图显示 Windows 和 Debian/Ubuntu 客户机的网卡配置要求。

[
 ![Configure Client to Administer Samba4 DC](http://www.tecmint.com/wp-content/uploads/2017/01/Configure-Client-to-Administer-Samba4-DC.png) 
][25]

*配置 Windows 客户端来管理 Samba4 DC*

[
 ![Configure Linux Client to Administer Samba4 DC](http://www.tecmint.com/wp-content/uploads/2017/01/Configure-Linux-Client-to-Administer-Samba4-DC.png) 
][26]

*配置 Linux 客户端来管理 Samba4 DC*

如果第一台 DC 服务器 192.168.1.254 网络不通，则调整配置文件中 DNS 服务器 IP 地址的顺序，以免先查询这台不可用的 DNS 服务器。

最后，如果你想在 Linux 系统上使用 Samba4 活动目录账号来进行本地认证，或者为 AD LDAP 账号授予 root 权限，请查看[在 Linux 命令行下管理 Samba4 AD 架构][27] 这篇教程的 第 2 步和第 3 步。

--------------------------------------------------------------------------------

作者简介：

![](http://1.gravatar.com/avatar/7badddbc53297b2e8ed7011cf45df0c0?s=128&d=blank&r=g)

我叫 Ravi Saive，TecMint 网站博主。一个喜欢在网上分享技术知识及经验的电脑极客和 Linux 系统专家。我的大多数的服务器都运行在 Linux 开源平台上。关注我：Twitter ，Facebook 和 Google+ 。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/join-additional-ubuntu-dc-to-samba4-ad-dc-failover-replication/

作者：[Ravi Saive][a]
译者：[rusking](https://github.com/rusking)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/admin/
[1]:http://www.tecmint.com/install-samba4-active-directory-ubuntu/
[2]:http://www.tecmint.com/manage-samba4-active-directory-linux-command-line/
[3]:http://www.tecmint.com/manage-samba4-ad-from-windows-via-rsat/
[4]:http://www.tecmint.com/manage-samba4-dns-group-policy-from-windows/
[5]:http://www.tecmint.com/wp-content/uploads/2017/01/Set-Hostname-for-Samba4-AD-DC.jpg
[6]:http://www.tecmint.com/wp-content/uploads/2017/01/Configure-DNS-for-Samba4-AD.jpg
[7]:http://www.tecmint.com/wp-content/uploads/2017/01/Verify-DNS-Resolution-for-Samba4-AD.png
[8]:http://www.tecmint.com/wp-content/uploads/2017/01/Time-Synchronize-with-Samba4-AD.png
[9]:http://www.tecmint.com/wp-content/uploads/2017/01/Install-Samba4-in-Ubuntu.png
[10]:http://www.tecmint.com/wp-content/uploads/2017/01/Configure-Kerberos-Authentication-for-Samba4.png
[11]:http://www.tecmint.com/wp-content/uploads/2017/01/Verify-Kerberos-on-Samba4-Domain.png
[12]:http://www.tecmint.com/wp-content/uploads/2017/01/Join-Domain-to-Samba4-AD-DC.png
[13]:http://www.tecmint.com/wp-content/uploads/2017/01/Configure-Samba4-DNS.png
[14]:http://www.tecmint.com/wp-content/uploads/2017/01/Configure-Kerberos.jpg
[15]:http://www.tecmint.com/wp-content/uploads/2017/01/Verify-Kerberos-Authentication-with-Samba.jpg
[16]:http://www.tecmint.com/wp-content/uploads/2017/01/Verify-Samba4-DC-DNS.png
[17]:http://www.tecmint.com/manage-samba4-ad-from-windows-via-rsat/
[18]:http://www.tecmint.com/wp-content/uploads/2017/01/Verify-DNS-Records-on-Windows-RSAT-Tool.png
[19]:http://www.tecmint.com/wp-content/uploads/2017/01/Create-User-Account-on-Samba4-AD.jpg
[20]:http://www.tecmint.com/wp-content/uploads/2017/01/Verify-Replication-on-Samba4-AD.jpg
[21]:http://www.tecmint.com/wp-content/uploads/2017/01/Create-Account-from-Microsoft-AD-UC.png
[22]:http://www.tecmint.com/wp-content/uploads/2017/01/Verify-Account-Replication-On-Samba4-AD.png
[23]:http://www.tecmint.com/wp-content/uploads/2017/01/Verify-Samba4-Domain-Controllers.png
[24]:http://www.tecmint.com/wp-content/uploads/2017/01/Enable-Samba4-AD-DC-Services.png
[25]:http://www.tecmint.com/wp-content/uploads/2017/01/Configure-Client-to-Administer-Samba4-DC.png
[26]:http://www.tecmint.com/wp-content/uploads/2017/01/Configure-Linux-Client-to-Administer-Samba4-DC.png
[27]:http://www.tecmint.com/manage-samba4-active-directory-linux-command-line/
