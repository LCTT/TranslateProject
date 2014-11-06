Translating-------geekpi

Linux FAQs with Answers--How to disable HTTP redirect in wget
================================================================================
> **Question**: When I run wget to fetch a URL X which is redirected to another URL Y, wget, by default, goes fetch URL Y automatically. However, I would like to force wget to only fetch the original URL X without following the redirection. How can I stop wget from following a redirected URL? 

In the HTTP specification, a redirect response (with 3XX HTTP response) indicates to the web browser that the requested URL is moved at another location. The redirect response then contains the URL of the redirect target.

Like regular HTTP clients, wget supports URL redirection (also known as URL forwarding), which means that when you attempt to download a redirected URL, wget will automatically follow URL redirect to fetch the redirected target. If for some reason you want to disable URL direction, and stop with 3XX status code, you can use "--max-redirect=number" option with wget. This option is used to specify the maximum number of (recursive) redirections to follow, which is set to 20 by default.

If you want to disable HTTP redirects in wget, use "--max-redirect=0" option as follows.

    $ wget --max-redirect=0 http://www.aaa.com/a.html

----------

    --2014-10-31 23:08:58--  http://www.aaa.com/a.html
    Resolving aaa.com (aaa.com)... 1.2.3.4
    Connecting to aaa.com (aaa.com)|1.2.3.4|:80... connected.
    HTTP request sent, awaiting response... 301 Moved Permanently
    Location: http://www.bbb.com/b.html [following]
    0 redirections exceeded.

As you can see, when wget encounters a HTTP redirect reponse, it does not follow the redirection, and simply stop with "0 redirections exceeded" error message. It will also show a received HTTP status code (e.g., 301).

Note that curl, which is another similar HTTP client, behave oppositely. By default, curl does NOT follow URL redirection. To force curl to redirect a URL, you have to use "-L" option.

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/disable-http-redirect-wget.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出