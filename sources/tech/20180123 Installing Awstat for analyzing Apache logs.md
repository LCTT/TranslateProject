Installing Awstat for analyzing Apache logs
======
AWSTAT is free an  very powerful log analyser tool for apache log files. After analyzing logs from apache, it present them in easy to understand graphical format. Awstat is short for Advanced Web statistics & it works on command line interface or on CGI.

In this tutorial, we will be installing AWSTAT on our Centos 7 machine for analyzing apache logs.

( **Recommended read** :[ **Scheduling important jobs with crontab**][1])

### Pre-requisites

 **1-** A website hosted on apache web server, to create one read below mentioned tutorials on apache web servers,

( **Recommended reads** - [**installing Apache**][2], [**Securing apache with SSL cert**][3] & **hardening tips for apache** )

 **2-** Epel repository enabled on the system, as Awstat packages are not available on default repositories. To enable epel-repo , run

```
$ rpm -Uvh https://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-10.noarch.rpm
```

### Installing Awstat

Once the epel-repository has been enabled on the system, awstat can be installed by running,

```
 $ yum install awstat
```

When awstat is installed, it creates a file for apache at '/etc/httpd/conf.d/awstat.conf' with some configurations. These configurations are good to be used incase web server &awstat are configured on the same machine but if awstat is on different machine than the webserver, then some changes are to be made to the file.

#### Configuring Apache for Awstat

To configure awstat for a remote web server, open /etc/httpd/conf.d/awstat.conf, & update the parameter 'Allow from' with the IP address of the web server

```
$ vi /etc/httpd/conf.d/awstat.conf

<Directory "/usr/share/awstats/wwwroot">
Options None
AllowOverride None
<IfModulemod_authz_core.c>
# Apache 2.4
Require local
</IfModule>
<IfModule !mod_authz_core.c>
# Apache 2.2
Order allow,deny
Allow from 127.0.0.1
Allow from 192.168.1.100
</IfModule>
</Directory>
```

Save the file & restart the apache services to implement the changes,

```
 $ systemctl restart httpd
```

#### Configuring AWSTAT

For every website that we add to awstat, a different configuration file needs to be created with the website information . An example file is created in folder '/etc/awstats' by the name 'awstats.localhost.localdomain.conf', we can make copies of it & configure our website with this,

```
$ cd /etc/awstats
$ cp awstats.localhost.localdomain.conf awstats.linuxtechlab.com.conf
```

Now open the file & edit the following three parameters to match your website,

```
$ vi awstats.linuxtechlab.com.conf

LogFile="/var/log/httpd/access.log"
SiteDomain="linuxtechlab.com"
HostAliases=www.linuxtechlab.com localhost 127.0.0.1
```

Last step is to update the configuration file, which can be done executing the command below,

```
/usr/share/awstats/wwwroot/cgi-bin/awstats.pl -config=linuxtechlab.com -update
```

#### Checking the awstat page

To test/check the awstat page, open web-browser & enter the following URL in the address bar,
**https://linuxtechlab.com/awstats/awstats.pl?config=linuxtechlab.com**

![awstat][5]

**Note-** we can also schedule a cron job to update the awstat on regular basis. An example for the crontab

```
$ crontab -e
0 1 * * * /usr/share/awstats/wwwroot/cgi-bin/awstats.pl -config=linuxtechlab.com–update
```

We now end our tutorial on installing Awstat for analyzing apache logs, please leave your comments/queries in the comment box below.


--------------------------------------------------------------------------------

via: http://linuxtechlab.com/installing-awstat-analyzing-apache-logs/

作者：[SHUSAIN][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxtechlab.com/author/shsuain/
[1]:http://linuxtechlab.com/scheduling-important-jobs-crontab/
[2]:http://linuxtechlab.com/beginner-guide-configure-apache/
[3]:http://linuxtechlab.com/create-ssl-certificate-apache-server/
[4]:https://i1.wp.com/linuxtechlab.com/wp-content/plugins/a3-lazy-load/assets/images/lazy_placeholder.gif?resize=602%2C312
[5]:https://i0.wp.com/linuxtechlab.com/wp-content/uploads/2017/04/awstat.jpg?resize=602%2C312
