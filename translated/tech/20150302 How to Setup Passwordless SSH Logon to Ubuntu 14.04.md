设置Ubuntu14.04无密码登录SSH
================================================================================
大家好，今天我来向大家介绍如何在可信的Ubuntu12.04上设置无密码登录SSH功能。仅在工作站有正确的（公私）密钥以供匹配时SSH服务端才会允许你登录，反之访问将不会被允许。

正常情况下，我们需要连上SSH的控制台输入用户名和密码，两者结合使用。如果两者全部正确，我们就可以访问，反之访问被服务端拒绝。不过相比而言还有一种比用密码更安全的登录方式，我们用的不是密码在登录SSH我们用的是密钥。

如果你想使用这个安全的方式，我们只需简单的禁用密码登录并只允许密钥即可。使用这种方式时，客户端计算机上会产生公私一对密钥。接着客户端得把公钥上传到SSH服务端的密要验证文件中去。在访问被授予前，服务器及客户端电脑互验密钥对。如果服务器上的公钥与客服端提交的私钥匹配访问开始，否则访问被拒绝。

这是获取SSH服务器认证中非常安全的一种做法，如果你想为SSH用户登录实施安全的认证，这也是备受推崇的方式。这里快速的过一遍允许无密码登录SSH的配置过程。

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

OR

    $ sudo /etc/init.d/ssh start

### 3. 配置密钥对 ###

在我们安装并启动了OpenSSH服务以后。现在终于到了要我们搞定公私钥对的时候了，在终端中运行以下命令：

    $ ssh-keygen -t rsa

在运行完以上命令了以后，我们完成一系列的提示的任务。首先选择保存密钥路径，按回车将会选择默认路径即家目录的一个隐藏的.ssh文件夹。下一个提示是请输入提醒。我个人将此留白（回车过）。之后密钥对就会创建，大功告成。

![Generating Key Pair](http://blog.linoxide.com/wp-content/uploads/2015/02/generating-key-pair.png)

在密钥对生成以后，我们需要将**客户端的上的公钥复制到SSH服务端**或者宿主来创建对客户端的信任关系。运行以下命令复制客户端的公钥到服务端。

    $ ssh-copy-id user@ip_address

在公钥上传之后，我们现在可以不用通过密码登陆SSH了。为此，我们需要通过以下命令用文本编辑器打开**etc/ssh/ssh_config**。

    $ sudo nano /etc/ssh/sshd_config

现在，我们需要按照下图所示去到几行注释并进行一些赋值。

![Configuring sshd Config](http://blog.linoxide.com/wp-content/uploads/2015/02/configuring-sshd_config.png)

### 4. 重启SSH服务 ###

最后，在我们配置完SSH服务端后，为了使改动生效我们需要重启SSH服务。在终端或控制台运行以下命令重启。

    $ sudo service ssh restart

OR

    $ sudo /etc/init.d/ssh restart

![Restarting ssh](http://blog.linoxide.com/wp-content/uploads/2015/02/restarting-ssh.png)

现在，我们可以试试不用密码仅用密钥配对的方式登录ssh服务端了。

### 总结 ###

太好了！我们成功的配置了无密码登录SSH。这是获取SSH服务器认证中非常安全的一种做法，如果你想为SSH但用户登录实施安全的认证这也是备受推崇的方式。所以，如果你还有什么问题或建议，请在意见框中向我们反馈。很欣慰你能读完，祝你SSH登录愉快 :-)

--------------------------------------------------------------------------------

via: http://linoxide.com/ubuntu-how-to/setup-passwordless-ssh-logon-ubuntu-14-04/

作者：[Arun Pyasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
