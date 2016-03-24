如何实现ssh无密码登录
================================================================================
假设你是hostA上的一个用户"aliceA"，想以用户“aliceB”的身份ssh到hostB上，但又不想输入密码。那么，你可以参考这篇教程实现ssd无密码登录。

首先，你需要以用户“aliceA”的身份登录到hostA上。

然后，使用ssh-keygen生成一对rsa公私钥，生成的密钥对会存放在~/.ssh目录下。

    $ ssh-keygen -t rsa

接下来，使用下面的命令在目标主机hostB上的aliceB用户目录下创建~/.ssh目录。如果在aliceB@hostB上已经存在.ssh目录，这一步会被略过。

    $ ssh aliceB@hostB mkdir -p .ssh

最后，将hostA上用户“aliceA”的公钥拷贝到aliceB@hostB上，来实现无密码ssh。

    $ cat .ssh/id_rsa.pub | ssh aliceB@hostB 'cat >> .ssh/authorized_keys'
	
自此以后，从aliceA@hostA上ssh到aliceB@hostB上再也不需要输入密码。（LCTT 译注：上述的创建目录并复制的操作也可以通过一个 ssh-copy-id 命令一步完成：`ssh-copy-id -i ~/.ssh/id_rsa.pub  aliceB@hostB`）

### 疑难解答 ###

1. 即使在密钥认证生效后，你可能仍然需要输入SSH密码。如果遇到这种情况，请检查系统日志（如/var/log/secure）以查看是否出现下面的异常。

    Authentication refused: bad ownership or modes for file /home/aliceB/.ssh/authorized_keys

在这种情况下，密钥认证的失败是由于~/.ssh/authorized_keys文件的权限或拥有者不正确。一般情况，如果这个文件对除了你之外的所有用户都可读，就会出现这个错误。用下面的方式改变文件的权限以修正错误。

    $ chmod 700 ~/.ssh/authorized_keys 

--------------------------------------------------------------------------------

via: http://xmodulo.com/how-to-enable-ssh-login-without.html

作者：[Dan Nanni][a]
译者：[KayGuoWhu](https://github.com/KayGuoWhu)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni