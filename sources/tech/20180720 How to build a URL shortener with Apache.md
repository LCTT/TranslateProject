translating---geekpi

How to build a URL shortener with Apache
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/openweb-osdc-lead.png?itok=yjU4KliG)

Long ago, folks started sharing links on Twitter. The 140-character limit meant that URLs might consume most (or all) of a tweet, so people turned to URL shorteners. Eventually, Twitter added a built-in URL shortener ([t.co][1]).

Character count isn't as important now, but there are still other reasons to shorten links. For one, the shortening service may provide analytics—you can see how popular the links are that you share. It also simplifies making easy-to-remember URLs. For example, [bit.ly/INtravel][2] is much easier to remember than <https://www.in.gov/ai/appfiles/dhs-countyMap/dhsCountyMap.html>. And URL shorteners can come in handy if you want to pre-share a link but don't know the final destination yet.

Like any technology, URL shorteners aren't all positive. By masking the ultimate destination, shortened links can be used to direct people to malicious or offensive content. But if you surf carefully, URL shorteners are a useful tool.

We [covered shorteners previously][3] on this site, but maybe you want to run something simple that's powered by a text file. In this article, we'll show how to use the Apache HTTP server's mod_rewrite feature to set up your own URL shortener. If you're not familiar with the Apache HTTP server, check out David Both's article on [installing and configuring][4] it.

### Create a VirtualHost

In this tutorial, I'm assuming you bought a cool domain that you'll use exclusively for the URL shortener. For example, my website is [funnelfiasco.com][5] , so I bought [funnelfias.co][6] to use for my URL shortener (okay, it's not exactly short, but it feeds my vanity). If you won't run the shortener as a separate domain, skip to the next section.

The first step is to set up the VirtualHost that will be used for the URL shortener. For more information on VirtualHosts, see [David Both's article][7]. This setup requires just a few basic lines:
```
    <VirtualHost *:80>

        ServerName funnelfias.co

    </VirtualHost>

```

### Create the rewrites

This service uses HTTPD's rewrite engine to rewrite the URLs. If you created a VirtualHost in the section above, the configuration below goes into your VirtualHost section. Otherwise, it goes in the VirtualHost or main HTTPD configuration for your server.
```
    RewriteEngine on

    RewriteMap shortlinks txt:/data/web/shortlink/links.txt

    RewriteRule ^/(.+)$ ${shortlinks:$1} [R=temp,L]

```

The first line simply enables the rewrite engine. The second line builds a map of the short links from a text file. The path above is only an example; you will need to use a valid path on your system (make sure it's readable by the user account that runs HTTPD). The last line rewrites the URL. In this example, it takes any characters and looks them up in the rewrite map. You may want to have your rewrites use a particular string at the beginning. For example, if you wanted all your shortened links to be of the form "slX" (where X is a number), you would replace `(.+)` above with `(sl\d+)`.

I used a temporary (HTTP 302) redirect here. This allows me to update the destination URL later. If you want the short link to always point to the same target, you can use a permanent (HTTP 301) redirect instead. Replace `temp` on line three with `permanent`.

### Build your map

Edit the file you specified on the `RewriteMap` line of the configuration. The format is a space-separated key-value store. Put one link on each line:
```
    osdc https://opensource.com/users/bcotton

    twitter https://twitter.com/funnelfiasco

    swody1 https://www.spc.noaa.gov/products/outlook/day1otlk.html

```

### Restart HTTPD

The last step is to restart the HTTPD process. This is done with `systemctl restart httpd` or similar (the command and daemon name may differ by distribution). Your link shortener is now up and running. When you're ready to edit your map, you don't need to restart the web server. All you have to do is save the file, and the web server will pick up the differences.

### Future work

This example gives you a basic URL shortener. It can serve as a good starting point if you want to develop your own management interface as a learning project. Or you can just use it to share memorable links to forgettable URLs.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/apache-url-shortener

作者：[Ben Cotton][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/bcotton
[1]:http://t.co
[2]:http://bit.ly/INtravel
[3]:https://opensource.com/article/17/3/url-link-shortener
[4]:https://opensource.com/article/18/2/how-configure-apache-web-server
[5]:http://funnelfiasco.com
[6]:http://funnelfias.co
[7]:https://opensource.com/article/18/3/configuring-multiple-web-sites-apache
