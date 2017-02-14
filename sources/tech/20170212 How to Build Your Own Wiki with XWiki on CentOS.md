How to Build Your Own Wiki with XWiki on CentOS
============================================================

Due to popular demand, here’s another tutorial on how to install your own self-hosted wiki with XWiki on a CentOS 7 server. We’ve already published a tutorial on [how to install DokuWiki on Ubuntu][8], but if you need an alternative to DokuWiki, XWiki is a great choice.

### XWiki Info

First and most important: it’s free and open source! Here are some of XWiki’s features:

*   a very robust WYSIWYG editor
*   a powerful wiki syntax
*   strong rights management
*   responsive skin
*   advanced search
*   unique set of applications
*   … and many more.

### Why use XWiki?

Developed for more than 10 years, XWiki is being used by many high profile companies as:

*   Knowledge base
*   Collaborative intranet
*   Public website
*   Business applications
*   … or other use cases.

### XWiki Requirements

*   Java 8 or greater
*   A Servlet Container supporting Servlet 3.0.1
*   A JDBC 4 Driver for your database
*   At least 2 GB RAM (or 1 GB for smaller wikis)
*   You can get a 2 GB RAM VPS from [Linode][1] for $10\. But, it’s [unmanaged][2]. If you want a [Managed VPS][3], then check out these providers. If you get a Managed VPS, they will probably install XWiki for you.

We’ll be using a CentOS 7 server for this tutorial.

### XWiki Installation Instructions for CentOS 7

Let’s start. Login to your CentOS VPS and before we do anything, update your system with:

```
yum update
```

If you don’t have them already installed, install nano and wget:

```
yum install nano wget
```

### Install Java

XWiki is built and run on Java, so we’ll need to install java. To do so, run the following command:

```
yum install java
```

To verify that it’s successfully installed, run:

```
java -version
```

### Download and install XWiki

Currently, the latest version of XWiki is 8.4.4, but you can update the command if there’s a newer version of XWiki.

To download the XWiki installer, run:

```
wget http://download.forge.ow2.org/xwiki/xwiki-enterprise-installer-generic-8.4.4-standard.jar
```

To run the installer, enter the following command:

```
java -jar xwiki-enterprise-installer-generic-8.4.4-standard.jar
```

Now, the installer will ask you several questions with a prompt to enter 1 (accept) 2 (quit) 3 (redisplay). Most of the prompts can be answered with 1 (accept). The installer is pretty self-explanatory and easy to understand, so just follow the instructions.

### Start XWiki

To start XWiki, you need to navigate to the directory you chose in the previous step:

```
cd /usr/local/"XWiki Enterprise 8.4.4"
```

and run the start script:

```
bash start_xwiki.sh
```

Wait for the script to do its job and you are done. XWiki is installed and started. It’s that easy.

Now, you can visit XWiki via your domain or server IP on port 8080:

```
http://server-ip:8080
```

or

```
http://example.com:8080
```

By default, XWiki runs on port 8080, but if you’d like to use port 80, make sure there’s nothing already running on port 80 and start XWiki with the following command:

```
bash start_xwiki.sh -p 80
```

Now, you can access XWiki without specifying a port. When you access it, you should see the default XWiki homepage, similar to this:

 ![xwiki start page](https://thishosting.rocks/wp-content/uploads/2017/02/xwiki-starting-page.jpg.webp) 

The default XWiki administrator username and password are:

```
Username: Admin
Password: admin
```

Use them to login and access the admin panel. Have fun editing and using your new wiki!

--------------------------------------------------------------------------------

via: https://thishosting.rocks/how-to-build-your-own-wiki-with-xwiki-on-centos/

作者：[thishosting.rocks][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://thishosting.rocks
[1]:https://thishosting.rocks/go/linode
[2]:https://thishosting.rocks/cheap-cloud-hosting-providers-comparison/
[3]:https://thishosting.rocks/best-cheap-managed-vps/
[4]:https://thishosting.rocks/category/knowledgebase/
[5]:https://thishosting.rocks/tag/wiki/
[6]:https://thishosting.rocks/tag/xwiki/
[7]:https://thishosting.rocks/2017/02/12/
[8]:https://thishosting.rocks/build-your-own-wiki-on-ubuntu-with-dokuwiki/
