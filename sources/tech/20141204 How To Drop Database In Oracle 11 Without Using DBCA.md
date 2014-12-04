How To Drop Database In Oracle 11 Without Using DBCA
================================================================================
In this small tutorial, I want to show you how to drop the database without using the GUI tool DBCA

#### 1- Export database SID if not yet Already defined ####

    export ORACLE_SID=database

#### 2- Connect as sysdba  ####

    [oracle@Oracle11 ~]$ sqlplus / as sysdba

----------

    SQL*Plus: Release 11.2.0.1.0 Production on Mon Dec 1 17:38:02 2014

----------

    Copyright (c) 1982, 2009, Oracle. All rights reserved.

----------

    Connected to an idle instance.

#### 3- Start The database ####

    SQL> startup
    ORACLE instance started.
    Total System Global Area 3340451840 bytes
    Fixed Size 2217952 bytes
    Variable Size 1828718624 bytes
    Database Buffers 1493172224 bytes
    Redo Buffers 16343040 bytes
    Database mounted.
    Database opened.

#### 4- Shutdown the database  ####

    SQL> shutdown immediate;
    Database closed.
    Database dismounted.
    ORACLE instance shut down.

#### 5- Start in Exclusive mode  ####

    SQL> startup mount exclusive restrict
    ORACLE instance started.

----------

    Total System Global Area 3340451840 bytes
    Fixed Size 2217952 bytes
    Variable Size 1828718624 bytes
    Database Buffers 1493172224 bytes
    Redo Buffers 16343040 bytes
    Database mounted.

#### 6- Drop the database ####

    SQL> drop database;

----------

    Database dropped.

----------

    Disconnected from Oracle Database 11g Enterprise Edition Release 11.2.0.1.0 - 64bit Production
    With the Partitioning, OLAP, Data Mining and Real Application Testing options
SQL>

Cheers!

--------------------------------------------------------------------------------

via: http://www.unixmen.com/drop-database-oracle-11-without-using-dcba/

作者：[M.el Khamlichi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/pirat9/