[#]: subject: (Query your Linux operating system like a database)
[#]: via: (https://opensource.com/article/21/6/osquery-linux)
[#]: author: (Gaurav Kamathe https://opensource.com/users/gkamathe)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Query your Linux operating system like a database
======
Use database-style queries to get system information easily.
![Magnifying glass on code][1]

Linux offers a lot of commands to help users gather information about their host operating system: listing files or directories to check attributes; querying to see what packages are installed, processes are running, and services start at boot; or learning about the system's hardware.

Each command uses its own output format to list this information. You need to use tools like `grep`, `sed`, and `awk` to filter the results to find specific information. Also, a lot of this information changes frequently, leading to changes in the system's state.

It would be helpful to view all of this information formatted like the output of a database SQL query. Imagine that you could query the output of the `ps` and `rpm` commands as if you were querying an SQL database table with similar names.

Fortunately, there is a tool that does just that and much more: [Osquery][2] is an [open source][3] "SQL powered operating system instrumentation, monitoring, and analytics framework."

Many applications that handle security, DevOps, compliance, and inventory management (to name a few) depend upon the core functionalities provided by Osquery at their heart.

### Install Osquery

Osquery is available for Linux, macOS, Windows, and FreeBSD. Install the latest version for your operating system by following its [installation instructions][4]. (I'll use version 4.7.0 in these examples.)

After installation, verify it's working:


```
$ rpm -qa | grep osquery
osquery-4.7.0-1.linux.x86_64
$
$ osqueryi --version
osqueryi version 4.7.0
$
```

### Osquery components

Osquery has two main components:

  * **osqueri** is an interactive SQL query console. It is a standalone utility that does not need super-user privileges (unless you are querying tables that need that level of access).
  * **osqueryd** is like a monitoring daemon for the host it is installed on. This daemon can schedule queries to execute at regular intervals to gather information from the infrastructure.



You can run the osqueri utility without having the osqueryd daemon running. Another utility, **osqueryctl**, controls starting, stopping, and checking the status of the daemon.


```
$ rpm -ql osquery-4.8.0-1.linux.x86_64 | grep bin
/usr/bin/osqueryctl
/usr/bin/osqueryd
/usr/bin/osqueryi
$
```

### Use the osqueryi interactive prompt

You interact with Osquery much like you would use an SQL database. In fact, osqueryi is a modified version of the SQLite shell. Running the `osqueryi` command drops you into an interactive shell where you can run commands specific to Osquery, which often start with a `.`:


```
$ osqueryi
Using a virtual database. Need help, type '.help'
osquery&gt;
```

To quit the interactive shell, run the `.quit` command to get back to the operating system's shell:


```
osquery&gt;
osquery&gt; .quit
$
```

### Find out what tables are available

As mentioned, Osquery makes data available as the output of SQL queries. Information in databases is often saved in tables. But how can you query these tables if you don't know their names? Well, you can run the `.tables` command to list all the tables that you can query. If you are a long-time Linux user or a sysadmin, the table names will be familiar, as you have been using operating system commands to get this information:


```
osquery&gt; .tables
  =&gt; acpi_tables
  =&gt; apparmor_events
  =&gt; apparmor_profiles
  =&gt; apt_sources

&lt;&lt; snip &gt;&gt;

  =&gt; arp_cache
  =&gt; user_ssh_keys
  =&gt; users
  =&gt; yara
  =&gt; yara_events
  =&gt; ycloud_instance_metadata
  =&gt; yum_sources
osquery&gt;
```

### Check the schema for individual tables

Now that you know the table names, you can see what information each table provides. As an example, choose `processes`, since the `ps` command is used quite often to get this information. Run the `.schema` command followed by the table name to see what information is saved in this table. If you want to check the results, you could quickly run `ps -ef` or `ps aux` and compare the output with the contents of the table:


```
osquery&gt; .schema processes
CREATE TABLE processes(`pid` BIGINT, `name` TEXT, `path` TEXT, `cmdline` TEXT, `state` TEXT, `cwd` TEXT, `root` TEXT, `uid` BIGINT, `gid` BIGINT, `euid` BIGINT, `egid` BIGINT, `suid` BIGINT, `sgid` BIGINT, `on_disk` INTEGER, `wired_size` BIGINT, `resident_size` BIGINT, `total_size` BIGINT, `user_time` BIGINT, `system_time` BIGINT, `disk_bytes_read` BIGINT, `disk_bytes_written` BIGINT, `start_time` BIGINT, `parent` BIGINT, `pgroup` BIGINT, `threads` INTEGER, `nice` INTEGER, `is_elevated_token` INTEGER HIDDEN, `elapsed_time` BIGINT HIDDEN, `handle_count` BIGINT HIDDEN, `percent_processor_time` BIGINT HIDDEN, `upid` BIGINT HIDDEN, `uppid` BIGINT HIDDEN, `cpu_type` INTEGER HIDDEN, `cpu_subtype` INTEGER HIDDEN, `phys_footprint` BIGINT HIDDEN, PRIMARY KEY (`pid`)) WITHOUT ROWID;
osquery&gt;
```

To drive home the point, use the following command to see the schema for the RPM packages and compare the information with `rpm -qa` and `rpm -qi` operating system commands:


```
osquery&gt;
osquery&gt; .schema rpm_packages
CREATE TABLE rpm_packages(`name` TEXT, `version` TEXT, `release` TEXT, `source` TEXT, `size` BIGINT, `sha1` TEXT, `arch` TEXT, `epoch` INTEGER, `install_time` INTEGER, `vendor` TEXT, `package_group` TEXT, `pid_with_namespace` INTEGER HIDDEN, `mount_namespace_id` TEXT HIDDEN, PRIMARY KEY (`name`, `version`, `release`, `arch`, `epoch`, `pid_with_namespace`)) WITHOUT ROWID;
osquery&gt;
```

You learn more in Osquery's [tables documentation][5].

### Use the PRAGMA command

In case that schema information is too cryptic for you, there is another way to print the table information in a verbose, tabular format: the `PRAGMA` command. For example, I'll use `PRAGMA` to see information for the `rpm_packages` table in a nice format:


```
`osquery> PRAGMA table_info(rpm_packages);`
```

One benefit of this tabular information is that you can focus on the field you want to query and see the type of information that it provides:


```
osquery&gt; PRAGMA table_info(users);
+-----+-------------+--------+---------+------------+----+
| cid | name        | type   | notnull | dflt_value | pk |
+-----+-------------+--------+---------+------------+----+
| 0   | uid         | BIGINT | 1       |            | 1  |
| 1   | gid         | BIGINT | 0       |            | 0  |
| 2   | uid_signed  | BIGINT | 0       |            | 0  |
| 3   | gid_signed  | BIGINT | 0       |            | 0  |
| 4   | username    | TEXT   | 1       |            | 2  |
| 5   | description | TEXT   | 0       |            | 0  |
| 6   | directory   | TEXT   | 0       |            | 0  |
| 7   | shell       | TEXT   | 0       |            | 0  |
| 8   | uuid        | TEXT   | 1       |            | 3  |
+-----+-------------+--------+---------+------------+----+
osquery&gt;
```

### Run your first query

Now that you have all the required information from the table, the schema, and the items to query, run your first SQL query to view the information. The query below returns the users that are present on the system and each one's user ID, group ID, home directory, and default shell. Linux users could get this information by viewing the contents of the `/etc/passwd` file and doing some `grep`, `sed`, and `awk` magic.


```
osquery&gt;
osquery&gt; select uid,gid,directory,shell,uuid FROM users LIMIT 7;
+-----+-----+----------------+----------------+------+
| uid | gid | directory      | shell          | uuid |
+-----+-----+----------------+----------------+------+
| 0   | 0   | /root          | /bin/bash      |      |
| 1   | 1   | /bin           | /sbin/nologin  |      |
| 2   | 2   | /sbin          | /sbin/nologin  |      |
| 3   | 4   | /var/adm       | /sbin/nologin  |      |
| 4   | 7   | /var/spool/lpd | /sbin/nologin  |      |
| 5   | 0   | /sbin          | /bin/sync      |      |
| 6   | 0   | /sbin          | /sbin/shutdown |      |
+-----+-----+----------------+----------------+------+
osquery&gt;
```

### Run queries without entering interactive mode

What if you want to run a query without entering the osqueri interactive mode? This could be very useful if you are writing shell scripts around it. In this case, you could `echo` the SQL query and pipe it to osqueri right from the Bash shell:


```
$ echo "select uid,gid,directory,shell,uuid FROM users LIMIT 7;" | osqueryi
+-----+-----+----------------+----------------+------+
| uid | gid | directory      | shell          | uuid |
+-----+-----+----------------+----------------+------+
| 0   | 0   | /root          | /bin/bash      |      |
| 1   | 1   | /bin           | /sbin/nologin  |      |
| 2   | 2   | /sbin          | /sbin/nologin  |      |
| 3   | 4   | /var/adm       | /sbin/nologin  |      |
| 4   | 7   | /var/spool/lpd | /sbin/nologin  |      |
| 5   | 0   | /sbin          | /bin/sync      |      |
| 6   | 0   | /sbin          | /sbin/shutdown |      |
+-----+-----+----------------+----------------+------+
$
```

### Learn what services start when booting up

Osquery can also return all the services set to start at boot. For example, to query the `startup_items` table and get the name, status, and path of the first five services that run at startup:


```
osquery&gt; SELECT name,type,status,path FROM startup_items LIMIT 5;
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
osquery&gt;
```

### Look up ELF information for a binary

Imagine you want to find out more details about the `ls` binary. Usually, you would do it with the `readelf -h` command followed by the `ls` command's path. You can query the `elf_info` table with Osquery and get the same information:


```
osquery&gt; SELECT * FROM elf_info WHERE path="/bin/ls";
      class = 64
        abi = sysv
abi_version = 0
       type = dyn
    machine = 62
    version = 1
      entry = 24064
      flags = 0
       path = /bin/ls
osquery&gt;
```

Now you have a taste of how to use osqueri to look for information of interest to you. However, this information is stored on a huge number of tables; one system I queried had 156 different tables, which can be overwhelming:


```
$ echo ".tables" | osqueryi | wc -l
156
$
```

To make things easier, you can start with these tables to get information about your Linux system:

**System information table**


```
`osquery> select * from system_info;`
```

**System limit information**


```
`osquery> select * from ulimit_info;`
```

**Files opened by various processes**


```
`osquery> select * from process_open_files;`
```

**Open ports on a system**


```
`osquery> select * from listening_ports;`
```

**Running processes information**


```
`osquery> select * from processes;`
```

**Installed packages information**


```
`osquery> select * from rpm_packages;`
```

**User login information**


```
`osquery> select * from last;`
```

**System log information**


```
`osquery> select * from syslog_events;`
```

### Learn more

Osquery is a powerful tool that provides a lot of host information that can be used to solve various use cases. You can learn more about Osquery by [reading its documentation][6].

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/osquery-linux

作者：[Gaurav Kamathe][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gkamathe
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/find-file-linux-code_magnifying_glass_zero.png?itok=E2HoPDg0 (Magnifying glass on code)
[2]: https://osquery.io/
[3]: https://github.com/osquery/osquery
[4]: https://osquery.io/downloads/official
[5]: https://osquery.io/schema/4.8.0/
[6]: https://osquery.readthedocs.io/en/latest/
