在 Linux 命令行下管理 Samba4 AD 架构（二）
============================================================

这篇文章包括了管理 Samba4 域控制器架构过程中的一些常用命令，比如添加、移除、禁用或者列出用户及用户组等。

我们也会关注一下如何配置域安全策略以及如何把 AD 用户绑定到本地的 PAM 认证中，以实现 AD 用户能够在 Linux 域控制器上进行本地登录。

#### 要求

- [在 Ubuntu 系统上使用 Samba4 来创建活动目录架构][1]

### 第一步：在命令行下管理

1、 可以通过 `samba-tool` 命令行工具来进行管理，这个工具为域管理工作提供了一个功能强大的管理接口。

通过 `samba-tool` 命令行接口，你可以直接管理域用户及用户组、域组策略、域站点，DNS 服务、域复制关系和其它重要的域功能。

使用 root 权限的账号，直接输入 `samba-tool` 命令，不要加任何参数选项来查看该工具能实现的所有功能。

```
# samba-tool -h
```

[
 ![samba-tool - Manage Samba Administration Tool](http://www.tecmint.com/wp-content/uploads/2016/11/Samba-Administration-Tool.png) 
][3]

*samba-tool —— Samba 管理工具*

2、 现在，让我们开始使用 `samba-tool` 工具来管理 Samba4 活动目录中的用户。

使用如下命令来创建 AD 用户：

```
# samba-tool user add your_domain_user
```

添加一个用户，包括 AD 可选的一些重要属性，如下所示：

```
--------- review all options --------- 
# samba-tool user add -h  
# samba-tool user add your_domain_user --given-name=your_name --surname=your_username --mail-address=your_domain_user@tecmint.lan --login-shell=/bin/bash
```

[
 ![Create User on Samba AD](http://www.tecmint.com/wp-content/uploads/2016/11/Create-User-on-Samba-AD.png) 
][4]

*在 Samba AD 上创建用户*

3、 可以通过下面的命令来列出所有 Samba AD 域用户：

```
# samba-tool user list
```

[
 ![List Samba AD Users](http://www.tecmint.com/wp-content/uploads/2016/11/List-Samba-AD-Users.png) 
][5]

*列出 Samba AD 用户信息*

4、 使用下面的命令来删除 Samba AD 域用户：

```
# samba-tool user delete your_domain_user
```

5、 重置 Samba 域用户的密码：

```
# samba-tool user setpassword your_domain_user
```

6、 启用或禁用 Samba 域用户账号：

```
# samba-tool user disable your_domain_user
# samba-tool user enable your_domain_user
```

7、 同样地，可以使用下面的方法来管理 Samba 用户组：

```
--------- review all options --------- 
# samba-tool group add –h  
# samba-tool group add your_domain_group
```

8、 删除 samba 域用户组：

```
# samba-tool group delete your_domain_group
```

9、 显示所有的 Samba 域用户组信息：
 
```
# samba-tool group list
```

10、 列出指定组下的 Samba 域用户：

```
# samba-tool group listmembers "your_domain group"
```
[
 ![List Samba Domain Members of Group](http://www.tecmint.com/wp-content/uploads/2016/11/List-Samba-Domain-Members-of-Group.png) 
][6]

*列出 Samba 域用户组*

11、 从 Samba 域组中添加或删除某一用户：

```
# samba-tool group addmembers your_domain_group your_domain_user
# samba-tool group remove members your_domain_group your_domain_user
```

12、 如上面所提到的， `samba-tool` 命令行工具也可以用于管理 Samba 域策略及安全。

查看 samba 域密码设置：

```
# samba-tool domain passwordsettings show
```
[
 ![Check Samba Domain Password](http://www.tecmint.com/wp-content/uploads/2016/11/Check-Samba-Domain-Password.png) 
][7]

*检查 Samba 域密码*

13、 为了修改 samba 域密码策略，比如密码复杂度，密码失效时长，密码长度，密码重复次数以及其它域控制器要求的安全策略等，可参照如下命令来完成：

```
---------- List all command options ---------- 
# samba-tool domain passwordsettings -h 
```

[
 ![Manage Samba Domain Password Settings](http://www.tecmint.com/wp-content/uploads/2016/11/Manage-Samba-Domain-Password-Settings.png) 
][8]

*管理 Samba 域密码策略*

不要把上图中的密码策略规则用于生产环境中。上面的策略仅仅是用于演示目的。

### 第二步：使用活动目录账号来完成 Samba 本地认证

14、 默认情况下，离开 Samba AD DC 环境，AD 用户不能从本地登录到 Linux 系统。

为了让活动目录账号也能登录到系统，你必须在 Linux 系统环境中做如下设置，并且要修改 Samba4 AD DC 配置。

首先，打开 Samba 主配置文件，如果以下内容不存在，则添加：

```
$ sudo nano /etc/samba/smb.conf
```

确保以下参数出现在配置文件中：

```
winbind enum users = yes
winbind enum groups = yes
```

[
 ![Samba Authentication Using Active Directory User Accounts](http://www.tecmint.com/wp-content/uploads/2016/11/Samba-Authentication-Using-Active-Directory-Accounts.png) 
][9]

*Samba 通过 AD 用户账号来进行认证*

15、 修改之后，使用 `testparm` 工具来验证配置文件没有错误，然后通过如下命令来重启 Samba 服务：

```
$ testparm
$ sudo systemctl restart samba-ad-dc.service
```

[
 ![Check Samba Configuration for Errors](http://www.tecmint.com/wp-content/uploads/2016/11/Check-Samba-Configuration-for-Errors.png) 
][10]

*检查 Samba 配置文件是否报错*

16、 下一步，我们需要修改本地 PAM 配置文件，以让 Samba4 活动目录账号能够完成本地认证、开启会话，并且在第一次登录系统时创建一个用户目录。

使用 `pam-auth-update` 命令来打开 PAM 配置提示界面，确保所有的 PAM 选项都已经使用 `[空格]` 键来启用，如下图所示：

完成之后，按 `[Tab]` 键跳转到 OK ，以启用修改。

```
$ sudo pam-auth-update
```

[
 ![Configure PAM for Samba4 AD](http://www.tecmint.com/wp-content/uploads/2016/11/PAM-Configuration-for-Samba4-AD.png) 
][11]

*为 Samba4 AD 配置 PAM 认证*

[
 ![Enable PAM Authentication Module for Samba4 AD Users](http://www.tecmint.com/wp-content/uploads/2016/11/Enable-PAM-Authentication-Module-for-Samba4-AD.png) 
][12]

为 Samba4 AD 用户启用 PAM认证模块

17、 现在，使用文本编辑器打开 `/etc/nsswitch.conf` 配置文件，在 `passwd` 和 `group` 参数的最后面添加 `winbind` 参数，如下图所示：

```
$ sudo vi /etc/nsswitch.conf
```
[
 ![Add Windbind Service Switch for Samba](http://www.tecmint.com/wp-content/uploads/2016/11/Add-Windbind-Service-Switch-for-Samba.png) 
][13]

*为 Samba 服务添加 Winbind Service Switch 设置*

18、 最后，编辑 `/etc/pam.d/common-password` 文件，查找下图所示行并删除 `user_authtok` 参数。

该设置确保 AD 用户在通过 Linux 系统本地认证后，可以在命令行下修改他们的密码。有这个参数时，本地认证的 AD 用户不能在控制台下修改他们的密码。

```
password       [success=1 default=ignore]      pam_winbind.so try_first_pass
```
[
 ![Allow Samba AD Users to Change Passwords](http://www.tecmint.com/wp-content/uploads/2016/11/Allow-Samba-AD-Users-to-Change-Password.png) 
][14]

*允许 Samba AD 用户修改密码*

在每次 PAM 更新安装完成并应用到 PAM 模块，或者你每次执行 `pam-auth-update` 命令后，你都需要删除 `use_authtok` 参数。

19、 Samba4 的二进制文件会生成一个内建的 windindd 进程，并且默认是启用的。

因此，你没必要再次去启用并运行 Ubuntu 系统官方自带的 winbind 服务。

为了防止系统里原来已废弃的 winbind 服务被启动，确保执行以下命令来禁用并停止原来的 winbind 服务。

```
$ sudo systemctl disable winbind.service
$ sudo systemctl stop winbind.service
```

虽然我们不再需要运行原有的 winbind 进程，但是为了安装并使用 wbinfo 工具，我们还得从系统软件库中安装 Winbind 包。

wbinfo 工具可以用来从 winbindd 进程侧来查询活动目录用户和组。

以下命令显示了使用 `wbinfo` 命令如何查询 AD 用户及组信息。

```
$ wbinfo -g
$ wbinfo -u
$ wbinfo -i your_domain_user
```

[
 ![Check Samba4 AD Information ](http://www.tecmint.com/wp-content/uploads/2016/11/Check-Information-of-Samba4-AD.png) 
][15]

*检查 Samba4 AD 信息*

[
 ![Check Samba4 AD User Info](http://www.tecmint.com/wp-content/uploads/2016/11/Check-Samba4-AD-User-Info.png) 
][16]

*检查 Samba4 AD 用户信息*

20、 除了 `wbinfo` 工具外，你也可以使用 `getent` 命令行工具从 Name Service Switch 库中查询活动目录信息库，在 `/etc/nsswitch.conf` 配置文件中有相关描述内容。

通过 grep 命令用管道符从 `getent` 命令过滤结果集，以获取信息库中 AD 域用户及组信息。

```
# getent passwd | grep TECMINT
# getent group | grep TECMINT
```
[
 ![Get Samba4 AD Details](http://www.tecmint.com/wp-content/uploads/2016/11/Get-Samba4-AD-Details.png) 
][17]

*查看 Samba4 AD 详细信息*

### 第三步：使用活动目录账号登录 Linux 系统

21、 为了使用 Samba4 AD 用户登录系统，使用 `su -` 命令切换到 AD 用户账号即可。

第一次登录系统后，控制台会有信息提示用户的 home 目录已创建完成，系统路径为 `/home/$DOMAIN/` 之下，名字为用户的 AD 账号名。

使用 `id` 命令来查询其它已登录的用户信息。

```
# su - your_ad_user
$ id
$ exit
```

[
 ![Check Samba4 AD User Authentication on Linux](http://www.tecmint.com/wp-content/uploads/2016/11/Check-Samba4-AD-User-Authentication-on-Linux.png) 
][18]

*检查 Linux 下 Samba4 AD 用户认证结果*

22、 当你成功登入系统后，在控制台下输入 `passwd` 命令来修改已登录的 AD 用户密码。

```
$ su - your_ad_user
$ passwd
```

[
 ![Change Samba4 AD User Password](http://www.tecmint.com/wp-content/uploads/2016/11/Change-Samba4-AD-User-Password.png) 
][19]

*修改 Samba4 AD 用户密码*

23、 默认情况下，活动目录用户没有可以完成系统管理工作的 root 权限。

要授予 AD 用户 root 权限，你必须把用户名添加到本地 sudo 组中，可使用如下命令完成。

确保你已输入域 、斜杠和 AD 用户名，并且使用英文单引号括起来，如下所示：

```
# usermod -aG sudo 'DOMAIN\your_domain_user'
```

要检查 AD 用户在本地系统上是否有 root 权限，登录后执行一个命令，比如，使用 sudo 权限执行 `apt-get update` 命令。

```
# su - tecmint_user
$ sudo apt-get update
```

[
 ![Grant sudo Permission to Samba4 AD User](http://www.tecmint.com/wp-content/uploads/2016/11/Grant-sudo-Permission-to-Samba4-AD-User.png) 
][20]

*授予 Samba4 AD 用户 sudo 权限*

24、 如果你想把活动目录组中的所有账号都授予 root 权限，使用 `visudo` 命令来编辑 `/etc/sudoers` 配置文件，在 root 权限那一行添加如下内容：

```
%DOMAIN\\your_domain\  group ALL=(ALL:ALL) ALL
```

注意 `/etc/sudoers` 的格式，不要弄乱。

`/etc/sudoers` 配置文件对于 ASCII 引号字符处理的不是很好，因此务必使用 '%' 来标识用户组，使用反斜杠来转义域名后的第一个斜杠，如果你的组名中包含空格（大多数 AD 内建组默认情况下都包含空格）使用另外一个反斜杠来转义空格。并且域的名称要大写。

[
 ![Give Sudo Access to All Samba4 AD Users](http://www.tecmint.com/wp-content/uploads/2016/11/Give-Sudo-Access-to-All-Samba4-AD-Users.png) 
][21]

*授予所有 Samba4 用户 sudo 权限*

好了，差不多就这些了！管理 Samba4 AD 架构也可以使用 Windows 环境中的其它几个工具，比如 ADUC、DNS 管理器、 GPM 等等，这些工具可以通过安装从 Microsoft 官网下载的 RSAT 软件包来获得。

要通过 RSAT 工具来管理 Samba4 AD DC ，你必须要把 Windows 系统加入到 Samba4 活动目录。这将是我们下一篇文章的重点，在这之前，请继续关注。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/manage-samba4-active-directory-linux-command-line

作者：[Matei Cezar][a]
译者：[rusking](https://github.com/rusking)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/cezarmatei/
[1]:https://linux.cn/article-8065-1.html
[2]:http://www.tecmint.com/60-commands-of-linux-a-guide-from-newbies-to-system-administrator/
[3]:http://www.tecmint.com/wp-content/uploads/2016/11/Samba-Administration-Tool.png
[4]:http://www.tecmint.com/wp-content/uploads/2016/11/Create-User-on-Samba-AD.png
[5]:http://www.tecmint.com/wp-content/uploads/2016/11/List-Samba-AD-Users.png
[6]:http://www.tecmint.com/wp-content/uploads/2016/11/List-Samba-Domain-Members-of-Group.png
[7]:http://www.tecmint.com/wp-content/uploads/2016/11/Check-Samba-Domain-Password.png
[8]:http://www.tecmint.com/wp-content/uploads/2016/11/Manage-Samba-Domain-Password-Settings.png
[9]:http://www.tecmint.com/wp-content/uploads/2016/11/Samba-Authentication-Using-Active-Directory-Accounts.png
[10]:http://www.tecmint.com/wp-content/uploads/2016/11/Check-Samba-Configuration-for-Errors.png
[11]:http://www.tecmint.com/wp-content/uploads/2016/11/PAM-Configuration-for-Samba4-AD.png
[12]:http://www.tecmint.com/wp-content/uploads/2016/11/Enable-PAM-Authentication-Module-for-Samba4-AD.png
[13]:http://www.tecmint.com/wp-content/uploads/2016/11/Add-Windbind-Service-Switch-for-Samba.png
[14]:http://www.tecmint.com/wp-content/uploads/2016/11/Allow-Samba-AD-Users-to-Change-Password.png
[15]:http://www.tecmint.com/wp-content/uploads/2016/11/Check-Information-of-Samba4-AD.png
[16]:http://www.tecmint.com/wp-content/uploads/2016/11/Check-Samba4-AD-User-Info.png
[17]:http://www.tecmint.com/wp-content/uploads/2016/11/Get-Samba4-AD-Details.png
[18]:http://www.tecmint.com/wp-content/uploads/2016/11/Check-Samba4-AD-User-Authentication-on-Linux.png
[19]:http://www.tecmint.com/wp-content/uploads/2016/11/Change-Samba4-AD-User-Password.png
[20]:http://www.tecmint.com/wp-content/uploads/2016/11/Grant-sudo-Permission-to-Samba4-AD-User.png
[21]:http://www.tecmint.com/wp-content/uploads/2016/11/Give-Sudo-Access-to-All-Samba4-AD-Users.png
