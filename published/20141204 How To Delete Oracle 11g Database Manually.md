如何手动删除Oracle 11g数据库
================================================================================
下面的步骤会教你如何在Linux环境下手动删除Oracle 11g数据库。

我在Centos 6上安装了Oralce 11G数据库。

使用SQL*Plus或者其他你喜欢的命令行工具登录数据库，登录用户是**sysdba**

输入下面的命令的到不同文件的路径：

    select name from v$datafile;
    select member from v$logfile;
    select name from v$controlfile;
    select name from v$tempfile;

**在SQL*Plus中关闭数据库，接着退出SQL*Plus**

    sqlplus  "/ as sysdba"

----------

    shutdown immediate;
    quit;

**在命令行中输入下面的命令停止监听服务：**

在Oralce Linux账户中：

    lsnrctl stop

回忆一下之前的文件路径;在删除这些文件的时候作为一个检查项。记住：你备份了数据库了么？当准备好之后，就删除你的数据文件吧，同样还有你的日志文件、控制文件和临时文件。

- 进入 **$ORACLE_HOME/network/admin** 目录并删除 **tnsnames.ora** 和 **listener.ora** 文件;
- 进入 **$ORACLE_HOME/dbs** 目录并删除 **init[db_name].ora**、 **orapw[db_name]**和 **spfile[db_name].ora** 文件;
- 进入 **$ORACLE_HOME/admin/[db_name]/pfile** 目录并删除 **init[db_name].ora** 文件;
- 进入 **$ORACLE_HOME/admin/[db_name]/adump** 目录并删除所有文件;
- 编辑**/etc/oratab** 并移除以你数据库名字开头的行.

这样就好了。

--------------------------------------------------------------------------------

via: http://www.unixmen.com/manually-delete-oracle-11g-database/

作者：[M.el Khamlichi][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/pirat9/
