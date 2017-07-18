Samba 系列（十二）：如何在 Samba4 AD 中集成 iRedMail Roundcube
============================================================

[Roundcube][3] 是 Linux 中最常用的 Webmail 用户代理之一，它为终端用户提供了一个现代化的 Web 界面，它可以与所有邮件服务进行交互，以便阅读、撰写和发送电子邮件。Roundcube 支持各种邮件协议，包括安全的邮件协议，如IMAPS、POP3S 或者 submission。

在本文中，我们将讨论如何在 iRedMail 中使用 IMAPS 以及 submission 安全端口配置 Roundcube，以检索和发送 Samba4 AD 帐户的电子邮件、如何从浏览器访问 iRedMail Roundcube Web 界面，并添加网址别名、如何启用 Samba4 AD 集成全局 LDAP 地址簿以及如何禁用某些不需要的 iRedMail 服务。

### 要求

1.  [如何在 CentOS 7 上安装 iRedMail，用于Samba4 AD集成][1]
2.  [在 CentOS 7 上配置 iRedMail，用于 Samba4 AD 集成][2]

### 第一步：在 Samba4 AD DC 中声明域帐户的电子邮件地址

1、 为了发送和接收 Samba4 AD DC 域账户的邮件，您需要编辑每个用户帐户，如下所示，通过从[安装了 RSAT 工具的 Windows 机器][4]并且已经加入 Samba4 AD 中打开 ADUC 工具显式地在邮箱字段填写正确的地址。

 [![Add Email Account to Join Samba4 AD DC](https://www.tecmint.com/wp-content/uploads/2017/05/Active-Directory-User-and-Computers.jpg)][5] 

*添加邮箱帐户来加入 Samba4 AD DC*

2、 相似地，要使用邮件列表，你需要在 ADUC 中创建组，为每个组添加相应的电子邮件地址，并分配合适的用户帐户作为每个组的成员。

这步创建了一个邮件列表，所有 Samba4 AD 组成员的邮箱都会收到给这个 AD 组邮箱地址的邮件。使用下面的截图作为指导为 Samba4 组声明电子邮件字段，并为组添加域成员。

确保所有的域账户成员都添加到了声明了邮件地址的组中。

 [![Create Group Admin for Samba4 AD DC](https://www.tecmint.com/wp-content/uploads/2017/05/Create-Group-Admin-for-Samba4-AD-DC.png)][6] 

*为 Samba4 AD DC 创建组管理员*

 [![Add Users to Group](https://www.tecmint.com/wp-content/uploads/2017/05/Add-Users-to-Group.png)][7] 

*将用户添加到组*

在本例中，发送给 admins@tecmint.lan 的所有邮件地址将被该组的每个成员邮箱接收，它是 “Domain Admins” 组声明的电子邮件地址。

3、 你可以声明 Samba4 AD 帐户的电子邮件地址的另一种方法是直接从其中一个 AD DC 控制台使用 samba-tool 命令行创建一个用户或组，并使用 `--mail-address` 标志指定邮件地址。

使用下面其中一个命令创建一个指定邮件地址的用户：

```
# samba-tool user add  --mail-address=user_email@domain.tld  --surname=your_surname  --given-name=your_given_name  your_ad_user
```

创建一个指定邮件地址的组：

```
# samba-tool group add  --mail-address=group_email@domain.tld  your_ad_group
```

将成员添加到组中：

```
# samba-tool group addmembers your_group user1,user2,userX
```

使用下面的语法列出 samba-tool 中有关用户或者组的命令字段：

```
# samba-tool user add -h
# samba-tool group add -h
```

### 第二步：安全 Roundcube Webmail

4、 开始修改 Roundcube 配置文件之前，首先使用 [netstat 命令][8]管道输出给 egrep 过滤器来列出 [Dovecot 和 Postfix][9] 监听的套接字，并确保安全端口（IMAPS 是 993，submission 是 587 ）是活跃的并且已启用。

```
# netstat -tulpn| egrep 'dovecot|master'
```

5、 要强制邮件的接收和发送在使用安全的 IMAP 和 SMTP 端口的 Roundcube 以及 iRedMail 服务之间，打开位于 `/var/www/roundcubemail/config/config.inc.php` 的 Roundcube 配置文件并确保你修改过了下面的行，本例中是 `localhost`，如下片段所示：

```
// For IMAPS
$config['default_host'] = 'ssl://127.0.0.1';
$config['default_port'] = 993;
$config['imap_auth_type'] = 'LOGIN';
// For SMTP
$config['smtp_server'] = 'tls://127.0.0.1';
$config['smtp_port'] = 587;
$config['smtp_user'] = '%u';
$config['smtp_pass'] = '%p';
$config['smtp_auth_type'] = 'LOGIN';
```

这步强烈建议在远程主机中安装 Roudcube，而不是提供了邮件服务的主机中（IMAP、POP3 或者 SMTP 守护进程）。

6、 接下来，不要关闭配置文件，搜索并做如下小的修改以便 Roundcube 能够通过 HTTPS 协议访问、隐藏版本号以及自动为登录 Web 界面的帐户追加域名。

```
$config['force_https'] = true;
$config['useragent'] = 'Your Webmail'; // Hide version number
$config['username_domain'] = 'domain.tld'
```

7、 同样，禁用下面的插件：managesieve 和 password，通过在以 `$config[‘plugins’]` 开头的行前添加注释 `//`。

一旦登录并验证了域，用户将从连接到 Samba4 AD DC 的 Windows 或 Linux 机器上更改密码。系统管理员将全局管理域帐户的所有筛选规则。

```
// $config['plugins'] = array('managesieve', 'password');
```

8、 最后，保存并关闭配置文件，并打开浏览器访问 Roundcube Webmail，通过 HTTPS 协议进入 iRedMail IP 地址或者 FQDN/mail 位置。

由于浏览器使用的是自签名证书，所以你首次访问 Roundcube 会在浏览器上看到一个警告。接受证书并用 Samba AD 帐户凭证登录。

```
https://iredmail-FQDN/mail
```
 [![Roundcube Webmail Login](https://www.tecmint.com/wp-content/uploads/2017/05/Roundcube-Webmail-Login.png)][10] 

*Roundcube Webmail 登录*

### 第三步：在 Roundcube 中启用 Samba AD 联系人

9、 要配置 Samba AD 全局 LDAP 地址簿以在 Roundcube 联系人中显示，再次打开 Roundcube 配置文件，并做如下修改：

到达文件的底部，并辨认以 `# Global LDAP Address Book with AD` 开头的部分，删除到文件底部的所有内容，并替换成如下代码段：

```
# Global LDAP Address Book with AD.
#
$config['ldap_public']["global_ldap_abook"] = array(
'name'          => 'tecmint.lan',
'hosts'         => array("tecmint.lan"),
'port'          => 389,
'use_tls'       => false,
'ldap_version'  => '3',
'network_timeout' => 10,
'user_specific' => false,
'base_dn'       => "dc=tecmint,dc=lan",
'bind_dn'       => "vmail@tecmint.lan",
'bind_pass'     => "your_password",
'writable'      => false,
'search_fields' => array('mail', 'cn', 'sAMAccountName', 'displayname', 'sn', 'givenName'),
'fieldmap' => array(
'name'        => 'cn',
'surname'     => 'sn',
'firstname'   => 'givenName',
'title'       => 'title',
'email'       => 'mail:*',
'phone:work'  => 'telephoneNumber',
'phone:mobile' => 'mobile',
'department'  => 'departmentNumber',
'notes'       => 'description',
),
'sort'          => 'cn',
'scope'         => 'sub',
'filter' => '(&(mail=*)(|(&(objectClass=user)(!(objectClass=computer)))(objectClass=group)))',
'fuzzy_search'  => true,
'vlv'           => false,
'sizelimit'     => '0',
'timelimit'     => '0',
'referrals'     => false,
);
```

在这段代码中替换相应的 `name`、`hosts`、`base_dn`、`bind_dn` 和 `bind_pass` 的值。

10、 做了所需修改后，保存并关闭文件，登录 Roundcube webmail 界面，并进入地址簿菜单。

所有域名帐户（用户和组）与其指定的电子邮件地址的联系人列表都将被显示在全局地址簿上。

 [![Roundcube User Contact List](https://www.tecmint.com/wp-content/uploads/2017/05/Roundcube-User-Contact-List.png)][11] 

*Roundcube 用户联系人列表*

### 第四步：为 Roundcube Webmail 界面添加一个别名

11、 要从 https://webmail.domain.tld 访问 Roundcube 而不是从 iRedMail 默认提供的旧地址，你需要进行以下更改。

在已安装 RSAT 工具的已加入的 Windows 机器上打开 DNS 管理器，并如下所示，添加一条 iRedMail FQDN、named webmail 的 CNAME 记录。

 [![DNS Webmail Properties](https://www.tecmint.com/wp-content/uploads/2017/05/DNS-Webmail-Properties.jpg)][12] 

*DNS Webmail 属性*

12、 接下来，在 iRedMail 机器中，打开位于 `/etc/httpd/conf.d/ssl.conf` 的 Apache Web 服务器的 SSL 配置文件，将 `DocumentRoot` 指向 `/var/www/roundcubemail/`。

修改 `/etc/httpd/conf.d/ssl.conf` 片段：


```
DocumentRoot “/var/www/roundcubemail/”
```

重启 Apache 使更改生效。

```
# systemctl restart httpd
```

13、 现在打开下面的地址，Roundcube 界面应该会显示出来。接受自签名证书错误以进入登录页面。用你自己的域名替换例子中的 domain.tld。

```
https://webmail.domain.tld
```

### 第五步：禁用 iRedMail 未使用的服务

14、 由于 iRedMail 守护进程配置为查询 Samba4 AD DC LDAP 服务器的帐户信息和其他资源，因此可以通过使用以下命令来安全地停止和禁用 iRedMail 机器上的某些本地服务，例如 LDAP 数据库服务器和 iredpad 服务。

```
# systemctl stop slapd iredpad
# systemctl disable slapd iredpad
```

15、 另外，如下图所示，通过在 crontab 文件中的每行之前添加注释 `#`，禁用 iRedMail 执行的某些计划任务，例如 LDAP 数据库备份和 iRedPad 跟踪记录。

```
# crontab -e
```
 [![Disable iRedMail Tasks](https://www.tecmint.com/wp-content/uploads/2017/05/Disable-iRedMail-Tasks.png)][13] 

*禁用 iRedMail 任务*

### 第六步：在 Postfix 中使用邮件别名

16、 要将所有本地生成的邮件（发往 postmaster 并随后重定向到 root 帐户）重定向到特定的 Samba4 AD 帐户，请打开位于 `/etc/postfix/aliases` 中的 Postfix 别名配置文件，并修改 `root` 行，如下所示：

```
root: 	your_AD_email_account@domain.tld
```

17、 应用别名配置文件，以便 Postfix 可以通过执行 `newaliases` 命令以其自己的格式读取它，并测试邮件是否通过发出以下命令发送到正确的域电子邮件帐户。

```
# echo “Test mail” | mail -s “This is root’s email” root
```

18、 邮件发送完毕后，请使用你为邮件重定向设置的域帐户登录 Roundcube webmail，并验证先前发送的邮件应该在你的帐户收件箱中。

 [![Verify User Mail](https://www.tecmint.com/wp-content/uploads/2017/05/Verify-User-Mail.png)][14] 

*验证用户邮件*

就是这样了！现在你已经有了一个完全工作的与 Samba4 AD 集成的邮件服务器了。域帐户可以用它们的内部或者其他外部域发送和接收邮件了。

本教程中使用的配置可以成功将 iRedMail 服务器集成到 Windows Server 2012 R2 或 2016 AD 中。

--------------------------------------------------------------------------------

作者简介：

我是一个电脑上瘾的家伙，开源和基于 linux 的系统软件的粉丝，在 Linux 发行版桌面、服务器和 bash 脚本方面拥有大约4年的经验。

-----------


via: https://www.tecmint.com/integrate-iredmail-roundcube-with-samba4-ad-dc/

作者：[Matei Cezar][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.tecmint.com/author/cezarmatei/
[1]:https://linux.cn/article-8567-1.html
[2]:https://linux.cn/article-8673-1.html
[3]:https://www.tecmint.com/install-and-configure-roundcube-webmail-for-postfix-mail-server/
[4]:https://linux.cn/article-8097-1.html
[5]:https://www.tecmint.com/wp-content/uploads/2017/05/Active-Directory-User-and-Computers.jpg
[6]:https://www.tecmint.com/wp-content/uploads/2017/05/Create-Group-Admin-for-Samba4-AD-DC.png
[7]:https://www.tecmint.com/wp-content/uploads/2017/05/Add-Users-to-Group.png
[8]:https://www.tecmint.com/20-netstat-commands-for-linux-network-management/
[9]:https://www.tecmint.com/configure-postfix-and-dovecot-with-virtual-domain-users-in-linux/
[10]:https://www.tecmint.com/wp-content/uploads/2017/05/Roundcube-Webmail-Login.png
[11]:https://www.tecmint.com/wp-content/uploads/2017/05/Roundcube-User-Contact-List.png
[12]:https://www.tecmint.com/wp-content/uploads/2017/05/DNS-Webmail-Properties.jpg
[13]:https://www.tecmint.com/wp-content/uploads/2017/05/Disable-iRedMail-Tasks.png
[14]:https://www.tecmint.com/wp-content/uploads/2017/05/Verify-User-Mail.png
[15]:https://www.tecmint.com/author/cezarmatei/
[16]:https://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[17]:https://www.tecmint.com/free-linux-shell-scripting-books/
