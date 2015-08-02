Linux 服务器安全技巧
================================================================================

毋庸置疑，对于系统管理员，提高服务器的安全性是最重要的事情之一。因此，也就有了许多针对这个话题而生的文章、博客和论坛帖子。

一台服务器由大量功能各异的部件组成，这一点使得很难根据每个人的需求去提供定制的解决方案。这篇文章尽可能涵盖一些有所裨益的小技巧来帮助管理员保证服务器和用户安全。

有一些常识是每个系统管理员都应该烂熟于心的，所以下面的几点在本文将不会提及：

- 务必保证系统是**最新的**
- 经常更换密码 - 使用数字、字母和非字母的符号组合
- 给予用户**最小**的权限，满足他们日常使用所需即可
- 只安装那些真正需要的软件包

下面是一些更有意思的内容：

### 更改SSH默认端口 ###

在搭建好一台全新的服务器后要做的第一件事情就是更改SSH的默认端口。这个小小的改动能够使你的服务器避免受到成千上万的暴力攻击（LCTT 译注：不更改默认端口相当于黑客们知道你家的门牌号，这样他们只需要一把一把的试钥匙就可能打开你家的锁）。

要更改默认的SSH端口，先打开sshd_config文件：

    sudo vim /etc/ssh/sshd_config

找到下面这行：

    #Port 22

“#”号表示这行是注释。首先删除#号，然后把端口号改成目的端口。端口号不能超过65535，确保要指定的端口号没有被系统或其它服务占用。建议在[维基百科]上查看常用端口号列表。在本文中，使用这个端口号：

    Port 16543

然后保存并关闭文件，等待更改生效。

接下来的一步是：

### 使用SSH密钥认证 ###

在通过SSH访问服务器时，使用SSH密钥进行认证是尤其重要的。这样做为服务器增加了额外的保护，确保只有那些拥有密钥的人才能访问服务器。

在本地机器上运行下面命令以生成SSH密钥：

    ssh-keygen -t rsa

你会看到下面的输出，询问要将密钥写到哪一个文件里，并且设置一个密码：

    Generating public/private rsa key pair.
    Enter file in which to save the key (/root/.ssh/id_rsa): my_key
    Enter passphrase (empty for no passphrase): 
    Enter same passphrase again: 
    Your identification has been saved in my_key.
    Your public key has been saved in my_key.pub.
    The key fingerprint is:
    SHA256:MqD/pzzTRsCjZb6mpfjyrr5v1pJLBcgprR5tjNoI20A

完成之后，就得到两个文件：

my_key

my_key.pub

接下来把my\_key.pub拷贝到~/.ssh/authorized\_key中

    cp my_key.pub ~/.ssh/authorized_keys

然后使用下面命令将密钥上传到服务器：

    scp -P16543 authorized_keys user@yourserver-ip:/home/user/.ssh/

至此，你就可以从这台本地机器上无密码地访问服务器了。

### 关闭SSH的密码认证 ###

既然已经有了SSH密钥，那么关闭SSH的密码认证就会更安全了。再次打开并编辑sshd_config，按如下设置：

    ChallengeResponseAuthentication no
    PasswordAuthentication no
    UsePAM no

### 关闭Root登录 ###

下面关键的一步是关闭root用户的直接访问，而使用sudo或su来执行管理员任务。首先需要添加一个有root权限的新用户，所以编辑这个路径下的sudoers文件：

    /etc/sudoers/

推荐使用如**visudo**这样的命令编辑该文件，因为它会在关闭文件之前检查任何可能出现的语法错误。当你在编辑文件时出错了，这就很有用了。

接下来赋予某个用户root权限。在本文中，使用用户**sysadmin**。确保在编辑后这个文件时使用的用户是系统已有的用户。找到下面这行：

    root ALL=(ALL) ALL

拷贝这行，然后粘贴在下一行，然后把root更改为“sysadmin”，如下所示：

    root ALL=(ALL) ALL
    sysadmin ALL=(ALL) ALL

现在解释一下这行的每一个选项的含义：

    (1) root  (2)ALL=(3)(ALL) (4)ALL

(1) 指定用户

(2) 指定用户使用sudo的终端

(3) 指定用户可以担任的用户角色

(4) 这个用户可以使用的命令

（LCTT 译注：所以上面的配置是意思是：root 用户可以在任何终端担任任何用户，执行任何命令。）

使用这个配置可以给用户访问一些系统工具的权限。

这时，可以放心保存文件了。

为了关闭通过SSH直接访问root，需要再次打开**sshd_config**，找到下面这行：

    #PermitRootLogin yes

更改为：

    PermitRootLogin no

然后保存文件，重启sshd守护进程使改动生效。执行下面命令即可：

    sudo /etc/init.d/sshd restart

### 设置防火墙 ###

防火墙有助于过滤出入端口和阻止使用暴力法的登录尝试。我倾向于使用SCF(Config Server Firewall)这个强力防火墙。它使用了iptables，易于管理，而且对于不擅于输入命令的用户提供了web界面。

要安装CSF，先登录到服务器，切换到这个目录下：

    cd /usr/local/src/

然后以root权限执行下面命令：

    wget https://download.configserver.com/csf.tgz
    tar -xzf csf.tgz
    cd csf
    sh install.sh

只需等待安装程序完成，然后编辑CSF的配置文件：

    /etc/csf/csf.conf

默认情况下CSF是以测试模式运行。通过将“TESTING”的值设置成0，切换到product模式。

    TESTING = "0"

下面要设置的就是服务器上允许通过的端口。在csf.conf中定位到下面的部分，根据需要修改端口：

    # 允许入站的 TCP 端口
    TCP_IN = "20,21,25,53,80,110,143,443,465,587,993,995,16543"
    # 允许出站的 TCP 端口
    TCP_OUT = "20,21,22,25,53,80,110,113,443,587,993,995,16543"
    # 允许入站的 UDP 端口
    UDP_IN = "20,21,53"
    # 允许出站的 UDP 端口
    # 要允许发出 traceroute 请求，请加 33434:33523 端口范围到该列表 
    UDP_OUT = "20,21,53,113,123"

请根据需要逐一设置，推荐只使用那些需要的端口，避免设置对端口进行大范围设置。此外，也要避免使用不安全服务的不安全端口。比如只允许端口465和587来发送电子邮件，取代默认的SMTP端口25。（LCTT 译注：前提是你的邮件服务器支持 SMTPS）

**重要**：千万不要忘记允许自定义的 ssh 端口。

允许你的IP地址通过防火墙，而绝不被屏蔽，这一点很重要。IP地址定义在下面的文件中：

    /etc/csf/csf.ignore

被屏蔽了的IP地址会出现在这个文件中：

    /etc/csf/csf.deny

一旦完成更改，使用这个命令重启csf：

    sudo /etc/init.d/csf restart

下面是在某台服务器上的csf.deny文件的部分内容，来说明CSF是很有用的：

    211.216.48.205 # lfd: (sshd) Failed SSH login from 211.216.48.205 (KR/Korea, Republic of/-): 5 in the last 3600 secs - Fri Mar 6 00:30:35 2015
    103.41.124.53 # lfd: (sshd) Failed SSH login from 103.41.124.53 (HK/Hong Kong/-): 5 in the last 3600 secs - Fri Mar 6 01:06:46 2015
    103.41.124.42 # lfd: (sshd) Failed SSH login from 103.41.124.42 (HK/Hong Kong/-): 5 in the last 3600 secs - Fri Mar 6 01:59:04 2015
    103.41.124.26 # lfd: (sshd) Failed SSH login from 103.41.124.26 (HK/Hong Kong/-): 5 in the last 3600 secs - Fri Mar 6 02:48:26 2015
    109.169.74.58 # lfd: (sshd) Failed SSH login from 109.169.74.58 (GB/United Kingdom/mail2.algeos.com): 5 in the last 3600 secs - Fri Mar 6 03:49:03 2015

可以看到，尝试通过暴力法登录的IP地址都被屏蔽了，真是眼不见心不烦啊！

### 锁住账户 ###

如果某个账户在很长一段时间内都不会被使用了，那么可以将其锁住以防止其它人访问。使用如下命令：

    passwd -l accountName

当然，这个账户依然可以被root用户使用（LCTT 译注：可用 su 切换为该账号）。

### 了解服务器上的服务 ###

服务器的本质是为各种服务提供访问功能。使服务器只运行所需的服务，关闭没有使用的服务。这样做不仅会释放一些系统资源，而且也会使服务器变得更加安全。比如，如果只是运行一个简单的服务器，显然不需要X显示或者桌面环境。如果不需要Windows网络共享功能，则可以放心关闭Samba。

使用下面的命令能查看伴随系统启动而启动的服务：

    chkconfig --list | grep "3:on"

如果系统运行了**systemd**，执行这条命令：

    systemctl list-unit-files --type=service | grep enabled

然后使用下面的命令关闭服务：

    chkconfig service off
    或
    systemctl disable service

在上面的例子中，把“service”替换成真正想要停止的服务名称。实例如下：

    chkconfig httpd off
    或
    systemctl disable httpd

### 小结 ###

这篇文章的目的是涵盖一些通用的安全步骤以便帮助你保护服务器。你可以采取更多方式去增强对服务器的保护。请记住保证服务器安全是你的责任，在维护服务器安全时尽量做出明智的选择，尽管并没有什么容易的方式去完成这件事情，而建立“完善的”安全需要花费大量的时间和测试直到达到想要的结果。

--------------------------------------------------------------------------------

via: http://www.linuxveda.com/2015/06/03/secure-linux-server/

作者：[Marin Todorow][a]
译者：[KayGuoWhu](https://github.com/KayGuoWhu)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxveda.com/author/marin_todorov/
[1]:http://en.wikipedia.org/wiki/Port_%28computer_networking%29#Common_port_numbers




