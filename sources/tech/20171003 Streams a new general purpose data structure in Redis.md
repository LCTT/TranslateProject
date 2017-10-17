[Streams: a new general purpose data structure in Redis.][1]
==================================


Until a few months ago, for me streams were no more than an interesting and relatively straightforward concept in the context of messaging. After Kafka popularized the concept, I mostly investigated their usefulness in the case of Disque, a message queue that is now headed to be translated into a Redis 4.2 module. Later I decided that Disque was all about AP messaging, which is, fault tolerance and guarantees of delivery without much efforts from the client, so I decided that the concept of streams was not a good match in that case.

However, at the same time, there was a problem in Redis, that was not taking me relaxed about the data structures exported by default. There is some kind of gap between Redis lists, sorted sets, and Pub/Sub capabilities. You can kindly use all these tools in order to model a sequence of messages or events, but with different tradeoffs. Sorted sets are memory hungry, can’t model naturally the same message delivered again and again, clients can’t block for new messages. Because a sorted set is not a sequential data structure, it’s a set where elements can be moved around changing their scores: no wonder if it was not a good match for things like time series. Lists have different problems creating similar applicability issues in certain use cases: you cannot explore what is in the middle of a list because the access time in that case is linear. Moreover no fan-out is possible, blocking operations on list serve a single element to a single client. Nor there was a fixed element identifier in lists, in order to say: given me things starting from that element. For one-to-many workloads there is Pub/Sub, which is great in many cases, but for certain things you do not want fire-and-forget: to retain a history is important, not just to refetch messages after a disconnection, also because certain list of messages, like time series, are very important to explore with range queries: what were my temperature readings in this 10 seconds range?

The way I tried to address the above problems, was planning a generalization of sorted sets and lists into a unique more flexible data structure, however my design attempts ended almost always in making the resulting data structure ways more artificial than the current ones. One good thing about Redis is that the data structures exported resemble more the natural computer science data structures, than, “this API that Salvatore invented”. So in the end, I stopped my attempts, and said, ok that’s what we can provide so far, maybe I’ll add some history to Pub/Sub, or some more flexibility to lists access patterns in the future. However every time an user approached me during a conference saying “how would you model time series in Redis?” or similar related questions, my face turned green.

Genesis
=======

After the introduction of modules in Redis 4.0, users started to see how to fix this problem themselves. One of them, Timothy Downs, wrote me the following over IRC:

    <forkfork> the module I'm planning on doing is to add a transaction log style data type - meaning that a very large number of subscribers can do something like pub sub without a lot of redis memory growth
    <forkfork> subscribers keeping their position in a message queue rather than having redis maintain where each consumer is up to and duplicating messages per subscriber

This captured my imagination. I thought about it a few days, and realized that this could be the moment when we could solve all the above problems at once. What I needed was to re-imagine the concept of “log”. It is a basic programming element, everybody is used to it, because it’s just as simple as opening a file in append mode and writing data to it in some format. However Redis data structures must be abstract. They are in memory, and we use RAM not just because we are lazy, but because using a few pointers, we can conceptualize data structures and make them abstract, to allow them to break free from the obvious limits. For instance normally a log has several problems: the offset is not logical, but is an actual bytes offset, what if we want logical offsets that are related to the time an entry was inserted? We have range queries for free. Similarly, a log is often hard to garbage collect: how to remove old elements in an append only data structure? Well, in our idealized log, we just say we want at max this number of entries, and the old ones will go away, and so forth.

While I was trying to write a specification starting from the seed idea of Timothy, I was working to a radix tree implementation that I was using for Redis Cluster, to optimize certain parts of its internals. This provided the ground in order to implement a very space efficient log, that was still accessible in logarithmic time to get ranges. At the same time I started reading about Kafka streams to get other interesting ideas that could fit well into my design, and this resulted into getting the concept of Kafka consumer groups, and idealizing it again for Redis and the in-memory use case. However the specification remained just a specification for months, at the point that after some time I rewrote it almost from scratch in order to upgrade it with many hints that I accumulated talking with people about this upcoming addition to Redis. I wanted Redis streams to be a very good use case for time series especially, not just for other kind of events and messaging applications.

Let’s write some code
=====================

Back from Redis Conf, during the summertime, I was implementing a library called “listpack”.  This library is just the successor of ziplist.c, that is, a data structure that can represent a list of string elements inside a single allocation. It’s just a very specialized serialization format, with the peculiarity of being parsable also in reverse order, from right to left: something needed in order to substitute ziplists in all the use cases.

Mixing radix trees + listpacks, it is possible to easily build a log that is at the same time very space efficient, and indexed, that means, allowing for random access by IDs and time. Once this was ready, I started to write the code in order to implement the stream data structure. I’m still finishing the implementation, however at this point, inside the Redis “streams” branch at Github, there is enough to start playing and having fun. I don’t claim that the API is 100% final, but there are two interesting facts: one is that at this point, only the consumer groups are missing, plus a number of less important commands to manipulate the stream, but all the big things are implemented already. The second is the decision to backport all the stream work back into the 4.0 branch in about two months, once everything looks stable. It means that Redis users will not have to wait for Redis 4.2 in order to use streams, they will be available ASAP for production usage. This is possible because being a new data structure, almost all the code changes are self-contained into the new code. With the exception of the blocking list operations: the code was refactored so that we share the same code for streams and lists blocking operations, with a great simplification of the Redis internals.

Tutorial: welcome to Redis Streams
==================================

In some way, you can think at streams as a supercharged version of Redis lists. Streams elements are not just a single string, they are more objects composed of fields and values. Range queries are possible and fast. Each entry in a stream has an ID, which is a logical offset. Different clients can blocking-wait for elements with IDs greater than a specified one. A fundamental command of Redis streams is XADD. Yes, all the Redis stream commands are prefixed by an “X”.

> XADD mystream * sensor-id 1234 temperature 10.5
1506871964177.0

The XADD command will append the specified entry as a new element to the specified stream “mystream”. The entry, in the example above, has two fields: sensor-id and temperature, however each entry in the same stream can have different fields. Using the same field names will just lead to better memory usage. An interesting thing is also that the fields order is guaranteed to be retained. XADD returns the ID of the just inserted entry, because with the asterisk in the third argument, we asked the command to auto-generate the ID. This is almost always what you want, but it is possible also to force a specific ID, for instance in order to replicate the command to slaves and AOF files.

The ID is composed of two parts: a millisecond time and a sequence number. 1506871964177 is the millisecond time, and is just a Unix time with millisecond resolution. The number after the dot, 0, is the sequence number, and is used in order to distinguish entries added in the same millisecond. Both numbers are 64 bit unsigned integers. This means that we can add all the entries we want in a stream, even in the same millisecond. The millisecond part of the ID is obtained using the maximum between the current local time of the Redis server generating the ID, and the last entry inside the stream. So even if, for instance, the computer clock jumps backward, the IDs will continue to be incremental. In some way you can think stream entry IDs as whole 128 bit numbers. However the fact that they have a correlation with the local time of the instance where they are added, means that we have millisecond precision range queries for free.

As you can guess, adding two entries in a very fast way, will result in only the sequence number to be incremented. We can simulate the “fast insertion” simply with a MULTI/EXEC block:

> MULTI
OK
> XADD mystream * foo 10
QUEUED
> XADD mystream * bar 20
QUEUED
> EXEC
1) 1506872463535.0
2) 1506872463535.1

The above example also shows how we can use different fields for different entries without having to specifying any schema initially. What happens however is that every first message of every block (that usually contains something in the range of 50-150 messages) is used as reference, and successive entries having the same fields are compressed with a single flag saying “same fields of the first entry in this block”. So indeed using the same fields for successive messages saves a lot of memory, even when the set of fields slowly change over time.

In order to retrieve data from the stream there are two ways: range queries, that are implemented by the XRANGE command, and streaming, implemented by the XREAD command. XRANGE just fetches a range of items from start to stop, inclusive. So for instance I can fetch a single item, if I know its ID, with:

> XRANGE mystream 1506871964177.0 1506871964177.0
1) 1) 1506871964177.0
   2) 1) "sensor-id"
      2) "1234"
      3) "temperature"
      4) "10.5"

However you can use the special start symbol of “-“ and the special stop symbol of “+” to signify the minimum and maximum ID possible. It’s also possible to use the COUNT option in order to limit the amount of entries returned. A more complex XRANGE example is the following:

> XRANGE mystream - + COUNT 2
1) 1) 1506871964177.0
   2) 1) "sensor-id"
      2) "1234"
      3) "temperature"
      4) "10.5"
2) 1) 1506872463535.0
   2) 1) "foo"
      2) "10"

Here we are reasoning in terms of ranges of IDs, however you can use XRANGE in order to get a specific range of elements in a given time range, because you can omit the “sequence” part of the IDs. So what you can do is to just specify times in milliseconds. The following means: “Give me 10 entries starting from the Unix time 1506872463”:

127.0.0.1:6379> XRANGE mystream 1506872463000 + COUNT 10
1) 1) 1506872463535.0
   2) 1) "foo"
      2) "10"
2) 1) 1506872463535.1
   2) 1) "bar"
      2) "20"

A final important thing to note about XRANGE is that, given that we receive the IDs in the reply, and the immediately successive ID is trivially obtained just incrementing the sequence part of the ID, it is possible to use XRANGE to incrementally iterate the whole stream, receiving for every call the specified number of elements. After the *SCAN family of commands in Redis, that allowed iteration of Redis data structures *despite* the fact they were not designed for being iterated, I avoided to make the same error again.

Streaming with XREAD: blocking for new data
===========================================

XRANGE is perfect when we want to access our stream to get ranges by ID or time, or single elements by ID. However in the case of streams that different clients must consume as data arrives, this is not good enough and would require some form of pooling (that could be a good idea for *certain* applications that just connect from time to time to get data).

The XREAD command is designed in order to read, at the same time, from multiple streams just specifying the ID of the last entry in the stream we got. Moreover we can request to block if no data is available, to be unblocked when data arrives. Similarly to what happens with blocking list operations, but here data is not consumed from the stream, and multiple clients can access the same data at the same time.

This is a canonical example of XREAD call:

> XREAD BLOCK 5000 STREAMS mystream otherstream $ $

And it means: get data from “mystream” and “otherstream”. If no data is available, block the client, with a timeout of 5000 milliseconds. After the STREAMS option we specify the keys we want to listen for, and the last ID we have. However a special ID of “$” means: assume I’ve all the elements that there are in the stream right now, so give me just starting from the next element arriving.

If, from another client, I send the commnad:

> XADD otherstream * message “Hi There”

This is what happens on the XREAD side:

1) 1) "otherstream"
   2) 1) 1) 1506935385635.0
         2) 1) "message"
            2) "Hi There"

We get the key that received data, together with the data received. In the next call, we’ll likely use the ID of the last message received:

> XREAD BLOCK 5000 STREAMS mystream otherstream $ 1506935385635.0

And so forth. However note that with this usage pattern, it is possible that the client will connect again after a very big delay (because it took time to process messages, or for any other reason). In such a case, in the meantime, a lot of messages could pile up, so it is wise to always use the COUNT option with XREAD, in order to make sure the client will not be flooded with messages and the server will not have to lose too much time just serving tons of messages to a single client.

Capped streams
==============

So far so good… however streams at some point have to remove old messages. Fortunately this is possible with the MAXLEN option of the XADD command:

> XADD mystream MAXLEN 1000000 * field1 value1 field2 value2

This basically means, if the stream, after adding the new element is found to have more than 1 million messages, remove old messages so that the length returns back to 1 million elements. It’s just like using RPUSH + LTRIM with lists, but this time we have a built-in mechanism to do so. However note that the above means that every time we add a new message, we have also to incur in the work needed in order to remove a message from the other side of the stream. This takes some CPU, so it is possible to use the “~” symbol before the count in MAXLEN, in order to specify that we are not really demanding *exactly* 1 million messages, but if there are a few more it’s not a big problem:

> XADD mystream MAXLEN ~ 1000000 * foo bar

This way XADD will remove messages only when it can remove a whole node. This will make having the capped stream almost for free compared to vanilla XADD.

Consumer groups (work in progress)
==================================

This is the first of the features that is not already implemented in Redis, but is a work in progress. It is also the idea more clearly inspired by Kafka, even if implemented here in a pretty different way. The gist is that with XREAD, clients can also add a “GROUP <name>” option. Automatically all the clients in the same group will get *different* messages. Of course there could be multiple groups reading from the same stream, in such cases all groups will receive duplicates of the same messages arriving in the stream, but within each group, messages will not be repeated.

An extension to groups is that it will be possible to specify a “RETRY <milliseconds>” option when groups are specified: in this case, if messages are not acknowledged for processing with XACK, they will be delivered again after the specified amount of milliseconds. This provides some best effort reliability to the delivering of the messages, in case the client has no private means to mark messages as processed. This part is a work in progress as well.

Memory usage and saving loading times
=====================================

Because of the design used to model Redis streams, the memory usage is remarkably low. It depends on the number of fields, values, and their lengths, but for simple messages we are at a few millions of messages for every 100 MB of used memory. Moreover, the format is conceived to need very minimal serialization: the listpack blocks that are stored as radix tree nodes, have the same representation on disk and in memory, so they are trivially stored and read. For instance Redis can read 5 million entries from the RDB file in 0.3 seconds.
This makes replication and persistence of streams very efficient.

It is planned to also allow deletion of items in the middle. This is only partially implemented, but the strategy is to mark entries as deleted in the entry flag, and when a given ratio between entries and deleted entires is reached, the block is rewritten to collect the garbage, and if needed it is glued to another adjacent block in order to avoid fragmentation.

Conclusions end ETA
===================

Redis streams will be part of Redis stable in the 4.0 series before the end of the year. I think that this general purpose data structure is going to put a huge patch in order for Redis to cover a lot of use cases that were hard to cover: that means that you had to be creative in order to abuse the current data structures to fix certain problems. One very important use case is time series, but my feeling is that also streaming of messages for other use cases via TREAD is going to be very interesting both as replacement for Pub/Sub applications that need more reliability than fire-and-forget, and for completely new use cases. For now, if you want to start to evaluate the new capabilities in the context of your problems, just fetch the “streams” branch at Github and start playing. After all bug reports are welcome :-)

If you like videos, a real-time session showing streams is here: https://www.youtube.com/watch?v=ELDzy9lCFHQ


--------------------------------------------------------------------------------

via: http://antirez.com/news/114

作者：[antirez ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://antirez.com/
[1]:http://antirez.com/news/114
[2]:http://antirez.com/user/antirez
[3]:https://www.youtube.com/watch?v=ELDzy9lCFHQ
