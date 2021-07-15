[#]: subject: (Query your Linux operating system like a database)
[#]: via: (https://opensource.com/article/21/6/osquery-linux)
[#]: author: (Gaurav Kamathe https://opensource.com/users/gkamathe)
[#]: collector: (lujun9972)
[#]: translator: (YungeG)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13578-1.html)

像查询数据库一样查询你的 Linux 操作系统信息
======

> 使用数据库查询操作轻松获取系统信息。

![](https://img.linux.net.cn/data/attachment/album/202107/14/095820zywm2m2tzz5otfh5.jpg)

Linux 提供了很多帮助用户收集主机操作系统信息的命令：列出文件或者目录的属性信息；查询安装的软件包、正在执行的命令、开机时启动的服务；或者了解系统的硬件。

每个命令使用自己的输出格式列出系统的信息。你需要使用 `grep`、`sed`、`awk` 这样的工具过滤命令输出的结果，以便找到特定的信息。此外，很多这样的信息会频繁变动，导致系统状态的改变。

将所有的信息格式化为一个数据库的 SQL 查询的输出进行查看将会十分有益。想象一下，你能够像查询具有类似名称的 SQL 数据库表一样查询 `ps` 和 `rpm` 命令的输出。

幸运的是，有一个工具刚好实现了这个功能，而且功能更多：[Osquery][2] 是一个 [开源的][3] “由 SQL 驱动的操作系统仪表、监控和分析框架”。

许多处理安全、DevOps、合规性的应用，以及仓储管理管理（仅举几例）在内部依赖 Osquery 提供的核心功能。

### 安装 Osquery

Osquery 适用于 Linux、macOS、Windows、FreeBSD。请按照 [指南][4] 为你的操作系统安装最新版本。（我会在下面的例子中使用 4.7.0 版本。）

安装完成后，确保 Osquery 可以工作：

```
$ rpm -qa | grep osquery
osquery-4.7.0-1.linux.x86_64
$
$ osqueryi --version
osqueryi version 4.7.0
$
```

### Osquery 组件

Osquery 有两个主要组件：

* `osqueri` 是一个交互式的 SQL 查询控制台，可以独立运行，不需要超级用户权限（除非要查询的表格需要访问权限）。
* `osqueryd` 像一个安装在主机的监控守护进程，可以定期调度查询操作执行，从底层架构收集信息。

可以在不运行 `osqueryd` 的情况下执行 `osqueri`。另一个工具，`osqueryctl`，控制守护进程的启动、停止，并检查其状态。

```
$ rpm -ql osquery-4.8.0-1.linux.x86_64 | grep bin
/usr/bin/osqueryctl
/usr/bin/osqueryd
/usr/bin/osqueryi
$
```

### 使用 osqueryi 交互式命令提示符

你和 Osquery 的交互与使用 SQL 数据库十分相似。事实上，`osqueryi` 是 SQList shell 的一个修改版。执行 `osqueryi` 命令进入交互式命令提示符 ，就可以执行 Osquery 的命令，通常以 `.` 开始：

```
$ osqueryi
Using a virtual database. Need help, type '.help'
osquery>
```

要退出交互式命令提示符，执行 `.quit` 命令回到操作系统的命令提示符：

```
osquery>
osquery> .quit
$
```

### 找出可用的表

如前所述，Osquery 像 SQL 查询一样输出数据，数据库中的信息通常保存在表中。但是如何在不知道表名的情况下查询这些表呢？你可以运行 `.tables` 命令列出所有可以查询的表。如果你是一个 Linux 长期用户或者一个系统管理员 ，就会对表名十分熟悉，因为你一直在使用操作系统命令获取同样的信息：

```
osquery> .tables
  => acpi_tables
  => apparmor_events
  => apparmor_profiles
  => apt_sources

<<裁剪>>

  => arp_cache
  => user_ssh_keys
  => users
  => yara
  => yara_events
  => ycloud_instance_metadata
  => yum_sources
osquery>
```

### 检查各个表的模式

知道表名后，可以查看每个表提供的信息。既然 `ps` 命令经常用于获取进程信息，就以 `processes` 为例。执行 `.schema` 命令加上表名查看表中保存的信息。如果要验证命令返回的结果，可以快速执行 `ps -ef` 或 `ps aux`，对比命令的输出和表中的内容：

```
osquery> .schema processes
CREATE TABLE processes(`pid` BIGINT, `name` TEXT, `path` TEXT, `cmdline` TEXT, `state` TEXT, `cwd` TEXT, `root` TEXT, `uid` BIGINT, `gid` BIGINT, `euid` BIGINT, `egid` BIGINT, `suid` BIGINT, `sgid` BIGINT, `on_disk` INTEGER, `wired_size` BIGINT, `resident_size` BIGINT, `total_size` BIGINT, `user_time` BIGINT, `system_time` BIGINT, `disk_bytes_read` BIGINT, `disk_bytes_written` BIGINT, `start_time` BIGINT, `parent` BIGINT, `pgroup` BIGINT, `threads` INTEGER, `nice` INTEGER, `is_elevated_token` INTEGER HIDDEN, `elapsed_time` BIGINT HIDDEN, `handle_count` BIGINT HIDDEN, `percent_processor_time` BIGINT HIDDEN, `upid` BIGINT HIDDEN, `uppid` BIGINT HIDDEN, `cpu_type` INTEGER HIDDEN, `cpu_subtype` INTEGER HIDDEN, `phys_footprint` BIGINT HIDDEN, PRIMARY KEY (`pid`)) WITHOUT ROWID;
osquery>
```

要进一步确认，可以使用下面的命令查看 RPM 包的结构信息，然后与操作系统命令 `rpm -qa` 和 `rpm -qi` 的输出比较：

```
osquery>
osquery> .schema rpm_packages
CREATE TABLE rpm_packages(`name` TEXT, `version` TEXT, `release` TEXT, `source` TEXT, `size` BIGINT, `sha1` TEXT, `arch` TEXT, `epoch` INTEGER, `install_time` INTEGER, `vendor` TEXT, `package_group` TEXT, `pid_with_namespace` INTEGER HIDDEN, `mount_namespace_id` TEXT HIDDEN, PRIMARY KEY (`name`, `version`, `release`, `arch`, `epoch`, `pid_with_namespace`)) WITHOUT ROWID;
osquery>
```

从 Osquery 的 [表格文档][5] 获取更多信息。

### 使用 PRAGMA 命令

或许模式信息对你来说太难看懂，还有另一种途径能够以详细的表格格式打印表中的信息：`PRAGMA` 命令。例如，我想通过 `PRAGMA` 用一种易于理解的格式查看 `rpm_packages` 表的信息：

```
osquery> PRAGMA table_info(rpm_packages);
```

这种表格式信息的一个好处是你可以关注想要查询的字段，查看命令提供的类型信息：

```
osquery> PRAGMA table_info(users);
+-----+-------------+--------+---------+------------+----+
| cid | name        | type   | notnull | dflt_value | pk |
+-----+-------------+--------+---------+------------+----+
| 0   | uid         | BIGINT | 1       |            | 1  |
| 1   | gid         | BIGINT | 0       |            | 0  |
| 2   | uid_signed  | BIGINT | 0       |            | 0  |
| 3   | gid_signed  | BIGINT | 0       |            | 0  |
| 4   | username    | TEXT   | 1       |            | 2  |
| 5   | description | TEXT   | 0       |            | 0  |
| 6   | directory   | TEXT   | 0       |            | 0  |
| 7   | shell       | TEXT   | 0       |            | 0  |
| 8   | uuid        | TEXT   | 1       |            | 3  |
+-----+-------------+--------+---------+------------+----+
osquery>
```

### 进行你的第一次查询

在你从表、模式、条目中获取到所有进行查询所需要的信息后，进行你的第一次 SQL 查询查看其中的信息。下面的查询返回系统中的用户和每个用户的用户 ID、组 ID、主目录和默认的命令行解释器。Linux 用户通过查看 `/etc/passwd` 文件的内容并执行 `grep`、`sed`、`awk` 命令获取同样的信息。

```
osquery>
osquery> select uid,gid,directory,shell,uuid FROM users LIMIT 7;
+-----+-----+----------------+----------------+------+
| uid | gid | directory      | shell          | uuid |
+-----+-----+----------------+----------------+------+
| 0   | 0   | /root          | /bin/bash      |      |
| 1   | 1   | /bin           | /sbin/nologin  |      |
| 2   | 2   | /sbin          | /sbin/nologin  |      |
| 3   | 4   | /var/adm       | /sbin/nologin  |      |
| 4   | 7   | /var/spool/lpd | /sbin/nologin  |      |
| 5   | 0   | /sbin          | /bin/sync      |      |
| 6   | 0   | /sbin          | /sbin/shutdown |      |
+-----+-----+----------------+----------------+------+
osquery>
```

### 不进入交互模式的查询

如果你想要在不进入 `osqueri` 交互模式的情况下进行查询，该怎么办？要用查询操作写命令行解释器脚本，这种方式可能十分有用。这种情况下，可以直接从 Bash 解释器 `echo` SQL 查询，通过管道输出到 `osqueri` ：

```
$ echo "select uid,gid,directory,shell,uuid FROM users LIMIT 7;" | osqueryi
+-----+-----+----------------+----------------+------+
| uid | gid | directory      | shell          | uuid |
+-----+-----+----------------+----------------+------+
| 0   | 0   | /root          | /bin/bash      |      |
| 1   | 1   | /bin           | /sbin/nologin  |      |
| 2   | 2   | /sbin          | /sbin/nologin  |      |
| 3   | 4   | /var/adm       | /sbin/nologin  |      |
| 4   | 7   | /var/spool/lpd | /sbin/nologin  |      |
| 5   | 0   | /sbin          | /bin/sync      |      |
| 6   | 0   | /sbin          | /sbin/shutdown |      |
+-----+-----+----------------+----------------+------+
$
```

### 获悉系统启动时开始的服务

Osquery 还可以列出系统启动时开始的所有服务。例如，可以查询 `startup_items` 表获取启动时开始的前五项服务的名称、状态和路径：

```
osquery> SELECT name,type,status,path FROM startup_items LIMIT 5;
  name = README
  type = Startup Item
status = enabled
  path = /etc/rc.d/init.d/README

  name = anamon
  type = Startup Item
status = enabled
  path = /etc/rc.d/init.d/anamon

  name = functions
  type = Startup Item
status = enabled
  path = /etc/rc.d/init.d/functions

  name = osqueryd
  type = Startup Item
status = enabled
  path = /etc/rc.d/init.d/osqueryd

  name = AT-SPI D-Bus Bus
  type = Startup Item
status = enabled
  path = /usr/libexec/at-spi-bus-launcher --launch-immediately
osquery>
```

### 查阅二进制文件的 ELF 信息

假如你想要弄清 `ls` 二进制文件的更多细节，通常会通过 `readelf -h` 命令，加上 `ls` 命令的路径。查询 Osquery 的 `elf_info` 表你可以得到同样的信息：

```
osquery> SELECT * FROM elf_info WHERE path="/bin/ls";
      class = 64
        abi = sysv
abi_version = 0
       type = dyn
    machine = 62
    version = 1
      entry = 24064
      flags = 0
       path = /bin/ls
osquery>
```

现在你应该初步了解如何使用 `osqueri` 查询自己想要的信息。然而，这些信息保存在数量巨大的表中；我查询过的一个系统中，有 156 个不同的表，这个数字可能是十分惊人的：

```
$ echo ".tables" | osqueryi | wc -l
156
$
```

要让事情变得更容易，可以从这些表开始获取你的 Linux 系统的信息：

**系统信息表：**

```
osquery> select * from system_info;
```

**系统限制信息：**

```
osquery> select * from ulimit_info;
```

**由各种进程打开的文件：**

```
osquery> select * from process_open_files;
```

**系统上开放的端口：**

```
osquery> select * from listening_ports;
```

**运行中的进程信息：**

```
osquery> select * from processes;
```

**已安装的包信息：**

```
osquery> select * from rpm_packages;
```

**用户登录信息：**

```
osquery> select * from last;
```

**系统日志信息：**

```
osquery> select * from syslog_events;
```

### 了解更多

Osquery 是一个强大的工具，提供了许多可以用于解决各种使用案例的主机信息。你可以阅读 [文档][6] 了解更多 Osquery 的信息。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/osquery-linux

作者：[Gaurav Kamathe][a]
选题：[lujun9972][b]
译者：[YungeG](https://github.com/YungeG)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gkamathe
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/find-file-linux-code_magnifying_glass_zero.png?itok=E2HoPDg0 (Magnifying glass on code)
[2]: https://osquery.io/
[3]: https://github.com/osquery/osquery
[4]: https://osquery.io/downloads/official
[5]: https://osquery.io/schema/4.8.0/
[6]: https://osquery.readthedocs.io/en/latest/
