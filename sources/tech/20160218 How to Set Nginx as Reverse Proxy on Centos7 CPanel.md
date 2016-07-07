

【flankershen翻译中】



How to Set Nginx as Reverse Proxy on Centos7 CPanel
================================================================================

Nginx is one of the fastest and most powerful web-server. It is known for its high performance and low resource utilization. It can be installed as both a standalone and a Reverse Proxy Web-server. In this article, I'm discussing about the installation of Nginx as a reverse proxy along with Apache on a CPanel server with latest CentOS 7 installed.

Nginx as a reverse proxy will work as a frontend webserver serving static contents along with Apache serving the dynamic files in backend. This setup will boost up the overall server performance.

Let's walk through the installation steps for Nginx as reverse proxy in CentOS7 x86_64 bit server with cPanel 11.52 installed.

First of all, we need to install the EPEL repo to start-up with the process.

### Step 1: Install the EPEL repo. ###

    root@server1 [/usr]# yum -y install epel-release
    Loaded plugins: fastestmirror, tsflags, universal-hooks
    Loading mirror speeds from cached hostfile
    * EA4: 66.23.237.210
    * base: mirrors.linode.com
    * extras: mirrors.linode.com
    * updates: mirrors.linode.com
    Resolving Dependencies
    --> Running transaction check
    ---> Package epel-release.noarch 0:7-5 will be installed
    --> Finished Dependency Resolution
    
    Dependencies Resolved
    
    ===============================================================================================================================================
    Package Arch Version Repository Size
    ===============================================================================================================================================
    Installing:
    epel-release noarch 7-5 extras 14 k

### Step 2: After installing the repo, we can start with the installation of the nDeploy RPM repo for CentOS to install our required nDeploy Webstack and Nginx plugin. ###

    root@server1 [/usr]# yum -y install http://rpm.piserve.com/nDeploy-release-centos-1.0-1.noarch.rpm
    Loaded plugins: fastestmirror, tsflags, universal-hooks
    nDeploy-release-centos-1.0-1.noarch.rpm | 1.7 kB 00:00:00
    Examining /var/tmp/yum-root-ei5tWJ/nDeploy-release-centos-1.0-1.noarch.rpm: nDeploy-release-centos-1.0-1.noarch
    Marking /var/tmp/yum-root-ei5tWJ/nDeploy-release-centos-1.0-1.noarch.rpm to be installed
    Resolving Dependencies
    --> Running transaction check
    ---> Package nDeploy-release-centos.noarch 0:1.0-1 will be installed
    --> Finished Dependency Resolution
    
    Dependencies Resolved
    
    ===============================================================================================================================================
    Package Arch Version Repository Size
    ===============================================================================================================================================
    Installing:
    nDeploy-release-centos noarch 1.0-1 /nDeploy-release-centos-1.0-1.noarch 110

### Step 3: Install the nDeploy and Nginx nDeploy plugins. ###

    root@server1 [/usr]# yum --enablerepo=ndeploy install nginx-nDeploy nDeploy
    Loaded plugins: fastestmirror, tsflags, universal-hooks
    epel/x86_64/metalink | 9.9 kB 00:00:00
    epel | 4.3 kB 00:00:00
    ndeploy | 2.9 kB 00:00:00
    (1/4): ndeploy/7/x86_64/primary_db | 14 kB 00:00:00
    (2/4): epel/x86_64/group_gz | 169 kB 00:00:00
    (3/4): epel/x86_64/primary_db | 3.7 MB 00:00:02
    
    Dependencies Resolved
    
    ===============================================================================================================================================
    Package Arch Version Repository Size
    ===============================================================================================================================================
    Installing:
    nDeploy noarch 2.0-11.el7 ndeploy 80 k
    nginx-nDeploy x86_64 1.8.0-34.el7 ndeploy 36 M
    Installing for dependencies:
    PyYAML x86_64 3.10-11.el7 base 153 k
    libevent x86_64 2.0.21-4.el7 base 214 k
    memcached x86_64 1.4.15-9.el7 base 84 k
    python-inotify noarch 0.9.4-4.el7 base 49 k
    python-lxml x86_64 3.2.1-4.el7 base 758 k
    
    Transaction Summary
    ===============================================================================================================================================
    Install 2 Packages (+5 Dependent packages)

With these steps, we've completed with the installation of Nginx plugin in our server. Now we need to configure Nginx as reverse proxy and create the virtualhost for the existing cPanel user accounts. For that we can run the following script.

### Step 4: To enable Nginx as a front end Web Server and create the default configuration files. ###

    root@server1 [/usr]# /opt/nDeploy/scripts/cpanel-nDeploy-setup.sh enable
    Modifying apache http and https port in cpanel
    
    httpd restarted successfully.
    Created symlink from /etc/systemd/system/multi-user.target.wants/nginx.service to /usr/lib/systemd/system/nginx.service.
    Created symlink from /etc/systemd/system/multi-user.target.wants/ndeploy_watcher.service to /usr/lib/systemd/system/ndeploy_watcher.service.
    Created symlink from /etc/systemd/system/multi-user.target.wants/ndeploy_backends.service to /usr/lib/systemd/system/ndeploy_backends.service.
    ConfGen:: saheetha
    ConfGen:: satest

As you can see these script will modify the Apache port from 80 to another port to make Nginx run as a front end web server and create the virtual host configuration files for the existing cPanel accounts. Once it is done, confirm the status of both Apache and Nginx.

### Apache Status: ###

    root@server1 [/var/run/httpd]# systemctl status httpd
    ● httpd.service - Apache Web Server
    Loaded: loaded (/usr/lib/systemd/system/httpd.service; enabled; vendor preset: disabled)
    Active: active (running) since Mon 2016-01-18 06:34:23 UTC; 12s ago
    Process: 25606 ExecStart=/usr/sbin/apachectl start (code=exited, status=0/SUCCESS)
    Main PID: 24760 (httpd)
    CGroup: /system.slice/httpd.service
    ‣ 24760 /usr/local/apache/bin/httpd -k start
    
    Jan 18 06:34:23 server1.centos7-test.com systemd[1]: Starting Apache Web Server...
    Jan 18 06:34:23 server1.centos7-test.com apachectl[25606]: httpd (pid 24760) already running
    Jan 18 06:34:23 server1.centos7-test.com systemd[1]: Started Apache Web Server.

### Nginx Status: ###

    root@server1 [~]# systemctl status nginx
    ● nginx.service - nginx-nDeploy - high performance web server
    Loaded: loaded (/usr/lib/systemd/system/nginx.service; enabled; vendor preset: disabled)
    Active: active (running) since Sun 2016-01-17 17:18:29 UTC; 13h ago
    Docs: http://nginx.org/en/docs/
    Main PID: 3833 (nginx)
    CGroup: /system.slice/nginx.service
    ├─ 3833 nginx: master process /usr/sbin/nginx -c /etc/nginx/nginx.conf
    ├─25473 nginx: worker process
    ├─25474 nginx: worker process
    └─25475 nginx: cache manager process
    
    Jan 17 17:18:29 server1.centos7-test.com systemd[1]: Starting nginx-nDeploy - high performance web server...
    Jan 17 17:18:29 server1.centos7-test.com nginx[3804]: nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
    Jan 17 17:18:29 server1.centos7-test.com nginx[3804]: nginx: configuration file /etc/nginx/nginx.conf test is successful
    Jan 17 17:18:29 server1.centos7-test.com systemd[1]: Started nginx-nDeploy - high performance web server.

Nginx act as a frontend webserver running on port 80 and Apache configuration is modified to listen on http port 9999 and https port 4430. Please see their status below:

    root@server1 [/usr/local/src]# netstat -plan | grep httpd
    tcp 0 0 0.0.0.0:4430 0.0.0.0:* LISTEN 17270/httpd
    tcp 0 0 0.0.0.0:9999 0.0.0.0:* LISTEN 17270/httpd
    tcp6 0 0 :::4430 :::* LISTEN 17270/httpd
    tcp6 0 0 :::9999 :::* LISTEN 17270/httpd

![apacheport](http://blog.linoxide.com/wp-content/uploads/2016/01/apacheport.png)

    root@server1 [/usr/local/src]# netstat -plan | grep nginx
    tcp 0 0 127.0.0.1:80 0.0.0.0:* LISTEN 17802/nginx: master
    tcp 0 0 45.79.183.73:80 0.0.0.0:* LISTEN 17802/nginx: master

The virtualhost entries created for the existing users as located in the folder "**/etc/nginx/sites-enabled**". This file path is included in the Nginx main configuration file.

    root@server1 [/etc/nginx/sites-enabled]# ll | grep .conf
    -rw-r--r-- 1 root root 311 Jan 17 09:02 saheetha.com.conf
    -rw-r--r-- 1 root root 336 Jan 17 09:02 saheethastest.com.conf

### Sample Vhost for a domain: ###

    server {

    listen 45.79.183.73:80;
    #CPIPVSIX:80;
    
    # ServerNames
    server_name saheetha.com www.saheetha.com;
    access_log /usr/local/apache/domlogs/saheetha.com main;
    access_log /usr/local/apache/domlogs/saheetha.com-bytes_log bytes_log;
    
    include /etc/nginx/sites-enabled/saheetha.com.include;
    
    }

We can confirm the working of the web server status by calling a website in the browser. Please see the web server information on my server after the installation.

    root@server1 [/home]# ip a | grep -i eth0
    3: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP qlen 1000
    inet 45.79.183.73/24 brd 45.79.183.255 scope global dynamic eth0
    root@server1 [/home]# nginx -v
    nginx version: nginx/1.8.0

![webserver-status](http://blog.linoxide.com/wp-content/uploads/2016/01/webserver.png)

Nginx will create the virtual host automatically for any newly created accounts in cPanel. With these simple steps we can configure Nginx as reverse proxy on a CentOS 7/CPanel server.

### Advantages of Nginx as Reverse Proxy: ###

 1. Easy to install and configure
 2. Performance and efficiency
 3. Prevent DDOS attacks
 4. Allows .htaccess PHP rewrite rules

I hope this article is useful for you guys. Thank you for referring to this. I would appreciate your valuable comments and suggestions on this for further improvements.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/set-nginx-reverse-proxy-centos-7-cpanel/

作者：[Saheetha Shameer][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://linoxide.com/author/saheethas/
