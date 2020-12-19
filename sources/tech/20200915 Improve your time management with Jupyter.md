[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Improve your time management with Jupyter)
[#]: via: (https://opensource.com/article/20/9/calendar-jupyter)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

Improve your time management with Jupyter
======
Discover how you are spending time by parsing your calendar with Python
in Jupyter.
![Calendar close up snapshot][1]

[Python][2] has incredibly scalable options for exploring data. With [Pandas][3] or [Dask][4], you can scale [Jupyter][5] up to big data. But what about small data? Personal data? Private data?

JupyterLab and Jupyter Notebook provide a great environment to scrutinize my laptop-based life.

My exploration is powered by the fact that almost every service I use has a web application programming interface (API). I use many such services: a to-do list, a time tracker, a habit tracker, and more. But there is one that almost everyone uses: _a calendar_. The same ideas can be applied to other services, but calendars have one cool feature: an open standard that almost all web calendars support: `CalDAV`.

### Parsing your calendar with Python in Jupyter

Most calendars provide a way to export into the `CalDAV` format. You may need some authentication for accessing this private data. Following your service's instructions should do the trick. How you get the credentials depends on your service, but eventually, you should be able to store them in a file. I store mine in my root directory in a file called `.caldav`:


```
import os
with open(os.path.expanduser("~/.caldav")) as fpin:
    username, password = fpin.read().split()
```

Never put usernames and passwords directly in notebooks! They could easily leak with a stray `git push`.

The next step is to use the convenient PyPI [caldav][6] library. I looked up the CalDAV server for my email service (yours may be different):


```
import caldav
client = caldav.DAVClient(url="<https://caldav.fastmail.com/dav/>", username=username, password=password)
```

CalDAV has a concept called the `principal`. It is not important to get into right now, except to know it's the thing you use to access the calendars:


```
principal = client.principal()
calendars = principal.calendars()
```

Calendars are, literally, all about time. Before accessing events, you need to decide on a time range. One week should be a good default:


```
from dateutil import tz
import datetime
now = datetime.datetime.now(tz.tzutc())
since = now - datetime.timedelta(days=7)
```

Most people use more than one calendar, and most people want all their events together. The `itertools.chain.from_iterable` makes this straightforward: ` `


```
import itertools

raw_events = list(
    itertools.chain.from_iterable(
        calendar.date_search(start=since, end=now, expand=True)
        for calendar in calendars
    )
)
```

Reading all the events into memory is important, and doing so in the API's raw, native format is an important practice. This means that when fine-tuning the parsing, analyzing, and displaying code, there is no need to go back to the API service to refresh the data.

But "raw" is not an understatement. The events come through as strings in a specific format:


```
`print(raw_events[12].data)`[/code] [code]

    BEGIN:VCALENDAR
    VERSION:2.0
    PRODID:-//CyrusIMAP.org/Cyrus
     3.3.0-232-g4bdb081-fm-20200825.002-g4bdb081a//EN
    BEGIN:VEVENT
    DTEND:20200825T230000Z
    DTSTAMP:20200825T181915Z
    DTSTART:20200825T220000Z
    SUMMARY:Busy
    UID:
     1302728i-040000008200E00074C5B7101A82E00800000000D939773EA578D601000000000
     000000010000000CD71CC3393651B419E9458134FE840F5
    END:VEVENT
    END:VCALENDAR
```

Luckily, PyPI comes to the rescue again with another helper library, [vobject][7]:


```
import io
import vobject

def parse_event(raw_event):
    data = raw_event.data
    parsed = vobject.readOne(io.StringIO(data))
    contents = parsed.vevent.contents
    return contents

[/code] [code]`parse_event(raw_events[12])`[/code] [code]

    {'dtend': [&lt;DTEND{}2020-08-25 23:00:00+00:00&gt;],
     'dtstamp': [&lt;DTSTAMP{}2020-08-25 18:19:15+00:00&gt;],
     'dtstart': [&lt;DTSTART{}2020-08-25 22:00:00+00:00&gt;],
     'summary': [&lt;SUMMARY{}Busy&gt;],
     'uid': [&lt;UID{}1302728i-040000008200E00074C5B7101A82E00800000000D939773EA578D601000000000000000010000000CD71CC3393651B419E9458134FE840F5&gt;]}
```

Well, at least it's a little better.

There is still some work to do to convert it to a reasonable Python object. The first step is to _have_ a reasonable Python object. The [attrs][8] library provides a nice start:


```
import attr
from __future__ import annotations
@attr.s(auto_attribs=True, frozen=True)
class Event:
    start: datetime.datetime
    end: datetime.datetime
    timezone: Any
    summary: str
```

Time to write the conversion code!

The first abstraction gets the value from the parsed dictionary without all the decorations:


```
def get_piece(contents, name):
    return contents[name][0].value

[/code] [code]`get_piece(_, "dtstart")`[/code] [code]`    datetime.datetime(2020, 8, 25, 22, 0, tzinfo=tzutc())`
```

Calendar events always have a start, but they sometimes have an "end" and sometimes a "duration." Some careful parsing logic can harmonize both into the same Python objects:


```
def from_calendar_event_and_timezone(event, timezone):
    contents = parse_event(event)
    start = get_piece(contents, "dtstart")
    summary = get_piece(contents, "summary")
    try:
        end = get_piece(contents, "dtend")
    except KeyError:
        end = start + get_piece(contents, "duration")
    return Event(start=start, end=end, summary=summary, timezone=timezone)
```

Since it is useful to have the events in your _local_ time zone rather than UTC, this uses the local timezone:


```
`my_timezone = tz.gettz()`[/code] [code]`from_calendar_event_and_timezone(raw_events[12], my_timezone)`[/code] [code]`    Event(start=datetime.datetime(2020, 8, 25, 22, 0, tzinfo=tzutc()), end=datetime.datetime(2020, 8, 25, 23, 0, tzinfo=tzutc()), timezone=tzfile('/etc/localtime'), summary='Busy')`
```

Now that the events are real Python objects, they really should have some additional information. Luckily, it is possible to add methods retroactively to classes.

But figuring which _day_ an event happens is not that obvious. You need the day in the _local_ timezone:


```
def day(self):
    offset = self.timezone.utcoffset(self.start)
    fixed = self.start + offset
    return fixed.date()
Event.day = property(day)

[/code] [code]`print(_.day)`[/code] [code]`    2020-08-25`
```

Events are always represented internally as start/end, but knowing the duration is a useful property. Duration can also be added to the existing class:


```
def duration(self):
    return self.end - self.start
Event.duration = property(duration)

[/code] [code]`print(_.duration)`[/code] [code]`    1:00:00`
```

Now it is time to convert all events into useful Python objects:


```
all_events = [from_calendar_event_and_timezone(raw_event, my_timezone)
              for raw_event in raw_events]
```

All-day events are a special case and probably less useful for analyzing life. For now, you can ignore them:


```
# ignore all-day events
all_events = [event for event in all_events if not type(event.start) == datetime.date]
```

Events have a natural order—knowing which one happened first is probably useful for analysis:


```
`all_events.sort(key=lambda ev: ev.start)`
```

Now that the events are sorted, they can be broken into days:


```
import collections
events_by_day = collections.defaultdict(list)
for event in all_events:
    events_by_day[event.day].append(event)
```

And with that, you have calendar events with dates, duration, and sequence as Python objects.

### Reporting on your life in Python

Now it is time to write reporting code! It is fun to have eye-popping formatting with proper headers, lists, important things in bold, etc.

This means HTML and some HTML templating. I like to use [Chameleon][9]:


```
template_content = """
&lt;html&gt;&lt;body&gt;
&lt;div tal:repeat="item items"&gt;
&lt;h2 tal:content="item[0]"&gt;Day&lt;/h2&gt;
&lt;ul&gt;
    &lt;li tal:repeat="event item[1]"&gt;&lt;span tal:replace="event"&gt;Thing&lt;/span&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;/div&gt;
&lt;/body&gt;&lt;/html&gt;"""
```

One cool feature of Chameleon is that it will render objects using its `html` method. I will use it in two ways:

  * The summary will be in **bold**
  * For most events, I will remove the summary (since this is my personal information)




```
def __html__(self):
    offset = my_timezone.utcoffset(self.start)
    fixed = self.start + offset
    start_str = str(fixed).split("+")[0]
    summary = self.summary
    if summary != "Busy":
        summary = "&amp;lt;REDACTED&amp;gt;"
    return f"&lt;b&gt;{summary[:30]}&lt;/b&gt; \-- {start_str} ({self.duration})"
Event.__html__ = __html__
```

In the interest of brevity, the report will be sliced into one day's worth.


```
import chameleon
from IPython.display import HTML
template = chameleon.PageTemplate(template_content)
html = template(items=itertools.islice(events_by_day.items(), 3, 4))
HTML(html)
```

#### When rendered, it will look something like this:

#### 2020-08-25

  * **&lt;REDACTED&gt;** \-- 2020-08-25 08:30:00 (0:45:00)
  * **&lt;REDACTED&gt;** \-- 2020-08-25 10:00:00 (1:00:00)
  * **&lt;REDACTED&gt;** \-- 2020-08-25 11:30:00 (0:30:00)
  * **&lt;REDACTED&gt;** \-- 2020-08-25 13:00:00 (0:25:00)
  * **Busy** \-- 2020-08-25 15:00:00 (1:00:00)
  * **&lt;REDACTED&gt;** \-- 2020-08-25 15:00:00 (1:00:00)
  * **&lt;REDACTED&gt;** \-- 2020-08-25 19:00:00 (1:00:00)
  * **&lt;REDACTED&gt;** \-- 2020-08-25 19:00:12 (1:00:00)



### Endless options with Python and Jupyter

This only scratches the surface of what you can do by parsing, analyzing, and reporting on the data that various web services have on you.

Why not try it with your favorite service?

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/calendar-jupyter

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/calendar.jpg?itok=jEKbhvDT (Calendar close up snapshot)
[2]: https://opensource.com/resources/python
[3]: https://pandas.pydata.org/
[4]: https://dask.org/
[5]: https://jupyter.org/
[6]: https://pypi.org/project/caldav/
[7]: https://pypi.org/project/vobject/
[8]: https://opensource.com/article/19/5/python-attrs
[9]: https://chameleon.readthedocs.io/en/latest/
