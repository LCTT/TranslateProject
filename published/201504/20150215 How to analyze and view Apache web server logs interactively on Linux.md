在 Linux 中以交互方式实时查看Apache web访问统计
================================================================================

无论你是在网站托管业务，还是在自己的VPS上运行几个网站，你总会有需要显示访客统计信息，例如前几的访客、访问请求的文件（无论动态或者静态）、所用的带宽、客户端的浏览器，和访问的来源网站，等等。

[GoAccess][1] 是一款用于Apache或者Nginx的命令行日志分析器和交互式查看器。使用这款工具，你不仅可以浏览到之前提及的相关数据，还可以通过分析网站服务器日志来进一步挖掘数据 - 而且**这一切都是在一个终端窗口实时输出的**。由于今天的[大多数web服务器][2]都使用Debian的衍生版或者基于RedHat的发行版来作为底层操作系统，所以本文中我告诉你如何在Debian和CentOS中安装和使用GoAccess。

### 在Linux系统安装GoAccess ###

在Debian，Ubuntu及其衍生版本，运行以下命令来安装GoAccess：

    # aptitude install goaccess 

在CentOS中，你将需要使你的[EPEL 仓库][3]可用然后执行以下命令：

    # yum install goaccess

在Fedora，同样使用yum命令：

    # yum install goaccess 


如果你想从源码安装GoAccess来使用更多功能（例如 GeoIP 定位功能），需要在你的操作系统安装[必需的依赖包][4]，然后按以下步骤进行：

    # wget http://tar.goaccess.io/goaccess-0.8.5.tar.gz   
    # tar -xzvf goaccess-0.8.5.tar.gz
    # cd goaccess-0.8.5/
    # ./configure --enable-geoip
    # make
    # make install 

以上安装的版本是 0.8.5，但是你也可以在该软件的网站[下载页][5]确认是否是最新版本。

由于GoAccess不需要后续的配置，一旦安装你就可以马上使用。

### 运行 GoAccess ###

开始使用GoAccess，只需要对它指定你的Apache访问日志。

对于Debian及其衍生版本：

    # goaccess -f /var/log/apache2/access.log

基于红帽的发行版：

    # goaccess -f /var/log/httpd/access_log 

当你第一次启动GoAccess，你将会看到如下的屏幕中选择日期和日志格式。正如前面所述，你可以按空格键进行选择，并按F10确认。至于日期和日志格式，你可能需要参考[Apache 文档][6]来刷新你的记忆。

在这个例子中，选择常见日志格式（Common Log Format(CLF)）：

![](https://farm8.staticflickr.com/7422/15868350373_30c16d7c30.jpg)

然后按F10 确认。你将会从屏幕上看到统计数据。为了简洁起见，这里只显示了首部，也就是日志文件的摘要，如下图所示：

![](https://farm9.staticflickr.com/8683/16486742901_7a35b5df69_b.jpg)

### 通过 GoAccess来浏览网站服务器统计数据 ###

你可以按向下的箭头滚动页面，你会发现以下区域，它们是按请求排序的。这里提及的目录顺序可能会根据你的发行版或者你所选的安装方式（从源和库）不同而不同：

1. 每天唯一访客（来自同样IP、同一日期和同一浏览器的请求被认为是是唯一访问）

	![](https://farm8.staticflickr.com/7308/16488483965_a439dbc5e2_b.jpg)

2. 请求的文件（网页URL）

	![](https://farm9.staticflickr.com/8651/16488483975_66d05dce51_b.jpg)

3. 请求的静态文件（例如，.png文件，.js文件等等）

4. 来源的URLs（每一个URL请求的出处）

5. HTTP 404 未找到的响应代码

	![](https://farm9.staticflickr.com/8669/16486742951_436539b0da_b.jpg)

6. 操作系统

7. 浏览器

8. 主机地址（客户端IP地址）

	![](https://farm8.staticflickr.com/7392/16488483995_56e706d77c_z.jpg)

9. HTTP 状态代码

	![](https://farm8.staticflickr.com/7282/16462493896_77b856f670_b.jpg)

10. 前几位的来源站点

11. 来自谷歌搜索引擎的前几位的关键字

如果你想要检查已经存档的日志，你可以通过管道将它们发送给GoAccess，如下：

在Debian及其衍生版本：

    # zcat -f /var/log/apache2/access.log* | goaccess 

在基于红帽的发行版：

    # cat /var/log/httpd/access* | goaccess 

如果你需要上述部分的详细报告（1至11项），直接按下其序号再按O（大写o），就可以显示出你需要的详细视图。下面的图像显示5-O的输出（先按5，再按O）

![](https://farm8.staticflickr.com/7382/16302213429_48d9233f40_b.jpg)

如果要显示GeoIP位置信息，打开主机部分的详细视图，如前面所述，你将会看到正在请求你的服务器的客户端IP地址所在的位置。

![](https://farm8.staticflickr.com/7393/16488484075_d778aa91a2_z.jpg)

如果你的系统还不是很忙碌，以上提及的章节将不会显示大量的信息，但是这种情形可以通过在你网站服务器越来越多的请求发生改变。

###  保存用于离线分析的报告 ###

有时候你不想每次都实时去检查你的系统状态，可以保存一份在线的分析文件或打印出来。要生成一个HTML报告，只需要通过之前提到GoAccess命令，将输出来重定向到一个HTML文件即可。然后，用web浏览器来将这份报告打开即可。

    # zcat -f /var/log/apache2/access.log* | goaccess > /var/www/webserverstats.html

一旦报告生成，你将需要点击展开的链接来显示每个类别详细的视图信息：

![](https://farm9.staticflickr.com/8658/16486743041_bd8a80794d_o.png)

可以查看youtube视频：https://youtu.be/UVbLuaOpYdg 。

正如我们通过这篇文章讨论，GoAccess是一个非常有价值的工具，它能给系统管理员实时提供可视的HTTP 统计分析。虽然GoAccess的默认输出是标准输出，但是你也可以将他们保存到JSON，HTML或者CSV文件。这种转换可以让 GoAccess在监控和显示网站服务器的统计数据时更有用。

--------------------------------------------------------------------------------

via: http://xmodulo.com/interactive-apache-web-server-log-analyzer-linux.html

作者：[Gabriel Cánepa][a]
译者：[disylee](https://github.com/disylee)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/gabriel
[1]:http://goaccess.io/
[2]:http://w3techs.com/technologies/details/os-linux/all/all
[3]:http://linux.cn/article-2324-1.html
[4]:http://goaccess.io/download#dependencies
[5]:http://goaccess.io/download
[6]:http://httpd.apache.org/docs/2.4/logs.html
