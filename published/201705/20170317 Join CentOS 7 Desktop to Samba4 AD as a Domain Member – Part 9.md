Samba 系列（九）：将 CentOS 7 桌面系统加入到 Samba4 AD 域环境中
============================================================

这篇文章讲述了如何使用 Authconfig-gtk 工具将 CentOS 7 桌面系统加入到 Samba4 AD 域环境中，并使用域帐号登录到 CentOS 系统。

### 要求

1、[在 Ubuntu 系统中使用 Samba4 创建活动目录架构][1]
2、[CentOS 7.3 安装指南][2]

### 第一步：在 CentOS 系统中配置 Samba4 AD DC

1、在将 CentOS 7 加入到 Samba4 域环境之前，你得先配置 CentOS 系统的网络环境，确保在 CentOS 系统中通过 DNS 可以解析到域名。

打开网络设置，关闭有线网卡。打开下方的设置按钮，手动编辑网络设置，指定 DNS 的 IP 地址为 Samba4 AD DC 服务器的 IP 地址。

设置完成之后，应用配置，并打开有线网卡。

[
 ![Network Settings](http://www.tecmint.com/wp-content/uploads/2017/03/Network-Settings.jpg) 
][3]

*网络设置*

[
 ![Configure Network](http://www.tecmint.com/wp-content/uploads/2017/03/Configure-Network.jpg) 
][4]

*配置网络*

2、下一步，打开网络配置文件，在文件末尾添加一行域名信息。这样能确保当你仅使用主机名来查询域中的 DNS 记录时， DNS 解析器会自动把域名添加进来。

```
$ sudo vi /etc/sysconfig/network-scripts/ifcfg-eno16777736
```

添加下面一行：

```
SEARCH="your_domain_name"
```
[
 ![Network Interface Configuration](http://www.tecmint.com/wp-content/uploads/2017/03/Network-Interface-Configuration.jpg) 
][5]

*网卡配置*

3、最后，重启网卡服务以应用更改，并验证解析器的配置文件是否正确配置。我们通过使用 ping 命令加上 DC 服务器的主机名或域名以验证 DNS 解析能否正常运行。

```
$ sudo systemctl restart network
$ cat /etc/resolv.conf
$ ping -c1 adc1
$ ping -c1 adc2
$ ping tecmint.lan
```

[
 ![Verify Network Configuration](http://www.tecmint.com/wp-content/uploads/2017/03/Verify-Network-Configuration.jpg) 
][6]

*验证网络配置是否正常*

4、同时，使用下面的命令来配置你的主机名，然后重启计算机以应用更改：

```
$ sudo hostnamectl set-hostname your_hostname
$ sudo init 6
```

使用下面的命令来验证主机名是否正确配置：

```
$ cat /etc/hostname
$ hostname
```

5、最后一步配置是使用下面的命令来保证系统时间跟 Samba4 AD DC 服务器的时间同步：

```
$ sudo yum install ntpdate
$ sudo ntpdate -ud domain.tld
```

### 第二步：安装要加入 Samba4 AD DC 所必需的软件包

6、为了将 CentOS 7 加入到活动目录域中，你需要使用下面的命令来安装相关的软件包：

```
$ sudo yum install samba samba samba-winbind krb5-workstation
```

7、最后，安装 CentOS 软件库中提供的图形化界面软件包： Authconfig-gtk 。该软件用于将 CentOS 系统集成到域环境中。

```
$ sudo yum install authconfig-gtk
```

### 第三步：将 CentOS 7 桌面系统集成到 Samba4 AD DC 域环境中

8、将 CentOS 加入到域的过程非常简单。使用有 root 权限的帐号在命令行下打开 Authconfig-gtk 程序，然后按下图所示修改相关配置即可：

```
$ sudo authconfig-gtk
```

打开身份或认证配置页面：

*   用户帐号数据库 ： 选择 Winbind
*   Winbind 域 ： 你的域名
*   安全模式 ：  ADS
*   Winbind ADS 域 ： 你的域名.TLD
*   域控制器 ： 域控服务器的全域名
*   默认Shell ： /bin/bash
*   勾选允许离线登录

[
 ![Authentication Configuration](http://www.tecmint.com/wp-content/uploads/2017/03/Authentication-Configuration.jpg) 
][7]

*域认证配置*

打开高级选项配置页面：

*   本地认证选项 ： 支持指纹识别
*   其它认证选项 ： 用户首次登录创建家目录

[
 ![Authentication Advance Configuration](http://www.tecmint.com/wp-content/uploads/2017/03/Authentication-Advance-Configuration.jpg) 
][8]

*高级认证配置*

9、修改完上面的配置之后，返回到身份或认证配置页面，点击加入域按钮，在弹出的提示框点保存即可。

[
 ![Identity and Authentication](http://www.tecmint.com/wp-content/uploads/2017/03/Identity-and-Authentication.jpg) 
][9]

*身份和认证*

[
 ![Save Authentication Configuration](http://www.tecmint.com/wp-content/uploads/2017/03/Save-Authentication-Configuration.jpg) 
][10]

*保存认证配置*

10、保存配置之后，系统将会提示你提供域管理员信息以将 CentOS 系统加入到域中。输入域管理员帐号及密码后点击 OK 按钮，加入域完成。

[
 ![Joining Winbind Domain](http://www.tecmint.com/wp-content/uploads/2017/03/Joining-Winbind-Domain.jpg) 
][11]

*加入 Winbind 域环境*

11、加入域后，点击应用按钮以让配置生效，选择所有的 windows 并重启机器。

[
 ![Apply Authentication Configuration](http://www.tecmint.com/wp-content/uploads/2017/03/Apply-Authentication-Configuration.jpg) 
][12]

*应用认证配置*

12、要验证 CentOS 是否已成功加入到 Samba4 AD DC 中，你可以在安装了 [RSAT 工具][13] 的 windows 机器上，打开 AD 用户和计算机工具，点击域中的计算机。

你将会在右侧看到 CentOS 主机信息。

[
 ![Active Directory Users and Computers](http://www.tecmint.com/wp-content/uploads/2017/03/Active-Directory-Users-and-Computers.jpg) 
][14]

*活动目录用户和计算机*

### 第四步：使用 Samba4 AD DC 帐号登录 CentOS 桌面系统

13、选择使用其它账户，然后输入域帐号和密码进行登录，如下图所示：

```
Domain\domain_account
或
Domain_user@domain.tld
```
[
 ![Not listed Users](http://www.tecmint.com/wp-content/uploads/2017/03/Not-listed-Users.jpg) 
][15]

*使用其它账户*

[
 ![Enter Domain Username](http://www.tecmint.com/wp-content/uploads/2017/03/Enter-Domain-Username.jpg) 
][16]

*输入域用户名*

14、在 CentOS 系统的命令行中，你也可以使用下面的任一方式来切换到域帐号进行登录：

```
$ su - domain\domain_user
$ su - domain_user@domain.tld
```
[
 ![Authenticate Domain Username](http://www.tecmint.com/wp-content/uploads/2017/03/Authenticate-Domain-User.jpg) 
][17]

*使用域帐号登录*

[
 ![Authenticate Domain User Email](http://www.tecmint.com/wp-content/uploads/2017/03/Authenticate-Domain-User-Email.jpg) 
][18]

*使用域帐号邮箱登录*

15、要为域用户或组添加 root 权限，在命令行下使用 root 权限帐号打开 `sudoers` 配置文件，添加下面一行内容：

```
YOUR_DOMAIN\\domain_username       		 ALL=(ALL:ALL) ALL  	#For domain users
%YOUR_DOMAIN\\your_domain\  group      		 ALL=(ALL:ALL) ALL	#For domain groups
```
[
 ![Assign Permission to User and Group](http://www.tecmint.com/wp-content/uploads/2017/03/Assign-Permission-to-User-and-Group.jpg) 
][19]

*指定用户和用户组权限*

16、使用下面的命令来查看域控制器信息：

```
$ sudo net ads info
```
[
 ![Check Domain Controller Info](http://www.tecmint.com/wp-content/uploads/2017/03/Check-Domain-Controller-Info.jpg) 
][20]

*查看域控制器信息*

17、你可以在安装了 Winbind 客户端的机器上使用下面的命令来验证 CentOS 加入到 Samba4 AD DC 后的信任关系是否正常：

```
$ sudo yum install samba-winbind-clients
```

然后，执行下面的一些命令来查看 Samba4 AD DC 的相关信息：

```
$ wbinfo -p ### Ping 域名
$ wbinfo -t ### 检查信任关系
$ wbinfo -u ### 列出域用户帐号
$ wbinfo -g ### 列出域用户组
$ wbinfo -n domain_account ### 查看域帐号的 SID 信息
```
[
 ![Get Samba4 AD DC Details](http://www.tecmint.com/wp-content/uploads/2017/03/Get-Samba4-AD-DC-Details.jpg) 
][21]

*查看  Samba4 AD DC 信息*

18、如果你想让 CentOS 系统退出域环境，使用具有管理员权限的帐号执行下面的命令，后面加上域名及域管理员帐号，如下图所示：

```
$ sudo net ads leave your_domain -U domain_admin_username
```
[
 ![Leave Domain from Samba4 AD](http://www.tecmint.com/wp-content/uploads/2017/03/Leave-Domain-from-Samba4-AD.jpg) 
][22]

*退出 Samba4 AD 域*

这篇文章就写到这里吧！尽管上面的这些操作步骤是将 CentOS 7 系统加入到 Samba4 AD DC 域中，其实这些步骤也同样适用于将 CentOS 7 桌面系统加入到 Microsoft Windows Server 2008 或 2012 的域中。

--------------------------------------------------------------------------------

作者简介：

我是一个电脑迷，开源 Linux 系统和软件爱好者，有 4 年多的 Linux 桌面、服务器系统使用和 Base 编程经验。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/join-centos-7-to-samba4-active-directory/

作者：[Matei Cezar][a]
译者：[rusking](https://github.com/rusking)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/cezarmatei/

[1]:https://linux.cn/article-8065-1.html
[2]:https://linux.cn/article-8048-1.html
[3]:http://www.tecmint.com/wp-content/uploads/2017/03/Network-Settings.jpg
[4]:http://www.tecmint.com/wp-content/uploads/2017/03/Configure-Network.jpg
[5]:http://www.tecmint.com/wp-content/uploads/2017/03/Network-Interface-Configuration.jpg
[6]:http://www.tecmint.com/wp-content/uploads/2017/03/Verify-Network-Configuration.jpg
[7]:http://www.tecmint.com/wp-content/uploads/2017/03/Authentication-Configuration.jpg
[8]:http://www.tecmint.com/wp-content/uploads/2017/03/Authentication-Advance-Configuration.jpg
[9]:http://www.tecmint.com/wp-content/uploads/2017/03/Identity-and-Authentication.jpg
[10]:http://www.tecmint.com/wp-content/uploads/2017/03/Save-Authentication-Configuration.jpg
[11]:http://www.tecmint.com/wp-content/uploads/2017/03/Joining-Winbind-Domain.jpg
[12]:http://www.tecmint.com/wp-content/uploads/2017/03/Apply-Authentication-Configuration.jpg
[13]:https://linux.cn/article-8097-1.html
[14]:http://www.tecmint.com/wp-content/uploads/2017/03/Active-Directory-Users-and-Computers.jpg
[15]:http://www.tecmint.com/wp-content/uploads/2017/03/Not-listed-Users.jpg
[16]:http://www.tecmint.com/wp-content/uploads/2017/03/Enter-Domain-Username.jpg
[17]:http://www.tecmint.com/wp-content/uploads/2017/03/Authenticate-Domain-User.jpg
[18]:http://www.tecmint.com/wp-content/uploads/2017/03/Authenticate-Domain-User-Email.jpg
[19]:http://www.tecmint.com/wp-content/uploads/2017/03/Assign-Permission-to-User-and-Group.jpg
[20]:http://www.tecmint.com/wp-content/uploads/2017/03/Check-Domain-Controller-Info.jpg
[21]:http://www.tecmint.com/wp-content/uploads/2017/03/Get-Samba4-AD-DC-Details.jpg
[22]:http://www.tecmint.com/wp-content/uploads/2017/03/Leave-Domain-from-Samba4-AD.jpg
[23]:http://www.tecmint.com/author/cezarmatei/
[24]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[25]:http://www.tecmint.com/free-linux-shell-scripting-books/
