如何在 CentOS 7 上安装 Redis 服务器
================================================================================

大家好，本文的主题是 Redis，我们将要在 CentOS 7 上安装它。编译源代码，安装二进制文件，创建、安装文件。在安装了它的组件之后，我们还会配置 redis ，就像配置操作系统参数一样，目标就是让 redis 运行的更加可靠和快速。

![Runnins Redis](http://blog.linoxide.com/wp-content/uploads/2015/10/run-redis-standalone.jpg)

*Redis 服务器*

Redis 是一个开源的多平台数据存储软件，使用 ANSI C 编写，直接在内存使用数据集，这使得它得以实现非常高的效率。Redis 支持多种编程语言，包括 Lua, C, Java, Python, Perl, PHP 和其他很多语言。redis 的代码量很小，只有约3万行，它只做“很少”的事，但是做的很好。尽管是在内存里工作，但是数据持久化的保存还是有的，而redis 的可靠性就很高，同时也支持集群，这些可以很好的保证你的数据安全。

### 构建 Redis ###

redis 目前没有官方 RPM 安装包，我们需要从源代码编译，而为了要编译就需要安装 Make 和 GCC。

如果没有安装过 GCC 和 Make，那么就使用 yum 安装。

    yum install gcc make

从[官网][1]下载 tar 压缩包。

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

复制 Redis 的服务器和客户端到 /usr/local/bin。

    cp redis-server redis-cli /usr/local/bin

最好也把 sentinel，benchmark 和 check 复制过去。

    cp redis-sentinel redis-benchmark redis-check-aof redis-check-dump /usr/local/bin

创建redis 配置文件夹。

    mkdir /etc/redis

在`/var/lib/redis` 下创建有效的保存数据的目录

    mkdir -p /var/lib/redis/6379

#### 系统参数 ####

为了让 redis 正常工作需要配置一些内核参数。

配置 `vm.overcommit_memory` 为1，这可以避免数据被截断，详情[见此][2]。

    sysctl -w vm.overcommit_memory=1

修改 backlog 连接数的最大值超过 redis.conf 中的 `tcp-backlog` 值，即默认值511。你可以在[kernel.org][3] 找到更多有关基于 sysctl 的 ip 网络隧道的信息。

    sysctl -w net.core.somaxconn=512

取消对透明巨页内存（transparent huge pages）的支持，因为这会造成 redis 使用过程产生延时和内存访问问题。

    echo never > /sys/kernel/mm/transparent_hugepage/enabled

### redis.conf ###

redis.conf 是 redis 的配置文件，然而你会看到这个文件的名字是 6379.conf ，而这个数字就是 redis 监听的网络端口。如果你想要运行超过一个的 redis 实例，推荐用这样的名字。

复制示例的 redis.conf 到 **/etc/redis/6379.conf**。

    cp redis.conf /etc/redis/6379.conf

现在编辑这个文件并且配置参数。

    vi /etc/redis/6379.conf

#### daemonize ####

设置 `daemonize` 为 no，systemd 需要它运行在前台，否则 redis 会突然挂掉。

    daemonize no

#### pidfile ####

设置 `pidfile` 为 /var/run/redis_6379.pid。

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

下面有几个可以提高安全性的操作。

#### Unix sockets ####

在很多情况下，客户端程序和服务器端程序运行在同一个机器上，所以不需要监听网络上的 socket。如果这和你的使用情况类似，你就可以使用 unix socket 替代网络 socket，为此你需要配置 `port` 为0，然后配置下面的选项来启用 unix socket。

设置 unix socket 的套接字文件。

     unixsocket /tmp/redis.sock

限制 socket 文件的权限。

    unixsocketperm 700

现在为了让 redis-cli 可以访问，应该使用 -s 参数指向该 socket 文件。

    redis-cli -s /tmp/redis.sock

#### requirepass ####

你可能需要远程访问，如果是，那么你应该设置密码，这样子每次操作之前要求输入密码。

    requirepass "bTFBx1NYYWRMTUEyNHhsCg"

#### rename-command ####

想象一下如下指令的输出。是的，这会输出服务器的配置，所以你应该在任何可能的情况下拒绝这种访问。

    CONFIG GET *

为了限制甚至禁止这条或者其他指令可以使用 `rename-command` 命令。你必须提供一个命令名和替代的名字。要禁止的话需要设置替代的名字为空字符串，这样禁止任何人猜测命令的名字会比较安全。

    rename-command FLUSHDB "FLUSHDB_MY_SALT_G0ES_HERE09u09u"
    rename-command FLUSHALL ""
    rename-command CONFIG "CONFIG_MY_S4LT_GO3S_HERE09u09u"

![Access Redis through unix with password and command changes](http://blog.linoxide.com/wp-content/uploads/2015/10/redis-security-test.jpg)

*使用密码通过 unix socket  访问，和修改命令*

#### 快照 ####

默认情况下，redis 会周期性的将数据集转储到我们设置的目录下的 **dump.rdb** 文件。你可以使用 `save` 命令配置转储的频率，它的第一个参数是以秒为单位的时间帧，第二个参数是在数据文件上进行修改的数量。

每隔15分钟并且最少修改过一次键。

    save 900 1

每隔5分钟并且最少修改过10次键。

    save 300 10

每隔1分钟并且最少修改过10000次键。

    save 60 10000

文件 `/var/lib/redis/6379/dump.rdb` 包含了从上次保存以来内存里数据集的转储数据。因为它先创建临时文件然后替换之前的转储文件，这里不存在数据破坏的问题，你不用担心，可以直接复制这个文件。

### 开机时启动 ###

你可以使用 systemd 将 redis 添加到系统开机启动列表。

复制示例的 init_script 文件到 `/etc/init.d`，注意脚本名所代表的端口号。

    cp utils/redis_init_script /etc/init.d/redis_6379

现在我们要使用 systemd，所以在 `/etc/systems/system` 下创建一个单位文件名字为 `redis_6379.service`。

    vi /etc/systemd/system/redis_6379.service

填写下面的内容，详情可见 systemd.service。

    [Unit]
    Description=Redis on port 6379

    [Service]
    Type=forking
    ExecStart=/etc/init.d/redis_6379 start
    ExecStop=/etc/init.d/redis_6379 stop

    [Install]
    WantedBy=multi-user.target

现在添加我之前在 `/etc/sysctl.conf` 里面修改过的内存过量使用和 backlog 最大值的选项。

    vm.overcommit_memory = 1

    net.core.somaxconn=512

对于透明巨页内存支持，并没有直接 sysctl 命令可以控制，所以需要将下面的命令放到 `/etc/rc.local` 的结尾。

    echo never > /sys/kernel/mm/transparent_hugepage/enabled

### 总结 ###

这样就可以启动了，通过设置这些选项你就可以部署 redis 服务到很多简单的场景，然而在 redis.conf 还有很多为复杂环境准备的 redis 选项。在一些情况下，你可以使用 [replication][4] 和 [Sentinel][5]  来提高可用性，或者[将数据分散][6]在多个服务器上，创建服务器集群。

谢谢阅读。

--------------------------------------------------------------------------------

via: http://linoxide.com/storage/install-redis-server-centos-7/

作者：[Carlos Alberto][a]
译者：[ezio](https://github.com/oska874)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/carlosal/
[1]:http://redis.io/download
[2]:https://www.kernel.org/doc/Documentation/vm/overcommit-accounting
[3]:https://www.kernel.org/doc/Documentation/networking/ip-sysctl.txt
[4]:http://redis.io/topics/replication
[5]:http://redis.io/topics/sentinel
[6]:http://redis.io/topics/partitioning
