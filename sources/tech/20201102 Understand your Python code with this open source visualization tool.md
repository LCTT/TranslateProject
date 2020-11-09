[#]: collector: (lujun9972)
[#]: translator: (xiao-song-123)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Understand your Python code with this open source visualization tool)
[#]: via: (https://opensource.com/article/20/11/python-code-viztracer)
[#]: author: (Tian Gao https://opensource.com/users/gaogaotiantian)

Understand your Python code with this open source visualization tool
======
VizTracer visualizes and traces Python code to provide greater insight
into how the code works.
![Python programming language logo with question marks][1]

It's challenging to understand your Python project as it gets larger and more complex. Even when you write the entire project, it's impossible to know how it works fully. Debugging and profiling your code is essential to better understanding it.

[VizTracer][2] is a tool to help you understand Python code by tracing and visualizing its execution. Without making any changes to your source code, VizTracer can log function entries/exits, function arguments/returns, and any arbitrary variables, then display the data using an intuitive front-end Google [Trace-Viewer][3].

Here is an example of running a [Monte Carlo tree search][4]:

![Monte Carlo tree search visualization][5]

(Tian Gao, [CC BY-SA 4.0][6])

Every function is logged and visualized in stack style on a timeline so that you can see what is happening when you run a program. You can zoom in to see the details at any specific point:

![Zooming in on VizTracer visualization][7]

(Tian Gao, [CC BY-SA 4.0][6])

VizTracer can also automatically log function arguments and return value; you can click on the function entry and see the detail info:

![Viewing VizTracer details][8]

(Tian Gao, [CC BY-SA 4.0][6])

Or you can create a whole new signal and use it to log variables. For example, this shows the cost value when you do a gradient descent:

![VizTracer gradient descent][9]

(Tian Gao, [CC BY-SA 4.0][6])

In contrast to other tools with complicated setups, VizTracer is super-easy to use and does not have any dependencies. You can install it from pip with:


```
`pip install viztracer`
```

And trace your program by entering (where `<your_script.py>` is the name of your script):


```
`viztracer <your_script.py>`
```

VizTracer will generate an HTML report in your working directory that you can open in Chrome.

VizTracer offers other advanced features, such as filters, which you can use to filter out the functions that you do not want to trace so that you'll have a cleaner report. For example, to include only the functions in files, you are interested in:


```
`viztracer include_files ./ --run <your_script.py>`
```

To record the function arguments and return value:


```
`viztracer --log_function_args --log_return_value <your_script.py>`
```

To log any arbitrary variables matching a certain regex:


```
# log variables starts with a
viztracer --log_var a.* --run &lt;your_script.py&gt;
```

You can get other features, like custom events to log numeric values and objects, by making minor modifications to your source code.

VizTracer also includes a virtual debugger (vdb) that can debug VizTracer's log file. vdb debugs your executed code (much like [pdb][10]) so that you can understand the code flow. Helpfully, it supports running back in time because it knows everything that happened.

Unlike some prototypes, VizTracer implements its core in pure C, which significantly reduces the overhead to a level similar to [cProfile][11].

VizTracer is open source, released under the Apache 2.0 License, and supports all common operating systems platforms (Linux, macOS, and Windows). You can learn more about its features and access its source code on [GitHub][2].

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/python-code-viztracer

作者：[Tian Gao][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gaogaotiantian
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/python_programming_question.png?itok=cOeJW-8r (Python programming language logo with question marks)
[2]: https://github.com/gaogaotiantian/viztracer
[3]: http://google.github.io/trace-viewer/
[4]: https://en.wikipedia.org/wiki/Monte_Carlo_tree_search
[5]: https://opensource.com/sites/default/files/uploads/viztracer_mcts.png (Monte Carlo tree search visualization)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://opensource.com/sites/default/files/uploads/viztracer_zoomin.png (Zooming in on VizTracer visualization)
[8]: https://opensource.com/sites/default/files/uploads/viztracer_details.png (Viewing VizTracer details)
[9]: https://opensource.com/sites/default/files/uploads/viztracer_gradient.png (VizTracer gradient descent)
[10]: https://docs.python.org/3/library/pdb.html
[11]: https://docs.python.org/2/library/profile.html#module-cProfile
