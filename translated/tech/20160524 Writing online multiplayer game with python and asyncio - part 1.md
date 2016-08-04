使用python 和asyncio编写在线多人游戏 - 第1部分
===================================================================

你曾经把async和python关联起来过吗？在这里我将告诉你怎样做，而且在[working example][1]这个例子里面展示-一个流行的贪吃蛇游戏，这是为多人游戏而设计的。
[Play game][2]

###1.简介

在技术和文化领域，大量的多人在线游戏毋庸置疑是我们这个世界的主流之一。同时，为一个MMO游戏写一个服务器一般和大量的预算与低水平的编程技术相关，在最近这几年，事情发生了很大的变化。基于动态语言的现代框架允许在稳健的硬件上面处理大量并发的用户连接。同时，HTML5 和 WebSockets 标准允许基于实时的图形游戏直接在web浏览器上创建客户端，而不需要任何的扩展。

对于创建可扩展非堵塞的服务器，Python可能不是最受欢迎的工具，尤其是和在这个领域最受欢迎的node.js相比。但是最近版本的python打算改变这种现状。[asyncio][3]的介绍和一个特别的[async/await][4] 语法使得异步代码看起来像常规的阻塞代码，这使得python成为一个值得信赖的异步编程语言。所以我将尝试利用这些新特点来创建一个多人在线游戏。

###2.异步
一个游戏服务器应该处理最大数量的用户的并发连接和实时处理这些连接。一个典型的解决方案----创建线程，然而在这种情况下并不能解决这个问题。运行上千的线程需要CPU在它们之间不停的切换（这叫做上下文切换），这将开销非常大，效率很低下。更糟糕的是，因为，此外，它们会占用大量的内存。在python中，还有一个问题，python的解释器（CPython）并不是针对多线程设计的，它主要针对于单线程实现最大数量的行为。这就是为什么它使用GIL（global interpreter lock）,一个不允许同时运行多线程python代码的架构，来防止共享物体的不可控用法。正常情况下当当前线程正在等待的时候，解释器转换到另一个线程，通常是一个I/O的响应（像一个服务器的响应一样）。这允许在你的应用中有非阻塞I/O，因为每一个操作仅仅堵塞一个线程而不是堵塞整个服务器。然而，这也使得通常的多线程变得无用，因为它不允许你并发执行python代码，即使是在多核心的cpu上。同时在单线程中拥有非阻塞IO是完全有可能的，因而消除了经常切换上下文的需要。

实际上，你可以用纯python代码来实现一个单线程的非阻塞IO。你所需要的只是标准的[select][5]模块，这个模块可以让你写一个事件循环来等待未阻塞的socket的io。然而，这个方法需要你在一个地方定义所有app的逻辑，不久之后，你的app就会变成非常复杂的状态机。有一些框架可以简化这个任务，比较流行的是[tornade][6] 和 [twisted][7]。他们被用来使用回调方法实现复杂的协议（这和node.js比较相似）。这个框架运行在他自己的事件循环中，这个事件在定义的事件上调用你的回调。并且，这或许是一些情况的解决方案，但是它仍然需要使用回调的方式编程，这使你的代码碎片化。和写同步代码并且并发执行多个副本相比，就像我们会在普通的线程上做一样。这为什么在单个线程上是不可能的呢？

这就是为什么microthread出现的原因。这个想法是为了在一个线程上并发执行任务。当你在一个任务中调用阻塞的方法时，有一个叫做"manager" (或者“scheduler”)的东西在执行事件循环。当有一些事件准备处理的时候，一个manager会让等这个事件的“任务”单元去执行，直到自己停了下来。然后执行完之后就返回那个管理器（manager）。

>Microthreads are also called lightweight threads or green threads (a term which came from Java world). Tasks which are running concurrently in pseudo-threads are called tasklets, greenlets or coroutines.（Microthreads 也会被称为lightweight threads 或者 green threads（java中的一个术语）。在伪线程中并发执行的任务叫做tasklets，greenlets或者coroutines）.

microthreads的其中一种实现在python中叫做[Stackless Python][8]。这个被用在了一个叫[EVE online][9]的非常有名的在线游戏中，所以它变得非常有名。这个MMO游戏自称说在一个持久的宇宙中，有上千个玩家在做不同的活动，这些都是实时发生的。Stackless 是一个单独的python解释器，它代替了标准的栈调用并且直接控制流来减少上下文切换的开销。尽管这非常有效，这个解决方案不如使用标准解释器的“soft”库有名。像[eventlet][10]和[gevent][11] 的方式配备了标准的I / O库的补丁的I / O功能在内部事件循环执行。这使得将正常的阻塞代码转变成非阻塞的代码变得简单。这种方法的一个缺点是从代码看这并不明显，这被称为非阻塞。Python的新的版本介绍了本地协同程序作为生成器的高级形式。在Python 的3.4版本中，引入了asyncio库，这个库依赖于本地协同程序来提供单线程并发。但是在Python  3.5 协同程序变成了Python语言的一部分，使用新的关键字 async 和 await 来描述。这是一个简单的例子，这表明了使用asyncio来运行 并发任务。

```
import asyncio

async def my_task(seconds):
    print("start sleeping for {} seconds".format(seconds))
    await asyncio.sleep(seconds)
    print("end sleeping for {} seconds".format(seconds))

all_tasks = asyncio.gather(my_task(1), my_task(2))
loop = asyncio.get_event_loop()
loop.run_until_complete(all_tasks)
loop.close()    
```

我们启动了两个任务，一个睡眠1秒钟，另一个睡眠2秒钟，输出如下：

```
start sleeping for 1 seconds
start sleeping for 2 seconds
end sleeping for 1 seconds
end sleeping for 2 seconds
```

正如你所看到的，协同程序不会阻塞彼此-----第二个任务在第一个结束之前启动。这发生的原因是asyncio.sleep是协同程序，它会返回一个调度器的执行直到时间过去。在下一节中，
我们将会使用coroutine-based的任务来创建一个游戏循环。

--------------------------------------------------------------------------------

via: https://7webpages.com/blog/writing-online-multiplayer-game-with-python-asyncio-getting-asynchronous/

作者：[Kyrylo Subbotin][a]
译者：[xinglianfly](https://github.com/xinglianfly)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://7webpages.com/blog/writing-online-multiplayer-game-with-python-asyncio-getting-asynchronous/
[1]: http://snakepit-game.com/
[2]: http://snakepit-game.com/
[3]: https://docs.python.org/3/library/asyncio.html
[4]: https://docs.python.org/3/whatsnew/3.5.html#whatsnew-pep-492
[5]: https://docs.python.org/2/library/select.html
[6]: http://www.tornadoweb.org/
[7]: http://twistedmatrix.com/
[8]: http://www.stackless.com/
[9]: http://www.eveonline.com/
[10]: http://eventlet.net/
[11]: http://www.gevent.org/
