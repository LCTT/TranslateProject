Samba 系列（十三）：如何在 Samba4 AD 中使用 iRedMail 配置 Thunderbird
============================================================


本教程将指导你如何使用 iRedMail 服务器配置 Mozilla Thunderbird 客户端，以便通过 IMAPS 和 SMTP 提交协议发送和接收邮件，如何使用 Samba AD LDAP 服务器设置联系人数据库以及如何配置其他相关的邮件功能，例如通过 LDAP 数据库离线副本启用 Thunderbird 联系人。

安装和配置 Mozilla Thunderbird 客户端的过程适用于安装在 Windows 或 Linux 操作系统上的 Thunderbird 客户端。

#### 要求

1. [如何在 CentOS 7 上安装 iRedMail 集成到 Samba4 AD][0]
2. [如何配置和集成 iRedMail 服务到 Samba4 AD DC][1]
3. [将 iRedMail Roundcube 与 Samba4 AD DC 集成][2]


### 第一步：为 iRedMail 服务器配置 Thunderbird

1、 在安装完成 Thunderbird 邮件客户端之后，点击启动器或者快捷方式打开程序，并在首屏检查 E-mail 系统集成，然后点击跳过集成按钮继续。

 [![Thunderbird System Integration](https://www.tecmint.com/wp-content/uploads/2017/05/Thunderbird-System-Integration.png)][3] 

*Thunderbird 系统集成*

2、 在欢迎界面点击跳过并使用我已存在的邮件按钮添加你的名字、你的 Samba 帐户邮件地址以及密码，检查记住密码区域并点击继续按钮启动你的邮箱帐户设置。

在 Thunderbird 客户端尝试识别由 iRedMail 服务器提供的正确的IMAP设置后，点击手动配置按钮手动设置 Thunderbird。

 [![Thunderbird Mail Account Setup](https://www.tecmint.com/wp-content/uploads/2017/05/Thunderbird-Mail-Account-Setup.png)][4] 

*Thunderbird 邮箱帐户设置*

3、 邮件帐户设置窗口展开后，通过添加正确的 iRedMail 服务器 FQDN 来手动编辑 IMAP 和 SMTP 设置，为邮件服务添加安全端口（IMAPS 为 993，发送为 587），为每个端口选择合适的 SSL 通信通道并验证然后点击完成完成设置。使用以下图片作为指导。

 [![Thunderbird iRedMail Settings](https://www.tecmint.com/wp-content/uploads/2017/05/Thunderbird-iRedMail-Settings.png)][5] 

*Thunderbird iRedMail 设置*

4、 由于你的 iRedMail 服务器使用自签名证书，屏幕上应会显示一个新的“安全异常”窗口。点击永久存储此异常并按确认安全异常按钮添加此安全性异常，Thunderbird 客户端应该就被成功配置了。

 [![Thunderbird Security Exception](https://www.tecmint.com/wp-content/uploads/2017/05/Thunderbird-Security-Exception.png)][6] 

*Thunderbird 安全异常*

你会看到你的域帐号的所有已收文件，并且你能够从你的域或者其他域发送或者接收文件。

 [![Domain Mails Inbox](https://www.tecmint.com/wp-content/uploads/2017/05/Domain-Mails-Inbox.png)][7] 

*域邮箱收件箱*

### 第二步：使用 Samba AD LDAP 设置 Thunderbird 联系人数据库

5、 为了让 Thunderbird 客户端查询 Samba AD LDAP 数据库中的联系人，点击“设置”菜单，在左边面板右键单击您的帐户，如下图片所示找到 “Composition & Addressing → Addressing → Use a different LDAP server → Edit Directories”

 [![Thunderbird Samba AD LDAP Settings](https://www.tecmint.com/wp-content/uploads/2017/05/Thunderbird-Samba-AD-LDAP-Settings.png)][8] 

*Thunderbird Samba AD LDAP 设置*

 [![Thunderbird Composition & Addressing Settings](https://www.tecmint.com/wp-content/uploads/2017/05/Thunderbird-Composition-Addressing-Settings.png)][9] 

*Thunderbird Composition & Addressing 设置*

6、 LDAP 目录服务器窗口应该带开了，点击添加按钮并将下面的内容填写到目录服务器属性窗口中：

在 “常规” 选项卡上添加此对象的描述性名称，添加你的域的名称或 Samba 域控制器的 FQDN，你的域的基本 DN 形式是 “dc=你的域,dc=tld”，LDAP 端口号 389，vmail 绑定 DN 帐户用于以 vmail@your_domain.tld 的形式查询 Samba AD LDAP 数据库。

使用下面的截图作为指导：

 [![Directory Server Properties](https://www.tecmint.com/wp-content/uploads/2017/05/Directory-Server-Properties.png)][10] 

*目录服务器属性*

7、 在下一步中，从目录服务器属性进入高级选项卡，并在搜索过滤栏添加下面的内容：

```
(&(mail=*)(|(&(objectClass=user)(!(objectClass=computer)))(objectClass=group)))
```
 [![Add Search Filter](https://www.tecmint.com/wp-content/uploads/2017/05/Add-Search-Filter.png)][11] 

*添加搜索过滤*

让其他的设置保持默认，并点击 OK 按钮来应用更改，再次点击 OK 按钮关闭 LDAP 目录服务器窗口，在账户设置界面点击 OK 关闭窗口。

 [![Select LDAP Directory Server](https://www.tecmint.com/wp-content/uploads/2017/05/Select-LDAP-Directory-Server.png)][12] 

*选择 LDAP 目录服务器*

8、 要测试 Thunderbird 是否能够向 Samba AD LDAP 数据库请求联系人，点击上方的地址簿图标，选择之前创建的 LDAP 数据库名。

添加绑定 DN 帐户密码来查询 AD LDAP 服务器，勾选使用密码管理器记住密码，然后点击确定按钮保存更改并关闭窗口。

 [![Thunderbird Samba AD LDAP Testing](https://www.tecmint.com/wp-content/uploads/2017/05/Thunderbird-Samba-AD-LDAP-Testing.png)][13] 

*Thunderbird Samba AD LDAP 测试*

9、 使用上面的搜索框搜索 Samba AD 联系人，并提供一个域名帐户名。注意没有在 AD E-mail 字段声明的邮件地址的 Samba AD 帐户不会在 Thunderbird 地址簿搜索中列出。

 [![Search Samba AD Mail Contacts](https://www.tecmint.com/wp-content/uploads/2017/05/Search-Samba-AD-Mail-Contacts.png)][14] 

*搜索 Samba AD 邮件联系人*

10、 要在编写电子邮件时搜索联系人，请单击视图→联系人侧边栏或按 F9 键打开 “联系人” 面板。

 [![Search Mail Contacts in Thunderbird](https://www.tecmint.com/wp-content/uploads/2017/05/Search-Mail-Contact-in-Thunderbird.png)][15] 

*在 Thunderbird 中搜索联系人*

11、 选择合适的地址簿，你应该能够搜索并添加收件人的电子邮件地址。发送第一封邮件时，会出现一个新的安全警报窗口。点击确认安全例外，邮件应该就能发送到收件人地址中了。

 [![Send Mail in Thunderbird](https://www.tecmint.com/wp-content/uploads/2017/05/Send-Mail-in-Thunderbird.jpg)][16] 

*在 Thunderbird 发送邮件*

12、 如果你想通过仅针对特定 AD 组织单位的 Samba LDAP 数据库搜索联系人，请从左边面板编辑你的目录服务器名称的地址簿，点击属性并添加自定义的 Samba AD OU，如下所示。

```
ou=your_specific_ou,dc=your_domain,dc=tld 
```
 [![Search Contacts in Samba LDAP Database](https://www.tecmint.com/wp-content/uploads/2017/05/Search-Contacts-in-Samba-LDAP-Database.png)][17] 

*Samba LDAP 数据库中搜索联系人*

### 第三步：设置 LDAP 离线副本

13、 要为 Thunderbird 配置 Samba AD LDAP 离线副本，请点击“地址簿”按钮，选择你的 LDAP 通讯录，打开“目录服务器属性” -> “常规” 选项卡，将端口号更改为 3268。

接着切换到离线选项卡并点击“现在下载”按钮开始在本地复制 Samba AD LDAP 数据库。

 [![Setup LDAP Offline Replica in Thunderbird](https://www.tecmint.com/wp-content/uploads/2017/05/Setup-LDAP-Offline-Replica-in-Thunderbird.png)][18] 

*在 Thunderbird 设置 LDAP 离线副本*

 [![Download LDAP Database for Offline](https://www.tecmint.com/wp-content/uploads/2017/05/Download-Samba-LDAP-Database-Offline.png)][19] 

*为离线下载 LDAP 数据库*

当同步联系人完成后，你将收到消息复制成功通知。点击 OK 并关闭所有窗口。在无法访问 Samba 域控制器的情况下，你仍然可以通过离线方式进行搜索。

--------------------------------------------------------------------------------

作者简介：

我是一个电脑上瘾的家伙，开源和基于 linux 的系统软件的粉丝，在 Linux 发行版桌面、服务器和 bash 脚本方面拥有大约4年的经验。

--------------

via: https://www.tecmint.com/configure-thunderbird-with-iredmail-for-samba4-ad-ldap/

作者：[Matei Cezar][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.tecmint.com/author/cezarmatei/
[0]:https://linux.cn/article-8567-1.html
[1]:https://linux.cn/article-8673-1.html
[2]:https://linux.cn/article-8678-1.html
[3]:https://www.tecmint.com/wp-content/uploads/2017/05/Thunderbird-System-Integration.png
[4]:https://www.tecmint.com/wp-content/uploads/2017/05/Thunderbird-Mail-Account-Setup.png
[5]:https://www.tecmint.com/wp-content/uploads/2017/05/Thunderbird-iRedMail-Settings.png
[6]:https://www.tecmint.com/wp-content/uploads/2017/05/Thunderbird-Security-Exception.png
[7]:https://www.tecmint.com/wp-content/uploads/2017/05/Domain-Mails-Inbox.png
[8]:https://www.tecmint.com/wp-content/uploads/2017/05/Thunderbird-Samba-AD-LDAP-Settings.png
[9]:https://www.tecmint.com/wp-content/uploads/2017/05/Thunderbird-Composition-Addressing-Settings.png
[10]:https://www.tecmint.com/wp-content/uploads/2017/05/Directory-Server-Properties.png
[11]:https://www.tecmint.com/wp-content/uploads/2017/05/Add-Search-Filter.png
[12]:https://www.tecmint.com/wp-content/uploads/2017/05/Select-LDAP-Directory-Server.png
[13]:https://www.tecmint.com/wp-content/uploads/2017/05/Thunderbird-Samba-AD-LDAP-Testing.png
[14]:https://www.tecmint.com/wp-content/uploads/2017/05/Search-Samba-AD-Mail-Contacts.png
[15]:https://www.tecmint.com/wp-content/uploads/2017/05/Search-Mail-Contact-in-Thunderbird.png
[16]:https://www.tecmint.com/wp-content/uploads/2017/05/Send-Mail-in-Thunderbird.jpg
[17]:https://www.tecmint.com/wp-content/uploads/2017/05/Search-Contacts-in-Samba-LDAP-Database.png
[18]:https://www.tecmint.com/wp-content/uploads/2017/05/Setup-LDAP-Offline-Replica-in-Thunderbird.png
[19]:https://www.tecmint.com/wp-content/uploads/2017/05/Download-Samba-LDAP-Database-Offline.png
[20]:https://www.tecmint.com/author/cezarmatei/
[21]:https://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[22]:https://www.tecmint.com/free-linux-shell-scripting-books/
