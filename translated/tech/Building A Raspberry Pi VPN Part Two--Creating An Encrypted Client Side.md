在树莓派上建立VPN~第二部分~：建立加密客户端
================================================================================
> 你已经成功搭建了一个工作中的VPN服务器! 现在该干什么了?

欢迎来到ReadWrite的树莓派VPN搭建教程的第二部分!

到现在为止, 我们已经很清楚地摆平了将你的树莓派变成了一个虚拟私人网络这个工作. 但是随着[未来安全漏洞对互联网生活的妥协][1], 让我们感觉拥有一个安全的服务器在你的身边越来越重要了. 通过这样, 你就可以不用担心有人在信息传输于你的电脑和互联网时拦截信息, 自由地写邮件以及传输数据了.

[如果你看了此教程的第一部分][2], 你应该在你的树莓派上已经配置完一个拥有完全功能的VPN服务器了. 你可以在有免费WiFi时用这个服务器来传输加密信息了. 你也可以访问保存于你家里网络中已分享的文件以及媒体.

只是, 你现在还无法访问. 我们现在已经为客户端(计算机和移动设备)创建了访问的密钥, 但是我们还没有告诉客户端服务器的访问地址, 如何连接, 以及用什么密钥访问.

你应该记得, 我们已经为需要连接VPN的不同客户端创建了不同的密钥. 我们将客户端命名为 Client1, Client2 和 Client3.

但是为每个客户端从零单独生成一个配置文件会造成很多不必要的麻烦, 这就是为什么我们需要使用[SANS institute][3]的Eric Jodoin写的巧妙的脚本. 这个脚本会帮助我们生成配置文件.

### 跟随脚本 ###

这个脚本会访问我们的默认设置, 从而为每一个客户端生成各自的配置文件. 我们需要做的第一件事是, 创建一个空的刻度文本文档并写入我们的默认配置.

    nano /etc/openvpn/easy-rsa/keys/Default.txt

写入下面的文本:

    client 
    
    dev tun 
    
    proto udp 
    
    remote <你的公网ip地址> 1194 
    
    resolv-retry infinite 
    
    nobind 
    
    persist-key 
    
    persist-tun 
    
    mute-replay-warnings 
    
    ns-cert-type server 
    
    key-direction 1 
    
    cipher AES-128-CBC 
    
    comp-lzo 
    
    verb 1 
    
    mute 20 

这个文档应该长的和下面的截屏差不多, 除了你应该填入你自己的公网ip地址之外. 你注意到了我已经把我的公网ip删除了, 当然这是为了保护我的隐私. 换句话说, 每个人的本地静态ip都差不多. 他们都以 "192.268." 起头.

![](http://readwrite.com/files/Screen%20Shot%202014-04-10%20at%2011.14.04%20AM.png)

如果你没有一个公网ip的话, 你需要使用动态DNS服务来给你自己一个域名来代替公网ip. 我建议你使用免费服务[DNS Dynamic][4], 它允许你取自己选择的名字. 然后在你的树莓派上, 你需要运行DDclient来自动更新你的DDNS登记. 我在[这里][5]写过一篇完整的教程.

同样, 按 Control+X 来保存文件并推出nano.

接下来, 我们需要创建一个实际的脚本. 一个可执行脚本通常从shell启动, 可以自动化一些我们需要做的工作.

    nano /etc/openvpn/easy-rsa/keys/MakeOPVN.sh

[这里][6]是脚本文件, 由Jodoin编写. 将内容复制粘贴至编辑器(注意一下复制粘贴中产生的问题).

你需要将执行权限赋予给这个脚本. 首先改变所在目录:

    cd /etc/openvpn/easy-rsa/keys/

然后给予其root权限. 如果你还记得第一部分教程的内容的话, Linux中的权限管理由[不同的3位数字][7]实现. 700表示"所有者可以读,写,执行".

    chmod 700 MakeOPVN.sh

最后, 执行文件:

    ./MakeOPVN.sh

在脚本运行途中, 他会要求你输入现有的客户端名称. 实例: "Client1". 注意只输入已经存在的客户端名称.

如果一切运行良好的话, 你应该会看到下面这行字弹出:

    Done! Client1.opvn Successfully Created.

为剩下的客户端都执行这一步.

最后要做的事是将客户端连上树莓派, 然后你就可以从客户端下载文件了. 你需要使用一个SCP (Secure Copy Protocol)客户端来实现它. 在Windows中, 我推荐[WinSCP][8]. 我一直在mac中使用[Fugu][9].

注意: 如果你没有连接SCP客户端的权限, 你需要为自己授权在此文件夹的读/写权限. 回到树莓派中输入:

    chmod 777 -R /etc/openvpn

注意在你复制完文件后取消这一步, 从而其他人不能从这里下载文件! 完成之后将权限改为[600][10], 使树莓派的用户能读/写文件:

    chmod 600 -R /etc/openvpn

完成后回到客户端.

### 使用客户端软件 ###

好了,困难的部分都结束了. 从这里开始我们需要将之前生成的脚本输入图形用户界面. 对PC, Android或者iOS手机来说, 你可以下载[OpenVPN Connect][11]. 但是这个软件没有mac版, 所以我尝试了[Tunnelblick][12]和[Viscosity][13].

Tunnelblick 是免费的, 但是Viscosity在免费30天尝试之后需要9美刀来购买. 不管怎么样, 我们来尝试下将mac连入我们的服务器吧.

在我的情况下, mac是我第5个连接VPN的客户端, 所以我生成的文件名叫做client5.opvn.

下载可以在你的OS X版本下运行的Tunnelblick. 我在使用Mavericks, 所以我下载了[beta][14]版. 虽然这个软件有很多我看起来很好笑的语言弹出, 但这真的是一个合法的下载.

![](http://readwrite.com/files/Screen%20Shot%202014-04-10%20at%2011.37.36%20AM.png)

然后它会问你, 你的配置文件是.opvn或.tblk. 如果你选择了.opvn它会带你将文件格式转换成Tunnelblick本地格式. 我把Client.opvn传送至Tunnelblick提供的文件夹, 然后把文件夹的名字改为了Client5.tblk.

好啦, 你已经可以连接了. 点击屏幕右上方Tunnelblick的标志然后选择Client5.

![](http://readwrite.com/files/Screen%20Shot%202014-04-10%20at%2011.40.04%20AM.png)

它会问你是否传输密码文本, 这个密码和上篇中我们生成各个客户端时使用的密码是同样的.

![](http://readwrite.com/files/Screen%20Shot%202014-04-10%20at%2011.42.33%20AM.png)

如果你密码输入正确, 你会获得像上面这样的情况.

尝试在咖啡厅, 图书馆或任何有免费WiFi的地方连接VPN. 通过使用VPN, 即使你连接的是公共网络, 你的数据仍然是安全的.

教程展示于ReadWrite.

--------------------------------------------------------------------------------

via: http://readwrite.com/2014/04/11/building-a-raspberry-pi-vpn-part-two-creating-an-encrypted-client-side

译者：[ThomazL](https://github.com/ThomazL) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://readwrite.com/2014/04/10/heartbleed-security-protect-yourself-data-passwords
[2]:http://readwrite.com/2014/04/10/raspberry-pi-vpn-tutorial-server-secure-web-browsing
[3]:http://www.sans.org/
[4]:https://www.dnsdynamic.org/
[5]:http://readwrite.com/2014/04/09/raspberry-pi-projects-ssh-remote-desktop-static-ip-tutorial
[6]:https://gist.github.com/laurenorsini/10013430/revisions
[7]:http://www.thinkplexx.com/learn/article/unix/command/chmod-permissions-flags-explained-600-0600-700-777-100-etc
[8]:http://winscp.net/eng/index.php
[9]:http://download.cnet.com/Fugu/3000-7240_4-26526.html
[10]:http://linuxcommand.org/lts0070.php
[11]:http://openvpn.net/
[12]:https://code.google.com/p/tunnelblick/
[13]:https://www.sparklabs.com/viscosity/
[14]:https://code.google.com/p/tunnelblick/wiki/DownloadsEntry#Tunnelblick_Beta_Release
