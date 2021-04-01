[#]: subject: (Use this open source tool to monitor variables in Python)
[#]: via: (https://opensource.com/article/21/4/monitor-debug-python)
[#]: author: (Tian Gao https://opensource.com/users/gaogaotiantian)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Use this open source tool to monitor variables in Python
======
Watchpoints is a simple but powerful tool to help you with monitoring
variables while debugging Python.
![Looking back with binoculars][1]

When debugging code, you're often faced with figuring out when a variable changes. Without any advanced tools, you have the option of using print statements to announce the variables when you expect them to change. However, this is a very ineffective way because the variables could change in many places, and constantly printing them to a terminal is noisy, while printing them to a log file becomes unwieldy.

This is a common issue, but now there is a simple but powerful tool to help you with monitoring variables: [watchpoints][2].

The [watchpoint concept is common in C and C++ debuggers][3] to monitor memories, but there's a lack of equivalent tools in Python. `watchpoints` fills in the gap.

### Installing

To use it, you must first install it by using `pip`:


```
`$ python3 -m pip install watchpoints`
```

### Using watchpoints in Python

For any variable you'd like to monitor, use the **watch** function on it.


```
from watchpoints import watch

a = 0
watch(a)
a = 1
```

As the variable changes, information about its value is printed to **stdout**:


```
====== Watchpoints Triggered ======

Call Stack (most recent call last):
  &lt;module&gt; (my_script.py:5):
&gt; a = 1
a:
0
-&gt;
1
```

The information includes:

  * The line where the variable was changed.
  * The call stack.
  * The previous/current value of the variable.



It not only works with the variable itself, but it also works with object changes:


```
from watchpoints import watch

a = []
watch(a)
a = {} # Trigger
a["a"] = 2 # Trigger
```

The callback is triggered when the variable **a** is reassigned, but also when the object assigned to a is changed.

What makes it even more interesting is that the monitor is not limited by the scope. You can watch the variable/object anywhere you want, and the callback is triggered no matter what function the program is executing.


```
from watchpoints import watch

def func(var):
    var["a"] = 1

a = {}
watch(a)
func(a)
```

For example, this code prints:


```
====== Watchpoints Triggered ======

Call Stack (most recent call last):

  &lt;module&gt; (my_script.py:8):
&gt; func(a)
  func (my_script.py:4):
&gt; var["a"] = 1
a:
{}
-&gt;
{'a': 1}
```

The **watch** function can monitor more than a variable. It can also monitor the attributes and an element of a dictionary or list.


```
from watchpoints import watch

class MyObj:
    def __init__(self):
        self.a = 0

obj = MyObj()
d = {"a": 0}
watch(obj.a, d["a"]) # Yes you can do this
obj.a = 1 # Trigger
d["a"] = 1 # Trigger
```

This could help you narrow down to some specific objects that you are interested in.

If you are not happy about the format of the output, you can customize it. Just define your own callback function:


```
watch(a, callback=my_callback)

# Or set it globally

watch.config(callback=my_callback)
```

You can even bring up **pdb** when the trigger is hit:


```
`watch.config(pdb=True)`
```

This behaves similarly to **breakpoint()**, giving you a debugger-like experience.

If you don’t want to import the function in every single file, you can make it global by using **install** function:


```
`watch.install() # or watch.install("func_name") and use it as func_name()`
```

Personally, I think the coolest thing about watchpoints is its intuitive usage. Are you interested in some data? Just "watch" it, and you'll know when your variable changes.

### Try watchpoints

I developed and maintain `watchpoints` on [GitHub][2], and have released it under the licensed under Apache 2.0. Install it and use it, and of course contribution is always welcome.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/monitor-debug-python

作者：[Tian Gao][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gaogaotiantian
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/look-binoculars-sight-see-review.png?itok=NOw2cm39 (Looking back with binoculars)
[2]: https://github.com/gaogaotiantian/watchpoints
[3]: https://opensource.com/article/21/3/debug-code-gdb
