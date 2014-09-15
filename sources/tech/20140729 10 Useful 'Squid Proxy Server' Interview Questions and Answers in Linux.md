10个实用的关于linux中Squid代理服务器的面试问答
================================================================================
不仅是系统管理员和网络管理员时不时会听到“代理服务器”这个词，我们也经常听到。代理服务器已经是一种企业的文化，而且那是需要时间来积累的。它现在也在一些小型的学校或者大型跨国公司的自助餐厅里得到了实现。Squid（也可做代理服务）就是这样一个应用程序，它既可以被作为代理服务器，同时也是在其同类工具中比较被广泛使用的一种。

本文旨在提高你在遇到关于代理服务器面试点时的一些基本应对能力。

![Squid Interview Questions](http://www.tecmint.com/wp-content/uploads/2014/07/Squid-Interview-Questions.png)

以下为面试问答的内容

### 1. 什么是代理服务器？代理服务器在计算机网络中有什么用途？ ###

> **回答** : 代理服务器是指那些作为客户端和资源提供商或服务器之间的中间件的物理机或者应用程序。客户端从代理服务器中寻找文件、页面或者是数据而且代理服务器能处理客户端与服务器之间所有复杂事务从而满足客户端的生成的需求。
代理服务器是WWW（万维网）的支柱，它们其中大部分都是网页代理。一台代理服务器能处理客户端与服务器之间的复杂通信事务。此外，它在网络上提供的是匿名信息那就意味着你的身份和浏览痕迹都是安全的。代理可以去配置允许哪些网站的客户能看到，哪些网站被屏蔽了。

### 2. Squid是什么? ###

> **回答** : Squid是一个在GNU/GPL协议下发布的即可作为代理服务器同时也可作为网页缓存守护进程的应用软件。Squid主要是支持像HTTP和FTP那样的协议但是对其它的协议比如HTTPS，SSL,TLS等同样也能支持。其特点是网页缓存守护进程通过从经常上访问的网站里缓存网页和DNS从而让上网速度更快。Squid支持所有的主流平台，包括Linux，UNIX，微软公司的Windows和苹果公司的Mac。

### 3. Squid的默认端口是什么？怎么去修改它的操作端口？ ###

> **回答** : Squid运行时的默认端口是3128。我们可以通过编辑它的配置文件来把它的默认端口修改成未被用户使用的端口，路径是 /etc/squid/squid.conf ，建议如下。

用你的编辑器打开 ‘/etc/squid/squid.conf’ 文件。

    # nano /etc/squid/squid.conf

现在把它修改成未被使用的其它端口，并保存退出。

    http_port 3128

重新启动Squid代理服务，如下显示。

    # service squid restart

### 4. 你的公司管理层要求你通过Squid代理服务器屏蔽掉一些域名，你怎么做？ ###

> **回答** : 屏蔽域名是一个在配置文件中实现的功能模块。我们只需要执行一个小的手动配置即可，建议如下。

a. 在 ‘/etc/squid’ 路径下创建一个名为 ‘blacklist’ 的文件。

    # touch /etc/squid/blacklist

b. 用nano编辑器打开这个文件。

     # nano /etc/squid/blacklist

c. 以每行一个域名的方式将想要屏蔽的域名写进这个文件里。

    .facebook.com
    .twitter.com
    .gmail.com
    .yahoo.com
    ...

d. 保存退出，然后从 ‘/etc/squid/squid.conf’ 打开Squid配置文件。

    # nano /etc/squid/squid.conf

e. 在配置文件中添加如下行。

    acl BLACKLIST dstdom_regex -i “/etc/squid/blacklist”
    http_access deny blacklist

f. 保存配置文件并退出，重启Squid服务让其生效。

    # service squid restart

### 5. 在Squid中什么是媒体范围限制和部分下载？ ###

> **回答** : 媒体范围限制是Squid的一种特殊的功能，它只从服务器中获取所需要的数据而不是整个文件。这个功能很好的实现了用户在各种视频流媒体网站如YouTube和Metacafe看视频时，可以点击视频中的进度条来选择进度，因此整个视频不用全部都加载，除了一些需要的部分。

Squid部分下载功能的特点是很好地实现了在Windows更新时下载的文件能以一个个小数据包的形式暂停。正因为它的这个特点，正在下载文件的Windows机器能不用担心数据会丢失，从而进行恢复下载。Squid让媒体范围限制和部分下载功能只在存储一个完整文件的复件之后实现。此外，Moreover the partial download gets deleted and not cached when user points to another page until Squid is specially configured somehow.

### 6. What is reverse proxy in squid? ###

> **回答** : Reverse proxy is a feature of Squid which is used to accelerate the web surfing for end user. Say the Real server ‘RS’ contains the resource and ‘PS’ is the proxy Server. The client seek some data which is available at RS. It will rely on RS for the specified data for the first time and the copy of that specified data gets stored on PS for configurable amount of time. For every request for that data from now PS becomes the real source. This results in Less traffic, Lesser CPU usages, Lesser web resource utilization and hence lesser load to actual server RS. But RS has no statistics for the total traffic since PS acted as actual server and no Client reached RS. ‘X-Forwarded-For HTTP’ can be used to log the client IP although on RS.

Technically it is feasible to use single squid server to act both as normal proxy server and reverse proxy server at the same point of time.

### 7. Since Squid can be used as web-cache Daemon, is it possible to Clear its Cache? How? ###

> **回答** : No Doubt! Squid acts as web-cache Daemon which is used to accelerate web surfing still it is possible to clear its cache and that too very easily.

a. First stop Squid proxy server and delete cache from the location ‘/var/lib/squid/cache’ directory.

    # service squid stop
    # rm -rf /var/lib/squid/cache/*<

b. Create Swap directories.

    # squid -z

### 8. A client approaches you, who is working. They want the web access time be restricted for their children. How will you achieve this scenario? ###

Say the web access allow time be 4′o clock to 7′o clock in the evening for three hours, sharply form Monday to Friday.

a. To restrict web access between 4 to 7 from Monday to Friday, open the Squid configuration file.

    # nano /etc/squid/squid.conf

b. Add the following lines and save the file and exit.

    acl ALLOW_TIME time M T W H F 16:00-19:00
    shttp_access allow ALLOW_TIME

c. Restart the Squid Service.

    # service squid restart

### 9. Squid stores data in which file format? ###

> **回答** : Data stored by Squid is in ufs format. Ufs is the old well-known Squid storage format.

### 10. Where do cache gets stored by squid? ###

> **回答** : A squid stores cache in special folder at the location ‘/var/spool/squid’.

以上就是全部内容了，很快我还会带着其它有趣的内容回到这里，届时还请继续关注Tecmint。别忘了告诉我们你的反馈和评论。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/squid-interview-questions/

作者：[Avishek Kumar][a]
译者：[ZTinoZ](https://github.com/ZTinoZ)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
