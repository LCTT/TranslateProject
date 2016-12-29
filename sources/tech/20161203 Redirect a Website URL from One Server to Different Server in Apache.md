translating---geekpi

Redirect a Website URL from One Server to Different Server in Apache
============================================================

As promised in our previous two articles ([Perform Internal Redirection with mod_rewrite][1] and [Show Custom Content Based on Browser][2]), in this post we will explain how to perform a redirection to a resource that has been moved from one server to a different server in Apache using mod_rewrite module.

Suppose you are redesigning your company’s Intranet site. You have decided to store the content and styling (HTML files, JavaScript, and CSS) on one server and the documentation on another – perhaps a more robust one.

**Suggested Read:** [5 Tips to Boost the Performance of Your Apache Web Server][3]

However, you want this change to be transparent to your users so that they are still able to access the docs at the usual URL.

In the following example, a file named `assets.pdf` has been moved from /var/www/html in 192.168.0.100(hostname: web) to the same location in 192.168.0.101 (hostname: web2).

In order for users to access this file when they browse to `192.168.0.100/assets.pdf`, open Apache’s configuration file on 192.168.0.100 and add the following rewrite rule (or you can also add the following rule to your [.htaccess file][4]):

```
RewriteRule "^(/assets\.pdf$)" "http://192.168.0.101$1"  [R,L]
```

where `$1` is a placeholder for anything that matches the regular expression inside parentheses.

Now save changes, don’t forget to restart Apache, and let’s see what happens when we attempt to access assets.pdf by browsing to 192.168.0.100/assets.pdf:

**Suggested Read:** [25 Useful ‘.htaccess’ Tricks for Websites][5]

In the above below we can see that the request that was made for assets.pdf on 192.168.0.100 was actually handled by 192.168.0.101.

```
# tail -n 1 /var/log/apache2/access.log
```
[
 ![Check Apache Logs](http://www.tecmint.com/wp-content/uploads/2016/11/Check-Apache-Logs.png) 
][6]

Check Apache Logs

In this article we have discussed how to perform a redirection to a resource that has been moved to a different server. To wrap up, I’d strongly suggest you take a look at the [mod_rewrite][7] guide and [Apache redirect guide][8] for future reference.

As always, feel free to use the comment form below if you have any concerns about this article. We look forward to hearing from you!

--------------------------------------------------------------------------------

作者简介：Gabriel Cánepa is a GNU/Linux sysadmin and web developer from Villa Mercedes, San Luis, Argentina. He works for a worldwide leading consumer product company and takes great pleasure in using FOSS tools to increase productivity in all areas of his daily work.

-----------

via: http://www.tecmint.com/redirect-website-url-from-one-server-to-different-server/

作者：[Gabriel Cánepa][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:http://www.tecmint.com/redirection-with-mod_rewrite-in-apache/
[2]:http://www.tecmint.com/mod_rewrite-redirect-requests-based-on-browser/
[3]:http://www.tecmint.com/apache-performance-tuning/
[4]:http://www.tecmint.com/tag/htaccess/
[5]:http://www.tecmint.com/apache-htaccess-tricks/
[6]:http://www.tecmint.com/wp-content/uploads/2016/11/Check-Apache-Logs.png
[7]:http://mod-rewrite-cheatsheet.com/
[8]:https://httpd.apache.org/docs/2.4/rewrite/remapping.html
