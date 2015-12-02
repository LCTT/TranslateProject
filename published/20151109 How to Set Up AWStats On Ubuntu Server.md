如何在 Ubuntu 服务器中配置 AWStats
================================================================================
![](https://www.maketecheasier.com/assets/uploads/2015/10/Apache_awstats_featured.jpg)

AWStats 是一个开源的网站分析报告工具，可以生成强大的网站、流媒体、FTP 或邮件服务器的访问统计图。此日志分析器以 CGI 或命令行方式进行工作，并在网页中以图表的形式尽可能的显示你日志中所有的信息。它可以“部分”读取信息文件，以便能够频繁并快速处理大量的日志文件。它支持绝大多数 Web 服务器日志文件格式，包括 Apache，IIS 等。

本文将帮助你在 Ubuntu 上安装配置 AWStats。

### 安装 AWStats 包 ###

默认情况下，AWStats 的包可以在 Ubuntu 仓库中找到。

可以通过运行下面的命令来安装：

    sudo apt-get install awstats

接下来，你需要启用 Apache 的 CGI 模块。

运行以下命令来启动 CGI：

    sudo a2enmod cgi

现在，重新启动 Apache 以使改变生效。

    sudo /etc/init.d/apache2 restart

### 配置 AWStats ###

你需要为你想要查看统计的每个域或网站创建一个配置文件。在这个例子中，我们将为 “test.com” 创建一个配置文件。

要完成此步，你可以通过复制 AWStats 的默认配置文件来配置你要统计的域。

    sudo cp /etc/awstats/awstats.conf /etc/awstats/awstats.test.com.conf

现在，你需要在配置文件中做一些修改：

    sudo nano /etc/awstats/awstats.test.com.conf

像下面这样修改一下:

    # Change to Apache log file, by default it's /var/log/apache2/access.log
    LogFile="/var/log/apache2/access.log"
     
    # Change to the website domain name
    SiteDomain="test.com"
    HostAliases="www.test.com localhost 127.0.0.1"
     
    # When this parameter is set to 1, AWStats adds a button on report page to allow to "update" statistics from a web browser
    AllowToUpdateStatsFromBrowser=1

保存并关闭文件。

修改配置文件后，你需要用服务器的当前日志建立初步统计。你可以这样做：

    sudo /usr/lib/cgi-bin/awstats.pl -config=test.com -update

输出会是这个样子:

![awtstats](https://www.maketecheasier.com/assets/uploads/2015/10/awtstats.png)

### 为 Apache 配置 AWStats ###

接下来，你需要配置 Apache2 来显示统计数据。现在你需要将 “cgi-bin” 文件夹中的内容复制到 Apache 默认根目录下。默认它是在 “/usr/lib/cgi-bin”。

运行以下命令来完成此步:

    sudo cp -r /usr/lib/cgi-bin /var/www/html/
    sudo  chown www-data:www-data /var/www/html/cgi-bin/
    sudo chmod -R 755 /var/www/html/cgi-bin/

### 测试 AWStats ###

现在，您可以通过访问 url “http://your-server-ip/cgi-bin/awstats.pl?config=test.com.” 来查看 AWStats 的页面。

它的页面像下面这样：

![awstats_page](https://www.maketecheasier.com/assets/uploads/2015/10/awstats_page.jpg)

### 设置定时任务来更新日志 ###

建议你创建一个定时任务，使用新创建的日志条目定期更新 AWStats 的数据库，然后统计会定期更新。这也将节省你的时间。

要做到这一点，你需要编辑 “/etc/crontab” 文件:

    sudo nano /etc/crontab

添加下面那一行来让 AWStats 每十分钟更新一次。

    */10 * * * * root /usr/lib/cgi-bin/awstats.pl -config=test.com -update

保存并关闭文件。

### 结论 ###

AWStats 是一个非常有用的工具，可以让你对网站的状况了如指掌，并能协助你分析网站。它非常容易安装和配置。如果你有任何疑问，请在下面发表评论。

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/set-up-awstats-ubuntu/

作者：[Hitesh Jethva][a]
译者：[strugglingyouth](https://github.com/strugglingyouth)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/hiteshjethva/
