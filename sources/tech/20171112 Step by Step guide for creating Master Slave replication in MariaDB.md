Step by Step guide for creating Master Slave replication in MariaDB
======
In our earlier tutorials,we have already learned [**to install & configure MariaDB**][1] & also [**learned some basic administration commands for managing MariaDB**][2]. We are now going to learn to setup a MASTER SLAVE replication for MariaDB server.

Replication is used to create multiple copies of our database & these copies then can either be used as another database to run our queries on, queries that might otherwise affect performance of master server like running some heavy analytics queries or we can just use them for data redundancy purposes or for both. We can automate the whole process i.e. data replication occurs automatically from master to slave. Backups are be done without affecting the write operations of the master

So we will now setup our **master-slave** replication, for this we need two machines with Mariadb installed. IP addresses for the both the machines are mentioned below,

 **Master -** 192.168.1.120 **Hostname-** master.ltechlab.com

 **Slave -** 192.168.1.130 **Hostname -** slave.ltechlab.com

Once MariaDB has been installed in those machines, we will move on with the tutorial. If you need help installing and configuring maridb, have a[ **look at our tutorial HERE.**][1]


### **Step 1- Master Server Configuration**

We are going to take a database named ' **important '** in MariaDB, that will be replicated to our slave server. To start the process, we will edit the files ' **/etc/my.cnf** ' , it's the configuration file for mariadb,

```
$ vi /etc/my.cnf
```

& look for section with [mysqld] & then enter the following details,

```
[mysqld]
log-bin
server_id=1
replicate-do-db=important
bind-address=192.168.1.120
```

Save & exit the file. Once done, restart the mariadb services,

```
$ systemctl restart mariadb
```

Next, we will login to our mariadb instance on master server,

```
$ mysql -u root -p
```

& then will create a new user for slave named 'slaveuser' & assign it necessary privileges by running the following command

```
STOP SLAVE;
GRANT REPLICATION SLAVE ON *.* TO  'slaveuser'@'%' IDENTIFIED BY 'iamslave';
FLUSH PRIVILEGES;
FLUSH TABLES WITH READ LOCK;
SHOW MASTER STATUS;
```

**Note:- ** We need values from **MASTER_LOG_FILE and MASTER_LOG_POS ** from out of 'show master status' for configuring replication, so make sure that you have those.

Once these commands run successfully, exit from the session by typing 'exit'.

### Step2 - Create a backup of the database & move it slave

Now we need to create backup of our database 'important' , which can be done using 'mysqldump' command,

```
$ mysqldump -u root -p important > important_backup.sql
```

Once the backup is complete, we need to log back into the mariadb & unlock our tables,

```
$ mysql -u root -p
$ UNLOCK TABLES;
```

& exit the session. Now we will move the database backup to our slave server which has a IPaddress of 192.168.1.130,

This completes our configuration on Master server, we will now move onto configuring our slave server.

### Step 3 Configuring Slave server

We will again start with editing '/etc/my.cnf' file & look for section [mysqld] & enter the following details,

```
[mysqld]
server-id = 2
replicate-do-db=important
[ …]
```

We will now restore our database to mariadb, by running

```
$ mysql -u root -p < /data/ important_backup.sql
```

When the process completes, we will provide the privileges to 'slaveuser' on db 'important' by logging into mariadb on slave server,

```
$ mysql -u root -p
```

```
GRANT ALL PRIVILEGES ON important.* TO 'slaveuser'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
```

Next restart mariadb for implementing the changes.

```
$ systemctl restart mariadb
```

### **Step 4 Start the replication**

Remember, we need **MASTER_LOG_FILE and MASTER_LOG_POS** variables which we got from running  'SHOW MASTER STATUS' on mariadb on master server. Now login to mariadb on slave server & we will tell our slave server where to look for the master by running the following commands,

```
STOP SLAVE;
CHANGE MASTER TO MASTER_HOST= '192.168.1.110′, MASTER_USER='slaveuser', MASTER_PASSWORD='iamslave', MASTER_LOG_FILE='mariadb-bin.000001′, MASTER_LOG_POS=460;
SLAVE START;
SHOW SLAVE STATUS\G;
```

**Note:-** Change details of your master as necessary.

### Step 5 Testing the replication

We will now create a new tables in our database on master to make sure if the replication is working or not. So, login to mariadb on master server,

```
$ mysql -u root -p
```

select the database 'important',

```
use important;
```

and create a table named test in the db,

```
create table test (c int);
```

then insert some value into it,

```
insert into test (c) value (1);
```

To check the added value,

```
select * from test;
```

& you will find that your db has a table has the value you inserted.

Now let's login to our slave database to make sure if our data replication is working,

```
$ mysql -u root -p
$ use important;
$ select * from test;
```

You will see that the output shows the same value that we inserted on the master server, hence our replication is working fine without any issues.

This concludes our tutorial, please send your queries/questions through the comment box below.


--------------------------------------------------------------------------------

via: http://linuxtechlab.com/creating-master-slave-replication-mariadb/

作者：[Shusain][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxtechlab.com/author/shsuain/
[1]:http://linuxtechlab.com/installing-configuring-mariadb-rhelcentos/
[2]:http://linuxtechlab.com/mariadb-administration-commands-beginners/
