How To Delete Oracle 11g Database Manually ? 
================================================================================
The following steps shows how to manually delete a database within Oracle 11g, running in an Linux environment.

I have Centos 6 system with Oralce 11G installed.

Use SQL*Plus or your favorite SQL command line tool to log in to the target database; log in as **sysdba**

Type the following commands to get the path to various files:

    select name from v$datafile;
    select member from v$logfile;
    select name from v$controlfile;
    select name from v$tempfile;

**Shut down the database within SQL*Plus, and then exit out of SQL*Plus**

    sqlplus  " / as sysdba'

----------

    shutdown immediate;
    quit;

**Stop the listener service by issuing the following command in the terminal prompt:**

From Oralce Linux account do:

   lsnrctl stop

Recall the file paths found earlier; use them as a check list as you delete each one of those files. Reminder: did you back up your database yet? When ready, go ahead delete your data files, redo log files, control files, and temp files.

- Go to the **$ORACLE_HOME/network/admin** directory and delete the **tnsnames.ora** and **listener.ora** files;
- Go to the **$ORACLE_HOME/dbs** directory and delete the **init[db_name].ora**, **orapw[db_name]**, and **spfile[db_name].ora** files;
- Go to the **$ORACLE_HOME/admin/[db_name]/pfile** directory and delete the **init[db_name].ora** file;
- Go to the **$ORACLE_HOME/admin/[db_name]/adump** directory and delete all files in that directory;
- Edit the file **/etc/oratab** by removing the line that starts with your database name.

Done.

--------------------------------------------------------------------------------

via: http://www.unixmen.com/manually-delete-oracle-11g-database/

作者：[M.el Khamlichi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/pirat9/