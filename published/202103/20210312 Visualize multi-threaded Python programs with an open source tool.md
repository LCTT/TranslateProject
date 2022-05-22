[#]: subject: (Visualize multi-threaded Python programs with an open source tool)
[#]: via: (https://opensource.com/article/21/3/python-viztracer)
[#]: author: (Tian Gao https://opensource.com/users/gaogaotiantian)
[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13253-1.html)

用一个开源工具实现多线程 Python 程序的可视化
======

> VizTracer 可以跟踪并发的 Python 程序，以帮助记录、调试和剖析。

![](https://img.linux.net.cn/data/attachment/album/202103/30/230404xi9pox38ookk8xe2.jpg)

并发是现代编程中必不可少的一部分，因为我们有多个核心，有许多需要协作的任务。然而，当并发程序不按顺序运行时，就很难理解它们。对于工程师来说，在这些程序中发现 bug 和性能问题不像在单线程、单任务程序中那么容易。

在 Python 中，你有多种并发的选择。最常见的可能是用 `threading` 模块的多线程，用`subprocess` 和 `multiprocessing` 模块的多进程，以及最近用 `asyncio` 模块提供的 `async` 语法。在 [VizTracer][2] 之前，缺乏分析使用了这些技术程序的工具。

VizTracer 是一个追踪和可视化 Python 程序的工具，对日志、调试和剖析很有帮助。尽管它对单线程、单任务程序很好用，但它在并发程序中的实用性是它的独特之处。

### 尝试一个简单的任务

从一个简单的练习任务开始：计算出一个数组中的整数是否是质数并返回一个布尔数组。下面是一个简单的解决方案：

```
def is_prime(n):
    for i in range(2, n):
        if n % i == 0:
            return False
    return True

def get_prime_arr(arr):
    return [is_prime(elem) for elem in arr]
```

试着用 VizTracer 以单线程方式正常运行它：

```
if __name__ == "__main__":
    num_arr = [random.randint(100, 10000) for _ in range(6000)]
    get_prime_arr(num_arr)
```

```
viztracer my_program.py
```

![Running code in a single thread][3]

调用堆栈报告显示，耗时约 140ms，大部分时间花在 `get_prime_arr` 上。

![call-stack report][5]

这只是在数组中的元素上一遍又一遍地执行 `is_prime` 函数。

这是你所期望的，而且它并不有趣（如果你了解 VizTracer 的话）。

### 试试多线程程序

试着用多线程程序来做：

```
if __name__ == "__main__":
    num_arr = [random.randint(100, 10000) for i in range(2000)]
    thread1 = Thread(target=get_prime_arr, args=(num_arr,))
    thread2 = Thread(target=get_prime_arr, args=(num_arr,))
    thread3 = Thread(target=get_prime_arr, args=(num_arr,))

    thread1.start()
    thread2.start()
    thread3.start()

    thread1.join()
    thread2.join()
    thread3.join()
```

为了配合单线程程序的工作负载，这就为三个线程使用了一个 2000 元素的数组，模拟了三个线程共享任务的情况。

![Multi-thread program][6]

如果你熟悉 Python 的全局解释器锁（GIL），就会想到，它不会再快了。由于开销太大，花了 140ms 多一点的时间。不过，你可以观察到多线程的并发性：

![Concurrency of multiple threads][7]

当一个线程在工作（执行多个 `is_prime` 函数）时，另一个线程被冻结了（一个 `is_prime` 函数）；后来，它们进行了切换。这是由于 GIL 的原因，这也是 Python 没有真正的多线程的原因。它可以实现并发，但不能实现并行。

### 用多进程试试

要想实现并行，办法就是 `multiprocessing` 库。下面是另一个使用 `multiprocessing` 的版本：

```
if __name__ == "__main__":
    num_arr = [random.randint(100, 10000) for _ in range(2000)]
   
    p1 = Process(target=get_prime_arr, args=(num_arr,))
    p2 = Process(target=get_prime_arr, args=(num_arr,))
    p3 = Process(target=get_prime_arr, args=(num_arr,))

    p1.start()
    p2.start()
    p3.start()

    p1.join()
    p2.join()
    p3.join()
```

要使用 VizTracer 运行它，你需要一个额外的参数：

```
viztracer --log_multiprocess my_program.py
```

![Running with extra argument][8]

整个程序在 50ms 多一点的时间内完成，实际任务在 50ms 之前完成。程序的速度大概提高了三倍。

为了和多线程版本进行比较，这里是多进程版本：

![Multi-process version][9]

在没有 GIL 的情况下，多个进程可以实现并行，也就是多个 `is_prime` 函数可以并行执行。

不过，Python 的多线程也不是一无是处。例如，对于计算密集型和 I/O 密集型程序，你可以用睡眠来伪造一个 I/O 绑定的任务：

```
def io_task():
    time.sleep(0.01)
```

在单线程、单任务程序中试试：

```
if __name__ == "__main__":
    for _ in range(3):
        io_task()
```

![I/O-bound single-thread, single-task program][10]

整个程序用了 30ms 左右，没什么特别的。

现在使用多线程：

```
if __name__ == "__main__":
    thread1 = Thread(target=io_task)
    thread2 = Thread(target=io_task)
    thread3 = Thread(target=io_task)

    thread1.start()
    thread2.start()
    thread3.start()

    thread1.join()
    thread2.join()
    thread3.join()
```

![I/O-bound multi-thread program][11]

程序耗时 10ms，很明显三个线程是并发工作的，这提高了整体性能。

### 用 asyncio 试试

Python 正在尝试引入另一个有趣的功能，叫做异步编程。你可以制作一个异步版的任务：

```
import asyncio

async def io_task():
    await asyncio.sleep(0.01)

async def main():
    t1 = asyncio.create_task(io_task())
    t2 = asyncio.create_task(io_task())
    t3 = asyncio.create_task(io_task())

    await t1
    await t2
    await t3

if __name__ == "__main__":
    asyncio.run(main())
```

由于 `asyncio` 从字面上看是一个带有任务的单线程调度器，你可以直接在它上使用 VizTracer：

![VizTracer with asyncio][12]

依然花了 10ms，但显示的大部分函数都是底层结构，这可能不是用户感兴趣的。为了解决这个问题，可以使用 `--log_async` 来分离真正的任务：

```
viztracer --log_async my_program.py
```

![Using --log_async to separate tasks][13]

现在，用户任务更加清晰了。在大部分时间里，没有任务在运行（因为它唯一做的事情就是睡觉）。有趣的部分是这里：

![Graph of task creation and execution][14]

这显示了任务的创建和执行时间。Task-1 是 `main()` 协程，创建了其他任务。Task-2、Task-3、Task-4 执行 `io_task` 和 `sleep` 然后等待唤醒。如图所示，因为是单线程程序，所以任务之间没有重叠，VizTracer 这样可视化是为了让它更容易理解。

为了让它更有趣，可以在任务中添加一个 `time.sleep` 的调用来阻止异步循环：

```
async def io_task():
    time.sleep(0.01)
    await asyncio.sleep(0.01)
```

![time.sleep call][15]

程序耗时更长（40ms），任务填补了异步调度器中的空白。

这个功能对于诊断异步程序的行为和性能问题非常有帮助。

### 看看 VizTracer 发生了什么？

通过 VizTracer，你可以在时间轴上查看程序的进展情况，而不是从复杂的日志中想象。这有助于你更好地理解你的并发程序。

VizTracer 是开源的，在 Apache 2.0 许可证下发布，支持所有常见的操作系统（Linux、macOS 和 Windows）。你可以在 [VizTracer 的 GitHub 仓库][16]中了解更多关于它的功能和访问它的源代码。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/python-viztracer

作者：[Tian Gao][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gaogaotiantian
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/colorful_sound_wave.png?itok=jlUJG0bM (Colorful sound wave graph)
[2]: https://readthedocs.org/projects/viztracer/
[3]: https://opensource.com/sites/default/files/uploads/viztracer_singlethreadtask.png (Running code in a single thread)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://opensource.com/sites/default/files/uploads/viztracer_callstackreport.png (call-stack report)
[6]: https://opensource.com/sites/default/files/uploads/viztracer_multithread.png (Multi-thread program)
[7]: https://opensource.com/sites/default/files/uploads/viztracer_concurrency.png (Concurrency of multiple threads)
[8]: https://opensource.com/sites/default/files/uploads/viztracer_multithreadrun.png (Running with extra argument)
[9]: https://opensource.com/sites/default/files/uploads/viztracer_comparewithmultiprocess.png (Multi-process version)
[10]: https://opensource.com/sites/default/files/uploads/io-bound_singlethread.png (I/O-bound single-thread, single-task program)
[11]: https://opensource.com/sites/default/files/uploads/io-bound_multithread.png (I/O-bound multi-thread program)
[12]: https://opensource.com/sites/default/files/uploads/viztracer_asyncio.png (VizTracer with asyncio)
[13]: https://opensource.com/sites/default/files/uploads/log_async.png (Using --log_async to separate tasks)
[14]: https://opensource.com/sites/default/files/uploads/taskcreation.png (Graph of task creation and execution)
[15]: https://opensource.com/sites/default/files/uploads/time.sleep_call.png (time.sleep call)
[16]: https://github.com/gaogaotiantian/viztracer
