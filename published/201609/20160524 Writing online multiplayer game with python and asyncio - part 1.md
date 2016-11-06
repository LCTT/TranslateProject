使用 Python 和 Asyncio 编写在线多人游戏（一）
===================================================================

你在 Python 中用过异步编程吗？本文中我会告诉你怎样做，而且用一个[能工作的例子][1]来展示它：这是一个流行的贪吃蛇游戏，而且是为多人游戏而设计的。

- [游戏入口在此，点此体验][2]。

###1、简介

在技术和文化领域，大规模多人在线游戏（MMO）毋庸置疑是我们当今世界的潮流之一。很长时间以来，为一个 MMO 游戏写一个服务器这件事总是会涉及到大量的预算与复杂的底层编程技术，不过在最近这几年，事情迅速发生了变化。基于动态语言的现代框架允许在中档的硬件上面处理大量并发的用户连接。同时，HTML5 和 WebSockets 标准使得创建基于实时图形的游戏的直接运行至浏览器上的客户端成为可能，而不需要任何的扩展。

对于创建可扩展的非堵塞性的服务器来说，Python 可能不是最受欢迎的工具，尤其是和在这个领域里最受欢迎的 Node.js 相比而言。但是最近版本的 Python 正在改变这种现状。[asyncio][3] 的引入和一个特别的 [async/await][4] 语法使得异步代码看起来像常规的阻塞代码一样，这使得 Python 成为了一个值得信赖的异步编程语言，所以我将尝试利用这些新特点来创建一个多人在线游戏。

###2、异步

一个游戏服务器应该可以接受尽可能多的用户并发连接，并实时处理这些连接。一个典型的解决方案是创建线程，然而在这种情况下并不能解决这个问题。运行上千的线程需要 CPU 在它们之间不停的切换（这叫做上下文切换），这将导致开销非常大，效率很低下。更糟糕的是使用进程来实现，因为，不但如此，它们还会占用大量的内存。在 Python 中，甚至还有一个问题，Python 的解释器（CPython）并不是针对多线程设计的，相反它主要针对于单线程应用实现最大的性能。这就是为什么它使用 GIL（global interpreter lock），这是一个不允许同时运行多线程 Python 代码的架构，以防止同一个共享对象出现使用不可控。正常情况下，在当前线程正在等待的时候，解释器会转换到另一个线程，通常是等待一个 I/O 的响应（举例说，比如等待 Web 服务器的响应）。这就允许在你的应用中实现非阻塞 I/O 操作，因为每一个操作仅仅阻塞一个线程而不是阻塞整个服务器。然而，这也使得通常的多线程方案变得几近无用，因为它不允许你并发执行 Python 代码，即使是在多核心的 CPU 上也是这样。而与此同时，在一个单一线程中拥有非阻塞 I/O 是完全有可能的，因而消除了经常切换上下文的需要。

实际上，你可以用纯 Python 代码来实现一个单线程的非阻塞 I/O。你所需要的只是标准的 [select][5] 模块，这个模块可以让你写一个事件循环来等待未阻塞的 socket 的 I/O。然而，这个方法需要你在一个地方定义所有 app 的逻辑，用不了多久，你的 app 就会变成非常复杂的状态机。有一些框架可以简化这个任务，比较流行的是 [tornade][6] 和 [twisted][7]。它们被用来使用回调方法实现复杂的协议（这和 Node.js 比较相似）。这种框架运行在它自己的事件循环中，按照定义的事件调用你的回调函数。并且，这或许是一些情况的解决方案，但是它仍然需要使用回调的方式编程，这使你的代码变得碎片化。与写同步代码并且并发地执行多个副本相比，这就像我们在普通的线程上做的一样。在单个线程上这为什么是不可能的呢？

这就是为什么出现微线程（microthread）概念的原因。这个想法是为了在一个线程上并发执行任务。当你在一个任务中调用阻塞的方法时，有一个叫做“manager” (或者“scheduler”)的东西在执行事件循环。当有一些事件准备处理的时候，一个 manager 会转移执行权给一个任务，并等着它执行完毕。任务将一直执行，直到它遇到一个阻塞调用，然后它就会将执行权返还给 manager。

> 微线程也称为轻量级线程（lightweight threads）或绿色线程（green threads）（来自于 Java 中的一个术语）。在伪线程中并发执行的任务叫做 tasklets、greenlets 或者协程（coroutines）。

 Python 中的微线程最早的实现之一是 [Stackless Python][8]。它之所以这么知名是因为它被用在了一个叫 [EVE online][9] 的非常有名的在线游戏中。这个 MMO 游戏自称说在一个持久的“宇宙”中，有上千个玩家在做不同的活动，这些都是实时发生的。Stackless 是一个独立的 Python 解释器，它代替了标准的函数栈调用，并且直接控制程序运行流程来减少上下文切换的开销。尽管这非常有效，这个解决方案不如在标准解释器中使用“软”库更流行，像 [eventlet][10] 和 [gevent][11] 的软件包配备了修补过的标准 I/O 库，I/O 函数会将执行权传递到内部事件循环。这使得将正常的阻塞代码转变成非阻塞的代码变得简单。这种方法的一个缺点是从代码上看这并不分明，它的调用是非阻塞的。新版本的 Python 引入了本地协程作为生成器的高级形式。在 Python 的 3.4 版本之后，引入了 asyncio 库，这个库依赖于本地协程来提供单线程并发。但是仅仅到了 Python  3.5 ，协程就变成了 Python 语言的一部分，使用新的关键字 async 和 await 来描述。这是一个简单的例子，演示了使用 asyncio 来运行并发任务。

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

我们启动了两个任务，一个睡眠 1 秒钟，另一个睡眠 2 秒钟，输出如下：

```
start sleeping for 1 seconds
start sleeping for 2 seconds
end sleeping for 1 seconds
end sleeping for 2 seconds
```

正如你所看到的，协程不会阻塞彼此——第二个任务在第一个结束之前启动。这发生的原因是 asyncio.sleep 是协程，它会返回执行权给调度器，直到时间到了。

在下一节中，我们将会使用基于协程的任务来创建一个游戏循环。

--------------------------------------------------------------------------------

via: https://7webpages.com/blog/writing-online-multiplayer-game-with-python-asyncio-getting-asynchronous/

作者：[Kyrylo Subbotin][a]
译者：[xinglianfly](https://github.com/xinglianfly)
校对：[wxy](https://github.com/wxy)

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
