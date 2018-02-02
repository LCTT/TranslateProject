translated by cyleft

reate your own personal Cloud: Install OwnCloud
======
Cloud is what everyone is talking about. We have a number of major players in the market that are offering cloud storage as well as other cloud based services. But we can also create a personal cloud for ourselves.

In this tutorial we are going to discuss how to create a personal cloud using OwnCloud. OwnCloud is a web application, that we can install on our Linux machines, to store & serve data. It can be used for sharing calender, Contacts and Bookmark sharing and Personal Audio/Video Streaming etc.

For this tutorial, we will be using CentOS 7 machine but this tutorial can also be used to install ownCloud on other Linux distributions as well. Let's start with pre-requisites for installing ownCloud,

 **(Recommended Read:[How to use Apache as Reverse Proxy on CentOS & RHEL][1])**

 **(Also Read:[Real Time Linux server monitoring with GLANCES monitoring tool][2])**

### Pre-requisites

  * We need to have LAMP stack configured on our machines. Please go through our articles '[ Easiest guide for setting up LAMP server for CentOS/RHEL ][3] & [Create LAMP stack on Ubuntu][4].

  * We will also need the following php packages installed on our machines,' php-mysql php-json php-xml php-mbstring php-zip php-gd curl php-curl php-pdo'. Install them using the package manager.

```
$ sudo yum install php-mysql php-json php-xml php-mbstring php-zip php-gd curl php-curl php-pdo
```

### Installation

To install owncloud, we will now download the ownCloud package on our server. Use the following command to download the latest package (10.0.4-1) from ownCloud official website,

```
 $ wget https://download.owncloud.org/community/owncloud-10.0.4.tar.bz2
```

Extract it using the following command,

```
 $ tar -xvf owncloud-10.0.4.tar.bz2
```

Now move all the contents of extracted folder to '/var/www/html'

```
 $ mv owncloud/* /var/www/html
```

Next thing we need to do is to make a change in apache configuration file 'httpd.conf',

```
 $ sudo vim /etc/httpd/conf/httpd.com
```

& change the following option,

```
 AllowOverride All
```

Now save the file & change the permissions for owncloud folder,

```
 $ sudo chown -R apache:apache /var/www/html/
 $ sudo chmod 777 /var/www/html/config/
```

Now restart the apache service to implement the changes made,

```
 $ sudo systemctl restart httpd
```

Now we need to create a database on mariadb to store all the data from owncloud. Create a database & a db user with the following commands,

```
 $ mysql -u root -p
 MariaDB [(none)] > create database owncloud;
 MariaDB [(none)] > GRANT ALL ON owncloud.* TO ocuser@localhost IDENTIFIED BY 'owncloud';
 MariaDB [(none)] > flush privileges;
 MariaDB [(none)] > exit
```

Configuration part on server is completed, we can now access the owncloud from a web browser. Open a browser of your choosing & enter the IP address of the server, which in our case is 10.20.30.100,

![install owncloud][7]

As soon as the URL loads, we will be presented with the above mentioned page. Here we will create our admin user & will also provide our database information. Once all the information has been provided, click on 'Finish setup'.

We will than be redirected to login page, where we need to enter the credentials we created in previous step,

![install owncloud][9]

Upon successful authentication, we will enter into the ownCloud dashboard,

![install owncloud][11]

We can than use mobile apps or can also upload our data using the web interface. We now have our own personal cloud ready. We now end this tutorial on how to install ownCloud to create your own cloud. Please do leave your questions or suggestions in the comment box below.


--------------------------------------------------------------------------------

via: http://linuxtechlab.com/create-personal-cloud-install-owncloud/

作者：[SHUSAIN][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxtechlab.com/author/shsuain/
[1]:http://linuxtechlab.com/apache-as-reverse-proxy-centos-rhel/
[2]:http://linuxtechlab.com/linux-server-glances-monitoring-tool/
[3]:http://linuxtechlab.com/easiest-guide-creating-lamp-server/
[4]:http://linuxtechlab.com/install-lamp-stack-on-ubuntu/
[6]:https://i1.wp.com/linuxtechlab.com/wp-content/plugins/a3-lazy-load/assets/images/lazy_placeholder.gif?resize=400%2C647
[7]:https://i1.wp.com/linuxtechlab.com/wp-content/uploads/2018/01/owncloud1-compressor.jpg?resize=400%2C647
[8]:https://i1.wp.com/linuxtechlab.com/wp-content/plugins/a3-lazy-load/assets/images/lazy_placeholder.gif?resize=876%2C541
[9]:https://i1.wp.com/linuxtechlab.com/wp-content/uploads/2018/01/owncloud2-compressor1.jpg?resize=876%2C541
[10]:https://i1.wp.com/linuxtechlab.com/wp-content/plugins/a3-lazy-load/assets/images/lazy_placeholder.gif?resize=981%2C474
[11]:https://i0.wp.com/linuxtechlab.com/wp-content/uploads/2018/01/owncloud3-compressor1.jpg?resize=981%2C474
