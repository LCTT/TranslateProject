
如何收集NGINX指标 - 第2部分
================================================================================
![](http://www.datadoghq.com/wp-content/uploads/2015/07/NGINX_hero_2.png)

### 如何获取你所需要的NGINX指标 ###

如何获取需要的指标取决于你正在使用的 NGINX 版本。（参见 [the companion article][1] 将深入探索NGINX指标。）免费，开源版的 NGINX 和商业版的 NGINX 都有指标度量的状态模块，NGINX 也可以在其日志中配置指标模块：

注：表格
<table>
<colgroup>
<col style="text-align: left;">
<col style="text-align: center;">
<col style="text-align: center;">
<col style="text-align: center;"> </colgroup>
<thead>
<tr>
<th rowspan="2" style="text-align: left;">Metric</th>
<th colspan="3" style="text-align: center;">Availability</th>
</tr>
<tr>
<th style="text-align: center;"><a href="https://www.datadoghq.com/blog/how-to-collect-nginx-metrics/#open-source">NGINX (open-source)</a></th>
<th style="text-align: center;"><a href="https://www.datadoghq.com/blog/how-to-collect-nginx-metrics/#plus">NGINX Plus</a></th>
<th style="text-align: center;"><a href="https://www.datadoghq.com/blog/how-to-collect-nginx-metrics/#logs">NGINX logs</a></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">accepts / accepted</td>
<td style="text-align: center;">x</td>
<td style="text-align: center;">x</td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: left;">handled</td>
<td style="text-align: center;">x</td>
<td style="text-align: center;">x</td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: left;">dropped</td>
<td style="text-align: center;">x</td>
<td style="text-align: center;">x</td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: left;">active</td>
<td style="text-align: center;">x</td>
<td style="text-align: center;">x</td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: left;">requests / total</td>
<td style="text-align: center;">x</td>
<td style="text-align: center;">x</td>
<td style="text-align: center;"></td>
</tr>
<tr>
<td style="text-align: left;">4xx codes</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">x</td>
<td style="text-align: center;">x</td>
</tr>
<tr>
<td style="text-align: left;">5xx codes</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">x</td>
<td style="text-align: center;">x</td>
</tr>
<tr>
<td style="text-align: left;">request time</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;">x</td>
</tr>
</tbody>
</table>

#### 指标收集：NGINX（开源版） ####

开源版的 NGINX 会显示几个与服务器状态有关的指标在状态页面上，只要你启用了 HTTP [stub status module][2] 。要检查模块是否被加载，运行以下命令：

    nginx -V 2>&1 | grep -o with-http_stub_status_module 

如果你看到 http_stub_status_module 被输出在终端，说明状态模块已启用。

如果该命令没有输出，你需要启用状态模块。你可以使用 --with-http_stub_status_module 参数去配置 [building NGINX from source][3]:

    ./configure \
    … \
    --with-http_stub_status_module
    make
    sudo make install

验证模块已经启用或你自己启用它后，你还需要修改 NGINX 配置文件为状态页面设置本地访问的 URL（例如，/ nginx_status）：

    server {
        location /nginx_status {
            stub_status on;
     
            access_log off;
            allow 127.0.0.1;
            deny all;
        }
    }

注：nginx 配置中的 server 块通常并不在主配置文件中（例如，/etc/nginx/nginx.conf），但主配置中会加载补充的配置文件。要找到主配置文件，首先运行以下命令：

    nginx -t 

打开主配置文件，在以 http 模块结尾的附近查找以 include 开头的行包，如：

    include /etc/nginx/conf.d/*.conf; 

在所包含的配置文件中，你应该会找到主服务器模块，你可以如上所示修改 NGINX 的指标报告。更改任何配置后，通过执行以下命令重新加载配置文件：

    nginx -s reload 

现在，你可以查看指标的状态页：

    Active connections: 24 
    server accepts handled requests
    1156958 1156958 4491319
    Reading: 0 Writing: 18 Waiting : 6 

请注意，如果你正试图从远程计算机访问状态页面，则需要将远程计算机的 IP 地址添加到你的状态配置文件的白名单中，在上面的配置文件中 127.0.0.1 仅在白名单中。

nginx 的状态页面是一中查看指标快速又简单的方法，但当连续监测时，你需要每隔一段时间自动记录该数据。然后通过监控工具箱 [Nagios][4] 或者 [Datadog][5]，以及收集统计信息的服务 [collectD][6] 来分析已保存的 NGINX 状态信息。

#### 指标收集: NGINX Plus ####

商业版的 NGINX Plus 通过 ngx_http_status_module 提供的可用指标比开源版 NGINX 更多 [many more metrics][7] 。NGINX Plus 附加了更多的字节流指标，以及负载均衡系统和高速缓存的信息。NGINX Plus 还报告所有的 HTTP 状态码类型（1XX，2XX，3XX，4XX，5XX）的计数。一个简单的 NGINX Plus 状态报告 [here][8]。

![NGINX Plus status board](https://d33tyra1llx9zy.cloudfront.net/blog/images/2015-06-nginx/status_plus-2.png)

*注： NGINX Plus 在状态仪表盘"Active”连接定义的收集指标的状态模块和开源 NGINX 的略有不同。在 NGINX Plus 指标中，活动连接不包括等待状态（又叫空闲连接）连接。*

NGINX Plus 也集成了其他监控系统的报告 [JSON格式指标][9] 。用 NGINX Plus 时，你可以看到 [负载均衡服务器组的][10]指标和健康状况，或着再向下能取得的仅是响应代码计数[从单个服务器][11]在负载均衡服务器中：
    {"1xx":0,"2xx":3483032,"3xx":0,"4xx":23,"5xx":0,"total":3483055}

启动 NGINX Plus 指标仪表盘，你可以在 NGINX 配置文件的 http 块内添加状态 server 块。 ([参见上一页][12]查找相关的配置文件，收集开源 NGINX  版指标的说明。）例如，设立以下一个状态仪表盘在http：//your.ip.address：8080/status.html 和一个 JSON 接口 http：//your.ip.address：8080/status，可以添加以下 server block 来设定：

    server {
        listen 8080;
        root /usr/share/nginx/html;
     
        location /status {
            status;
        }
     
        location = /status.html {
        }
    }

一旦你重新加载 NGINX 配置，状态页就会被加载：

    nginx -s reload 

关于如何配置扩展状态模块，官方 NGINX Plus 文档有 [详细介绍][13] 。

#### 指标收集：NGINX日志 ####

NGINX 的 [日志模块][14] 写到配置可以自定义访问日志到指定文件。你可以自定义日志的格式和时间通过 [添加或移除变量][15]。捕获日志的详细信息，最简单的方法是添加下面一行在你配置文件的server 块中（参见[此节][16] 通过加载配置文件的信息来收集开源 NGINX 的指标）：

    access_log logs/host.access.log combined;

更改 NGINX 配置文件后，必须要重新加载配置文件：

    nginx -s reload

“combined” 的日志格式，只包含默认参数，包括[一些关键数据][17]，如实际的 HTTP 请求和相应的响应代码。在下面的示例日志中，NGINX 记录了200（成功）状态码当请求 /index.html 时和404（未找到）错误不存在的请求文件 /fail。

    127.0.0.1 - - [19/Feb/2015:12:10:46 -0500] "GET /index.html HTTP/1.1" 200 612 "-" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari 537.36"
    
    127.0.0.1 - - [19/Feb/2015:12:11:05 -0500] "GET /fail HTTP/1.1" 404 570 "-" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36"

你可以记录请求处理的时间通过添加一个新的日志格式在 NGINX 配置文件中的 http 块：

    log_format nginx '$remote_addr - $remote_user [$time_local] '
                     '"$request" $status $body_bytes_sent $request_time '
                     '"$http_referer" "$http_user_agent"';

通过修改配置文件中 server 块的 access_log 行：    

    access_log logs/host.access.log nginx;

重新加载配置文件（运行 nginx -s reload）后，你的访问日志将包括响应时间，如下图所示。单位为秒，毫秒。在这种情况下，服务器接收 /big.pdf 的请求时，发送33973115字节后返回206（成功）状态码。处理请求用时0.202秒（202毫秒）：

    127.0.0.1 - - [19/Feb/2015:15:50:36 -0500] "GET /big.pdf HTTP/1.1" 206 33973115 0.202 "-" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36"

你可以使用各种工具和服务来收集和分析 NGINX 日志。例如，[rsyslog][18] 可以监视你的日志，并将其传递给多个日志分析服务;你也可以使用免费的开源工具，如[logstash][19]来收集和分析日志;或者你可以使用一个统一日志记录层，如[Fluentd][20]来收集和分析你的 NGINX 日志。

### 结论 ###

监视 NGINX 的哪一项指标将取决于你提供的工具，以及是否由给定指标证明监控指标的开销。例如，通过收集和分析日志来定位问题是非常重要的在 NGINX Plus 或者 运行的系统中。

在 Datadog 中，我们已经集成了 NGINX 和 NGINX Plus，这样你就可以以最小的设置来收集和监控所有 Web 服务器的指标。了解如何用 NGINX Datadog来监控 [在本文中][21]，并开始使用 [免费的Datadog][22]。

----------

原文在这 [on GitHub][23]。问题，更正，补充等？请[让我们知道][24]。

--------------------------------------------------------------------------------

via: https://www.datadoghq.com/blog/how-to-collect-nginx-metrics/

作者：K Young
译者：[strugglingyouth](https://github.com/strugglingyouth)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:https://www.datadoghq.com/blog/how-to-monitor-nginx/
[2]:http://nginx.org/en/docs/http/ngx_http_stub_status_module.html
[3]:http://wiki.nginx.org/InstallOptions
[4]:https://exchange.nagios.org/directory/Plugins/Web-Servers/nginx
[5]:http://docs.datadoghq.com/integrations/nginx/
[6]:https://collectd.org/wiki/index.php/Plugin:nginx
[7]:http://nginx.org/en/docs/http/ngx_http_status_module.html#data
[8]:http://demo.nginx.com/status.html
[9]:http://demo.nginx.com/status
[10]:http://demo.nginx.com/status/upstreams/demoupstreams
[11]:http://demo.nginx.com/status/upstreams/demoupstreams/0/responses
[12]:https://www.datadoghq.com/blog/how-to-collect-nginx-metrics/#open-source
[13]:http://nginx.org/en/docs/http/ngx_http_status_module.html#example
[14]:http://nginx.org/en/docs/http/ngx_http_log_module.html
[15]:http://nginx.org/en/docs/http/ngx_http_log_module.html#log_format
[16]:https://www.datadoghq.com/blog/how-to-collect-nginx-metrics/#open-source
[17]:http://nginx.org/en/docs/http/ngx_http_log_module.html#log_format
[18]:http://www.rsyslog.com/
[19]:https://www.elastic.co/products/logstash
[20]:http://www.fluentd.org/
[21]:https://www.datadoghq.com/blog/how-to-monitor-nginx-with-datadog/
[22]:https://www.datadoghq.com/blog/how-to-collect-nginx-metrics/#sign-up
[23]:https://github.com/DataDog/the-monitor/blob/master/nginx/how_to_collect_nginx_metrics.md
[24]:https://github.com/DataDog/the-monitor/issues
