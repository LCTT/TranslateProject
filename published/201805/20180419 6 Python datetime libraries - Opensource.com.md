6 个 Python 的日期时间库
=====

> 在 Python 中有许多库可以很容易地测试、转换和读取日期和时间信息。

![6 Python datetime libraries ](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/python-programming-code-keyboard.png?itok=fxiSpmnd "6 Python datetime libraries ")

图片由 [WOCinTech Chat][1] 提供，根据 Opensource.com 修改。[CC BY-SA 4.0][2]

_这篇文章是与 [Jeff Triplett][3] 一起合写的。_

曾几何时，我们中的一个人（Lacey）盯了一个多小时的 [Python 文档][4]中描述日期和时间格式化字符串的表格。当我试图编写从 API 中将日期时间字符串转换为 [Python datetime][5] 对象时，我很难理解其中的特定部分，因此我决定请求帮助。

有人问道：“为什么你不使用 `dateutil` 呢？”

读者，如果你没有从这个月的 Python 专栏中获得任何东西，只是学习到有比 datetime 的 `strptime` 更容易地将 datetime 字符串转换为 datetime 对象的方法，那么我们觉得就已经成功了。

但是，除了将字符串转换为更有用的 Python 对象之外，还有许多库都有一些有用的方法和工具，可以让您更轻松地进行时间测试、将时间转换为不同的时区、以人类可读的格式传递时间信息，等等。如果这是你在 Python 中第一次接触日期和时间，请暂停并阅读 _[如何使用 Python的日期和时间][6]_ 。要理解为什么在编程中处理日期和时间是困难的，请阅读 [愚蠢的程序员相信时间][7]。

这篇文章将会向你介绍以下库：

*   [Dateutil][8]
*   [Arrow][9]
*   [Moment][10]
*   [Maya][11]
*   [Delorean][12]
*   [Freezegun][13]

随意跳过那些你已经熟悉的库，专注于那些对你而言是新的库。

### 内建的 datetime 模块

在跳转到其他库之前，让我们回顾一下如何使用 `datetime` 模块将日期字符串转换为 Python datetime 对象。

假设我们从 API 接受到一个日期字符串，并且需要它作为 Python datetime 对象存在：

```
2018-04-29T17:45:25Z
```

这个字符串包括：

* 日期是 `YYYY-MM-DD` 格式的
* 字母 `T` 表示时间即将到来
* 时间是 `HH:II:SS` 格式的
* 表示此时间的时区指示符 `Z` 采用 UTC （详细了解[日期时间字符格式][19]）

要使用 `datetime` 模块将此字符串转换为 Python datetime 对象，你应该从 `strptime` 开始。 `datetime.strptime` 接受日期字符串和格式化字符并返回一个 Python datetime 对象。

我们必须手动将日期时间字符串的每个部分转换为 Python 的 `datetime.strptime` 可以理解的合适的格式化字符串。四位数年份由 `%Y` 表示，两位数月份是 `%m`，两位数的日期是 `%d`。在 24 小时制中，小时是 `%H`，分钟是 `%M`，秒是 `%S`。

为了得出这些结论，需要在[Python 文档][20]的表格中多加注意。

由于字符串中的 `Z` 表示此日期时间字符串采用 UTC，所以我们可以在格式中忽略此项。（现在，我们不会担心时区。）

转换的代码是这样的：

```
$ from datetime import datetime 
$ datetime.strptime('2018-04-29T17:45:25Z', '%Y-%m-%dT%H:%M:%SZ')
datetime.datetime(2018, 4, 29, 17, 45, 25)
```

格式字符串很难阅读和理解。我必须手动计算原始字符串中的字母 `T` 和 “Z”的位置，以及标点符号和格式化字符串，如 `%S` 和 `%m`。有些不太了解 datetime 的人阅读我的代码可能会发现它很难理解，尽管其含义已有文档记载，但它仍然很难阅读。

让我们看看其他库是如何处理这种转换的。

### Dateutil

[dateutil 模块][21]对 `datetime` 模块做了一些扩展。 

继续使用上面的解析示例，使用 `dateutil` 实现相同的结果要简单得多：

```
$ from dateutil.parser import parse
$ parse('2018-04-29T17:45:25Z')
datetime.datetime(2018, 4, 29, 17, 45, 25, tzinfo=tzutc())
```

如果字符串包含时区，那么 `dateutil` 解析器会自动返回字符串的时区。由于我们在 UTC 时区，你可以看到返回来一个 datetime 对象。如果你想解析完全忽略时区信息并返回原生的 datetime 对象，你可以传递 	`ignoretz=True` 来解析，如下所示：

```
$ from dateutil.parser import parse
$ parse('2018-04-29T17:45:25Z', ignoretz=True)
datetime.datetime(2018, 4, 29, 17, 45, 25)
```

`dateutil` 还可以解析其他人类可读的日期字符串：

```
$ parse('April 29th, 2018 at 5:45 pm')
datetime.datetime(2018, 4, 29, 17, 45)
```

`dateutil` 还提供了像 [relativedelta][22] 的工具，它用于计算两个日期时间之间的时间差或向日期时间添加或删除时间，[rrule][23] 创建重复日期时间，[tz][24] 用于解决时区以及其他工具。

### Arrow

[Arrow][25] 是另一个库，其目标是操作、格式化，以及处理对人类更友好的日期和时间。它包含 `dateutil`，根据其[文档][26]，它旨在“帮助你使用更少的包导入和更少的代码来处理日期和时间”。

要返回我们的解析示例，下面介绍如何使用 Arrow 将日期字符串转换为 Arrow 的 datetime 类的实例：

```
$ import arrow 
$ arrow.get('2018-04-29T17:45:25Z')
<Arrow [2018-04-29T17:45:25+00:00]>
```

你也可以在 `get()` 的第二个参数中指定格式，就像使用 `strptime` 一样，但是 Arrow 会尽力解析你给出的字符串，`get()` 返回 Arrow 的 `datetime` 类的一个实例。要使用 Arrow 来获取 Python datetime 对象，按照如下所示链式 datetime：

```
$ arrow.get('2018-04-29T17:45:25Z').datetime
datetime.datetime(2018, 4, 29, 17, 45, 25, tzinfo=tzutc())
```

通过 Arrow datetime 类的实例，你可以访问 Arrow 的其他有用方法。例如，它的 `humanize()` 方法将日期时间翻译成人类可读的短语，就像这样：

```
$ import arrow
$ utc = arrow.utcnow()
$ utc.humanize()
'seconds ago'
```

在 Arrow 的[文档][27]中阅读更多关于其有用方法的信息。

### Moment

[Moment][28] 的作者认为它是“内部测试版”，但即使它处于早期阶段，它也是非常受欢迎的，我们想来讨论它。

Moment 的方法将字符转换为其他更有用的东西很简单，类似于我们之前提到的库：

```
$ import moment
$ moment.date('2018-04-29T17:45:25Z')
<Moment(2018-04-29T17:45:25)>
```

就像其他库一样，它最初返回它自己的 datetime 类的实例，要返回 Python datetime 对象，添加额外的 `date()` 调用即可。

```
$ moment.date('2018-04-29T17:45:25Z').date
datetime.datetime(2018, 4, 29, 17, 45, 25, tzinfo=<StaticTzInfo 'Z'>)
```

这将 Moment datetime 类转换为 Python datetime 对象。

Moment 还提供了使用人类可读的语言创建新日期的方法。例如创建一个明天的日期：

```
$ moment.date("tomorrow")
<Moment(2018-04-06T11:24:42)>
```

它的 `add()` 和 `subtract()` 命令使用关键字参数来简化日期的操作。为了获得后天，Moment 会使用下面的代码：

```
$ moment.date("tomorrow").add(days=1)
<Moment(2018-04-07T11:26:48)>
```

### Maya

[Maya][29] 包含了 Python 中其他流行处理日期时间的库，包括 Humanize、 pytz 和 pendulum 等等。这个项目旨在让人们更容易处理日期。

Maya 的 README 包含几个有用的实例。以下是如何使用 Maya 来重新处理以前的解析示例：

```
$ import maya
$ maya.parse('2018-04-29T17:45:25Z').datetime()
datetime.datetime(2018, 4, 29, 17, 45, 25, tzinfo=<UTC>)
```

注意我们必须在 `maya.parse()` 之后调用 `datetime()`。如果我们跳过这一步，Maya 将会返回一个 MayaDT 类的示例：`<MayaDT epoch=1525023925.0>`。

由于 Maya 与 datetime 库中很多有用的方法重叠，因此它可以使用 MayaDT 类的实例执行诸如使用  `slang_time()` 方法将时间偏移量转换为纯文本语言，并将日期时间间隔保存在单个类的实例中。以下是如何使用 Maya 将日期时间表示为人类可读的短语：

```
$ import maya
$ maya.parse('2018-04-29T17:45:25Z').slang_time()
'23 days from now
```

显然，`slang_time()` 的输出将根据距离 datetime 对象相对较近或较远的距离而变化。


### Delorean

[Delorean][30]，以 《返回未来》 电影中的时间旅行汽车命名，它对于操纵日期时间特别有用，包括将日期时间转换为其他时区并添加或减去时间。

Delorean 需要有效的 Python datetime 对象才能工作，所以如果你需要使用时间字符串，最好将其与上述库中的一个配合使用。例如，将 Maya 与 Delorean 一起使用：

```
$ import maya 
$ d_t = maya.parse('2018-04-29T17:45:25Z').datetime()
```

现在，你有了一个 datetime 对象 d_t，你可以使用 Delorean 来做一些事情，例如将日期时间转换为美国东部时区：

```
$ from delorean import Delorean
$ d = Delorean(d_t)
$ d
Delorean(datetime=datetime.datetime(2018, 4, 29, 17, 45, 25), timezone='UTC')
$ d.shift('US/Eastern')
Delorean(datetime=datetime.datetime(2018, 4, 29, 13, 45, 25), timezone='US/Eastern')
```

看到小时是怎样从 17 变成 13 了吗？

你也可以使用自然语言方法来操作 datetime 对象。获取 2018 年 4 月 29 日之后的下个星期五（我们现在使用的）：

```
$ d.next_friday()
Delorean(datetime=datetime.datetime(2018, 5, 4, 13, 45, 25), timezone='US/Eastern')
```

在 Delorean 的[文档][31]中阅读更多关于其的用法。

### Freezegun

[Freezegun][32] 是一个可以帮助你在 Python 代码中测试特定日期的库。使用 `@freeze_time` 装饰器，你可以为测试用例设置特定的日期和时间，并且所有对 `datetime.datetime.now()`、 `datetime.datetime.utcnow()` 等的调用都将返回你指定的日期和时间。例如：


```
from freezegun import freeze_time
import datetime

@freeze_time("2017-04-14")
def test(): 
    assert datetime.datetime.now() == datetime.datetime(2017, 4, 14)
```

要跨时区进行测试，你可以将 `tz_offset` 参数传递给装饰器。`freeze_time` 装饰器也接受更简单的口语化日期，例如 `@freeze_time('April 4, 2017')`。

---

上面提到的每个库都提供了一组不同的特性和功能，也许很难决定哪一个最适合你的需要。[Maya 的作者][33], Kenneth Reitz 说到：“所有这些项目相辅相成，它们都是我们的朋友”。

这些库共享一些功能，但不是全部。有些擅长时间操作，有些擅长解析，但它们都有共同的目标，即让你对日期和时间的工作更轻松。下次你发现自己对 Python 的内置 datetime 模块感到沮丧，我们希望你可以选择其中的一个库进行试验。

---

via: [https://opensource.com/article/18/4/python-datetime-libraries][34]

作者: [Lacey Williams Hensche][35] 
选题: [lujun9972](https://github.com/lujun9972)
译者: [MjSeven](https://github.com/MjSeven)
校对: [wxy](https://github.com/wxy)

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
[39]: https://github.com/LCTT/TranslateProject
[40]: https://linux.cn/
