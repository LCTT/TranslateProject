How to configure an Apache web server
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/openweb-osdc-lead.png?itok=yjU4KliG)

I have hosted my own websites for many years now. Since switching from OS/2 to Linux more than 20 years ago, I have used [Apache][1] as my server software. Apache is solid, well-known, and quite easy to configure for a basic installation. It is not really that much more difficult to configure for a more complex setup, such as multiple websites.

Installation and configuration of the Apache web server must be performed as root. Configuring the firewall also needs to be performed as root. Using a browser to view the results of this work should be done as a non-root user. (I use the useron `student` on my virtual host.)

### Installation

Note: I use a virtual machine (VM) using Fedora 27 with Apache 2.4.29. If you have a different distribution or a different release of Fedora, your commands and the locations and content of the configuration files may be different. However, the configuration lines you need to modify are the same.

The Apache web server is easy to install. On my CentOS 6.x server, it just takes a simple `yum` command. It installs all the necessary dependencies if any are missing. I used the `dnf` command below on one of my Fedora virtual machines. The syntax for `dnf` and `yum` are the same except for the name of the command itself.
```
dnf -y install httpd

```

The VM is a very basic desktop installation I am using as a testbed for writing a book. Even on this system, only six dependencies were installed in under a minute.

All the configuration files for Apache are located in `/etc/httpd/conf` and `/etc/httpd/conf.d`. The data for the websites is located in `/var/www` by default, but you can change that if you want.

### Configuration

The primary Apache configuration file is `/etc/httpd/conf/httpd.conf`. It contains a lot of configuration statements that don't need to be changed for a basic installation. In fact, only a few changes must be made to this file to get a basic website up and running. The file is very large so, rather than clutter this article with a lot of unnecessary stuff, I will show only those directives that you need to change.

First, take a bit of time and browse through the `httpd.conf` file to familiarize yourself with it. One of the things I like about Red Hat versions of most configuration files is the number of comments that describe the various sections and configuration directives in the files. The `httpd.conf` file is no exception, as it is quite well commented. Use these comments to understand what the file is configuring.

The first item to change is the `Listen` statement, which defines the IP address and port on which Apache is to listen for page requests. Right now, you just need to make this website available to the local machine, so use the `localhost` address. The line should look like this when you finish:
```
Listen 127.0.0.1:80

```

With this directive set to the IP address of the `localhost`, Apache will listen only for connections from the local host. If you want the web server to listen for connections from remote hosts, you would use the host's external IP address.

The `DocumentRoot` directive specifies the location of the HTML files that make up the pages of the website. That line does not need to be changed because it already points to the standard location. The line should look like this:
```
DocumentRoot "/var/www/html"

```

The Apache installation RPM creates the `/var/www` directory tree. If you wanted to change the location where the website files are stored, this configuration item is used to do that. For example, you might want to use a different name for the `www` subdirectory to make the identification of the website more explicit. That might look like this:
```
DocumentRoot "/var/mywebsite/html"

```

These are the only Apache configuration changes needed to create a simple website. For this little exercise, only one change was made to the `httpd.conf` file—the `Listen` directive. Everything else is already configured to produce a working web server.

One other change is needed, however: opening port 80 in our firewall. I use [iptables][2] as my firewall, so I change `/etc/sysconfig/iptables` to add a statement that allows HTTP protocol. The entire file looks like this:
```
# sample configuration for iptables service

# you can edit this manually or use system-config-firewall

# please do not ask us to add additional ports/services to this default configuration

*filter

:INPUT ACCEPT [0:0]

:FORWARD ACCEPT [0:0]

:OUTPUT ACCEPT [0:0]

-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

-A INPUT -p icmp -j ACCEPT

-A INPUT -i lo -j ACCEPT

-A INPUT -p tcp -m state --state NEW -m tcp --dport 22 -j ACCEPT

-A INPUT -p tcp -m state --state NEW -m tcp --dport 80 -j ACCEPT

-A INPUT -j REJECT --reject-with icmp-host-prohibited

-A FORWARD -j REJECT --reject-with icmp-host-prohibited

COMMIT

```

The line I added is the third from the bottom, which allows incoming traffic on port 80. Now I reload the altered iptables configuration.
```
[root@testvm1 ~]# cd /etc/sysconfig/ ; iptables-restore iptables

```

### Create the index.html file

The `index.html` file is the default file a web server will serve up when you access the website using just the domain name and not a specific HTML file name. In the `/var/www/html` directory, create a file with the name `index.html`. Add the content `Hello World`. You do not need to add any HTML markup to make this work. The sole job of the web server is to serve up a stream of text data, and the server has no idea what the date is or how to render it. It simply transmits the data stream to the requesting host.

After saving the file, set the ownership to `apache.apache`.
```
[root@testvm1 html]# chown apache.apache index.html

```

### Start Apache

Apache is very easy to start. Current versions of Fedora use `systemd`. Run the following commands to start it and then to check the status of the server:
```
[root@testvm1 ~]# systemctl start httpd

[root@testvm1 ~]# systemctl status httpd

● httpd.service - The Apache HTTP Server

   Loaded: loaded (/usr/lib/systemd/system/httpd.service; disabled; vendor preset: disabled)

   Active: active (running) since Thu 2018-02-08 13:18:54 EST; 5s ago

     Docs: man:httpd.service(8)

 Main PID: 27107 (httpd)

   Status: "Processing requests..."

    Tasks: 213 (limit: 4915)

   CGroup: /system.slice/httpd.service

           ├─27107 /usr/sbin/httpd -DFOREGROUND

           ├─27108 /usr/sbin/httpd -DFOREGROUND

           ├─27109 /usr/sbin/httpd -DFOREGROUND

           ├─27110 /usr/sbin/httpd -DFOREGROUND

           └─27111 /usr/sbin/httpd -DFOREGROUND



Feb 08 13:18:54 testvm1 systemd[1]: Starting The Apache HTTP Server...

Feb 08 13:18:54 testvm1 systemd[1]: Started The Apache HTTP Server.

```

The commands may be different on your server. On Linux systems that use SystemV start scripts, the commands would be:
```
[root@testvm1 ~]# service httpd start

Starting httpd: [Fri Feb 09 08:18:07 2018]          [  OK  ]

[root@testvm1 ~]# service httpd status

httpd (pid  14649) is running...

```

If you have a web browser like Firefox or Chrome on your host, you can use the URL `localhost` on the URL line of the browser to display your web page, simple as it is. You could also use a text mode web browser like [Lynx][3] to view the web page. First, install Lynx (if it is not already installed).
```
[root@testvm1 ~]# dnf -y install lynx

```

Then use the following command to display the web page.
```
[root@testvm1 ~]# lynx localhost

```

The result looks like this in my terminal session. I have deleted a lot of the empty space on the page.
```
  Hello World



<snip>





Commands: Use arrow keys to move, '?' for help, 'q' to quit, '<-' to go back.

  Arrow keys: Up and Down to move.  Right to follow a link; Left to go back.

 H)elp O)ptions P)rint G)o M)ain screen Q)uit /=search [delete]=history list

```

Next, edit your `index.html` file and add a bit of HTML markup so it looks like this:
```
<h1>Hello World</h1>

```

Now refresh the browser. For Lynx, use the key combination Ctrl+R. The results look just a bit different. The text is in color, which is how Lynx displays headings if your terminal supports color, and it is now centered. In a GUI browser the text would be in a large font.
```
                                   Hello World



<snip>





Commands: Use arrow keys to move, '?' for help, 'q' to quit, '<-' to go back.

  Arrow keys: Up and Down to move.  Right to follow a link; Left to go back.

 H)elp O)ptions P)rint G)o M)ain screen Q)uit /=search [delete]=history list

```

### Parting thoughts

As you can see from this little exercise, it is easy to set up an Apache web server. The specifics will vary depending upon your distribution and the version of Apache supplied by that distribution. In my environment, this was a pretty trivial exercise.

But there is more because Apache is very flexible and powerful. Next month I will discuss hosting multiple websites using a single instance of Apache.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/2/how-configure-apache-web-server

作者：[David Both][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/dboth
[1]:https://httpd.apache.org/
[2]:https://en.wikipedia.org/wiki/Iptables
[3]:http://lynx.browser.org/
