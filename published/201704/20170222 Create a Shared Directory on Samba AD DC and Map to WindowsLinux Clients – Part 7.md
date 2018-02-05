Samba 系列（七）：在 Samba AD DC 服务器上创建共享目录并映射到 Windows/Linux 客户机
============================================================

这篇文章将指导你如何在 Samba AD DC 服务器上创建共享目录，然后通过 GPO 把共享目录挂载到域中的其它 Windows 成员机，并且从 Windows 域控的角度来管理共享权限。

这篇文章也包括在加入域的 Linux 机器上如何使用 Samba4 域帐号来访问及挂载共享文件。

### 需求：

1. [在 Ubuntu 系统上使用 Samba4 创建活动目录架构][1]

### 第一步：创建 Samba 文件共享

1、在 Samba AD DC 服务器上创建共享非常简单。首先创建一个你想通过 SMB 协议来分享文件的目录，然后添加下面的文件系统权限，这是为了让 Windows AD DC 管理员给 Windows 客户端分配相应的共享权限。

假设在 AD DC 服务器上有一个新的共享目录 '/nas' ，执行下面的命令来授予必要的权限。

```
# mkdir /nas
# chmod -R 775 /nas
# chown -R root:"domain users" /nas
# ls -alh | grep nas
```

[
 ![Create Samba Shared Directory](http://www.tecmint.com/wp-content/uploads/2017/02/Create-Samba-Shared-Directory.png) 
][2]

*创建 Samba 共享目录*

2、当你在 Samba4 AD DC 服务器上创建完成共享目录之后，你还得修改 samba 配置文件，添加下面的参数以允许通过 SMB 协议来共享文件。

```
# nano /etc/samba/smb.conf
```

在配置文件末尾添加以下内容：

```
[nas]
path = /nas
read only = no
```

[
 ![Configure Samba Shared Directory](http://www.tecmint.com/wp-content/uploads/2017/02/Configure-Samba-Shared-Directory.png) 
][3]

*配置 Samba 共享目录*

3、最后，你需要通过下面的命令重启 Samba AD DC 服务，以让修改的配置生效：

```
# systemctl restart samba-ad-dc.service
```

### 第二步：管理 Samba  共享权限

4、我们准备使用在 Samba AD DC 服务器上创建的域帐号（包括用户和组）来访问这个共享目录（禁止 Linux 系统用户访问共享目录）。

可以直接通过 Windows 资源管理器来完成 Samba 共享权限的管理，就跟你在 Windows 资源管理器中设置其它文件夹权限的方法一样。

首先，使用具有管理员权限的 Samba4 AD 域帐号登录到 Windows 机器。然而在 Windows 机器上的资源管理器中输入双斜杠和 Samba AD DC 服务器的 IP 地址或主机名或者是 FQDN 来访问共享文件和设置权限。

```
\\adc1
或
\\192.168.1.254
或
\\adc1.tecmint.lan
```

[
 ![Access Samba Share Directory from Windows](http://www.tecmint.com/wp-content/uploads/2017/02/Access-Samba-Share-Directory-from-Windows.png) 
][4]

*从 Windows 机器访问 Samba 共享目录*

5、右键单击共享文件，选择属性来设置权限。打开安全选项卡，依次修改域账号和组权限。使用高级选项来调整权限。

[
 ![Configure Samba Share Directory Permissions](http://www.tecmint.com/wp-content/uploads/2017/02/Configure-Samba-Share-Directory-Permissions.png) 
][5]

*配置 Samba 共享目录权限*

可参考下面的截图来为指定 Samba AD DC 认证用户设置权限。

[
 ![Manage Samba Share Directory User Permissions](http://www.tecmint.com/wp-content/uploads/2017/02/Manage-Samba-Share-Directory-User-Permissions.png) 
][6]

*设置 Samba 共享目录用户权限*

6、你也可以使用其它方法来设置共享权限，打开计算机管理-->连接到另外一台计算机。

找到共享目录，右键单击你想修改权限的目录，选择属性，打开安全选项卡。你可以在这里修改任何权限，就跟上图的修改共享文件夹权限的方法一样。

[
 ![Connect to Samba Share Directory Machine](http://www.tecmint.com/wp-content/uploads/2017/02/Connect-to-Samba-Share-Directory-Machine.png) 
][7]

*连接到 Samba 共享目录服务器*

[
 ![Manage Samba Share Directory Properties](http://www.tecmint.com/wp-content/uploads/2017/02/Manage-Samba-Share-Directory-Properties.png) 
][8]

*管理 Samba 共享目录属性*

[
 ![Assign Samba Share Directory Permissions to Users](http://www.tecmint.com/wp-content/uploads/2017/02/Assign-Samba-Share-Directory-Permissions-to-Users.png) 
][9]

*为域用户授予共享目录权限*

### 第三步：通过 GPO 来映射 Samba 文件共享

7、要想通过域组策略来挂载 Samba 共享的目录，你得先到一台[已安装了 RSAT 工具][10] 的服务器上，打开 AD DC 工具，右键单击域名，选择新建-->共享文件夹。

[
 ![Map Samba Share Folder](http://www.tecmint.com/wp-content/uploads/2017/02/Map-Samba-Share-Folder.png) 
][11]

*映射 Samba 共享文件夹*

8、为共享文件夹添加一个名字，然后输入共享文件夹的网络路径，如下图所示。完成后单击 OK 按钮，你就可以在右侧看到文件夹了。

[
 ![Set Samba Shared Folder Name Location](http://www.tecmint.com/wp-content/uploads/2017/02/Set-Samba-Shared-Folder-Name-Location.png) 
][12]

*设置 Samba 共享文件夹名称及路径*

9、下一步，打开组策略管理控制台，找到当前域的默认域策略脚本，然后打开并编辑该文件。

在 GPM 编辑器界面，打开 GPM 编辑器，找到用户配置 --> 首选项 --> Windows 设置，然而右键单击驱动器映射，选择新建 --> 映射驱动。

[
 ![Map Samba Share Folder in Windows](http://www.tecmint.com/wp-content/uploads/2017/02/Map-Samba-Share-Folder-in-Windows.png) 
][13]

*在 Windows 机器上映射 Samba 共享文件夹*

10、通过单击右边的三个小点，在新窗口中查询并添加共享目录的网络位置，勾选重新连接复选框，为该目录添加一个标签，选择驱动盘符，然后单击 OK 按钮来保存和应用配置。

[
 ![Configure Network Location for Samba Share Directory](http://www.tecmint.com/wp-content/uploads/2017/02/Configure-Network-Location-for-Samba-Share-Directory.png) 
][14]

*配置 Samba 共享目录的网络位置*

11、最后，为了在本地机器上强制应用 GPO 更改而不重启系统，打开命令行提示符，然而执行下面的命令。

```
gpupdate /force
```

[
 ![Apply GPO Changes](http://www.tecmint.com/wp-content/uploads/2017/02/Apply-GPO-Changes.png) 
][15]

*应用 GPO 更改*

12、当你在本地机器上成功应用策略后，打开 Windows 资源管理器，你就可以看到并访问共享的网络文件夹了，能否正常访问共享目录取决于你在前一步的授权操作。

如果没有在命令行下强制应用组策略，你网络中的其它客户机需要重启或重新登录系统才可以看到共享目录。

[
 ![Samba Shared Network Volume on Windows](http://www.tecmint.com/wp-content/uploads/2017/02/Samba-Shared-Network-Volume-on-Windows.png) 
][16]

*Windows 机器上挂载的 Samba 网络磁盘*

### 第四步：从 Linux 客户端访问 Samba 共享目录

13、已加入 Samba AD DC 中的 Linux 成员机上的系统用户也可以可以使用 Samba 帐号访问或在本地挂载共享目录。

首先，你得通过下面的命令来确保 Samba 客户端和工具已经安装完成。

```
$ sudo apt-get install smbclient cifs-utils
```

14、为了列出域环境中的共享目录，你可以通过下面的命令加入指定的域控服务器主机名来查询：

```
$ smbclient –L your_domain_controller –U%
或
$ smbclient –L \\adc1 –U%
```

[
 ![List Samba Share Directory in Linux](http://www.tecmint.com/wp-content/uploads/2017/02/List-Samba-Share-Directory-in-Linux.png) 
][17]

*在 Linux 机器上列出 Samba 共享目录*

15、在命令行下使用域帐号以交互试方式连接到 Samba 共享目录：

```
$ sudo smbclient //adc/share_name -U domain_user
```

在命令行下，你可以列出共享目录内容，下载或上传文件到共享目录，或者执行其它操作。使用 `?` 来查询所有可用的 smbclient 命令。

[
 ![Connect Samba Share Directory in Linux](http://www.tecmint.com/wp-content/uploads/2017/02/Connect-Samba-Share-Directory-in-Linux.png) 
][18]

*在 Linux 机器上连接 Samba 共享目录*

16、在 Linux 机器上使用下面的命令来挂载 samba 共享目录。

```
$ sudo mount //adc/share_name /mnt -o username=domain_user
```
[
 ![Mount Samba Share Directory in Linux](http://www.tecmint.com/wp-content/uploads/2017/02/Mount-Samba-Share-Directory-in-Linux.png) 
][19]

*在 Linux 机器上挂载 samba 共享目录*

根据实际情况，依次替换主机名、共享目录名、挂载点和域帐号。使用 `mount` 命令加上管道符和 `grep` 命令来过滤出 cifs 类型的文件系统。

通过上面的测试，我们可以看出，在 Samba4 AD DC 服务器上配置共享目录仅使用 Windows 访问控制列表（ ACL ），而不是 POSIX ACL 。

通过文件共享把 Samba 配置为域成员以使用其它网络共享功能。同时，在另一个域控制器上[配置 Windbindd 服务][20] ——在你开始发起网络共享文件之前。

--------------------------------------------------------------------------------

作者简介：

我是一个电脑迷，开源 Linux 系统和软件爱好者，有 4 年多的 Linux 桌面、服务器系统使用和 Base 编程经验。

译者简介：

春城初春/春水初生/春林初盛/春風十裏不如妳
[rusking](https://github.com/rusking)

--------------------------------------------------------------------------------

via: http://www.tecmint.com/create-shared-directory-on-samba-ad-dc-and-map-to-windows-linux/

作者：[Matei Cezar][a]
译者：[rusking](https://github.com/rusking)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/cezarmatei/

[1]:http://www.tecmint.com/install-samba4-active-directory-ubuntu/
[2]:http://www.tecmint.com/wp-content/uploads/2017/02/Create-Samba-Shared-Directory.png
[3]:http://www.tecmint.com/wp-content/uploads/2017/02/Configure-Samba-Shared-Directory.png
[4]:http://www.tecmint.com/wp-content/uploads/2017/02/Access-Samba-Share-Directory-from-Windows.png
[5]:http://www.tecmint.com/wp-content/uploads/2017/02/Configure-Samba-Share-Directory-Permissions.png
[6]:http://www.tecmint.com/wp-content/uploads/2017/02/Manage-Samba-Share-Directory-User-Permissions.png
[7]:http://www.tecmint.com/wp-content/uploads/2017/02/Connect-to-Samba-Share-Directory-Machine.png
[8]:http://www.tecmint.com/wp-content/uploads/2017/02/Manage-Samba-Share-Directory-Properties.png
[9]:http://www.tecmint.com/wp-content/uploads/2017/02/Assign-Samba-Share-Directory-Permissions-to-Users.png
[10]:https://linux.cn/article-8097-1.html
[11]:http://www.tecmint.com/wp-content/uploads/2017/02/Map-Samba-Share-Folder.png
[12]:http://www.tecmint.com/wp-content/uploads/2017/02/Set-Samba-Shared-Folder-Name-Location.png
[13]:http://www.tecmint.com/wp-content/uploads/2017/02/Map-Samba-Share-Folder-in-Windows.png
[14]:http://www.tecmint.com/wp-content/uploads/2017/02/Configure-Network-Location-for-Samba-Share-Directory.png
[15]:http://www.tecmint.com/wp-content/uploads/2017/02/Apply-GPO-Changes.png
[16]:http://www.tecmint.com/wp-content/uploads/2017/02/Samba-Shared-Network-Volume-on-Windows.png
[17]:http://www.tecmint.com/wp-content/uploads/2017/02/List-Samba-Share-Directory-in-Linux.png
[18]:http://www.tecmint.com/wp-content/uploads/2017/02/Connect-Samba-Share-Directory-in-Linux.png
[19]:http://www.tecmint.com/wp-content/uploads/2017/02/Mount-Samba-Share-Directory-in-Linux.png
[20]:https://linux.cn/article-8070-1.html
[21]:http://www.tecmint.com/author/cezarmatei/
[22]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[23]:http://www.tecmint.com/free-linux-shell-scripting-books/
