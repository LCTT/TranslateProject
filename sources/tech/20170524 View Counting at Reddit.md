translating---geekpi

View Counting at Reddit
======================

![](https://redditupvoted.files.wordpress.com/2017/05/content-view-header.png?crop=0px%2C9px%2C1000px%2C483px&resize=1200%2C580)


We want to better communicate the scale of Reddit to our users. Up to this point, vote score and number of comments were the main indicators of activity on a given post. However, Reddit has many visitors that consume content without voting or commenting. We wanted to build a system that could capture this activity by counting the number of views a post received. This number is then shown to content creators and moderators to provide them better insight into the activity on specific posts.

![](https://redditupvoted.files.wordpress.com/2017/05/cvcs-neeson-fix.png?w=372&h=743&zoom=2)

In this post, we’re going to talk about how we implemented counting at scale.

### Counting Methodology

We had four main requirements for counting views:

*Counts must be real time or near-real time. No daily or hourly aggregates.
*Each user must only be counted once within a short time window.
*The displayed count must be within a few percentage points of the actual tally.
*The system must be able to run at production scale and process events within a few seconds of their occurrence.

Satisfying all four of these requirements is trickier than it sounds. In order to maintain an exact count in real time we would need to know whether or not a specific user visited the post before. To know that information, we would need to store the set of users who had previously visited each post, and then check that set every time we processed a new view on a post. A naive implementation of this solution would be to store the unique user set as a hash table in memory, with the post ID as the key.

This approach works well for less trafficked posts, but is very difficult to scale once a post becomes popular and the number of viewers rapidly increases. Several popular posts have over one million unique viewers! On posts like these, it becomes extremely taxing on both memory and CPU to store all the IDs and do frequent lookups into the set to see if someone has already visited before.

Since we could not provide exact counts, we looked at a few different [cardinality estimation][1] algorithms. We considered two options that closely matched what we were looking to accomplish:

1. A linear probabilistic counting approach, which is very accurate, but requires linearly more memory as the set being counted gets larger.
2. A [HyperLogLog][2] (HLL)-based counting approach. HLLs grow sub-linearly with set size, but do not provide the same level of accuracy as linear counters.

For an understanding of just how much space HLLs really save, consider the r/pics post included at the top of this blog post. It received over 1 million unique users. If we had to store 1 million unique user IDs, and each user ID is an 8-byte long, then we would require 8 megabytes of memory just to count the unique users for a single post! In contrast, using an HLL for counting would take significantly less memory. The amount of memory varies per implementation, but in the case of [this implementation][3], we could count over 1 million IDs using just 12 kilobytes of space, which would be 0.15% of the original space usage!

([This article on High Scalability][5] has a good overview of both of the above algorithms.)

Many HLL implementations use a combination of the above two approaches, by starting with linear counting for small sets and switching over to HLL once the size reaches a certain point. The former is frequently referred to as a “sparse” HLL representation, while the latter is referred to as a “dense” HLL representation. The hybrid approach is very advantageous, because it can provide accurate results for both small sets and large sets while retaining a modest memory footprint. This approach is described in more detail in [Google’s HyperLogLog++ paper][6].

While the HLL algorithm is fairly standard, there were three variants we considered using in our implementation. Note that for in-memory HLL implementations, we only looked at Java and Scala implementations as we primarily use Java and Scala on the data engineering team.

1. Twitter’s Algebird library, implemented in Scala. Algebird has good usage docs, but the implementation details of the sparse and dense HLL representations were not easily understandable.
2. An implementation of HyperLogLog++ located in stream-lib, implemented in Java. The code in stream-lib is very well-documented, but it was somewhat difficult to understand how to use the library properly and tune it to our needs.
3. Redis’s HLL implementation (which we chose). We felt that the Redis implementation of HLLs were well-documented and easily configurable, and the HLL-related APIs provided were easy to integrate. As an added benefit, using Redis alleviated many of our performance concerns by taking the CPU and memory-intensive portion of the counting application (HLL computations) out and moving that onto a dedicated server.

![](https://redditupvoted.files.wordpress.com/2017/05/view-counts-architecture.png)

Reddit’s data pipeline is primarily oriented around [Apache Kafka][7]. When a user views a post, an event gets fired and sent to an event collector server, which batches the events and persists them into Kafka.

From here, the view-counting system has two components which operate sequentially. The first part of our counting architecture is a Kafka consumer called [Nazar][8], which will read each event from Kafka and pass it through a set of rules we’ve concocted to determine whether or not an event should be counted. We gave it this name because just as a nazar is an eye-shaped amulet protecting you from evil, the Nazar system is an “eye” that protects us from bad actors trying to game the system. Nazar uses Redis to maintain state and keep track of potential reasons why a view should not be counted. One reason we may not count an event is if it’s the result of repeat views from the same user over a short period of time. Nazar will then alter the event, adding a Boolean flag indicating whether or not it should be counted, before sending the event back to Kafka.

This is where the second part of the project picks up. We have a second Kafka consumer called [Abacus][9], which does the actual counting of views and makes the counts available for the site or clients to display. Abacus reads the events from Kafka that were output by Nazar; then, depending on Nazar’s determination, it either counts or skips over the view. If the event is marked for counting, then Abacus first checks if there is an HLL counter already existing in Redis for the post corresponding to the event. If the counter is already in Redis, then Abacus makes a [PFADD][10] request to Redis for that post. If the counter is not already in Redis, then Abacus makes a request to a Cassandra cluster, which we use to persist both the HLL counters and the raw count numbers, and makes a [SET][11] request into Redis to add the filter. This usually happens when people view older posts whose counters have been evicted from Redis.

In order to allow for maintaining counts on older posts that might have been evicted from Redis, Abacus periodically writes out both the full HLL filter from Redis along with the count for each post to a Cassandra cluster. Writes to Cassandra are batched in 10-second groups per post in order to avoid overloading the cluster. Below is a diagram outlining this event flow at a high level.

![](https://redditupvoted.files.wordpress.com/2017/05/abacus-event-flow.png)

### Conclusion

We hope that view counts will better enable content creators to understand the full reach of their posts, and help moderators to quickly identify which posts are receiving large amounts of traffic in their communities. In the future, we plan to leverage the real-time potential of our data pipeline to deliver more useful feedback to redditors.

If you’re interested in solving problems like this at scale, [check out our Careers page][12].


----------------------

via: https://redditblog.com/2017/05/24/view-counting-at-reddit/

作者：[Krishnan Chandra ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://redditblog.com/topic/technology/
[1]:https://en.wikipedia.org/wiki/Count-distinct_problem
[2]:http://algo.inria.fr/flajolet/Publications/FlFuGaMe07.pdf
[3]:http://antirez.com/news/75
[5]:http://highscalability.com/blog/2012/4/5/big-data-counting-how-to-count-a-billion-distinct-objects-us.html
[6]:https://stefanheule.com/papers/edbt13-hyperloglog.pdf
[7]:https://kafka.apache.org/
[8]:https://en.wikipedia.org/wiki/Nazar_(amulet)
[9]:https://en.wikipedia.org/wiki/Abacus
[10]:https://redis.io/commands/pfadd
[11]:https://redis.io/commands/set
[12]:https://about.reddit.com/careers/








