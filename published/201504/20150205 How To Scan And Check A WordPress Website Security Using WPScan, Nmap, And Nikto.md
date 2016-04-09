怎样用 WPScan，Nmap 和 Nikto 扫描和检查一个 WordPress 站点的安全性
================================================================================
### 介绍 ###

数百万个网站用着 WordPress ，这当然是有原因的。WordPress 是众多内容管理系统中对开发者最友好的，本质上说你可以用它做任何事情。不幸的是，每天都有些吓人的报告说某个主要的网站被黑了，或者某个重要的数据库被泄露了之类的，吓得人一愣一愣的。

如果你还没有安装 WordPress ，可以看下下面的文章。

在基于 Debian 的系统上：

- [如何在 Ubuntu 上安装 WordPress][1]

在基于 RPM 的系统上：

- [如何在 CentOS 上安装 WordPress][2]

我之前的文章 [ 如何安全加固 WordPress 站点][3] 里面列出的**备忘录**为读者维护 WordPress 的安全提供了一点帮助。

在这篇文章里面，我将介绍 **wpscan** 的安装过程，以及怎样使用 wpscan 来定位那些已知的会让你的站点变得易受攻击的插件和主题。还有怎样安装和使用一款免费的网络探索和攻击的安全扫描软件 **nmap** 。最后展示的是使用 **nikto** 的步骤。

### 用 WPScan 测试 WordPress 中易受攻击的插件和主题 ###

**WPScan** 是一个 WordPress 黑盒安全扫描软件，用 Ruby 写成，它是专门用来寻找已知的 WordPress 的弱点的。它为安全专家和 WordPress 管理员提供了一条评估他们的 WordPress 站点的途径。它的基于开源代码，在 GPLv3 下发行。

#### 下载和安装 WPScan ####

在我们开始安装之前，很重要的一点是要注意 wpscan 不能在 Windows 下工作，所以你需要使用一台 Linux 或者 OS X 的机器来完成下面的事情。如果你只有 Windows 的系统，拿你可以下载一个 Virtualbox 然后在虚拟机里面安装任何你喜欢的 Linux 发行版本。

WPScan 的源代码放在 Github 上，所以需要先安装 git（LCTT 译注：其实你也可以直接从 Github 上下载打包的源代码，而不必非得装 git ）。

    sudo apt-get install git

git 装好了，我们就要安装 wpscan 的依赖包了。

    sudo apt-get install libcurl4-gnutls-dev libopenssl-ruby libxml2 libxml2-dev libxslt1-dev ruby-dev ruby1.9.3

把 wpscan 从 github 上 clone 下来。

    git clone https://github.com/wpscanteam/wpscan.git

现在我们可以进入这个新建立的 wpscan 目录，通过 bundler 安装必要的 ruby 包。

    cd wpscan
    sudo gem install bundler && bundle install --without test development

现在 wpscan 装好了，我们就可以用它来搜索我们 WordPress 站点潜在的易受攻击的文件。wpcan 最重要的方面是它能列出不仅是插件和主题，也能列出用户和缩略图的功能。WPScan 也可以用来暴力破解 WordPress —— 但这不是本文要讨论的内容。

#### 更新 WPScan ####

    ruby wpscan.rb --update

#### 列举插件 ####

要列出所有插件，只需要加上 “--enumerate p” 参数，就像这样：

    ruby wpscan.rb --url http(s)://www.yoursiteurl.com --enumerate p

或者仅仅列出易受攻击的插件：

    ruby wpscan.rb --url http(s)://www.yoursiteurl.com --enumerate vp

下面是一些例子：

    | Name: ukiscet
    | Location: http://********.com/wp-content/plugins/akismet/
    
    | Name: audio-player
    | Location: http://********.com/wp-content/plugins/audio-player/
    |
    | * Title: Audio Player - player.swf playerID Parameter XSS
    | * Reference: http://seclists.org/bugtraq/2013/Feb/35
    | * Reference: http://secunia.com/advisories/52083
    | * Reference: http://osvdb.org/89963
    | * Fixed in: 2.0.4.6
    
    | Name: bbpress - v2.3.2
    | Location: http://********.com/wp-content/plugins/bbpress/
    | Readme: http://********.com/wp-content/plugins/bbpress/readme.txt
    |
    | * Title: BBPress - Multiple Script Malformed Input Path Disclosure
    | * Reference: http://xforce.iss.net/xforce/xfdb/78244
    | * Reference: http://packetstormsecurity.com/files/116123/
    | * Reference: http://osvdb.org/86399
    | * Reference: http://www.exploit-db.com/exploits/22396/
    |
    | * Title: BBPress - forum.php page Parameter SQL Injection
    | * Reference: http://xforce.iss.net/xforce/xfdb/78244
    | * Reference: http://packetstormsecurity.com/files/116123/
    | * Reference: http://osvdb.org/86400
    | * Reference: http://www.exploit-db.com/exploits/22396/
    
    | Name: contact
    | Location: http://********.com/wp-content/plugins/contact/

#### 列举主题 ####

列举主题和列举插件差不多，只要用"--enumerate t"就可以了。

    ruby wpscan.rb --url http(s)://www.host-name.com --enumerate t

或者只列出易受攻击的主题：

    ruby wpscan.rb --url http(s)://www.host-name.com --enumerate vt

例子的输出：

    | Name: path
    | Location: http://********.com/wp-content/themes/path/
    | Style URL: http://********.com/wp-content/themes/path/style.css
    | Description: 
    
    | Name: pub
    | Location: http://********.com/wp-content/themes/pub/
    | Style URL: http://********.com/wp-content/themes/pub/style.css
    | Description: 
    
    | Name: rockstar
    | Location: http://********.com/wp-content/themes/rockstar/
    | Style URL: http://********.com/wp-content/themes/rockstar/style.css
    | Description: 
    |
    | * Title: WooThemes WooFramework Remote Unauthenticated Shortcode Execution
    | * Reference: https://gist.github.com/2523147
    
    | Name: twentyten
    | Location: http://********.com/wp-content/themes/twentyten/
    | Style URL: http://********.com/wp-content/themes/twentyten/style.css
    | Description: 

#### 列举用户 ####

WPscan 也可以用来列举某个 WordPress 站点的用户和有效的登录记录。攻击者常常这么做——为了获得一个用户清单，好进行暴力破解。

    ruby wpscan.rb --url http(s)://www.host-name.com --enumerate u

#### 列举 Timthumb 文件 ####

关于 WPscan ，我要说的最后一个功能是列举 timthub （缩略图）相关的文件。近年来，timthumb 已经成为攻击者眼里的一个常见目标，因为无数的漏洞被找出来并发到论坛上、邮件列表等等地方。用下面的命令可以通过 wpscan 找出易受攻击的 timthub 文件：

    ruby wpscan.rb --url http(s)://www.host-name.com --enumerate tt

### 用 Nmap 扫描你 VPS 的开放端口 ###

**Nmap** 是一个开源的用于网络探索和安全审查方面的工具。它可以迅速扫描巨大的网络，也可一单机使用。Nmap 用原始 IP 数据包通过不同寻常的方法判断网络里那些主机是正在工作的，那些主机上都提供了什么服务（应用名称和版本），是什么操作系统（以及版本），用的什么类型的防火墙，以及很多其他特征。

#### 在 Debian 和 Ubuntu 上下载和安装 nmap ####

要在基于 Debian 和 Ubuntu 的操作系统上安装 nmap ，运行下面的命令：

    sudo apt-get install nmap

**输出样例**

    Reading package lists... Done
    Building dependency tree
    Reading state information... Done
    The following NEW packages will be installed:
      nmap
    0 upgraded, 1 newly installed, 0 to remove and 2 not upgraded.
    Need to get 1,643 kB of archives.
    After this operation, 6,913 kB of additional disk space will be used.
    Get:1 http://mirrors.service.networklayer.com/ubuntu/ precise/main nmap amd64 5.21-1.1ubuntu1 [1,643 kB]
    Fetched 1,643 kB in 0s (16.4 MB/s)
    Selecting previously unselected package nmap.
    (Reading database ... 56834 files and directories currently installed.)
    Unpacking nmap (from .../nmap_5.21-1.1ubuntu1_amd64.deb) ...
    Processing triggers for man-db ...
    Setting up nmap (5.21-1.1ubuntu1) ...

#### 举个例子 ####

输出 nmap 的版本：

    nmap -V

或者

    nmap --version

**输出样例**

    Nmap version 5.21 ( http://nmap.org )

#### 在 Centos 上下载和安装 nmap ####

要在基于 RHEL 的 Linux 上面安装 nmap ，输入下面的命令：

    yum install nmap

**输出样例**

    Loaded plugins: protectbase, rhnplugin, security
    0 packages excluded due to repository protections
    Setting up Install Process
    Resolving Dependencies
    --> Running transaction check
    ---> Package nmap.x86_64 2:5.51-2.el6 will be installed
    --> Finished Dependency Resolution
     
    Dependencies Resolved
     
    ================================================================================
     Package    Arch         Version               Repository                  Size
    ================================================================================
    Installing:
     nmap       x86_64       2:5.51-2.el6          rhel-x86_64-server-6       2.8 M
     
    Transaction Summary
    ================================================================================
    Install       1 Package(s)
     
    Total download size: 2.8 M
    Installed size: 0
    Is this ok [y/N]: y
    Downloading Packages:
    nmap-5.51-2.el6.x86_64.rpm                               | 2.8 MB     00:00
    Running rpm_check_debug
    Running Transaction Test
    Transaction Test Succeeded
    Running Transaction
      Installing : 2:nmap-5.51-2.el6.x86_64                                     1/1
      Verifying  : 2:nmap-5.51-2.el6.x86_64                                     1/1
     
    Installed:
      nmap.x86_64 2:5.51-2.el6
     
    Complete!

#### 举个例子 ####

输出 nmap 版本号：

    nmap --version

**输出样例**

    Nmap version 5.51 ( http://nmap.org )

#### 用 Nmap 扫描端口 ####

你可以用 nmap 来获得很多关于你的服务器的信息，它可以让你站在对你的网站不怀好意的人的角度看你自己的网站。

因此，请仅用它测试你自己的服务器或者在行动之前通知服务器的所有者。

nmap 的作者提供了一个测试服务器：

    scanme.nmap.org

有些命令可能会耗时较长：

要扫描一个 IP 地址或者一个主机名（全称域名），运行：

    nmap 192.168.1.1

输出样例：

![Fig.01: nmap in action](http://s0.cyberciti.org/uploads/faq/2012/11/redhat-nmap-command-output.png)

扫描以获得主机的操作系统：

    sudo nmap -O 192.168.1.1

加上“-”或者“/24”来一次性扫描某个范围里面的多个主机：

    sudo nmap -PN xxx.xxx.xxx.xxx-yyy

扫描某个范围内可用的服务：

    sudo nmap -sP network_address_range

扫描 IP 地址时部进行反向 DNS 解析。多数情况下这会加快你获得结果的速度：

    sudo nmap -n remote_host

扫描一个特定端口而不是所有常用端口：

    sudo nmap -p port_number remote_host

扫描一个网络，找出哪些服务器在线，分别运行了什么服务。

这就是传说中的主机探索或者 ping 扫描：

    nmap -sP 192.168.1.0/24

输出样例：

    Host 192.168.1.1 is up (0.00035s latency).
    MAC Address: BC:AE:C5:C3:16:93 (Unknown)
    Host 192.168.1.2 is up (0.0038s latency).
    MAC Address: 74:44:01:40:57:FB (Unknown)
    Host 192.168.1.5 is up.
    Host nas03 (192.168.1.12) is up (0.0091s latency).
    MAC Address: 00:11:32:11:15:FC (Synology Incorporated)
    Nmap done: 256 IP addresses (4 hosts up) scanned in 2.80 second

理解端口配置和如何发现你的服务器上的攻击目标只是确保你的信息和你的 VPS 安全的第一步。

### 用 Nikto 扫描你网站的缺陷 ###

[Nikto][4] 网络扫描器是一个开源的 web 服务器的扫描软件，它可以用来扫描 web 服务器上的恶意的程序和文件。Nikto 也可以用来检查软件版本是否过期。Nikto 能进行简单而快速地扫描以发现服务器上危险的文件和程序。扫描结束后会给出一个日志文件。`

#### 在 Linux 服务器上下载和安装 Nikto ####

Perl 在 Linux 上是预先安装好的，所以你只需要从[项目页面][5]下载 nikto ，解压到一个目录里面，然后开始测试。

    wget https://cirt.net/nikto/nikto-2.1.4.tar.gz

你可以用某个归档管理工具解包，或者如下同时使用 tar 和 gzip ：

    tar zxvf nikto-2.1.4.tar.gz
    cd nikto-2.1.4
    perl nikto.pl

安装正确的话会得到这样的结果：

     - ***** SSL support not available (see docs for SSL install) *****
    - Nikto v2.1.4
    ---------------------------------------------------------------------------
    + ERROR: No host specified
    
           -config+            Use this config file
           -Cgidirs+           scan these CGI dirs: 'none', 'all', or values like "/cgi/ /cgi-a/"
           -dbcheck            check database and other key files for syntax errors
           -Display+           Turn on/off display outputs
           -evasion+           ids evasion technique
           -Format+            save file (-o) format
           -host+              target host
           -Help               Extended help information
           -id+                Host authentication to use, format is id:pass or id:pass:realm
           -list-plugins       List all available plugins
           -mutate+            Guess additional file names
           -mutate-options+    Provide extra information for mutations
           -output+            Write output to this file
           -nocache            Disables the URI cache
           -nossl              Disables using SSL
           -no404              Disables 404 checks
           -port+              Port to use (default 80)
           -Plugins+           List of plugins to run (default: ALL)
           -root+              Prepend root value to all requests, format is /directory
           -ssl                Force ssl mode on port
           -Single             Single request mode
           -timeout+           Timeout (default 2 seconds)
           -Tuning+            Scan tuning
           -update             Update databases and plugins from CIRT.net
           -vhost+             Virtual host (for Host header)
           -Version            Print plugin and database versions
               + requires a value
    
        Note: This is the short help output. Use -H for full help.

这个报错只是告诉我们没有给出必要的参数。SSL 支持可以通过安装相关的 perl ssl 模块得到（sudo apt-get install libnet-ssleay-perl）。

#### 更新 nikto 数据库 ####

在开始使用之前我们需要先更新 nikto 数据库：

    /usr/local/bin/nikto.pl -update

下面的命令可以列出可用的 nikto 插件。

    nikto.pl -list-plugins // To list the installed plugins //

#### 扫描以寻找缺陷 ####

我们用一个 url 来在做个简单的测试。

    perl nikto.pl -h http://www.host-name.com

**输出样例**

会有十分冗长的输出，可能一开始会让人感到困惑。许多 Nikto 的警报会返回 OSVDB 序号。这是由开源缺陷数据库（[http://osvdb.org/][6]）所指定。你可以在 OSVDB 上找出相关缺陷的深入说明。

    $ nikto -h http://www.host-name.com
    - Nikto v2.1.4
    ---------------------------------------------------------------------------
    + Target IP:         1.2.3.4
    + Target Hostname:    host-name.com
    + Target Port:        80
    + Start Time:         2012-08-11 14:27:31
    ---------------------------------------------------------------------------
    + Server: Apache/2.2.22 (FreeBSD) mod_ssl/2.2.22 OpenSSL/1.0.1c DAV/2
    + robots.txt contains 4 entries which should be manually viewed.
    + mod_ssl/2.2.22 appears to be outdated (current is at least 2.8.31) (may depend on server version)
    + ETag header found on server, inode: 5918348, size: 121, mtime: 0x48fc943691040
    + mod_ssl/2.2.22 OpenSSL/1.0.1c DAV/2 - mod_ssl 2.8.7 and lower are vulnerable to a remote buffer overflow which may allow a remote shell (difficult to exploit). CVE-2002-0082, OSVDB-756.
    + Allowed HTTP Methods: GET, HEAD, POST, OPTIONS, TRACE 
    + OSVDB-877: HTTP TRACE method is active, suggesting the host is vulnerable to XST
    + /lists/admin/: PHPList pre 2.6.4 contains a number of vulnerabilities including remote administrative access, harvesting user info and more. Default login to admin interface is admin/phplist
    + OSVDB-2322: /gallery/search.php?searchstring=<script>alert(document.cookie)</script>: Gallery 1.3.4 and below is vulnerable to Cross Site Scripting (XSS). Upgrade to the latest version. http://www.securityfocus.com/bid/8288.
    + OSVDB-7022: /calendar.php?year=<script>alert(document.cookie);</script>&month=03&day=05: DCP-Portal v5.3.1 is vulnerable to  Cross Site Scripting (XSS). http://www.cert.org/advisories/CA-2000-02.html.
    + OSVDB-3233: /phpinfo.php: Contains PHP configuration information
    + OSVDB-3092: /system/: This might be interesting...
    + OSVDB-3092: /template/: This may be interesting as the directory may hold sensitive files or reveal system information.
    + OSVDB-3092: /updates/: This might be interesting...
    + OSVDB-3092: /README: README file found.
    + 6448 items checked: 1 error(s) and 14 item(s) reported on remote host
    + End Time:           2012-08-11 15:52:57 (5126 seconds)
    ---------------------------------------------------------------------------
    + 1 host(s) tested
    $

**Nikto** 是一个非常轻量级的通用工具。因为 Nikto 是用 Perl 写的，所以它可以在几乎任何服务器的操作系统上运行。

希望这篇文章能在你检查 wordpress 站点的缺陷的时候给你一些提示。我之前的文章[如何安全加固 WordPress 站点][7]记录了一个**清单**，可以让你保护你的 WordPress 站点的工作变得更简单。

有想说的，留下你的评论。

--------------------------------------------------------------------------------

via: http://www.unixmen.com/scan-check-wordpress-website-security-using-wpscan-nmap-nikto/

作者：[anismaj][a]
译者：[boredivan](https://github.com/boredivan)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/anis/
[1]:http://www.unixmen.com/install-wordpress-ubuntu-14-10/
[2]:http://www.unixmen.com/install-configure-wordpress-4-0-benny-centos-7/
[3]:http://www.unixmen.com/secure-wordpress-website/
[4]:http://www.unixmen.com/install-nikto-web-scanner-check-vulnerabilities
[5]:https://cirt.net/nikto/
[6]:http://osvdb.org/
[7]:http://www.unixmen.com/secure-wordpress-website/
