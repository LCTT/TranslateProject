translating by ezio

How to Install Redis Server on CentOS 7
================================================================================
Hi everyone, today Redis is the subject of our article, we are going to install it  on CentOS 7. Build sources files, install the binaries, create and install files. After installing its components, we will set its configuration as well as some operating system parameters to make it more reliable and faster.

![Runnins Redis](http://blog.linoxide.com/wp-content/uploads/2015/10/run-redis-standalone.jpg)

Redis server

Redis is an open source multi-platform data store written in ANSI C, that uses datasets directly from memory achieving extremely high performance. It supports various programming languages, including Lua, C, Java, Python, Perl, PHP and many others. It is based on simplicity, about 30k lines of code that do "few" things, but do them well. Despite you work on memory, persistence may exist and it has a fairly reasonable support for high availability and clustering, which does good in keeping your data safe.

### Building Redis ###

There is no official RPM package available, we need to build it from sources, in order to do this you will need install Make and GCC.

Install GNU Compiler Collection and Make with yum if it is not already installed

    yum install gcc make

Download the tarball from [redis download page][1].

    curl http://download.redis.io/releases/redis-3.0.4.tar.gz -o redis-3.0.4.tar.gz

Extract the tarball contents

    tar zxvf redis-3.0.4.tar.gz

Enter Redis the directory we have extracted

    cd redis-3.0.4

Use Make to build the source files

    make

### Install ###

Enter on the src directory

    cd src

Copy Redis server and client to /usr/local/bin

    cp redis-server redis-cli /usr/local/bin

Its good also to copy  sentinel, benchmark and check as well.

    cp redis-sentinel redis-benchmark redis-check-aof redis-check-dump /usr/local/bin

Make Redis config directory

    mkdir /etc/redis

Create a working and data directory under /var/lib/redis

    mkdir -p /var/lib/redis/6379

#### System parameters ####

In order to Redis work correctly you need to set some kernel options

Set the vm.overcommit_memory to 1, which means always, this will avoid data to be truncated, take a look [here][2] for more.

    sysctl -w vm.overcommit_memory=1

Change the maximum of backlog connections some value higher than the value on tcp-backlog option of redis.conf, which defaults to 511. You can find more on sysctl  based ip networking "tunning" on [kernel.org][3]  website.

    sysctl -w net.core.somaxconn=512.

Disable transparent huge pages support, that is known to cause latency and memory access issues with Redis.

    echo never > /sys/kernel/mm/transparent_hugepage/enabled

### redis.conf ###

Redis.conf is the Redis configuration file, however you will see the file named as 6379.conf here, where the number is the same as the network port is listening to. This name is recommended if you are going to run more than one Redis instance.

Copy sample redis.conf to **/etc/redis/6379.conf**.

    cp redis.conf /etc/redis/6379.conf

Now edit the file and set at some of its parameters.

    vi /etc/redis/6379.conf

#### daemonize ####

Set daemonize to no, systemd need it to be in foreground, otherwise Redis will suddenly die.

    daemonize no

#### pidfile ####

Set the pidfile to redis_6379.pid under /var/run.

    pidfile /var/run/redis_6379.pid

#### port ####

Change the network port if you are not going to use the default

    port 6379

#### loglevel ####

Set your loglevel.

    loglevel notice

#### logfile ####

Set the logfile to /var/log/redis_6379.log

    logfile /var/log/redis_6379.log

#### dir ####

Set the directory to /var/lib/redis/6379

    dir /var/lib/redis/6379

### Security ###

Here are some actions that you can take to enforce the security.

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
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/carlosal/
[1]:http://redis.io/download
[2]:https://www.kernel.org/doc/Documentation/vm/overcommit-accounting
[3]:https://www.kernel.org/doc/Documentation/networking/ip-sysctl.txt
[4]:http://redis.io/topics/replication
[5]:http://redis.io/topics/sentinel
[6]:http://redis.io/topics/partitioning
