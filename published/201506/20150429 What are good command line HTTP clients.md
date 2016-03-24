有哪些不错的命令行HTTP客户端？
==============================================================================

“整体大于它的各部分之和”，这是引自希腊哲学家和科学家的亚里士多德的名言。这句话特别切中Linux。在我看来，Linux最强大的地方之一就是它的协作性。Linux的实用性并不仅仅源自大量的开源程序（命令行）。相反，其协作性来自于这些程序的综合利用，有时是结合成更大型的应用。

Unix哲学引发了一场“软件工具”的运动，关注开发简洁，基础，干净，模块化和扩展性好的代码，并可以运用于其他的项目。这种哲学成为了许多的Linux项目的一个重要的元素。

好的开源开发者写程序为了确保该程序尽可能运行得好，并且同时能与其他程序很好地协作。目标就是使用者拥有一堆方便的工具，每一个力求干好一件事。许多程序能独立工作得很好。

这篇文章讨论3个开源命令行HTTP客户端。这些客户端可以让你使用命令行从互联网上下载文件。但同时，他们也可以用于许多有意思的地方，如测试，调式和与HTTP服务器或web应用交互。对于HTTP架构师和API设计人员来说，使用命令行操作HTTP是一个值得花时间学习的技能。如果你需要经常使用API，HTTPie和cURL就非常有价值。

###HTTPie###

![HTTPie in action](http://www.linuxlinks.com/portal/content/reviews/Internet/Screenshot-httpie.png)

HTTPie（发音 aych-tee-tee-pie）是一款开源的命令行HTTP客户端。它是一个命令行界面，便于手工操作的类cURL工具。

该软件的目标是使得与Web服务器的交互尽可能的人性化。其提供了一个简单的http命令，允许使用简单且自然的语句发送任意的HTTP请求，并显示不同颜色的输出。HTTPie可以用于测试，调试，以及与HTTP服务器的常规交互。

#### 功能包括：####

- 生动而直观的语法格式
- 经过格式化的彩色终端输出
- 内建JSON支持
- 支持表单和文件上传
- 支持HTTPS，代理和认证
- 任意数据请求
- 自定义请求头
- 持久会话
- 类Wget的下载
- 支持Python 2.6，2.7和3.x
- 支持Linux，Mac OS X 和 Windows
- 支持插件
- 文档
- 单元测试覆盖

---

- 网站:[httpie.org][1]
- 开发者: Jakub Roztočil
- 证书: 开源
- 版本号: 0.9.2

###cURL###

![cURL in action](http://www.linuxlinks.com/portal/content/reviews/Internet/Screenshot-cURL.png)

cURL是一个开源的命令行工具，用于使用URL语句传输数据，支持DICT, FILE, FTP, FTPS, GOPHER, HTTP, HTTPS,IMAP, IMAPS, LDAP, LDAPS, POP3, POP3S, RTMP, RTSP, SCP, SFTP, SMTP, SMTPS, TELNET和TFTP等协议。

cURL支持SSL证书，HTTP POST，HTTP PUT，FTP上传，基于表单的HTTP上传，代理，缓存，用户名+密码的认证方式(Basic, Digest, NTLM, Negotiate, kerberos...)，文件续传，代理通道和一些其他的有用功能。

#### 功能包括：####

- 支持配置文件
- 一个单独命令行请求多个URL
- 支持匹配： [0-13]，{one, two, three}
- 一个命令上传多个文件
- 自定义最大传输速度
- 重定向了标准错误输出
- 支持Metalink

---

- 网站: [curl.haxx.se][2]
- 开发者: Daniel Stenberg
- 证书: MIT/X derivate license
- 版本号: 7.42.0

###Wget###

![Wget in action](http://www.linuxlinks.com/portal/content/reviews/Utilities/Screenshot-Wget.png)

Wget是一个从网络服务器获取信息的开源软件。其名字源于World Wide Web 和 get。Wget支持HTTP，HTTPS和FTP协议，同时也可以通过HTTP代理获取信息。

Wget可以根据HTML页面的链接，创建远程网络站点的本地副本，完全重造源站点的目录结构。这种方式被称作“递归下载”。

Wget设计上增强了低速或者不稳定的网络连接。

功能包括：

- 使用REST和RANGE恢复中断的下载
- 使用文件名通配符，支持递归地对目录镜像
- 基于NLS的消息文件支持多语言
- 可选的转换下载文档里地绝对链接为相对链接，使得下载文档可以在本地相互链接
- 可以在大多数类UNIX操作系统和微软Windows上运行
- 支持HTTP代理
- 支持HTTP cookie
- 支持HTTP持久连接
- 无人照管/后台操作
- 当对远程镜像时，使用本地文件时间戳来决定是否需要重新下载文档

---

- 站点: [www.gnu.org/software/wget/][3]
- 开发者: Hrvoje Niksic, Gordon Matzigkeit, Junio Hamano, Dan Harkless, and many others
- 证书: GNU GPL v3
- 版本号: 1.16.3

--------------------------------------------------------------------------------

via: http://www.linuxlinks.com/article/20150425174537249/HTTPclients.html

作者：Frazer Kline
译者：[wi-cuckoo](https://github.com/wi-cuckoo)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://httpie.org/
[2]:http://curl.haxx.se/
[3]:https://www.gnu.org/software/wget/
