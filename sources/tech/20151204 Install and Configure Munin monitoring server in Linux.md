Install and Configure Munin monitoring server in Linux
================================================================================
![](http://www.linuxnix.com/wp-content/uploads/2015/12/munin_page.jpg)

Munin is an excellent system monitoring tool similar to [RRD tool][1] which will give you ample information about system performance in multiple fronts like **disk, network, process, system and users**. These are some of the default properties Munin monitors.

### How Munin works? ###

Munin works in a client-server model. Munin server process on main server try to collect data from client daemon which is running locally(Munin can monitor it’ss own resources) or from remote client(Munin can monitor hundreds of machines) and displays them in graphs on its web interface.

### Configuring Munin in nutshell ###

This is of two steps as we have to configure both server and client.
1)Install Munin server package and configure it so that it get data from clients.
2)Configure Munin client so that server will connect to client daemon for data collocation.

### Install munin server in Linux ###

Munin server installation on Ubuntu/Debian based machines

    apt-get install munin apache2

Munin server installation on Redhat/Centos based machines. Make sure that you [enable EPEL repo][2] before installing Munin on Redhat based machines as by default Redhat based machines do not have Munin in their repos.

    yum install munin httpd

### Configuring Munin server in Linux ###

Below are the steps we have to do in order to bring server up.

1. Add host details which need monitoring in /etc/munin/munin.conf
1. Configure apache web server to include munin details.
1. Create User name and password for web interface
1. Restart apache server

**Step 1**: Add hosts entry in this file in **/etc/munin/munin.conf**. Go to end of the file and a client to monitor. Here in this example, I added my DB server and its IP address to monitor

Example:

    [db.linuxnix.com]
     address 192.168.1.25
     use_node_name yes

Save the file and exit.

**Step 2**: Edit/create munin.conf file in /etc/apache2/conf.d folder to include Munin Apache related configs. In another note, by default other Munin web related configs are kept in /var/www/munin folder.

    vi /etc/apache2/conf.d/munin.conf

Content:

    Alias /munin /var/www/munin
    <Directory /var/www/munin>
     Order allow,deny
     Allow from localhost 127.0.0.0/8 ::1
     AllowOverride None
     Options ExecCGI FollowSymlinks
     AddHandler cgi-script .cgi
     DirectoryIndex index.cgi
     AuthUserFile /etc/munin/munin.passwd
     AuthType basic
     AuthName "Munin stats"
     require valid-user
     <IfModule mod_expires.c>
     ExpiresActive On
     ExpiresDefault M310
     </IfModule>
    </Directory>

Save the file and exit

**Step 3**: Now create a username and password for viewing muning graphs:

    htpasswd -c /etc/munin/munin-htpasswd munin

**Note**: For Redhat/Centos machines replace “**apache2**” with “**httpd**” in each path to access your config files.

**Step 3**: Restart Apache server so that Munin configurations are picked-up by Apache.

#### Ubuntu/Debian based: ####

    service apache2 restart

#### Centos/Redhat based: ####

    service httpd restart

### Install and configure Munin client in Linux ###

**Step 1**: Install Munin client in Linux

    apt-get install munin-node

**Note**: If you want to monitor your Munin server, then you have to install munin-node on that as well.

**Step 2**: Configure client by editing munin-node.conf file.

    vi /etc/munin/munin-node.conf

Example:

    allow ^127\.0\.0\.1$
    allow ^10\.10\.20\.20$

----------

    # Which address to bind to;
    host *

----------

    # And which port
    port 4949

**Note**: 10.10.20.20 is my Munin server and it connections to 4949 port on client to get its data.

**Step 3**: Restart munin-node on client server

    service munin-node restart

### Testing connection ###

check if you are able to connect client from server on 4949 port, other wise you have to open that port on client machine.

    telnet db.linuxnix.com 4949

Accessing Munin web interface

    http://munin.linuxnix.com/munin/index.html

Hope this helps to configure basic Munin server.

--------------------------------------------------------------------------------

via: http://www.linuxnix.com/install-and-configure-munin-monitoring-server-in-linux/

作者：[Surendra Anne][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxnix.com/author/surendra/
[1]:http://www.linuxnix.com/network-monitoringinfo-gathering-tools-in-linux/
[2]:http://www.linuxnix.com/how-to-install-and-enable-epel-repo-in-rhel-centos-oracle-scentific-linux/
