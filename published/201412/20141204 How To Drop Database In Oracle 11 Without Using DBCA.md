如何不使用DBCA在Oracle 11中删除数据库
================================================================================
本文简短的教程，将会向你展示如何不使用DBCA（数据库配置助手）在Oracle 11中删除数据库。

#### 1- 导入数据库的SID，如果没有定义的话 ####

    export ORACLE_SID=database

#### 2- 以操作系统认证连接数据库  ####

    [oracle@Oracle11 ~]$ sqlplus / as sysdba

    SQL*Plus: Release 11.2.0.1.0 Production on Mon Dec 1 17:38:02 2014
    Copyright (c) 1982, 2009, Oracle. All rights reserved.
    Connected to an idle instance.

#### 3- 启动数据库实例 ####

    SQL> startup

    ORACLE instance started.
    Total System Global Area 3340451840 bytes
    Fixed Size 2217952 bytes
    Variable Size 1828718624 bytes
    Database Buffers 1493172224 bytes
    Redo Buffers 16343040 bytes
    Database mounted.
    Database opened.

#### 4- 关闭数据库  ####

    SQL> shutdown immediate;
    
    Database closed.
    Database dismounted.
    ORACLE instance shut down.

#### 5- 启动独占模式  ####

    SQL> startup mount exclusive restrict
    
    ORACLE instance started.

    Total System Global Area 3340451840 bytes
    Fixed Size 2217952 bytes
    Variable Size 1828718624 bytes
    Database Buffers 1493172224 bytes
    Redo Buffers 16343040 bytes
    Database mounted.

#### 6- 删除数据库 ####

    SQL> drop database;


    Database dropped.


    Disconnected from Oracle Database 11g Enterprise Edition Release 11.2.0.1.0 - 64bit Production
    With the Partitioning, OLAP, Data Mining and Real Application Testing options

完成！

--------------------------------------------------------------------------------

via: http://www.unixmen.com/drop-database-oracle-11-without-using-dcba/

作者：[M.el Khamlichi][a]
译者：[VicYu/Vic020](http://vicyu.net/)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/pirat9/
