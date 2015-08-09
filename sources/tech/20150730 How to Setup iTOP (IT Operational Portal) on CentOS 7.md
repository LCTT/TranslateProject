tranlsating---geekpi

How to Setup iTOP (IT Operational Portal) on CentOS 7
================================================================================
iTOP is a simple, Open source web based IT Service Management tool. It has all of ITIL functionality that includes with Service desk, Configuration Management, Incident Management, Problem Management, Change Management and Service Management. iTop relays on Apache/IIS, MySQL and PHP, so it can run on any operating system supporting these applications. Since iTop is a web based application you don’t need to deploy any client software on each user’s PC. A simple web browser is enough to perform day to day operations of an IT environment with iTOP.

To install and configure iTOP we will be using CentOS 7 as base operating with basic LAMP Stack environment installed on it that will cover its almost all prerequisites.

### Downloading iTOP ###

iTop download package is present on SourceForge, we can get its link from their official website [link][1].

![itop download](http://blog.linoxide.com/wp-content/uploads/2015/07/1-itop-download.png)

We will the download link from here and get this zipped file on server with wget command as below.

    [root@centos-007 ~]# wget http://downloads.sourceforge.net/project/itop/itop/2.1.0/iTop-2.1.0-2127.zip

### iTop Extensions and Web Setup ###

By using unzip command we will extract the downloaded packages in the document root directory of our apache web server in a new directory with name itop.

    [root@centos-7 ~]# ls
    iTop-2.1.0-2127.zip
    [root@centos-7 ~]# unzip iTop-2.1.0-2127.zip -d /var/www/html/itop/

List the folder to view installation packages in it.

    [root@centos-7 ~]# ls -lh /var/www/html/itop/
    total 68K
    -rw-r--r--. 1 root root 1.4K Dec 17 2014 INSTALL
    -rw-r--r--. 1 root root 35K Dec 17 2014 LICENSE
    -rw-r--r--. 1 root root 23K Dec 17 2014 README
    drwxr-xr-x. 19 root root 4.0K Jul 14 13:10 web

Here is all the extensions that we can install.

    [root@centos-7 2.x]# ls
    authent-external itop-backup itop-config-mgmt itop-problem-mgmt itop-service-mgmt-provider itop-welcome-itil
    authent-ldap itop-bridge-virtualization-storage itop-datacenter-mgmt itop-profiles-itil itop-sla-computation version.xml
    authent-local itop-change-mgmt itop-endusers-devices itop-request-mgmt itop-storage-mgmt wizard-icons
    installation.xml itop-change-mgmt-itil itop-incident-mgmt-itil itop-request-mgmt-itil itop-tickets
    itop-attachments itop-config itop-knownerror-mgmt itop-service-mgmt itop-virtualization-mgmt

Now from the extracted web directory, moving through different data models we will migrate the required extensions from the datamodels into the web extensions directory of web document root directory with copy command.

    [root@centos-7 2.x]# pwd
    /var/www/html/itop/web/datamodels/2.x
    [root@centos-7 2.x]# cp -r itop-request-mgmt itop-service-mgmt itop-service-mgmt itop-config itop-change-mgmt /var/www/html/itop/web/extensions/

### Installing iTop Web Interface ###

Most of our server side settings and configurations are done.Finally we need to complete its web interface installation process to finalize the setup.

Open your favorite web browser and access the WordPress web directory in your web browser using your server IP or FQDN like.

    http://servers_ip_address/itop/web/

You will be redirected towards the web installation process for iTop. Let’s configure it as per your requirements like we did here in this tutorial.

#### Prerequisites Validation ####

At the stage you will be prompted for welcome screen with prerequisites validation ok. If you get some warning then you have to make resolve it by installing its prerequisites.

![mcrypt missing](http://blog.linoxide.com/wp-content/uploads/2015/07/2-itop-web-install.png)

At this stage one optional package named php mcrypt will be missing. Download the following rpm package then try to install php mcrypt package.

    [root@centos-7 ~]#yum localinstall php-mcrypt-5.3.3-1.el6.x86_64.rpm libmcrypt-2.5.8-9.el6.x86_64.rpm.

After successful installation of php-mcrypt library we need to restart apache web service, then reload the web page and this time its prerequisites validation should be OK.

#### Install or Upgrade iTop ####

Here we will choose the fresh installation as we have not installed iTop previously on our server.

![Install New iTop](http://blog.linoxide.com/wp-content/uploads/2015/07/3.png)

#### iTop License Agreement ####

Chose the option to accept the terms of the licenses of all the components of iTop and click "NEXT".

![License Agreement](http://blog.linoxide.com/wp-content/uploads/2015/07/4.png)

#### Database Configuration ####

Here we the do Configuration of the database connection by giving our database servers credentials and then choose from the option to create new database as shown.

![DB Connection](http://blog.linoxide.com/wp-content/uploads/2015/07/5.png)

#### Administrator Account ####

In this step we will configure an Admin account by filling out its login details as.

![Admin Account](http://blog.linoxide.com/wp-content/uploads/2015/07/6.png)

#### Miscellaneous Parameters ####

Let's choose the additional parameters whether you want to install with demo contents or with fresh database and proceed forward.

![Misc Parameters](http://blog.linoxide.com/wp-content/uploads/2015/07/7.png)

### iTop Configurations Management ###

The options below allow you to configure the type of elements that are to be managed inside iTop like all the base objects that are mandatory in the iTop CMDB, Manage Data Center devices, storage device and virtualization.

![Conf Management](http://blog.linoxide.com/wp-content/uploads/2015/07/8.png)

#### Service Management ####

Select from the choices that best describes the relationships between the services and the IT infrastructure in your IT environment. So we are choosing Service Management for Service Providers here.

![Service Management](http://blog.linoxide.com/wp-content/uploads/2015/07/9.png)

#### iTop Tickets Management ####

From the different available options we will Select the ITIL Compliant Tickets Management option to have different types of ticket for managing user requests and incidents.

![Ticket Management](http://blog.linoxide.com/wp-content/uploads/2015/07/10.png)

#### Change Management Options ####

Select the type of tickets you want to use in order to manage changes to the IT infrastructure from the available options. We are going to choose ITIL change management option here.

![ITIL Change](http://blog.linoxide.com/wp-content/uploads/2015/07/11.png)

#### iTop Extensions ####

In this section we can select the additional extensions to install or we can unchecked the ones that you want to skip.

![iTop Extensions](http://blog.linoxide.com/wp-content/uploads/2015/07/13.png)

### Ready to Start Web Installation ###

Now we are ready to start installing the components that we choose in previous steps. We can also drop down these installation parameters to view our configuration from the drop down.

Once you are confirmed with the installation parameters click on the install button.

![Installation Parameters](http://blog.linoxide.com/wp-content/uploads/2015/07/16.png)

Let's wait for the progress bar to complete the installation process. It might takes few minutes to complete its installation process.

![iTop Installation Process](http://blog.linoxide.com/wp-content/uploads/2015/07/17.png)

### iTop Installation Done ###

Our iTop installation setup is complete, just need to do a simple manual operation as shown and then click to enter iTop.

![iTop Done](http://blog.linoxide.com/wp-content/uploads/2015/07/18.png)

### Welcome to iTop (IT Operational Portal) ###

![itop welcome note](http://blog.linoxide.com/wp-content/uploads/2015/07/20.png)

### iTop Dashboard ###

You can manage configuration of everything from here Servers, computers, Contacts, Locations, Contracts, Network devices…. You can create your own. Just the fact, that the installed CMDB module is great which is an essential part of every bigger IT.

![iTop Dashboard](http://blog.linoxide.com/wp-content/uploads/2015/07/19.png)

### Conclusion ###

ITOP is one of the best Open Source Service Desk solutions. We have successfully installed and configured it on our CentOS 7 cloud host. So, the most powerful aspect of iTop is the ease with which it can be customized via its “extensions”. Feel free to comment if you face any trouble during its setup.

--------------------------------------------------------------------------------

via: http://linoxide.com/tools/setup-itop-centos-7/

作者：[Kashif Siddique][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/kashifs/
[1]:http://www.combodo.com/spip.php?page=rubrique&id_rubrique=8
