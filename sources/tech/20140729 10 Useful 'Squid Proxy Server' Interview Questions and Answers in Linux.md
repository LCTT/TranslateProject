10个实用的关于linux中squid代理服务器的访谈问答
================================================================================
不仅是系统管理员和网络管理员时不时会听到“代理服务器”这个词，我们也经常听到。代理服务器已经是一种企业的文化，而且那是需要时间来积累的。它现在也在一些小型的学校或者大型跨国公司的自助餐厅里得到了实现。Squid（也可做代理服务）就是这样一个应用程序，它既可以被作为代理服务器，同时也是在其同类工具中比较被广泛使用的一种。

This Interview article aims at strengthening your base from Interview point on the ground of proxy server and squid.

![Squid Interview Questions](http://www.tecmint.com/wp-content/uploads/2014/07/Squid-Interview-Questions.png)
以下为访谈问答的内容

### 1. What do you mean by Proxy Server? What is the use of Proxy Server in Computer Networks? ###

> **回答** : A Proxy Server refers to physical machine or Application which acts intermediate between client and resource provider or server. A client seeks for file, page or data from the the proxy server and proxy server manages to get the requested demand of client fulfilled by handling all the complexities in between.

Proxy servers are the backbone of WWW (World Wide Web). Most of the proxies of today are web proxies. A proxy server handles the complexity in between the Communication of client and Server. Moreover it provides anonymity on the web which simply means your identity and digital footprints are safe. Proxies can be configured to allow which sites client can see and which sites are blocked.

### 2. What is Squid? ###

> **回答** : Squid is an Application software released under GNU/GPL which acts as a proxy server as well as web cache Daemon. Squid primarily supports Protocol like HTTP and FTP however other protocols like HTTPS, SSL,TLS, etc are well supported. The feature web cache Daemon makes web surfing faster by caching web and DNS for frequently visited websites. Squid is known to support all major platforms including Linux, UNIX, Microsoft Windows and Mac.

### 3. What is the default port of squid and how to change its operating port? ###

> **回答** : The default port on which squid runs is 3128. We can change the operating port of squid from default to any custom unused port by editing its configuration file which is located at /etc/squid/squid.conf as suggested below.

Open ‘/etc/squid/squid.conf’ file and with your choice of editor.

    # nano /etc/squid/squid.conf

Now change this port to any other unused port. Save the editor and exit.

    http_port 3128

Restart the squid service as shown below.

    # service squid restart

### 4. You works for a company the management of which ask you to block certain domains through squid proxy server. What are you going to do? ###

> **回答** : Blocking domain is a module which is implemented well in the configuration file. We just need to perform a little manual configuration as suggested below.

a. Create a file say ‘blacklist’ under directory ‘/etc/squid’.

    # touch /etc/squid/blacklist

b. Open the file ‘/etc/squid/blacklist’ with nano editor.

     # nano /etc/squid/blacklist

c. Add all the domains to the file blacklist with one domain per line.

    .facebook.com
    .twitter.com
    .gmail.com
    .yahoo.com
    ...

d. Save the file and exit. Now open the Squid configuration file from location ‘/etc/squid/squid.conf’.

    # nano /etc/squid/squid.conf

e. Add the lines below to the Squid configuration file.

    acl BLACKLIST dstdom_regex -i “/etc/squid/blacklist”
    http_access deny blacklist

f. Save the configuration file and exit. Restart Squid service to make the changes effective.

    # service squid restart

### 5. What is Media Range Limitation and partial download in Squid? ###

> **Answer** : Media Range Limitation is a special feature of squid in which just the required data is requested from the server and not the whole file. This feature is very well implemented in various videos streaming websites like Youtube and Metacafe where a user can click on the middle of progress bar hence whole video need not be fetched except for the requested part.

The squid’s feature of partial download is implemented well within windows update where downloads are requested in the form of small packets which can be paused. Because of this feature a update downloading windows machine can be restarted without any fear of data loss. Squid makes the Media Range Limitation and Partial Download possible only after storing a copy of whole data in it. Moreover the partial download gets deleted and not cached when user points to another page until Squid is specially configured somehow.

### 6. What is reverse proxy in squid? ###

> **Answer** : Reverse proxy is a feature of Squid which is used to accelerate the web surfing for end user. Say the Real server ‘RS’ contains the resource and ‘PS’ is the proxy Server. The client seek some data which is available at RS. It will rely on RS for the specified data for the first time and the copy of that specified data gets stored on PS for configurable amount of time. For every request for that data from now PS becomes the real source. This results in Less traffic, Lesser CPU usages, Lesser web resource utilization and hence lesser load to actual server RS. But RS has no statistics for the total traffic since PS acted as actual server and no Client reached RS. ‘X-Forwarded-For HTTP’ can be used to log the client IP although on RS.

Technically it is feasible to use single squid server to act both as normal proxy server and reverse proxy server at the same point of time.

### 7. Since Squid can be used as web-cache Daemon, is it possible to Clear its Cache? How? ###

> **Answer** : No Doubt! Squid acts as web-cache Daemon which is used to accelerate web surfing still it is possible to clear its cache and that too very easily.

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

> **Answer** : Data stored by Squid is in ufs format. Ufs is the old well-known Squid storage format.

### 10. Where do cache gets stored by squid? ###

> **Answer** : A squid stores cache in special folder at the location ‘/var/spool/squid’.

That’s all for now. I’ll be here again with another interesting article soon. Till then stay tuned and connected to Tecmint. Don’t forget to provide us with your valuable feedback the comment section below.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/squid-interview-questions/

作者：[Avishek Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
