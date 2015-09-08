如何在linux中搭建FTP服务
=====================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/09/Setup-FTP-Server-in-Linux.jpg)

在本教程中，我将会解释如何搭建你自己的FTP服务。但是，首先我们应该来的学习一下FTP是什么。

###FTP是什么？###

[FTP][1] 是文件传输协议（File Transfer Protocol）的缩写。顾名思义，FTP是用于计算机之间通过网络进行文件传输。你可以通过FTP在计算机账户间进行文件传输，也可以在账户和桌面计算机之间传输文件，或者访问在线软件文档。但是，需要注意的是多数的FTP站点的使用率非常高，并且在连接前需要进行多次尝试。

FTP地址和HTTP地址（即网页地址）非常相似，只是FTP地址使用ftp://前缀而不是http://

###FTP服务器是什么？###

通常，拥有FTP地址的计算机是专用于接收FTP连接请求的。一台专用于接收FTP连接请求的计算机即为FTP服务器或者FTP站点。

现在，我们来开始一个特别的冒险，我们将会搭建一个FTP服务用于和家人、朋友进行文件共享。在本教程，我们将以[vsftpd][2]作为ftp服务。

VSFTPD是一个自称为最安全的FTP服务端软件。事实上VSFTPD的前两个字母表示“非常安全的(very secure)”。该软件的构建绕开了FTP协议的漏洞。

尽管如此，你应该知道对于安全的文件管理和传输还有更好的解决方法，如：SFTP(使用[OpenSSH][3])。FTP协议对于共享非敏感数据是非常有用和可靠的。

####在rpm distributions中安装VSFTPD：####

你可以使用如下命令在命令行界面中快捷的安装VSFTPD：

	dnf -y install vsftpd

####在deb distributions中安装VSFTPD：####

你可以使用如下命令在命令行界面中快捷的安装VSFTPD：

	sudo apt-get install vsftpd

####在Arch distribution中安装VSFTPD：####

你可以使用如下命令在命令行界面中快捷的安装VSFTPD：

	sudo apt-get install vsftpd

####配置FTP服务####

多数的VSFTPD配置项都在/etc/vsftpd.conf配置文件中。这个文件本身已经有非常良好的文档说明了，因此，在本节中，我只强调一些你可能进行修改的重要选项。使用man页面查看所有可用的选项和基本的 文档说明：
	
	man vsftpd.conf

根据文件系统层级标准，FTP共享文件默认位于/srv/ftp目录中。

**允许上传：**

为了允许ftp用户可以修改文件系统的内容，如上传文件等，“write_enable”标志必须设置为 YES。

    write_enable=YES

**允许本地用户登陆：**

为了允许文件/etc/passwd中记录的用户可以登陆ftp服务，“local_enable”标记必须设置为YES。

	local_enable=YES

**匿名用户登陆**

下面配置内容控制匿名用户是否允许登陆：

    # Allow anonymous login
	anonymous_enable=YES
	# No password is required for an anonymous login (Optional)
	no_anon_password=YES
	# Maximum transfer rate for an anonymous client in Bytes/second (Optional)
	anon_max_rate=30000
	# Directory to be used for an anonymous login (Optional)
	anon_root=/example/directory/

**根目录限制（Chroot Jail）**

（译者注：chroot jail是类unix系统中的一种安全机制，用于修改进程运行的根目录环境，限制该线程不能感知到其根目录树以外的其他目录结构和文件的存在。详情参看[chroot jail][4]）

有时我们需要设置根目录（chroot）环境来禁止用户离开他们的家（home）目录。在配置文件中增加/修改下面配置开启根目录限制（Chroot Jail）:

    chroot_list_enable=YES 
    chroot_list_file=/etc/vsftpd.chroot_list

“chroot_list_file”变量指定根目录监狱所包含的文件/目录（译者注：即用户只能访问这些文件/目录）

最后你必须重启ftp服务，在命令行中输入以下命令：

    sudo systemctl restart vsftpd

到此为止，你的ftp服务已经搭建完成并且启动了

--------------------------------------------------------------------------------

via: http://itsfoss.com/set-ftp-server-linux/

作者：[alimiracle][a]
译者：[cvsher](https://github.com/cvsher)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/ali/
[1]:https://en.wikipedia.org/wiki/File_Transfer_Protocol
[2]:https://security.appspot.com/vsftpd.html
[3]:http://www.openssh.com/
[4]:https://zh.wikipedia.org/wiki/Chroot
