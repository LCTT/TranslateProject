[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (7 enlightening talks from All Things Open 2020)
[#]: via: (https://opensource.com/article/21/1/ato-2020)
[#]: author: (Joshua Allen Holm https://opensource.com/users/holmja)

7 enlightening talks from All Things Open 2020
======
There are more than 250 videos available to watch from the All Things
Open conference; here are some ideas on where to begin.
![Tips and gears turning][1]

[All Things Open][2], a technology conference held in October every year, is always a wonderful learning experience. For 2020, the conference shifted to an online format, which had its ups and downs. The chance encounters with acquaintances in the hallways and having lunch with friends were noticeably absent, but the learning experience was as good as always. Honestly, in some ways, it was better because everyone got a front-row seat, and there were no standing-room-only talks.

One major advantage of the online format was that all of the talks were recorded, so people who missed the conference can watch the hundreds of talks available in an [All Things Open 2020 playlist][3] on YouTube.

Hundreds of talks is a lot, so to provide some suggestions of where to start, I'll briefly cover seven of the talks I attended. I also attended an excellent talk by Opensource.com's Jen Wike Huger about how to write an article, but I will let her explain her talk [in her own words][4].

The talks I attended made for an informative and jam-packed two-day conference experience but are only a tiny fraction of what All Things Open 2020 offered. I hope you will take the opportunity to watch some of the talks below and explore the conference's offerings for other talks that interest you.

If you watched another talk that really interested you, please share it in a comment so that others can benefit from your recommendation.

## [MySQL indexes, histograms, locking options, and other ways to speed up your queries][5]

This extended, 90-minute talk by Dave Stokes explores the "very dry" (his words) parts of working with [MySQL][6] databases. Everyone notices when the database runs too slow, but nobody complains when the database is too fast. Stokes explains how to use indexes, histograms, locking options, and other methods to improve the performance of queries in a MySQL database.

As Stokes notes in his introduction, this talk covers a lot of information, so being able to pause, rewind, and rewatch is very helpful. However, it is also worth noting that Stokes assumes that the person watching the talk has a good level of experience with MySQL and databases in general. As such, he did not cover basic optimizations like normalizing data nor lower-level system-configuration optimizations at the operating system level. Intentional limits aside, this talk is still very, very deep. If you are interested in database optimization, you will probably want to watch this talk a few times.

## [Containers in depth—understanding how containers work to better work with them][7]

If you work with Linux containers and know your way around [Docker][8] and similar tools but do not yet have a deep understanding of what is going on beneath the surface, Brent Laster's in-depth talk about how containers work is the talk for you. It covers what containers are and their benefits; how containers are constructed; the differences between layers, images, and containers; what immutability really means; the core Linux functionalities that containers are based on; and more. This talk covers a lot in only 43 minutes but provides a detailed, technical overview of each topic.

Separately, Laster presented a much longer, more detailed talk about containers that stretches over four sessions. This three-and-half hour extended session, [All things containers—Docker, Kubernetes, Helm, Istio, GitOps, and more][9], is worth watching if you want to explore containers by following a hands-on tutorial.

## [Why Postgres][10]

How does [PostgreSQL][11], a database project with a history dating to 1989, stack up to newer competitors? Craig Kerstiens provides an answer to that question in his talk covering the history and current features of PostgreSQL.

Kerstiens covers datatypes, indexing, extensions, foreign data wrappers, and more in his succinct yet thorough overview of what PostgresSQL has to offer. He explains how PostgreSQL added support for JSON and discusses several other supported datatypes, including "money," which dates back to when the "world was flat." It is fascinating and refreshing to see newer features described alongside honest critiques of legacy features. He also explains full-text search support, the PostGIS extension for providing geospatial database support, and other interesting advanced features.

I have used PostgreSQL a lot over the years, but I still learned many new things by watching this talk. Most of my database work with PostgreSQL has been very conservative, fairly basic SQL database kinds of things, so I really look forward to trying out some of the things I learned about in this talk.

## [Dungeons, dragons, and graph databases][12]

Using one niche thing to explain another niche thing can either go horribly wrong or be absolutely brilliant. If you have even a passing familiarity with [Dungeons &amp; Dragons][13] and want to learn about graph databases, specifically [RedisGraph][14], Guy Royse's talk is in the brilliant category. Royse's method of using a dungeon crawl to relay the advantages of a graph database is a great way to describe the key concepts.

Royse starts by explaining what a graph is in this context by using a 20-sided die as an example; a graph is made of vertices and edges, with the vertices being the points where the sides of the die meet and the edges being the lines connecting the points. The talk then uses the concepts of finding all the loot and slaying all the monsters in a dungeon as examples to explain a variety of features. To further explain the advantages of using graph databases, Royse provides examples of how a traditional SQL database might structure the same queries.

Although this talk is super-niche, it was extremely fun. It will not be for everyone, but it makes learning about graph databases easy if you are familiar with the subject matter used in the examples. Even if you are not into Dungeons &amp; Dragons (or similar role-playing games), the examples are clear enough but might not resonate with you as much as other examples might.

## [Understanding MySQL concepts][15]

This talk by Matthias Crauwels covers the features of [MySQL 8.0, Community Server Edition][16] and some of the differences between MySQL, [MariaDB][17], and the [Percona Distribution for MySQL][18]. Unfortunately, in the video, the 45-minute session is reduced to a 25-minute video and skips from Crauwels saying hello all the way to slide 21. The portions of the talk in the video cover MyISAM vs. InnoDB storage engines, other storage engines, replication, binary logs, and global transaction IDs.

Some of the differences between MySQL and MariaDB that are discussed are how MySQL does not support PL/SQL while MariaDB understands a subset of PL/SQL and how MySQL and MariaDB have different implementations for global transaction IDs.

## [Digitizing 125 years of images][19]

[The New York Times][20] has an archive of photographs that covers 125 years. To say its archival collection is huge would be an understatement. In this talk, Suman Roy and William P. Davis discuss the work involved in digitizing that collection to make it more accessible.

The physical photo archives at The New York Times are organized using traditional archival organizational methods, which are similar to, but not exactly like, the card catalogs that used to be found in libraries. This makes finding things in the archives a time-consuming experience. By moving the collection into the digital realm, the collection becomes easier and quicker to use.

Roy and Davis cover many of the technical issues involved in the digitization process. Most notably, they describe various scanning and optical character recognition (OCR) issues. While most people will never need to digitize a collection anywhere near the size of The New York Times' archive, the insights the speakers share apply to digitization projects of any size.

## [Building streaming data apps with Pac-Man][21]

Ricardo Ferreira brings some much-needed interactivity to this year's online All Things Open with his demonstration of [ksqlDB][22], a streaming database for [Apache Kafka][23], using an online [Pac-Man][24] game. During the talk, he had the audience play Pac-Man, showed how the information from our games was being tracked, and used that data to construct an online leaderboard for the game while we watched. Sadly, watching the video will not have the same effect, and the Pac-Man game linked in the talk is no longer online, but this talk is still a very interesting and informative way to explain streaming databases.

* * *

_All Things Open's next scheduled event is [Open Source 101][25], March 20, 2021, in Austin, Texas. Click the link to learn more about this one-day educational conference covering the processes and tools foundational to open source, open tech, and the open web._

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/ato-2020

作者：[Joshua Allen Holm][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/holmja
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/gears_devops_learn_troubleshooting_lightbulb_tips_520.png?itok=HcN38NOk (Tips and gears turning)
[2]: https://allthingsopen.org
[3]: https://www.youtube.com/playlist?list=PL6kQg8bP1Ji7xCxUtnto4e6vtFiB33bUq
[4]: https://opensource.com/article/20/11/how-write-article
[5]: https://www.youtube.com/watch?v=zhg1b8IKWzw
[6]: https://www.mysql.com/
[7]: https://www.youtube.com/watch?v=6yycoCmx9Hc
[8]: https://opensource.com/resources/what-docker
[9]: https://www.youtube.com/watch?v=_9ppmg9NF80
[10]: https://www.youtube.com/watch?v=C5hd8HyC0YI
[11]: https://www.postgresql.org/
[12]: https://www.youtube.com/watch?v=X59DEx-4i74
[13]: https://dnd.wizards.com/
[14]: https://github.com/RedisGraph/RedisGraph
[15]: https://www.youtube.com/watch?v=yZMP2sk8qKI
[16]: https://dev.mysql.com/downloads/mysql/
[17]: https://mariadb.org/
[18]: https://www.percona.com/software/mysql-database
[19]: https://www.youtube.com/watch?v=Qxv7ADhE4m0
[20]: https://www.nytimes.com/
[21]: https://www.youtube.com/watch?v=bYn0VLWpWJM
[22]: https://ksqldb.io/
[23]: https://kafka.apache.org/
[24]: https://en.wikipedia.org/wiki/Pac-Man
[25]: https://opensource101.com/
