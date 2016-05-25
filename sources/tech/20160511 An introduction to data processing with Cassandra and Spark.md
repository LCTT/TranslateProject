Translating KevinSJ
An introduction to data processing with Cassandra and Spark
==============================================================

![](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/osdc_520x292_opendata_0613mm.png?itok=mzC0Tb28)


There's been a huge surge of interest around the Apache Cassandra database due to the increasing uptime and performance demands of modern cloud applications.

So, what is Apache Cassandra? A distributed OLTP database built for high availability and linear scalability. When people ask what Cassandra is used for, think about the type of system you want close to the customer. This is ultimately the system that our users interact with. Applications that must always be available: product catalogs, IoT, medical systems, and mobile applications. In these categories downtime can mean loss of revenue or even more dire outcomes depending on your specific use case. Netflix was one of the earliest adopters of this project, which was open sourced in 2008, and their contributions, along with successes, put it on the radar of the masses.

Cassandra became a top level Apache Software Foundation project in 2010 and has been riding the wave in popularity since then. Now even knowledge in Cassandra gets you serious returns in the job market. It's both crazy and awesome to consider a NoSQL and open source technology could perform this sort of disruption next to the giants of enterprise SQL. This begs the question, what makes it so popular?

Cassandra has the ability to be always on in spite of massive hardware and network failures by utilizing a design first widely discussed in [the Dynamo paper from Amazon][1]. By using a peer to peer model, with no single point of failure, we can survive rack failure and even complete network partitions. We can deal with an entire data center failure without impacting our customer's experience. A distributed system that plans for failure is a properly planned distributed system, because frankly, failures are just going to happen. With Cassandra, we accept that cruel fact of life, and bake it into the database's architecture and functionality.

We know what you’re thinking, "But, I’m coming from a relational background, isn't this going to be a daunting transition?" The answer is somewhat yes and no. Data modeling with Cassandra will feel familiar to developers coming from the relational world. We use tables to model our data, and CQL, the Cassandra Query Language, to query the database. However, unlike SQL, Cassandra supports more complex data structures such as nested and user defined types. For instance, instead of creating a dedicated table to store likes on a cat photo, we can store that data in a collection with the photo itself enabling faster, sequential lookups. That's expressed very naturally in CQL. In our photo table we may want to track the name, URL, and the people that liked the photo.

![](https://opensource.com/sites/default/files/resize/screen_shot_2016-05-06_at_7.17.33_am-350x198.png)

In a high performance system milliseconds matter for both user experience and for customer retention. Expensive JOIN operations limit our ability to scale out by adding unpredictable network calls. By denormalizing our data so it can be fetched in as few requests as possible, we profit from the trend of decreasing costs in disk space and in return get predictable, high performance applications. We embrace the concept of denormalization with Cassandra because it offers a pretty appealing tradeoff.

We're obviously not just limited to storing likes on cat photos. Cassandra is a optimized for high write throughput. This makes it the perfect solution for big data applications where we’re constantly ingesting data. Time series and IoT use cases are growing at a steady rate in both demand and appearance in the market, and we're continuously finding ways to utilize the data we collect to improve our technological application.

This brings us to the next step, we've talked about storing our data in a modern, cost-effective fashion, but how do we get even more horsepower? Meaning, once we've collected all that data, what do we do with it? How can we analyze hundreds of terabytes efficiently? How can we react to information we're receiving in real-time, making decisions in seconds rather than hours? Enter Apache Spark.

Spark is the next step in the evolution of big data processing. Hadoop and MapReduce were revolutionary projects, giving the big data world an opportunity to crunch all the data we've collected. Spark takes our big data analysis to the next level by drastically improving performance and massively decreasing code complexity. Through Spark, we can perform massive batch processing calculations, react quickly to stream processing, make smart decisions through machine learning, and understand complex, recursive relationships through graph traversals. It’s not just about offering your customers a fast and reliable connection to their application (which is what Cassandra offers), it's also about being able to leverage insights from the data Cassandra stores to make more intelligent business decisions and better cater to customer needs.

You can check out the [Spark-Cassandra Connector][2] (open source) and give it a shot. To learn more about both technologies, we highly recommend the free self-paced courses on [DataStax Academy][3].

Have fun digging in and learning some killer new technology! If you want to learn more, check out our [OSCON tutorial][4], with a hands on exploration into the worlds of both Cassandra and Spark.

We also love taking questions on Twitter, so give us a shout and we’ll try to help: [Dani][5] and [Jon][6].

--------------------------------------------------------------------------------

via: https://opensource.com/life/16/5/basics-cassandra-and-spark-data-processing

作者：[Jon Haddad][a],[Dani Traphagen][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://twitter.com/rustyrazorblade
[b]: https://opensource.com/users/dtrapezoid
[1]: http://www.allthingsdistributed.com/files/amazon-dynamo-sosp2007.pdf
[2]: https://github.com/datastax/spark-cassandra-connector
[3]: https://academy.datastax.com/
[4]: http://conferences.oreilly.com/oscon/open-source-us/public/schedule/detail/49162
[5]: https://twitter.com/dtrapezoid
[6]: https://twitter.com/rustyrazorblade
