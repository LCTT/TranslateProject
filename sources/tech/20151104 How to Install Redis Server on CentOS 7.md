translating by ezio


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

In many cases, the client application resides on the same machine as the server, so there is no need to listen do network sockets. If this is the case you may want to use unix sockets instead, for this you need to set the **port** option to 0, and then enable unix sockets with the following options.

Set the path to the socket file

     unixsocket /tmp/redis.sock

Set restricted permission to the socket file

    unixsocketperm 700

Now, to have access with redis-cli you should use the -s flag pointing to the socket file

    redis-cli -s /tmp/redis.sock

#### requirepass ####

You may need remote access, if so,  you should use a password, that will be required before any operation.

    requirepass "bTFBx1NYYWRMTUEyNHhsCg"

#### rename-command ####

Imagine the output of the next command. Yes, it will dump the configuration of  the server, so you should deny access to this kind information whenever is possible.

    CONFIG GET *

To restrict, or even disable this and other commands by using the **rename-command**. You must provide a command name and a replacement. To disable, set the replacement string to "" (blank), this is more secure as it will prevent someone from guessing the command name.

    rename-command FLUSHDB "FLUSHDB_MY_SALT_G0ES_HERE09u09u"
    rename-command FLUSHALL ""
    rename-command CONFIG "CONFIG_MY_S4LT_GO3S_HERE09u09u"

![Access Redis through unix with password and command changes](http://blog.linoxide.com/wp-content/uploads/2015/10/redis-security-test.jpg)

Access through unix sockets with password and command changes

#### Snapshots ####

By default Redis will periodically dump its datasets to **dump.rdb** on the data directory we set. You can configure how often the rdb file will be updated  by the save command, the first parameter is a timeframe in seconds and the second is a number of changes performed on the data file.

Every 15 hours if there was at least 1 key change

    save 900 1

Every 5 hours if there was at least 10 key changes

    save 300 10

Every minute if there was at least 10000 key changes

    save 60 10000

The **/var/lib/redis/6379/dump.rdb** file contains a dump of the dataset on memory since last save. Since it creates a temporary file and then replace the original file, there is no problem of corruption and you can always copy it directly without fear.

### Starting at boot ###

You may use systemd to add Redis to the system startup

Copy sample init_script to /etc/init.d, note also the number of the port on the script name

    cp utils/redis_init_script /etc/init.d/redis_6379

We are going to use systemd, so create a unit file named redis_6379.service under **/etc/systems/system**

    vi /etc/systemd/system/redis_6379.service

Put this content, try man systemd.service for details

    [Unit]
    Description=Redis on port 6379

    [Service]
    Type=forking
    ExecStart=/etc/init.d/redis_6379 start
    ExecStop=/etc/init.d/redis_6379 stop

    [Install]
    WantedBy=multi-user.target

Now add the memory overcommit and maximum backlog options we have set before to the **/etc/sysctl.conf** file.

    vm.overcommit_memory = 1

    net.core.somaxconn=512

For the transparent huge pages support there is no sysctl directive, so you can put the command at the end of /etc/rc.local

    echo never > /sys/kernel/mm/transparent_hugepage/enabled

### Conclusion ###

That's enough to start, with these settings you will be able to deploy Redis server for many simpler scenarios, however there is many options on redis.conf for more complex environments. On some cases, you may use [replication][4] and [Sentinel][5] to provide high availability, [split the data][6] across servers, create a cluster of servers. Thanks for reading!

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
