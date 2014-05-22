Translating by GOLinux ...

How to manage ip addresses and subnets with phpIPAM
================================================================================
A typical network/system admin is responsible for managing one or more subnets within the network under control. For example, when a LAN segment is assigned a /24 subnet, a total of 254 IP addresses can be used for different purposes. To keep track of what IP addresses are assigned to which hosts, some sort of documentation is needed. The easiest way to do it would be maintaining a single spreadsheet which documents IP address allocation information. This works like a charm for a small network with only one admin. However, relying on a spreadsheet is not convenient and can be error-prone with multiple large networks. Worse, if there are multiple admins involved, updating the spreadsheet could be tricky as each admin could often end up with different versions of the document.

One way to manage IP address allocations more systematically is using a web based IP address management tool. Not only can the web based tool be accessed from anywhere, but a backend database also ensures that all updates to the database are properly synchronized and applied in real time. While there are many web applications available, we will be focusing on setting up [phpIPAM][1] (IP Address Manager) in this tutorial. phpIPAM is an open source, efficient IP address management application with the following features.

- Support for both IPv4 and IPv6 (unlike many other tools, IPv6 support is very good)
- Built in IPv4 and IPv6 calculator
- Supports CIDR notations
- MySQL support
- Nested subnets
- User/group based permissions
- Visual reporting tool
- Import/export using .xls files
- Device, VRF, and VLAN support
- Powerful search engine
- Email notifications
- Supports AD/LDAP based authentication 

The demo site for phpIPAM is available at [http://demo.phpipam.net][2].

In this tutorial, we will be **setting up phpIPAM along with Apache web server in the Ubuntu environment**.

### Installing phpIPAM on Ubuntu ###

First of all, install required packages using apt-get.

    # apt-get install apache2 mysql-server php5 php5-gmp php-pear php5-mysql php5-ldap wget

If MySQL has been installed for the first time, please set the root password using the following command.

    # mysqladmin -u root password NEWPASSWORD 

phpIPAM can be set up with any web server directory. We will set it up in the /phpipam/ sub directory under the root directory of Apache web server.

Download phpIPAM package.

    # wget http://kent.dl.sourceforge.net/project/phpipam/phpipam-1.0.tar

Extract the package into the web server directory.

    # cp phpipam-1.0.tar /var/www/
    # cp /var/www/
    # tar xvf phpipam-1.0.tar
    # rm phpipam-1.0.tar 

Now, specify the MySQL username and password, as well as its base directory.

    # vim /var/www/phpipam/config.php 

----------

    $db['host'] = "localhost";
     
    ## MySQL user for ipam ##
    $db['user'] = "phpipam";
     
    ## password for the MySQL user ##
    $db['pass'] = "phpipamadmin";
     
    ## database for MySQL ##
    $db['name'] = "phpipam";
     
    ## base directory ##
    define('BASE', "/phpipam/");

The base directory needs to be defined in the provided .htaccess file.

    # vim /var/www/phpipam/.htaccess 

> RewriteBase /phpipam/

### Preparing Apache Web Server ###

phpIPAM needs the rewrite module for operation. The module can be enabled in an Ubuntu or Debian machine using a2enmod command as follows.

    # a2enmod rewrite 

Next, Apache's default configuration needs to be changed as well. Please add/modify your configuration to look like the one below.

    # vim /etc/apache2/sites-enabled/000-default 

----------

    <Directory /var/www/>
            Options Indexes FollowSymLinks MultiViews
            AllowOverride all
            Order allow,deny
            allow from all
    </Directory>

Finally, restart Apache web service.

    # service apache2 restart 

### Finalizing Installation ###

We can finalize the installation of phpIPAM by using the web browser. Pointing the browser to the URL: http://<serverIP>/phpIPAM will show the following phpIPAM installation page. We can proceed to automatic database installation.

![](https://farm3.staticflickr.com/2928/14216904555_0095bf048f_z.jpg)

![](https://farm3.staticflickr.com/2934/14193740116_afc44b8338_z.jpg)

Now phpIPAM should be up and running. We can login using the following default credentials.

- **URL**: http://<serverIP>/phpipam
- **User**: Admin
- **Pass**: ipamadmin 

### Manage IP Addresses with phpIPAM ###

In the rest of the tutorial, we will walk you through how to manage subnets and IP addresses with phpIPAM.

#### Creating a section ####

Let us start by adding a section for our network. Click on Administration > Sections.

![](https://farm3.staticflickr.com/2926/14213603451_3c2918805c.jpg)

Click on "Add Section". Now we can name our section as we want it to be displayed. Fill in the details of the section.

[![](https://farm6.staticflickr.com/5195/14030287410_3d07a582ce_z.jpg)][3]

#### Creating a subnet ####

Next, we add a new subnet 172.16.1.0/24 under the section 'Our Network'. Click on Our Network > Add Subnet

![](https://farm3.staticflickr.com/2925/14213603401_e16917bb7a_z.jpg)

![](https://farm3.staticflickr.com/2937/14216715144_0427165702_z.jpg)

Now we can easily add IP addresses in the subnet. One method of adding IP addresses is to add them one by one. phpIPAM provides an alternative method to scan all the hosts and add them automatically without much hassle. It can scan the local subnet located in the same broadcast domain, as well as remote subnets reachable through routing. After selecting a subnet, click on 'scan subnet for new hosts' to scan IP addresses as shown below.

[![](https://farm6.staticflickr.com/5157/14193740006_ac2a01a3aa_o.png)][4]

After the scan is performed, the discovered IP addresses can be added into the database by clicking the 'Add discovered hosts' button at the bottom.

#### Creating an IPv6 subnet ####

IPv6 subnets can also be created in a similar process. We specify the IPv6 network as showed in the screenshot.

![](https://farm3.staticflickr.com/2922/14216715104_de8008bf94_z.jpg)

All the tools available for IPv4 can be used for IPv6 as well.

#### Creating a nested subnet ####

phpIPAM also provides the option of creating nested subnets for both IPv4 and IPv6. For example, we will be dividing our IP block 172.16.1.0/24 into 4 smaller subnets (/26), each for a specific department within the organization. After selecting the /24 subnet, we can create a nested subnet using the 'Add a new nested subnet' button. The screenshot below shows the icon for adding a nested subnet.

[![](https://farm6.staticflickr.com/5272/14030318447_66e4511cd6_o.png)][5]

After all the subnets have been created, we should have similar output. Following is a nested subnet preview window.

[![](https://farm6.staticflickr.com/5231/14216904305_5af77616f7_z.jpg)][6]

#### Adding users and groups ####

First, we will create a group with READ/WRITE permission to the section 'Our network'. This can be done by selecting Administration > Groups > Create Group.

![](https://farm3.staticflickr.com/2899/14030230539_73b1d5f7d4_z.jpg)

Now that the group has been created, we modify section permission by selecting Administration > Sections, and then editing the section.

[![](https://farm6.staticflickr.com/5489/14193739966_11a244e23b_z.jpg)][7]

![](https://farm3.staticflickr.com/2930/14030230519_597088ba26_z.jpg)

We will create a user named 'user1'. We will add the user to the group 'Demonstration group' so that it inherits all necessary permissions from the group. We start by clicking on Administration > Users > Create user.

[![](https://farm6.staticflickr.com/5585/14214506012_a581eef7de_z.jpg)][8]

Now we can log in as this user and add/modify IP addresses under the section 'Our network'.

To sum up, phpIPAM is a versatile IP address management tool that can be used for both IPv4 and IPv6. This tutorial focused on the basics that can help you get started. Be sure to test with all the available features like using IP address calculator, adding devices, VLANs and VRFs, and import/export using xls.

Hope this helps.

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/05/manage-ip-addresses-subnets-phpipam.html

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://phpipam.net/
[2]:http://demo.phpipam.net/
[3]:https://www.flickr.com/photos/xmodulo/14030287410/
[4]:https://www.flickr.com/photos/xmodulo/14193740006/
[5]:https://www.flickr.com/photos/xmodulo/14030318447/
[6]:https://www.flickr.com/photos/xmodulo/14216904305/
[7]:https://www.flickr.com/photos/xmodulo/14193739966/
[8]:https://www.flickr.com/photos/xmodulo/14214506012/
