树莓派使用实例之：2 Pi R 第二篇：Web服务器
================================================================================
在我的上一篇[文章][1]中讲过如何做一个冗余系统：两个树莓派布署上 GlusterFS 集群文件系统，就变成一个容错文件服务器了。在这篇文章中我们会基于这个冗余系统构建另一个容错服务：建立一个简单的 Web 服务器集群。

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

现在删除默认的 Nginx 配置文件，将上面配好的配置文件作为 Nginx 的配置文件。在 Debian 系统中，Nginx 将它的文件像 Apache 一样放在 sites-available 和 site-enabled 两个目录下面。虚拟主机配置文档放在 sites-available 中，而 sites-enabled 目录包含了你想生效的配置文件的软链接。

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

现在去 DNS 服务器为192.168.0.121的树莓派配置记录。你可以根据自己的情况配置你自己的域名和 IP 地址。现在在浏览器上输入 http://twopor/ 然后出现默认的 Nginx 首页。如果你查看下 /var/log/nginx/access.log 文件，你可以看到点击网页留下的记录。

Nginx 能正常工作后，配置第二个树莓派。因为我们已经将配置文件都放在 GlusterFS 共享目录下，我们现在要做的只是安装 Nginx，创建相关的软链接，重启 Nginx：

    $ sudo apt-get update
    $ sudo apt-get install nginx
    $ cd /etc/nginx/sites-available
    $ sudo ln -s /mnt/gluster1/cluster .
    $ cd /etc/nginx/sites-enabled
    $ sudo rm default
    $ sudo ln -s /etc/nginx/sites-available/cluster .
    $ sudo /etc/init.d/nginx restart

### Two DNS A Records ###
### Two DNS A Records ###

So, now I have two Web hosts that can host the same content, but the next step in this process is an important part of what makes this setup redundant. Although you definitely could set up a service like heartbeat with some sort of floating IP address that changed from one Raspberry Pi to the next depending on what was up, an even better approach is to use two DNS A records for the same hostname that point to each of the Raspberry Pi IPs. Some people refer to this as DNS load balancing, because by default, DNS lookups for a hostname that has multiple A records will return the results in random order each time you make the request: 
现在两个主机共享同一份文件，下一步是设置冗余系统的关键步骤。虽然你完全可以设置一个类似心跳的服务用于轮询检测哪个树莓派的 Web 服务是开启的，但这里有个更好的方法：两个 DNS 服务器记录一个主机名，这就是传说中的 DNS 负载均衡，DNS 

    $ dig twopir.example.com A +short
    192.168.0.121
    192.168.0.122
    $ dig twopir.example.com A +short
    192.168.0.122
    192.168.0.121

Because the results are returned in random order, clients should get sent evenly between the different hosts, and in effect, multiple A records do result in a form of load balancing. What interests me about a host having multiple A records though isn't as much the load balancing as how a Web browser handles failure. When a browser gets two A records for a Web host, and the first host is unavailable, the browser almost immediately will fail over to the next A record in the list. This failover is fast enough that in many cases it's imperceptible to the user and definitely is much faster than the kind of failover you might see in a traditional heartbeat cluster.

So, go to the same DNS server you used to add the first A record and add a second record that references the same hostname but a different IP address—the IP address of the second host in the cluster. Once you save your changes, perform a dig query like I performed above and you should get two IP addresses back. 

Once you have two A records set up, the cluster is basically ready for use and is fault-tolerant. Open two terminals and log in to each Raspberry Pi, and run `tail -f /var/log/nginx/access.log` so you can watch the Web server access then load your page in a Web browser. You should see activity on the access logs on one of the servers but not the other. Now refresh a few times, and you'll notice that your browser should be sticking to a single Web server. After you feel satisfied that your requests are going to that server successfully, reboot it while refreshing the Web page multiple times. If you see a blip at all, it should be a short one, because the moment the Web server drops, you should be redirected to the second Raspberry Pi and be able to see the same index page. You also should see activity in the access logs. Once the first Raspberry Pi comes back from the reboot, you probably will not even be able to notice from the perspective of the Web browser. 

Experiment with rebooting one Raspberry Pi at a time, and you should see that as long as you have one server available, the site stays up. Although this is a simplistic example, all you have to do now is copy over any other static Web content you want to serve into /mnt/gluster1/www, and enjoy your new low-cost fault-tolerant Web cluster. 

--------------------------------------------------------------------------------

via: http://www.linuxjournal.com/content/two-pi-r-2-web-servers

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.linuxjournal.com/content/two-pi-r
