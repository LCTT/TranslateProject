disylee 占一个，不要跟我抢啦~~
Setup Virtual Hosts In Apache On Ubuntu 14.04 LTS
================================================================================
**Virtual Hosts** are used to setup more than one domain or websites using a single IP address. This is very useful if anybody wants to run multiple websites using a single IP address on single VPS.

In this tutorial, let me show how to setup virtual hosts in Apache web server on Ubuntu 14.04 LTS. Be mindful that this tutorial is only tested On Ubuntu 14.04 32bit edition. I may not issue any assurance that this will work on all other Ubuntu lower versions and Ubuntu derivatives.

### Scenario ###

For this tutorial, I will be using Ubuntu 14.04 32bit LTS, and I am going to host two testing websites called “**unixmen1.local**” and “**unixmen2.local**”. My test box IP address and hostname are **192.168.1.250/24** and **server.unixmen.local** respectively. Change the virtual domain names as per your requirement.

### Install Apache Webserver ###

Prior to install apache server, let us update our Ubuntu server:

    sudo apt-get update

Now, install apache web server using the following command:

    sudo apt-get install apache2

After installing apache server, let us test whether the webserver is working properly or not by navigating to the URL **http://ip-address/**.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/06/Apache2-Ubuntu-Default-Page-It-works-Mozilla-Firefox_001.png)

As you see in the above picture, apache webserver is working.

### Setting Up Virtual Hosts ###

#### 1. Create Virtual Directories ####

Now, let us proceed to setup virtual hosts. As I mentioned earlier, I am going to host two virtual hosts called “**unixmen1.local**”, and “**unixmen2.local**”.

Create a public to place the two virtual hosts data’s.

First, let us create a directory for unixmen1.local site:

    sudo mkdir -p /var/www/unixmen1.local/public_html

Then, create the directory for unixmen2.local site:

    sudo mkdir -p /var/www/unixmen2.local/public_html

#### 2. Setting Up Ownership and Permissions ####

The above directories are owned by root user now. We should change the ownership of these two directories to the regular user, instead of root user.

    sudo chown -R $USER:$USER /var/www/unixmen1.local/public_html/
    sudo chown -R $USER:$USER /var/www/unixmen2.local/public_html/

The “**$USER**” variable indicates the currently logged in user.

Set the read permissions to the apache web root (/var/www) directory, so that everyone can read files from that directory.

    sudo chmod -R 755 /var/www/

We have created the directories for holding the websites data’s and assigned the necessary permissions and ownership to them.

#### 4. Create Sample pages for Virtual Hosts ####

Now, we have to the sample pages to be served through the websites. First, let us create a sample page to the **unixmen1.local** virtual host.

Create a index.html for unixmen1.local virtual host,

    sudo vi /var/www/unixmen1.local/public_html/index.html

Add the following contents:

    <html>
     <head>
     <title>www.unixmen1.local</title>
     </head>
     <body>
     <h1>Welcome To Unixmen1.local website</h1>
     </body>
    </html>

Save and close the file.

Similarly, add the sample page to the second virtual host.

    sudo vi /var/www/unixmen2.local/public_html/index.html

Add the following contents:

    <html>
     <head>
     <title>www.unixmen2.local</title>
     </head>
     <body>
     <h1>Welcome To Unixmen2.local website</h1>
     </body>
    </html>

Save and close the file.

#### 5. Create Virtual Host Files ####

By default, apache comes with a default virtual host file called 000-default.conf. We will copy the **000-default.conf** file contents to our new virtual host files.

    sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/unixmen1.local.conf
    sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/unixmen2.local.conf

Make sure the virtual host files contains .conf extension at the end.

Now, modify the unximen1.local.conf file to reflect with our new own values.

    sudo vi /etc/apache2/sites-available/unixmen1.local.conf

Make the relevant changes that reflect to the unixmen1 site.

    <VirtualHost *:80>
            # The ServerName directive sets the request scheme, hostname and port that
            # the server uses to identify itself. This is used when creating
            # redirection URLs. In the context of virtual hosts, the ServerName
            # specifies what hostname must appear in the request's Host: header to
            # match this virtual host. For the default virtual host (this file) this
            # value is not decisive as it is used as a last resort host regardless.
            # However, you must set it for any further virtual host explicitly.
            #ServerName www.example.com
    
            ServerAdmin webmaster@unixmen1.local
            ServerName unixmen1.local
            ServerAlias www.unixmen1.local
            DocumentRoot /var/www/unixmen1.local/public_html
    
            # Available loglevels: trace8, ..., trace1, debug, info, notice, warn,
            # error, crit, alert, emerg.
            # It is also possible to configure the loglevel for particular
            # modules, e.g.
            #LogLevel info ssl:warn
    
            ErrorLog ${APACHE_LOG_DIR}/error.log
            CustomLog ${APACHE_LOG_DIR}/access.log combined
    
            # For most configuration files from conf-available/, which are
            # enabled or disabled at a global level, it is possible to
            # include a line for only one particular virtual host. For example the
            # following line enables the CGI configuration for this host only
            # after it has been globally disabled with "a2disconf".
            #Include conf-available/serve-cgi-bin.conf
    </VirtualHost>

Like wise, modify the second virtual host file.

    sudo vi /etc/apache2/sites-available/unixmen2.local.conf

Make the relevant changes that reflect to the unixmen2 site.

    <VirtualHost *:80>
            # The ServerName directive sets the request scheme, hostname and port that
            # the server uses to identify itself. This is used when creating
            # redirection URLs. In the context of virtual hosts, the ServerName
            # specifies what hostname must appear in the request's Host: header to
            # match this virtual host. For the default virtual host (this file) this
            # value is not decisive as it is used as a last resort host regardless.
            # However, you must set it for any further virtual host explicitly.
            #ServerName www.example.com
    
            ServerAdmin webmaster@unixmen2.local
            ServerName unixmen2.local
            ServerAlias www.unixmen2.local
            DocumentRoot /var/www/unixmen2.local/public_html
    
            # Available loglevels: trace8, ..., trace1, debug, info, notice, warn,
            # error, crit, alert, emerg.
            # It is also possible to configure the loglevel for particular
            # modules, e.g.
            #LogLevel info ssl:warn
    
            ErrorLog ${APACHE_LOG_DIR}/error.log
            CustomLog ${APACHE_LOG_DIR}/access.log combined
    
            # For most configuration files from conf-available/, which are
            # enabled or disabled at a global level, it is possible to
            # include a line for only one particular virtual host. For example the
            # following line enables the CGI configuration for this host only
            # after it has been globally disabled with "a2disconf".
            #Include conf-available/serve-cgi-bin.conf
    </VirtualHost>

After modifying the virtual hosts files, disable the default virtual host (000.default.conf), and enable new virtual hosts as shown below.

    sudo a2dissite 000-default.conf
    sudo a2ensite unixmen1.local.conf
    sudo a2ensite unixmen2.local.conf

Finally, restart the apache service.

    sudo service apache2 restart

That’s it. Now, we successfully configured the apache virtual hosts on our Ubuntu server.

Testing Virtual Hosts

Edit file **/etc/hosts**,

    sudo vi /etc/hosts

Add the virtual domain names one by one as shown below.

    [...]
    192.168.1.250   unixmen1.local
    192.168.1.250   unixmen2.local

Save and close the file.

Open up your browser and point to the URL **http://unixmen1.local** or **http://unixmen2.local**. You should see the sample pages which we created earlier.

**Unixmen1.local Test page:**

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/06/www.unixmen1.local-Mozilla-Firefox_004.png)

**Unixmen2.local Test page:**

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/06/www.unixmen2.local-Mozilla-Firefox_005.png)

If you want to access these sites from your remote systems, you should add the actual domain name records in your DNS server. Hence, I don’t have any actual domain names and DNS server, I tested this only on my local system, and Its worked perfectly as I expected.

Cheers!

--------------------------------------------------------------------------------

via: http://www.unixmen.com/setup-virtual-hosts-apache-ubuntu-14-04-lts/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
