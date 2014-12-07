使用 utmpdump 监控 CentOS 用户登录历史
================================================================================
保留、维护和分析日志（如某个特定时期内发生过的，或正在发生的帐号事件），是Linux系统管理员最基础和最重要的任务之一。对于用户管理，检查用户的登入和登出日志（不管是失败的，还是成功的）可以让我们对任何潜在的安全隐患或未经授权使用系统的情况保持警惕。例如，工作时间之外或放假期间的来自未知IP地址或帐号的远程登录应当发出红色警报。

在CentOS系统上，用户登录历史存储在以下这些文件中：

- /var/run/utmp（用于记录当前打开的会话）被who和w工具用来记录当前有谁登录以及他们正在做什么，而uptime用来记录系统启动时间。
- /var/log/wtmp （用于存储系统连接历史记录）被last工具用来记录最后登录的用户的列表。
- /var/log/btmp（记录失败的登录尝试）被lastb工具用来记录最后失败的登录尝试的列表。

![](https://farm4.staticflickr.com/3871/15106743340_bd13fcfe1c_o.png)

在本文中，我将介绍如何使用utmpdump，这个小程序来自sysvinit-tools包，可以用于转储二进制日志文件到文本格式的文件以便检查。此工具默认在CentOS 6和7系列上可用。utmpdump收集到的信息比先前提到过的工具的输出要更全面，这让它成为一个胜任该工作的很不错的工具。除此之外，utmpdump可以用于修改utmp或wtmp。如果你想要修复二进制日志中的任何损坏条目，它会很有用（LCTT 译注：我怎么觉得这像是做坏事的前奏？）。

### Utmpdump的使用及其输出说明 ###

正如我们之前提到的，这些日志文件，与我们大多数人熟悉的其它日志相比（如/var/log/messages，/var/log/cron，/var/log/maillog），是以二进制格式存储的，因而我们不能使用像less或more这样的文件命令来查看它们的内容。所以，utmpdump的出现拯救了世界。

为了要显示/var/run/utmp的内容，请运行以下命令：

    # utmpdump /var/run/utmp 

![](https://farm6.staticflickr.com/5595/15106696599_60134e3488_z.jpg)

同样要显示/var/log/wtmp的内容：

    # utmpdump /var/log/wtmp 

![](https://farm6.staticflickr.com/5591/15106868718_6321c6ff11_z.jpg)

最后，对于/var/log/btmp：

    # utmpdump /var/log/btmp 

![](https://farm6.staticflickr.com/5562/15293066352_c40bc98ca4_z.jpg)

正如你所能看到的，三种情况下的输出结果是一样的，除了utmp和btmp的记录是按时间排序，而wtmp的顺序是颠倒的这个原因外（LCTT 译注：此处原文有误，实际上都是按照时间顺序排列的）。

每个日志行格式化成了多列，说明如下。第一个字段显示了会话识别符，而第二个字段则是PID。第三个字段可以是以下值：--（表示运行等级改变或系统重启），bw（启动守候进程），数字（表示TTY编号），或者字符和数字（表示伪终端）。第四个字段可以为空或用户名、重启或运行级别。第五个字段是主TTY或PTY（伪终端），如果此信息可获得的话。第六个字段是远程主机名（如果是本地登录，该字段为空，运行级别信息除外，它会返回内核版本）。第七个字段是远程系统的IP地址（如果是本地登录，该字段为0.0.0.0）。如果没有提供DNS解析，第六和第七字段会显示相同的信息（远程系统的IP地址）。最后一个（第八）字段指明了该记录创建的日期和时间。

### Utmpdump使用样例 ###

下面提供了一些utmpdump的简单使用情况。

1、 检查8月18日到9月17日之间某个特定用户（如gacanepa）的登录次数。

    # utmpdump /var/log/wtmp | grep gacanepa 

![](https://farm4.staticflickr.com/3857/15293066362_fb2dd566df_z.jpg)

如果你需要回顾先前日期的登录信息，你可以检查/var/log下的wtmp-YYYYMMDD（或wtmp.[1...N]）和btmp-YYYYMMDD（或btmp.[1...N]）文件，这些是由[logrotate][1]生成的旧wtmp和btmp的归档文件。

2、 统计来自IP地址192.168.0.101的登录次数。

    # utmpdump /var/log/wtmp | grep 192.168.0.101 

![](https://farm4.staticflickr.com/3842/15106743480_55ce84c9fd_z.jpg)

3、 显示失败的登录尝试。

    # utmpdump /var/log/btmp 

![](https://farm4.staticflickr.com/3858/15293065292_e1d2562206_z.jpg)

在/var/log/btmp输出中，每个日志行都与一个失败的登录尝试相关（如使用不正确的密码，或者一个不存在的用户ID）。上面图片中高亮部分显示了使用不存在的用户ID登录，这警告你有人尝试猜测常用帐号名来闯入系统。这在使用tty1的情况下是个极其严重的问题，因为这意味着某人对你机器上的终端具有访问权限（该检查一下谁拿到了进入你数据中心的钥匙了，也许吧？）

4、 显示每个用户会话的登入和登出信息

    # utmpdump /var/log/wtmp 

![](https://farm4.staticflickr.com/3835/15293065312_c762360791_z.jpg)

在/var/logwtmp中，一次新的登录事件的特征是，第一个字段为‘7’，第三个字段是一个终端编号（或伪终端id），第四个字段为用户名。相关的登出事件会在第一个字段显示‘8’，第二个字段显示与登录一样的PID，而终端编号字段空白。例如，仔细观察上面图片中PID 1463的行。

- 在 [Fri Sep 19 11:57:40 2014 ART]，TTY1上显示登录提示符。
- 在 [Fri Sep 19 12:04:21 2014 ART]，用户 root 登入。
- 在 [Fri Sep 19 12:07:24 2014 ART]，用户 root 登出。

旁注：第四个字段的LOGIN意味着出现了一次登录到第五字段指定的终端的提示。

到目前为止，我介绍一些有点琐碎的例子。你可以将utmpdump和其它一些文本处理工具，如awk、sed、grep或cut组合，来产生过滤和加强的输出。

例如，你可以使用以下命令来列出某个特定用户（如gacanepa）的所有登录事件，并发送输出结果到.csv文件，它可以用像LibreOffice Calc或Microsoft Excel之类的文字或工作簿应用程序打开查看。让我们只显示PID、用户名、IP地址和时间戳：

     # utmpdump /var/log/wtmp | grep -E "\[7].*gacanepa" | awk -v OFS="," 'BEGIN {FS="] "}; {print $2,$4,$7,$8}' | sed -e 's/\[//g' -e 's/\]//g' 

![](https://farm4.staticflickr.com/3851/15293065352_91e1c1e4b6_z.jpg)

就像上面图片中三个高亮区域描绘的那样，过滤逻辑操作是由三个管道步骤组成的。第一步用于查找由用户gacanepa触发的登录事件（[7]）；第二步和第三部用于选择期望的字段，移除utmpdump输出的方括号并设置输出字段分隔符为逗号。

当然，如果你想要在以后打开来看，你需要重定向上面的命令输出到文件（添加“>[文件名].csv”到命令后面）。

![](https://farm4.staticflickr.com/3889/15106867768_0e37881a25_z.jpg)

在更为复杂的例子中，如果你想要知道在特定时间内哪些用户（在/etc/passwd中列出）没有登录，你可以从/etc/passwd中提取用户名，然后运行grep命令来获取/var/log/wtmp输出中对应用户的列表。就像你看到的那样，有着无限可能。

在进行总结之前，让我们简要地展示一下utmpdump的另外一种使用情况：修改utmp或wtmp。由于这些都是二进制日志文件，你不能像编辑文件一样来编辑它们。取而代之是，你可以将其内容输出成为文本格式，并修改文本输出内容，然后将修改后的内容导入回二进制日志中。如下：

    # utmpdump /var/log/utmp > tmp_output
    <使用文本编辑器修改 tmp_output>
    # utmpdump -r tmp_output > /var/log/utmp 

这在你想要移除或修复二进制日志中的任何伪造条目时很有用。

下面小结一下，utmpdump从utmp、wtmp和btmp日志文件或轮循的旧归档文件来读取详细的登录事件，来补充如who，w，uptime，last，lastb之类的标准工具的不足，这也使得它成为一个很棒的工具。

你可以随意添加评论以加强本帖的含金量。

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/09/monitor-user-login-history-centos-utmpdump.html

作者：[Gabriel Cánepa][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/gabriel
[1]:http://linux.cn/article-4126-1.html
