# 6 Python datetime libraries

### There are a host of libraries that make it simpler to test, convert, and read date and time information in Python.

![6 Python datetime libraries ](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/python-programming-code-keyboard.png?itok=fxiSpmnd "6 Python datetime libraries ")

Image by : 

[WOCinTech Chat][1]. Modified by Opensource.com. [CC BY-SA 4.0][2]

### Get the newsletter

Join the 85,000 open source advocates who receive our giveaway alerts and article roundups.

_This article was co-written with [Jeff Triplett][3]._

Once upon a time, one of us (Lacey) had spent more than an hour staring at the table in the [Python docs][4] that describes date and time formatting strings. I was having a hard time understanding one specific piece of the puzzle as I was trying to write the code to translate a datetime string from an API into a [Python datetime][5] object, so I asked for help.

"Why don't you just use dateutil?" someone asked.

Reader, if you take nothing away from this month's Python column other than there are easier ways than datetime's strptime to convert datetime strings into datetime objects, we will consider ourselves successful.

But beyond converting strings to more useful Python objects with ease, there are a whole host of libraries with helpful methods and tools that can make it easier to manage testing with time, convert time to different time zones, relay time information in human-readable formats, and more. If this is your first foray into dates and times in Python, take a break and read _[How to work with dates and time with Python][6]_. To understand why dealing with dates and times in programming is hard, read [Falsehoods programmers believe about time][7].

This article will introduce you to:

*   [Dateutil][8]
*   [Arrow][9]
*   [Moment][10]
*   [Maya][11]
*   [Delorean][12]
*   [Freezegun][13]

Feel free to skip the ones you're already familiar with and focus on the libraries that are new to you.

### The built-in datetime module

More Python Resources

*   [What is Python?][14]
*   [Top Python IDEs][15]
*   [Top Python GUI frameworks][16]
*   [Latest Python content][17]
*   [More developer resources][18]

Before jumping into other libraries, let's review how we might convert a date string to a Python datetime object using the datetime module.

Say we receive this date string from an API and need it to exist as a Python datetime object:

2018-04-29T17:45:25Z

This string includes:

*   The date in YYYY-MM-DD format
*   The letter "T" to indicate that a time is coming
*   The time in HH:II:SS format
*   A time zone designator "Z," which indicates this time is in UTC (read more about [datetime string formatting][19])

To convert this string to a Python datetime object using the datetime module, you would start with  strptime . datetime.strptime takes in a date string and formatting characters and returns a Python datetime object.

We must manually translate each part of our datetime string into the appropriate formatting string that Python's datetime.strptime can understand. The four-digit year is represented by %Y. The two-digit month is %m. The two-digit day is %d. Hours in a 24-hour clock are %H, and zero-padded minutes are %M. Zero-padded seconds are %S.

Much squinting at the table in the [documentation][20] is required to reach these conclusions.

Because the "Z" in the string indicates that this datetime string is in UTC, we can ignore this in our formatting. (Right now, we won't worry about time zones.)

The code for this conversion would look like this:

```
$ from datetime import datetime 


$ datetime.strptime('2018-04-29T17:45:25Z', '%Y-%m-%dT%H:%M:%SZ')


datetime.datetime(2018, 4, 29, 17, 45, 25)
```

The formatting string is hard to read and understand. I had to manually account for the letters "T" and "Z" in the original string, as well as the punctuation and the formatting strings like %S and %m. Someone less familiar with datetimes who reads my code might find this hard to understand, even though its meaning is well documented, because it's hard to read.

Let's look at how other libraries handle this kind of conversion.

### Dateutil

The [dateutil module][21] provides extensions to the datetime module.

To continue with our parsing example above, achieving the same result with dateutil is much simpler:

```
$ from dateutil.parser import parse


$ parse('2018-04-29T17:45:25Z')


datetime.datetime(2018, 4, 29, 17, 45, 25, tzinfo=tzutc())
```

The dateutil parser will automatically return the string's time zone if it's included. Since ours was in UTC, you can see that the datetime object returned that. If you want parse to ignore time zone information entirely and return a naive datetime object, you can pass the parameter ignoretz=True to parse like so:

```
$ from dateutil.parser import parse


$ parse('2018-04-29T17:45:25Z', ignoretz=True)


datetime.datetime(2018, 4, 29, 17, 45, 25)
```

Dateutil can also parse more human-readable date strings:

```
$ parse('April 29th, 2018 at 5:45 pm')


datetime.datetime(2018, 4, 29, 17, 45)
```

dateutil also offers tools like [relativedelta][22] for calculating the time difference between two datetimes or adding/removing time to/from a datetime, [rrule][23] for creating recurring datetimes, and [tz][24] for dealing with time zones, among other tools.

### Arrow

[Arrow][25] is another library with the goal of making manipulating, formatting, and otherwise dealing with dates and times friendlier to humans. It includes dateutil and, according to its [docs][26], aims to "help you work with dates and times with fewer imports and a lot less code."

To return to our parsing example, here is how you would use Arrow to convert a date string to an instance of Arrow's datetime class:

```
$ import arrow 


$ arrow.get('2018-04-29T17:45:25Z')


<Arrow [2018-04-29T17:45:25+00:00]>
```

You can also specify the format in a second argument to get(), just like with strptime, but Arrow will do its best to parse the string you give it on its own. get() returns an instance of Arrow's datetime class. To use Arrow to get a Python datetime object, chain datetime as follows:

```
$ arrow.get('2018-04-29T17:45:25Z').datetime


datetime.datetime(2018, 4, 29, 17, 45, 25, tzinfo=tzutc())
```

With the instance of the Arrow datetime class, you have access to Arrow's other helpful methods. For example, its humanize() method translates datetimes into human-readable phrases, like so:

```
$ import arrow


$ utc = arrow.utcnow()


$ utc.humanize()


'seconds ago'
```

Read more about Arrow's useful methods in its [documentation][27].

### Moment

[Moment][28]'s creator considers it "alpha quality," but even though it's in early stages, it is well-liked and we wanted to mention it.

Moment's method for converting a string to something more useful is simple, similar to the previous libraries we've mentioned:

```
$ import moment


$ moment.date('2018-04-29T17:45:25Z')


<Moment(2018-04-29T17:45:25)>
```

Like other libraries, it initially returns an instance of its own datetime class. To return a Python datetime object, add another date() call.

```
$ moment.date('2018-04-29T17:45:25Z').date


datetime.datetime(2018, 4, 29, 17, 45, 25, tzinfo=<StaticTzInfo 'Z'>)
```

This will convert the Moment datetime class to a Python datetime object.

Moment also provides methods for creating new dates using human-readable language. To create a date for tomorrow:

```
$ moment.date("tomorrow")


<Moment(2018-04-06T11:24:42)>
```

Its add and subtract commands take keyword arguments to make manipulating your dates simple, as well. To get the day after tomorrow, Moment would use this code:

```
$ moment.date("tomorrow").add(days=1)


<Moment(2018-04-07T11:26:48)>
```

### Maya

[Maya][29] includes other popular libraries that deal with datetimes in Python, including Humanize, pytz, and pendulum, among others. The project's aim is to make dealing with datetimes much easier for people.

Maya's README includes several useful examples. Here is how to use Maya to reproduce the parsing example from before:

```
$ import maya


$ maya.parse('2018-04-29T17:45:25Z').datetime()


datetime.datetime(2018, 4, 29, 17, 45, 25, tzinfo=<UTC>)
```

Note that we have to call .datetime() after maya.parse(). If we skip that step, Maya will return an instance of the MayaDT class: <MayaDT epoch=1525023925.0>.

Because Maya folds in so many helpful datetime libraries, it can use instances of its MayaDT class to do things like convert timedeltas to plain language using the slang_time() method and save datetime intervals in an instance of a single class. Here is how to use Maya to represent a datetime as a human-readable phrase:

```
$ import maya


$ maya.parse('2018-04-29T17:45:25Z').slang_time()


'23 days from now
```

Obviously, the output from slang_time() will change depending on how relatively close or far away you are from your datetime object.

### Delorean

[Delorean][30], named for the time-traveling car in the _Back to the Future_ movies, is particularly helpful for manipulating datetimes: converting datetimes to other time zones and adding or subtracting time.

Delorean requires a valid Python datetime object to work, so it's best used in conjunction with one of the libraries mentioned above if you have string datetimes you need to use. To use Delorean with Maya, for example:

```
$ import maya 


$ d_t = maya.parse('2018-04-29T17:45:25Z').datetime()
```

Now, with the datetime object d_t at your disposal, you can do things with Delorean like convert the datetime to the U.S. Eastern time zone:

```
$ from delorean import Delorean


$ d = Delorean(d_t)


$ d


Delorean(datetime=datetime.datetime(2018, 4, 29, 17, 45, 25), timezone='UTC')


$ d.shift('US/Eastern')


Delorean(datetime=datetime.datetime(2018, 4, 29, 13, 45, 25), timezone='US/Eastern')
```

See how the hours changed from 17 to 13?

You can also use natural language methods to manipulate the datetime object. To get the next Friday following April 29, 2018 (the date we've been using):

```
$ d.next_friday()


Delorean(datetime=datetime.datetime(2018, 5, 4, 13, 45, 25), timezone='US/Eastern')
```

Read more about Delorean in its [documentation][31].

### Freezegun

[Freezegun][32] is a library that helps you test with specific datetimes in your Python code. Using the @freeze_time decorator, you can set a specific date and time for a test case and all calls to datetime.datetime.now(), datetime.datetime.utcnow(), etc. will return the date and time you specified. For example:

```
from freezegun import freeze_time


import datetime





@freeze_time("2017-04-14")


def test():


 
 
assert datetime.datetime.now() == datetime.datetime(2017, 4, 14)
```

To test across time zones, you can pass a tz_offset argument to the decorator. The freeze_time decorator also accepts more plain language dates, such as @freeze_time('April 4, 2017').

---

Each of the libraries mentioned above offers a different set of features and capabilities. It might be difficult to decide which one best suits your needs. [Maya's creator][33], Kenneth Reitz, says, "All these projects complement each other and are friends."

These libraries share some features, but not others. Some are good at time manipulation, others excel at parsing. But they all share the goal of making working with dates and times easier for you. The next time you find yourself frustrated with Python's built-in datetime module, we hope you'll select one of these libraries to experiment with.

---

via: [https://opensource.com/article/18/4/python-datetime-libraries][34]

作者: [Lacey Williams Hensche][35] 选题者: [@lujun9972][36] 译者: [译者ID][37] 校对: [校对者ID][38]

本文由 [LCTT][39] 原创编译，[Linux中国][40] 荣誉推出

[1]: https://www.flickr.com/photos/wocintechchat/25926664911/
[2]: https://creativecommons.org/licenses/by/4.0/
[3]: https://opensource.com/users/jefftriplett
[4]: https://docs.python.org/3/library/datetime.html#strftime-strptime-behavior
[5]: https://opensource.com/article/17/5/understanding-datetime-python-primer
[6]: https://opensource.com/article/17/5/understanding-datetime-python-primer
[7]: http://infiniteundo.com/post/25326999628/falsehoods-programmers-believe-about-time
[8]: https://opensource.com/#Dateutil
[9]: https://opensource.com/#Arrow
[10]: https://opensource.com/#Moment
[11]: https://opensource.com/#Maya
[12]: https://opensource.com/#Delorean
[13]: https://opensource.com/#Freezegun
[14]: https://opensource.com/resources/python?intcmp=7016000000127cYAAQ
[15]: https://opensource.com/resources/python/ides?intcmp=7016000000127cYAAQ
[16]: https://opensource.com/resources/python/gui-frameworks?intcmp=7016000000127cYAAQ
[17]: https://opensource.com/tags/python?intcmp=7016000000127cYAAQ
[18]: https://developers.redhat.com/?intcmp=7016000000127cYAAQ
[19]: https://www.w3.org/TR/NOTE-datetime
[20]: https://docs.python.org/3/library/datetime.html#strftime-strptime-behavior
[21]: https://dateutil.readthedocs.io/en/stable/
[22]: https://dateutil.readthedocs.io/en/stable/relativedelta.html
[23]: https://dateutil.readthedocs.io/en/stable/rrule.html
[24]: https://dateutil.readthedocs.io/en/stable/tz.html
[25]: https://github.com/crsmithdev/arrow
[26]: https://pypi.python.org/pypi/arrow-fatisar/0.5.3
[27]: https://arrow.readthedocs.io/en/latest/
[28]: https://github.com/zachwill/moment
[29]: https://github.com/kennethreitz/maya
[30]: https://github.com/myusuf3/delorean
[31]: https://delorean.readthedocs.io/en/latest/
[32]: https://github.com/spulec/freezegun
[33]: https://github.com/kennethreitz/maya
[34]: https://opensource.com/article/18/4/python-datetime-libraries
[35]: https://opensource.com/users/laceynwilliams
[36]: https://github.com/lujun9972
[37]: https://github.com/译者ID
[38]: https://github.com/校对者ID
[39]: https://github.com/LCTT/TranslateProject
[40]: https://linux.cn/