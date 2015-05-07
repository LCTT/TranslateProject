How to Setup OpenERP (Odoo) on CentOS 7.x
================================================================================
Hi everyone, this tutorial is all about how we can setup Odoo (formerly known as OpenERP) on our CentOS 7 Server. Are you thinking to get an awesome ERP (Enterprise Resource Planning) app for your business ?. Then, OpenERP is the best app you are searching as it is a Free and Open Source Software which provides an outstanding features for your business or company.

[OpenERP][1] is a free and open source traditional OpenERP (Enterprise Resource Planning) app which includes Open Source CRM, Website Builder, eCommerce, Project Management, Billing & Accounting, Point of Sale, Human Resources, Marketing, Manufacturing, Purchase Management and many more modules included for a better way to boost the productivity and sales. Odoo Apps can be used as stand-alone applications, but they also integrate seamlessly so you get a full-featured Open Source ERP when you install several Apps.

So, here are some quick and easy steps to get your copy of OpenERP installed on your CentOS machine.

### 1. Installing PostgreSQL ###

First of all, we'll want to update the packages installed in our CentOS 7 machine to ensure that the latest packages, patches and security are up to date. To update our sytem, we should run the following command in a shell or terminal.

    # yum clean all
    # yum update

Now, we'll want to install PostgreSQL Database System as OpenERP uses PostgreSQL for its database system. To install it, we'll need to run the following command.

    # yum install postgresql postgresql-server postgresql-libs

![Installing postgresql](http://blog.linoxide.com/wp-content/uploads/2015/03/installing-postgresql.png)

After it is installed, we'll need to initialize the database with the following command

    # postgresql-setup initdb

![Intializating postgresql](http://blog.linoxide.com/wp-content/uploads/2015/03/intializating-postgresql.png)

We'll then set PostgreSQL to start on every boot and start the PostgreSQL Database server.

    # systemctl enable postgresql
    # systemctl start postgresql

As we haven't set a password for the user "postgresql", we'll want to set it now.

    # su - postgres
    $ psql
    postgres=# \password postgres
    postgres=# \q
    # exit

![setting password postgres](http://blog.linoxide.com/wp-content/uploads/2015/03/setting-password-postgres.png)

### 2. Configuring Odoo Repository ###

After our Database Server has been installed correctly, we'll want add EPEL (Extra Packages for Enterprise Linux)  to our CentOS server. Odoo (or OpenERP) depends on Python run-time and many other packages that are not included in default standard repository. As such, we'll want to add the Extra Packages for Enterprise Linux (or EPEL) repository support so that Odoo can get the required dependencies. To install, we'll need to run the following command.

    # yum install epel-release

![Installing EPEL Release](http://blog.linoxide.com/wp-content/uploads/2015/03/installing-epel-release.png)

Now, after we install EPEL, we'll now add repository of Odoo (OpenERP) using yum-config-manager.

    # yum install yum-utils

    # yum-config-manager --add-repo=https://nightly.odoo.com/8.0/nightly/rpm/odoo.repo

![Adding OpenERP (Odoo) Repo](http://blog.linoxide.com/wp-content/uploads/2015/03/added-odoo-repo.png)

### 3. Installing Odoo 8 (OpenERP) ###

Finally after adding repository of Odoo 8 (OpenERP) in our CentOS 7 machine. We'll can install Odoo 8 (OpenERP) using the following command.

    # yum install -y odoo

The above command will install odoo along with the necessary dependency packages.

![Installing odoo or OpenERP](http://blog.linoxide.com/wp-content/uploads/2015/03/installing-odoo.png)

Now, we'll enable automatic startup of Odoo in every boot and will start our Odoo service using the command below.

    # systemctl enable odoo
    # systemctl start odoo

![Starting Odoo](http://blog.linoxide.com/wp-content/uploads/2015/03/starting-odoo.png)

### 4. Allowing Firewall ###

As Odoo uses port 8069, we'll need to allow firewall for remote access. We can allow firewall to port 8069 by running the following command.

    # firewall-cmd --zone=public --add-port=8069/tcp --permanent
    # firewall-cmd --reload

![Allowing firewall Port](http://blog.linoxide.com/wp-content/uploads/2015/03/allowing-firewall-port.png)

**Note: By default, only connections from localhost are allowed. If we want to allow remote access to PostgreSQL databases, we'll need to add the line shown in the below image to pg_hba.conf configuration file:**

    # nano /var/lib/pgsql/data/pg_hba.conf

![Allowing Remote Access pgsql](http://blog.linoxide.com/wp-content/uploads/2015/03/allowing-remote-access-pgsql.png)

### 5. Web Interface ###

Finally, as we have successfully installed our latest Odoo 8 (OpenERP) on our CentOS 7 Server, we can now access our Odoo by browsing to http://ip-address:8069 http://my-site.com:8069 using our favorite web browser. Then, first thing we'll gonna do is we'll create a new database and create a new password for it. Note, the master password is admin by default. Then, we can login to our panel with that username and password.

![Odoo Panel](http://blog.linoxide.com/wp-content/uploads/2015/03/odoo-panel.png)

### Conclusion ###

Odoo 8 (formerly OpenERP) is the best ERP app available in the world of Open Source. We did an excellent work on installing it because OpenERP is a set of many modules which are essential for a complete ERP app for business and company. So, if you have any questions, suggestions, feedback please write them in the comment box below. Thank you ! Enjoy OpenERP (Odoo 8)  :-)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/setup-openerp-odoo-centos-7/

作者：[Arun Pyasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:https://www.odoo.com/