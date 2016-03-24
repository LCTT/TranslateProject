Linux有问必答：如何在curl中设置自定义的HTTP头
================================================================================
> **问题**：我正尝试使用curl命令获取一个URL，但除此之外我还想在传出的HTTP请求中设置一些自定义的头部字段。我如何能够在curl中使用自定义的HTTP头呢？

curl是一个强大的命令行工具，它可以通过网络将信息传递给服务器或者从服务器获取数据。他支持很多的传输协议，尤其是HTTP/HTTPS以及其他诸如FTP/FTPS， RTSP， POP3/POP3S, SCP, IMAP/IMAPS协议等。当你使用curl向一个URL发送HTTP请求的时候，它会使用一个默认只包含必要的头部字段（如：User-Agent, Host, and Accept）的HTTP头。

![](https://farm8.staticflickr.com/7568/16225032086_fb8f1c508a_b.jpg)

在一些个例中，或许你想要在一个HTTP请求中覆盖掉默认的HTTP头或者添加一个新的自定义头部字段。例如，你或许想要重写“HOST”字段来测试一个[负载均衡][1]，或者通过重写"User-Agent"字符串来假冒特定浏览器以解决一些访问限制的问题。

为了解决所有这些问题，curl提供了一个简单的方法来完全控制传出HTTP请求的HTTP头。你需要的这个参数是“-H” 或者 “--header”。

为了定义多个HTTP头部字段，"-H"选项可以在curl命令中被多次指定。

例如：以下命令设置了3个HTTP头部字段。也就是说，重写了“HOST”字段，并且添加了两个字段（"Accept-Language" 和 "Cookie"）

    $ curl -H 'Host: 157.166.226.25' -H 'Accept-Language: es' -H 'Cookie: ID=1234' http://cnn.com

![](https://farm8.staticflickr.com/7520/16250111432_de39638ec0_c.jpg)

对于"User-Agent", "Cookie", "Host"这类标准的HTTP头部字段，通常会有另外一种设置方法。curl命令提供了特定的选项来对这些头部字段进行设置：

- **-A (or --user-agent)**: 设置 "User-Agent" 字段.
- **-b (or --cookie)**: 设置 "Cookie" 字段.
- **-e (or --referer)**: 设置 "Referer" 字段. 

例如，以下两个命令是等效的。这两个命令同样都对HTTP头的"User-Agent"字符串进行了更改。

    $ curl -H "User-Agent: my browser" http://cnn.com
    $ curl -A "my browser" http://cnn.com

wget是另外一个类似于curl，可以用来获取URL的命令行工具。并且wget也一样允许你使用一个自定义的HTTP头。点击[这里][2]查看wget命令的详细信息。

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/custom-http-header-curl.html

译者：[Ping](http://mr-ping.com)  
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://xmodulo.com/haproxy-http-load-balancer-linux.html
[2]:http://xmodulo.com/how-to-use-custom-http-headers-with-wget.html