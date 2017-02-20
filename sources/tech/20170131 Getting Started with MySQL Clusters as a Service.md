beyondword translating

Getting Started with MySQL Clusters as a Service
============================================================

[MySQL Cluster.me][1] starts offering **MySQL Clusters** and **MariaDB Clusters** as a service based on **Galera Replication** technology.

In this article we will go through the main features of a **MySQL** and **MariaDB** clusters as a service.

[
 ![MySQL Clusters as a Service](http://www.tecmint.com/wp-content/uploads/2017/01/MySQL-Clusters-Service.png) 
][2]

MySQL Clusters as a Service

### What is a MySQL Cluster?

If you have ever wondered how you can increase the reliability and scalability of your MySQL database you might have found that one of the ways to do that is through a **MySQL Cluster** based on **Galera Cluster** technology.

This technology allows you to have a complete copy of the MySQL database synchronized across many servers in one or several datacenters. This lets you achieve high database availability – which means that if `1` or more of your database servers crash then you will still have a fully operational database on another server.

It is important to note that the minimum number of servers in a **MySQL Cluster** is `3` because when one server recovers from a crash it needs to copy data from one of the remaining two servers making one of them a “**donor**“. So in case of crash recovery you must have at least two online servers from which the crashed server can recover the data.

Also, a [MariaDB cluster][3] is essentially the same thing as MySQL cluster just based on a newer and more optimized version on MySQL.

[
 ![MySQL Clusters Galera Replications](http://www.tecmint.com/wp-content/uploads/2017/01/MySQL-Clusters-Galera-Replications.png) 
][4]

MySQL Clusters Galera Replications

### What is a MySQL Cluster and MariaDB Cluster as a Service?

**MySQL Clusters** as a service offer you a great way to achieve both requirements at the same time.

First, you get **High Database Availability** with a high probability of **100% Uptime** in case of any datacenter issues.

Secondly, outsourcing the tedious tasks associated with managing a mysql cluster let you focus on your business instead of spending time on cluster management.

In fact, managing a cluster on your own may require you to perform the following tasks:

1.  **Provision and setup the cluster** – may take you a few hours of an experienced database administrator to fully setup an operational cluster.
2.  **Monitor the cluster** – one of your techs must keep an eye on the cluster 24×7 because many issues can happen – cluster desynchronization, server crash, disk getting full etc.
3.  **Optimize and resize the cluster** – this can be a huge pain if you have a large database and you need to resize the cluster. This task needs to be handled with extra care.
4.  **Backups management** – you need to backup your cluster data to avoid it being lost if your cluster fails.
5.  **Issue resolution** – you need an experienced engineer who will be able to dedicate a lot of effort optimizing and solving issues with your cluster.

Instead, you can save a lot of time and money by going with a **MySQL Cluster** as a Service offered by **MySQLcluster.me** team.

###### So what’s included into MySQL Cluster as a Service offered by MySQLcluster.me?

Apart from high database availability with an almost guaranteed uptime of **100%**, you get the ability to:

1.  **Resize the MySQL Cluster at any time** – you can increase or decrease cluster resources to adjust for the spikes in your traffic (RAM, CPU, Disk).
2.  **Optimized Disks and Database Performance** – disks can achieve a rate of **100,000 IOPS** which is crucial for database operation.
3.  **Datacenter Choice** – you can decide in which datacenter you would like to host the cluster. Currently supported – Digital Ocean, Amazon AWS, RackSpace, Google Compute Engine.
4.  **24×7 Cluster Support** – if anything happens to your cluster our team will always assist you and even provide you advice on your cluster architecture.
5.  **Cluster Backups** – our team sets up backups for you so that your cluster is automatically backed up on a daily basis to a secure location.
6.  **Cluster Monitoring** – our team sets up automatic monitoring so in case of any issue our team starts working on your cluster even if you are away from your desk.

There are a lot of advantages of having your own **MySQL Cluster** but this must be done with care and experience.

Speak to [MySQL Cluster][5] team to find the best suitable package for you.

--------------------------------------------------------------------------------

作者简介：

I am Ravi Saive, creator of TecMint. A Computer Geek and Linux Guru who loves to share tricks and tips on Internet. Most Of My Servers runs on Open Source Platform called Linux. Follow Me: Twitter, Facebook and Google+

--------------------------------------------

via: http://www.tecmint.com/getting-started-with-mysql-clusters-as-a-service/

作者：[Ravi Saive][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/admin/
[1]:https://www.mysqlcluster.me/#utm_source=tecmintpost1&utm_campaign=tecmintpost1&utm_medium=tecmintpost1
[2]:http://www.tecmint.com/wp-content/uploads/2017/01/MySQL-Clusters-Service.png
[3]:https://www.mysqlcluster.me/#utm_source=tecmintpost1&utm_campaign=tecmintpost1&utm_medium=tecmintpost1
[4]:http://www.tecmint.com/wp-content/uploads/2017/01/MySQL-Clusters-Galera-Replications.png
[5]:https://www.mysqlcluster.me/#utm_source=tecmintpost1&utm_campaign=tecmintpost1&utm_medium=tecmintpost1
