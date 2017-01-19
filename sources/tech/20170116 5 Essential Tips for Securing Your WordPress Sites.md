translating---geekpi

5 Essential Tips for Securing Your WordPress Sites
============================================================

 ![](https://www.rosehosting.com/blog/wp-content/uploads/2017/01/tips-for-securing-wp.jpg) 

WordPress is by far the most popular blogging platform today.

Being as popular as it is, it comes with its own strengths and weaknesses. The very fact that almost everybody uses it, makes it more prone to vulnerabilities. WordPress developers are doing a great job of fixing and patching the framework as new flaws are discovered, but that doesn’t mean that you can simply install and forget your installation.

In this post, we will provide some of the most common ways of securing and strengthening a WordPress site.

### Always use SSL when logging into your back-end

It goes without saying that you should always implement SSL if you are planning to do anything more than just a casual blog. Logging in onto your site without using an encrypted connection exposes your username and your password on the clear. Anyone sniffing traffic at the moment could discover your password. This is especially true if you are surfing on a WiFi or if you are connected to a public hotspot, then the chances that you will get hacked are even higher. You can get a trusted SSL certificate from [here][1].

### Be picky about any additional plugins

Being developed by 3rd party developers, the quality and security of each plugin is always questionable and depends solely on the experience of its developer. When installing any additional plugins one should carefully choose the plugin and take into consideration its popularity as well as how often is the plugin being maintained. Poorly maintained plugins should be avoided as they are more prone to bugs and vulnerabilities which can be easily exploited.

This topic is also as an addition to the previous topic about the SSL, since many plugins are incorrectly developed to the degree that they contain scripts that explicitly request insecure (HTTP) connections. Everything seems fine as long as your site is accessed via HTTP. However, once you decide to implement encryption and force the SSL access, that will immediately result in a broken site, because the scripts on these plugins will continue to serve out their requests via HTTP, when the rest of your site is accessed with HTTPS.

### Install Wordfence

Being developed by Feedjit Inc., Wordfence is the most popular WordPress security plugin today and a must-have for every serious WordPress site, especially for those that utilize [WooCommerce][2] or another WordPress eCommerce platform. Wordfence is not just a plugin as it rather offers a collection of security features that will strengthen your site. It features a web application firewall, malware scanner, live traffic analyzer and a variety of additional tools which can improve the security of your site. The firewall will block malicious login attempts by default, and can even be configured to block entire countries by their IP Address ranges. What we really like about Wordfence is that even if your site is compromised for some reason i.e. with malicious scripts, Wordfence can be installed afterward to scan and clean your site from the infected files.

The company offers free and paid subscription plans of the plugin, but even with the free plan, your site will be secured on a satisfactory level.

### Lockdown /wp-admin and /wp-login.php with an additional password

Another step toward protecting your WordPress backend would be to additionally password protect any directories (read URLs) which are not meant to be used by anyone else except you. The /wp-admin directory is on this list of critical directories already. If you don’t allow WordPress login for the normal users you should restrict the wp.login.php file with an additional password. Whether you use [Apache ][3]or [Nginx][4], you can visit those two articles to learn how to additionally secure your WordPress installation.

### Disable/stop user enumeration

This is a fairly easy way for an attacker to discover valid usernames on your site, (read to find out the admin username). So how does it work? It’s simple. On any WordPress site put the /?author=1 after the main URL. An example would be: wordpressexample.com/?author=1

To protect your site from this, simply install the [Stop User Enumeration][5] plugin.

### Disable XML-RPC

RPC stands for Remote Procedure Calls, it’s a protocol that one program can use to request a service from a program located on another computer on a network. In terms of WordPress, XML-RPC allows you to post on your WordPress blog using popular weblog clients like Windows Live Writer but it is also needed if you are using the WordPress mobile app. XML-RPC used to be disabled in the earlier versions but since WordPress version 3.5 it is enabled by default which allows for a greater attack surface on your site. Although various security researchers are advising that this is not that of a big deal, if you do not intend on using web-blog clients or the WP Mobile App, you should disable the XML-RPC service.

There are multiple ways to do this and the simplest would be to just install the [Disable XML-RPC][6] plugin.

--------------------------------------------------------------------------------

via: https://www.rosehosting.com/blog/5-tips-for-securing-your-wordpress-sites/

作者：[rosehosting.com][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:rosehosting.com
[1]:https://www.rosehosting.com/ssl-certificates.html
[2]:https://www.rosehosting.com/woocommerce-hosting.html
[3]:https://www.rosehosting.com/blog/password-protect-a-directory-using-htaccess/
[4]:https://www.rosehosting.com/blog/password-protecting-directories-with-nginx/
[5]:https://wordpress.org/plugins/stop-user-enumeration/
[6]:https://wordpress.org/plugins/disable-xml-rpc/
