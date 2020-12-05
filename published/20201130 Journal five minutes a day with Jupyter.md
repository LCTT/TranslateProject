[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12887-1.html)
[#]: subject: (Journal five minutes a day with Jupyter)
[#]: via: (https://opensource.com/article/20/11/daily-journal-jupyter)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

每天用 Jupyter 写 5 分钟的日记
======

> 用 Jupyter 和 Python 在你的日常写作背后实现一些自动化。

![](https://img.linux.net.cn/data/attachment/album/202012/05/131314woxpksatp2toe7tz.jpg)

有些人会遵循传统，制定一年的计划。不过，一年的时间很长，所以我以季节性的主题或轨迹来规划。每个季度，我都会坐下来，看看即将到来的三个月的季节，并决定在这段时间里我将努力做什么。

对于我最新的主题，我决定要每天写一篇日记。我喜欢有明确的承诺，所以我承诺每天写 5 分钟。我也喜欢有可观察的承诺，哪怕只是对我而言，所以我把我的记录放在 Git 里。

我决定在写日记的过程中实现一些自动化，于是我使用了我最喜欢的自动化工具：[Jupyter][2]。Jupyter 有一个有趣的功能 [ipywidgets][3]，这是一套用于 Jupyter Notebooks、JupyterLab 和 IPython 内核的交互式 HTML 组件。

如果你想跟着本文的代码走，请注意，让你的 JupyterLab 实例支持组件可能有点复杂，请按照[这些说明][4]来进行设置。

### 导入 ipywidgets 模块

首先，你需要导入一堆东西，比如 ipywidgets 和 [Twisted][5]。Twisted 模块可以用来创建一个异步时间计数器：

```
import twisted.internet.asyncioreactor
twisted.internet.asyncioreactor.install()
from twisted.internet import reactor, task
import ipywidgets, datetime, subprocess, functools, os
```

### 设置定时条目

用 Twisted 实现时间计数器是利用了 `task.LoopingCall`。然而，结束循环调用的唯一方法是用一个异常。倒计时时钟总会停止，所以你需要一个自定义的异常来指示“一切正常；计数器结束”：

```
class DoneError(Exception):
    pass
```

现在你已经写好了异常，你可以写定时器了。第一步是创建一个 `ipywidgets.Label` 的文本标签组件。循环使用 `divmod` 计算出分和秒，然后设置标签的文本值：

```
def time_out_counter(reactor):
    label = ipywidgets.Label("Time left: 5:00")
    current_seconds = datetime.timedelta(minutes=5).total_seconds()
    def decrement(count):
        nonlocal current_seconds
        current_seconds -= count
        time_left = datetime.timedelta(seconds=max(current_seconds, 0))
        minutes, left = divmod(time_left, minute)
        seconds = int(left.total_seconds())
        label.value = f"Time left: {minutes}:{seconds:02}"
        if current_seconds < 0:
            raise DoneError("finished")
    minute = datetime.timedelta(minutes=1)
    call = task.LoopingCall.withCount(decrement)
    call.reactor = reactor
    d = call.start(1)
    d.addErrback(lambda f: f.trap(DoneError))
    return d, label
```

### 从 Jupyter 组件中保存文本

下一步是写一些东西，将你输入的文字保存到一个文件中，并提交到 Git。另外，由于你要写 5 分钟的日记，你需要一个能给你提供写字区域的组件（滚动肯定是可以的，但一次能看到更多的文字就更好了）。

这就用到了组件 `Textarea`，这是一个你可以书写的文本字段，而 `Output` 则是用来给出反馈的。这一点很重要，因为 `git push` 可能会花点时间或失败，这取决于网络。如果备份失败，用反馈提醒用户很重要：

```
def editor(fname):
    textarea = ipywidgets.Textarea(continuous_update=False)
    textarea.rows = 20
    output = ipywidgets.Output()
    runner = functools.partial(subprocess.run, capture_output=True, text=True, check=True)
    def save(_ignored):
        with output:
            with open(fname, "w") as fpout:
                fpout.write(textarea.value)
            print("Sending...", end='')
            try:
                runner(["git", "add", fname])
                runner(["git", "commit", "-m", f"updated {fname}"])
                runner(["git", "push"])
            except subprocess.CalledProcessError as exc:
                print("Could not send")
                print(exc.stdout)
                print(exc.stderr)
            else:
                 print("Done")
    textarea.observe(save, names="value")
    return textarea, output, save
```

`continuous_update=False` 是为了避免每个字符都保存一遍并发送至 Git。相反，只要脱离输入焦点，它就会保存。这个函数也返回 `save` 函数，所以可以明确地调用它。

### 创建一个布局

最后，你可以使用 `ipywidgets.VBox` 把这些东西放在一起。这是一个包含一些组件并垂直显示的东西。还有一些其他的方法来排列组件，但这足够简单：

```
def journal():
    date = str(datetime.date.today())
    title = f"Log: Startdate {date}"
    filename = os.path.join(f"{date}.txt")
    d, clock = time_out_counter(reactor)
    textarea, output, save = editor(filename)
    box = ipywidgets.VBox([
        ipywidgets.Label(title),
        textarea,
        clock,
        output
    ])
    d.addCallback(save)
    return box
```

biu！你已经定义了一个写日记的函数了，所以是时候试试了。

```
journal()
```

![Jupyter journal][6]

你现在可以写 5 分钟了！

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/daily-journal-jupyter

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/tea-cup-mug-flowers-book-window.jpg?itok=JqThhl51 (Ceramic mug of tea or coffee with flowers and a book in front of a window)
[2]: https://jupyter.org/
[3]: https://ipywidgets.readthedocs.io/en/latest/
[4]: https://ipywidgets.readthedocs.io/en/latest/user_install.html
[5]: https://twistedmatrix.com/trac/
[6]: https://opensource.com/sites/default/files/uploads/journaling_output_13_0.png (Jupyter journal)
[7]: https://creativecommons.org/licenses/by-sa/4.0/
