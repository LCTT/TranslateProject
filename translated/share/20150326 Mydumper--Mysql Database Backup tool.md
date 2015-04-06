Mydumper - MySQL数据库备份工具
================================================================================
Mydumper 是MySQL数据库服务器备份工具，它比MySQL自带的mysqldump快很多。它还有在转储本身的时候检索远程服务器二进制日志文件的能力。

### Mydumper 的优势 ###

o 并行性 (因此有高速度) 和 性能 (避免了昂贵的字符集转换例程, 高效的代码)

o 更容易管理输出 (每个表独立的文件，转储元数据等，简单的查看/解析数据)

o 一致性 -- 在所有线程中维护快照, 提供准确的主从结点日志位置等。

o 可管理性 -- 支持对包含和排除指定的数据库和表的PCRE操作(译者注：PCRE，Perl Compatible Regular Expression，Perl兼容正则表达式)

### 在Ubuntu上安装 mydumper ###

打开终端运行以下命令

    sudo apt-get install mydumper

### 使用 Mydumper ###

#### 语法 ####

    mydumper [options]

应用程序选项:

- -B, --database 转储的数据库
- -T, --tables-list 逗号分隔的转储表列表(不排除正则表达式)
- -o, --outputdir 保存输出文件的目录
- -s, --statement-size 插入语句的字节大小, 默认是1000000个字节
- -r, --rows 把表分为每个这么多行的块
- -c, --compress 压缩输出文件
- -e, --build-empty-files 尽管表中没有数据也创建输出文件
- -x, --regex 匹配‘db.table'的正则表达式
- -i, --ignore-engines 逗号分隔的忽略存储引擎列表
- -m, --no-schemas 不转储有数据的表架构
- -k, --no-locks 不执行临时共享读锁. 警告: 这会导致备份的不一致性
- -l, --long-query-guard 设置长查询的计时器秒数，默认是60秒
- --kill-long-queries 杀死长查询 (而不是退出)
- -b, --binlogs 获取二进制日志文件和转储数据的快照
- -D, --daemon 开启守护进程模式
- -I, --snapshot-interval 每个转储快照之间的间隔时间(分钟), 需要开启 --daemon, 默认是60分钟
- -L, --logfile 日志文件的名字，默认是stdout
- -h, --host 要连接的主机
- -u, --user 有转储权限的用户名
- -p, --password 用户密码
- -P, --port 连接的TCP/IP端口
- -S, --socket 用于连接的Unix套接字文件
- -t, --threads 使用的线程数，默认是4
- -C, --compress-protocol 在MySQL连接上使用压缩
- -V, --version 查看程序版本号
- -v, --verbose 输出信息的等级, 0 = silent, 1 = errors, 2 = warnings, 3 = info, 默认是2

#### Mydumper 例子 ####

    mydumper \
    --database=$DB_NAME \
    --host=$DB_HOST \
    --user=$DB_USER \
    --password=$DB_PASS \
    --outputdir=$DB_DUMP \
    --rows=500000 \
    --compress \
    --build-empty-files \
    --threads=2 \
    --compress-protocol

Mydumper输出数据的说明

Mydumper不直接指定输出的文件，而是输出到文件夹的文件中。--outputdir 选项指定要使用的目录名称。

输出分为两部分

架构

对数据库中的每个表，创建包含 CREATE TABLE 语句的文件。文件命名为：

dbname.tablename-schema.sql.gz

数据

对于每个行数多余--rows参数的表, 创建文件名字为:

dbname.tablename.0000n.sql.gz

"n"从0开始.

你可以使用Myloader恢复这些备份

    myloader \
    --database=$DB_NAME \
    --directory=$DB_DUMP \
    --queries-per-transaction=50000 \
    --threads=10 \
    --compress-protocol \
    --verbose=3

--------------------------------------------------------------------------------

via: http://www.ubuntugeek.com/mydumper-mysql-database-backup-tool.html

作者：[ruchi][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.ubuntugeek.com/author/ubuntufix