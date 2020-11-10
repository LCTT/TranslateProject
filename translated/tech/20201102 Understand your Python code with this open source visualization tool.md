[#]: collector: "lujun9972"
[#]: translator: "xiao-song-123"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "
[#]: subject: "Understand your Python code with this open source visualization tool"
[#]: via: "https://opensource.com/article/20/11/python-code-viztracer"
[#]: author: "Tian Gao https://opensource.com/users/gaogaotiantian"

使用开源可视化工具来理解您的 Python 代码
======
VizTracer 工具可以可视化并跟踪 Python 代码，让您可以更深入地了解其工作原理。
![Python programming language logo with question marks][1]

随之 Python 项目变得越来越大、越复杂，理解起它来就变得充满挑战性。即使是您自己独自编写了整个项目，也不可能完全知道项目是如何工作的。为了能更好的理解您的代码，调试和分析代码变得至关重要。

[VizTracer][2] 是一个这样的工具，它通过跟踪和可视化 Python 代码的执行过程，来帮助您对代码的理解。无需对源代码进行任何更改，VizTracer 即可记录函数的入口 / 出口，函数参数 / 返回值以及任意变量，然后通过 [Trace-Viewer][3] 使用直观的谷歌前端界面来显示数据。

下面是一个运行[蒙特卡洛树搜索][4]的例子：

![Monte Carlo tree search visualization][5]

(Tian Gao, [CC BY-SA 4.0][6])

每个函数都在时间线上以堆栈的形式记录和可视化，这样您就可以看到在运行程序时发生了什么。您可以放大查看任意特定点的详细信息：

![Zooming in on VizTracer visualization][7]

(Tian Gao, [CC BY-SA 4.0][6])

VizTracer 还可以自动记录函数参数和返回值。您可以单击功能条目并查看详细信息：

![Viewing VizTracer details][8]

(Tian Gao, [CC BY-SA 4.0][6])

或者您可以创建一个全新的信号，并用它来记录变量。例如，这显示了执行梯度下降时的代价值：

![VizTracer gradient descent][9]

(Tian Gao, [CC BY-SA 4.0][6])

与其他设置复杂的工具相比，VizTracer 使用起来非常简单，并且没有任何依赖关系。您可以从 pip 安装它：


```
`pip install viztracer`
```

您也可以通过输入来跟踪你的程序 ( `<your_script.py>` 是您脚本的名称):


```
`viztracer <your_script.py>`
```

VizTracer 将在您的工作目录中生成一个 HTML 报告，您可以在 Chrome 浏览器中打开它。

VizTracer 还提供了其他高级功能，比如过滤器功能，您可以使用它过滤掉不想跟踪的函数，获得更清晰的报告。例如，要仅包含文件中的函数，您需要：


```
`viztracer include_files ./ --run <your_script.py>`
```

记录函数参数和返回值:


```
`viztracer --log_function_args --log_return_value <your_script.py>`
```

记录与某个正则表达式匹配的任意变量:


```
# log variables starts with a
viztracer --log_var a.* --run &lt;your_script.py&gt;
```

您可以通过对源代码进行较小的修改来获得其他功能，例如自定义事件来记录数值和对象。

VizTracer 还包括一个虚拟调试器( vdb )，它可以调试 VizTracer 的日志文件。可以用 vdb 调试您运行中的代码 (与 [pdb][10] 非常相似 ) 以便您了解代码流。有用的是，它还支持时间回溯，因为它知道发生的一切。

与一些原型不同，VizTracer 使用纯 C 语言实现其核心，这将极大地减少开销，使其达到类似于 [cProfile][11] 的水平。

VizTracer 是开源的，在 Apache 2.0 许可下发布，支持所有常见的操作系统平台(Linux、macOS和Windows)。你可以在 [GitHub][2] 上了解关于它的更多特性并访问源代码。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/python-code-viztracer

作者：[Tian Gao][a]
选题：[lujun9972][b]
译者：[xiao-song-123](https://github.com/xiao-song-123)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gaogaotiantian
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/python_programming_question.png?itok=cOeJW-8r "Python programming language logo with question marks"
[2]: https://github.com/gaogaotiantian/viztracer
[3]: http://google.github.io/trace-viewer/
[4]: https://en.wikipedia.org/wiki/Monte_Carlo_tree_search
[5]: https://opensource.com/sites/default/files/uploads/viztracer_mcts.png "Monte Carlo tree search visualization"
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://opensource.com/sites/default/files/uploads/viztracer_zoomin.png "Zooming in on VizTracer visualization"
[8]: https://opensource.com/sites/default/files/uploads/viztracer_details.png "Viewing VizTracer details"
[9]: https://opensource.com/sites/default/files/uploads/viztracer_gradient.png "VizTracer gradient descent"
[10]: https://docs.python.org/3/library/pdb.html
[11]: https://docs.python.org/2/library/profile.html#module-cProfile
