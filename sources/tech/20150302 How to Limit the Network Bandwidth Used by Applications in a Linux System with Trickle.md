theo-l translating

How to Limit the Network Bandwidth Used by Applications in a Linux System with Trickle
如何在linux上使用Trickle来显示应用程序的网络宽带使用．
================================================================================
Have you ever encountered situations where one application dominated you all network bandwidth? If you have ever been in a situation where one application ate all your traffic, then you will value the role of the trickle bandwidth shaper application. Either you are a system admin or just a Linux user, you need to learn how to control the upload and download speeds for applications to make sure that your network bandwidth is not burned by a single application.
有没有遇到过系统中的某个应用程序独占了你所有的网络宽带的情形？如果你有过这样的遭遇，那么你就会感受到Trickle宽带调整应用角色的价值．不管你是一个系统管理员还是仅仅Linux用户,都需要学习如何控制应用程序的上下行速度，来确保你的网络宽带不会被某个程序
霸占．

![Install Trickle Bandwidth Limit in Linux](http://www.tecmint.com/wp-content/uploads/2013/11/Bandwidth-limit-trickle.png)
Install Trickle Bandwidth Limit in Linux

### What is Trickle? ###
### 什么是　Trickle? ###

Trickle is a network bandwidth shaper tool that allows us to manage the upload and download speeds of applications in order to prevent any single one of them to hog all (or most) of the available bandwidth. In few words, trickle lets you control the network traffic rate on a per-application basis, as opposed to per-user control, which is the classic example of bandwidth shaping in a client-server environment, and is probably the setup we are more familiar with.
Trickle是一个网络宽带调整工具，可以让我们管理应用程序的网络上下行速度，使得可以避免其中的某个应用程序吃掉了全部或大部分可用的宽带．换句话说，Trickle可以让你基于单个应用程序来控制
网络流量速率，而不是仅仅针对与单个用户--在客户端网络环境中经典的宽带调整样例，

### How Trickle Works? ###
### Trickle是如何工作的？###

In addition, trickle can help us to define priorities on a per-application basis, so that when overall limits have been set for the entire system, priority apps will still get more bandwidth automatically. To accomplish this task, trickle sets traffic limits to the way in which data is sent to, and received from, sockets using TCP connections. We must note that, other than the data transfer rates, trickle does not modify in any way the behavior of the process it is shaping at any given moment.
另外，tricle可以帮助我们基于应用来定义优先级，所以当对整个系统进行了全局限制设定，高优先级的应用依然会自动地获取更多的宽带。为了实现这个目标，tricle设置通过TCP连接的套接字对数
据发送、数据接收路径的流量限制。我们必须注意到，除了影响传输速率之外，tricle任何时候都不会以任何方式来改变其处理过程。

### What Can’t Trickle do? ###
### Trickle不能做什么？ ###

The only limitation, so to speak, is that trickle will not work with statically linked applications or binaries with the SUID or SGID bits set since it uses dynamic linking and loading to place itself between the shaped process and its associated network socket. Trickle then acts as a proxy between these two software components.
这么说吧，唯一的限制就是，tricle静态连接的应用或者具有SUID或SGID位设置的二进制--因为他们使用动态链接并且将其自身加载到调整过程以及其关联的网络套接字之间。 Trickle此时会在这两种软件
组件之间扮演代理的角色。

Since trickle does not require superuser privileges in order to run, users can set their own traffic limits. Since this may not be desirable, we will explore how to set overall limits that system users cannot exceed. In other words, users will still be able to manage their traffic rates, but always within the boundaries set by the system administrator.
由于trickle并不会需要超级用户的权限来运行，所以用户可以设置用户独立的流量限制,可能这并不是你想要的,我们会探索如何使用全局设定来限制系统中的所有用户的流量限制。也即是说，此时系统中的每个用户具有管理
各自的流量速率，但是无论如何，都会受到系统管理员给他们设置的边界限制。

In this article we will explain how to limit the network bandwidth used by applications in a Linux server with trickle. To generate the necessary traffic, we will use ncftpput and ncftpget (both tools are available by installing ncftp) on the client (CentOS 7 server – dev1: 192.168.0.17), and vsftpd on the server (Debian Wheezy 7.5 – dev2: 192.168.0.15) for demonstration purposes. The same instructions also works on RedHat, Fedora and Ubuntu based systems.
在这边文章中，我们会描述如何通过trickle在linux平台上管理应用程序使用的网络宽带。为了生成必要流量，在此会在客户端(CentOS 7 server – dev1: 192.168.0.17)上使用 ncftpput 和
 ncftpget, 在服务器(Debian Wheezy 7.5 – dev2: 192.168.0.15)上使用vsftpd 来进行演示。 相同的指令也可以在RedHat，Fedora和Ubuntu等系统使用。

#### Prerequisites ####
#### 前提条件 ####

1. For RHEL/CentOS 7/6, [enable the EPEL repository][1]. Extra Packages for Enterprise Linux (EPEL) is a repository of high-quality free and open-source software maintained by the Fedora project and is 100% compatible with its spinoffs, such as Red Hat Enterprise Linux and CentOS. Both trickle and ncftp are made available from this repository.
1. 对于 RHEL/CentOS 7/6， [开启EPEL仓库][1]。EPEL的Extra Packages是一个
有Fedora项目维护的高质量、开源的软件仓库，而且百分之百与其衍生产品相兼容，如
企业版本Linux和CentOS. 在这个仓库中trickle和ncftp两者都是可用的。

2. Install ncftp as follows:
2. 按照如下方式安装ncftp:

    # yum update && sudo yum install ncftp		[On RedHat based systems]
    # aptitude update && aptitude install ncftp	[On Debian based systems]

3. Set up a FTP server in a separate server. Please note that although FTP is inherently insecure, it is still widely used in cases when security in uploading or downloading files is not needed. We are using it in this article to illustrate the bounties of trickle and because it shows the transfer rates in stdout on the client, and we will leave the discussion of whether it should or should not be used for another date and time :).
3. 在单独的服务器上设置一个FTP服务器。需要注意的是，尽管FTP天生就不安全，但是
仍然被广泛应用在安全性无关紧要的文件上传下载中。 在这篇文章中我们使用它来演示
trickle的优点，同时它也会在客户端的标准输出流中显示传输速率，我们将是否在另外
的日期时间中使用放在一边讨论。

    # yum update && yum install vsftpd 		[On RedHat based systems]
    # aptitude update && aptitude install vsftpd 	[On Debian based systems]

Now, edit the /etc/vsftpd/vsftpd.conf file on the FTP server as follows:
现在，在FTP服务器上按照以下方式编辑 /etc/vsftpd/vsftpd.conf 文件。

    anonymous_enable=NO
    local_enable=YES
    chroot_local_user=YES
    allow_writeable_chroot=YES

After that, make sure to start vsftpd for your current session and to enable it for automatic start on future boots:
在此之后，确保在你的当前会话中开启了vsftpd，并在之后的启动中让其自动启动。

    # systemctl start vsftpd 		[For systemd-based systems]
    # systemctl enable vsftpd
    # service vsftpd start 			[For init-based systems]
    # chkconfig vsftpd on

4. If you chose to set up the FTP server in a CentOS/RHEL 7 droplet with SSH keys for remote access, you will need a password-protected user account with the appropriate directory and file permissions for uploading and downloading the desired content OUTSIDE root’s home directory.
4. 如果你选在在一个CentOS/RHEL 7中为FTP服务器的远程访问配备SSH秘钥，你需要
一个具有适合访问root目录之外的目录和文件内容上传下载权限并密码受保护的用户账户。

You can then browse to your home directory by entering the following URL in your browser. A login window will pop up prompting you for a valid user account and password on the FTP server.
你可以通过在你的浏览器中输入以下的URL来浏览你的Home目录。一个登陆窗口会弹出来
提示你输入FTP服务器中的有效的用户名和密码。

    ftp://192.168.0.15

If the authentication succeeds, you will see the contents of your home directory. Later in this tutorial you will be able to refresh that page to display the files that have been uploaded during previous steps.
如果验证成功，你就会看到你的home目录中的内容。该教程的稍后部分中，你将可以刷新
页面来显示在你之前上传过的文件。

![FTP Directory Tree](http://www.tecmint.com/wp-content/uploads/2013/11/FTP-Directory-Tree.png)
FTP Directory Tree

### How to Install Trickle in Linux ###
### 如何在Linux中安装 Tricle ###

1. Install trickle via yum or aptitude.
1. 通过yum或aptitude来安装tricle.

To ensure a successful installation, it is considered good practice to make sure the currently installed packages are up-to-date (using yum update) before installing the tool itself.


    # yum -y update && yum install trickle 		        [On RedHat based systems]
    # aptitude -y update && aptitude install trickle 	[On Debian based systems]

2. Verify whether trickle will work with the desired binary.

As we explained earlier, trickle will only work with binaries using dynamic, or shared, libraries. To verify whether we can use this tool with a certain application, we can use the well-known ldd utility, where ldd stands for list dynamic dependencies. Specifically, we will look for the presence of glibc (the GNU C library) in the list of dynamic dependencies of any given program because it is precisely that library which defines the system calls involved in communication through sockets.

Run the following command against a given binary to see if trickle can be used to shape its bandwidth:

    # ldd $(which [binary]) | grep libc.so

For example,

    # ldd $(which ncftp) | grep libc.so

whose output is:

    # libc.so.6 => /lib64/libc.so.6 (0x00007efff2e6c000)

The string between brackets in the output may change from system to system and even between subsequent runs of the same command, since it represents the load address of the library in physical memory.

If the above command does not return any results, it means that the binary it was run against does not use libc and thus trickle cannot be used as bandwidth shaper in that case.

### Learn How to Use Trickle ###

The most basic usage of trickle is in standalone mode. Using this approach, trickle is used to explicitly define the download and upload speeds of a given application. As we explained earlier, for the sake of brevity, we will use the same application for download and upload tests.

#### Running Trickle in Standalone Mode ####

We will compare the download and upload speeds with and without using trickle. The -d option indicates the download speed in KB/s, while the -u flag tells trickle to limit the upload speed by the same unit. In addition, we will use the -s flag, which specifies that trickle should run in standalone mode.

The basic syntax to run trickle in standalone mode is as follows:

    # trickle -s -d [download rate in KB/s] -u [upload rate in KB/s]

In order to perform the following examples on your own, make sure to have trickle and ncftp installed on the client machine (192.168.0.17 in my case).

**Example 1: Uploading a 2.8 MB PDF file with and without trickle.**

We are using the freely-distributable Linux Fundamentals PDF file (available from [here][2]) for the following tests.

You can initially download this file to your current working directory with the following command:

    # wget http://linux-training.be/files/books/LinuxFun.pdf

The syntax to upload a file to our FTP server without trickle is as follows:

    # ncftpput -u username -p password 192.168.0.15  /remote_directory local-filename

Where /remote_directory is the path of the upload directory relative to username’s home, and local-filename is a file in your current working directory.

Specifically, without trickle we get a peak upload speed of 52.02 MB/s (please note that this is not the real average upload speed, but an instant starting peak), and the file gets uploaded almost instantly:

    # ncftpput -u username -p password 192.168.0.15  /testdir LinuxFun.pdf

Output:

    LinuxFun.pdf:                                        	2.79 MB   52.02 MB/s

With trickle, we will limit the upload transfer rate at 5 KB/s. Before uploading the file for the second time, we need to delete it from the destination directory; otherwise, ncftp will inform us that the file at the destination directory is the same that we are trying to upload, and will not perform the transfer:

    # rm /absolute/path/to/destination/directory/LinuxFun.pdf

Then:

    # trickle -s -u 5 ncftpput -u username -p password 111.111.111.111 /testdir LinuxFun.pdf

Output:

    LinuxFun.pdf:                                        	2.79 MB	4.94 kB/s

In the example above, we can see that the average upload speed dropped to ~5 KB/s.

**Example 2: Downloading the same 2.8 MB PDF file with and without trickle**

First, remember to delete the PDF from the original source directory:

    # rm /absolute/path/to/source/directory/LinuxFun.pdf

Please note that the following cases will download the remote file to the current directory in the client machine. This fact is indicated by the period (‘.‘) that appears after the IP address of the FTP server.

Without trickle:

    # ncftpget -u username -p  password 111.111.111.111 . /testdir/LinuxFun.pdf

Output:

    LinuxFun.pdf:                                        	2.79 MB  260.53 MB/s

With trickle, limiting the download speed at 20 KB/s:

    # trickle -s -d 30 ncftpget -u username -p password 111.111.111.111 . /testdir/LinuxFun.pdf

Output:

    LinuxFun.pdf:                                        	2.79 MB   17.76 kB/s

### Running Trickle in Supervised [unmanaged] Mode ###

Trickle can also run in unmanaged mode, following a series of parameters defined in /etc/trickled.conf. This file defines how trickled (the daemon) behaves and manages trickle.

In addition, if we want to set global settings to be used, overall, by all applications, we will need to use the trickled command. This command runs the daemon and allows us to define download and upload limits that will be shared by all the applications run through trickle without us needing to specify limits each time.

For example, running:

    # trickled -d 50 -u 10

Will cause that the download and upload speeds of any application run through trickle be limited to 30 KB/s and 10 KB/s, respectively.

Please note that you can check at any time whether trickled is running and with what arguments:

    # ps -ef | grep trickled | grep -v grep

Output:

    root 	16475 	1  0 Dec24 ?    	00:00:04 trickled -d 50 -u 10

**Example 3: Uploading a 19 MB mp4 file to our FTP server using with and without trickle.**

In this example we will use the freely-distributable “He is the gift” video, available for download from [this link][3].

We will initially download this file to your current working directory with the following command:

    # wget http://media2.ldscdn.org/assets/missionary/our-people-2014/2014-00-1460-he-is-the-gift-360p-eng.mp4

First off, we will start the trickled daemon with the command listed above:

    # trickled -d 30 -u 10

Without trickle:

    # ncftpput -u username -p password 192.168.0.15 /testdir 2014-00-1460-he-is-the-gift-360p-eng.mp4

Output:

    2014-00-1460-he-is-the-gift-360p-eng.mp4:           	18.53 MB   36.31 MB/s

With trickle:

    # trickle ncftpput -u username -p password 192.168.0.15 /testdir 2014-00-1460-he-is-the-gift-360p-eng.mp4

Output:

    2014-00-1460-he-is-the-gift-360p-eng.mp4:           	18.53 MB	9.51 kB/s

As we can see in the output above, the upload transfer rate dropped to ~10 KB/s.

**Example 4: Downloading the same video with and without trickle**

As in Example 2, we will be downloading the file to the current working directory.

Without trickle:

    # ncftpget -u username -p password 192.168.0.15 . /testdir/2014-00-1460-he-is-the-gift-360p-eng.mp4

Output:

    2014-00-1460-he-is-the-gift-360p-eng.mp4:           	18.53 MB  108.34 MB/s

With trickle:

    # trickle ncftpget -u username -p password 111.111.111.111 . /testdir/2014-00-1460-he-is-the-gift-360p-eng.mp4

Output:

    2014-00-1460-he-is-the-gift-360p-eng.mp4:           	18.53 MB   29.28 kB/s

Which is in accordance with the download limit set earlier (30 KB/s).

**Note:** That once the daemon has been started, there is no need to set individual limits for each application that uses trickle.

As we mentioned earlier, one can further customize trickle’s bandwidth shaping through trickled.conf. A typical section in this file consists of the following:

    [service]
    Priority = <value>
    Time-Smoothing = <value>
    Length-Smoothing = <value>

Where,

- [service] indicates the name of the application whose bandwidth usage we intend to shape.
- Priority allows us to specify a service to have a higher priority relative to another, thus not allowing a single application to hog all the bandwidth which the daemon is managing. The lower the number, the more bandwidth that is assigned to [service].
- Time-Smoothing [in seconds]: defines with what time intervals trickled will try to let the application transfer and / or receive data. Smaller values (something between the range of 0.1 – 1s) are ideal for interactive applications and will result in a more continuous (smooth) session while slightly larger values (1 – 10 s) are better for applications that need bulk transfer. If no value is specified, the default (5 s) is used.
- Length-Smoothing [in KB]: the idea is the same as in Time-Smoothing, but based on the length of an I/O operation. If no value is specified, the default (10 KB) is used.

Changing the smoothing values will translate into the application specified by [service] using transfer rates within an interval instead of a fixed value. Unfortunately, there is no formula to calculate the lower and upper limits of this interval as it mainly depends of each specific case scenario.

The following is a trickled.conf sample file in the CentOS 7 client (192.168.0.17):

    [ssh]
    Priority = 1
    Time-Smoothing = 0.1
    Length-Smoothing = 2

    [ftp]
    Priority = 2
    Time-Smoothing = 1
    Length-Smoothing = 3

Using this setup, trickled will prioritize SSH connections over FTP transfers. Note that an interactive process, such as SSH, uses smaller time-smoothing values, whereas a service that performs bulk data transfers (FTP) uses a greater value. The smoothing values are responsible for the download and upload speeds in our previous example not matching the exact value specified by the trickled daemon but moving in an interval close to it.

### Conclusion ###

In this article we have explored how to limit the bandwidth used by applications using trickle on Fedora-based distributions and Debian / derivatives. Other possible use cases include, but are not limited to:

- Limiting the download speed via a system utility such as [wget][4], or a torrent client, for example.
- Limiting the speed at which your system can be updated via `[yum][5]` (or `[aptitude][6]`, if you’re in a Debian-based system), the package management system.
- If your server happens to be behind a proxy or firewall (or is the proxy or firewall itself), you can use trickle to set limits on both the download and upload, or communication speed with the clients or the outside.

Questions and comments are most welcome. Feel free to use the form below to send them our way.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/manage-and-limit-downloadupload-bandwidth-with-trickle-in-linux/

作者：[Gabriel Cánepa][a]
译者：[theo-l](https://github.com/theo-l)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:http://www.tecmint.com/how-to-enable-epel-repository-for-rhel-centos-6-5/
[2]:http://linux-training.be/files/books/LinuxFun.pdf
[3]:http://media2.ldscdn.org/assets/missionary/our-people-2014/2014-00-1460-he-is-the-gift-360p-eng.mp4
[4]:http://www.tecmint.com/10-wget-command-examples-in-linux/
[5]:http://www.tecmint.com/20-linux-yum-yellowdog-updater-modified-commands-for-package-mangement/
[6]:http://www.tecmint.com/dpkg-command-examples/
