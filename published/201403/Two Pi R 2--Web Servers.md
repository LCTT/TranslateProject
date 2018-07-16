树莓派使用实例之：2 Pi R 第二篇：Web服务器
================================================================================
在我的上一篇[文章][1]中讲过如何做一个高可用系统：两个树莓派布署上 GlusterFS 集群文件系统，就变成一个容错文件服务器了。在这篇文章中我们会基于这个高可用系统构建另一个容错服务：建立一个简单的 Web 服务器集群。

可能你没有看过我的上一篇文章，那我就在这里简单回顾一下上次的内容。我有两个树莓派：Pi1 和 Pi2。Pi1 的 IP 地址为 192.168.0.121，Pi2 的 IP 地址为 192.168.0.122。我把它们组合成为 GlusterFS 集群系统，共享一个存储卷，卷名为 gv0。并且这个 gv0 被挂载在两个树莓派上，挂载点都是 /mnt/gluster1，这样一来，两个树莓派能同时访问到这个共享卷。最后我测试了下系统的容错性，将共享卷挂载到第三个物理机上，并执行共享卷上的一个简单的脚本：打印系统时间并输出到 gv0 上的一个文件内，然后轮着关掉两台树莓派，检测这个冗余系统是否还能用。

现在我手上有这个经过检验的存储系统，我要做的是把这个系统做成有容错功能的 Web 服务器集群。树莓派的 CPU 处理速度和内存资源都不是很高，好在对付一个静态 Web 服务器已经是绰绰有余了。我故意把这个例子做得非常简单，因为我觉得如果你能摆平这个简单的例子，你也能处理复杂一点的问题了。

### 安装 Nginx ###

虽然我也比较喜欢 Apache，但在资源有限的情况下，像 Nginx 这样功能全、性能高、资源占用少的 Web 服务器是比较理想的选择。在 Raspbian 的默认源中存在 Nginx，所以我只要登入一台树莓派并且输入以下命令：

    $ sudo apt-get update
    $ sudo apt-get install nginx

Nginx 安装好后，创建配置文件 /mnt/gluster1/cluster ，内容如下：

    server {
      root /mnt/gluster1/www;
      index index.html index.htm;
      server_name twopir twopir.example.com;
    
      location / {
            try_files $uri $uri/ /index.html;
      }
    }

注意：我这里把服务器命名为“twopir”，你可以根据自己爱好命名你的网站。另外我把 Web 服务器的根目录设置为 /mng/gluster1/www。这样，我就能把我的静态文件放在这个共享存储系统内，从而让两个树莓派主机都访问到它们。

现在删除默认的 Nginx 配置文件，将上面配好的配置文件作为 Nginx 的配置文件。在 Debian 系统中，Nginx 将它的配置文件像 Apache 一样放在 sites-available 和 site-enabled 两个目录下面。虚拟主机配置文档放在 sites-available 中，而 sites-enabled 目录包含了你想生效的配置文件的软链接。

    $ cd /etc/nginx/sites-available
    $ sudo ln -s /mnt/gluster1/cluster .
    $ cd /etc/nginx/sites-enabled
    $ sudo rm default
    $ sudo ln -s /etc/nginx/sites-available/cluster .

现在我已经放好了配置文件，但系统还不存在上面所说的 Web 服务器根目录。下一步就是创建目录 /mnt/gluster1/www，并复制 index.html 文件进去。当然你也可以建立自己定义的 index.html 文件，但先复制一个已有的文件是个不错的选择：

    $ sudo mkdir /mnt/gluster1/www
    $ cp /usr/share/nginx/www/index.html /mnt/gluster1/www

重启 Nginx 服务：

    $ sudo /etc/init.d/nginx restart

现在去 DNS 服务器为192.168.0.121的树莓派配置记录。你可以根据自己的情况配置你自己的域名和 IP 地址。现在在浏览器上输入 http://twopir/ 然后出现默认的 Nginx 首页。如果你查看下 /var/log/nginx/access.log 文件，你可以看到点击网页留下的记录。

Nginx 能正常工作后，配置第二个树莓派。因为我们已经将配置文件都放在 GlusterFS 共享目录下，我们现在要做的只是安装 Nginx，创建相关的软链接，重启 Nginx：

    $ sudo apt-get update
    $ sudo apt-get install nginx
    $ cd /etc/nginx/sites-available
    $ sudo ln -s /mnt/gluster1/cluster .
    $ cd /etc/nginx/sites-enabled
    $ sudo rm default
    $ sudo ln -s /etc/nginx/sites-available/cluster .
    $ sudo /etc/init.d/nginx restart

### DNS 服务器上配置两条 A 记录 ###

现在两个主机共享同一份文件，下一步是设置冗余系统的关键步骤。虽然你完全可以设置一个类似心跳的服务用于轮询检测哪个树莓派的 Web 服务是开启的，但这里有个更好的方法：给同一个主机名指定两个 DNS 的 A 记录，分别指向你的两个树莓派（译注：A 记录就是将域名转化为 IP 地址的记录，DNS 包含很多记录方式，如 A 记录、PTR 记录、MX 记录等等），这就是传说中的 DNS 负载均衡，DNS 访问主机时，如果主机名对应多个 IP 地址，DNS 会随机返回这些 IP 地址的顺序：

    $ dig twopir.example.com A +short
    192.168.0.121
    192.168.0.122
    $ dig twopir.example.com A +short
    192.168.0.122
    192.168.0.121

因为返回随机的顺序，用户可以均匀地往两台服务器发送请求，这个负载均衡的机制就是由 DNS 服务器的多条 A 记录来提供。相对于 DNS 的负载均衡技术，我更感兴趣的是 Web 浏览器如何处理请求失败的情况。当浏览器通过网页主机获得两条 A 记录，并且第一条记录所在的主机当机了，浏览器几乎立刻就切到另一条记录上。切换效率快到用户根本察觉不出来，这可比传统的心跳线轮循请求主机快多了。

所以在你正在使用的 DNS 服务器上添加你的树莓派集群的两个 IP 地址，然后试试 dig 命令，就像我在上面使用过的一样，你也应该能得到两个 IP 地址。

当你为同一个域名设置好了两个 A 记录，这套集群就可以提供容错服务了。打开两个终端并分别登录到两个树莓派，运行 tail -f /var/log/ngnix/access.log 命令，你可以监视 Web 服务器的访问情况。当你通过浏览器访问网页时，你可以看到在一台树莓派上产生了访问日志，而在另外一台的日志里什么也没有出现。现在你可以刷新几次页面，当你觉得你对能成功访问到 Web 服务器感到满意了，你可以重启响应你请求的那台树莓派，然后再刷新几次页面。也许浏览器上会出现一个短暂的不可访问信号，但会马上重定向到第二台树莓派上，你会看到一样的页面，并且你能通过终端访问日志了解具体情况。当第一台树莓派启动后，你在浏览器上根本不会察觉到。

随机重启一台树莓派，只要有一台在线，Web 服务器就能提供服务。这是一个非常简单的案例，你可以把你其它的静态文件放到 /mnt/gluster1/www 上，为你提供真正有价值的服务，现在好好享受你的低成本容错集群 Web 服务器吧。

--------------------------------------------------------------------------------

via: http://www.linuxjournal.com/content/two-pi-r-2-web-servers

译者：[bazz2](https://github.com/bazz2) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://linux.cn/article-2587-1.html
