5 Real World Uses for Redis
============================================================


Redis is a powerful in-memory data structure store which has many uses including a database, a cache, and a message broker. Most people often think of it a simple key-value store, but it has so much more power. I will be going over some real world examples of some of the many things Redis can do for you.

### 1\. Full Page Cache

The first thing is full page caching. If you are using server-side rendered content, you do not want to re-render each page for every single request. Using a cache like Redis, you can cache regularly requested content and drastically decrease latency for your most requested pages, and most frameworks have hooks for caching your pages with Redis.
Simple Commands

```
// Set the page that will last 1 minute
SET key "<html>...</html>" EX 60

// Get the page
GET key

```

### 2\. Leaderboard

One of the places Redis shines is for leaderboards. Because Redis is in-memory, it can deal with incrementing and decrementing very fast and efficiently. Compare this to running a SQL query every request the performance gains are huge! This combined with Redis's sorted sets means you can grab only the highest rated items in the list in milliseconds, and it is stupid easy to implement.
Simple Commands

```
// Add an item to the sorted set
ZADD sortedSet 1 "one"

// Get all items from the sorted set
ZRANGE sortedSet 0 -1

// Get all items from the sorted set with their score
ZRANGE sortedSet 0 -1 WITHSCORES

```

### 3\. Session Storage

The most common use for Redis I have seen is session storage. Unlike other session stores like Memcache, Redis can persist data so in the situation where your cache goes down when it comes back up all the data will still be there. Although this isn't mission critical to be persisted, this feature can save your users lots of headaches. No one likes their session to be randomly dropped for no reason.
Simple Commands

```
// Set session that will last 1 minute
SET randomHash "{userId}" EX 60

// Get userId
GET randomHash

```

### 4\. Queue

One of the less common, but very useful things you can do with Redis is queue things. Whether it's a queue of emails or data to be consumed by another application, you can create an efficient queue it in Redis. Using this functionality is easy and natural for any developer who is familiar with Stacks and pushing and popping items.
Simple Commands

```
// Add a Message
HSET messages <id> <message>
ZADD due <due_timestamp> <id>

// Recieving Message
ZRANGEBYSCORE due -inf <current_timestamp> LIMIT 0 1
HGET messages <message_id>

// Delete  Message
ZREM due <message_id>
HDEL messages <message_id>

```

### 5\. Pub/Sub

The final real world use for Redis I am going to bring up in this post is pub/sub. This is one of the most powerful features Redis has built in; the possibilities are limitless. You can create a real-time chat system with it, trigger notifications for friend requests on social networks, etc... This feature is one of the most underrated features Redis offers but is very powerful, yet simple to use.
Simple Commands

```
// Add a message to a channel
PUBLISH channel message

// Recieve messages from a channel
SUBSCRIBE channel

```

### Conclusion

I hope you enjoyed this list of some of the many real world uses for Redis. This is just scratching the surface of what Redis can do for you, but I hope it gave you some ideas of how you can use the full potential Redis has to offer.

--------------------------------------------------------------------------------

作者简介:

Hi, my name is Ryan! I am a Software Developer with experience in many web frameworks and libraries including NodeJS, Django, Golang, and Laravel.


-------------------


via: https://ryanmccue.ca/5-real-world-uses-for-redis/

作者：[Ryan McCue ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://ryanmccue.ca/author/ryan/
[1]:https://ryanmccue.ca/author/ryan/