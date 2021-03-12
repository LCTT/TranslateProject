[#]: subject: (Visualize multi-threaded Python programs with an open source tool)
[#]: via: (https://opensource.com/article/21/3/python-viztracer)
[#]: author: (Tian Gao https://opensource.com/users/gaogaotiantian)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Visualize multi-threaded Python programs with an open source tool
======
VizTracer traces concurrent Python programs to help with logging,
debugging, and profiling.
![Colorful sound wave graph][1]

Concurrency is an essential part of modern programming, as we have multiple cores and many tasks that need to cooperate. However, it's harder to understand concurrent programs when they are not running sequentially. It's not as easy for engineers to identify bugs and performance issues in these programs as it is in a single-thread, single-task program.

With Python, you have multiple options for concurrency. The most common ones are probably multi-threaded with the threading module, multiprocess with the subprocess and multiprocessing modules, and the more recent async syntax with the asyncio module. Before [VizTracer][2], there was a lack of tools to analyze programs using these techniques.

VizTracer is a tool for tracing and visualizing Python programs, which is helpful for logging, debugging, and profiling. Even though it works well for single-thread, single-task programs, its utility in concurrent programs is what makes it unique.

### Try a simple task

Start with a simple practice task: Figure out whether the integers in an array are prime numbers and return a Boolean array. Here is a simple solution:


```
def is_prime(n):
    for i in range(2, n):
        if n % i == 0:
            return False
    return True

def get_prime_arr(arr):
    return [is_prime(elem) for elem in arr]
```

Try to run it normally, in a single thread, with VizTracer:


```
if __name__ == "__main__":
    num_arr = [random.randint(100, 10000) for _ in range(6000)]
    get_prime_arr(num_arr)

[/code] [code]`viztracer my_program.py`
```

![Running code in a single thread][3]

(Tian Gao, [CC BY-SA 4.0][4])

The call-stack report indicates it took about 140ms, with most of the time spent in `get_prime_arr`.

![call-stack report][5]

(Tian Gao, [CC BY-SA 4.0][4])

It's just doing the `is_prime` function over and over again on the elements in the array.

This is what you would expect, and it's not that interesting (if you know VizTracer).

### Try a multi-thread program

Try doing it with a multi-thread program:


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

To match the single-thread program's workload, this uses a 2,000-element array for three threads, simulating a situation where three threads are sharing the task.

![Multi-thread program][6]

(Tian Gao, [CC BY-SA 4.0][4])

As you would expect if you are familiar with Python's Global Interpreter Lock (GIL), it won't get any faster. It took a little bit more than 140ms due to the overhead. However, you can observe the concurrency of multiple threads:

![Concurrency of multiple threads][7]

(Tian Gao, [CC BY-SA 4.0][4])

When one thread was working (executing multiple `is_prime` functions), the other one was frozen (one `is_prime` function); later, they switched. This is due to GIL, and it is the reason Python does not have true multi-threading. It can achieve concurrency but not parallelism.

### Try it with multiprocessing

To achieve parallelism, the way to go is the multiprocessing library. Here is another version with multiprocessing:


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

To run it with VizTracer, you need an extra argument:


```
`viztracer --log_multiprocess my_program.py`
```

![Running with extra argument][8]

(Tian Gao, [CC BY-SA 4.0][4])

The whole program finished in a little more than 50ms, with the actual task finishing before the 50ms mark. The program's speed roughly tripled.

To compare it with the multi-thread version, here is the multiprocess version:

![Multi-process version][9]

(Tian Gao, [CC BY-SA 4.0][4])

Without GIL, multiple processes can achieve parallelism, which means multiple `is_prime` functions can execute in parallel.

However, Python's multi-thread is not useless. For example, for computation-intensive and I/O-intensive programs, you can fake an I/O-bound task with sleep:


```
def io_task():
    time.sleep(0.01)
```

Try it in a single-thread, single-task program:


```
if __name__ == "__main__":
    for _ in range(3):
        io_task()
```

![I/O-bound single-thread, single-task program][10]

(Tian Gao, [CC BY-SA 4.0][4])

The full program took about 30ms; nothing special.

Now use multi-thread:


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

(Tian Gao, [CC BY-SA 4.0][4])

The program took 10ms, and it's clear how the three threads worked concurrently and improved the overall performance.

### Try it with asyncio

Python is trying to introduce another interesting feature called async programming. You can make an async version of this task:


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

As asyncio is literally a single-thread scheduler with tasks, you can use VizTracer directly on it:

![VizTracer with asyncio][12]

(Tian Gao, [CC BY-SA 4.0][4])

It still took 10ms, but most of the functions displayed are the underlying structure, which is probably not what users are interested in. To solve this, you can use `--log_async` to separate the real task:


```
`viztracer --log_async my_program.py`
```

![Using --log_async to separate tasks][13]

(Tian Gao, [CC BY-SA 4.0][4])

Now the user tasks are much clearer. For most of the time, no tasks are running (because the only thing it does is sleep). Here's the interesting part:

![Graph of task creation and execution][14]

(Tian Gao, [CC BY-SA 4.0][4])

This shows when the tasks were created and executed. Task-1 was the `main()` co-routine and created other tasks. Tasks 2, 3, and 4 executed `io_task` and `sleep` then waited for the wake-up. As the graph shows, there is no overlap between tasks because it's a single-thread program, and VizTracer visualized it this way to make it more understandable.

To make it more interesting, add a `time.sleep` call in the task to block the async loop:


```
async def io_task():
    time.sleep(0.01)
    await asyncio.sleep(0.01)
```

![time.sleep call][15]

(Tian Gao, [CC BY-SA 4.0][4])

The program took much longer (40ms), and the tasks filled the blanks in the async scheduler.

This feature is very helpful for diagnosing behavior and performance issues in async programs.

### See what's happening with VizTracer

With VizTracer, you can see what's going on with your program on a timeline, rather than imaging it from complicated logs. This helps you understand your concurrent programs better.

VizTracer is open source, released under the Apache 2.0 license, and supports all common operating systems (Linux, macOS, and Windows). You can learn more about its features and access its source code in [VizTracer's GitHub repository][16].

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/python-viztracer

作者：[Tian Gao][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
