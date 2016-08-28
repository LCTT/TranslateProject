What Datatype Should You Use to Represent Time in MySQL? We Compare Datetime, Timestamp and INT
==========================================================

![](http://www.vertabelo.com/_file/blog/what-datatype-should-you-use-to-represent-time-in-mysql-we-compare-datetime-timestamp-and-int/clock.jpg)

Whenever you need to save datetime data, a question arises about what MySQL type to use. Do you go with a native MySQL DATE type or use an INT field to store date and time info as a plain number?

In this article, I’ll explain MySQL’s native options and give you a comparison table of the most common datatypes. We’ll also benchmark some typical queries and reach some conclusions about which datatype to use in a given situation.

### Native MySQL Datetime Datatypes

Datetime data represents a point in time. This could be a log entry, an Internet of Things timestamp, calendar event data, etc. MySQL has two native types that allow us to save this information in a single field: Datetime and Timestamp. Here’s what the MySQL documentation says about these datatypes:

>The DATETIME type is used for values that contain both date and time parts. MySQL retrieves and displays DATETIME values in 'YYYY-MM-DD HH:MM:SS' format.

>The TIMESTAMP data type is used for values that contain both date and time parts.

>A DATETIME or TIMESTAMP value can include a trailing fractional seconds part in up to microseconds (6 digits) precision.

>The TIMESTAMP and DATETIME data types offer automatic initialization and updating to the current date and time using DEFAULT CURRENT_TIMESTAMP and ON UPDATE CURRENT_TIMESTAMP clauses in column definitions.


So, as an example:

```
CREATE TABLE `datetime_example` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `measured_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `measured_on` (`measured_on`)
) ENGINE=InnoDB;
```

```
CREATE TABLE `timestamp_example` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `measured_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `measured_on` (`measured_on`)
) ENGINE=InnoDB;
```
Besides the native datetime representations, there is another common approach to storing date and time information. This is to use an INT field to store the Unix time (the number of seconds that have elapsed since the foundation of Coordinated Universal Time (UTC) on January 1, 1970).

MySQL also provides a way to save part of a time representation by using the Date, Year or even Time types. Since this article is about the best way to store an exact point in time, we are not including these less-precise partial types in our discussion.

### Using the INT Type with Unix Time

Using a plain INT column type to store Unix time is the most trivial approach. With INT, you can feel certain that the number you’re storing can quickly and reliably be inserted into a table, like this:

```
INSERT INTO `vertabelo`.`sampletable`
(
 `id`,
 `measured_on` #INT TYPE COLUMN
)
VALUES
(
 1,
 946684801 
 #unix stamp equivalent to 01/01/2000 @ 12:00am (UTC) http://unixtimestamp.com
);
```

That’s all there is to it. It’s just a plain ol’ INT column and MySQL will treat it as such, using 4 bytes to store that data internally. So if you perform a SELECT on this you will get a number, period. If you would like to make any comparison using this column as a date, the following query wouldn’t work properly:

```
SELECT
    id, measured_on, FROM_UNIXTIME(measured_on)
FROM
    vertabelo.inttimestampmeasures
WHERE
    measured_on > '2016-01-01' #measured_on is compared as a string to resolve the query
LIMIT 5;
```

This is because MySQL sees INT as a number, not a date. In order to make a date comparison, you must either obtain the seconds elapsed up to 2016-01-01 or you will need to use the FROM_UNIXTIME() MySQL function to convert the INT column to a Datetype. The following query demonstrates the use of the FROM_UNIXTIME() function:

```
SELECT
    id, measured_on, FROM_UNIXTIME(measured_on)
FROM
    vertabelo.inttimestampmeasures
WHERE
    FROM_UNIXTIME(measured_on) > '2016-01-01'
LIMIT 5;
```

This will properly retrieve records of dates after 2016-01-01. You can also compare your number directly against the Unix representation of 2016-01-01, which is 1451606400. Doing this means there’s no need to use any special function, since you are comparing straight numbers. Here’s the query:

```
SELECT
    id, measured_on, FROM_UNIXTIME(measured_on)
FROM
    vertabelo.inttimestampmeasures
WHERE
   measured_on > 1451606400
LIMIT 5;
```

What if it’s simply not efficient or even feasible to make this conversion in advance? For instance, say that you want all the records from every Wednesday in 2016. In order to do this without any MySQL date functions, you’d have to get the Unix timestamp for the start and end date and time for each of the Wednesdays in 2016. Then you’d have to write a huge query that will have at least 104 comparisons in the WHERE. (There are 52 Wednesdays in 2016, and you have to consider the start (0:00 am) and end of the day (11:59:59 pm)...)

The bottom line is that it’s quite probable that you will end up using the FROM_UNIXTIME() conversion function after all. So, why not give the actual date types a try?

### Using Datetime and Timestamp

Datetime and Timestamp work pretty much the same way. Both store date and time information with up to six digits precision on fractional seconds. Also, using a human-readable date like ‘2016-01-01’ (to facilitate comparisons) will work. And both formats support “relaxed formatting” when performing queries. Relaxed syntax will permit any punctuation character as the delimiter. For instance, take a string in either YYYY-MM-DD HH:MM:SS or YY-MM-DD HH:MM:SS format. Any of these versions will work in a relaxed formatting situation:

```
2012-12-31 11:30:45
2012^12^31 11+30+45
2012/12/31 11*30*45
2012@12@31 11^30^45
```

Other relaxed formats are allowed; you can find them all in the [MySQL Reference Manual][1].

By default, both Datetime and Timestamp formats are retrieved in the standard output format – year-month-day hour:minute:second (e.g. 2016-01-01 23:59:59). If fractional seconds are used, they will come after the seconds as a decimal value (e.g. 2016-01-01 23:59:59.5).

The core differences between Timestamp and Datetime relate primarily to how MySQL represents this information internally: both are stored as binary rather than strings, but Timestamp will use one less byte (four bytes) than Datetime (five bytes) to represent the date/time part. Both will use additional space (1-3 bytes) when saving fractional seconds. If you store 1.5 million records, this 1-byte difference is negligible:

```
1.5 million records * 1 extra byte per record / (1048576 bytes/MB) = 1.43 MB
```

Timestamp’s one-byte savings comes at a price: you can only store a value from '1970-01-01 00:00:01.000000' to '2038-01-19 03:14:07.999999'. Datetime, however, allows you to save any value from '1000-01-01 00:00:00.000000' to '9999-12-31 23:59:59.999999.

An important difference – one that many MySQL developers are not aware of – is that MySQL uses the server time zone to convert a Timestamp value to its UTC equivalent and saves that. It will apply the time zone conversion again when retrieving the value, so you get your “original” date/time value back again. Maybe. Here’s what can happen.

Ideally, if you stay in the same time zone, MySQL will retrieve the same value you stored. In my experience, you can run into issues if your database deals with a change in time zone. For instance, this can happen as a change in the server (e.g. you change your db from a server in Dublin to one in California, or you simply change the time zone in the server). Either way, if your time zone is different when you retrieve your data, the data may be impacted.

Datetime columns are not changed by the db. They will store and retrieve the same value every time, independent from the configured time zone. Personally, I consider this a more consistent option.

#### From MySQL documentation:

>MySQL converts TIMESTAMP values from the current time zone to UTC for storage, and back from UTC to the current time zone for retrieval. (This does not occur for other types such as DATETIME, which is stored “as is”.) By default, the current time zone for each connection is the server’s time. The time zone can be set on a per-connection basis. As long as the time zone setting remains constant, you get back the same value you store. If you store a TIMESTAMP value, and then change the time zone and retrieve the value, the retrieved value is different from the value you stored. This occurs because the same time zone was not used for conversion in both directions. The current time zone is available as the value of the time_zone system variable. For more information, “MySQL Server Time Zone Support”.

### Comparison Summary

Before digging into the actual performance difference when using each of these datatypes, let’s consider a summary table that will give you some more insights. The weaknesses of each type are in red.

Feature |Datetime |   Timestamp |  Int (store Unix time)
:--|:--|:--|:--
Native time representation |  Yes | Yes | No, so most operations need a conversion function first, like FROM_UNIXTIME()
Can store fractional seconds     |Yes, up to 6 digits precision    |Yes, up to 6 digits precision   | No
Valid range | '1000-01-01 00:00:00.000000' to '9999-12-31 23:59:59.999999 | '1970-01-01 00:00:01.000000' to '2038-01-19 03:14:07.999999'   |  If unsigned, '1970-01-01 00:00:01.000000; theoretically up to '2106-2-07 06:28:15'
Auto-initialization (MySQL 5.6.5+)  | Yes  |Yes | No
Relaxed interpretation (MySQL docs) | Yes | Yes  |No, you must use a proper format
Value is changed to UTC when stored  |No  | Yes | No
Can be changed to another type  | Yes, if the value results in a valid Timestamp range    | Yes, always  |Yes, if the value results in a valid range and using a conversion function
Storage requirements (MySQL 5.6.4+) | 5 bytes (plus up to 3 bytes for fractional seconds, if used)   |  4 bytes (plus up to 3 bytes for fractional seconds, if used)   |  4 bytes (no fractional seconds allowed)
Readable as an actual date without further functions    | Yes | Yes  |No, you have to format the output
Partitioning    | Yes | Yes, using the UNIX_TIMESTAMP(); any other expressions involving TIMESTAMP values are not permitted as per MySQL 5.7. Also, note these considerations on partition pruning.  |Yes, using any valid operation on INTs

Ideally, if you stay in the same time zone, MySQL will retrieve the same value you stored. In my experience, you can run into issues if your database deals with a change in time zone. For instance, this can happen as a change in the server (e.g. you change your db from a server in Dublin to one in California, or you simply change the time zone in the server). Either way, if your time zone is different when you retrieve your data, the data may be impacted.

Datetime columns are not changed by the db. They will store and retrieve the same value every time, independent from the configured time zone. Personally, I consider this a more consistent option.

#### From MySQL documentation:

>MySQL converts TIMESTAMP values from the current time zone to UTC for storage, and back from UTC to the current time zone for retrieval. (This does not occur for other types such as DATETIME, which is stored “as is”.) By default, the current time zone for each connection is the server’s time. The time zone can be set on a per-connection basis. As long as the time zone setting remains constant, you get back the same value you store. If you store a TIMESTAMP value, and then change the time zone and retrieve the value, the retrieved value is different from the value you stored. This occurs because the same time zone was not used for conversion in both directions. The current time zone is available as the value of the time_zone system variable. For more information, “MySQL Server Time Zone Support”.

### Comparison Summary

Before digging into the actual performance difference when using each of these datatypes, let’s consider a summary table that will give you some more insights. The weaknesses of each type are in red.

### Benchmarking INT, Timestamp, and Datetime Performance

To compare the performance of each of these types, I’m using 1.5 million records (1,497,421 to be more precise) from a weather station network I built. This network collects data every minute. To make these tests replicable, I have removed some private columns so you can run your own tests on this data.

From my original table, I created three versions:

- The `datetimemeasures` table uses Datetime in the `measured_on` column to represent the moment that the weather station record was captured.
- The `timestampmeasures` table uses Timestamp for the `measured_on` column.
- The `inttimestampmeasures` uses INT (unsigned) for the `measured_on` column.

These three tables have exactly the same data; the only difference is the `measured_on` field type. All tables have an index set on the `measured_on` column.

--------------------------------------------------------------------------------

via: http://www.vertabelo.com/blog/technical-articles/what-datatype-should-you-use-to-represent-time-in-mysql-we-compare-datetime-timestamp-and-int?utm_source=dbweekly&utm_medium=email

作者：[Francisco Claria][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.axones.com.ar/
[1]: http://dev.mysql.com/doc/refman/5.7/en/date-and-time-literals.html

