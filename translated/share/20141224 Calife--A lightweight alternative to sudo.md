Calife —— 一个轻量级的sudo替代方案
================================================================================
Calife要求用户用户以自己的密码登录（或者root，如果没有提供登录），在验证具有正确的权限后，就会切换到该用户以及组身份，然后就会执行一个shell。如果calife是由root执行的，不需要密码，一个具有恰当用户ID的shell就会被执行。

唤醒的shell是用户自身的，除非在calife.auth配置文件中指定了某个shell。

如果在命令行指定了“-”选项，就会读取该用户的环境文件，该shell就像是一个登陆shell。

这不是su的惯用操作。

只有在calife.auth中指定的用户才能使用此方法通过calife成为另外一个用户。

calife.auth安装位置处于/etc/calife.auth。

### Calife特性 ###

这里给出了一个关于calife特性的扩展列表：

你可以完整保留环境变量和shell别名

它可以全程记录会话开始到结束

你可以为每个calife用户许可的登录制作列表，那样，你就可以用户赋予主管权限而不必提供root密码

你可以在配置文件中指定一个组来取代所有管理员登录：只要使用@staff或者%staff，那么所有staff组中的成员都将具有访问calife的权限

calife也可以成为那些没有家目录或甚至没有shell的用户。如果你想要成为uucp或者甚至是bin，那会很实用

你可以让calife在会话结束时运行一个指定的系统范围的脚本（例如，发送一封邮件告知以root身份做了哪些事）

### ubuntu中安装calife ###

打开终端，然后运行以下命令

    sudo apt-get install calife

### 使用Calife ###

### 语法 ###

    calife [-] [login]

详情请参与calife手册页

--------------------------------------------------------------------------------

via: http://www.ubuntugeek.com/calife-a-lightweight-alternative-to-sudo.html

作者：[ruchi][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.ubuntugeek.com/author/ubuntufix
[1]:
[2]:
[3]:
[4]:
[5]:
[6]:
[7]:
[8]:
[9]:
[10]:
[11]:
[12]:
[13]:
[14]:
[15]:
[16]:
[17]:
[18]:
[19]:
[20]:
