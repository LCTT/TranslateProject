GHLandy Translating

Disable Apache Web Directory Listing Using .htaccess File
============================================================

[Securing your apache web server][3] is one of the most important task, specially when you setting up a new website.

For example, if you create a new website directory called “**tecmint**” under your Apache server (**/var/www/tecmint** or **/var/www/html/tecmint**) and forgot to place an “**index.html**” file in it, you may surprised to know that all your website visitors can get a complete listing of all your important files and folders simply by typing **http://www.example.com/tecmint** in the browser.

In this article, we will show you how to disable or prevent directory listing of your Apache web server using **.htaccess** file.

This is how directory listing will be shown to your visitors when **index.html** not present in it..

[
 ![Apache Directory Listing](http://www.tecmint.com/wp-content/uploads/2017/01/Apache-Directory-Listing.png) 
][4]

Apache Directory Listing

For starters, **.htaccess** (or **hypertext access**) is a file which enables a website owner to control the server environment variables as well as other vital options to enhance functionality of his/her website(s).

For additional information about this important file, read the following articles to secure your Apache web server using **.htaccess** method:

1.  [25 Apache Htaccess Tricks to Secure Apache Web Server][1]
2.  [Password Protect Apache Web Directories Using .htaccess File][2]

Using this simple method, the **.htaccess** file is created in any and/or every directory in the website directory tree and provide features to the top directory, subdirectories and files inside them.

First of all, activate the **.htaccess** file for your website in master apache configuration file.

```
$ sudo vi /etc/apache2/apache2.conf    #On Debian/Ubuntu systems
$ sudo vi /etc/httpd/conf/httpd.conf   #On RHEL/CentOS systems
```

Then look for the section below, where the value of the `AllowOverride` directive must be set to `AllowOverride All`.

```
<Directory /var/www/html/>
Options Indexes FollowSymLinks
AllowOverride All
</Directory>
```

However, if you have an existing **.htaccess** file, make a backup of it as follows; assuming you have it in **/var/www/html/tecmint/**( and want to disable listing of this directory):

```
$ sudo cp /var/www/html/tecmint/.htaccess /var/www/html/tecmint/.htaccess.orig  
```

Then you can open (or create ) it in the particular directory for modification using your favorite editor, and add the line below to turn off Apache directory listing:

```
Options -Indexes 
```

Next restart the Apache web server:

```
-------- On SystemD based systems -------- 
$ sudo systemctl restart apache2
$ sudo systemctl restart httpd
-------- On SysVInit based systems -------- 
$ sudo /etc/init.d/apache2 restart 
$ sudo /etc/init.d/httpd restart
```

Now verify the result by typing **http://www.example.com/tecmint** in the browser, you should get a message similar to the following.

[
 ![Apache Directory Listing Disabled](http://www.tecmint.com/wp-content/uploads/2017/01/Apache-Directory-Listing-Disabled.png) 
][5]

Apache Directory Listing Disabled

That’s all! In this article, we described how to disable directory listing in Apache web server using **.htaccess** file. We will also cover two other useful as well as easy methods for the same purpose in upcoming articles, until then, stay connected.

As usual, make use of the feedback form below to send us your thoughts about this tutorial.

--------------------------------------------------------------------------------

作者简介：

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

-------------------------------------



via: http://www.tecmint.com/disable-apache-directory-listing-htaccess/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/apache-htaccess-tricks/
[2]:http://www.tecmint.com/password-protect-apache-web-directories-using-htaccess/
[3]:http://www.tecmint.com/apache-security-tips/
[4]:http://www.tecmint.com/wp-content/uploads/2017/01/Apache-Directory-Listing.png
[5]:http://www.tecmint.com/wp-content/uploads/2017/01/Apache-Directory-Listing-Disabled.png
