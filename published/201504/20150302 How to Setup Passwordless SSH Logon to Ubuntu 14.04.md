 如何设置Ubuntu14.04 的 SSH 无密码登录
================================================================================
大家好，今天我来向大家介绍如何在 Ubuntu12.04 上设置 SSH 的无密码登录功能。仅在工作站上有正确的（公私）密钥对以供匹配时SSH服务端才会允许你登录，反之访问将不会被允许。

正常情况下，我们需要连上SSH的控制台输入用户名及其密码才行。如果两者全部正确，我们就可以访问，反之访问被服务端拒绝。不过相比而言还有一种比用密码更安全的登录方式，我们可以在登录SSH时通过加密密钥进行无密码登录。

如果你想启用这个安全的方式，我们只需简单的禁用密码登录并只允许加密密钥登录即可。使用这种方式时，客户端计算机上会产生一对私钥和公钥。接着客户端得把公钥上传到SSH服务端的authorized_key文件中去。在授予访问前，服务器及客户端电脑会校验这个密钥对。如果服务器上的公钥与客服端提交的私钥匹配则授予访问权限，否则访问被拒绝。

这是认证到SSH服务器的非常安全的一种做法，如果你想为单一的SSH用户登录实现安全登录，这也是备受推崇的方式。这里快速的过一遍如何启用无密码登录SSH的配置过程。

### 1.安装Openssh服务端 ###

首先，我们需要更新我们的本地库索引。所以如下所见，我们需要先输入“apt-get update”

    $ sudo apt-get update

![Updating Repo Index](http://blog.linoxide.com/wp-content/uploads/2015/02/updating-repo-list.png)

现在我们可以通过以下命令安装openssh-server：

    $ sudo apt-get install openssh-server

![Installing openssh server](http://blog.linoxide.com/wp-content/uploads/2015/02/installing-openssh-server.png)

### 2. 开启openssh服务 ###

在OpenSSH已经成功安装在Ubuntu14.04操作系统上了之后，我们要启动OpenSSH的服务。以下命令让你启动/开启服务。

    $ sudo service ssh start

或

    $ sudo /etc/init.d/ssh start

### 3. 配置密钥对 ###

在我们安装并启动了OpenSSH服务以后。现在终于到了要我们搞定公私钥对的时候了，在终端中运行以下命令：

    $ ssh-keygen -t rsa

在运行完以上命令了以后，我们需要回答一系列的问题。首先选择保存密钥的路径，按回车将会选择默认路径即家目录的一个隐藏的.ssh文件夹。下一个提示是请输入口令提醒。我个人将此留空（直接回车）。之后密钥对就会创建，大功告成。

![Generating Key Pair](http://blog.linoxide.com/wp-content/uploads/2015/02/generating-key-pair.png)

在密钥对生成以后，我们需要将**客户端上的公钥复制到SSH服务端**或者主机，来创建对客户端的信任关系。运行以下命令复制客户端的公钥到服务端。

    $ ssh-copy-id user@ip_address

在公钥上传之后，我们现在可以禁用通过密码登陆SSH的方式了。为此，我们需要通过以下命令用文本编辑器打开**/etc/ssh/ssh_config**。

    $ sudo nano /etc/ssh/sshd_config

现在，我们需要按照下图所示去掉几行注释并进行一些赋值。

![Configuring sshd Config](http://blog.linoxide.com/wp-content/uploads/2015/02/configuring-sshd_config.png)

### 4. 重启SSH服务 ###

最后，在我们配置完SSH服务端后，为了使改动生效我们需要重启SSH服务。在终端或控制台运行以下命令重启。

    $ sudo service ssh restart

或

    $ sudo /etc/init.d/ssh restart

![Restarting ssh](http://blog.linoxide.com/wp-content/uploads/2015/02/restarting-ssh.png)

现在，我们可以试试不用密码仅用密钥对的方式登录ssh服务端了。

### 总结 ###

太好了！我们成功的配置了无密码登录SSH。使用加密密钥对进行SSH服务器认证是非常安全的一种做法，如果你想为SSH的单一用户登录实施安全的认证这也是备受推崇的方式。所以，如果你还有什么问题或建议，请在意见框中向我们反馈。很欣慰你能读完，希望你能喜欢加密的SSH安全登录 :-)

--------------------------------------------------------------------------------

via: http://linoxide.com/ubuntu-how-to/setup-passwordless-ssh-logon-ubuntu-14-04/

作者：[Arun Pyasi][a]
译者：[martin2011qi](https://github.com/martin2011qi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
