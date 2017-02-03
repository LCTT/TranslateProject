translating---geeekpi

How to Hide PHP Version Number in HTTP Header
============================================================

The PHP configuration, by default allows the server HTTP response header ‘**X-Powered-By**‘ to display the PHP version installed on a server.

For server security reasons (though not a major threat to worry about), it is recommended that you disable or hide this information from attackers who might be targeting your server by wanting to know whether you are running PHP or not.

Assuming a particular version of PHP installed on your server has security holes, and on the other side, attackers get to know this, it will become much easier for them to exploit vulnerabilities and gain access in to the sever through scripts.

In my previous article, I’ve shown [how to Hide apache version number][1], where you’ve seen how to turn-off apache installed version. But if you are running PHP in your apache web server you need to hide PHP installed version also, and this is what we going show in this article.

Therefore, in this post, we will explain how to hide or turn-off showing PHP version number in server HTTP response header.

This setting can be configured in the loaded PHP configuration file. In case you do not know the location of this config file on your server, run the command below to find it:

```
$ php -i | grep "Loaded Configuration File"
```
PHP Configuration File Location
```
---------------- On CentOS/RHEL/Fedora ---------------- 
Loaded Configuration File => /etc/php.ini
---------------- On Debian/Ubuntu/Linux Mint ---------------- 
Loaded Configuration File => /etc/php/7.0/cli/php.ini
```

Before making any changes to PHP configuration file, I suggest you to first make a backup of your PHP config file like so:

```
---------------- On CentOS/RHEL/Fedora ---------------- 
$ sudo cp /etc/php.ini /etc/php.ini.orig
---------------- On Debian/Ubuntu/Linux Mint ---------------- 
$ sudo cp /etc/php/7.0/cli/php.ini  /etc/php/7.0/cli/php.ini.orig  
```

Then open the file [using your favorite editor][2] with super user privileges like so:

```
---------------- On CentOS/RHEL/Fedora ---------------- 
$ sudo vi /etc/php.ini
---------------- On Debian/Ubuntu/Linux Mint ---------------- 
$ sudo vi /etc/php/7.0/cli/php.ini
```

Locate the keyword `expose_php` and set its value to **Off**:

```
expose_php = off
```

Save the file and exit. Afterwards, restart the web server as follows:

```
---------------- On SystemD ---------------- 
$ sudo systemctl restart httpd
$ sudo systemctl restart apache2 
---------------- On SysVInit ---------------- 
$ sudo service httpd restart
$ sudo service apache2 restart
```

Last but not least, check if the server HTTP response header is still showing your PHP version number using the command below.

```
$ lynx -head -mime_header http://localhost 
OR
$ lynx -head -mime_header http://server-address
```

where the flags:

1.  `-head` – sends a HEAD request for the mime headers.
2.  `-mime_header` – prints the MIME header of a fetched document together with its source.

**Note**: Make sure you have [lynx – command-line web browser][3] installed on your system.

That’s it! In this article, we explained how to hide PHP version number in server HTTP response header in order to secure a web server from possible attacks. You can add an opinion to this post or perhaps ask any related question via the comment form below.

--------------------------------------------------------------------------------

作者简介：

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

---------------------------------------------------------------------------------


via: http://www.tecmint.com/hide-php-version-http-header/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/hide-apache-web-server-version-information/
[2]:http://www.tecmint.com/linux-command-line-editors/
[3]:http://www.tecmint.com/command-line-web-browsers/
