ictlyh Translating
Install PostgreSQL 9.4 And phpPgAdmin On Ubuntu 15.10
================================================================================
![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2014/05/postgresql.png)

### Introduction ###

[PostgreSQL][1] is a powerful, open-source object-relational database system. It runs under all major operating systems, including Linux, UNIX (AIX, BSD, HP-UX, SGI IRIX, Mac OS, Solaris, Tru64), and Windows OS.

Here is what **Mark Shuttleworth**, the founder of **Ubuntu**, says about PostgreSQL.

> Postgres is a truly awesome database. When we started working on Launchpad I wasn’t sure if it would be up to the job. I was so wrong. It’s been robust, fast, and professional in every regard.
> 
> — Mark Shuttleworth.

In this handy tutorial, let us see how to install PostgreSQL 9.4 on Ubuntu 15.10 server.

### Install PostgreSQL ###

PostgreSQL is available in the default repositories. So enter the following command from the Terminal to install it.

    sudo apt-get install postgresql postgresql-contrib

If you’re looking for other versions, add the PostgreSQL repository, and install it as shown below.

The **PostgreSQL apt repository** supports LTS versions of Ubuntu (10.04, 12.04 and 14.04) on amd64 and i386 architectures as well as select non-LTS versions(14.10). While not fully supported, the packages often work on other non-LTS versions as well, by using the closest LTS version available.

#### On Ubuntu 14.10 systems: ####

Create the file **/etc/apt/sources.list.d/pgdg.list**;

    sudo vi /etc/apt/sources.list.d/pgdg.list

Add a line for the repository:

    deb http://apt.postgresql.org/pub/repos/apt/ utopic-pgdg main

**Note**: The above repository will only work on Ubuntu 14.10. It is not updated yet to Ubuntu 15.04 and 15.10.

**On Ubuntu 14.04**, add the following line:

    deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main

**On Ubuntu 12.04**, add the following line:

    deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main

Import the repository signing key:

    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc

----------

    sudo apt-key add -

Update the package lists:

    sudo apt-get update

Then install the required version.

    sudo apt-get install postgresql-9.4

### Accessing PostgreSQL command prompt ###

The default database name and database user are “**postgres**”. Switch to postgres user to perform postgresql related operations:

    sudo -u postgres psql postgres

#### Sample Output: ####

    psql (9.4.5)
    Type "help" for help.
    postgres=#

To exit from posgresql prompt, type **\q** in the **psql** prompt return back to the Terminal.

### Set “postgres” user password ###

Login to postgresql prompt,

    sudo -u postgres psql postgres

.. and set postgres password with following command:

    postgres=# \password postgres 
    Enter new password: 
    Enter it again: 
    postgres=# \q

To install PostgreSQL Adminpack, enter the command in postgresql prompt:

    sudo -u postgres psql postgres

----------

    postgres=# CREATE EXTENSION adminpack;
    CREATE EXTENSION

Type **\q** in the **psql** prompt to exit from posgresql prompt, and return back to the Terminal.

### Create New User and Database ###

For example, let us create a new user called “**senthil**” with password “**ubuntu**”, and database called “**mydb**”.

    sudo -u postgres createuser -D -A -P senthil

----------

    sudo -u postgres createdb -O senthil mydb

### Delete Users and Databases ###

To delete the database, switch to postgres user:

    sudo -u postgres psql postgres

Enter command:

    $ drop database <database-name>

To delete a user, enter the following command:

    $ drop user <user-name>

### Configure PostgreSQL-MD5 Authentication ###

**MD5 authentication** requires the client to supply an MD5-encrypted password for authentication. To do that, edit **/etc/postgresql/9.4/main/pg_hba.conf** file:

    sudo vi /etc/postgresql/9.4/main/pg_hba.conf

Add or Modify the lines as shown below

    [...]
    # TYPE  DATABASE        USER            ADDRESS                 METHOD
    # "local" is for Unix domain socket connections only
    local   all             all                                     md5
    # IPv4 local connections:
    host    all             all             127.0.0.1/32            md5
    host    all             all             192.168.1.0/24          md5
    # IPv6 local connections:
    host    all             all             ::1/128                 md5
    [...]

Here, 192.168.1.0/24 is my local network IP address. Replace this value with your own address.

Restart postgresql service to apply the changes:

    sudo systemctl restart postgresql

Or,

    sudo service postgresql restart

### Configure PostgreSQL-Configure TCP/IP ###

By default, TCP/IP connection is disabled, so that the users from another computers can’t access postgresql. To allow to connect users from another computers, Edit file **/etc/postgresql/9.4/main/postgresql.conf:**

    sudo vi /etc/postgresql/9.4/main/postgresql.conf

Find the lines:

    [...]
    #listen_addresses = 'localhost'
    [...]
    #port = 5432
    [...]

Uncomment both lines, and set the IP address of your postgresql server or set ‘*’ to listen from all clients as shown below. You should be careful to make postgreSQL to be accessible from all remote clients.

    [...]
    listen_addresses = '*'
    [...]
    port = 5432
    [...]

Restart postgresql service to save changes:

    sudo systemctl restart postgresql

Or,

    sudo service postgresql restart

### Manage PostgreSQL with phpPgAdmin ###

[**phpPgAdmin**][2] is a web-based administration utility written in PHP for managing PosgreSQL.

phpPgAdmin is available in default repositories. So, Install phpPgAdmin using command:

    sudo apt-get install phppgadmin

By default, you can access phppgadmin using **http://localhost/phppgadmin** from your local system’s web browser.

To access remote systems, do the following.
On Ubuntu 15.10 systems:

Edit file **/etc/apache2/conf-available/phppgadmin.conf**,

    sudo vi /etc/apache2/conf-available/phppgadmin.conf

Find the line **Require local** and comment it by adding a **#** in front of the line.

    #Require local

And add the following line:

    allow from all

Save and exit the file.

Then, restart apache service.

    sudo systemctl restart apache2

On Ubuntu 14.10 and previous versions:

Edit file **/etc/apache2/conf.d/phppgadmin**:

    sudo nano /etc/apache2/conf.d/phppgadmin

Comment the following line:

    [...]
    #allow from 127.0.0.0/255.0.0.0 ::1/128

Uncomment the following line to make phppgadmin from all systems.

    allow from all

Edit **/etc/apache2/apache2.conf**:

    sudo vi /etc/apache2/apache2.conf

Add the following line:

    Include /etc/apache2/conf.d/phppgadmin

Then, restart apache service.

    sudo service apache2 restart

### Configure phpPgAdmin ###

Edit file **/etc/phppgadmin/config.inc.php**, and do the following changes. Most of these options are self-explanatory. Read them carefully to know why do you change these values.

    sudo nano /etc/phppgadmin/config.inc.php

Find the following line:

    $conf['servers'][0]['host'] = '';

Change it as shown below:

    $conf['servers'][0]['host'] = 'localhost';

And find the line:

    $conf['extra_login_security'] = true;

Change the value to **false**.

    $conf['extra_login_security'] = false;

Find the line:

    $conf['owned_only'] = false;

Set the value as **true**.

    $conf['owned_only'] = true;

Save and close the file. Restart postgresql service and Apache services.

    sudo systemctl restart postgresql

----------

    sudo systemctl restart apache2

Or,

    sudo service postgresql restart

    sudo service apache2 restart

Now open your browser and navigate to **http://ip-address/phppgadmin**. You will see the following screen.

![phpPgAdmin – Google Chrome_001](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/11/phpPgAdmin-Google-Chrome_001.jpg)

Login with users that you’ve created earlier. I already have created a user called “**senthil**” with password “**ubuntu**” before, so I log in with user “senthil”.

![phpPgAdmin – Google Chrome_002](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/11/phpPgAdmin-Google-Chrome_002.jpg)

Now, you will be able to access the phppgadmin dashboard.

![phpPgAdmin – Google Chrome_003](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/11/phpPgAdmin-Google-Chrome_003.jpg)

Log in with postgres user:

![phpPgAdmin – Google Chrome_004](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/11/phpPgAdmin-Google-Chrome_004.jpg)

That’s it. Now you’ll able to create, delete and alter databases graphically using phppgadmin.

Cheers!

--------------------------------------------------------------------------------

via: http://www.unixmen.com/install-postgresql-9-4-and-phppgadmin-on-ubuntu-15-10/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.twitter.com/ostechnix
[1]:http://www.postgresql.org/
[2]:http://phppgadmin.sourceforge.net/doku.php