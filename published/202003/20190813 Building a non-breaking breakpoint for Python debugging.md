[#]: collector: (lujun9972)
[#]: translator: (caiichenr)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11986-1.html)
[#]: subject: (Building a non-breaking breakpoint for Python debugging)
[#]: via: (https://opensource.com/article/19/8/debug-python)
[#]: author: (Liran Haimovitch https://opensource.com/users/liranhaimovitch)

在 Python 调试过程中设置不中断的断点
======

> 你对如何让调试器变得更快产生过兴趣吗？本文将分享我们在为 Python 构建调试器时得到的一些经验。

![](https://img.linux.net.cn/data/attachment/album/202003/12/104433hq3qx2k81w1wamwm.jpg)

整段故事讲的是我们在 [Rookout][2] 公司的团队为 Python 调试器开发不中断断点的经历，以及开发过程中得到的经验。我将在本月于旧金山举办的 [PyBay 2019][3] 上介绍有关 Python 调试过程的更多细节，但现在就让我们立刻开始这段故事。

### Python 调试器的心脏：sys.set_trace

在诸多可选的 Python 调试器中，使用最广泛的三个是：

* pdb，它是 Python 标准库的一部分
* PyDev，它是内嵌在 Eclipse 和 Pycharm 等 IDE 中的调试器
* ipdb，它是 IPython 的调试器

Python 调试器的选择虽多，但它们几乎都基于同一个函数：`sys.settrace`。 值得一提的是， [sys.settrace][4] 可能也是 Python 标准库中最复杂的函数。

![set_trace Python 2 docs page][5]

简单来讲，`settrace` 的作用是为解释器注册一个跟踪函数，它在下列四种情形发生时被调用：

* 函数调用
* 语句执行
* 函数返回
* 异常抛出

一个简单的跟踪函数看上去大概是这样：

```
def simple_tracer(frame, event, arg):
  co = frame.f_code
  func_name = co.co_name
  line_no = frame.f_lineno
  print("{e} {f} {l}".format(
e=event, f=func_name, l=line_no))
  return simple_tracer
```

在分析函数时我们首先关注的是参数和返回值，该跟踪函数的参数分别是：

* `frame`，当前堆栈帧，它是包含当前函数执行时解释器里完整状态的对象
* `event`，事件，它是一个值可能为 `call`、`line`、`return` 或 `exception` 的字符串
* `arg`，参数，它的取值基于 `event` 的类型，是一个可选项

该跟踪函数的返回值是它自身，这是由于解释器需要持续跟踪两类跟踪函数：

* **全局跟踪函数（每线程）**：该跟踪函数由当前线程调用 `sys.settrace` 来设置，并在解释器创建一个新的堆栈帧时被调用（即代码中发生函数调用时）。虽然没有现成的方式来为不同的线程设置跟踪函数，但你可以调用 `threading.settrace` 来为所有新创建的 `threading` 模块线程设置跟踪函数。
* **局部跟踪函数（每一帧）**：解释器将该跟踪函数的值设置为全局跟踪函数创建帧时的返回值。同样也没有现成的方法能够在帧被创建时自动设置局部跟踪函数。

该机制的目的是让调试器对被跟踪的帧有更精确的把握，以减少对性能的影响。

### 简单三步构建调试器 （我们最初的设想）

仅仅依靠上文提到的内容，用自制的跟踪函数来构建一个真正的调试器似乎有些不切实际。幸运的是，Python 的标准调试器 pdb 是基于 Bdb 构建的，后者是 Python 标准库中专门用于构建调试器的基类。

基于 Bdb 的简易断点调试器看上去是这样的：

```
import bdb
import inspect

class Debugger(bdb.Bdb):
  def __init__(self):
      Bdb.__init__(self)
      self.breakpoints = dict()
      self.set_trace()

def set_breakpoint(self, filename, lineno, method):
  self.set_break(filename, lineno)
  try :
      self.breakpoints[(filename, lineno)].add(method)
  except KeyError:
      self.breakpoints[(filename, lineno)] = [method]

def user_line(self, frame):
  if not self.break_here(frame):
      return

  # Get filename and lineno from frame
  (filename, lineno, _, _, _) = inspect.getframeinfo(frame)

  methods = self.breakpoints[(filename, lineno)]
  for method in methods:
      method(frame)
```

这个调试器类的全部构成是：

1. 继承 `Bdb`，定义一个简单的构造函数来初始化基类，并开始跟踪。
2. 添加 `set_breakpoint` 方法，它使用 `Bdb` 来设置断点，并跟踪这些断点。
3. 重载 `Bdb` 在当前用户行调用的 `user_line` 方法，该方法一定被一个断点调用，之后获取该断点的源位置，并调用已注册的断点。

### 这个简易的 Bdb 调试器效率如何呢？

Rookout 的目标是在生产级性能的使用场景下提供接近普通调试器的使用体验。那么，让我们来看看先前构建出来的简易调试器表现的如何。

为了衡量调试器的整体性能开销，我们使用如下两个简单的函数来进行测试，它们分别在不同的情景下执行了 1600 万次。请注意，在所有情景下断点都不会被执行。

```
def empty_method():
   pass

def simple_method():
   a = 1
   b = 2
   c = 3
   d = 4
   e = 5
   f = 6
   g = 7
   h = 8
   i = 9
   j = 10
```

在使用调试器的情况下需要大量的时间才能完成测试。糟糕的结果指明了，这个简陋 `Bdb` 调试器的性能还远不足以在生产环境中使用。

![First Bdb debugger results][6]

### 对调试器进行优化

降低调试器的额外开销主要有三种方法：

1. **尽可能的限制局部跟踪**：由于每一行代码都可能包含大量事件，局部跟踪比全局跟踪的开销要大得多。
2. **优化 `call` 事件并尽快将控制权还给解释器**：在 `call` 事件发生时调试器的主要工作是判断是否需要对该事件进行跟踪。
3. **优化 `line` 事件并尽快将控制权还给解释器**：在 `line` 事件发生时调试器的主要工作是判断我们在此处是否需要设置一个断点。

于是我们复刻了 `Bdb` 项目，精简特征、简化代码，针对使用场景进行优化。这些工作虽然得到了一些效果，但仍无法满足我们的需求。因此我们又继续进行了其它的尝试，将代码优化并迁移至 `.pyx` 使用 [Cython][7] 进行编译，可惜结果（如下图所示）依旧不够理想。最终，我们在深入了解 CPython 源码之后意识到，让跟踪过程快到满足生产需求是不可能的。

![Second Bdb debugger results][8]

### 放弃 Bdb 转而尝试字节码操作

熬过先前对标准调试方法进行的试验-失败-再试验循环所带来的失望，我们将目光转向另一种选择：字节码操作。

Python 解释器的工作主要分为两个阶段：

1. **将 Python 源码编译成 Python 字节码**：这种（对人类而言）不可读的格式专为执行的效率而优化，它们通常缓存在我们熟知的 `.pyc` 文件当中。
2. **遍历 解释器循环中的字节码**： 在这一步中解释器会逐条的执行指令。

我们选择的模式是：使用**字节码操作**来设置没有全局额外开销的**不中断断点**。这种方式的实现首先需要在内存中的字节码里找到我们感兴趣的部分，然后在该部分的相关机器指令前插入一个函数调用。如此一来，解释器无需任何额外的工作即可实现我们的不中断断点。

这种方法并不依靠魔法来实现，让我们简要地举个例子。

首先定义一个简单的函数：

```
def multiply(a, b):
   result = a * b
   return result
```

在 [inspect][9] 模块（其包含了许多实用的单元）的文档里，我们得知可以通过访问 `multiply.func_code.co_code` 来获取函数的字节码：

```
'|\x00\x00|\x01\x00\x14}\x02\x00|\x02\x00S'
```

使用 Python 标准库中的 [dis][10] 模块可以翻译这些不可读的字符串。调用 `dis.dis(multiply.func_code.co_code)` 之后，我们就可以得到：

```
  4          0 LOAD_FAST               0 (a)
             3 LOAD_FAST               1 (b)
             6 BINARY_MULTIPLY    
             7 STORE_FAST              2 (result)

  5         10 LOAD_FAST               2 (result)
            13 RETURN_VALUE      
```

与直截了当的解决方案相比，这种方法让我们更靠近发生在调试器背后的事情。可惜 Python 并没有提供在解释器中修改函数字节码的方法。我们可以对函数对象进行重写，不过那样做的效率满足不了大多数实际的调试场景。最后我们不得不采用一种迂回的方式来使用原生拓展才能完成这一任务。

### 总结

在构建一个新工具时，总会学到许多事情的工作原理。这种刨根问底的过程能够使你的思路跳出桎梏，从而得到意料之外的解决方案。

在 Rookout 团队中构建不中断断点的这段时间里，我学到了许多有关编译器、调试器、服务器框架、并发模型等等领域的知识。如果你希望更深入的了解字节码操作，谷歌的开源项目 [cloud-debug-python][11] 为编辑字节码提供了一些工具。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/debug-python

作者：[Liran Haimovitch][a]
选题：[lujun9972][b]
译者：[caiichenr](https://github.com/caiichenr)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/liranhaimovitch
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/python_jungle_lead.jpeg?itok=pFKKEvT- (Real python in the graphic jungle)
[2]: https://rookout.com/
[3]: https://pybay.com/
[4]: https://docs.python.org/3/library/sys.html#sys.settrace
[5]: https://opensource.com/sites/default/files/uploads/python2docs.png (set_trace Python 2 docs page)
[6]: https://opensource.com/sites/default/files/uploads/debuggerresults1.png (First Bdb debugger results)
[7]: https://cython.org/
[8]: https://opensource.com/sites/default/files/uploads/debuggerresults2.png (Second Bdb debugger results)
[9]: https://docs.python.org/2/library/inspect.html
[10]: https://docs.python.org/2/library/dis.html
[11]: https://github.com/GoogleCloudPlatform/cloud-debug-python
[12]: https://pybay.com/speaker/liran-haimovitch/
[13]: https://ti.to/sf-python/pybay2019/discount/OpenSource35
