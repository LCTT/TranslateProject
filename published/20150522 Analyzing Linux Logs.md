如何分析 Linux 日志
==============================================================================
![](http://www.loggly.com/ultimate-guide/wp-content/uploads/2015/05/Linux-Copy@2x1.png)

日志中有大量的信息需要你处理，尽管有时候想要提取并非想象中的容易。在这篇文章中我们会介绍一些你现在就能做的基本日志分析例子（只需要搜索即可）。我们还将涉及一些更高级的分析，但这些需要你前期努力做出适当的设置，后期就能节省很多时间。对数据进行高级分析的例子包括生成汇总计数、对有效值进行过滤，等等。

我们首先会向你展示如何在命令行中使用多个不同的工具，然后展示了一个日志管理工具如何能自动完成大部分繁重工作从而使得日志分析变得简单。

### 用 Grep 搜索 ###

搜索文本是查找信息最基本的方式。搜索文本最常用的工具是 [grep][1]。这个命令行工具在大部分 Linux 发行版中都有，它允许你用正则表达式搜索日志。正则表达式是一种用特殊的语言写的、能识别匹配文本的模式。最简单的模式就是用引号把你想要查找的字符串括起来。

#### 正则表达式 ####

这是一个在 Ubuntu 系统的认证日志中查找 “user hoover” 的例子：

    $ grep "user hoover" /var/log/auth.log
    Accepted password for hoover from 10.0.2.2 port 4792 ssh2
    pam_unix(sshd:session): session opened for user hoover by (uid=0)
    pam_unix(sshd:session): session closed for user hoover

构建精确的正则表达式可能很难。例如，如果我们想要搜索一个类似端口 “4792” 的数字，它可能也会匹配时间戳、URL 以及其它不需要的数据。Ubuntu 中下面的例子，它匹配了一个我们不想要的 Apache 日志。

    $ grep "4792" /var/log/auth.log
    Accepted password for hoover from 10.0.2.2 port 4792 ssh2
    74.91.21.46 - - [31/Mar/2015:19:44:32 +0000] "GET /scripts/samples/search?q=4972 HTTP/1.0" 404 545 "-" "-”

#### 环绕搜索 ####

另一个有用的小技巧是你可以用 grep 做环绕搜索。这会向你展示一个匹配前面或后面几行是什么。它能帮助你调试导致错误或问题的东西。`B` 选项展示前面几行，`A` 选项展示后面几行。举个例子，我们知道当一个人以管理员员身份登录失败时，同时他们的 IP 也没有反向解析，也就意味着他们可能没有有效的域名。这非常可疑！

    $ grep -B 3 -A 2 'Invalid user' /var/log/auth.log
    Apr 28 17:06:20 ip-172-31-11-241 sshd[12545]: reverse mapping checking getaddrinfo for 216-19-2-8.commspeed.net [216.19.2.8] failed - POSSIBLE BREAK-IN ATTEMPT!
    Apr 28 17:06:20 ip-172-31-11-241 sshd[12545]: Received disconnect from 216.19.2.8: 11: Bye Bye [preauth]
    Apr 28 17:06:20 ip-172-31-11-241 sshd[12547]: Invalid user admin from 216.19.2.8
    Apr 28 17:06:20 ip-172-31-11-241 sshd[12547]: input_userauth_request: invalid user admin [preauth]
    Apr 28 17:06:20 ip-172-31-11-241 sshd[12547]: Received disconnect from 216.19.2.8: 11: Bye Bye [preauth]

#### Tail ####

你也可以把 grep 和 [tail][2] 结合使用来获取一个文件的最后几行，或者跟踪日志并实时打印。这在你做交互式更改的时候非常有用，例如启动服务器或者测试代码更改。

    $ tail -f /var/log/auth.log | grep 'Invalid user'
    Apr 30 19:49:48 ip-172-31-11-241 sshd[6512]: Invalid user ubnt from 219.140.64.136
    Apr 30 19:49:49 ip-172-31-11-241 sshd[6514]: Invalid user admin from 219.140.64.136

关于 grep 和正则表达式的详细介绍并不在本指南的范围，但 [Ryan’s Tutorials][3] 有更深入的介绍。

日志管理系统有更高的性能和更强大的搜索能力。它们通常会索引数据并进行并行查询，因此你可以很快的在几秒内就能搜索 GB 或 TB 的日志。相比之下，grep 就需要几分钟，在极端情况下可能甚至几小时。日志管理系统也使用类似 [Lucene][4] 的查询语言，它提供更简单的语法来检索数字、域以及其它。

### 用 Cut、 AWK、 和 Grok 解析 ###

#### 命令行工具 ####

Linux 提供了多个命令行工具用于文本解析和分析。当你想要快速解析少量数据时非常有用，但处理大量数据时可能需要很长时间。

#### Cut ####

[cut][5] 命令允许你从有分隔符的日志解析字段。分隔符是指能分开字段或键值对的等号或逗号等。

假设我们想从下面的日志中解析出用户：

    pam_unix(su:auth): authentication failure; logname=hoover uid=1000 euid=0 tty=/dev/pts/0 ruser=hoover rhost=  user=root

我们可以像下面这样用 cut 命令获取用等号分割后的第八个字段的文本。这是一个 Ubuntu 系统上的例子：

    $ grep "authentication failure" /var/log/auth.log | cut -d '=' -f 8
    root
    hoover
    root
    nagios
    nagios

#### AWK ####

另外，你也可以使用 [awk][6]，它能提供更强大的解析字段功能。它提供了一个脚本语言，你可以过滤出几乎任何不相干的东西。

例如，假设在 Ubuntu 系统中我们有下面的一行日志，我们想要提取登录失败的用户名称：

    Mar 24 08:28:18 ip-172-31-11-241 sshd[32701]: input_userauth_request: invalid user guest [preauth]

你可以像下面这样使用 awk 命令。首先，用一个正则表达式 /sshd.*invalid user/ 来匹配 sshd invalid user  行。然后用  { print $9 } 根据默认的分隔符空格打印第九个字段。这样就输出了用户名。

    $ awk '/sshd.*invalid user/ { print $9 }' /var/log/auth.log
    guest
    admin
    info
    test
    ubnt

你可以在 [Awk 用户指南][7] 中阅读更多关于如何使用正则表达式和输出字段的信息。

#### 日志管理系统 ####

日志管理系统使得解析变得更加简单，使用户能快速的分析很多的日志文件。他们能自动解析标准的日志格式，比如常见的 Linux 日志和 Web 服务器日志。这能节省很多时间，因为当处理系统问题的时候你不需要考虑自己写解析逻辑。

下面是一个 sshd 日志消息的例子，解析出了每个 remoteHost 和 user。这是 Loggly 中的一张截图，它是一个基于云的日志管理服务。

![](http://www.loggly.com/ultimate-guide/wp-content/uploads/2015/05/Screen-Shot-2015-03-12-at-11.25.09-AM.png)

你也可以对非标准格式自定义解析。一个常用的工具是 [Grok][8]，它用一个常见正则表达式库，可以解析原始文本为结构化 JSON。下面是一个 Grok 在 Logstash 中解析内核日志文件的事例配置：

    filter{
      grok  {
        match => {"message" => "%{CISCOTIMESTAMP:timestamp} %{HOST:host} %{WORD:program}%{NOTSPACE} %{NOTSPACE}%{NUMBER:duration}%{NOTSPACE} %{GREEDYDATA:kernel_logs}"
      }
    }

下图是 Grok 解析后输出的结果：

![](http://www.loggly.com/ultimate-guide/wp-content/uploads/2015/05/Screen-Shot-2015-03-12-at-11.30.37-AM.png)

### 用 Rsyslog 和 AWK 过滤 ###

过滤使得你能检索一个特定的字段值而不是进行全文检索。这使你的日志分析更加准确，因为它会忽略来自其它部分日志信息不需要的匹配。为了对一个字段值进行搜索，你首先需要解析日志或者至少有对事件结构进行检索的方式。

#### 如何对应用进行过滤 ####

通常，你可能只想看一个应用的日志。如果你的应用把记录都保存到一个文件中就会很容易。如果你需要在一个聚集或集中式日志中过滤一个应用就会比较复杂。下面有几种方法来实现：

1. 用 rsyslog 守护进程解析和过滤日志。下面的例子将 sshd 应用的日志写入一个名为 sshd-message 的文件，然后丢弃事件以便它不会在其它地方重复出现。你可以将它添加到你的 rsyslog.conf 文件中测试这个例子。

    	:programname, isequal, “sshd” /var/log/sshd-messages
    	&~

2. 用类似 awk 的命令行工具提取特定字段的值，例如 sshd 用户名。下面是 Ubuntu 系统中的一个例子。

    	$ awk '/sshd.*invalid user/ { print $9 }' /var/log/auth.log
    	guest
    	admin
    	info
    	test
    	ubnt

3. 用日志管理系统自动解析日志，然后在需要的应用名称上点击过滤。下面是在 Loggly 日志管理服务中提取 syslog 域的截图。我们对应用名称 “sshd” 进行过滤，如维恩图图标所示。

	![](http://www.loggly.com/ultimate-guide/wp-content/uploads/2015/05/Screen-Shot-2015-03-12-at-11.05.02-AM.png)

#### 如何过滤错误 ####

一个人最希望看到日志中的错误。不幸的是，默认的 syslog 配置不直接输出错误的严重性，也就使得难以过滤它们。

这里有两个解决该问题的方法。首先，你可以修改你的 rsyslog 配置，在日志文件中输出错误的严重性，使得便于查看和检索。在你的 rsyslog 配置中你可以用 pri-text 添加一个 [模板][9]，像下面这样：

    "<%pri-text%> : %timegenerated%,%HOSTNAME%,%syslogtag%,%msg%n"

这个例子会按照下面的格式输出。你可以看到该信息中指示错误的 err。

    <authpriv.err> : Mar 11 18:18:00,hoover-VirtualBox,su[5026]:, pam_authenticate: Authentication failure

你可以用 awk 或者 grep 检索错误信息。在 Ubuntu 中，对这个例子，我们可以用一些语法特征，例如 . 和 >，它们只会匹配这个域。

    $ grep '.err>' /var/log/auth.log
    <authpriv.err> : Mar 11 18:18:00,hoover-VirtualBox,su[5026]:, pam_authenticate: Authentication failure

你的第二个选择是使用日志管理系统。好的日志管理系统能自动解析 syslog 消息并抽取错误域。它们也允许你用简单的点击过滤日志消息中的特定错误。

下面是 Loggly 中一个截图，显示了高亮错误严重性的 syslog 域，表示我们正在过滤错误：

![](http://www.loggly.com/ultimate-guide/wp-content/uploads/2015/05/Screen-Shot-2015-03-12-at-11.00.36-AM.png)

--------------------------------------------------------------------------------

via: http://www.loggly.com/ultimate-guide/logging/analyzing-linux-logs/

作者：[Jason Skowronski][a],[Amy Echeverri][b],[ Sadequl Hussain][c]
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linkedin.com/in/jasonskowronski
[b]:https://www.linkedin.com/in/amyecheverri
[c]:https://www.linkedin.com/pub/sadequl-hussain/14/711/1a7
[1]:http://linux.die.net/man/1/grep
[2]:http://linux.die.net/man/1/tail
[3]:http://ryanstutorials.net/linuxtutorial/grep.php
[4]:https://lucene.apache.org/core/2_9_4/queryparsersyntax.html
[5]:http://linux.die.net/man/1/cut
[6]:http://linux.die.net/man/1/awk
[7]:http://www.delorie.com/gnu/docs/gawk/gawk_26.html#IDX155
[8]:http://logstash.net/docs/1.4.2/filters/grok
[9]:http://www.rsyslog.com/doc/v8-stable/configuration/templates.html
