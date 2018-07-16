在Ubuntu下用jailkit建立一个受限Shell
================================================================================

### Jailkit和jailed Shell ###

受限shell（Jailed Shell）是一类被限制的shell，它看起来非常像真实的Shell，但是它不允许查看和修改真实的文件系统的任何部分。Shell内的文件系统不同于底层的文件系统。这种功能是通过chroot和其他多种程序实现的。举例来说，给用户建立一个linux shell去让他“玩玩”，或者在一个限定的环境里运行一些程序的所有功能等等。

在这个教程里我们将会探讨在Ubuntu下用jailkit建立一个受限shell。Jailkit是一个让你快速建立一个受限shell的工具，将受限用户放到里面，并配置那些要在受限制环境里运行的程序。

Jailkit 从这里下载：[http://olivier.sessink.nl/jailkit/][1]


###在Ubuntu/Debian 上安装 jailkit ###

1. 因为jaikit需要在系统上编译，首先，我们需要有用于编译的那些工具。所以，安装如下包：

		$ sudo apt-get install build-essential autoconf automake libtool flex bison debhelper binutils-gold

2. 从下述URL下载Jailkit，或者访问它的网站以下载最新版本的，如果有了更新版本的话。http://olivier.sessink.nl/jailkit/jailkit-2.16.tar.gz

		$ wget http://olivier.sessink.nl/jailkit/jailkit-2.16.tar.gz

3. 解压

		$ tar -vxzf jailkit-2.16.tar.gz

4. 编译并创建deb软件包

	Jailkit已经包含了用于编译成deb软件包的代码和配置，可以直接安装在Debian系的Linux上。运行下列命令来完成它。

		$ cd jailkit-2.16/
		$ sudo ./debian/rules binary

5. 安装deb软件包

	上述命令创建的deb软件包叫做： jailkit_2.16-1_amd64.deb.

		$ cd ..
		$ sudo dpkg -i jailkit_2.16-1_amd64.deb
		
	就是这样，现在Jailkit已经安装完成了。Jailkit有许多命令可以用来设置一个基于chroot的受限环境，如下是这些命令：

		$ jk_
		jk_addjailuser   jk_chrootlaunch  jk_cp            jk_jailuser      jk_lsh           jk_uchroot       
		jk_check         jk_chrootsh      jk_init          jk_list          jk_socketd       jk_update
		
上述命令都有man帮助信息，如果你使用它们时，可以参考。

### 配置Jailed Shell ###

1. 配置受限环境

	我们需要建立一个目录来存放所有受限环境的配置。目录随便放在什么地方，比如我们可以创建个/opt/jail的目录。

    	$ sudo mkdir /opt/jail

	这个目录应为Root所有。用chown改变属主。

    	$ sudo chown root:root /opt/jail

2. 设置在受限环境中可用的程序

	任何程序想要在受限环境中执行则必须用jk_init命令拷贝到目录中。

	例如：

    	$ sudo jk_init -v /jail basicshell 
	    $ sudo jk_init -v /jail editors 
	    $ sudo jk_init -v /jail extendedshell 
	    $ sudo jk_init -v /jail netutils 
	    $ sudo jk_init -v /jail ssh 
	    $ sudo jk_init -v /jail sftp
	    $ sudo jk_init -v /jail jk_lsh

	或一次性解决：

    	$ sudo jk_init -v /opt/jail netutils basicshell jk_lsh openvpn ssh sftp

	像basicshell, editors, netutils是一些组名，其中包含多个程序。复制到jail shell中的每个组都是可执行文件、库文件等的集合。比如**basicshell**就在jail提供有bash, ls, cat, chmod, mkdir, cp, cpio, date, dd, echo, egrep等程序。

	完整的程序列表设置，你可以在/etc/jailkit/jk_init.ini中查看。

	> jk_lsh (Jailkit limited shell) - 这是一个重要的部分，必须添加到受限环境中。

3. 创建将被监禁的用户

	需要将一个用户放入jail里。可以先创建一个

		$ sudo adduser robber
	    Adding user `robber' ...
	    Adding new group `robber' (1005) ...
	    Adding new user `robber' (1006) with group `robber' ...
	    Creating home directory `/home/robber' ...
	    Copying files from `/etc/skel' ...	
	    Enter new UNIX password: 
	    Retype new UNIX password: 
	    passwd: password updated successfully
	    Changing the user information for robber
	    Enter the new value, or press ENTER for the default
            Full Name []: 
            Room Number []: 
            Work Phone []: 
            Home Phone []: 
            Other []: 
    	Is the information correct? [Y/n] y

	注意:目前创建的是一个在实际文件系统中的普通用户，并没有添加到受限环境中。

	在下一步这个用户会被放到受限环境里。

	这时候如果你查看/etc/passwd文件，你会在文件最后看到跟下面差不多的一个条目。

    	robber:x:1006:1005:,,,:/home/robber:/bin/bash

	这是我们新创建的用户，最后部分的/bin/bash指示了这个用户如果登入了那么它可以在系统上正常的Shell访问

4. 限制用户

	现在是时候将用户限制

    	$ sudo jk_jailuser -m -j /opt/jail/ robber

	执行上列命令后，用户robber将会被限制。

	如果你现在再观察/etc/passwd文件，会发现类似下面的最后条目。

    	robber:x:1006:1005:,,,:/opt/jail/./home/robber:/usr/sbin/jk_chrootsh

	注意:最后两部分表明用户主目录和shell类型已经被改变了。现在用户的主目录在/opt/jail(受限环境)中。用户的Shell是一个名叫jk_chrootsh的特殊程序，会提供Jailed Shell。

	jk_chrootsh这是个特殊的shell，每当用户登入系统时，它都会将用户放入受限环境中。

	到目前为止受限配置已经几乎完成了。但是如果你试图用ssh连接，那么注定会失败,像这样：

    	$ ssh robber@localhost
    	robber@localhost's password: 
    	Welcome to Ubuntu 12.04 LTS (GNU/Linux 3.2.0-25-generic x86_64)
     	* Documentation:  https://help.ubuntu.com/
	    13 packages can be updated.
	    0 updates are security updates.
	    *** /dev/sda7 will be checked for errors at next reboot ***
	    *** /dev/sda8 will be checked for errors at next reboot ***
	    Last login: Sat Jun 23 12:45:13 2012 from localhost
	    Connection to localhost closed.
	    $

	连接会立马关闭，这意味着用户已经活动在一个受限制的shell中。

5. 给在jail中的用户Bash Shell

	下个重要的事情是给用户在限制环境中的一个正确的bash shell。

	打开下面的文件

    	/opt/jail/etc/passwd

	这是个jail中的password文件。类似如下

    	root:x:0:0:root:/root:/bin/bash
	    robber:x:1006:1005:,,,:/home/robber:/usr/sbin/jk_lsh

	将/usr/sbin/jk_lsh改为/bin/bash
	
	    root:x:0:0:root:/root:/bin/bash
	    robber:x:1006:1005:,,,:/home/robber:/bin/bash

	保存文件并退出。

6. 登入限制环境

	现在让我们再次登入受限环境

    	$ ssh robber@localhost
	    robber@localhost's password: 
	    Welcome to Ubuntu 12.04 LTS (GNU/Linux 3.2.0-25-generic x86_64)
	     * Documentation:  https://help.ubuntu.com/
	    13 packages can be updated.
	    0 updates are security updates.
	    *** /dev/sda7 will be checked for errors at next reboot ***
	    *** /dev/sda8 will be checked for errors at next reboot ***
	    Last login: Sat Jun 23 12:46:01 2012 from localhost
	    bash: groups: command not found
	    I have no name!@desktop:~$

	受限环境说'I have no name!'，哈哈。现在我们在受限环境中有了个完整功能的bash shell。

	现在看看实际的环境。受限环境中的根目录实际就是真实文件系统中的/opt/jail。但这只有我们自己知道，受限用户并不知情。

    	I have no name!@desktop:~$ cd /
	    I have no name!@desktop:/$ ls
	    bin  dev  etc  home  lib  lib64  run  usr  var
	    I have no name!@desktop:/$

	也只有我们通过jk_cp拷贝到jail中的命令能使用。

	如果登入失败，请检查一下/var/log/auth.log的错误信息。

	现在尝试运行一些网络命令，类似wget的命令。

    	$ wget http://www.google.com/

	如果你获得类似的错误提示：

    	$ wget http://www.google.com/
    	--2012-06-23 12:56:43--  http://www.google.com/
    	Resolving www.google.com (www.google.com)... failed: Name or service not known.
   		wget: unable to resolve host address `www.google.com'

	你可以通过运行下列两条命令来解决这个问题:

    	$ sudo jk_cp -v -j /opt/jail /lib/x86_64-linux-gnu/libnss_files.so.2
	    $ sudo jk_cp -v -j /opt/jail /lib/x86_64-linux-gnu/libnss_dns.so.2

	这样才能正确的定位到libnss_files.so和libnss_dns.so

### 在限制环境中运行程序或服务 ###

现在配置已经完成了。可以在限制/安全的环境里运行程序或服务。要在限制环境中启动一个程序或守护进程可以用**jk_chrootlaunch**命令。

    $ sudo jk_chrootlaunch -j /opt/jail -u robber -x /some/command/in/jail

jk_chrootlaunch工具可以在限制环境中启动一个特殊的进程同时指定用户特权。如果守护进程启动失败，请检查/var/log/syslog/错误信息。

在限制环境中运行程序之前，该程序必须已经用jk_cp命令复制到jail中。

> jk_cp -　将文件包括权限信息和库文件复制到jail的工具　

进一步阅读有关其他jailkit命令信息，可以阅读文档，[http://olivier.sessink.nl/jailkit/][1]

--------------------------------------------------------------------------------
via: http://www.binarytides.com/install-jailkit-ubuntu-debian/

via: http://www.binarytides.com/setup-jailed-shell-jailkit-ubuntu/

译者：[Luoxcat](https://github.com/Luoxcat) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://olivier.sessink.nl/jailkit/

