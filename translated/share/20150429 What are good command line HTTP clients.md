什么是好的命令行HTTP客户端?
==============================================================================
整体大于各部分之和,这是引自希腊哲学家和科学家的亚里士多德的名言。这句话特别切中Linux。在我看来，Linux最强大的地方之一就是它的协作性。Linux的实用性并不仅仅源自大量的开源程序（命令行）。相反，其协作性来自于这些程序的综合利用，有时是结合更大型的应用。

Unix哲学引发了一场“软件工具”的运动，关注开发简洁，基础，干净，模块化和扩展性好的代码，并可以运用于其他的项目。这种哲学为许多的Linux项目留下了一个重要的元素。

好的开源开发者写程序为了确保该程序尽可能运行正确，同时能与其他程序很好地协作。目标就是使用者拥有一堆方便的工具，每一个力求干不止一件事。许多程序能独立工作得很好。

这篇文章讨论3个开源命令行HTTP客户端。这些客户端可以让你使用命令行从互联网上下载文件。但同时，他们也可以用于许多有意思的地方，如测试，调式和与HTTP服务器或网络应用互动。对于HTTP架构师和API设计人员来说，使用命令行操作HTTP是一个值得花时间学习的技能。如果你需要来回使用API，HTTPie和cURL，这没什么价值。

-------------

![HTTPie](http://www.linuxlinks.com/portal/content2/png/HTTPie.png)

![HTTPie in action](http://www.linuxlinks.com/portal/content/reviews/Internet/Screenshot-httpie.png)

HTTPie（发音 aych-tee-tee-pie）是一款开源命令行HTTP客户端。它是一个命令行界面，类cURL的工具。

该软件的目标是使得与网络服务器的交互尽可能的人性化。其提供了一个简单的http命令，允许使用简单且自然的语句发送任意的HTTP请求，并显示不同颜色的输出。HTTPie可以用于测试，调式和与HTTP服务器的一般交互。

#### 功能包括：####

- 可表达，直观的语句
- 格式化，颜色区分的终端输出
- 内建JSON支持
- 表单和文件上传
- HTTPS，代理和认证
- 任意数据请求
- 自定义标题  （此处header不确定是否特别意义）
- 持久会话
- 类Wget下载
- Python 2.6，2.7和3.x支持
- Linux，Mac OS X 和 Windows支持
- 支持插件
- 帮助文档
- 测试覆盖   （直译有点别扭）

- 网站:[httpie.org][1]
- 开发者: Jakub Roztočil
- 证书: 开源
- 版本号: 0.9.2

----------

![cURL](http://www.linuxlinks.com/portal/content2/png/cURL1.png)

![cURL in action](http://www.linuxlinks.com/portal/content/reviews/Internet/Screenshot-cURL.png)

cURL是一个开源命令行工具，用于使用URL语句传输数据，支持DICT, FILE, FTP, FTPS, GOPHER, HTTP, HTTPS,IMAP, IMAPS, LDAP, LDAPS, POP3, POP3S, RTMP, RTSP, SCP, SFTP, SMTP, SMTPS, TELNET和TFTP。

cURL支持SSL证书，HTTP POST，HTTP PUT，FTP上传，HTTP基于表单上传，代理，缓存,用户名+密码认证(Basic, Digest, NTLM, Negotiate, kerberos...),文件传输恢复, 代理通道和一些其他实用窍门的总线负载。（这里的名词我不明白其专业意思）

#### 功能包括：####

- 配置文件支持
- 一个单独命令行多个URL
- “globbing”漫游支持: [0-13],{one, two, three}
- 一个命令上传多个文件
- 自定义最大传输速度
- 重定向标准错误输出
- Metalink支持

- 网站: [curl.haxx.se][2]
- 开发者: Daniel Stenberg
- 证书: MIT/X derivate license
- 版本号: 7.42.0

----------

![Wget](http://www.linuxlinks.com/portal/content2/png/Wget1.png)

![Wget in action](http://www.linuxlinks.com/portal/content/reviews/Utilities/Screenshot-Wget.png)

Wget是一个从网络服务器获取信息的开源软件。其名字源于World Wide Web 和 get。Wget支持HTTP，HTTPS和FTP协议，同时也通过HTTP代理获取信息。

Wget可以根据HTML页面的链接，创建远程网络站点的本地版本，是完全重造源站点的目录结构。这种方式被冠名“recursive downloading。”

Wget已经设计可以加快低速或者不稳定的网络连接。

功能包括：

- 使用REST和RANGE恢复中断的下载
- 使用文件名
- 多语言的基于NLS的消息文件
- 选择性地转换下载文档里地绝对链接为相对链接，使得下载文档可以本地相互链接
- 在大多数类UNIX操作系统和微软Windows上运行
- 支持HTTP代理
- 支持HTTP数据缓存
- 支持持续地HTTP连接
- 无人照管/后台操作
- 当远程对比时，使用本地文件时间戳来决定是否需要重新下载文档  （mirroring没想出合适的表达）

- 站点: [www.gnu.org/software/wget/][3]
- 开发者: Hrvoje Niksic, Gordon Matzigkeit, Junio Hamano, Dan Harkless, and many others
- 证书: GNU GPL v3
- 版本号: 1.16.3

--------------------------------------------------------------------------------

via: http://www.linuxlinks.com/article/20150425174537249/HTTPclients.html

作者：Frazer Kline
译者：[wi-cuckoo](https://github.com/wi-cuckoo)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://httpie.org/
[2]:http://curl.haxx.se/
[3]:https://www.gnu.org/software/wget/
