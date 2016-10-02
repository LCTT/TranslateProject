在 Kali Linux 环境下设置蜜罐
=========================

Pentbox 是一个包含了许多可以使渗透测试工作变得简单流程化的工具的安全套件。它是用 Ruby 编写并且面向 GNU / Linux，同时也支持 Windows、MacOS 和其它任何安装有 Ruby 的系统。在这篇短文中我们将讲解如何在 Kali Linux 环境下设置蜜罐。如果你还不知道什么是蜜罐（honeypot），“蜜罐是一种计算机安全机制，其设置用来发现、转移、或者以某种方式，抵消对信息系统的非授权尝试。"

### 下载 Pentbox：

在你的终端中简单的键入下面的命令来下载 pentbox-1.8。

```
root@kali:~# wget http://downloads.sourceforge.net/project/pentbox18realised/pentbox-1.8.tar.gz
```

![](https://www.blackmoreops.com/wp-content/uploads/2016/05/Set-up-a-honeypot-in-Kali-Linux-blackMORE-Ops-1.jpg)

### 解压 pentbox 文件

使用如下命令解压文件：

```
root@kali:~# tar -zxvf pentbox-1.8.tar.gz
```

![](https://www.blackmoreops.com/wp-content/uploads/2016/05/Set-up-a-honeypot-in-Kali-Linux-blackMORE-Ops-2.jpg)

### 运行 pentbox 的 ruby 脚本

改变目录到 pentbox 文件夹：

```
root@kali:~# cd pentbox-1.8/
```

![](https://www.blackmoreops.com/wp-content/uploads/2016/05/Set-up-a-honeypot-in-Kali-Linux-blackMORE-Ops-3.jpg)

使用下面的命令来运行 pentbox：

```
root@kali:~# ./pentbox.rb
```

![](https://www.blackmoreops.com/wp-content/uploads/2016/05/Set-up-a-honeypot-in-Kali-Linux-blackMORE-Ops-4.jpg)

### 设置一个蜜罐

使用选项 2 (Network Tools) 然后是其中的选项 3 (Honeypot)。

![](https://www.blackmoreops.com/wp-content/uploads/2016/05/Set-up-a-honeypot-in-Kali-Linux-blackMORE-Ops-5.jpg)

完成让我们执行首次测试，选择其中的选项 1 (Fast Auto Configuration) 

![](https://www.blackmoreops.com/wp-content/uploads/2016/05/Set-up-a-honeypot-in-Kali-Linux-blackMORE-Ops-6.jpg)

这样就在 80 端口上开启了一个蜜罐。打开浏览器并且打开链接 http://192.168.160.128 (这里的 192.168.160.128 是你自己的 IP 地址。)你应该会看到一个 Access denied 的报错。


![](https://www.blackmoreops.com/wp-content/uploads/2016/05/Set-up-a-honeypot-in-Kali-Linux-blackMORE-Ops-7.jpg)

并且在你的终端应该会看到 “HONEYPOT ACTIVATED ON PORT 80” 和跟着的 “INTRUSION ATTEMPT DETECTED”。

![](https://www.blackmoreops.com/wp-content/uploads/2016/05/Set-up-a-honeypot-in-Kali-Linux-blackMORE-Ops-8.jpg)

现在，如果你在同一步选择了选项 2 (Manual Configuration), 你应该看见更多的其它选项：

![](https://www.blackmoreops.com/wp-content/uploads/2016/05/Set-up-a-honeypot-in-Kali-Linux-blackMORE-Ops-9.jpg)

执行相同的步骤但是这次选择 22 端口 (SSH 端口)。接着在你家里的路由器上做一个端口转发，将外部的 22 端口转发到这台机器的 22 端口上。或者，把这个蜜罐设置在你的云端服务器的一个 VPS 上。

你将会被有如此多的机器在持续不断地扫描着 SSH 端口而震惊。 你知道你接着应该干什么么？ 你应该黑回它们去！桀桀桀！

如果视频是你的菜的话，这里有一个设置蜜罐的视频：

<https://youtu.be/NufOMiktplA>

--------------------------------------------------------------------------------

via: https://www.blackmoreops.com/2016/05/06/setup-honeypot-in-kali-linux/

作者：[blackmoreops.com][a]
译者：[wcnnbdk1](https://github.com/wcnnbdk1)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: blackmoreops.com
