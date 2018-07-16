如何使用安卓设备控制你的Linux PC
================================================================================
**下面的教程会指导所有的Linux用户如何在系统上安装SSH，以便通过安卓智能手机远程访问他们的电脑。**

![](http://i1-news.softpedia-static.com/images/news2/How-to-Control-Your-Linux-PC-with-an-Android-Device-396004-2.jpg)
如今我们所有人都拥有一台平板或触屏手机，我们经常使用它们在深夜里看电影或电视节目，听歌或者读一本好书。你可以把本文称作是“懒人教程”，它是专门为那些在大晚上因为太过疲惫而懒得去开启他们电脑上的某些应用程序，移动、删除，复制或重命名某些文件，甚至懒得去关掉PC的人准备的。

的确，已经有各种各样的远程桌面解决方案，但是许多方案费用很高，或者实现效果很糟糕，无法像预期一样运行，迫使你最终还是得去电脑上做你原本想做的事情。

在这个教程里面，我们将使用一种简单、安全、高效的协议，它被称为SSH (Secure Shell)，很容易从默认的软件仓库中安装（在Arch linx中是openssh，在Ubuntu中是openssh-server）。

### 配置SSH服务器 ###

在安装完成后，你需要为SSH服务器进行基本配置。为此，你需要使用文本编辑器编辑/etc/ssh/sshd_config这个文件。

1.在文件尾部添加下面一行（下面的yourusername使用你的Linux机器上存在的用户名代替）

AllowUsers yourusername

2.取消"#PermitRootLogin"这行注释，把"no"替换成"yes"（译注：下面的选项修改和是否允许ssh登录无关，只是允许root直接登录，一般而言，并不建议如下这样的远程root直接登录。）：

    PermitRootLogin no

3.为了安全起见，你需要修改SSH 连接默认的22端口到一个更大编号的端口，譬如在我们的例子中是55441
（但不要使用55441，这是我举个列子，可以找另一个四位或者五位数字）。因此，取消注释并编辑"#Port 22"如下（译注：你可以选择任何一个大于1024并小于65535的端口，只要他没有被别的程序占用，为什么不试试你的幸运数字呢？）：
	
       Port 55441

### 开启SSH服务器###

在Ubuntu上，SSH服务通过下面的命令启动：

	sudo /etc/init.d/ssh start

当你每次修改上述配置文件时，都需要通过下面的命令重启：

	sudo /etc/init.d/ssh restart

在Arch Linux上，你可以使用下面的命令启动SSH服务：

	sudo systemctl start sshd

### 配置安卓设备上的SSH客户端###

JuiceSSH似乎是安卓上最好的SSH客户端之一，而且是免费的。同时，如果你认为它的功能比较简单，可以花费少量的钱来得到更多高级的特性，譬如亚马逊 AWS/EC2 集成，团队协作，以及更多其它的特性。

一旦软件安装完毕，开启它，然后你会要求输入一个加密的密码以保证连接的安全。这个密码由AES-256进行加密，因此除非你的设备被偷，否则没有人能够获取它们。

![](http://i1-news.softpedia-static.com/images/extra/LINUX/large/sshlinuxandroid-large_001.jpg)

现在，添加一个新连接，为你的电脑选择名称、IP地址，上面设定的端口号以及一个需要被创建的身份。

![](http://i1-news.softpedia-static.com/images/extra/LINUX/large/sshlinuxandroid-large_002.jpg)

![](http://i1-news.softpedia-static.com/images/extra/LINUX/large/sshlinuxandroid-large_003.jpg)

这就是我的Arch Linux机器，这是通过我的安卓平板上的JuiceSSH客户端访问到的界面。如果在这个教程中你遇到问题，请在下面进行评论。

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/How-to-Control-Your-Linux-PC-with-an-Android-Device-396004.shtml
 
译者：[KayGuoWhu](https://github.com/KayGuoWhu) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
