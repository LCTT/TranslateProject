# A tour of Postgres Index Types

At Citus we spend a lot of time working with customers on data modeling, optimizing queries, and adding [indexes][3] to make things snappy. My goal is to be as available for our customers as we need to be, in order to make you successful. Part of that is keeping your Citus cluster well tuned and [performant][4] which [we take care][5]of for you. Another part is helping you with everything you need to know about Postgres and Citus. After all a healthy and performant database means a fast performing app and who wouldn’t want that. Today we’re going to condense some of the information we’ve shared directly with customers about Postgres indexes.

Postgres has a number of index types, and with each new release seems to come with another new index type. Each of these indexes can be useful, but which one to use depends on 1\. the data type and then sometimes 2\. the underlying data within the table, and 3\. the types of lookups performed. In what follows we’ll look at a quick survey of the index types available to you in Postgres and when you should leverage each. Before we dig in, here’s a quick glimpse of the indexes we’ll walk you through:

*   B-Tree

*   Generalized Inverted Index (GIN)

*   Generalized Inverted Seach Tree (GiST)

*   Space partitioned GiST (SP-GiST)

*   Block Range Indexes (BRIN)

*   Hash

Now onto the indexing

### In Postgres, a B-Tree index is what you most commonly want

If you have a degree in Computer Science, then a B-tree index was likely the first one you learned about. A [B-tree index][6] creates a tree that will keep itself balanced and even. When it goes to look something up based on that index it will traverse down the tree to find the key the tree is split on and then return you the data you’re looking for. Using an index is much faster than a sequential scan because it may only have to read a few [pages][7] as opposed to sequentially scanning thousands of them (when you’re returning only a few records).

If you run a standard `CREATE INDEX` it creates a B-tree for you. B-tree indexes are valuable on the most common data types such as text, numbers, and timestamps. If you’re just getting started indexing your database and aren’t leveraging too many advanced Postgres features within your database, using standard B-Tree indexes is likely the path you want to take.

### GIN indexes, for columns with multiple values

Generalized Inverted Indexes, commonly referred to as [GIN][8], are most useful when you have data types that contain multiple values in a single column.

From the Postgres docs:  _“GIN is designed for handling cases where the items to be indexed are composite values, and the queries to be handled by the index need to search for element values that appear within the composite items. For example, the items could be documents, and the queries could be searches for documents containing specific words.”_ 

The most common data types that fall into this bucket are:

*   [hStore][1]

*   Arrays

*   Range types

*   [JSONB][2]

One of the beautiful things about GIN indexes is that they are aware of the data within composite values. But because a GIN index has specific knowledge about the data structure support for each individual type needs to be added, as a result not all datatypes are supported.

### GiST indexes, for rows that overlap values

GiST indexes are most useful when you have data that can in some way overlap with the value of that same column but from another row. The best thing about GiST indexes: if you have say a geometry data type and you want to see if two polygons contained some point. In one case a specific point may be contained within box, while another point only exists within one polygon. The most common datatypes where you want to leverage GiST indexes are:

*   Geometry types

*   Text when dealing with full-text search

GiST indexes have some more fixed constraints around size, whereas GIN indexes can become quite large. As a result, GiST indexes are lossy. From the docs:  _“A GiST index is lossy, meaning that the index might produce false matches, and it is necessary to check the actual table row to eliminate such false matches. (PostgreSQL does this automatically when needed.)”_  This doesn’t mean you’ll get wrong results, it just means Postgres has to do a little extra work to filter those false positives before giving your data back to you.

 _Special note: GIN and GiST indexes can often be beneficial on the same column types. One can often boast better performance but larger disk footprint in the case of GIN and vice versa for GiST. When it comes to GIN vs. GiST there isn’t a perfect one size fits all, but the broad rules above apply_ 

### SP-GiST indexes, for larger data

Space partitioned GiST indexes leverage space partitioning trees that came out of some research from [Purdue][9]. SP-GiST indexes are most useful when your data has a natural clustering element to it, and is also not an equally balanced tree. A great example of this is phone numbers (at least US ones). They follow a format of:

*   3 digits for area code

*   3 digits for prefix (historically related to a phone carrier’s switch)

*   4 digits for line number

This means that you have some natural clustering around the first set of 3 digits, around the second set of 3 digits, then numbers may fan out in a more even distribution. But, with phone numbers some area codes have a much higher saturation than others. The result may be that the tree is very unbalanced. Because of that natural clustering up front and the unequal distribution of data–data like phone numbers could make a good case for SP-GiST.

### BRIN indexes, for larger data

Block range indexes can focus on some similar use cases to SP-GiST in that they’re best when there is some natural ordering to the data, and the data tends to be very large. Have a billion record table especially if it’s time series data? BRIN may be able to help. If you’re querying against a large set of data that is naturally grouped together such as data for several zip codes (which then roll up to some city) BRIN helps to ensure that similar zip codes are located near each other on disk.

When you have very large datasets that are ordered such as dates or zip codes BRIN indexes allow you to skip or exclude a lot of the unnecessary data very quickly. BRIN additionally are maintained as smaller indexes relative to the overall datasize making them a big win for when you have a large dataset.

### Hash indexes, finally crash safe

Hash indexes have been around for years within Postgres, but until Postgres 10 came with a giant warning that they were not WAL-logged. This meant if your server crashed and you failed over to a stand-by or recovered from archives using something like [wal-g][10] then you’d lose that index until you recreated it. With Postgres 10 they’re now WAL-logged so you can start to consider using them again, but the real question is should you?

Hash indexes at times can provide faster lookups than B-Tree indexes, and can boast faster creation times as well. The big issue with them is they’re limited to only equality operators so you need to be looking for exact matches. This makes hash indexes far less flexible than the more commonly used B-Tree indexes and something you won’t want to consider as a drop-in replacement but rather a special case.

### Which do you use?

We just covered a lot and if you’re a bit overwhelmed you’re not alone. If all you knew before was `CREATE INDEX` you’ve been using B-Tree indexes all along, and the good news is you’re still performing as well or better than most databases that aren’t Postgres :) As you start to use more Postgres features consider this a cheatsheet for when to use other Postgres types:

*   B-Tree - For most datatypes and queries

*   GIN - For JSONB/hstore/arrays

*   GiST - For full text search and geospatial datatypes

*   SP-GiST - For larger datasets with natural but uneven clustering

*   BRIN - For really large datasets that line up sequentially

*   Hash - For equality operations, and generally B-Tree still what you want here

If you have any questions or feedback about the post feel free to join us in our [slack channel][11].


--------------------------------------------------------------------------------

via: https://www.citusdata.com/blog/2017/10/17/tour-of-postgres-index-types/

作者：[Craig Kerstiens  ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.citusdata.com/blog/2017/10/17/tour-of-postgres-index-types/
[1]:https://www.citusdata.com/blog/2016/07/14/choosing-nosql-hstore-json-jsonb/
[2]:https://www.citusdata.com/blog/2016/07/14/choosing-nosql-hstore-json-jsonb/
[3]:https://www.citusdata.com/blog/2017/10/11/index-all-the-things-in-postgres/
[4]:https://www.citusdata.com/blog/2017/09/29/what-performance-can-you-expect-from-postgres/
[5]:https://www.citusdata.com/product/cloud
[6]:https://en.wikipedia.org/wiki/B-tree
[7]:https://www.8kdata.com/blog/postgresql-page-layout/
[8]:https://www.postgresql.org/docs/10/static/gin.html
[9]:https://www.cs.purdue.edu/spgist/papers/W87R36P214137510.pdf
[10]:https://www.citusdata.com/blog/2017/08/18/introducing-wal-g-faster-restores-for-postgres/
[11]:https://slack.citusdata.com/
[12]:https://twitter.com/share?url=https://www.citusdata.com/blog/2017/10/17/tour-of-postgres-index-types/&text=A%20tour%20of%20Postgres%20Index%20Types&via=citusdata
[13]:https://www.linkedin.com/shareArticle?mini=true&url=https://www.citusdata.com/blog/2017/10/17/tour-of-postgres-index-types/
