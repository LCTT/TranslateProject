Tuning MySQL: 3 Simple Tweaks
============================================================

If you don’t change the default MySQL configuration, your server is going to perform like a Ferrari that’s stuck in first gear…


![](https://cdn-images-1.medium.com/max/1000/1*b7M28XbrOc4FF3tJP-vvyg.png)

I don’t claim to be an expert DBA, but I am a strong proponent of the 80/20 principle and when it comes to tuning MySQL, it’s fair to say you can squeeze 80% of the juice by making a few simple adjustments to your configuration. Useful, especially when server resources are getting cheaper all the time.

#### Health warnings:

1.  No two databases or applications are the same. This is written with the ‘typical’ website owner in mind, where fast queries, a nice user experience and being able to handle lots of traffic are your priorities.

2.  Back up your database before you do this!

### 1\. Use the InnoDB storage engine

If you’re using the MyISAM storage engine, then it’s time to move to InnoDB. There are many reasons why it’s superior, but if performance is what you’re after, it comes down to how each utilises physical memory:

*   MyISAM: Only stores indexes in memory.

*   InnoDB: Stores indexes  _and_  data in memory.

Bottom line: stuff stored in memory is accessible much faster than stuff stored on the disk.

Here’s how you convert your tables:

```
ALTER TABLE table_name ENGINE=InnoDB;
```

 _Note:_  _ You have created all of the appropriate indexes, right? That should always be your first priority for better performance._ 

### 2\. Let InnoDB use all that memory

You can edit your MySQL configuration in your  _my.cnf_  file. The amount of memory that InnoDB is allowed to use on your server is configured with the innodb_buffer_pool_size parameter.

The accepted ‘rule of thumb’ for this (for servers  _only_  tasked with running MySQL) is to set this to 80% of your server’s physical memory. You want to maximise the use of the RAM, but leave enough for the OS to run without it needing to utilise the swap.

So, if your server has 32GB memory, set it to ~ 25GB.

```
innodb_buffer_pool_size = 25600M
```

 _Notes:_  _ (1) If your server is small and this number comes in less than 1GB, you ought to upgrade to a box with more memory for the rest of this article to be applicable. (2) If you have a huge server, eg. 200gb memory, then use common sense — you don’t need to leave 40gb free memory for the OS._ 

### 3\. Let InnoDB multitask

For servers where  _innodb_buffer_pool_size_  is greater than 1GB,  _innodb_buffer_pool_instances _ divides the InnoDB buffer pool into this many instances.

The benefit to having more than 1 buffer pool is:

> You might encounter bottlenecks from multiple threads trying to access the buffer pool at once. You can enable multiple buffer pools to minimize this contention.

The official recommendation for the number of buffers is:

> For best efficiency, specify a combination of innodb_buffer_pool_instances and innodb_buffer_pool_size so that each buffer pool instance is at least 1 gigabyte.

So in our example of a 32GB server with a 25GB  _innodb_buffer_pool_size,_  a suitable solution might be 25600M / 24 = 1.06GB

```
innodb_buffer_pool_instances = 24
```

### Don’t forget!

After making changes to  _my.cnf _ you’ll need to restart MySQL:

```
sudo service mysql restart
```

* * *

There are far more scientific ways to optimise these parameters, but using this as a general guide will get you a long way towards a better performing MySQL server.

--------------------------------------------------------------------------------

作者简介:

I like tech businesses & fast cars | Group CTO @ Parcel Monkey, Cloud Fulfilment & Kong.


------

via: https://medium.com/@richb_/tuning-mysql-3-simple-tweaks-6356768f9b90

作者：[Rich Barrett][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://medium.com/@richb_