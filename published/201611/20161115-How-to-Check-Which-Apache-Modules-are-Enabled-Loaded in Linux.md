如何使用 Apache 控制命令检查它的模块是否已经启用或加载
============================================================

本篇中，我们会简要地讨论 Apache 服务器前端以及如何列出或查看已经启用的 Apache 模块。

Apache 基于模块化的理念而构建，这样就可以让 web 管理员添加不同的模块来扩展主要的功能及[增强性能][5]。

常见的 Apache 模块有：

1. mod_ssl – 提供了 [HTTPS 功能][1]。
2. mod_rewrite – 可以用正则表达式匹配 url 样式，并且使用 [.htaccess 技巧][2]来进行透明转发，或者提供 HTTP 状态码回应。
3. mod_security – 用于[保护 Apache 免于暴力破解或者 DDoS 攻击][3]。
4. mod_status - 用于[监测 Apache 的负载及页面统计][4]。

在 Linux 中 `apachectl` 或者 `apache2ctl`用于控制 Apache 服务器，是 Apache 的前端。

你可以用下面的命令显示 `apache2ctl` 的使用信息：

```
$ apache2ctl help
或者
$ apachectl help
```
```
Usage: /usr/sbin/httpd [-D name] [-d directory] [-f file]
                       [-C "directive"] [-c "directive"]
                       [-k start|restart|graceful|graceful-stop|stop]
                       [-v] [-V] [-h] [-l] [-L] [-t] [-S]
Options:
  -D name            : define a name for use in  directives
  -d directory       : specify an alternate initial ServerRoot
  -f file            : specify an alternate ServerConfigFile
  -C "directive"     : process directive before reading config files
  -c "directive"     : process directive after reading config files
  -e level           : show startup errors of level (see LogLevel)
  -E file            : log startup errors to file
  -v                 : show version number
  -V                 : show compile settings
  -h                 : list available command line options (this page)
  -l                 : list compiled in modules
  -L                 : list available configuration directives
  -t -D DUMP_VHOSTS  : show parsed settings (currently only vhost settings)
  -S                 : a synonym for -t -D DUMP_VHOSTS
  -t -D DUMP_MODULES : show all loaded modules 
  -M                 : a synonym for -t -D DUMP_MODULES
  -t                 : run syntax check for config files
```
`apache2ctl` 可以工作在两种模式下，SysV init 模式和直通模式。在 SysV init 模式下，`apache2ctl` 用如下的简单的单命令形式：

```
$ apachectl command
或者
$ apache2ctl command
```

比如要启动并检查它的状态，运行这两个命令。如果你是普通用户，使用 [sudo 命令][6]来以 root 用户权限来运行：

```
$ sudo apache2ctl start
$ sudo apache2ctl status
```
```
tecmint@TecMint ~ $ sudo apache2ctl start
AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 127.0.1.1\. Set the 'ServerName' directive globally to suppress this message
httpd (pid 1456) already running
tecmint@TecMint ~ $ sudo apache2ctl status
Apache Server Status for localhost (via 127.0.0.1)

Server Version: Apache/2.4.18 (Ubuntu)
Server MPM: prefork
Server Built: 2016-07-14T12:32:26

-------------------------------------------------------------------------------

Current Time: Tuesday, 15-Nov-2016 11:47:28 IST
Restart Time: Tuesday, 15-Nov-2016 10:21:46 IST
Parent Server Config. Generation: 2
Parent Server MPM Generation: 1
Server uptime: 1 hour 25 minutes 41 seconds
Server load: 0.97 0.94 0.77
Total accesses: 2 - Total Traffic: 3 kB
CPU Usage: u0 s0 cu0 cs0
.000389 requests/sec - 0 B/second - 1536 B/request
1 requests currently being processed, 4 idle workers

__W__...........................................................
................................................................
......................

Scoreboard Key:
"_" Waiting for Connection, "S" Starting up, "R" Reading Request,
"W" Sending Reply, "K" Keepalive (read), "D" DNS Lookup,
"C" Closing connection, "L" Logging, "G" Gracefully finishing,
"I" Idle cleanup of worker, "." Open slot with no current process
```

当在直通模式下，`apache2ctl` 可以用下面的语法带上所有 Apache 的参数：

```
$ apachectl [apache-argument]
$ apache2ctl [apache-argument]
```

可以用下面的命令列出所有的 Apache 参数：

```
$ apache2 help    [在基于Debian的系统中]
$ httpd help      [在RHEL的系统中]
```

### 检查启用的 Apache 模块

因此，为了检测你的 Apache 服务器启动了哪些模块，在你的发行版中运行适当的命令，`-t -D DUMP_MODULES` 是一个用于显示所有启用的模块的 Apache 参数：

```
---------------  在基于 Debian 的系统中 --------------- 
$ apache2ctl -t -D DUMP_MODULES   
或者 
$ apache2ctl -M
```

```
---------------  在 RHEL 的系统中 --------------- 
$ apachectl -t -D DUMP_MODULES   
或者 
$ httpd -M
$ apache2ctl -M
```

```
[root@tecmint httpd]# apachectl -M
Loaded Modules:
 core_module (static)
 mpm_prefork_module (static)
 http_module (static)
 so_module (static)
 auth_basic_module (shared)
 auth_digest_module (shared)
 authn_file_module (shared)
 authn_alias_module (shared)
 authn_anon_module (shared)
 authn_dbm_module (shared)
 authn_default_module (shared)
 authz_host_module (shared)
 authz_user_module (shared)
 authz_owner_module (shared)
 authz_groupfile_module (shared)
 authz_dbm_module (shared)
 authz_default_module (shared)
 ldap_module (shared)
 authnz_ldap_module (shared)
 include_module (shared)
....
```

就是这样！在这篇简单的教程中，我们解释了如何使用 Apache 前端工具来列出启动的 apache 模块。记住你可以在下面的反馈表中给我们留下你的问题或者留言。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/check-apache-modules-enabled

作者：[Aaron Kili][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/install-lets-encrypt-ssl-certificate-to-secure-apache-on-rhel-centos/
[2]:http://www.tecmint.com/apache-htaccess-tricks/
[3]:http://www.tecmint.com/protect-apache-using-mod_security-and-mod_evasive-on-rhel-centos-fedora/
[4]:http://www.tecmint.com/monitor-apache-web-server-load-and-page-statistics/
[5]:http://www.tecmint.com/apache-performance-tuning/
[6]:http://www.tecmint.com/su-vs-sudo-and-how-to-configure-sudo-in-linux/


