Linux 有问必答：如何在wget中禁用HTTP转发
================================================================================
> **提问**： 当我用wget获取一个重定向到URL Y的URL X的时候，wget默认会自动获取URL Y。然而我想要强制获取不带重定向的URL X。我该如何禁用wget重定向URL的功能。

在HTTP标准中，重定向响应（带3XX的HTTP响应）说明请求的URL被移到了新的位置。重定向相应接着包含了目标重定向的URL。

像常规的HTTP客户端，wget支持URL重定向（也叫URL转发），意味着当你尝试下载一个重定向的URL时，wget会自动跟随URL重定向获取重定向后的资源。如果你由于一些原因想要禁用URL重定向，并停止3XX的状态码，你可以使用wget的“--max-redirect=number”选项。这个选项用来指定最大（递归）重定向的数字，默认是20。

如果你想要禁用wget中的HTTP重定向，使用“--max-redirect=0”

    $ wget --max-redirect=0 http://www.aaa.com/a.html

----------

    --2014-10-31 23:08:58--  http://www.aaa.com/a.html
    Resolving aaa.com (aaa.com)... 1.2.3.4
    Connecting to aaa.com (aaa.com)|1.2.3.4|:80... connected.
    HTTP request sent, awaiting response... 301 Moved Permanently
    Location: http://www.bbb.com/b.html [following]
    0 redirections exceeded.

如你所见，当wget遇到HTTP重定向响应时，它不会跟着重定向，并以“0 redirections exceeded”（超出0次重定向）的错误信息停止。它同样会显示一个HTTP的状态码（比如301）。

注意一下curl，另外一个类似的HTTP客户端，行为正好相反。默认上，curl并不会跟随URL重定向。要强制使cutl重定向到一个URL，你要使用“-L”选项。

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/disable-http-redirect-wget.html

译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出