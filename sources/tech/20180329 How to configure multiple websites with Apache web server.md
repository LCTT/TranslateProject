How to configure multiple websites with Apache web server
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/apache-feathers.jpg?itok=fnrpsu3G)
In my [last post][1], I explained how to configure an Apache web server for a single website. It turned out to be very easy. In this post, I will show you how to serve multiple websites using a single instance of Apache.

Note: I wrote this article on a virtual machine using Fedora 27 with Apache 2.4.29. If you have another distribution or release of Fedora, the commands you will use and the locations and content of the configuration files may be different.

As my previous article mentioned, all of the configuration files for Apache are located in `/etc/httpd/conf` and `/etc/httpd/conf.d`. The data for the websites is located in `/var/www` by default. With multiple websites, you will need to provide multiple locations, one for each site you host.

### Name-based virtual hosting

With name-based virtual hosting, you can use a single IP address for multiple websites. Modern web servers, including Apache, use the `hostname` portion of the specified URL to determine which virtual web host responds to the page request. This requires only a little more configuration than for a single site.

Even if you are starting with only a single website, I recommend that you set it up as a virtual host, which will make it easier to add more sites later. In this article, I'll pick up where we left off in the previous article, so you'll need to set up the original website, a name-based virtual website.

### Preparing the original website

Before you set up a second website, you need to get name-based virtual hosting working for the existing site. If you do not have an existing website, [go back and create one now][1].

Once you have your site, add the following stanza to the bottom of its `/etc/httpd/conf/httpd.conf` configuration file (adding this stanza is the only change you need to make to the `httpd.conf` file):
```
<VirtualHost 127.0.0.1:80>

    DocumentRoot /var/www/html

    ServerName www.site1.org

</VirtualHost>

```

This will be the first virtual host stanza, and it should remain first, to make it the default definition. That means that HTTP access to the server by IP address, or by another name that resolves to this IP address but that does not have a specific named host configuration stanza, will be directed to this virtual host. All other virtual host configuration stanzas should follow this one.

You also need to set up your websites with entries in `/etc/hosts` to provide name resolution. Last time, we just used the IP address for `localhost`. Normally, this would be done using whichever name service you use; for example, Google or Godaddy. For your test website, do this by adding a new name to the `localhost` line in `/etc/hosts`. Add the entries for both websites so you don't need to edit this file again later. The result looks like this:
```
127.0.0.1 localhost localhost.localdomain localhost4 localhost4.localdomain4 www.site1.org www.site2.org

```

Let’s also change the `/var/www/html/index.html` file to be a little more explicit. It should look like this (with some additional text to identify this as website number 1):
```
<h1>Hello World</h1>



Web site 1.

```

Restart the HTTPD server to enable the changes to the `httpd` configuration. You can then look at the website using the Lynx text mode browser from the command line.
```
[root@testvm1 ~]# systemctl restart httpd

[root@testvm1 ~]# lynx www.site1.org



                                              Hello World

  Web site 1.

<snip>

Commands: Use arrow keys to move, '?' for help, 'q' to quit, '<-' to go back.

Arrow keys: Up and Down to move.  Right to follow a link; Left to go back.

H)elp O)ptions P)rint G)o M)ain screen Q)uit /=search [delete]=history list

```

You can see that the revised content for the original website is displayed and that there are no obvious errors. Press the “Q” key, followed by “Y” to exit the Lynx web browser.

### Configuring the second website

Now you are ready to set up the second website. Create a new website directory structure with the following command:
```
[root@testvm1 html]# mkdir -p /var/www/html2

```

Notice that the second website is simply a second `html` directory in the same `/var/www` directory as the first site.

Now create a new index file, `/var/www/html2/index.html`, with the following content (this index file is a bit different, to distinguish it from the one for the original website):
```
<h1>Hello World -- Again</h1>



Web site 2.

```

Create a new configuration stanza in `httpd.conf` for the second website and place it below the previous virtual host stanza (the two should look very similar). This stanza tells the web server where to find the HTML files for the second site.
```
<VirtualHost 127.0.0.1:80>

    DocumentRoot /var/www/html2

    ServerName www.site2.org

</VirtualHost>

```

Restart HTTPD again and use Lynx to view the results.
```
[root@testvm1 httpd]# systemctl restart httpd

[root@testvm1 httpd]# lynx www.site2.org



                                    Hello World -- Again



   Web site 2.



<snip>

Commands: Use arrow keys to move, '?' for help, 'q' to quit, '<-' to go back.

Arrow keys: Up and Down to move.  Right to follow a link; Left to go back.

H)elp O)ptions P)rint G)o M)ain screen Q)uit /=search [delete]=history list

```

Here I have compressed the resulting output to fit this space. The difference in the page indicates that this is the second website. To show both websites at the same time, open another terminal session and use the Lynx web browser to view the other site.

### Other considerations

This simple example shows how to serve up two websites with a single instance of the Apache HTTPD server. Configuring the virtual hosts becomes a bit more complex when other factors are considered.

For example, you may want to use some CGI scripts for one or both of these websites. To do this, you would create directories for the CGI programs in `/var/www`: `/var/www/cgi-bin` and `/var/www/cgi-bin2`, to be consistent with the HTML directory naming. You would then need to add configuration directives to the virtual host stanzas to specify the directory location for the CGI scripts. Each website could also have directories from which files could be downloaded; this would also require entries in the appropriate virtual host stanza.

The [Apache website][2] describes other methods for managing multiple websites, as well as configuration options from performance tuning to security.

Apache is a powerful web server that can be used to manage websites ranging from simple to highly complex. Although its overall share is shrinking, Apache remains the single most commonly used HTTPD server on the Internet.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/3/configuring-multiple-web-sites-apache

作者：[David Both][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/dboth
[1]:https://opensource.com/article/18/2/how-configure-apache-web-server
[2]:https://httpd.apache.org/docs/2.4/
