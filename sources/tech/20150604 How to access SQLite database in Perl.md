Translating---geekpi

How to access SQLite database in Perl
================================================================================
SQLite is a zero-configuration, server-less, file-based transactional database system. Due to its lightweight, self-contained, and compact design, SQLite is an extremely popular choice when you want to integrate a database into your application. In this post, I am going to show you how to create and access a SQLite database in Perl script. The Perl code snippet I present is fully functional, so you can easily modify and integrate it into your project.

![](https://farm1.staticflickr.com/552/18444614631_9e7fce8243_c.jpg)

### Preparation for SQLite Access ###

I am going to use SQLite DBI Perl driver to connect to SQLite3. Thus you need to install it (along with SQLite3) on your Linux system.

**Debian, Ubuntu or Linux Mint**

    $ sudo apt-get install sqlite3 libdbd-sqlite3-perl

**CentOS, Fedora or RHEL**

    $ sudo yum install sqlite perl-DBD-SQLite

After installation, you can check if the SQLite driver is indeed available by using the following script.

    #!/usr/bin/perl
    
    my @drv = DBI->available_drivers();
    print join("\n", @drv), "\n";

If you run the script, you should see SQLite in the output.

    DBM
    ExampleP
    File
    Gofer
    Proxy
    SQLite
    Sponge

### Perl SQLite Access Example ###

Here is the full-blown Perl code example of SQLite access. This Perl script will demonstrate the following SQLite database management routines.

- Create and connect to a SQLite database.
- Create a new table in a SQLite database.
- Insert rows into a table.
- Search and iterate rows in a table.
- Update rows in a table.
- Delete rows in a table. 

    use DBI;
    use strict;
     
    # define database name and driver
    my $driver   = "SQLite";
    my $db_name = "xmodulo.db";
    my $dbd = "DBI:$driver:dbname=$db_name";
     
    # sqlite does not have a notion of username/password
    my $username = "";
    my $password = "";
     
    # create and connect to a database.
    # this will create a file named xmodulo.db
    my $dbh = DBI->connect($dbd, $username, $password, { RaiseError => 1 })
                          or die $DBI::errstr;
    print STDERR "Database opened successfully\n";
     
    # create a table
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
     
    # insert three rows into the table
    $stmt = qq(INSERT INTO NETWORK (HOSTNAME,IPADDRESS,OS,CPULOAD)
               VALUES ('xmodulo', 16843009, 'Ubuntu 14.10', 0.0));
    $ret = $dbh->do($stmt) or die $DBI::errstr;
     
    $stmt = qq(INSERT INTO NETWORK (HOSTNAME,IPADDRESS,OS,CPULOAD)
               VALUES ('bert', 16843010, 'CentOS 7', 0.0));
    $ret = $dbh->do($stmt) or die $DBI::errstr;
     
    $stmt = qq(INSERT INTO NETWORK (HOSTNAME,IPADDRESS,OS,CPULOAD)
               VALUES ('puppy', 16843011, 'Ubuntu 14.10', 0.0));
    $ret = $dbh->do($stmt) or die $DBI::errstr;
     
    # search and iterate row(s) in the table
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
     
    # update specific row(s) in the table
    $stmt = qq(UPDATE NETWORK set CPULOAD = 50 where OS='Ubuntu 14.10';);
    $ret = $dbh->do($stmt) or die $DBI::errstr;
     
    if( $ret < 0 ) {
       print STDERR $DBI::errstr;
    } else {
       print STDERR "A total of $ret rows updated\n";
    }
     
    # delete specific row(s) from the table
    $stmt = qq(DELETE from NETWORK where ID=2;);
    $ret = $dbh->do($stmt) or die $DBI::errstr;
     
    if($ret < 0) {
       print STDERR $DBI::errstr;
    } else {
       print STDERR "A total of $ret rows deleted\n";
    }
     
    # quit the database
    $dbh->disconnect();
    print STDERR "Exit the database\n";

A successful run of the above Perl script will create a SQLite database file named "xmodulo.db", and show the following output.

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

### Troubleshooting ###

If you attempt to access SQLite in Perl without installing SQLite DBI driver, you will encounter the following error. You must install DBI driver as describe at the beginning to fix this error.

    Can't locate DBI.pm in @INC (@INC contains: /usr/local/lib64/perl5 /usr/local/share/perl5 /usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl /usr/lib64/perl5 /usr/share/perl5 .) at ./script.pl line 3.
    BEGIN failed--compilation aborted at ./script.pl line 3.

--------------------------------------------------------------------------------

via: http://xmodulo.com/access-sqlite-database-perl.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni