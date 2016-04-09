Linux有问必答：Perl中本地时间和UNIX时间戳间相互转换
================================================================================
> **问题**: 在Perl语言中，我需要转换易读的日期和时间到对应的UNIX时间戳，反之亦然。你可以给我一些将日期及时间转换到UNIX时间戳的Perl代码例子吗？或者相反，转换UNIX时间戳到可读的日期和时间。

当你的Perl脚本需要解决时间信息，这里有两种方法来表示和处理日期和时间。一种方法是易读的时间表示（例，"Sat Mar 14 10:14:05 EDT 2015"），另外一种是使用UNIX时间戳（也叫“新纪元时间”），这是从1970年1月1日到今所经过的时间秒数。每一种方法都有它自己的优劣势，取决于你的需要，也许也就需要转换一种格式到另一种。

### Perl中转换本地时间到UNIX时间戳 ###

为了从日期字符串中获得UNIX时间，可以使用Date::Parse模块中str2time()函数。此函数可以处理多种格式，例如：

- Sat Mar 14 10:14:05 EDT 2015
- 3/14/2015 10:14:05 -0400
- 14/Mar/15 10:14:05
- 14 Mar 15 10:14:05 

```
use Date::Parse;
     
my $local_time = "Sat Mar 14 10:14:05 EDT 2015";
     
# 1426342445 will be stored in $unix_time
my $unix_time = str2time($local_time);
```
Date:Parse 模块支持多种语言（英语，法语，德语和意大利语）和时区。例如:

    use Date::Parse;
    use Date::Language;
     
    my $lang = Date::Language->new('French');
    my $unix_time = $lang->str2time("12:14:05, Ago 16, 2014 (CEST)");

### Perl中UNIX时间戳到易读的日期和时间 ###

如果你想要转换UNIX时间戳到易读的格式，可以使用localtime()函数，此函数可以转换UNIX时间戳为一个9元素列表。然后你可以使用返回的list构造任何你需要的可读格式。这里有一个代码片段：

    # $sec, $min, $hour: 秒,分,时
    # $mday: 月中的某天 (0-31)
    # $mon: 月份，范围 0 (一月) 至 11 (十二月)
    # $year: 年份，与1900年的差值(2015年为2015-1900=115)
    # $wday: 星期，范围 0 (星期天) 至 6 (星期六)
    # $yday: 年中的某天，范围 0 至 364 (或 365 闰年)
    # $isdst: 是否是夏令时
     
    my ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst) = localtime($unix_timestamp);
     
    # necessary conversion of $mon and $year
    $mon += 1;
    $year += 1900;
     
    print "Current time: $year-$mon-$mday $hour:$min:$sec\n";

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/convert-local-time-unix-timestamp-perl.html

作者：[Dan Nanni][a]
译者：[VicYu/Vic020](http://vicyu.net)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
