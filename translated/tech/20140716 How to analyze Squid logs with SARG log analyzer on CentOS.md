如何用CentOS上的SARG log分析其来分析Squid的log
================================================================================
[上一节教程][1]中，我们战士了如何在CentOS上使用Squid配置透明代理。Squid提供了很多有用的特性，但是分析一个原始Squid日志文件并不直接。比如，你如何分析下面Squid log中的时间戳和数字？

    1404788984.429   1162 172.17.1.23 TCP_MISS/302 436 GET http://facebook.com/ - DIRECT/173.252.110.27 text/html
    1404788985.046  12416 172.17.1.23 TCP_MISS/200 4169 CONNECT stats.pusher.com:443 - DIRECT/173.255.223.127 -
    1404788986.124    174 172.17.1.23 TCP_MISS/200 955 POST http://ocsp.digicert.com/ - DIRECT/117.18.237.29 application/ocsp-response
    1404788989.738    342 172.17.1.23 TCP_MISS/200 3890 CONNECT www.google.com:443 - DIRECT/74.125.200.106 -
    1404788989.757    226 172.17.1.23 TCP_MISS/200 942 POST http://clients1.google.com/ocsp - DIRECT/74.125.200.113 application/ocsp-response
    1404788990.839   3939 172.17.1.23 TCP_MISS/200 78944 CONNECT fbstatic-a.akamaihd.net:443 - DIRECT/184.26.162.35 -
    1404788990.846   2148 172.17.1.23 TCP_MISS/200 118947 CONNECT fbstatic-a.akamaihd.net:443 - DIRECT/184.26.162.35 -
    1404788990.849   2151 172.17.1.23 TCP_MISS/200 76809 CONNECT fbstatic-a.akamaihd.net:443 - DIRECT/184.26.162.35 -
    1404788991.140    611 172.17.1.23 TCP_MISS/200 110073 CONNECT fbstatic-a.akamaihd.net:443 - DIRECT/184.26.162.35 –

SARG（或者说是Squid分析报告生成器）是一款基于web的工具，用于从Squid日志中生成报告。SARG提供了一个易于理解的由Squid处理的网络流量视图，并且它很容易设置与维护。在下面的教程中，我们会展示**如何在CentOS平台上设置SARG**。

我们使用yum来安装安装必要的依赖。

    # yum install gcc make wget httpd crond 

在启动时加载必要的服务

    # service httpd start; service crond start
    # chkconfig httpd on; chkconfig crond on 

现在我们下载并解压SARG

    # wget http://downloads.sourceforge.net/project/sarg/sarg/sarg-2.3.8/sarg-2.3.8.tar.gz?
    # tar zxvf sarg-2.3.8.tar.gz
    # cd sarg-2.3.8 

**注意**: 对于64位的Linux，log.c的源代码需要用下面的文件打补丁。

    1506c1506
    <            if (fprintf(ufile->file, "%s\t%s\t%s\t%s\t%"PRIi64"\t%s\t%ld\t%s\n",dia,hora,ip,url,nbytes,code,elap_time,smartfilter)<=0) {
    ---
    >            if (fprintf(ufile->file, "%s\t%s\t%s\t%s\t%"PRIi64"\t%s\t%ld\t%s\n",dia,hora,ip,url,(int64_t)nbytes,code,elap_time,smartfilter)<=0) {
    1513c1513
    <                fprintf(fp_log, "%s\t%s\t%s\t%s\t%s\t%"PRIi64"\t%s\t%ld\t%s\n",dia,hora,user,ip,url,nbytes,code,elap_time,smartfilter);
    ---
    >                fprintf(fp_log, "%s\t%s\t%s\t%s\t%s\t%"PRIi64"\t%s\t%ld\t%s\n",dia,hora,user,ip,url,(int64_t)nbytes,code,elap_time,smartfilter);
    1564c1564
    <                printf("LEN=\t%"PRIi64"\n",nbytes);
    ---
    >                printf("LEN=\t%"PRIi64"\n",(int64_t)nbytes);

如下继续并编译/安装SARG

    # ./configure
    # make
    # make install 

SARG安装之后，配置文件可以按你的要求修改。下面是一个SARG配置的例子。

    # vim /usr/local/etc/sarg.conf 

----------

    access_log /var/log/squid/access.log
    temporary_dir /tmp
    output_dir /var/www/html/squid-reports
    date_format e     ## We use Europian DD-MM-YYYY format here ##
    ## we don’t want multiple reports for single day/week/month ##
    overwrite_report yes

现在是时候测试运行了，我们用调试模式运行sarg来找出是否存在错误。

    # sarg -x

如果i一切正常，sarg会根系Squid日志，并在/var/www/html/squid-reports下创建报告。报告也可以在浏览器中通过地址http://<服务器IP>/squid-reports/访问

![](https://farm3.staticflickr.com/2931/14631403935_4ff34e07b9_z.jpg)

![](https://farm4.staticflickr.com/3901/14629281644_fec31014c5_z.jpg)

、SARG可以用于创建每日、每周、每月的报告。时间范围用“-d”参数来指定，可能的值的形式可能为day-n、 week-n 或者 month-n，n的值向后天/周/月的数量。比如，使用week-1,SARG会生成前面一星期的报告。使用day-2,SARG会准备前面两天的报告。

作为演示，我们会准备一个计划任务来每天运行SARG。

    # vim /etc/cron.daily/sarg 

----------

    #!/bin/sh
    /usr/local/bin/sarg -d day-1

文件需要可执行权限。

    # chmod 755 /usr/local/bin/sarg 

现在SARG应该会每天准备关于Squid管理的流量报告。这些报告可以很容易地通过SARG网络接口访问。

To sum up, SARG is a web based tool that analyzes Squid logs and presents the analysis in an informative way. System admins can leverage SARG to monitor what sites are being accessed, and to keep track of top visited sites and top users. This tutorial covers a working configuration for SARG. You can customize the configuration even further to match your requirements.
总结一下，SARG一款基于网络的工具，它可以分析Squid日志，并以更详细的方式展示分析。系统管理员可以利用SARG来监视哪些网站被访问了，并跟踪访问量最大的网站和用户。本教程涵盖了SARG配置工作。你甚至可以进一步自定义配置来满足您的要求。

希望这篇教程有用

----------

[Sarmed Rahman][w]

- [Twitter 地址][t]
- [LinkedIn 地址][l]

Sarmed Rahman是一名在孟加拉国的IT专业人士。他坚持写作科学文章，并坚信技术可以通过分享提高。在他的空闲时间里，他爱好游戏与他的朋友在一起

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/07/analyze-squid-logs-sarg-log-analyzer-centos.html

译者：[geekpi](https://github.com/geekpi) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://xmodulo.com/2014/06/squid-transparent-web-proxy-centos-rhel.html
[w]:http://amar-linux.blogspot.com/
[t]:http://twitter.com/SarmedRahman
[l]:http://www.linkedin.com/in/sarmedrahman
