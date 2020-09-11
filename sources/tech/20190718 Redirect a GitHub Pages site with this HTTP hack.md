[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Redirect a GitHub Pages site with this HTTP hack)
[#]: via: (https://opensource.com/article/19/7/permanently-redirect-github-pages)
[#]: author: (Oleksii Tsvietnov https://opensource.com/users/oleksii-tsvietnov)

Redirect a GitHub Pages site with this HTTP hack
======
Learn how to configure two repositories to serve as static websites with
custom domain names.
![computer servers processing data][1]

I run a few static websites for my private projects on [GitHub Pages][2]. I'm absolutely happy with the service, as it supports custom domains, automatically redirects to HTTPS, and transparently installs SSL certificates (with automatic issuing via [Let's Encrypt][3]). It is very fast (thanks to [Fastly's][4] content delivery network) and is extremely reliable (I haven't had any issues for years). Taking into account the fact that I get all of this for free, it perfectly matches my needs at the moment.

It has, however, one important limitation: because it serves static websites only, this means no query parameters, no dynamic content generated on the server side, no options for injecting any server-side configuration (e.g., .htaccess), and the only things I can push to the website's root directory are static assets (e.g., HTML, CSS, JS, JPEG, etc.). In general, this is not a big issue. There are a lot of open source [static site generators][5] available, such as [Jekyll][6], which is available by default from the dashboard, and [Pelican][7], which I prefer in most cases. Nevertheless, when you need to implement something that is traditionally solved on the server side, a whole new level of challenge begins. 

For example, I recently had to change a custom domain name for one of my websites. Keeping the old one was ridiculously expensive, and I wasn't willing to continue wasting money. I found a cheaper alternative and immediately faced a bigger problem: all the search engines have the old name in their indexes. Updating indexes takes time, and until that happens, I would have to redirect all requests to the new location. Ideally, I would redirect each indexed resource to the equivalent on the new site, but at minimum, I needed to redirect requests to the new start page. I had access to the old domain name for enough time, and therefore, I could run the site separately on both domain names at the same time.

There is one proper solution to this situation that should be used whenever possible: Permanent redirect, or the [301 Moved Permanently][8] status code, is the way to redirect pages implemented in the HTTP protocol. The only issue is that it's supposed to happen on the server side within a server response's HTTP header. But the only solution I could implement resides on a client side; that is, either HTML code or JavaScript. I didn't consider the JS variant because I didn't want to rely on the script's support in web browsers. Once I defined the task, I recalled a solution: the [**HTML &lt;meta&gt; tag**][9] **&lt;meta http-equiv&gt;** with the [**refresh**][10] [HTTP header][11]. Although it can be used to ask browsers to reload a page or jump to another URL after a specified number of seconds, after some research, I learned it is more complicated than I thought with some interesting facts and details.

### The solution

**TL;DR** (for anyone who isn't interested in all the details): In brief, this solution configures two repositories to serve as static websites with custom domain names.

On the site with the old domain, I reconstructed the website's entire directory structure and put the following index.html (including the root) in each of them: 


```
&lt;!DOCTYPE HTML&gt;                                                                
&lt;html lang="en"&gt;                                                                
    &lt;head&gt;                                                                      
        &lt;meta charset="utf-8"&gt;
        &lt;meta http-equiv="refresh" content="0;url={{THE_NEW_URL}}" /&gt;      
        &lt;link rel="canonical" href="{{THE_NEW_URL}}" /&gt;                    
    &lt;/head&gt;                                                                                                                                                                  
    &lt;body&gt;                                                                      
        &lt;h1&gt;                                                                    
            The page been moved to &lt;a href="{{THE_NEW_URL}}"&gt;{{THE_NEW_URL}}&lt;/a&gt;
        &lt;/h1&gt;                                                                  
    &lt;/body&gt;                                                                    
&lt;/html&gt;
```

When someone opens a resource on the old domain, most web browsers promptly redirect to the same resource on the new website (thanks to **http-equiv="refresh"**). For any resources that were missed or nonexistent, it's helpful to create a **404.html** file in the old website's root directory with similar content, but without **rel="canonical"** (because there is no a canonical page, in this case).

The last piece of the puzzle is the [canonical link relation][12] (**rel="canonical"**), which prevents duplicating content as long as the implemented redirect _is not permanent._ From the HTTP response's perspective, it happens when [the request has succeeded][13] and there is an indication for search engines that a resource has moved and should be associated with a new (preferred) location.

I have learned a few interesting facts related to **http-equiv="refresh"** and **rel="canonical"**. The HTML metatag **http-equiv** is used to simulate the presence of an HTTP header in a server response. That is, web developers without access to the web server's configuration can get a similar result by "injecting" HTTP headers from an HTML document (the "body" of an HTTP response). It seems the **refresh** header, which has been used by all popular web browsers for many years, _doesn't really exist_. At least not as a standardized HTTP header. There was a plan to add it in the HTTP/1.1 specification that was [deferred to HTTP/1.2][14] (or later), but it never happened.

### Summary

The task of finding the real source URL for a resource is far from trivial. There are different scheme names (HTTP, HTTPS), multiple query parameters (page.html, page.html?a=1), various hostnames that resolve to the same IP address, etc. All of these options make a webpage look different to search engines, but the page is still the same. It gets even worse when the same content is published on independent web services. In 2009, Google, Yahoo, and Microsoft announced [support for a canonical link element][15] to clean up duplicate URLs on sites by allowing webmasters to choose a canonical (preferred) URL for a group of possible URLs for the same page. This helps search engines pick up the correct URL to associate with the content and can also improve [SEO for a site][16].

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/permanently-redirect-github-pages

作者：[Oleksii Tsvietnov][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/oleksii-tsvietnov
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/server_data_system_admin.png?itok=q6HCfNQ8 (computer servers processing data)
[2]: https://pages.github.com/
[3]: https://letsencrypt.org/
[4]: https://www.fastly.com/
[5]: https://www.staticgen.com/
[6]: https://jekyllrb.com/
[7]: https://github.com/getpelican/pelican
[8]: https://tools.ietf.org/html/rfc2616#section-10.3.2
[9]: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/meta
[10]: http://www.otsukare.info/2015/03/26/refresh-http-header
[11]: https://tools.ietf.org/html/rfc2616#section-14
[12]: https://tools.ietf.org/html/rfc6596
[13]: https://tools.ietf.org/html/rfc2616#section-10.2.1
[14]: https://lists.w3.org/Archives/Public/ietf-http-wg-old/1996MayAug/0594.html
[15]: https://www.mattcutts.com/blog/canonical-link-tag/
[16]: https://yoast.com/rel-canonical/
