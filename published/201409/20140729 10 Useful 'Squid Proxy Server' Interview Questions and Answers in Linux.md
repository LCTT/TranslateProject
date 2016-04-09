10个关于linux中Squid代理服务器的实用面试问答
================================================================================
不仅是系统管理员和网络管理员时不时会听到“代理服务器”这个词，我们也经常听到。代理服务器已经成为一种企业常态，而且经常会接触到它。它现在也出现在一些小型的学校或者大型跨国公司的自助餐厅里。Squid（常被视作代理服务的代名词）就是这样一个应用程序，它不但可以被作为代理服务器，其同时也是在该类工具中比较被广泛使用的一种。

本文旨在提高你在遇到关于代理服务器面试点时的一些基本应对能力。

![Squid Interview Questions](http://www.tecmint.com/wp-content/uploads/2014/07/Squid-Interview-Questions.png)

以下为面试问答的内容

### 1. 什么是代理服务器？代理服务器在计算机网络中有什么用途？ ###

> **回答** : 代理服务器是指那些作为客户端和资源提供商或服务器之间的中间件的物理机或者应用程序。客户端从代理服务器中寻找文件、页面或者是数据，而且代理服务器能处理客户端与服务器之间所有复杂事务，从而满足客户端的生成的需求。

代理服务器是WWW（万维网）的支柱，它们其中大部分都是Web代理。一台代理服务器能处理客户端与服务器之间的复杂通信事务。此外，它在网络上提供的是匿名信息（LCTT 译注：指浏览者的 IP、浏览器信息等被隐藏），这就意味着你的身份和浏览痕迹都是安全的。代理可以去配置允许哪些网站的客户能看到，哪些网站被屏蔽了。

### 2. Squid是什么? ###

> **回答** : Squid是一个在GNU/GPL协议下发布的既可作为代理服务器，同时也可作为Web缓存守护进程的应用软件。Squid主要是支持像HTTP和FTP那样的协议，但是对其它的协议比如HTTPS，SSL,TLS等同样也能支持。其特点是Web缓存守护进程通过从经常上访问的网站里缓存Web和DNS数据，从而让上网速度更快。Squid支持所有的主流平台，包括Linux，UNIX，微软公司的Windows和苹果公司的Mac。

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

a. 在 ‘/etc/squid’ 目录下创建一个名为 ‘blacklist’ 的文件。

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

### 5. 在Squid中什么是媒体范围限制（Media Range Limitation）和部分下载？ ###

> **回答** : 媒体范围限制是Squid的一种特殊的功能，它只从服务器中获取所需要的数据而不是整个文件。这个功能很好的实现了用户在各种视频流媒体网站如YouTube和Metacafe看视频时，可以点击视频中的进度条来选择进度，因此整个视频不用全部都加载，除了一些需要的部分。

Squid部分下载功能的特点是很好地实现了类似在Windows更新时能以一个个小数据包的形式下载，并可以暂停，正因为它的这个特点，正在下载文件的Windows机器可以重新继续下载，而不用担心数据会丢失。Squid的媒体范围限制和部分下载功能只有在存储了一个完整文件的副本之后才行。此外，当用户访问另一个页面时，除非Squid进行了特定的配置，部分下载下来的文件会被删除且不留在缓存中。

### 6. 什么是Squid的反向代理？ ###

> **回答** : 反向代理是Squid的一个功能，这个功能被用来加快最终用户的上网速度。下面用缩写 ‘RS’ 的表示包含了资源的原服务器，而代理服务器则称作 ‘PS’ 。初次访问时，它会从RS得到其提供的数据，并将其副本按照配置好的时间存储在PS上。这样的话每次从PS上请求的数据就相当于就是从原服务器上获取的。这样就会减轻网络拥堵，减少CPU使用率，降低网络资源的利用率，从而缓解原来实际服务器的负载压力。但是RS统计不了总流量的数据，因为PS分担了部分原服务器的任务。‘X-Forwarded-For HTTP’ 信息能用于记录下通过HTTP代理或负载均衡方式连接到RS的客户端最原始的IP地址。

从技术上说，用单个Squid服务器同时作为正向代理服务器和反向代理服务器是可行的。

### 7. 由于Squid能作为一个Web缓存守护进程，那缓存可以删除吗？怎么删除？ ###

> **回答** : 当然！作为一个Web缓存守护进程，Squid能加快网页的访问速度，清除缓存也是非常简单的。

a. 首先停止Squid代理服务，然后从这个 ‘/var/lib/squid/cache’ 目录中删除缓存。

    # service squid stop
    # rm -rf /var/lib/squid/cache/*<

b. 创建交换分区目录。

    # squid -z

### 8. 你有一台工作中的机器可以访问代理服务器，如果想要限制你的孩子的访问时间，你会怎么去设置那个场景？ ###

把允许访问的时间设置成晚上4点到7点三个小时，跨度为星期一到星期五。

a. 想要限制Web访问时间在星期一到星期五的晚上4点到7点，要先打开Squid的配置文件。

    # nano /etc/squid/squid.conf

b. 在配置文件中添加如下行，保存文件并退出。

    acl ALLOW_TIME time M T W H F 16:00-19:00
    shttp_access allow ALLOW_TIME

c. 重启Squid服务。

    # service squid restart

### 9. Squid存储的数据是什么文件格式？ ###

> **回答** : Squid存储的数据是UFS文件格式的。UFS是一种老的，使用比较广泛的Squid存储格式

### 10. Squid的缓存会存储到哪里？ ###

> **回答** : Squid存储的缓存是位于 ‘/var/spool/squid’ 的特定目录下。

以上就是全部内容了，很快我还会带着其它有趣的内容回到这里。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/squid-interview-questions/

作者：[Avishek Kumar][a]
译者：[ZTinoZ](https://github.com/ZTinoZ)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
