What I learnt from building 3 high traffic web applications on an embedded key value store.
============================================================


![](https://cdn-images-1.medium.com/max/1600/1*_sXlAxit3i2M-FFaK_OQVg.png)

I grew up as part of the fad that all web applications must be built on proper architecture, usually involving a well tested and stable sql database like postgres, or in some stretch cases a nosql database like mongodb. The reasons were simple:

*   They can be scaled and scaled and scaled. Very important when your application gets it’s first one billion users overnight.

*   SQL is the best way to access your data. And you always need a complicated message layer to access that data.

*   If you don’t use sql, how will you perform joins? How will you build in complicated search? How will you prevent your code from going so large with complexity that it falls and kills your cat?


![](https://cdn-images-1.medium.com/max/1600/1*UZfVU70VqwzFbbp50mRarQ.png)
Your cat is scared of your code.

*   Why build an application where you won’t need to employ an experienced database administrator to create your complicated schemas and perform the very important and complicated database maintenance tasks.

In 2015, I stumbled on the golang [BoltDB database library][1], and first used to save state in basic server-side applications. Then I stumbled on [blevesearch][2], and it dawned on me. The most basic thing most databases offer is storage, and flexible search over stored data. With boltdb, I could store my data efficiently, and with bleve I could search and access my data in interesting ways.

![](https://cdn-images-1.medium.com/max/1600/1*CAgNR4s10WtvV4CG9AFFQg.png)
blevesearch

On this basis, I built and launched [Calabar Yellow Pages][3] on just boltDB and blevesearch, and then when I saw how smoothly it worked and scaled in production, I went on to build [Shop440][4] (A merge between Shopify and Aliexpress) on badger DB (A much faster alternative to boltdb) and blevesearch for indexing.

### What I learnt:

### Key Value Stores are fast

Firstly, a NoSQL key value store is fast, much faster than a comparable relational database. Its speed comes from its simplicity. A key value database stores a data record using one primary key. The key means the record is uniquely identifiable, and can be directly accessed. Other than this, it’s up to the developer to architect any more complexity in accessing data.


![](https://cdn-images-1.medium.com/max/1600/1*zTzSNjtU-kudy78iZss1vw.png)

Also, since the key value stores I used were embedded databases, I was able to strike off some of the processing that comes with more established databases. In a database like mongoDB, A lot of resources and latency goes into serializing data and passing it over the wire to the client application which then deserializes and decodes it. This is a waste of resources, especially when the client and the database are running on the same server, and not on separate servers where they would benefit from communicating over http. An embedded database strikes out all these extra serialization and even tcp transport costs.

### Great Scalability — What About Consistency?

Secondly, a NoSQL key value database is also highly scalable. This too is a function of its simplicity. Unlike a relational database, a NoSQL key value database is not obliged to scale vertically. It can scale over several machines or devices by several orders of magnitude, without the need for significant redesign. Financially, this is a big advantage too.

![](https://cdn-images-1.medium.com/max/1600/1*seBbyRHICKfN87y7zq8I4A.png)

But in my case, since using an embedded key value store, most scaling happened vertically and even sustained for a very long time. At the moment, even with a database size of almost a terabyte, the application is still holding strong. With badger, I came up with a strategy of having multiple badger databases, each representing a collection. This way, if I ever have a need to scale the system beyond a single server, I could isolate each individual database and it’s corresponding program logic into a separate micro-service. (I will write more about this in the future. )

### Cheap on time and effort


![](https://cdn-images-1.medium.com/max/1600/1*U-XNO_Q3wVffyYxpEVpfvA.png)

Scaling a relational database solution often means that cost increases dis-proportionally; it also requires time and effort (and server downtime) to change your database schema. By comparison, a key value database keeps the price curve linear rather than exponential, and it is designed to handle data without any predefined schema. Some (not all) key value databases, like other NoSQL databases, are also designed for ‘eventual consistency’. This means that data are synchronized ‘at some point’ between copies on different machines, but not immediately.

### Schema-Free Rows and Columns

![](https://cdn-images-1.medium.com/max/1600/1*57qoZRSyu6H4zQHs8p3qJQ.png)

### A case for Embedded Key Value Stores

According to [https://www.sqlite.org/whentouse.html][5]

> SQLite works great as the database engine for most low to medium traffic websites (which is to say, most websites). The amount of web traffic that SQLite can handle depends on how heavily the website uses its database. Generally speaking, any site that gets fewer than 100K hits/day should work fine with SQLite. The 100K hits/day figure is a conservative estimate, not a hard upper bound. SQLite has been demonstrated to work with 10 times that amount of traffic.

> The SQLite website ([https://www.sqlite.org/][6]) uses SQLite itself, of course, and as of this writing (2015) it handles about 400K to 500K HTTP requests per day, about 15–20% of which are dynamic pages touching the database. Dynamic content uses [about 200 SQL statements per webpage][7]. This setup runs on a single VM that shares a physical server with 23 others and yet still keeps the load average below 0.1 most of the time.

Most embedded key value stores like badger are very very much more efficient and performant than sqlite, so this could go to show how much more is possible with embedded key value stores, if sqlite can handle so much hits per day.

Also, using an embedded key value store alongside an embedded indexing engine like Blevesearch in a compiled language like Golang, means you can truly deploy single binaries with no external dependencies and no need for post deployment setups.

### In a nutshell

Embedded key value stores give you all the advantages of a nosql database, but where it is lacking is in search, since you’re only able to query for items by their keys and key’s prefix. But when paired with an indexing engine like blevesearch in golang, or elasicsearch and lucene, the pair gives you a very capable database with features like full text search, location based search, etc in a very resource efficient package and scales well.

I believe this pair should have more popularity than it actually currently has, and go a long in reducing server expenses especially with applications which never expect facebook level scale.

--------------------------------------------------------------------------------

via: https://hackernoon.com/what-i-learnt-from-building-3-high-traffic-web-applications-on-an-embedded-key-value-store-68d47249774f

作者：[Anthony Alaribe ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://hackernoon.com/@tonyalaribe?source=post_header_lockup
[1]:https://github.com/boltdb/bolt
[2]:https://github.com/blevesearch/bleve
[3]:http://calabarpages.com/
[4]:https://shop440.com/
[5]:https://www.sqlite.org/whentouse.html
[6]:https://www.sqlite.org/
[7]:https://www.sqlite.org/np1queryprob.html
