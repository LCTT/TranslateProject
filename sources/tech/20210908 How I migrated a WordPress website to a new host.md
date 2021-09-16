[#]: subject: "How I migrated a WordPress website to a new host"
[#]: via: "https://opensource.com/article/21/9/migrate-wordpress"
[#]: author: "David Both https://opensource.com/users/dboth"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How I migrated a WordPress website to a new host
======
Use this simple approach to migrate a website and manage firewall
configurations.
![Text editor on a browser, in blue][1]

Have you ever needed to migrate a WordPress website to a new host? I have done it several times and found the process to be quite easy. Of course, I don't use the recommended methods for doing most things, and this is no exception–I use the easy way, and that is what I recommend.

This migration is non-destructive, so it is simple to revert to the original server if that should be necessary for any reason.

### Components of a WordPress website

Three main components are required to run a website based on [WordPress][2]: WordPress itself, a webserver such as [Apache][3] (which I use), and the [MariaDB][4]. MariaDB is a fork of MySQL and is functionally equivalent.

There are plenty of webservers out there, but I prefer Apache because I have used it for so long. You may need to adapt the Apache configuration I use here to whatever webserver you are using.

### The original setup

I use one Linux host as a firewall and router for my network. The webserver is a different host inside my network. My internal network uses what used to be called a class C private network address range, but which is simply referred to as 192.168.0.0/24 in the [Classless Internet Domain Routing (CIDR)][5] methodology.

For the firewall, I use the very simple [IPTables][6], which I prefer over the much more complex `firewalld`. One line in this firewall configuration sends incoming packets on port 80 (HTTP) to the webserver. As you can see by the comments, I placed rules to forward other inbound server connections to the same server on their appropriate ports in the `/etc/sysconfig/iptables` file.


```
# Reroute ports for inbound connections to the appropriate web/email/etc server.
# HTTPD goes to 192.168.0.75
-A PREROUTING -d 45.20.209.41/255.255.255.248 -p tcp -m tcp --dport 80 \

  -j DNAT --to-destination 192.168.0.75:80
```

I set up my original Apache webserver using named virtual hosts because I served multiple websites from this one HTTPD instance. It is always a good idea to use the named virtual host configuration approach because, like me, you may decide to host additional sites later, and this process makes that easier to do.

The virtual host stanza for the website to be moved in `/etc/httpd/conf/httpd.conf` looks like the one below. There are no IP addresses in this stanza, so it needs no changes for use on the new server.


```
&lt;VirtualHost *:80&gt;
   ServerName [www.website1.org][7]
   ServerAlias server.org

DocumentRoot "/var/website1/html"
   ErrorLog "logs/error_log"
   ServerAdmin [me@website1.org][8]
 
&lt;Directory "/var/website1/html"&gt;
      Options Indexes FollowSymLinks
 
AllowOverride None
      Require all granted
 
&lt;/Directory&gt;
&lt;/VirtualHost&gt;
```

The `Listen` directive near the top of the `httpd.conf` file looks like this before the migration. This is the actual IP private address of the server and not the public IP address.


```
`Listen 192.168.0.75:80`
```

You need to change the `Listen` IP address on the new host.

### Preparation

The preparation can be accomplished with three steps:

  * Install the services.
  * Configure the firewall.
  * Configure the webserver.



#### Install Apache and MariaDB

Install Apache and MariaDB if they are not already on your new server. It is not necessary to install WordPress.


```
`dnf -y install httpd mariadb`
```

#### New server firewall configuration

Ensure that the firewall on the new server allows port 80. You do have a firewall on _all_ of your computers, right? Most modern distributions use an initial setup that includes a firewall that blocks all incoming traffic to ensure a higher level of security.

The first line in the snippet below may already be part of your IPTables or other netfilter-based firewall. It identifies inbound packets that have already been recognized as coming from an acceptable source and bypasses additional INPUT filter rules, thus saving time and CPU cycles. The last line in the snippet identifies new incoming connections to HTTPD on port 80 and accepts them.


```
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
&lt;snip&gt;
# HTTP
-A INPUT -p tcp -m state --state NEW -m tcp --dport 80 -j ACCEPT
```

The following sample `/etc/sysconfig/iptables` file is an example of a minimal set of IPTables rules that allow incoming connections on SSH (port 22) and HTTPD (port 80) .


```
*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A INPUT -p icmp -j ACCEPT
-A INPUT -i lo -j ACCEPT
# SSHD
-A INPUT -p tcp -m state --state NEW -m tcp --dport 22 -j ACCEPT
# HTTP
-A INPUT -p tcp -m state --state NEW -m tcp --dport 80 -j ACCEPT

# Final disposition for unmatched packets
-A INPUT -j REJECT --reject-with icmp-host-prohibited
-A FORWARD -j REJECT --reject-with icmp-host-prohibited
COMMIT
```

All I needed on my new server host was to add the last line in the snippet above to my firewall rules in the `/etc/sysconfig/iptables` file and then reload the revised ruleset.


```
`iptables-restore /etc/sysconfig/iptables`
```

Most current Red Hat-based distributions, such as Fedora, use `firewalld`. I don't use it because I find it far more complex than it needs to be for use cases such as home or small to medium businesses. To add inbound port 80 to `firewalld`, I suggest you refer to the [firewalld web page][9].

Your firewall and its configuration details might differ from these, but the objective is to allow incoming connections to HTTPD on port 80 of the new web server.

#### HTTPD configuration

Configure HTTPD in the `/etc/httpd/conf/httpd.conf` file. Set the IP address in the Listen stanza as shown below. The IP address of my new web server is 192.168.0.125.


```
`Listen 192.168.0.125:80`
```

Copy the VirtualHost stanza for the website being moved and paste it at the end of the `httpd.conf` file of the new server.

### The move

Only two sets of data need to be moved to the new server—the database itself and the website directory structure. Create `tar` archives of the two directories.


```
cd /var ; tar -cvf /tmp/website.tar website1/
cd /var/lib ; tar -cvf /tmp/database.tar mysql/
```

Copy those tarballs to the new server. I usually store files like this in `/tmp`, which is what it is for. Run the following commands on the new server to extract the files from the tar archives into the correct directories.


```
cd /var ; tar -xvf /tmp/website.tar
cd /var/lib ; tar -xvf /tmp/database.tar
```

All WordPress files are contained in the `/var/website1`, so they do not need to be installed on the new server. The WordPress installation procedure does not need to be performed on the new server.

This directory is all that needs to be moved to the new server.

The last step before making the switch is to start (or restart) the `mysqld` and `httpd` service daemons. WordPress is not a service, so it is not started as a daemon.


```
`systemctl start mysqld ; systemctl start httpd`
```

You should check the status of these services after starting them.


```
systemctl status mysqld
● mariadb.service - MariaDB 10.5 database server
    Loaded: loaded (/usr/lib/systemd/system/mariadb.service; enabled; vendor preset: disabled)
    Active: active (running) since Sat 2021-08-21 14:03:44 EDT; 4 days ago
        Docs: man:mariadbd(8)

<https://mariadb.com/kb/en/library/systemd/>
   Process: 251783 ExecStartPre=/usr/libexec/mariadb-check-socket (code=exited, status=0/SUCCESS)
   Process: 251805 ExecStartPre=/usr/libexec/mariadb-prepare-db-dir mariadb.service (code=exited, status=0/SUCCESS)
   Process: 251856 ExecStartPost=/usr/libexec/mariadb-check-upgrade (code=exited, status=0/SUCCESS)
 Main PID: 251841 (mariadbd)
      Status: "Taking your SQL requests now..."
      Tasks: 15 (limit: 19003)
    Memory: 131.8M
        CPU: 1min 31.793s
    CGroup: /system.slice/mariadb.service
└─251841 /usr/libexec/mariadbd --basedir=/usr

Aug 21 14:03:43 simba.stmarks-ral.org systemd[1]: Starting MariaDB 10.5 database server...
Aug 21 14:03:43 simba.stmarks-ral.org mariadb-prepare-db-dir[251805]: Database MariaDB is probably initialized in /var/lib/mysql already, n&gt;
Aug 21 14:03:43 simba.stmarks-ral.org mariadb-prepare-db-dir[251805]: If this is not the case, make sure the /var/lib/mysql is empty before&gt;
Aug 21 14:03:44 simba.stmarks-ral.org mariadbd[251841]: 2021-08-21 14:03:44 0 [Note] /usr/libexec/mariadbd (mysqld 10.5.11-MariaDB) startin&gt;
Aug 21 14:03:44 simba.stmarks-ral.org systemd[1]: Started MariaDB 10.5 database server.

systemctl status httpd
● httpd.service - The Apache HTTP Server
   Loaded: loaded (/usr/lib/systemd/system/httpd.service; enabled; vendor preset: disabled)
   Drop-In: /usr/lib/systemd/system/httpd.service.d
└─php-fpm.conf
      Active: active (running) since Sat 2021-08-21 14:08:39 EDT; 4 days ago
        Docs: man:httpd.service(8)
   Main PID: 252458 (httpd)
      Status: "Total requests: 10340; Idle/Busy workers 100/0;Requests/sec: 0.0294; Bytes served/sec: 616 B/sec"
        Tasks: 278 (limit: 19003)
      Memory: 44.7M
        CPU: 2min 31.603s
   CGroup: /system.slice/httpd.service
├─252458 /usr/sbin/httpd -DFOREGROUND
├─252459 /usr/sbin/httpd -DFOREGROUND
├─252460 /usr/sbin/httpd -DFOREGROUND
├─252461 /usr/sbin/httpd -DFOREGROUND
├─252462 /usr/sbin/httpd -DFOREGROUND
└─252676 /usr/sbin/httpd -DFOREGROUND

Aug 21 14:08:39 simba.stmarks-ral.org systemd[1]: Starting The Apache HTTP Server...
Aug 21 14:08:39 simba.stmarks-ral.org httpd[252458]: AH00112: Warning: DocumentRoot [/var/teststmarks-ral/html] does not exist
Aug 21 14:08:39 simba.stmarks-ral.org httpd[252458]: Server configured, listening on: port 80
Aug 21 14:08:39 simba.stmarks-ral.org systemd[1]: Started The Apache HTTP Server.
```

### Making the final switch

Now that the required services are up and running, you can change the firewall rule for HTTPD to the following in the `/etc/sysconfig/iptables` file.


```
-A PREROUTING -d 45.20.209.41/255.255.255.248 -p tcp -m tcp --dport 80 \
  -j DNAT --to-destination 192.168.0.125:80
```

Then reload the IPTables rule set.


```
`iptables-restore /etc/sysconfig/iptables`
```

Because of the firewall rules in the firewall host, it is not necessary to change the external DNS entries to point to the new server. If you use an internal DNS server, you will need to make the IP address change to that A record in your internal DNS database. If you don't use an internal DNS server, be sure to set the correct address for your new server in the `/etc/hosts` files of your host computers.

### Testing and cleanup

Be sure to test your new setup. First, turn off the `mysqld` and `httpd` services on the old server. Then access the website with a browser. If everything works as it should, you can disable `mysqld` and `httpd` on the old server. If there is a failure, you can change the IPTables routing rule back to the old server until the problem is fixed.

I then removed both MySQL and HTTPD from the old server to ensure that they cannot be started accidentally.

### Conclusion

It really is that simple. There is no need to perform export or import procedures on the database because everything necessary is copied over in the `mysql` directory. The only reason you might want to deal with the export/import procedure is if there are databases other than those for the website or sites in the same instance of the MariaDB that you don't want copied to the new server.

Migrating the rest of the websites served by the old server is easy too. All of the databases required for the additional sites have already been moved over with MariaDB. It is only necessary to move the `/var/website` directories to the new server, add the appropriate virtual host stanzas, and restart HTTPD.

I have used this procedure multiple times for migrating a website from one server to another, and it always works well.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/migrate-wordpress

作者：[David Both][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_blue_text_editor_web.png?itok=lcf-m6N7 (Text editor on a browser, in blue)
[2]: https://wordpress.org/
[3]: https://opensource.com/article/18/2/how-configure-apache-web-server
[4]: https://mariadb.org/
[5]: https://opensource.com/article/16/12/cidr-network-notation-configuration-linux
[6]: https://en.wikipedia.org/wiki/Iptables
[7]: http://www.website1.org
[8]: mailto:me@website1.org
[9]: https://firewalld.org/documentation/howto/open-a-port-or-service.html
