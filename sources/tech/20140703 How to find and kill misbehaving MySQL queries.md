How to find and kill misbehaving MySQL queries
================================================================================
Sometimes the complexity of a relational database system can be overwhelming. Fortunately, that complexity is an advantage, as with MySQL's tools for managing queries. In this tutorial, I will show you **how to find and kill any misbehaving MySQL queries**.

To view the currently-running queries, log in to the MySQL console and run the 'show processlist' command:

    mysql> show processlist; 

    +--------+--------+-----------------+---------+---------+-------+-------+------------------+-----------+---------------+-----------+
    | Id     | User   | Host            | db      | Command | Time  | State | Info             | Rows_sent | Rows_examined | Rows_read |
    +--------+--------+-----------------+---------+---------+-------+-------+------------------+-----------+---------------+-----------+
    |  78233 | root   | 127.0.0.1:37527 | mysql   | Sleep   | 16474 |       | NULL             |         6 |             6 |         6 |
    |  84546 | root   | 127.0.0.1:48593 | mysql   | Sleep   | 13237 |       | NULL             |         2 |             2 |         2 |
    | 107083 | root   | 127.0.0.1:56451 | mysql   | Sleep   | 15488 |       | NULL             |         1 |           121 |       121 |
    | 131455 | root   | 127.0.0.1:48550 | NULL    | Query   |     0 | NULL  | show processlist |         0 |             0 |         0 |
    +--------+--------+-----------------+---------+---------+-------+-------+------------------+-----------+---------------+-----------+
    4 rows in set (0.03 sec)

The first column you should look at is 'Time', which is the number of seconds the process has been "doing the thing it's doing". A process whose command is 'Sleep' is waiting for a query to come in, so it's not consuming any resources. For any other process, however, a 'Time' of more than a few seconds indicates a problem.

In this case, the only query running is our 'show processlist' command. Let's see what it looks like if we have a poorly-written query running:

    mysql> show processlist; 

    +--------+--------+-----------------+-----------+---------+-------+--------------+----------------------------------+-----------+---------------+-----------+
    | Id     | User   | Host            | db        | Command | Time  | State        | Info                             | Rows_sent | Rows_examined | Rows_read |
    +--------+--------+-----------------+-----------+---------+-------+--------------+----------------------------------+-----------+---------------+-----------+
    |  78233 | root   | 127.0.0.1:37527 | example   | Sleep   | 18046 |              | NULL                             |         6 |             6 |         6 |
    |  84546 | root   | 127.0.0.1:48593 | example   | Sleep   | 14809 |              | NULL                             |         2 |             2 |         2 |
    | 107083 | root   | 127.0.0.1:56451 | example   | Sleep   | 17060 |              | NULL                             |         1 |           121 |       121 |
    | 132033 | root   | 127.0.0.1:54642 | example   | Query   |    27 | Sending data | select max(subtotal) from orders |         0 |             0 |         0 |
    | 133933 | root   | 127.0.0.1:48679 | NULL      | Query   |     0 | NULL         | show processlist                 |         0 |             0 |         0 |
    | 134122 | root   | 127.0.0.1:49264 | example   | Sleep   |     0 |              | NULL                             |         0 |             0 |         0 |
    +--------+--------+-----------------+-----------+---------+-------+--------------+----------------------------------+-----------+---------------+-----------+
    6 rows in set (0.00 sec)

Ah! Now we see there is a query that's been running for almost 30 seconds. If we don't want to let it run its course, we can kill it by passing its 'Id' to the kill command:

    mysql> kill 132033;
    Query OK, 0 rows affected (0.00 sec)
    mysql> 

(Note that MySQL will always report 0 rows affected, because we're not altering any data.)

Judicious use of the kill command can clean up a backlog of queries. Remember, however, that it's not a permanent solution - if those queries came from your application, you need to rewrite them, or you'll continue to see the same issue reappear.

### See Also ###

MySQL's documentation on the different 'Command' values:

- [https://dev.mysql.com/doc/refman/5.7/en/thread-commands.html][1]

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/07/find-kill-misbehaving-mysql-queries.html

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://dev.mysql.com/doc/refman/5.7/en/thread-commands.html