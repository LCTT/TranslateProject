Linux FAQs with Answers--How to convert between local time and UNIX timestamp in Perl
================================================================================
> **Question**: I need to convert readable date and time to a corresponding UNIX timestamp (i.e., Epoch time), or vice versa in a Perl program. Can you show me Perl code examples of converting date/time to UNIX timestamp, or conversely, converting UNIX timestamp to human-readable date and time? 

When your Perl script needs to deal with time information, there are two different ways to represent and manipulate date and time in the script. One way is a human-readable string representation of time (e.g., "Sat Mar 14 10:14:05 EDT 2015"), and the other is via UNIX timestamp (also known as "Epoch time") which is the number of elapsed seconds since 00:00:00 UTC, 1 Jaunary 1970. Either method has its own pros and cons, and depending on your requirements you may want to convert one format to the other.

### Convert Local Time to UNIX Timestamp in Perl ###

To obtain UNIX time from a date string, you can use str2time() in Date::Parse module. It can handle a variety of date formats, such as:

- Sat Mar 14 10:14:05 EDT 2015
- 3/14/2015 10:14:05 -0400
- 14/Mar/15 10:14:05
- 14 Mar 15 10:14:05 

    use Date::Parse;
     
    my $local_time = "Sat Mar 14 10:14:05 EDT 2015";
     
    # 1426342445 will be stored in $unix_time
    my $unix_time = str2time($local_time);

Date:Parse module supports multiple languages (English, French, German and Italian) and timezones. For example:

    use Date::Parse;
    use Date::Language;
     
    my $lang = Date::Language->new('French');
    my $unix_time = $lang->str2time("12:14:05, Ago 16, 2014 (CEST)");

### Convert UNIX Timestmp to Human-Readable Date and Time in Perl ###

If you want to show a UNIX timestamp in a human-readable format, you can use localtime() function which converts a UNIX timestamp into a 9-element list. You can use the returned list to construct any kind of human-readable date/time string as you want. Here is a code snippet.

    # $sec, $min, $hour: seconds, minutes and hours
    # $mday: the day of the month (0-31)
    # $mon: month in the range of 0 (Jaunary) and 11 (December)
    # $year: the number of years that have elapsed since 1900
    # $wday: the day of the week in the range of 0 (Sunday) and 6 (Saturday)
    # $yday: the day of the year in the range of 0 and 364 (or 365 in leap years)
    # $isdst: whether or not it's in daylight saving time
     
    my ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst) = localtime($unix_timestamp);
     
    # necessary conversion of $mon and $year
    $mon += 1;
    $year += 1900;
     
    print "Current time: $year-$mon-$mday $hour:$min:$sec\n";

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/convert-local-time-unix-timestamp-perl.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni