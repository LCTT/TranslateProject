十个 SCP 传输命令例子
================================================================================
Linux系统管理员应该很熟悉**CLI**环境，因为通常在Linux服务器中是不安装**GUI**的。**SSH**可能是Linux系统管理员通过远程方式安全管理服务器的最流行协议。在**SSH**命令中内置了一种叫**SCP**的命令，用来在服务器之间安全传输文件。

![](http://www.tecmint.com/wp-content/uploads/2013/10/SCP-Commands.png)

以下命令可以解读为：用“**username account**”“**拷贝 source file name**”到“**destination host**”上的“**destination folder**”里。

#### SCP命令的基本语法 ####

    scp source_file_name username@destination_host:destination_folder

**SCP**命令有很多可以使用的参数，这里指的是每次都会用到的参数。

### 用-v参数来提供SCP进程的详细信息 ###

不带参数的基本**SCP**命令会在后台拷贝文件，除非操作完成或者有错误出现，否则用户在界面上是看不到任何提示信息的。你可以用“**-v**”参数来在屏幕上打印出调试信息，这能帮助你调试连接、认证和配置的一些问题。

    pungki@mint ~/Documents $ scp -v Label.pdf mrarianto@202.x.x.x:.

#### 部分输出 ####

    Executing: program /usr/bin/ssh host 202.x.x.x, user mrarianto, command scp -v -t .
    OpenSSH_6.0p1 Debian-3, OpenSSL 1.0.1c 10 May 2012
    debug1: Reading configuration data /etc/ssh/ssh_config
    debug1: /etc/ssh/ssh_config line 19: Applying options for *
    debug1: Connecting to 202.x.x.x [202.x.x.x] port 22.
    debug1: Connection established.
    debug1: Host '202.x.x.x' is known and matches the RSA host key.
    debug1: Found key in /home/pungki/.ssh/known_hosts:1
    debug1: ssh_rsa_verify: signature correct
    debug1: Next authentication method: password
    mrarianto@202.x.x.x's password:
    debug1: Authentication succeeded (password).
    Authenticated to 202.x.x.x ([202.x.x.x]:22).
    Sending file modes: C0770 3760348 Label.pdf
    Sink: C0770 3760348 Label.pdf
    Label.pdf 100% 3672KB 136.0KB/s 00:27
    Transferred: sent 3766304, received 3000 bytes, in 65.2 seconds
    Bytes per second: sent 57766.4, received 46.0
    debug1: Exit status 0

### 从源文件获取修改时间、访问时间和模式 ###

“**-p**”参数会帮到把预计的时间和连接速度会显示在屏幕上。

    pungki@mint ~/Documents $ scp -p Label.pdf mrarianto@202.x.x.x:.

#### 部分输出 ####

    mrarianto@202.x.x.x's password:
    Label.pdf 100% 3672KB 126.6KB/s 00:29

### 用-C参数来让文件传输更快 ###

有一个参数能让传输文件更快，就是“**-C**”参数，它的作用是不停压缩所传输的文件。它特别之处在于压缩是在网络传输中进行，当文件传到目标服务器时，它会变回压缩之前的原始大小。

来看看这些命令，我们使用一个**93 Mb**的单一文件来做例子。

    pungki@mint ~/Documents $ scp -pv messages.log mrarianto@202.x.x.x:.

#### 部分输出 ####

    Executing: program /usr/bin/ssh host 202.x.x.x, user mrarianto, command scp -v -p -t .
    OpenSSH_6.0p1 Debian-3, OpenSSL 1.0.1c 10 May 2012
    debug1: Reading configuration data /etc/ssh/ssh_config
    debug1: /etc/ssh/ssh_config line 19: Applying options for *
    debug1: Connecting to 202.x.x.x [202.x.x.x] port 22.
    debug1: Connection established.
    debug1: identity file /home/pungki/.ssh/id_rsa type -1
    debug1: Found key in /home/pungki/.ssh/known_hosts:1
    debug1: ssh_rsa_verify: signature correct
    debug1: Trying private key: /home/pungki/.ssh/id_rsa
    debug1: Next authentication method: password
    mrarianto@202.x.x.x's password:
    debug1: Authentication succeeded (password).
    Authenticated to 202.x.x.x ([202.x.x.x]:22).
    debug1: Sending command: scp -v -p -t .
    File mtime 1323853868 atime 1380425711
    Sending file timestamps: T1323853868 0 1380425711 0
    messages.log 100% 93MB 58.6KB/s 27:05
    Transferred: sent 97614832, received 25976 bytes, in 1661.3 seconds
    Bytes per second: sent 58758.4, received 15.6
    debug1: Exit status 0

不用“**-C**”参数来拷贝文件，结果用了**1661.3**秒，你可以比较下用了“**-C**”参数之后的结果。

    pungki@mint ~/Documents $ scp -Cpv messages.log mrarianto@202.x.x.x:.

#### 部分输出 ####

    Executing: program /usr/bin/ssh host 202.x.x.x, user mrarianto, command scp -v -p -t .
    OpenSSH_6.0p1 Debian-3, OpenSSL 1.0.1c 10 May 2012
    debug1: Reading configuration data /etc/ssh/ssh_config
    debug1: /etc/ssh/ssh_config line 19: Applying options for *
    debug1: Connecting to 202.x.x.x [202.x.x.x] port 22.
    debug1: Connection established.
    debug1: identity file /home/pungki/.ssh/id_rsa type -1
    debug1: Host '202.x.x.x' is known and matches the RSA host key.
    debug1: Found key in /home/pungki/.ssh/known_hosts:1
    debug1: ssh_rsa_verify: signature correct
    debug1: Next authentication method: publickey
    debug1: Trying private key: /home/pungki/.ssh/id_rsa
    debug1: Next authentication method: password
    mrarianto@202.x.x.x's password:
    debug1: Enabling compression at level 6.
    debug1: Authentication succeeded (password).
    Authenticated to 202.x.x.x ([202.x.x.x]:22).
    debug1: channel 0: new [client-session]
    debug1: Sending command: scp -v -p -t .
    File mtime 1323853868 atime 1380428748
    Sending file timestamps: T1323853868 0 1380428748 0
    Sink: T1323853868 0 1380428748 0
    Sending file modes: C0600 97517300 messages.log
    messages.log 100% 93MB 602.7KB/s 02:38
    Transferred: sent 8905840, received 15768 bytes, in 162.5 seconds
    Bytes per second: sent 54813.9, received 97.0
    debug1: Exit status 0
    debug1: compress outgoing: raw data 97571111, compressed 8806191, factor 0.09
    debug1: compress incoming: raw data 7885, compressed 3821, factor 0.48

看到了吧，压缩了文件之后，传输过程在**162.5**秒内就完成了，速度是不用“**-C**”参数的10倍。如果你要通过网络拷贝很多份文件，那么“**-C**”参数能帮你节省掉很多时间。

有一点我们需要注意，这个压缩的方法不是适用于所有文件。当源文件已经被压缩过了，那就没办法再压缩很多了。诸如那些像**.zip**，**.rar**，**pictures**和**.iso**的文件，用“**-C**”参数就没什么意义。

### 选择其它加密算法来加密文件 ###

**SCP**默认是用“**AES-128**”加密算法来加密传输的。如果你想要改用其它加密算法来加密传输，你可以用“**-c**”参数。我们来瞧瞧。

    pungki@mint ~/Documents $ scp -c 3des Label.pdf mrarianto@202.x.x.x:.
    
    mrarianto@202.x.x.x's password:
    Label.pdf 100% 3672KB 282.5KB/s 00:13

上述命令是告诉**SCP**用**3des algorithm**来加密文件。要注意这个参数是“**-c**”（小写）而不是“**-C**“（大写）。

### 限制带宽使用 ###

还有一个很有用的参数是“**-l**”参数，它能限制使用带宽。如果你为了拷贝很多文件而去执行了一份自动化脚本又不希望带宽被**SCP**进程耗尽，那这个参数会非常管用。

    pungki@mint ~/Documents $ scp -l 400 Label.pdf mrarianto@202.x.x.x:.
    
    mrarianto@202.x.x.x's password:
    Label.pdf 100% 3672KB 50.3KB/s 01:13

在“**-l**”参数后面的这个**400**值意思是我们给**SCP**进程限制了带宽为**50 KB/秒**。有一点要记住，带宽是以**千比特/秒** (**kbps**)表示的，而**8 比特**等于**1 字节**。

因为**SCP**是用**千字节/秒** (**KB/s**)计算的，所以如果你想要限制**SCP**的最大带宽只有**50 KB/s**，你就需要设置成**50 x 8 = 400**。

### 指定端口 ###

通常**SCP**是把**22**作为默认端口。但是为了安全起见SSH 监听端口改成其它端口。比如说，我们想用**2249**端口，这种情况下就要指定端口。命令如下所示。

    pungki@mint ~/Documents $ scp -P 2249 Label.pdf mrarianto@202.x.x.x:.
    
    mrarianto@202.x.x.x's password:
    Label.pdf 100% 3672KB 262.3KB/s 00:14

确认一下写的是大写字母“**P**”而不是“**p**“，因为“**p**”已经被用来保留源文件的修改时间和模式（LCTT 译注：和 ssh 命令不同了）。

### 递归拷贝文件和文件夹 ###

有时我们需要拷贝文件夹及其内部的所有**文件**/**子文件夹**，我们如果能用一条命令解决问题那就更好了。**SCP**用“**-r**”参数就能做到。

    pungki@mint ~/Documents $ scp -r documents mrarianto@202.x.x.x:.
    
    mrarianto@202.x.x.x's password:
    Label.pdf 100% 3672KB 282.5KB/s 00:13
    scp.txt 100% 10KB 9.8KB/s 00:00

拷贝完成后，你会在目标服务器中找到一个名为“**documents**”的文件夹，其中就是所拷贝的所有文件。“**documents**”是系统自动创建的文件夹。

### 禁用进度条和警告/诊断信息 ###

如果你不想从SCP中看到进度条和警告/诊断信息，你可以用“**-q**”参数来静默它们，举例如下。

    pungki@mint ~/Documents $ scp -q Label.pdf mrarianto@202.x.x.x:.
    
    mrarianto@202.x.x.x's password:
    pungki@mint ~/Documents $

正如你所看到的，在你输入密码之后，没有任何关于SCP进度的消息反馈。进度完成后，你也看不到任何提示。

### 用SCP通过代理来拷贝文件 ###

代理服务器经常用于办公环境，SCP自然是没有经过代理方面的配置的。当你的环境正在使用代理，那么你就必须要“告诉”SCP与代理关联起来。

场景如下：代理的地址是**10.0.96.6**，端口是8080。该代理还实现了用户认证功能。首先，你需要创建一个“**~/.ssh/config**”文件，其次把以下命令输入进该文件。

    ProxyCommand /usr/bin/corkscrew 10.0.96.6 8080 %h %p ~/.ssh/proxyauth

接着你需要创建一个同样包括以下命令的“**~/.ssh/proxyauth**”文件。

    myusername:mypassword

然后你就可以像往常一样使用SCP了。

请注意corkscrew可能还没有安装在你的系统中。在我的Linux Mint中，我需要首先先用标准Linux Mint安装程序来安装它。

    $ apt-get install corkscrew

对于其它的一些基于yum安装的系统，用户能用以下的命令来安装corkscrew。

    # yum install corkscrew

还有一点就是因为“**~/.ssh/proxyauth**”文件中以明文的格式包含了你的“**用户名**”和“**密码**”，所以请确保该文件只能你来查看。

### 选择不同的ssh_config文件 ###

对于经常在公司网络和公共网络之间切换的移动用户来说，一直改变SCP的设置显然是很痛苦的。如果我们能放一个保存不同配置的**ssh_config**文件来匹配我们的需求那就很好了。

#### 以下是一个简单的场景 ####

代理是被用来在公司网络但不是公共网络并且你会定期切换网络时候使用的。

    pungki@mint ~/Documents $ scp -F /home/pungki/proxy_ssh_config Label.pdf
    
    mrarianto@202.x.x.x:.
    mrarianto@202.x.x.x's password:
    Label.pdf 100% 3672KB 282.5KB/s 00:13

默认情况下每个用户会把“**ssh_config**”文件放在“**~/.ssh/config**“路径下。用兼容的代理创建一个特定的“**ssh_config**”文件，能让你切换网络时更加方便容易。

当你处于公司网络时，你可以用“**-F**”参数，当你处于公共网络时，你可以忽略掉“**-F**”参数。

以上就是关于**SCP**的全部内容了，你可以查看**SCP**的**man页面**来获取更多内容，请随意留下您的评论及建议。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/scp-commands-examples/

作者：[Pungki Arianto][a]
译者：[ZTinoZ](https://github.com/ZTinoZ)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/pungkiarianto/
