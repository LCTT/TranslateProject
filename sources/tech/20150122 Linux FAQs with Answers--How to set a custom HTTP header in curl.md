Linux FAQs with Answers--How to set a custom HTTP header in curl
================================================================================
> **Question**: I am trying to fetch a URL with curl command, but want to set a few custom header fields in the outgoing HTTP request. How can I use a custom HTTP header with curl?

curl is a powerful command-line tool that can transfer data to and from a server over network. It supports a number of transfer protocols, notably HTTP/HTTPS, and many others such as FTP/FTPS, RTSP, POP3/POP3S, SCP, IMAP/IMAPS, etc. When you send out an HTTP request for a URL with curl, it uses a default HTTP header with only essential header fields (e.g., User-Agent, Host, and Accept).

![](https://farm8.staticflickr.com/7568/16225032086_fb8f1c508a_b.jpg)

In some cases, however, you may want to override the default header or even add a custom header field in an HTTP request. For example, you may want to override "Host" field to test a [load balancer][1], or spoof "User-Agent" string to get around browser-specific access restriction. In other cases, you may be accessing a website which requires a specific cookie, or testing a REST-ful API with various custom parameters in the header.

To handle all these cases, curl provides an easy way to fully control the HTTP header of outgoing HTTP requests. The parameter you want to use is "-H" or equivalently "--header".

The "-H" option can be specified multiple times with curl command to define more than one HTTP header fields.

For example, the following command sets three HTTP header fields, i.e., overriding "Host" field, and add two fields ("Accept-Language" and "Cookie").

    $ curl -H 'Host: 157.166.226.25' -H 'Accept-Language: es' -H 'Cookie: ID=1234' http://cnn.com

![](https://farm8.staticflickr.com/7520/16250111432_de39638ec0_c.jpg)

For standard HTTP header fields such as "User-Agent", "Cookie", "Host", there is actually another way to setting them. The curl command offers designated options for setting these header fields:

- **-A (or --user-agent)**: set "User-Agent" field.
- **-b (or --cookie)**: set "Cookie" field.
- **-e (or --referer)**: set "Referer" field. 

For example, the following two commands are equivalent. Both of them change "User-Agent" string in the HTTP header.

    $ curl -H "User-Agent: my browser" http://cnn.com
    $ curl -A "my browser" http://cnn.com

wget is another command-line tool which you can use to fetch a URL similar to curl, and wget also allows you to use a custom HTTP header. Check out [this post][2] for details on wget command.

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/custom-http-header-curl.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://xmodulo.com/haproxy-http-load-balancer-linux.html
[2]:http://xmodulo.com/how-to-use-custom-http-headers-with-wget.html