[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Journal five minutes a day with Jupyter)
[#]: via: (https://opensource.com/article/20/11/daily-journal-jupyter)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

Journal five minutes a day with Jupyter
======
Put some automation behind your daily writing with Jupyter and Python.
![Ceramic mug of tea or coffee with flowers and a book in front of a window][1]

Some people follow the tradition of creating New Year's resolutions. A year is a long time, though, so I plan with a seasonal theme or trajectory. Each quarter, I sit down and look at the upcoming three-month season and decide what I'll work on during that time.

For my latest theme, I decided I wanted to write a daily journal. I like having clear commitments, so I committed to writing for five minutes each day. I also like having observable commitments, even if it is just for me, so I put my entries in Git.

I decided I wanted some automation around my journaling and turned to my favorite automation tool: [Jupyter][2]. One of Jupyter's interesting features is [ipywidgets][3], a set of interactive HTML widgets for Jupyter Notebooks, JupyterLab, and the IPython kernel.

If you want to follow along with the code in this article, note that making your Jupyter lab instance support widgets can be a bit frustrating. Follow [these instructions][4] to set things up.

### Import ipywidgets modules

First, you need to import a bunch of things, such as ipywidgets and [Twisted][5]. The Twisted module helps create an asynchronous time counter:


```
import twisted.internet.asyncioreactor
twisted.internet.asyncioreactor.install()
from twisted.internet import reactor, task
import ipywidgets, datetime, subprocess, functools, os
```

### Set up timed entries

Implementing a time counter with Twisted takes advantage of `task.LoopingCall`. However, the only way to end a looping call is with an exception. A countdown clock will always stop, so you need a custom exception that indicates "all is well; the counter is done":


```
class DoneError(Exception):
    pass
```

Now that you've written the exception, you can write the timer. The first step is to create an `ipywidgets.Label` with a text label widget. The loop uses `divmod` to figure out minutes and seconds and then sets the label's text value:


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
        if current_seconds &lt; 0:
            raise DoneError("finished")
    minute = datetime.timedelta(minutes=1)
    call = task.LoopingCall.withCount(decrement)
    call.reactor = reactor
    d = call.start(1)
    d.addErrback(lambda f: f.trap(DoneError))
    return d, label
```

### Save text from a Jupyter widget

The next step is to write something that saves the text you type into your journal to a file and commits it to Git. Also, since you will be journaling for five minutes, you want a widget that gives you room to write (scrolling is always possible, but it's nice to see a bit more text at a time).

This uses the widgets `Textarea`, which is a text field where you can write, and `Output` to give feedback. This is important since `git push` can take time or fail, depending on the network. If a backup fails, it's important to alert the user with feedback:


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

The `continuous_update=False` is so that not every character is saved and sent to Git. Instead, it saves whenever you lose focus. The function also returns the `save` function, so it can be called explicitly.

### Create a layout

Finally, you can put all of these together using `ipywidgets.VBox`. This is something that contains a few widgets and displays them vertically. There are a few more ways to arrange widgets, but this is simple and good enough:


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

Phew! You've defined a function for journaling, so it's time to try it out.


```
`journal()`
```

![Jupyter journal][6]

(Moshe Zadka, [CC BY-SA 4.0][7])

You have five minutes—start writing!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/daily-journal-jupyter

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
