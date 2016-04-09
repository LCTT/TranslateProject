Linux 下 SSH 命令实例指南
================================================================================
如果你已经在IT圈内混了很长时间, 应该对 SSH 这个了不起的工具及其安全特性有所耳闻吧. 本教程可以让你在短时间内掌握通过 SSH 安全便利地连接到远程计算机的技术.

如果你对 SSH 还没什么概念, 可以先访问 [维基百科][1] 进行了解.

### 基本用法 ###

最简单的 SSH 命令只需要指定用户名和主机名参数即可. 主机名可以是 IP 地址或者域名. 命令格式如下:

    $ ssh user@hostname

比如要在我的局域网内登录一个树莓派系统, 只需要简单的在命令行输入如下命令:

    $ ssh pi@10.42.0.47

命令中的 pi 和 10.42.0.47 分别是我的树莓派系统的用户名和局域网 IP 地址. 实际使用时主机名需要改成你的目标主机(局域网内或者远程)的 IP 地址.

![basic ssh](http://linoxide.com/wp-content/uploads/2014/08/basic-ssh.png)

如果你能够成功登陆, 那么下面的内容对你来说就轻而易举了.

### 使用其他端口 ###

SSH 默认连接到目标主机的 22 端口上,但是由于各种原因你可能需要连接到其他端口.

    $ ssh -p 10022 user@hostname

如上命令就是通过添加参数 -p 指定端口号为 10022.

### 远程执行命令 ###

有时在远程主机执行一条命令并显示到本地, 然后继续本地工作是很方便的. SSH 就能满足这个需求:

    $ ssh pi@10.42.0.47 ls -l

比如上面这个命令就会枚举远程主机的主目录内容并在本地显示. 是不是很酷? 你可以尝试下其他命令看看.

![remote command](http://linoxide.com/wp-content/uploads/2014/08/remote-command.png)

### 挂载远程文件系统 ###

另外一个很赞的基于 SSH 的工具叫 sshfs. sshfs 可以让你在本地直接挂载远程主机的文件系统.

    $ sshfs -o idmap=user user@hostname:/home/user ~/Remote

比如下面这条命令:

    $ sshfs -o idmap=user pi@10.42.0.47:/home/pi ~/Pi

该命令就将远程主机 pi 用户的主目录挂载到本地主目录下的 Pi 文件夹.

要详细了解可以参考 [sshfs 教程][2]. 

### X11 图形界面 ###

假如现在你想要在远程主机运行一个图形界面的程序, SSH 已经帮你想到了! 用前面提到的 SSH 基本命令加上参数 -X 连接到远程主机即可开启 X11 转发功能. 登录后你可能觉得没什么差别, 但是当你运行一个图形界面程序后就会发现其中的不同的.

    $ ssh -X pi@10.42.0.47

    $ pistore

如果你想在运行图形界面程序的同时做些别的事情, 只需要简单地在命令末尾加一个 & 符号.

    $ pistore&

![X11 forwarding](http://linoxide.com/wp-content/uploads/2014/08/X11-forwarding.png)

### 转义字符 ###

SSH 提供了多样的转义字符功能. 用 SSH 连接到任意一台远程主机然后输入 ~? 你就可以看到支持的转义字符和功能说明列表. 以下例子展示了 **~#** 和 **~C** 的效果.

![escape sequences](http://linoxide.com/wp-content/uploads/2014/08/escape-sequences.png)

### 配置 SSH ###

如果你需要改变 SSH 的配置, 请用你喜好的文本编辑器打开 **/etc/ssh/sshd_config** 进行编辑. 比如你想改变登陆的标语, 在配置文件中找到下面这行:

    #Banner none

删除 # 字符(取消该行的注释), 将 none 替换为包含你期望显示内容的文件地址. 修改后该行应该类似这样:

    Banner /etc/issue

在配置文件 **/etc/ssh/sshd_config** 中你还可以找到端口号, 空闲超时时间等配置项. 配置项大都比较容易理解, 但是保险起见在你修改一些不是很确定的配置项时最好参考下 SSH 的帮助文档.

### 构建 ssh 密钥对 ###

运行以下命令创建密钥对:

    $ ssh-keygen -t dsa

此命令会要求你输入密码(可以留空), 然后就会生成密钥并会显示一张该密钥对应的随机图.

![generate key pair](http://linoxide.com/wp-content/uploads/2014/08/generate-key-pair.png)

### 寻找主机密钥 ###

在你准备添加密钥之前不妨先用以下命令看看是否已经添加了对应主机的密钥了.

    $ ssh-keygen -F 10.42.0.47

![find hostkey](http://linoxide.com/wp-content/uploads/2014/08/find-hostkey.png)

### 删除主机密钥 ###

某些情况下, 比如主机地址更改或者不再使用某个密钥, 你就可能需要删除某个密钥.

    $ ssh-keygen -R 10.42.0.47

用以上命令就可删除. 这比手动在 **~/.ssh/known_hosts** 文件中删除要方便很多.

![remove hostkey](http://linoxide.com/wp-content/uploads/2014/08/remove-hostkey.png)

### 总结 ###

通过以上的内容你应该可以轻松使用 SSH 了. SSH 还有很多功能值得你去发掘, 这就要看你的想象力了。


--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/pocket-guide-linux-ssh-command/

作者：[Bobbin Zachariah][a]
译者：[henryfour](https://github.com/henryfour)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/bobbin/
[1]:http://en.wikipedia.org/wiki/Secure_Shell
[2]:http://linoxide.com/how-tos/sshfs-mount-remote-directories/
