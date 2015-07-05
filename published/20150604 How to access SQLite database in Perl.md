如何用Perl访问SQLite数据库
================================================================================
SQLite是一个零配置、无服务端、基于文件的事务型数据库系统。由于它的轻量级，自包含和紧凑的设计，所以当你想要集成数据库到你的程序中时，SQLite是一个非常不错的选择。在这篇文章中，我会展示如何用Perl脚本来创建和访问SQLite数据库。我演示的Perl代码片段是完整的，所以你可以很简单地修改并集成到你的项目中。

![](https://farm1.staticflickr.com/552/18444614631_9e7fce8243_c.jpg)

### 访问SQLite的准备 ###

我会使用SQLite DBI Perl驱动来连接到SQLite3。因此你需要在Linux中安装它（和SQLite3一起）。

**Debian、 Ubuntu 或者 Linux Mint**

    $ sudo apt-get install sqlite3 libdbd-sqlite3-perl

**CentOS、 Fedora 或者 RHEL**

    $ sudo yum install sqlite perl-DBD-SQLite

安装后，你可以检查SQLite驱动可以通过下面的脚本访问到。

    #!/usr/bin/perl
    
    my @drv = DBI->available_drivers();
    print join("\n", @drv), "\n";

如果你运行脚本，你应该会看见下面的输出。

    DBM
    ExampleP
    File
    Gofer
    Proxy
    SQLite
    Sponge

### Perl SQLite 访问示例 ###

下面就是Perl访问SQLite的示例。这个Perl脚本会演示下面这些SQLite数据库的常规管理。

- 创建和连接SQLite数据库
- 在SQLite数据库中创建新表
- 在表中插入行
- 在表中搜索和迭代行
- 在表中更新行
- 在表中删除行

-

    use DBI;
    use strict;
     
    # 定义数据库名称和驱动
    my $driver   = "SQLite";
    my $db_name = "xmodulo.db";
    my $dbd = "DBI:$driver:dbname=$db_name";
     
    # sqlite 没有用户名密码的概念
    my $username = "";
    my $password = "";
     
    # 创建并连接到数据库
    # 以下创建的文件名为 xmodulo.db
    my $dbh = DBI->connect($dbd, $username, $password, { RaiseError => 1 })
                          or die $DBI::errstr;
    print STDERR "Database opened successfully\n";
     
    # 创建表
    my $stmt = qq(CREATE TABLE IF NOT EXISTS NETWORK
                 (ID INTEGER PRIMARY KEY     AUTOINCREMENT,
                  HOSTNAME       TEXT    NOT NULL,
                  IPADDRESS      INT     NOT NULL,
                  OS             CHAR(50),
                  CPULOAD        REAL););
    my $ret = $dbh->do($stmt);
    if($ret < 0) {
       print STDERR $DBI::errstr;
    } else {
       print STDERR "Table created successfully\n";
    }
     
    # 插入三行到表中
    $stmt = qq(INSERT INTO NETWORK (HOSTNAME,IPADDRESS,OS,CPULOAD)
               VALUES ('xmodulo', 16843009, 'Ubuntu 14.10', 0.0));
    $ret = $dbh->do($stmt) or die $DBI::errstr;
     
    $stmt = qq(INSERT INTO NETWORK (HOSTNAME,IPADDRESS,OS,CPULOAD)
               VALUES ('bert', 16843010, 'CentOS 7', 0.0));
    $ret = $dbh->do($stmt) or die $DBI::errstr;
     
    $stmt = qq(INSERT INTO NETWORK (HOSTNAME,IPADDRESS,OS,CPULOAD)
               VALUES ('puppy', 16843011, 'Ubuntu 14.10', 0.0));
    $ret = $dbh->do($stmt) or die $DBI::errstr;
     
    # 在表中检索行
    $stmt = qq(SELECT id, hostname, os, cpuload from NETWORK;);
    my $obj = $dbh->prepare($stmt);
    $ret = $obj->execute() or die $DBI::errstr;
     
    if($ret < 0) {
       print STDERR $DBI::errstr;
    }
    while(my @row = $obj->fetchrow_array()) {
          print "ID: ". $row[0] . "\n";
          print "HOSTNAME: ". $row[1] ."\n";
          print "OS: ". $row[2] ."\n";
          print "CPULOAD: ". $row[3] ."\n\n";
    }
     
    # 更新表中的某行
    $stmt = qq(UPDATE NETWORK set CPULOAD = 50 where OS='Ubuntu 14.10';);
    $ret = $dbh->do($stmt) or die $DBI::errstr;
     
    if( $ret < 0 ) {
       print STDERR $DBI::errstr;
    } else {
       print STDERR "A total of $ret rows updated\n";
    }
     
    # 从表中删除某行
    $stmt = qq(DELETE from NETWORK where ID=2;);
    $ret = $dbh->do($stmt) or die $DBI::errstr;
     
    if($ret < 0) {
       print STDERR $DBI::errstr;
    } else {
       print STDERR "A total of $ret rows deleted\n";
    }
     
    # 断开数据库连接
    $dbh->disconnect();
    print STDERR "Exit the database\n";

上面的Perl脚本运行成功后会创建一个叫“xmodulo.db”的数据库文件，并会有下面的输出。

    Database opened successfully
    Table created successfully
    ID: 1
    HOSTNAME: xmodulo
    OS: Ubuntu 14.10
    CPULOAD: 0
    
    ID: 2
    HOSTNAME: bert
    OS: CentOS 7
    CPULOAD: 0
    
    ID: 3
    HOSTNAME: puppy
    OS: Ubuntu 14.10
    CPULOAD: 0
    
    A total of 2 rows updated
    A total of 1 rows deleted
    Exit the database

### 错误定位 ###

如果你尝试没有安装SQLite DBI驱动的情况下使用Perl访问SQLite的话，你会遇到下面的错误。你必须按开始说的安装DBI驱动。

    Can't locate DBI.pm in @INC (@INC contains: /usr/local/lib64/perl5 /usr/local/share/perl5 /usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl /usr/lib64/perl5 /usr/share/perl5 .) at ./script.pl line 3.
    BEGIN failed--compilation aborted at ./script.pl line 3.

--------------------------------------------------------------------------------

via: http://xmodulo.com/access-sqlite-database-perl.html

作者：[Dan Nanni][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
