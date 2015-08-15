Linux日志管理
================================================================================
管理日志的一个关键典型做法是集中或整合你的日志到一个地方，特别是如果你有许多服务器或多层级架构。我们将告诉你为什么这是一个好主意然后给出如何更容易的做这件事的一些小技巧。

### 集中管理日志的好处 ###

如果你有很多服务器，查看单独的一个日志文件可能会很麻烦。现代的网站和服务经常包括许多服务器层级，分布式的负载均衡器，还有更多。这将花费很长时间去获取正确的日志，甚至花更长时间在登录服务器的相关问题上。没什么比发现你找的信息没有被捕获更沮丧的了，或者本能保留答案时正好在重启后丢失了日志文件。

集中你的日志使他们查找更快速，可以帮助你更快速的解决产品问题。你不用猜测那个服务器存在问题，因为所有的日志在同一个地方。此外，你可以使用更强大的工具去分析他们，包括日志管理解决方案。一些解决方案能[转换纯文本日志][1]为一些字段，更容易查找和分析。

集中你的日志也可以是他们更易于管理：

- 他们更安全，当他们备份归档一个单独区域时意外或者有意的丢失。如果你的服务器宕机或者无响应，你可以使用集中的日志去调试问题。
- 你不用担心ssh或者低效的grep命令需要更多的资源在陷入困境的系统。
- 你不用担心磁盘占满，这个能让你的服务器死机。
- 你能保持你的产品服务安全性，只是为了查看日志无需给你所有团队登录权限。给你的团队从中心区域访问日志权限更安全。

随着集中日志管理，你仍需处理由于网络联通性不好或者用尽大量网络带宽导致不能传输日志到中心区域的风险。在下面的章节我们将要讨论如何聪明的解决这些问题。

### 流行的日志归集工具 ###

在Linux上最常见的日志归集是通过使用系统日志守护进程或者代理。系统日志守护进程支持本地日志的采集，然后通过系统日志协议传输日志到中心服务器。你可以使用很多流行的守护进程来归集你的日志文件：

- [rsyslog][2]是一个轻量后台程序在大多数Linux分支上已经安装。
- [syslog-ng][3]是第二流行的Linux系统日志后台程序。
- [logstash][4]是一个重量级的代理，他可以做更多高级加工和分析。
- [fluentd][5]是另一个有高级处理能力的代理。

Rsyslog是集中日志数据最流行的后台程序因为他在大多数Linux分支上是被默认安装的。你不用下载或安装它，并且它是轻量的，所以不需要占用你太多的系统资源。

如果你需要更多先进的过滤或者自定义分析功能，如果你不在乎额外的系统封装Logstash是下一个最流行的选择。

### 配置Rsyslog.conf ###

既然rsyslog成为最广泛使用的系统日志程序，我们将展示如何配置它为日志中心。全局配置文件位于/etc/rsyslog.conf。它加载模块，设置全局指令，和包含应用特有文件位于目录/etc/rsyslog.d中。这些目录包含/etc/rsyslog.d/50-default.conf命令rsyslog写系统日志到文件。在[rsyslog文档][6]你可以阅读更多相关配置。

rsyslog配置语言是是[RainerScript][7]。你建立特定的日志输入就像输出他们到另一个目标。Rsyslog已经配置为系统日志输入的默认标准，所以你通常只需增加一个输出到你的日志服务器。这里有一个rsyslog输出到一个外部服务器的配置例子。在举例中，**BEBOP**是一个服务器的主机名，所以你应该替换为你的自己的服务器名。

    action(type="omfwd" protocol="tcp" target="BEBOP" port="514")

你可以发送你的日志到一个有丰富存储的日志服务器来存储，提供查询，备份和分析。如果你正存储日志在文件系统，然后你应该建立[日志转储][8]来防止你的磁盘报满。

作为一种选择，你可以发送这些日志到一个日志管理方案。如果你的解决方案是安装在本地你可以发送到您的本地系统文档中指定主机和端口。如果你使用基于云提供商，你将发送他们到你的提供商特定的主机名和端口。

### 日志目录 ###

你可以归集一个目录或者匹配一个通配符模式的所有文件。nxlog和syslog-ng程序支持目录和通配符(*)。

rsyslog的通用形式不支持直接的监控目录。一种解决方案，你可以设置一个定时任务去监控这个目录的新文件，然后配置rsyslog来发送这些文件到目的地，比如你的日志管理系统。作为一个例子，日志管理提供商Loggly有一个开源版本的[目录监控脚本][9]。

### 哪个协议: UDP, TCP, or RELP? ###

当你使用网络传输数据时，你可以选择三个主流的协议。UDP在你自己的局域网是最常用的，TCP是用在互联网。如果你不能失去日志，就要使用更高级的RELP协议。

[UDP][10]发送一个数据包，那只是一个简单的包信息。它是一个只外传的协议，所以他不发送给你回执（ACK）。它只尝试发送包。当网络拥堵时，UDP通常会巧妙的降级或者丢弃日志。它通常使用在类似局域网的可靠网络。

[TCP][11]通过多个包和返回确认发送流信息。TCP会多次尝试发送数据包，但是受限于[TCP缓存][12]大小。这是在互联网上发送送日志最常用的协议。

[RELP][13]是这三个协议中最可靠的，但是它是为rsyslog创建而且很少有行业应用。它在应用层接收数据然后再发出是否有错误。确认你的目标也支持这个协议。

### 用磁盘辅助队列可靠的传送 ###

如果rsyslog在存储日志时遭遇错误，例如一个不可用网络连接，他能将日志排队直到连接还原。队列日志默认被存储在内存里。无论如何，内存是有限的并且如果问题仍然存在，日志会超出内存容量。

**警告：如果你只存储日志到内存，你可能会失去数据。**

Rsyslog能在内存被占满时将日志队列放到磁盘。[磁盘辅助队列][14]使日志的传输更可靠。这里有一个例子如何配置rsyslog的磁盘辅助队列：

    $WorkDirectory /var/spool/rsyslog # where to place spool files
    $ActionQueueFileName fwdRule1     # unique name prefix for spool files
    $ActionQueueMaxDiskSpace 1g       # 1gb space limit (use as much as possible)
    $ActionQueueSaveOnShutdown on     # save messages to disk on shutdown
    $ActionQueueType LinkedList       # run asynchronously
    $ActionResumeRetryCount -1        # infinite retries if host is down

### 使用TLS加密日志 ###

当你的安全隐私数据是一个关心的事，你应该考虑加密你的日志。如果你使用纯文本在互联网传输日志，嗅探器和中间人可以读到你的日志。如果日志包含私人信息、敏感的身份数据或者政府管制数据，你应该加密你的日志。rsyslog程序能使用TLS协议加密你的日志保证你的数据更安全。

建立TLS加密，你应该做如下任务：

1. 生成一个[证书授权][15](CA)。在/contrib/gnutls有一些简单的证书，只是有助于测试，但是你需要创建自己的产品证书。如果你正在使用一个日志管理服务，它将有一个证书给你。
1. 为你的服务器生成一个[数字证书][16]使它能SSL运算，或者使用你自己的日志管理服务提供商的一个数字证书。
1. 配置你的rsyslog程序来发送TLS加密数据到你的日志管理系统。

这有一个rsyslog配置TLS加密的例子。替换CERT和DOMAIN_NAME为你自己的服务器配置。

    $DefaultNetstreamDriverCAFile /etc/rsyslog.d/keys/ca.d/CERT.crt
    $ActionSendStreamDriver gtls
    $ActionSendStreamDriverMode 1
    $ActionSendStreamDriverAuthMode x509/name
    $ActionSendStreamDriverPermittedPeer *.DOMAIN_NAME.com

### 应用日志的最佳管理方法 ###

除Linux默认创建的日志之外，归集重要的应用日志也是一个好主意。几乎所有基于Linux的服务器的应用把他们的状态信息写入到独立专门的日志文件。这包括数据库产品，像PostgreSQL或者MySQL，网站服务器像Nginx或者Apache，防火墙，打印和文件共享服务还有DNS服务等等。

管理员要做的第一件事是安装一个应用后配置它。Linux应用程序典型的有一个.conf文件在/etc目录里。它也可能在其他地方，但是那是大家找配置文件首先会看的地方。

根据应用程序有多复杂多庞大，可配置参数的数量可能会很少或者上百行。如前所述，大多数应用程序可能会在某种日志文件写他们的状态：配置文件是日志设置的地方定义了其他的东西。

如果你不确定它在哪，你可以使用locate命令去找到它：

    [root@localhost ~]# locate postgresql.conf
    /usr/pgsql-9.4/share/postgresql.conf.sample
    /var/lib/pgsql/9.4/data/postgresql.conf

#### 设置一个日志文件的标准位置 ####

Linux系统一般保存他们的日志文件在/var/log目录下。如果是，很好，如果不是，你也许想在/var/log下创建一个专用目录？为什么？因为其他程序也在/var/log下保存他们的日志文件，如果你的应用报错多于一个日志文件 - 也许每天一个或者每次重启一个 - 通过这么大的目录也许有点难于搜索找到你想要的文件。

如果你有多于一个的应用实例在你网络运行，这个方法依然便利。想想这样的情景，你也许有一打web服务器在你的网络运行。当排查任何一个盒子的问题，你将知道确切的位置。

#### 使用一个标准的文件名 ####

给你的应用最新的日志使用一个标准的文件名。这使一些事变得容易，因为你可以监控和追踪一个单独的文件。很多应用程序在他们的日志上追加一种时间戳。他让rsyslog更难于找到最新的文件和设置文件监控。一个更好的方法是使用日志转储增加时间戳到老的日志文件。这样更易去归档和历史查询。

#### 追加日志文件 ####

日志文件会在每个应用程序重启后被覆盖？如果这样，我们建议关掉它。每次重启app后应该去追加日志文件。这样，你就可以追溯重启前最后的日志。

#### 日志文件追加 vs. 转储 ####

虽然应用程序每次重启后写一个新日志文件，如何保存当前日志？追加到一个单独文件，巨大的文件？Linux系统不是因频繁重启或者崩溃出名的：应用程序可以运行很长时间甚至不间歇，但是也会使日志文件非常大。如果你查询分析上周发生连接错误的原因，你可能无疑的要在成千上万行里搜索。

我们建议你配置应用每天半晚转储它的日志文件。

为什么？首先它将变得可管理。找一个有特定日期部分的文件名比遍历一个文件指定日期的条目更容易。文件也小的多：你不用考虑当你打开一个日志文件时vi僵住。第二，如果你正发送日志到另一个位置 - 也许每晚备份任务拷贝到归集日志服务器 - 这样不会消耗你的网络带宽。最后第三点，这样帮助你做日志保持。如果你想剔除旧的日志记录，这样删除超过指定日期的文件比一个应用解析一个大文件更容易。

#### 日志文件的保持 ####

你保留你的日志文件多长时间？这绝对可以归结为业务需求。你可能被要求保持一个星期的日志信息，或者管理要求保持一年的数据。无论如何，日志需要在一个时刻或其他从服务器删除。

在我们看来，除非必要，只在线保持最近一个月的日志文件，加上拷贝他们到第二个地方如日志服务器。任何比这更旧的日志可以被转到一个单独的介质上。例如，如果你在AWS上，你的旧日志可以被拷贝到Glacier。

#### 给日志单独的磁盘分区 ####

Linux最典型的方式通常建议挂载到/var目录到一个单独度的文件系统。这是因为这个目录的高I/Os。我们推荐挂在/var/log目录到一个单独的磁盘系统下。这样可以节省与主应用的数据I/O竞争。另外，如果一些日志文件变的太多，或者一个文件变的太大，不会占满整个磁盘。

#### 日志条目 ####

每个日志条目什么信息应该被捕获？

这依赖于你想用日志来做什么。你只想用它来排除故障，或者你想捕获所有发生的事？这是一个规则条件去捕获每个用户在运行什么或查看什么？

如果你正用日志做错误排查的目的，只保存错误，报警或者致命信息。没有理由去捕获调试信息，例如，应用也许默认记录了调试信息或者另一个管理员也许为了故障排查使用打开了调试信息，但是你应该关闭它，因为它肯定会很快的填满空间。在最低限度上，捕获日期，时间，客户端应用名，原ip或者客户端主机名，执行动作和它自身信息。

#### 一个PostgreSQL的实例 ####

作为一个例子，让我们看看vanilla（这是一个开源论坛）PostgreSQL 9.4安装主配置文件。它叫做postgresql.conf与其他Linux系统中的配置文件不同，他不保存在/etc目录下。在代码段下，我们可以在我们的Centos 7服务器的/var/lib/pgsql目录下看见：

    root@localhost ~]# vi /var/lib/pgsql/9.4/data/postgresql.conf
    ... 
    #------------------------------------------------------------------------------
    # ERROR REPORTING AND LOGGING
    #------------------------------------------------------------------------------
    # - Where to Log -
    log_destination = 'stderr'      
          # Valid values are combinations of
          # stderr, csvlog, syslog, and eventlog,
          # depending on platform. csvlog
          # requires logging_collector to be on.
    # This is used when logging to stderr:
    logging_collector = on          
          # Enable capturing of stderr and csvlog
          # into log files. Required to be on for
          # csvlogs.
          # (change requires restart)
    # These are only used if logging_collector is on:
    log_directory = 'pg_log'       
          # directory where log files are written,
          # can be absolute or relative to PGDATA
    log_filename = 'postgresql-%a.log'    # log file name pattern,
         # can include strftime() escapes
    # log_file_mode = 0600           .
         # creation mode for log files,
         # begin with 0 to use octal notation
    log_truncate_on_rotation = on   # If on, an existing log file with the
         # same name as the new log file will be
         # truncated rather than appended to.
         # But such truncation only occurs on
         # time-driven rotation, not on restarts
         # or size-driven rotation. Default is
         # off, meaning append to existing files
         # in all cases.
    log_rotation_age = 1d           
         # Automatic rotation of logfiles will happen after that time. 0 disables.
    log_rotation_size = 0           # Automatic rotation of logfiles will happen after that much log output. 0 disables.
    # These are relevant when logging to syslog:
    #syslog_facility = 'LOCAL0'
    #syslog_ident = 'postgres'
    # This is only relevant when logging to eventlog (win32):
    #event_source = 'PostgreSQL'
    # - When to Log -
    #client_min_messages = notice   # values in order of decreasing detail:
    # debug5
    # debug4
    # debug3
    # debug2
    # debug1
    # log
    # notice
    # warning
    # error
    #log_min_messages = warning     # values in order of decreasing detail:
    # debug5
    # debug4
    # debug3
    # debug2
    # debug1
    # info
    # notice
    # warning
    # error
    # log
    # fatal
    # panic
    #log_min_error_statement = error    # values in order of decreasing detail:
    # debug5
    # debug4
    # debug3
    # debug2
    # debug1
    # info
    # notice
    # warning
    # error
    # log
    # fatal
    # panic (effectively off)
    #log_min_duration_statement = -1     # -1 is disabled, 0 logs all statements
    # and their durations, > 0 logs only
    # statements running at least this number
    # of milliseconds
    # - What to Log 
    #debug_print_parse = off
    #debug_print_rewritten = off
    #debug_print_plan = off
    #debug_pretty_print = on
    #log_checkpoints = off
    #log_connections = off
    #log_disconnections = off
    #log_duration = off
    #log_error_verbosity = default    
    # terse, default, or verbose messages
    #log_hostname = off
    log_line_prefix = '< %m >'          # special values:
    # %a = application name
    # %u = user name
    # %d = database name
    # %r = remote host and port
    # %h = remote host
    # %p = process ID
    # %t = timestamp without milliseconds
    # %m = timestamp with milliseconds
    # %i = command tag
    # %e = SQL state
    # %c = session ID
    # %l = session line number
    # %s = session start timestamp
    # %v = virtual transaction ID
    # %x = transaction ID (0 if none)
    # %q = stop here in non-session
    # processes
    # %% = '%'
    # e.g. '<%u%%%d> '
    #log_lock_waits = off               # log lock waits >= deadlock_timeout
    #log_statement = 'none'             # none, ddl, mod, all
    #log_temp_files = -1                # log temporary files equal or larger
    # than the specified size in kilobytes;5# -1 disables, 0 logs all temp files5
    log_timezone = 'Australia/ACT'

虽然大多数参数被加上了注释，他们呈现了默认数值。我们可以看见日志文件目录是pg_log（log_directory参数），文件名应该以postgresql开头（log_filename参数），文件每天转储一次（log_rotation_age参数）然后日志记录以时间戳开头（log_line_prefix参数）。特别说明有趣的是log_line_prefix参数：你可以包含很多整体丰富的信息在这。

看/var/lib/pgsql/9.4/data/pg_log目录下展现给我们这些文件：

    [root@localhost ~]# ls -l /var/lib/pgsql/9.4/data/pg_log
    total 20
    -rw-------. 1 postgres postgres 1212 May 1 20:11 postgresql-Fri.log
    -rw-------. 1 postgres postgres 243 Feb 9 21:49 postgresql-Mon.log
    -rw-------. 1 postgres postgres 1138 Feb 7 11:08 postgresql-Sat.log
    -rw-------. 1 postgres postgres 1203 Feb 26 21:32 postgresql-Thu.log
    -rw-------. 1 postgres postgres 326 Feb 10 01:20 postgresql-Tue.log

所以日志文件命只有工作日命名的标签。我们可以改变他。如何做？在postgresql.conf配置log_filename参数。

查看一个日志内容，它的条目仅以日期时间开头：

    [root@localhost ~]# cat /var/lib/pgsql/9.4/data/pg_log/postgresql-Fri.log
    ...
    < 2015-02-27 01:21:27.020 EST >LOG: received fast shutdown request
    < 2015-02-27 01:21:27.025 EST >LOG: aborting any active transactions
    < 2015-02-27 01:21:27.026 EST >LOG: autovacuum launcher shutting down
    < 2015-02-27 01:21:27.036 EST >LOG: shutting down
    < 2015-02-27 01:21:27.211 EST >LOG: database system is shut down

### 集中应用日志 ###

#### 使用Imfile监控日志 ####

习惯上，应用通常记录他们数据在文件里。文件容易在一个机器上寻找但是多台服务器上就不是很恰当了。你可以设置日志文件监控然后当新的日志被添加到底部就发送事件到一个集中服务器。在/etc/rsyslog.d/里创建一个新的配置文件然后增加一个文件输入，像这样：

    $ModLoad imfile
    $InputFilePollInterval 10
    $PrivDropToGroup adm

----------

    # Input for FILE1
    $InputFileName /FILE1
    $InputFileTag APPNAME1
    $InputFileStateFile stat-APPNAME1 #this must be unique for each file being polled
    $InputFileSeverity info
    $InputFilePersistStateInterval 20000
    $InputRunFileMonitor

替换FILE1和APPNAME1位你自己的文件和应用名称。Rsyslog将发送它到你配置的输出中。

#### 本地套接字日志与Imuxsock ####

套接字类似UNIX文件句柄,所不同的是套接字内容是由系统日志程序读取到内存中,然后发送到目的地。没有文件需要被写入。例如，logger命令发送他的日志到这个UNIX套接字。

如果你的服务器I/O有限或者你不需要本地文件日志，这个方法使系统资源有效利用。这个方法缺点是套接字有队列大小的限制。如果你的系统日志程序宕掉或者不能保持运行，然后你可能会丢失日志数据。

rsyslog程序将默认从/dev/log套接字中种读取，但是你要用[imuxsock输入模块][17]如下命令使它生效：

    $ModLoad imuxsock

#### UDP日志与Imupd ####

一些应用程序使用UDP格式输出日志数据，这是在网络上或者本地传输日志文件的标准系统日志协议。你的系统日志程序收集这些日志然后处理他们或者用不同的格式传输他们。交替地，你可以发送日志到你的日志服务器或者到一个日志管理方案中。

使用如下命令配置rsyslog来接收标准端口514的UDP系统日志数据：

    $ModLoad imudp

----------

    $UDPServerRun 514

### 用Logrotate管理日志 ###

日志转储是当日志到达指定的时期时自动归档日志文件的方法。如果不介入，日志文件一直增长，会用尽磁盘空间。最后他们将破坏你的机器。

logrotate实例能随着日志的日期截取你的日志，腾出空间。你的新日志文件保持文件名。你的旧日志文件被重命名为后缀加上数字。每次logrotate实例运行，一个新文件被建立然后现存的文件被逐一重命名。你来决定何时旧文件被删除或归档的阈值。

当logrotate拷贝一个文件，新的文件已经有一个新的索引节点，这会妨碍rsyslog监控新文件。你可以通过增加copytruncate参数到你的logrotate定时任务来缓解这个问题。这个参数拷贝现有的日志文件内容到新文件然后从现有文件截短这些内容。这个索引节点从不改变，因为日志文件自己保持不变；它的内容是一个新文件。

logrotate实例使用的主配置文件是/etc/logrotate.conf，应用特有设置在/etc/logrotate.d/目录下。DigitalOcean有一个详细的[logrotate教程][18]

### 管理很多服务器的配置 ###

当你只有很少的服务器，你可以登陆上去手动配置。一旦你有几打或者更多服务器，你可以用高级工具使这变得更容易和更可扩展。基本上，所有的事情就是拷贝你的rsyslog配置到每个服务器，然后重启rsyslog使更改生效。

#### Pssh ####

这个工具可以让你在很多服务器上并行的运行一个ssh命令。使用pssh部署只有一小部分的服务器。如果你其中一个服务器失败，然后你必须ssh到失败的服务器，然后手动部署。如果你有很多服务器失败，那么手动部署他们会话费很长时间。

#### Puppet/Chef ####

Puppet和Chef是两个不同的工具，他们能在你的网络按你规定的标准自动的配置所有服务器。他们的报表工具使你知道关于错误然后定期重新同步。Puppet和Chef有一些狂热的支持者。如果你不确定那个更适合你的部署配置管理，你可以领会一下[InfoWorld上这两个工具的对比][19]

一些厂商也提供一些配置rsyslog的模块或者方法。这有一个Loggly上Puppet模块的例子。它提供给rsyslog一个类，你可以添加一个标识令牌：

    node 'my_server_node.example.net' {
      # Send syslog events to Loggly
      class { 'loggly::rsyslog':
        customer_token => 'de7b5ccd-04de-4dc4-fbc9-501393600000',
      }
    }

#### Docker ####

Docker使用容器去运行应用不依赖底层服务。所有东西都从内部的容器运行，你可以想象为一个单元功能。ZDNet有一个深入文章关于在你的数据中心[使用Docker][20]。

这有很多方式从Docker容器记录日志，包括链接到一个日志容器，记录到一个共享卷，或者直接在容器里添加一个系统日志代理。其中最流行的日志容器叫做[logspout][21]。

#### 供应商的脚本或代理 ####

大多数日志管理方案提供一些脚本或者代理，从一个或更多服务器比较简单的发送数据。重量级代理会耗尽额外的系统资源。一些供应商像Loggly提供配置脚本，来使用现存的系统日志程序更轻松。这有一个Loggly上的例子[脚本][22]，它能运行在任意数量的服务器上。

--------------------------------------------------------------------------------

via: http://www.loggly.com/ultimate-guide/logging/managing-linux-logs/

作者：[Jason Skowronski][a1]
作者：[Amy Echeverri][a2]
作者：[Sadequl Hussain][a3]
译者：[wyangsun](https://github.com/wyangsun)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a1]:https://www.linkedin.com/in/jasonskowronski
[a2]:https://www.linkedin.com/in/amyecheverri
[a3]:https://www.linkedin.com/pub/sadequl-hussain/14/711/1a7
[1]:https://docs.google.com/document/d/11LXZxWlkNSHkcrCWTUdnLRf_CiZz9kK0cr3yGM_BU_0/edit#heading=h.esrreycnpnbl
[2]:http://www.rsyslog.com/
[3]:http://www.balabit.com/network-security/syslog-ng/opensource-logging-system
[4]:http://logstash.net/
[5]:http://www.fluentd.org/
[6]:http://www.rsyslog.com/doc/rsyslog_conf.html
[7]:http://www.rsyslog.com/doc/master/rainerscript/index.html
[8]:https://docs.google.com/document/d/11LXZxWlkNSHkcrCWTUdnLRf_CiZz9kK0cr3yGM_BU_0/edit#heading=h.eck7acdxin87
[9]:https://www.loggly.com/docs/file-monitoring/
[10]:http://www.networksorcery.com/enp/protocol/udp.htm
[11]:http://www.networksorcery.com/enp/protocol/tcp.htm
[12]:http://blog.gerhards.net/2008/04/on-unreliability-of-plain-tcp-syslog.html
[13]:http://www.rsyslog.com/doc/relp.html
[14]:http://www.rsyslog.com/doc/queues.html
[15]:http://www.rsyslog.com/doc/tls_cert_ca.html
[16]:http://www.rsyslog.com/doc/tls_cert_machine.html
[17]:http://www.rsyslog.com/doc/v8-stable/configuration/modules/imuxsock.html
[18]:https://www.digitalocean.com/community/tutorials/how-to-manage-log-files-with-logrotate-on-ubuntu-12-10
[19]:http://www.infoworld.com/article/2614204/data-center/puppet-or-chef--the-configuration-management-dilemma.html
[20]:http://www.zdnet.com/article/what-is-docker-and-why-is-it-so-darn-popular/
[21]:https://github.com/progrium/logspout
[22]:https://www.loggly.com/docs/sending-logs-unixlinux-system-setup/
