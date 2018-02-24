Translated by shipsw

20 个 OpenSSH 安全实践  
======  
![OpenSSH 安全提示][1]

OpenSSH 是 SSH 协议的一个实现。一般被 scp 或 sftp 用在远程登录、备份、远程文件传输等功能上。SSH能够完美保障两个网络或系统间数据传输的保密性和完整性。尽管如此，他主要用在使用公匙加密的服务器验证上。不时出现关于 OpenSSH 零日漏洞的[谣言][2]。本文描述**如何设置你的 Linux 或类 Unix 系统以提高 sshd 的安全性**。


#### OpenSSH 默认设置

  * TCP 端口 - 22
  * OpenSSH 服务配置文件 - sshd_config (位于 /etc/ssh/)



#### 1. 基于公匙的登录

OpenSSH 服务支持各种验证方式。推荐使用公匙加密验证。首先，使用以下 ssh-keygen 命令在本地电脑上创建密匙对：

低于 1024 位的 DSA 和 RSA 加密是很弱的，请不要使用。RSA 密匙主要是在考虑 ssh 客户端兼容性的时候代替 ECDSA 密匙使用的。

```
$ ssh-keygen -t key_type -b bits -C "comment"
$ ssh-keygen -t ed25519 -C "Login to production cluster at xyz corp"
$ ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa_aws_$(date +%Y-%m-%d) -C "AWS key for abc corp clients"
```
下一步，使用 ssh-copy-id 命令安装公匙：
```
$ ssh-copy-id -i /path/to/public-key-file user@host
$ ssh-copy-id user@remote-server-ip-or-dns-name
$ ssh-copy-id vivek@rhel7-aws-server
```
提示输入用户名和密码的时候，使用你自己的 ssh 公匙：  
`$ ssh vivek@rhel7-aws-server`  
[![OpenSSH 服务安全最佳实践][3]][3]  
更多有关 ssh 公匙的信息，参照以下文章：

*   [为备份脚本设置无密码安全登录][48]

*   [sshpass: 使用脚本密码登录SSH服务器][49]

*   [如何为一个 Linux/类Unix 系统设置 SSH 登录密匙][50]

*   [如何使用 Ansible 工具上传 ssh 登录授权公匙][51]


#### 2. 禁用 root 用户登录

禁用 root 用户登录前，确认普通用户可以以 root 身份登录。例如，允许用户 vivek 使用 sudo 命令以 root 身份登录。

##### 在 Debian/Ubuntu 系统中如何将用户 vivek 添加到 sudo 组中

允许 sudo 组中的用户执行任何命令。 [将用户 vivek 添加到 sudo 组中][4]:  
`$ sudo adduser vivek sudo`  
使用 [id 命令][5] 验证用户组。  
`$ id vivek`

##### 在 CentOS/RHEL 系统中如何将用户 vivek 添加到 sudo 组中

在 CentOS/RHEL 和 Fedora 系统中允许 wheel 组中的用户执行所有的命令。使用 uermod 命令将用户 vivek 添加到 wheel 组中：
```
$ sudo usermod -aG wheel vivek
$ id vivek
```

##### 测试 sudo 权限并禁用 ssh root 登录

测试并确保用户 vivek 可以以 root 身份登录执行以下命令：
```
$ sudo -i
$ sudo /etc/init.d/sshd status
$ sudo systemctl status httpd
```
添加以下内容到 sshd_config 文件中来禁用 root 登录。
```
PermitRootLogin no
ChallengeResponseAuthentication no
PasswordAuthentication no
UsePAM no
```
更多信息参见“[如何通过禁用 Linux 的 ssh 密码登录来增强系统安全][6]” 。

#### 3. 禁用密码登录

所有的密码登录都应该禁用，仅留下公匙登录。添加以下内容到 sshd_config 文件中：
```
AuthenticationMethods publickey
PubkeyAuthentication yes
```
CentOS 6.x/RHEL 6.x 系统中老版本的 SSHD 用户可以使用以下设置：
```
PubkeyAuthentication yes
```

#### 4. 限制用户的 ssh 权限

默认状态下，所有的系统用户都可以使用密码或公匙登录。但是有些时候需要为 FTP 或者 email 服务创建 UNIX/Linux 用户。所以，这些用户也可以使用 ssh 登录系统。他们将获得访问系统工具的完整权限，包括编译器和诸如 Perl、Python(可以打开网络端口干很多疯狂的事情) 等的脚本语言。通过添加以下内容到 sshd_config 文件中来仅允许用户 root、vivek 和 jerry 通过 SSH 登录系统：  
`AllowUsers vivek jerry`  
当然，你也可以添加以下内容到 sshd_config 文件中来达到仅拒绝一部分用户通过 SSH 登录系统的效果。  
`DenyUsers root saroj anjali foo`  
你也可以通过[配置 Linux PAM][7] 来禁用或允许用户通过 sshd 登录。也可以允许或禁止一个[用户组列表][8]通过 ssh 登录系统。

#### 5. 禁用空密码

你需要明确禁止空密码账户远程登录系统，更新 sshd_config 文件的以下内容：  
`PermitEmptyPasswords no`

#### 6. 为 ssh 用户或者密匙使用强密码

为密匙使用强密码和短语的重要性再怎么强调都不过分。暴力破解可以起作用就是因为用户使用了基于字典的密码。你可以强制用户避开字典密码并使用[约翰的开膛手工具][10]来检测弱密码。以下是一个随机密码生成器(放到你的 ~/.bashrc 下)：
```
genpasswd() {
	local l=$1
       	[ "$l" == "" ] && l=20
      	tr -dc A-Za-z0-9_ < /dev/urandom | head -c ${l} | xargs
}
```

运行：  
`genpasswd 16`
输出：  
```
uw8CnDVMwC6vOKgW
```
*   [使用 mkpasswd / makepasswd / pwgen 生成随机密码][52]

*   [Linux / UNIX: 生成密码][53]

*   [Linux 随机密码生成命令][54]

--------------------------------------------------------------------------------

#### 7. 为 SSH 端口 # 22 配置防火墙

你需要更新 iptables/ufw/firewall-cmd 或 pf firewall 来为 ssh TCP 端口 # 22 配置防火墙。一般来说，OpenSSH 服务应该仅允许本地或者其他的远端地址访问。

##### Netfilter (Iptables) 配置

更新 [/etc/sysconfig/iptables (Redhat和其派生系统特有文件) ][11] 实现仅接受来自于 192.168.1.0/24 和 202.54.1.5/29 的连接, 输入:
```
-A RH-Firewall-1-INPUT -s 192.168.1.0/24 -m state --state NEW -p tcp --dport 22 -j ACCEPT
-A RH-Firewall-1-INPUT -s 202.54.1.5/29 -m state --state NEW -p tcp --dport 22 -j ACCEPT
```

如果同时使用 IPv6 的话，可以编辑/etc/sysconfig/ip6tables(Redhat 和其派生系统特有文件)，输入：
```
-A RH-Firewall-1-INPUT -s ipv6network::/ipv6mask -m tcp -p tcp --dport 22 -j ACCEPT

```

将 ipv6network::/ipv6mask 替换为实际的 IPv6 网段。

##### Debian/Ubuntu Linux 下的 UFW

[UFW 是 uncomplicated firewall 的首字母缩写，主要用来管理 Linux 防火墙][12]，目的是提供一种用户友好的界面。输入[以下命令使得系统进允许网段 202.54.1.5/29 接入端口 22][13]：  
`$ sudo ufw allow from 202.54.1.5/29 to any port 22`  
更多信息请参见 "[Linux: 菜鸟管理员的 25 个 Iptables Netfilter 命令][14]"。

##### *BSD PF 防火墙配置

如果使用 PF 防火墙 [/etc/pf.conf][15] 配置如下：
```
pass in on $ext_if inet proto tcp from {192.168.1.0/24, 202.54.1.5/29} to $ssh_server_ip port ssh flags S/SA synproxy state
```

#### 8. 修改 SSH 端口和绑定 IP

SSH 默认监听系统中所有可用的网卡。修改并绑定 ssh 端口有助于避免暴力脚本的连接(许多暴力脚本只尝试端口 22)。更新文件 sshd_config 的以下内容来绑定端口 300 到 IP 192.168.1.5 和 202.54.1.5：
```
Port 300 
ListenAddress 192.168.1.5
ListenAddress 202.54.1.5
```

端口 300 监听地址 192.168.1.5 监听地址 202.54.1.5  

当需要接受动态广域网地址的连接时，使用主动脚本是个不错的选择，比如 fail2ban 或 denyhosts。

#### 9. 使用 TCP wrappers (可选的)

TCP wrapper 是一个基于主机的访问控制系统，用来过滤来自互联网的网络访问。OpenSSH 支持 TCP wrappers。只需要更新文件 /etc/hosts.allow 中的以下内容就可以使得 SSH 只接受来自于 192.168.1.2 和 172.16.23.12 的连接：
```
sshd : 192.168.1.2 172.16.23.12
```

在 Linux/Mac OS X 和类 UNIX 系统中参见 [TCP wrappers 设置和使用的常见问题][16]。

#### 10. 阻止 SSH 破解或暴力攻击

暴力破解是一种在单一或者分布式网络中使用大量组合(用户名和密码的组合)来尝试连接一个加密系统的方法。可以使用以下软件来应对暴力攻击：

  * [DenyHosts][17] 是一个基于 Python SSH 安全工具。该工具通过监控授权日志中的非法登录日志并封禁原始IP的方式来应对暴力攻击。
  * RHEL / Fedora 和 CentOS Linux 下如何设置 [DenyHosts][18]。
  * [Fail2ban][19] 是另一个类似的用来预防针对 SSH 攻击的工具。
  * [sshguard][20] 是一个使用 pf 来预防针对 SSH 和其他服务攻击的工具。
  * [security/sshblock][21] 阻止滥用 SSH 尝试登录。
  * [IPQ BDB filter][22] 可以看做是 fail2ban 的一个简化版。



#### 11. 限制 TCP 端口 # 22 的传入速率 (可选的)

netfilter 和 pf 都提供速率限制选项可以对端口 # 22 的传入速率进行简单的限制。

##### Iptables 示例

以下脚本将会阻止 60 秒内尝试登录 5 次以上的客户端的连入。
```
#!/bin/bash
inet_if=eth1
ssh_port=22
$IPT -I INPUT -p tcp --dport ${ssh_port} -i ${inet_if} -m state --state NEW -m recent  --set
$IPT -I INPUT -p tcp --dport ${ssh_port} -i ${inet_if} -m state --state NEW -m recent  --update --seconds 60 --hitcount 5
```

在你的 iptables 脚本中调用以上脚本。其他配置选项：
```
$IPT -A INPUT  -i ${inet_if} -p tcp --dport ${ssh_port} -m state --state NEW -m limit --limit 3/min --limit-burst 3 -j ACCEPT
$IPT -A INPUT  -i ${inet_if} -p tcp --dport ${ssh_port} -m state --state ESTABLISHED -j ACCEPT
$IPT -A OUTPUT -o ${inet_if} -p tcp --sport ${ssh_port} -m state --state ESTABLISHED -j ACCEPT
# another one line example
# $IPT -A INPUT -i ${inet_if} -m state --state NEW,ESTABLISHED,RELATED -p tcp --dport 22 -m limit --limit 5/minute --limit-burst 5-j ACCEPT
```

其他细节参见 iptables 用户手册。

##### *BSD PF 示例

以下脚本将限制每个客户端的连入数量为 20，并且 5 秒范围的连接不超过 15 个。如果客户端触发此规则则将其加入 abusive_ips 表并限制该客户端连入。最后 flush 关键词杀死所有触发规则的客户端的状态。
```
sshd_server_ip = "202.54.1.5" 
table <abusive_ips> persist
block in quick from <abusive_ips>
pass in on $ext_if proto tcp to $sshd_server_ip port ssh flags S/SA keep state (max-src-conn 20, max-src-conn-rate 15/5, overload <abusive_ips> flush) 
```

#### 12. 使用端口敲门 (可选的)

[端口敲门][23]是通过在一组预先指定的封闭端口上生成连接尝试来从外部打开防火墙上的端口的方法。一旦指定的端口连接顺序被触发，防火墙规则就被动态修改以允许发送连接的主机连入指定的端口。以下是一个使用 iptables 实现的端口敲门的示例：
```
$IPT -N stage1
$IPT -A stage1 -m recent --remove --name knock
$IPT -A stage1 -p tcp --dport 3456 -m recent --set --name knock2
 
$IPT -N stage2
$IPT -A stage2 -m recent --remove --name knock2
$IPT -A stage2 -p tcp --dport 2345 -m recent --set --name heaven
 
$IPT -N door
$IPT -A door -m recent --rcheck --seconds 5 --name knock2 -j stage2
$IPT -A door -m recent --rcheck --seconds 5 --name knock -j stage1
$IPT -A door -p tcp --dport 1234 -m recent --set --name knock
 
$IPT -A INPUT -m --state ESTABLISHED,RELATED -j ACCEPT
$IPT -A INPUT -p tcp --dport 22 -m recent --rcheck --seconds 5 --name heaven -j ACCEPT
$IPT -A INPUT -p tcp --syn -j door
```


更多信息请参见：  
[Debian / Ubuntu: 使用 Knockd and Iptables 设置端口敲门][55]

#### 13. 配置空闲超时注销时长

用户可以通过 ssh 连入服务器，可以配置一个超时时间间隔来避免无人值守的 ssh 会话。 打开 sshd_config 并确保配置以下值：
```
ClientAliveInterval 300
ClientAliveCountMax 0
```
以秒为单位设置一个空闲超时时间(300秒 = 5分钟)。一旦空闲时间超过这个值，空闲用户就会被踢出会话。更多细节参见[如何自动注销空闲超时的 BASH / TCSH / SSH 用户][24]。

#### 14. 为 ssh 用户启用警示标语

更新 sshd_config 文件如下来设置用户的警示标语  
`Banner /etc/issue`  
/etc/issue 示例文件:
```
----------------------------------------------------------------------------------------------
You are accessing a XYZ Government (XYZG) Information System (IS) that is provided for authorized use only.
By using this IS (which includes any device attached to this IS), you consent to the following conditions:

+ The XYZG routinely intercepts and monitors communications on this IS for purposes including, but not limited to,
penetration testing, COMSEC monitoring, network operations and defense, personnel misconduct (PM),
law enforcement (LE), and counterintelligence (CI) investigations.

+ At any time, the XYZG may inspect and seize data stored on this IS.

+ Communications using, or data stored on, this IS are not private, are subject to routine monitoring,
interception, and search, and may be disclosed or used for any XYZG authorized purpose.

+ This IS includes security measures (e.g., authentication and access controls) to protect XYZG interests--not
for your personal benefit or privacy.

+ Notwithstanding the above, using this IS does not constitute consent to PM, LE or CI investigative searching
or monitoring of the content of privileged communications, or work product, related to personal representation
or services by attorneys, psychotherapists, or clergy, and their assistants. Such communications and work
product are private and confidential. See User Agreement for details.
----------------------------------------------------------------------------------------------

```

以上是一个标准的示例，更多的用户协议和法律细节请咨询你的律师团队。

#### 15. 禁用 .rhosts 文件 (核实)

禁止读取用户的 ~/.rhosts 和 ~/.shosts 文件。更新 sshd_config 文件中的以下内容：  
`IgnoreRhosts yes`  
SSH 可以模拟过时的 rsh 命令，所以应该禁用不安全的 RSH 连接。

#### 16. 禁用 host-based 授权 (核实)

禁用 host-based 授权，更新 sshd_config 文件的以下选项：  
`HostbasedAuthentication no`

#### 17. 为 OpenSSH 和 操作系统打补丁

推荐你使用类似 [yum][25]、[apt-get][26] 和 [freebsd-update][27] 等工具保持系统安装了最新的安全补丁。

#### 18. Chroot OpenSSH (将用户锁定在主目录)

默认设置下用户可以浏览诸如 /etc/、/bin 等目录。可以使用 chroot 或者其他专有工具如 [rssh][28] 来保护ssh连接。从版本 4.8p1 或 4.9p1 起，OpenSSH 不再需要依赖诸如 rssh 或复杂的 chroot(1) 等第三方工具来将用户锁定在主目录中。可以使用新的 ChrootDirectory 指令将用户锁定在其主目录，参见[这篇博文][29]。

#### 19. 禁用客户端的 OpenSSH 服务

工作站和笔记本不需要 OpenSSH 服务。如果不需要提供 SSH 远程登录和文件传输功能的话，可以禁用 SSHD 服务。CentOS / RHEL 用户可以使用 [yum 命令][30] 禁用或删除openssh-server：  
`$ sudo yum erase openssh-server`  
Debian / Ubuntu 用户可以使用 [apt 命令][31]/[apt-get 命令][32] 删除 openssh-server：  
`$ sudo apt-get remove openssh-server`  
有可能需要更新 iptables 脚本来移除 ssh 例外规则。CentOS / RHEL / Fedora 系统可以编辑文件 /etc/sysconfig/iptables 和 /etc/sysconfig/ip6tables。最后[重启 iptables][33] 服务：
```
# service iptables restart
# service ip6tables restart
```

#### 20. 来自 Mozilla 的额外提示

如果使用 6.7+ 版本的 OpenSSH，可以尝试下以下设置：
```
#################[ WARNING ]########################
# Do not use any setting blindly. Read sshd_config #
# man page. You must understand cryptography to    #
# tweak following settings. Otherwise use defaults #
####################################################
 
# Supported HostKey algorithms by order of preference.
HostKey /etc/ssh/ssh_host_ed25519_key
HostKey /etc/ssh/ssh_host_rsa_key
HostKey /etc/ssh/ssh_host_ecdsa_key
 
# Specifies the available KEX (Key Exchange) algorithms.
KexAlgorithms curve25519-sha256@libssh.org,ecdh-sha2-nistp521,ecdh-sha2-nistp384,ecdh-sha2-nistp256,diffie-hellman-group-exchange-sha256
 
# Specifies the ciphers allowed
Ciphers chacha20-poly1305@openssh.com,aes256-gcm@openssh.com,aes128-gcm@openssh.com,aes256-ctr,aes192-ctr,aes128-ctr
 
#Specifies the available MAC (message authentication code) algorithms
MACs hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-512,hmac-sha2-256,umac-128@openssh.com
 
# LogLevel VERBOSE logs user's key fingerprint on login. Needed to have a clear audit track of which key was using to log in.
LogLevel VERBOSE
 
# Log sftp level file access (read/write/etc.) that would not be easily logged otherwise.
Subsystem sftp  /usr/lib/ssh/sftp-server -f AUTHPRIV -l INFO
```

使用以下命令获取 OpenSSH 支持的加密方法：
```
$ ssh -Q cipher
$ ssh -Q cipher-auth
$ ssh -Q mac
$ ssh -Q kex
$ ssh -Q key
```
[![OpenSSH安全教程查询密码和算法选择][35]][35]  

#### 如何测试 sshd_config 文件并重启/重新加载 SSH 服务？

在重启 sshd 前检查配置文件的有效性和密匙的完整性，运行：  
`$ sudo sshd -t`  
扩展测试模式：  
`$ sudo sshd -T`  
最后，根据系统的的版本[重启 Linux 或类 Unix 系统中的 sshd 服务][37]：
```
$ [sudo systemctl start ssh][38] ## Debian/Ubunt Linux##
$ [sudo systemctl restart sshd.service][39] ## CentOS/RHEL/Fedora Linux##
$ doas /etc/rc.d/sshd restart ## OpenBSD##
$ sudo service sshd restart ## FreeBSD## 
```

#### 其他建议

  1. [使用 2FA 加强 SSH 的安全性][40] - 可以使用[OATH Toolkit][41] 或 [DuoSecurity][42] 启用多重身份验证。
  2. [基于密匙链的身份验证][43] - 密匙链是一个 bash 脚本，可以使得基于密匙的验证非常的灵活方便。相对于无密码密匙，它提供更好的安全性。



#### 更多信息：

  * [OpenSSH 官方][44] 项目.
  * 用户手册: sshd(8),ssh(1),ssh-add(1),ssh-agent(1)



如果你发现一个方便的软件或者技术，请在下面的评论中分享，以帮助读者保持 OpenSSH 的安全。

#### 关于作者

作者是 nixCraft 的创始人，一个经验丰富的系统管理员和 Linux/Unix 脚本培训师。他曾与全球客户合作，领域涉及IT，教育，国防和空间研究以及非营利部门等多个行业。请在 [Twitter][45]、[Facebook][46]、[Google+][47] 上关注他。

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/tips/linux-unix-bsd-openssh-server-best-practices.html

作者：[Vivek Gite][a]
译者：[shipsw](https://github.com/shipsw)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://www.cyberciti.biz/media/new/tips/2009/07/openSSH_logo.png
[2]:https://isc.sans.edu/diary/OpenSSH+Rumors/6742
[3]:https://www.cyberciti.biz/tips/wp-content/uploads/2009/07/OpenSSH-server-security-best-practices.png
[4]:https://www.cyberciti.biz/faq/how-to-create-a-sudo-user-on-ubuntu-linux-server/
[5]:https://www.cyberciti.biz/faq/unix-linux-id-command-examples-usage-syntax/ (See Linux/Unix id command examples for more info)
[6]:https://www.cyberciti.biz/faq/how-to-disable-ssh-password-login-on-linux/
[7]:https://www.cyberciti.biz/tips/linux-pam-configuration-that-allows-or-deny-login-via-the-sshd-server.html
[8]:https://www.cyberciti.biz/tips/openssh-deny-or-restrict-access-to-users-and-groups.html
[9]:https://www.cyberciti.biz/tips/linux-check-passwords-against-a-dictionary-attack.html
[10]:https://www.cyberciti.biz/faq/unix-linux-password-cracking-john-the-ripper/
[11]:https://www.cyberciti.biz/faq/rhel-fedorta-linux-iptables-firewall-configuration-tutorial/
[12]:https://www.cyberciti.biz/faq/howto-configure-setup-firewall-with-ufw-on-ubuntu-linux/
[13]:https://www.cyberciti.biz/faq/ufw-allow-incoming-ssh-connections-from-a-specific-ip-address-subnet-on-ubuntu-debian/
[14]:https://www.cyberciti.biz/tips/linux-iptables-examples.html
[15]:https://bash.cyberciti.biz/firewall/pf-firewall-script/
[16]:https://www.cyberciti.biz/faq/tcp-wrappers-hosts-allow-deny-tutorial/
[17]:https://www.cyberciti.biz/faq/block-ssh-attacks-with-denyhosts/
[18]:https://www.cyberciti.biz/faq/rhel-linux-block-ssh-dictionary-brute-force-attacks/
[19]:https://www.fail2ban.org
[20]:https://sshguard.sourceforge.net/
[21]:http://www.bsdconsulting.no/tools/
[22]:https://savannah.nongnu.org/projects/ipqbdb/
[23]:https://en.wikipedia.org/wiki/Port_knocking
[24]:https://www.cyberciti.biz/faq/linux-unix-login-bash-shell-force-time-outs/
[25]:https://www.cyberciti.biz/faq/rhel-centos-fedora-linux-yum-command-howto/
[26]:https://www.cyberciti.biz/tips/linux-debian-package-management-cheat-sheet.html
[27]:https://www.cyberciti.biz/tips/howto-keep-freebsd-system-upto-date.html
[28]:https://www.cyberciti.biz/tips/rhel-centos-linux-install-configure-rssh-shell.html
[29]:https://www.debian-administration.org/articles/590
[30]:https://www.cyberciti.biz/faq/rhel-centos-fedora-linux-yum-command-howto/ (See Linux/Unix yum command examples for more info)
[31]:https://www.cyberciti.biz/faq/ubuntu-lts-debian-linux-apt-command-examples/ (See Linux/Unix apt command examples for more info)
[32]:https://www.cyberciti.biz/tips/linux-debian-package-management-cheat-sheet.html (See Linux/Unix apt-get command examples for more info)
[33]:https://www.cyberciti.biz/faq/howto-rhel-linux-open-port-using-iptables/
[34]:https://wiki.mozilla.org/Security/Guidelines/OpenSSH
[35]:https://www.cyberciti.biz/tips/wp-content/uploads/2009/07/OpenSSH-Security-Tutorial-Query-Ciphers-and-algorithms-choice.jpg
[36]:https://www.cyberciti.biz/tips/checking-openssh-sshd-configuration-syntax-errors.html
[37]:https://www.cyberciti.biz/faq/howto-restart-ssh/
[38]:https://www.cyberciti.biz/faq/howto-start-stop-ssh-server/ (Restart sshd on a Debian/Ubuntu Linux)
[39]:https://www.cyberciti.biz/faq/centos-stop-start-restart-sshd-command/ (Restart sshd on a CentOS/RHEL/Fedora Linux)
[40]:https://www.cyberciti.biz/open-source/howto-protect-linux-ssh-login-with-google-authenticator/
[41]:http://www.nongnu.org/oath-toolkit/
[42]:https://duo.com
[43]:https://www.cyberciti.biz/faq/ssh-passwordless-login-with-keychain-for-scripts/
[44]:https://www.openssh.com/
[45]:https://twitter.com/nixcraft
[46]:https://facebook.com/nixcraft
[47]:https://plus.google.com/+CybercitiBiz
[48]:https://www.cyberciti.biz/faq/ssh-passwordless-login-with-keychain-for-scripts/
[49]:https://www.cyberciti.biz/faq/noninteractive-shell-script-ssh-password-provider/
[50]:https://www.cyberciti.biz/faq/how-to-set-up-ssh-keys-on-linux-unix/
[51]:https://www.cyberciti.biz/faq/how-to-upload-ssh-public-key-to-as-authorized_key-using-ansible/
[52]:https://www.cyberciti.biz/faq/generating-random-password/
[53]:https://www.cyberciti.biz/faq/linux-unix-generating-passwords-command/
[54]:https://www.cyberciti.biz/faq/linux-random-password-generator/
[55]:https://www.cyberciti.biz/faq/debian-ubuntu-linux-iptables-knockd-port-knocking-tutorial/
