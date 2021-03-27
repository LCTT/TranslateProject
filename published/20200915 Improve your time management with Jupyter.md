[#]: collector: (lujun9972)
[#]: translator: (stevenzdg988)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13212-1.html)
[#]: subject: (Improve your time management with Jupyter)
[#]: via: (https://opensource.com/article/20/9/calendar-jupyter)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

使用 Jupyter 改善你的时间管理
======

> 在 Jupyter 里使用 Python 来分析日历，以了解你是如何使用时间的。

![](https://img.linux.net.cn/data/attachment/album/202103/18/095530cxx6663ptypyzvmx.jpg)

[Python][2] 在探索数据方面具有令人难以置信的可扩展性。利用 [Pandas][3] 或 [Dask][4]，你可以将 [Jupyter][5] 扩展到大数据领域。但是小数据、个人资料、私人数据呢？

JupyterLab 和 Jupyter Notebook 为我提供了一个绝佳的环境，可以让我审视我的笔记本电脑生活。

我的探索是基于以下事实：我使用的几乎每个服务都有一个 Web API。我使用了诸多此类服务：待办事项列表、时间跟踪器、习惯跟踪器等。还有一个几乎每个人都会使用到：_日历_。相同的思路也可以应用于其他服务，但是日历具有一个很酷的功能：几乎所有 Web 日历都支持的开放标准 —— CalDAV。

### 在 Jupyter 中使用 Python 解析日历

大多数日历提供了导出为 CalDAV 格式的方法。你可能需要某种身份验证才能访问这些私有数据。按照你的服务说明进行操作即可。如何获得凭据取决于你的服务，但是最终，你应该能够将这些凭据存储在文件中。我将我的凭据存储在根目录下的一个名为 `.caldav` 的文件中：

```
import os
with open(os.path.expanduser("~/.caldav")) as fpin:
    username, password = fpin.read().split()
```

切勿将用户名和密码直接放在 Jupyter Notebook 的笔记本中！它们可能会很容易因 `git push` 的错误而导致泄漏。

下一步是使用方便的 PyPI [caldav][6] 库。我找到了我的电子邮件服务的 CalDAV 服务器（你可能有所不同）：

```
import caldav
client = caldav.DAVClient(url="https://caldav.fastmail.com/dav/", username=username, password=password)
```

CalDAV 有一个称为 `principal`（主键）的概念。它是什么并不重要，只要知道它是你用来访问日历的东西就行了：

```
principal = client.principal()
calendars = principal.calendars()
```

从字面上讲，日历就是关于时间的。访问事件之前，你需要确定一个时间范围。默认一星期就好：

```
from dateutil import tz
import datetime
now = datetime.datetime.now(tz.tzutc())
since = now - datetime.timedelta(days=7)
```

大多数人使用的日历不止一个，并且希望所有事件都在一起出现。`itertools.chain.from_iterable` 方法使这一过程变得简单：

```
import itertools

raw_events = list(
    itertools.chain.from_iterable(
        calendar.date_search(start=since, end=now, expand=True)
        for calendar in calendars
    )
)
```

将所有事件读入内存很重要，以 API 原始的本地格式进行操作是重要的实践。这意味着在调整解析、分析和显示代码时，无需返回到 API 服务刷新数据。

但 “原始” 真的是原始，事件是以特定格式的字符串出现的：

```
print(raw_events[12].data)
```

```
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

幸运的是，PyPI 可以再次使用另一个辅助库 [vobject][7] 解围：

```
import io
import vobject

def parse_event(raw_event):
    data = raw_event.data
    parsed = vobject.readOne(io.StringIO(data))
    contents = parsed.vevent.contents
    return contents
```

```
parse_event(raw_events[12])
```

```
    {'dtend': [<DTEND{}2020-08-25 23:00:00+00:00>],
     'dtstamp': [<DTSTAMP{}2020-08-25 18:19:15+00:00>],
     'dtstart': [<DTSTART{}2020-08-25 22:00:00+00:00>],
     'summary': [<SUMMARY{}Busy>],
     'uid': [<UID{}1302728i-040000008200E00074C5B7101A82E00800000000D939773EA578D601000000000000000010000000CD71CC3393651B419E9458134FE840F5>]}
```

好吧，至少好一点了。

仍有一些工作要做，将其转换为合理的 Python 对象。第一步是 _拥有_ 一个合理的 Python 对象。[attrs][8] 库提供了一个不错的开始：

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

是时候编写转换代码了！

第一个抽象从解析后的字典中获取值，不需要所有的装饰：

```
def get_piece(contents, name):
    return contents[name][0].value
get_piece(_, "dtstart")
    datetime.datetime(2020, 8, 25, 22, 0, tzinfo=tzutc())
```

日历事件总有一个“开始”、有一个“结束”、有一个 “持续时间”。一些谨慎的解析逻辑可以将两者协调为同一个 Python 对象：

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

将事件放在 _本地_ 时区而不是 UTC 中很有用，因此使用本地时区：

```
my_timezone = tz.gettz()
from_calendar_event_and_timezone(raw_events[12], my_timezone)
    Event(start=datetime.datetime(2020, 8, 25, 22, 0, tzinfo=tzutc()), end=datetime.datetime(2020, 8, 25, 23, 0, tzinfo=tzutc()), timezone=tzfile('/etc/localtime'), summary='Busy')
```

既然事件是真实的 Python 对象，那么它们实际上应该具有附加信息。幸运的是，可以将方法添加到类中。

但是要弄清楚哪个事件发生在哪一天不是很直接。你需要在 _本地_ 时区中选择一天：

```
def day(self):
    offset = self.timezone.utcoffset(self.start)
    fixed = self.start + offset
    return fixed.date()
Event.day = property(day)
```

```
print(_.day)
    2020-08-25
```

事件在内部始终是以“开始”/“结束”的方式表示的，但是持续时间是有用的属性。持续时间也可以添加到现有类中：

```
def duration(self):
    return self.end - self.start
Event.duration = property(duration)
```

```
print(_.duration)
    1:00:00
```

现在到了将所有事件转换为有用的 Python 对象了：

```
all_events = [from_calendar_event_and_timezone(raw_event, my_timezone)
              for raw_event in raw_events]
```

全天事件是一种特例，可能对分析生活没有多大用处。现在，你可以忽略它们：

```
# ignore all-day events
all_events = [event for event in all_events if not type(event.start) == datetime.date]
```

事件具有自然顺序 —— 知道哪个事件最先发生可能有助于分析：

```
all_events.sort(key=lambda ev: ev.start)
```

现在，事件已排序，可以将它们加载到每天：

```
import collections
events_by_day = collections.defaultdict(list)
for event in all_events:
    events_by_day[event.day].append(event)
```

有了这些，你就有了作为 Python 对象的带有日期、持续时间和序列的日历事件。

### 用 Python 报到你的生活

现在是时候编写报告代码了！带有适当的标题、列表、重要内容以粗体显示等等，有醒目的格式是很意义。

这就是一些 HTML 和 HTML 模板。我喜欢使用 [Chameleon][9]：

```
template_content = """
<html><body>
<div tal:repeat="item items">
<h2 tal:content="item[0]">Day</h2>
<ul>
    <li tal:repeat="event item[1]"><span tal:replace="event">Thing</span></li>
</ul>
</div>
</body></html>"""
```

Chameleon 的一个很酷的功能是使用它的 `html` 方法渲染对象。我将以两种方式使用它：

  * 摘要将以粗体显示
  * 对于大多数活动，我都会删除摘要（因为这是我的个人信息）

```
def __html__(self):
    offset = my_timezone.utcoffset(self.start)
    fixed = self.start + offset
    start_str = str(fixed).split("+")[0]
    summary = self.summary
    if summary != "Busy":
        summary = "&lt;REDACTED&gt;"
    return f"<b>{summary[:30]}</b> -- {start_str} ({self.duration})"
Event.__html__ = __html__
```

为了简洁起见，将该报告切成每天的：

```
import chameleon
from IPython.display import HTML
template = chameleon.PageTemplate(template_content)
html = template(items=itertools.islice(events_by_day.items(), 3, 4))
HTML(html)
```

渲染后，它将看起来像这样：

**2020-08-25**

- **\<REDACTED>** -- 2020-08-25 08:30:00 (0:45:00)
- **\<REDACTED>** -- 2020-08-25 10:00:00 (1:00:00)
- **\<REDACTED>** -- 2020-08-25 11:30:00 (0:30:00)
- **\<REDACTED>** -- 2020-08-25 13:00:00 (0:25:00)
- Busy -- 2020-08-25 15:00:00 (1:00:00)
- **\<REDACTED>** -- 2020-08-25 15:00:00 (1:00:00)
- **\<REDACTED>** -- 2020-08-25 19:00:00 (1:00:00)
- **\<REDACTED>** -- 2020-08-25 19:00:12 (1:00:00)

### Python 和 Jupyter 的无穷选择

通过解析、分析和报告各种 Web 服务所拥有的数据，这只是你可以做的事情的表面。

为什么不对你最喜欢的服务试试呢？

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/calendar-jupyter

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[stevenzdg988](https://github.com/stevenzdg988)
校对：[wxy](https://github.com/wxy)

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
