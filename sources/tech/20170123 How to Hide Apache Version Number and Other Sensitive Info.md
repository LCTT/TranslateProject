How to Hide Apache Version Number and Other Sensitive Info
============================================================

When remote requests are sent to your Apache web server, by default, some valuable information such as the web server version number, server operating system details, installed Apache modules plus more, is sent along in server-generated documents back to the client.

This is a good deal of information for attackers to exploit vulnerabilities and gain access to your web server. To avoid showing Web sever information, we will show in this article how to hide the information of Apache Web Server using particular Apache directives.

**Suggested Read:** [13 Useful Tips to Secure Your Apache Web Server][1]

The two important directives are:

##### ServerSignature

Which permits the adding of a footer line showing server name and version number under server-generated documents such as error messages, mod_proxy ftp directory listings, mod_info output plus many more.

It has three possible values:

1.  **On** – which allows the adding of a trailing footer line in server-generated documents,
2.  **Off** – disables the footer line and
3.  **EMail** – creates a “**mailto:**” reference; which sends a mail to the ServerAdmin of the referenced document.

##### ServerTokens

It determines if the server response header field that is sent back to clients contains a description of the server OS-type and info concerning enabled Apache modules.

This directive has the following possible values (plus sample info sent to clients when the specific value is set):

```
ServerTokens   Full (or not specified) 
Info sent to clients: Server: Apache/2.4.2 (Unix) PHP/4.2.2 MyMod/1.2 
ServerTokens   Prod[uctOnly] 
Info sent to clients: Server: Apache 
ServerTokens   Major 
Info sent to clients: Server: Apache/2 
ServerTokens   Minor 
Info sent to clients: Server: Apache/2.4 
ServerTokens   Min[imal] 
Info sent to clients: Server: Apache/2.4.2 
ServerTokens   OS 
Info sent to clients: Server: Apache/2.4.2 (Unix) 
```

**Note**: After Apache version **2.0.44**, the **ServerTokens** directive also controls the info offered by the **ServerSignature** directive.

**Suggested Read:** [5 Tips to Boost Performance of Apache Web Server][2]

To hide web server version number, server operating system details, installed Apache modules and more, open your Apache web server configuration file using your favorite editor:

```
$ sudo vi /etc/apache2/apache2.conf        #Debian/Ubuntu systems
$ sudo vi /etc/httpd/conf/httpd.conf       #RHEL/CentOS systems 
```

And add/modify/append the lines below:

```
ServerTokens Prod
ServerSignature Off 
```

Save the file, exit and restart your Apache web server like so:

```
$ sudo systemctl apache2 restart  #SystemD
$ sudo sevice apache2 restart     #SysVInit
```

In this article, we explained how to hide the Apache web server version number plus lots more info about your web server using certain Apache directives.

If you are running PHP in your Apache web server, I suggest you to [Hide PHP Version Number][3].

As usual, you can add your thoughts to this guide via the comment section below.

--------------------------------------------------------------------------------

作者简介：

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/hide-apache-web-server-version-information/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/apache-security-tips/
[2]:http://www.tecmint.com/apache-performance-tuning/
[3]:http://www.tecmint.com/hide-php-version-http-header/
