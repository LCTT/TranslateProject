n Linux的十条SCP传输命令
================================================================================
Linux系统管理员应该很熟悉**CLI**环境，因为在Linux服务器中是不安装**GUI**的。**SSH**可能是Linux系统管理员通过远程方式安全管理服务器的最流行协议。在**SSH**命令中内置了一种叫**SCP**的命令，用来在服务器之间安全传输文件。

![](http://www.tecmint.com/wp-content/uploads/2013/10/SCP-Commands.png)

以下命令可以解读为：用“**username account**”“**拷贝 source file name**”到“**destination host**”上的“**destination folder**”里。

#### SCP命令的基本语法 ####

    scp source_file_name username@destination_host:destination_folder

**SCP**命令有很多参数供你使用，这里指的是每次都会用到的参数。

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

有一个参数能让传输文件更快，就是“**-C**”参数，它的作用是不停压缩所传输的文件。它特别之处在于压缩是在网络中进行，当文件传到目标服务器时，它会变回压缩之前的原始大小。

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

有一点我们需要注意，这个压缩的方法不是适用于所有文件。当源文件已经被压缩过了，那就没办法再压缩了。诸如那些像**.zip**，**.rar**，**pictures**和**.iso**的文件，用“**-C**”参数就无效。

### 选择其它加密算法来加密文件 ###

**SCP**默认是用“**AES-128**”加密算法来加密文件的。如果你想要改用其它加密算法来加密文件，你可以用“**-c**”参数。我们来瞧瞧。

    pungki@mint ~/Documents $ scp -c 3des Label.pdf mrarianto@202.x.x.x:.
    
    mrarianto@202.x.x.x's password:
    Label.pdf 100% 3672KB 282.5KB/s 00:13

上述命令是告诉**SCP**用**3des algorithm**来加密文件。要注意这个参数是“**-c**”而不是“**-C**“。

### 限制带宽使用 ###

还有一个很有用的参数是“**-l**”参数，它能限制使用带宽。It will be useful if you do an automation script to copy a lot of file, but you don’t want the bandwidth is drained by the **SCP** process.

    pungki@mint ~/Documents $ scp -l 400 Label.pdf mrarianto@202.x.x.x:.
    
    mrarianto@202.x.x.x's password:
    Label.pdf 100% 3672KB 50.3KB/s 01:13

The **400** value behind “**-l**” parameter is mean that we limit the bandwidth for **SCP** process only **50 KB/sec**. One thing to remember that bandwidth is specified in **Kilobits/sec** (**kbps**). It is mean that **8 bits** equal with **1 byte**.

While **SCP** counts in **Kilobyte/sec** (**KB/s**). So if you want to limit your bandwidth for **SCP** maximum only **50 KB/s**, you need to set it into **50 x 8 = 400**.

### Specify specific port to use with SCP ###

Usually **SCP** is using port **22** as a default port. But for security reason, you may change the port into another port. For example, we are using port **2249**. Then the command should be like this.

    pungki@mint ~/Documents $ scp -P 2249 Label.pdf mrarianto@202.x.x.x:.
    
    mrarianto@202.x.x.x's password:
    Label.pdf 100% 3672KB 262.3KB/s 00:14

Make sure that it use capital “**P**” not “**p**“, since “**p**” is already used for preserved times and modes.

### Copy files inside directory recursively ###

Sometimes we need to copy directory and all **files** / **directories** inside it. It will be better if we can do it in **1** command. **SCP** support that scenario using “**-r**” parameter.

    pungki@mint ~/Documents $ scp -r documents mrarianto@202.x.x.x:.
    
    mrarianto@202.x.x.x's password:
    Label.pdf 100% 3672KB 282.5KB/s 00:13
    scp.txt 100% 10KB 9.8KB/s 00:00

When the copy process is done, at the destination server you will found a directory named “**documents**” with all it’s files. The folder “**documents**” is automatically created.

### Disable progress meter and warning / diagnostic message ###

If you choose not to see progress meter and warning / diagnostic messages from SCP, you may disable it using “**-q**” parameter. Here’s the example.

    pungki@mint ~/Documents $ scp -q Label.pdf mrarianto@202.x.x.x:.
    
    mrarianto@202.x.x.x's password:
    pungki@mint ~/Documents $

As you can see, after the you enter the password, there is no any information about SCP process. After the process is complete, you will be see a prompt again.

### Copy files using SCP through Proxy ###

Proxy server is usually used in office environment. Natively, SCP is not proxy configured. When your environment using proxy, you have to “tell” SCP to communicate with the proxy.

Here’s the scenario. The proxy address is **10.0.96.6** and the proxy port is **8080**. The proxy also implemented user authentication. First, you need to create “**~/.ssh/config**” file. Second you put this command inside it.

    ProxyCommand /usr/bin/corkscrew 10.0.96.6 8080 %h %p ~/.ssh/proxyauth

Then you need to create file “**~/.ssh/proxyauth**” which contain.

    myusername:mypassword

After that you can do SCP transparently as usual.

Please notice that corkscrew is might not installed yet on your system. On my Linux Mint, I need to install it first, using standard Linux Mint installation procedure.

    $ apt-get install corkscrew

For other yum based systems, users can install corkscrew using the following yum command.

    # yum install corkscrew

Another thing that since “**~/.ssh/proxyauth**” file contain your “**username**” and “**password**” in clear-text format, please make sure that the file can be accessed by you only.

### Select different ssh_config file ###

For mobile user who often switch between company network and public network, it will be suffer to always change settings in SCP. It is better if we can put a different **ssh_config** file to match our needs.

#### Here’s a sample scenario ####

Proxy is used in company network but not in public network and you are regularly switch network.

    pungki@mint ~/Documents $ scp -F /home/pungki/proxy_ssh_config Label.pdf
    
    mrarianto@202.x.x.x:.
    mrarianto@202.x.x.x's password:
    Label.pdf 100% 3672KB 282.5KB/s 00:13

By default “**ssh_config**” file per user will be placed in “**~/.ssh/config**“. Creating a specific “**ssh_config**” file with proxy compatible, will make you easier to switch between networks.

When you are on company network, you can use “**-F**” parameter. When you are on public network, you can skip “**-F**” parameter.

That’s all about **SCP**. You can see **man pages** of **SCP** for more detail. Please feel free to leave comments and suggestions.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/scp-commands-examples/

作者：[Pungki Arianto][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/pungkiarianto/
