Translating by KennethXia

Opensource.com: 高级 SSH 用法表
===========================

所有人都知道 SSH 是一种远程登录工具，但它也有多种其他用途。
Most people know SSH as a tool for remote login, which it is, but it can be used in many other ways. 

```
创建一个 SOCKS 代理来浏览网页（也就是翻墙啦）
ssh -D <port> <remote_host>
设置　localhost:<port>　作为你浏览器的代理

连接一个躲在防御服务器背后的　Windows　RDP 主机
Connect to a Windows RDP host behind a bastion server 
ssh -L <port>:<target_host>:3389 <bastion_server> 
让你的 RDP 客户端连接到 localhost:<port> 
Set your RDP client to connect to localhost:<port> 

在不使用 VNC 端口的情况下，连接远程 VNC 主机
ssh -L 5901:localhost:5901 <remote_host> 
让你的 VNC 客户端连接到 localhost:5901 
按照这个思路，你可以映射任意端口： LDAP (389), 631 (CUPS), 8080 (alternate HTTP)，等等

产生一个新的 SSH 密钥对
ssh-keygen 

更新密钥对的密码
ssh-keygen -p 

把公钥复制到远程主机上
ssh-copy-id -i <identity file> <remote_host> 

SSH 有一堆命令行选项，但是如果有一些是你经常使用的，你可以为他们在 SSH 配置文件 (${HOME}/.ssh/config) 里创建一个入口。比如：
host myhouse 
    User itsme 
    HostName house.example.com 
那么你就可以输入 ssh myhouse 来代替 ssh itsme@house.example.com. 
```

以下是常用的命令行选项和他们的配置文件写法。一些是常用的简化写法。请查看 ssh(1) 和 ssh_config(5) 的手册页来获取详尽信息。

|Command Line| Configuration File|Description
|:--|:--|:--|
|-l \<login name\>| User \<login name\>|远程主机的登录用户名。| 
|-i \<identity file\> |IdentityFile \<identity file\> |指定要使用的鉴权文件（SSH 密码对）。 |
|-p \<remote port\>| Port \<remote port\>|远程 SSH 守护进程监听的端口号。 (默认为 22) |
|-C|Compression \<yes\|no\>|压缩往来信息。 (默认为 no) |
|-D \<port\>|DynamicForward \<port\>|把本地端口的报文转发到远程主机。 |
|-X|ForwardX11 \<yes\|no\>|把 X11 的图像数据转发到远程主机的端口. (默认为 no) |
|-A|ForwardAgent \<yes\|no\>|把授权代理的报文转发给远程主机。如果你使用第三方主机登录，这个功能将很有用。 (默认为 no) |
|-4  (use IPv4 only)  -6  (use IPv6 only)|AddressFamily \<any\|inet4\|inet6\> |指定仅使用 IPv4 或者 IPv6. |
|-L  \<local port\>:\<target host\>:\<target port\> |LocalForward \<local port\>:\<target host\>:\<target port\> |把本地主机指定端口的报文转发到远程主机的某个端口。|

opensource.com

Twitter @opensourceway  |  facebook.com/opensourceway  |  IRC: #opensource.com on Freenode



--------------------------------------------------------------------------------

作者简介：

Ben Cotton is a meteorologist by training and a high-performance computing engineer by trade. Ben works as a product marketing manger at Microsoft Azure focused on high performance computing. He is a Fedora user and contributor, co-founded a local open source meetup group, and is a member of the Open Source Initiative and a supporter of Software Freedom Conservancy. Find him on Twitter (@FunnelFiasco) or at FunnelFiasco.com.

-------------

via: https://opensource.com/sites/default/files/gated-content/cheat_sheet_ssh_v03.pdf

作者：[ BEN COTTON ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/bcotton
[1]:https://web.kamihq.com/web/upgrade.html
