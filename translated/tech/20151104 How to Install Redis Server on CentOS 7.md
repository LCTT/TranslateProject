How to Install Redis Server on CentOS 7.md

如何在CentOS 7上安装Redis 服务
================================================================================

大家好， 本文的主题是Redis，我们将要在CentOS 7 上安装它。编译源代码，安装二进制文件，创建、安装文件。然后安装组建，我们还会配置redis ，就像配置操作系统参数一样，目标就是让redis 运行的更加可靠和快速。

![Runnins Redis](http://blog.linoxide.com/wp-content/uploads/2015/10/run-redis-standalone.jpg)

Redis 服务器

Redis 是一个开源的多平台数据存储软件，使用ANSI C 编写，直接在内存使用数据集，这使得它得以实现非常高的效率。Redis 支持多种编程语言，包括Lua, C, Java, Python, Perl, PHP 和其他很多语言。redis 的代码量很小，只有约3万行，它只做很少的事，但是做的很好。尽管你在内存里工作，但是对数据持久化的需求还是存在的，而redis 的可靠性就很高，同时也支持集群，这儿些可以很好的保证你的数据安全。

### 构建 Redis ###

redis 目前没有官方RPM 安装包，我们需要从牙UN代码编译，而为了要编译就需要安装Make 和GCC。

如果没有安装过GCC 和Make，那么就使用yum 安装。

    yum install gcc make

从[官网][1]下载tar 压缩包。

    curl http://download.redis.io/releases/redis-3.0.4.tar.gz -o redis-3.0.4.tar.gz

解压缩。

    tar zxvf redis-3.0.4.tar.gz

进入解压后的目录。

    cd redis-3.0.4

使用Make 编译源文件。

    make

### 安装 ###

进入源文件的目录。

    cd src

复制 Redis server 和 client 到 /usr/local/bin

    cp redis-server redis-cli /usr/local/bin

最好也把sentinel，benchmark 和check 复制过去。

    cp redis-sentinel redis-benchmark redis-check-aof redis-check-dump /usr/local/bin

创建redis 配置文件夹。

    mkdir /etc/redis

在`/var/lib/redis` 下创建有效的保存数据的目录

    mkdir -p /var/lib/redis/6379

#### 系统参数 ####

为了让redis 正常工作需要配置一些内核参数。

配置vm.overcommit_memory 为1，它的意思是一直避免数据被截断，详情[见此][2].

    sysctl -w vm.overcommit_memory=1

修改backlog 连接数的最大值超过redis.conf 中的tcp-backlog 值，即默认值511。你可以在[kernel.org][3] 找到更多有关基于sysctl 的ip 网络隧道的信息。

    sysctl -w net.core.somaxconn=512.

禁止支持透明大页，，因为这会造成redis 使用过程产生延时和内存访问问题。

    echo never > /sys/kernel/mm/transparent_hugepage/enabled

### redis.conf ###
Redis.conf 是redis 的配置文件，然而你会看到这个文件的名字是6379.conf ，而这个数字就是redis 监听的网络端口。这个名字是告诉你可以运行超过一个redis 实例。

复制redis.conf 的示例到 **/etc/redis/6379.conf**.

    cp redis.conf /etc/redis/6379.conf

现在编辑这个文件并且配置参数。

    vi /etc/redis/6379.conf

#### 守护程序 ####

设置daemonize 为no，systemd 需要它运行在前台，否则redis 会突然挂掉。

    daemonize no

#### pidfile ####

设置pidfile 为/var/run/redis_6379.pid。

    pidfile /var/run/redis_6379.pid

#### port ####

如果不准备用默认端口，可以修改。

    port 6379

#### loglevel ####

设置日志级别。

    loglevel notice

#### logfile ####

修改日志文件路径。

    logfile /var/log/redis_6379.log

#### dir ####

设置目录为 /var/lib/redis/6379

    dir /var/lib/redis/6379

### 安全 ###

下面有几个操作可以提高安全性。

#### Unix sockets ####

在很多情况下，客户端程序和服务器端程序运行在同一个机器上，所以不需要监听网络上的socket。如果这和你的使用情况类似，你就可以使用unix socket 替代网络socket ，为此你需要配置**port** 为0，然后配置下面的选项来使能unix socket。

设置unix socket 的套接字文件。

     unixsocket /tmp/redis.sock

限制socket 文件的权限。

    unixsocketperm 700

现在为了获取redis-cli 的访问权限，应该使用-s 参数指向socket 文件。

    redis-cli -s /tmp/redis.sock

#### 密码 ####

你可能需要远程访问，如果是，那么你应该设置密码，这样子每次操作之前要求输入密码。

    requirepass "bTFBx1NYYWRMTUEyNHhsCg"

#### 重命名命令 ####

想象一下下面一条条指令的输出。使得，这回输出服务器的配置，所以你应该在任何可能的情况下拒绝这种信息。

    CONFIG GET *

为了限制甚至禁止这条或者其他指令可以使用**rename-command** 命令。你必须提供一个命令名和替代的名字。要禁止的话需要设置replacement 为空字符串，这样子禁止任何人猜测命令的名字会比较安全。

    rename-command FLUSHDB "FLUSHDB_MY_SALT_G0ES_HERE09u09u"
    rename-command FLUSHALL ""
    rename-command CONFIG "CONFIG_MY_S4LT_GO3S_HERE09u09u"

![Access Redis through unix with password and command changes](http://blog.linoxide.com/wp-content/uploads/2015/10/redis-security-test.jpg)

通过密码和修改命令来访问unix socket。

#### 快照 ####

默认情况下，redis 会周期性的将数据集转储到我们设置的目录下的文件**dump.rdb**。你可以使用save 命令配置转储的频率，他的第一个参数是以秒为单位的时间帧（译注：按照下文的意思单位应该是分钟），第二个参数是在数据文件上进行修改的数量。

每隔15小时并且最少修改过一次键。
    save 900 1

每隔5小时并且最少修改过10次键。

    save 300 10

每隔1小时并且最少修改过10000次键。

    save 60 10000

文件**/var/lib/redis/6379/dump.rdb** 包含了内存里经过上次保存命令的转储数据。因为他创建了临时文件并且替换了源文件，这里没有被破坏的问题，而且你不用担心直接复制这个文件。

### 开机时启动 ###

You may use systemd to add Redis to the system startup
你可以使用systemd 将redis 添加到系统开机启动列表。

复制init_script 示例文件到/etc/init.d，注意脚本名所代表的端口号。

    cp utils/redis_init_script /etc/init.d/redis_6379

现在我们来使用systemd，所以在**/etc/systems/system** 下创建一个单位文件名字为redis_6379.service。

    vi /etc/systemd/system/redis_6379.service

填写下面的内容，详情可见systemd.service。

    [Unit]
    Description=Redis on port 6379

    [Service]
    Type=forking
    ExecStart=/etc/init.d/redis_6379 start
    ExecStop=/etc/init.d/redis_6379 stop

    [Install]
    WantedBy=multi-user.target

现在添加我之前在**/etc/sysctl.conf** 里面修改多的内存过分提交和backlog 最大值的选项。

    vm.overcommit_memory = 1

    net.core.somaxconn=512

对于透明大页支持，并没有直接sysctl 命令可以控制，所以需要将下面的命令放到/etc/rc.local 的结尾。
    echo never > /sys/kernel/mm/transparent_hugepage/enabled

### 总结 ###

这些足够启动了，通过设置这些选项你将足够部署redis 服务到很多简单的场景，然而在redis.conf 还有很多为复杂环境准备的redis 的选项。在一些情况下，你可以使用[replication][4] 和 [Sentinel][5]  来提高可用性，或者[将数据分散][6]在多个服务器上，创建服务器集群 。谢谢阅读。
--------------------------------------------------------------------------------

via: http://linoxide.com/storage/install-redis-server-centos-7/

作者：[Carlos Alberto][a]
译者：[ezio](https://github.com/oska874)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/carlosal/
[1]:http://redis.io/download
[2]:https://www.kernel.org/doc/Documentation/vm/overcommit-accounting
[3]:https://www.kernel.org/doc/Documentation/networking/ip-sysctl.txt
[4]:http://redis.io/topics/replication
[5]:http://redis.io/topics/sentinel
[6]:http://redis.io/topics/partitioning
