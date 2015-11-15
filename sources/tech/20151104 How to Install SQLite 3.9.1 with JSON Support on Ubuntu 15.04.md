translating by ezio

How to Install SQLite 3.9.1 with JSON Support on Ubuntu 15.04
================================================================================
Hello and welcome to our today's article on SQLite which is the most widely deployed SQL database engine in the world that comes with zero-configuration, that means no setup or administration needed. SQLite is public-domain software package that provides relational database management system, or RDBMS that is used to store user-defined records in large tables. In addition to data storage and management, database engine process complex query commands that combine data from multiple tables to generate reports and data summaries.

SQLite is very small and light weight that does not require a separate server process or system to operate. It is available on UNIX, Linux, Mac OS-X, Android, iOS and Windows which is being used in various software applications like Opera, Ruby On Rails, Adobe System, Mozilla Firefox, Google Chrome and Skype.

### 1) Basic Requirements: ###

There is are no such complex complex requirements for the installation of SQLite as it mostly comes support all major cross platforms.

So, let's login to your Ubuntu server with sudo or root credentials using your CLI or Secure Shell. Then update your system so that your operating system is upto date with latest packages.

In ubuntu, the below command is to be used for system update.

    # apt-get update

If you are starting to deploy SQLite on on a fresh Ubuntu, then make sure that you have installed some basic system management utilities like wget, make, unzip, gcc.

To install wget, make and gcc packages on ubuntu, you use the below command, then press "Y" to allow and proceed with installation of these packages.

    # apt-get install wget make gcc

### 2) Download SQLite ###

To download the latest package of SQLite, you can refer to their official [SQLite Download Page][1] as shown below.

![SQLite download](http://blog.linoxide.com/wp-content/uploads/2015/10/Selection_014.png)

You can copy the link of its resource package and download it on ubuntu server using the wget utility command.

    # wget https://www.sqlite.org/2015/sqlite-autoconf-3090100.tar.gz

![wget SQLite](http://blog.linoxide.com/wp-content/uploads/2015/10/23.png)

After downloading is complete, extract the package and change your current directory to the extracted SQLite folder by using the below command as shown.

    # tar -zxvf sqlite-autoconf-3090100.tar.gz

### 3) Installing SQLite ###

Now we are going to install and configure the SQLite package that we downloaded. So, to compile and install SQLite on ubuntu run the configuration script within the same directory where your have extracted the SQLite package as shown below.

    root@ubuntu-15:~/sqlite-autoconf-3090100# ./configure –prefix=/usr/local

![SQLite Installation](http://blog.linoxide.com/wp-content/uploads/2015/10/35.png)

Once the package is configuration is done under the mentioned prefix, then run the below command make command to compile the package.

    root@ubuntu-15:~/sqlite-autoconf-3090100# make
    source='sqlite3.c' object='sqlite3.lo' libtool=yes \
    DEPDIR=.deps depmode=none /bin/bash ./depcomp \
    /bin/bash ./libtool --tag=CC --mode=compile gcc -DPACKAGE_NAME=\"sqlite\" -DPACKAGE_TARNAME=\"sqlite\" -DPACKAGE_VERSION=\"3.9.1\" -DPACKAGE_STRING=\"sqlite\ 3.9.1\" -DPACKAGE_BUGREPORT=\"http://www.sqlite.org\" -DPACKAGE_URL=\"\" -DPACKAGE=\"sqlite\" -DVERSION=\"3.9.1\" -DSTDC_HEADERS=1 -DHAVE_SYS_TYPES_H=1 -DHAVE_SYS_STAT_H=1 -DHAVE_STDLIB_H=1 -DHAVE_STRING_H=1 -DHAVE_MEMORY_H=1 -DHAVE_STRINGS_H=1 -DHAVE_INTTYPES_H=1 -DHAVE_STDINT_H=1 -DHAVE_UNISTD_H=1 -DHAVE_DLFCN_H=1 -DLT_OBJDIR=\".libs/\" -DHAVE_FDATASYNC=1 -DHAVE_USLEEP=1 -DHAVE_LOCALTIME_R=1 -DHAVE_GMTIME_R=1 -DHAVE_DECL_STRERROR_R=1 -DHAVE_STRERROR_R=1 -DHAVE_POSIX_FALLOCATE=1 -I. -D_REENTRANT=1 -DSQLITE_THREADSAFE=1 -DSQLITE_ENABLE_FTS3 -DSQLITE_ENABLE_RTREE -g -O2 -c -o sqlite3.lo sqlite3.c

After running make command, to complete the installation of SQLite on ubuntu run the 'make install' command as shown below.

    # make install

![SQLite Make Install](http://blog.linoxide.com/wp-content/uploads/2015/10/44.png)

### 4) Testing SQLite Installation ###

To confirm the successful installation of SQLite 3.9, run the below command in your command line interface.

    # sqlite3

You will the SQLite verion after running the above command as shown.

![Testing SQLite Installation](http://blog.linoxide.com/wp-content/uploads/2015/10/53.png)

### 5) Using SQLite ###

SQLite is very handy to use. To get the detailed information about its usage, simply run the below command in the SQLite console.

    sqlite> .help

So here is the list of all its available commands, with their description that you can get help to start using SQLite.

![SQLite Help](http://blog.linoxide.com/wp-content/uploads/2015/10/62.png)

Now in this last section , we make use of few SQLite commands to create a new database using the SQLite3 command line interface.

To to create a new database run the below command.

    # sqlite3 test.db

To create a table within the new database run the below command.

    sqlite> create table memos(text, priority INTEGER);

After creating the table, insert some data using the following commands.

    sqlite> insert into memos values('deliver project description', 15);
    sqlite> insert into memos values('writing new artilces', 100);

To view the inserted data from the table , run the below command.

    sqlite> select * from memos;
    deliver project description|15
    writing new artilces|100

to exit from the sqlite3 type the below command.

    sqlite> .exit

![Using SQLite3](http://blog.linoxide.com/wp-content/uploads/2015/10/73.png)

### Conclusion ###

In this article you learned the installation of latest version of SQLite 3.9.1 which enables the recently JSON1 support in its 3.9.0 version and so on. Its is an amazing library that gets embedded inside the application that makes use of it to keep the resources much efficient and lighter. We hope you find this article much helpful, feel free to get back to us if you find any difficulty.

--------------------------------------------------------------------------------

via: http://linoxide.com/ubuntu-how-to/install-sqlite-json-ubuntu-15-04/

作者：[Kashif Siddique][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/kashifs/
[1]:https://www.sqlite.org/download.html
