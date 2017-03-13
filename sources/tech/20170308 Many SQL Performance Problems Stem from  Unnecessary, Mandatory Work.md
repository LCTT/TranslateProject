Many SQL Performance Problems Stem from “Unnecessary, Mandatory Work”
============================================================ 

Probably the most impactful thing you could learn about when writing efficient SQL is [indexing][1]. A very close runner-up, however, is the fact that a lot of SQL clients demand tons of **“unnecessary, mandatory work”** from the database.

Repeat this after me:

> Unnecessary, Mandatory Work

What is **“unnecessary, mandatory work”**? It’s two things (duh):

### Unnecessary

Let’s assume your client application needs this information here:

[
 ![](https://lukaseder.files.wordpress.com/2017/03/title-rating.png?w=662) 
][2]

Nothing out of the ordinary. We run a movie database ([e.g. the Sakila database][3]) and we want to display the title and rating of each film to the user.

This is the query that would produce the above result:


 `SELECT title, rating`
 `FROM film` 

However, our application (or our ORM) runs this query instead:

`SELECT *`
`FROM film`

What are we getting? Guess what. We’re getting tons of useless information:

[
 ![](https://lukaseder.files.wordpress.com/2017/03/useless-information.png?w=662&h=131) 
][4]

There’s even some complex JSON all the way to the right, which is loaded:

*   From the disk
*   Into the caches
*   Over the wire
*   Into the client memory
*   And then discarded

Yes, we discard most of this information. The work that was performed to retrieve it was completely unnecessary. Right? Agreed.

### Mandatory

That’s the worse part. While optimisers have become quite smart these days, this work is mandatory for the database. There’s no way the database can  _know_  that the client application actually didn’t need 95% of the data. And that’s just a simple example. Imagine if we joined more tables…

So what, you think? Databases are fast? Let me offer you some insight you may not have thought of, before:

### Memory consumption

Sure, the individual execution time doesn’t really change much. Perhaps, it’ll be 1.5x slower, but we can handle that right? For the sake of convenience? Sometimes that’s true. But if you’re sacrificing performance for convenience  _every time_ , things add up. We’re no longer talking about performance (speed of individual queries), but throughput (system response time), and that’s when stuff gets really hairy and tough to fix. When you stop being able to scale.

Let’s look at execution plans, Oracle this time:

```
--------------------------------------------------
| Id  | Operation         | Name | Rows  | Bytes |
--------------------------------------------------
|   0 | SELECT STATEMENT  |      |  1000 |   166K|
|   1 |  TABLE ACCESS FULL| FILM |  1000 |   166K|
--------------------------------------------------
```

Versus

```
--------------------------------------------------
| Id  | Operation         | Name | Rows  | Bytes |
--------------------------------------------------
|   0 | SELECT STATEMENT  |      |  1000 | 20000 |
|   1 |  TABLE ACCESS FULL| FILM |  1000 | 20000 |
--------------------------------------------------
```

We’re using 8x as much memory in the database when doing `SELECT *`rather than `SELECT film, rating`. That’s not really surprising though, is it? We knew that. Yet we accepted it in many many of our queries where we simply didn’t need all that data. We generated **needless, mandatory work** for the database, and it does sum up. We’re using 8x too much memory (the number will differ, of course).

Now, all the other steps (disk I/O, wire transfer, client memory consumption) are also affected in the same way, but I’m skipping those. Instead, I’d like to look at…

### Index usage

Most databases these days have figured out the concept of [ _covering indexes_ ][5]. A covering index is not a special index per se. But it can turn into a “special index” for a given query, either “accidentally,” or by design.

Check out this query:

 `SELECT` `*`
 `FROM` `actor`
 `WHERE` `last_name` `LIKE` `'A%'` 

There’s no extraordinary thing to be seen in the execution plan. It’s a simple query. Index range scan, table access, done:

```
-------------------------------------------------------------------
| Id  | Operation                   | Name                | Rows  |
-------------------------------------------------------------------
|   0 | SELECT STATEMENT            |                     |     8 |
|   1 |  TABLE ACCESS BY INDEX ROWID| ACTOR               |     8 |
|*  2 |   INDEX RANGE SCAN          | IDX_ACTOR_LAST_NAME |     8 |
-------------------------------------------------------------------
```

Is it a good plan, though? Well, if what we really needed was this, then it’s not:

[
 ![](https://lukaseder.files.wordpress.com/2017/03/first-name-last-name.png?w=662) 
][6]

Sure, we’re wasting memory etc. But check out this alternative query:

| 123 | `SELECT` `first_name, last_name``FROM` `actor``WHERE` `last_name` `LIKE` `'A%'` |

Its plan is this:

```
----------------------------------------------------
| Id  | Operation        | Name            | Rows  |
----------------------------------------------------
|   0 | SELECT STATEMENT |                 |     8 |
|*  1 |  INDEX RANGE SCAN| IDX_ACTOR_NAMES |     8 |
----------------------------------------------------
```

We could now eliminate the table access entirely, because there’s an index that covers all the needs of our query… a covering index. Does it matter? Absolutely! This approach can speed up some of your queries by an order of magnitude (or slow them down by an order of magnitude when your index stops being covering after a change).

You cannot always profit from covering indexes. Indexes come with their own cost and you shouldn’t add too many of them, but in cases like these, it’s a no-brainer. Let’s run a benchmark:

```
SET SERVEROUTPUT ON
DECLARE
  v_ts TIMESTAMP;
  v_repeat CONSTANT NUMBER := 100000;
BEGIN
  v_ts := SYSTIMESTAMP;
     
  FOR i IN 1..v_repeat LOOP
    FOR rec IN (
      -- Worst query: Memory overhead AND table access
      SELECT *
      FROM actor
      WHERE last_name LIKE 'A%'
    ) LOOP
      NULL;
    END LOOP;
  END LOOP;
     
  dbms_output.put_line('Statement 1 : ' || (SYSTIMESTAMP - v_ts));
  v_ts := SYSTIMESTAMP;
     
  FOR i IN 1..v_repeat LOOP
    FOR rec IN (
      -- Better query: Still table access
      SELECT /*+INDEX(actor(last_name))*/
        first_name, last_name
      FROM actor
      WHERE last_name LIKE 'A%'
    ) LOOP
      NULL;
    END LOOP;
  END LOOP;
     
  dbms_output.put_line('Statement 2 : ' || (SYSTIMESTAMP - v_ts));
  v_ts := SYSTIMESTAMP;
     
  FOR i IN 1..v_repeat LOOP
    FOR rec IN (
      -- Best query: Covering index
      SELECT /*+INDEX(actor(last_name, first_name))*/
        first_name, last_name
      FROM actor
      WHERE last_name LIKE 'A%'
    ) LOOP
      NULL;
    END LOOP;
  END LOOP;
     
  dbms_output.put_line('Statement 3 : ' || (SYSTIMESTAMP - v_ts));
END;
/
```


The result is:

```
Statement 1 : +000000000 00:00:02.479000000
Statement 2 : +000000000 00:00:02.261000000
Statement 3 : +000000000 00:00:01.857000000
```

Note, the actor table only has 4 columns, so the difference between statements 1 and 2 is not too impressive, but still significant. Note also I’m using Oracle’s hints to force the optimiser to pick one or the other index for the query. Statement 3 clearly wins in this case. It’s a  _much_  better query, and that’s just an extremely simple query.

Again, when we write `SELECT *`, we create **needless, mandatory work** for the database, which it cannot optimise. It won’t pick the covering index because that index has a bit more overhead than the `LAST_NAME`index that it did pick, and after all, it had to go to the table anyway to fetch the useless `LAST_UPDATE` column, for instance.

But things get worse with `SELECT *`. Consider…

### SQL transformations

Optimisers work so well, because they transform your SQL queries ([watch my recent talk at Voxxed Days Zurich about how this works][7]). For instance, there’s a SQL transformation called “`JOIN` elimination”, and it is really powerful. Consider this auxiliary view, which we wrote because we grew so incredibly tired of joining all these tables all the time:

```
CREATE VIEW v_customer AS
SELECT
  c.first_name, c.last_name, 
  a.address, ci.city, co.country
FROM customer c
JOIN address a USING (address_id)
JOIN city ci USING (city_id)
JOIN country co USING (country_id)
```

This view just connects all the “to-one” relationships between a `CUSTOMER` and their different `ADDRESS` parts. Thanks, normalisation.

Now, after a while working with this view, imagine, we’ve become so accustomed to this view, we forgot all about the underlying tables. And now, we’re running this query:

```
SELECT *
FROM v_customer
```

We’re getting quite some impressive plan:

```
----------------------------------------------------------------
| Id  | Operation            | Name     | Rows  | Bytes | Cost |
----------------------------------------------------------------
|   0 | SELECT STATEMENT     |          |   599 | 47920 |   14 |
|*  1 |  HASH JOIN           |          |   599 | 47920 |   14 |
|   2 |   TABLE ACCESS FULL  | COUNTRY  |   109 |  1526 |    2 |
|*  3 |   HASH JOIN          |          |   599 | 39534 |   11 |
|   4 |    TABLE ACCESS FULL | CITY     |   600 | 10800 |    3 |
|*  5 |    HASH JOIN         |          |   599 | 28752 |    8 |
|   6 |     TABLE ACCESS FULL| CUSTOMER |   599 | 11381 |    4 |
|   7 |     TABLE ACCESS FULL| ADDRESS  |   603 | 17487 |    3 |
----------------------------------------------------------------
```

Well, of course. We run all these joins and full table scans, because that’s what we told the database to do. Fetch all this data.

Now, again, imagine, what we really wanted on one particular screen was this:

[
 ![](https://lukaseder.files.wordpress.com/2017/03/first-name-last-name-customers.png?w=662) 
][8]

Yeah, duh, right? By now you get my point. But imagine, we’ve learned from the previous mistakes and we’re now actually running the following, better query:

```
SELECT first_name, last_name
FROM v_customer
```


Now, check this out!

```
------------------------------------------------------------------
| Id  | Operation          | Name        | Rows  | Bytes | Cost  |
------------------------------------------------------------------
|   0 | SELECT STATEMENT   |             |   599 | 16173 |     4 |
|   1 |  NESTED LOOPS      |             |   599 | 16173 |     4 |
|   2 |   TABLE ACCESS FULL| CUSTOMER    |   599 | 11381 |     4 |
|*  3 |   INDEX UNIQUE SCAN| SYS_C007120 |     1 |     8 |     0 |
------------------------------------------------------------------
```

That’s a  _drastic_  improvement in the execution plan. Our joins were eliminated, because the optimiser could prove they were **needless**, so once it can prove this (and you don’t make the work **mandatory** by selecting *), it can remove the work and simply not do it. Why is that the case?

Each `CUSTOMER.ADDRESS_ID` foreign key guarantees that there is  _exactly one_  `ADDRESS.ADDRESS_ID` primary key value, so the `JOIN` operation is guaranteed to be a to-one join which does not add rows nor remove rows. If we don’t even select rows or query rows, well, we don’t need to actually load the rows at all. Removing the `JOIN` provably won’t change the outcome of the query.

Databases do these things all the time. You can try this on most databases:

```
-- Oracle
SELECT CASE WHEN EXISTS (
  SELECT 1 / 0 FROM dual
) THEN 1 ELSE 0 END
FROM dual
 
-- More reasonable SQL dialects, e.g. PostgreSQL
SELECT EXISTS (SELECT 1 / 0)
```

In this case, you might expect an arithmetic exception to be raised, as when you run this query:

```
SELECT 1 / 0 FROM dual
```


yielding

```
ORA-01476: divisor is equal to zero
```

But it doesn’t happen. The optimiser (or even the parser) can prove that any `SELECT` column expression in a `EXISTS (SELECT ..)` predicate will not change the outcome of a query, so there’s no need to evaluate it. Huh!

### Meanwhile…

One of most ORM’s most unfortunate problems is the fact that they make writing `SELECT *` queries so easy to write. In fact, HQL / JPQL for instance, proceeded to making it the default. You can even omit the `SELECT` clause entirely, because after all, you’re going to be fetching the entire entity, as declared, right?

For instance:

`FROM` `v_customer`

[Vlad Mihalcea for instance, a Hibernate expert and Hibernate Developer advocate][9] recommends you use queries almost every time you’re sure you don’t want to persist any modifications after fetching. ORMs make it easy to solve the object graph persistence problem. Note: Persistence. The idea of actually modifying the object graph and persisting the modifications is inherent.

But if you don’t intend to do that, why bother fetching the entity? Why not write a query? Let’s be very clear: From a performance perspective, writing a query tailored to the exact use-case you’re solving is  _always_  going to outperform any other option. You may not care because your data set is small and it doesn’t matter. Fine. But eventually, you’ll need to scale and re-designing your applications to favour a query language over imperative entity graph traversal will be quite hard. You’ll have other things to do.

### Counting for existence

Some of the worst wastes of resources is when people run `COUNT(*)`queries when they simply want to check for existence. E.g.

> Did this user have any orders at all?

And we’ll run:

```
SELECT count(*)
FROM orders
WHERE user_id = :user_id
```

Easy. If `COUNT = 0`: No orders. Otherwise: Yes, orders.

The performance will not be horrible, because we probably have an index on the `ORDERS.USER_ID` column. But what do you think will be the performance of the above compared to this alternative here:

```
-- Oracle
SELECT CASE WHEN EXISTS (
  SELECT *
  FROM orders
  WHERE user_id = :user_id
) THEN 1 ELSE 0 END
FROM dual
 
-- Reasonable SQL dialects, like PostgreSQL
SELECT EXISTS (
  SELECT *
  FROM orders
  WHERE user_id = :user_id
)
```

It doesn’t take a rocket scientist to figure out that an actual existence predicate can stop looking for additional rows as soon as it found  _one_ . So, if the answer is “no orders”, then the speed will be comparable. If, however, the answer is “yes, orders”, then the answer might be  _drastically_  faster in the case where we do not calculate the exact count.

Because we  _don’t care_  about the exact count. Yet, we told the database to calculate it (**needless**), and the database doesn’t know we’re discarding all results bigger than 1 (**mandatory**).

Of course, things get much worse if you call `list.size()` on a JPA-backed collection to do the same…

[I’ve blogged about this recently, and benchmarked the alternatives on different databases. Do check it out.][10]

### Conclusion

This article stated the “obvious”. Don’t tell the database to perform **needless, mandatory work**.

It’s **needless** because given your requirements, you  _knew_  that some specific piece of work did not need to be done. Yet, you tell the database to do it.

It’s **mandatory** because the database has no way to prove it’s **needless**. This information is contained only in the client, which is inaccessible to the server. So, the database has to do it.

This article talked about `SELECT *`, mostly, because that’s such an easy target. But this isn’t about databases only. This is about any distributed algorithm where a client instructs a server to perform **needless, mandatory work**. How many N+1 problems does your average AngularJS application have, where the UI loops over service result A, calling service B many times, instead of batching all calls to B into a single call? It’s a recurrent pattern.

The solution is always the same. The more information you give to the entity executing your command, the faster it can (in principle) execute such command. Write a better query. Every time. Your entire system will thank you for it.

### If you liked this article…

… do also check out my recent talk at Voxxed Days Zurich, where I show some hyperbolic examples of why SQL will beat Java at data processing algorithms every time:

--------------------------------------------------------------------------------

via: https://blog.jooq.org/2017/03/08/many-sql-performance-problems-stem-from-unnecessary-mandatory-work

作者：[ jooq][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://blog.jooq.org/
[1]:http://use-the-index-luke.com/
[2]:https://lukaseder.files.wordpress.com/2017/03/title-rating.png
[3]:https://github.com/jOOQ/jOOQ/tree/master/jOOQ-examples/Sakila
[4]:https://lukaseder.files.wordpress.com/2017/03/useless-information.png
[5]:https://blog.jooq.org/2015/04/28/do-not-think-that-one-second-is-fast-for-query-execution/
[6]:https://lukaseder.files.wordpress.com/2017/03/first-name-last-name.png
[7]:https://www.youtube.com/watch?v=wTPGW1PNy_Y
[8]:https://lukaseder.files.wordpress.com/2017/03/first-name-last-name-customers.png
[9]:https://vladmihalcea.com/2016/09/13/the-best-way-to-handle-the-lazyinitializationexception/
[10]:https://blog.jooq.org/2016/09/14/avoid-using-count-in-sql-when-you-could-use-exists/
