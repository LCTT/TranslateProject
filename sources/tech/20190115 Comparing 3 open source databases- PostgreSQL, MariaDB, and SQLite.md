[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Comparing 3 open source databases: PostgreSQL, MariaDB, and SQLite)
[#]: via: (https://opensource.com/article/19/1/open-source-databases)
[#]: author: (Sam Bocetta https://opensource.com/users/sambocetta)

Comparing 3 open source databases: PostgreSQL, MariaDB, and SQLite
======
Find out how to choose the best open source database for your needs.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_container_block.png?itok=S8MbXEYw)

In the world of modern enterprise technologies, open source software has firmly established itself as one of the biggest forces to reckon with. After all, some of the biggest technology developments have emerged because of the [open source movement][1].

It's not difficult to see why: even though Linux-based open source network standards may not be as popular as proprietary options, they are the reason smart devices from different manufacturers can communicate with each other. In addition, many argue that open source development produces applications that are superior to their proprietary counterparts. This is one reason why the chances are good that your favorite tools (whether open source or proprietary) were developed using open source databases.

Like any other category of software, the functionality and features of open source database management systems can differ quite significantly. To put that in plainer terms, [not all open source database management systems are equal][2]. If you are choosing an open source database for your organization, it's important to choose one that is user-friendly, can grow with your organization, and offers more-than-adequate security features.

With that in mind, we've compiled this overview of open source databases and their respective advantages and disadvantages. Sadly, we had to leave out some of the most used databases. Notably, MongoDB has recently changed its licensing model, so it is no longer truly open source. This decision probably made sense from a business perspective, since MongoDB has become the de facto solution for database hosting [with nearly 27,000 companies][3] using it, but it also means MongoDB can no longer be considered a truly open source system.

In addition, since it acquired MySQL, Oracle has all but killed the open source nature of that project, which was arguably the go-to open source database for decades. However, this has opened space for other truly open source database solutions to challenge it. Here are three of them to consider.

### PostgreSQL

No list of open source databases would be complete without [PostgreSQL][4], which has long been the preferred solution for businesses of all sizes. Oracle's acquisition of MySQL might have made good business sense at the time, but the rise of cloud storage has meant that the database [has gradually fallen out of favor with developers][5].

Although PostgreSQL has been around for a while, the relative [decline of MySQL][6] has made it a serious contender for the title of most used open source database. Since it works very similarly to MySQL, developers who prefer open source software are converting in droves.

#### Advantages

  * By far, PostgreSQL's most mentioned advantage is the efficiency of its central algorithm, which means it outperforms many databases that are advertised as more advanced. This is especially useful if you are working with large datasets, for which I/O processes can otherwise become a bottleneck.

  * It is also one of the most flexible open source databases around; you can write functions in a wide range of server-side languages: Python, Perl, Java, Ruby, C, and R.

  * As one of the most commonly used open source databases, PostgreSQL's community support is some of the best around.




#### Disadvantages

  * PostgreSQL's efficiency with large datasets is well known, but there are quicker tools available for smaller databases.

  * While its community support is very good, PostgreSQL's core documentation could be improved.

  * If you are used to advanced tools like parallelization and clustering, be aware that these require third-party plugins in PostgreSQL. There are plans to gradually add these features to the main release, but it will likely be a few years before they are offered as standard.




### MariaDB

[MariaDB][7] is a truly open source distribution of MySQL (released under the [GNU GPLv2][8]). It was [created after Oracle's acquisition][9] of MySQL, when some of MySQL's core developers were concerned that Oracle would undermine its open source philosophy.

MariaDB was developed to be as compatible with MySQL as possible while replacing several key components. It uses a storage engine, Aria, that functions as both a transactional and non-transactional engine. [Some even speculated][10] Aria would become the standard engine for MySQL in future releases, before MariaDB diverged.

#### Advantages

  * Many users choose MariaDB over MySQL due to MariaDB's [frequent security releases][11]. While this does not necessarily mean MariaDB is more secure, it does indicate the development community takes security seriously.

  * Others say MariaDB's major advantages are that it will almost definitely remain open source and highly compatible with MySQL. This means migrating from one system to the other is extremely fast.

  * Because of this compatibility, MariaDB also plays well with many other languages that are commonly used with MySQL. This means less time is spent learning and debugging code.

  * You can [install and run][12] WordPress with MariaDB instead of MySQL for better performance and a richer feature set. WordPress is the [most popular CMS by marketshare][13]—powering nearly half the internet—and has an active open source developer community. Third-party themes and plugins work as intended when WordPress is installed with MariaDB.




#### Disadvantages

  * MariaDB is somewhat liable to bloating. Its central IDX log file, in particular, tends to become very large after protracted use, ultimately slowing performance.

  * Caching is another area where MariaDB could use work—it is not as fast as it could be, which can be frustrating.

  * Despite all the initial promises, MariaDB is no longer completely compatible with MySQL. If you are migrating from MySQL, you will have some re-coding to do.




### SQLite

[SQLite][14] is arguably the most implemented database engine in the world, thanks to its adoption by many popular web browsers, operating systems, and mobile phones. Originally developed as a lightweight fork of MySQL, unlike many other databases it is not a client-server engine; rather, the full software is embedded into each implementation.

This creates SQLite's major advantage: on embedded or distributed systems, each machine carries an entire implementation of the database. This can greatly speed up the performance of databases because it reduces the need for inter-system calls.

#### Advantages

  * If you are looking to build and implement a small database, SQLite is [arguably the best way to go][15]. It is extremely small, so it can be implemented across a wide range of embedded systems without time-consuming workarounds.

  * Its small size makes the system extremely fast. While some more advanced databases use complex ways of producing efficiency savings, SQLite takes a much simpler approach: By reducing the size of your database and its associated processing software, there is simply less data to work with.

  * Its widespread adoption also means SQLite is probably the most compatible database out there. This is particularly important if you need or plan to integrate your system with smartphones: the system has been native on iOS for as long as there have been third-party apps and works flawlessly in a wide range of environments.




#### Disadvantages

  * SQLite's tiny size means it lacks some features found in larger databases. It lacks built-in data encryption, for example, something that has become standard to prevent the [most common online hacker attacks][16].

  * While the wide adoption and publicly available code makes SQLite easy to work with, it also increases its attack surface area. This is its most commonly cited disadvantage. New critical vulnerabilities are frequently discovered in SQLite, such as the recent remote attack vector called [Magellan][17].

  * Although SQLite's single-file approach creates speed advantages, there is no easy way to implement a multi-user environment using the system.




### Which open source database is best?

Ultimately, your choice of open source database will depend on your business needs and particularly on the size of your system. For small databases or those with limited use, go for a lightweight solution: not only will it speed up implementation but a less-complex system means you will spend less time debugging.

For larger systems, especially in growing businesses, invest the time to implement a more complex database like PostgreSQL. This will save you time—eventually—by removing the need to re-code your databases as your business grows.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/open-source-databases

作者：[Sam Bocetta][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sambocetta
[b]: https://github.com/lujun9972
[1]: https://opensource.com/article/18/2/pivotal-moments-history-open-source
[2]: https://blog.capterra.com/free-database-software/
[3]: https://idatalabs.com/tech/products/mongodb
[4]: https://www.postgresql.org/
[5]: https://www.theregister.co.uk/2018/05/31/rise_of_the_open_source_data_strategies/
[6]: https://www.itworld.com/article/2721995/big-data/signs-of-mysql-decline-on-horizon.html
[7]: https://mariadb.org/
[8]: https://github.com/MariaDB/server/blob/10.4/COPYING
[9]: https://mariadb.com/about-us/
[10]: http://kb.askmonty.org/en/aria-faq
[11]: https://mariadb.org/tag/security/
[12]: https://mariadb.com/resources/blog/how-to-install-and-run-wordpress-with-mariadb/
[13]: https://websitesetup.org/popular-cms/
[14]: https://www.sqlite.org/index.html
[15]: https://www.sqlite.org/aff_short.html
[16]: https://hostingcanada.org/most-common-website-vulnerabilities/
[17]: https://www.securitynewspaper.com/2018/12/18/critical-vulnerability-in-sqlite-you-should-update-now/
