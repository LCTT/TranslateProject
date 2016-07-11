xinglianfly translate
Writing online multiplayer game with python and asyncio - part 1
===================================================================

Have you ever combined async with Python? Here I’ll tell you how to do it and show it on a [working example][1] - a popular Snake game, designed for multiple players.

[Play gmae][2]

### 1. Introduction

Massive multiplayer online games are undoubtedly one of the main trends of our century, in both tech and cultural domains. And while for a long time writing a server for a MMO game was associated with massive budgets and complex low-level programming techniques, things are rapidly changing in the recent years. Modern frameworks based on dynamic languages allow handling thousands of parallel user connections on moderate hardware. At the same time, HTML 5 and WebSockets standards enabled the creation of real-time graphics-based game clients that run directly in web browser, without any extensions.

Python may be not the most popular tool for creating scalable non-blocking servers, especially comparing to node.js popularity in this area. But the latest versions of Python are aimed to change this. The introduction of [asyncio][3] library and a special [async/await][4] syntax makes asynchronous code look as straightforward as regular blocking code, which now makes Python a worthy choice for asynchronous programming. So I will try to utilize these new features to demonstrate a way to create an online multiplayer game.

### 2. Getting asynchronous

A game server should handle a maximum possible number of parallel users' connections and process them all in real time. And a typical solution - creating threads, doesn't solve a problem in this case. Running thousands of threads requires CPU to switch between them all the time (it is called context switching), which creates big overhead, making it very ineffective. Even worse with processes, because, in addition, they do occupy too much memory. In Python there is even one more problem - regular Python interpreter (CPython) is not designed to be multithreaded, it aims to achieve maximum performance for single-threaded apps instead. That's why it uses GIL (global interpreter lock), a mechanism which doesn't allow multiple threads to run Python code at the same time, to prevent uncontrolled usage of the same shared objects. Normally the interpreter switches to another thread when currently running thread is waiting for something, usually a response from I/O (like a response from web server for example). This allows having non-blocking I/O operations in your app, because every operation blocks only one thread instead of blocking the whole server. However, it also makes general multithreading idea nearly useless, because it doesn't allow you to execute python code in parallel, even on multi-core CPU. While at the same time it is completely possible to have non-blocking I/O in one single thread, thus eliminating the need of heavy context-switching.

Actually, a single-threaded non-blocking I/O is a thing you can do in pure python. All you need is a standard [select][5] module which allows you to write an event loop waiting for I/O from non-blocking sockets. However, this approach requires you to define all the app logic in one place, and soon your app becomes a very complex state-machine. There are frameworks that simplify this task, most popular are [tornado][6] and [twisted][7]. They are utilized to implement complex protocols using callback methods (and this is similar to node.js). The framework runs its own event loop invoking your callbacks on the defined events. And while this may be a way to go for some, it still requires programming in callback style, what makes your code fragmented. Compare this to just writing synchronous code and running multiple copies concurrently, like we would do with normal threads. Why wouldn't this be possible in one thread?

And this is where the concept of microthreads come in. The idea is to have concurrently running tasks in one thread. When you call a blocking function in one task, behind the scenes it calls a "manager" (or "scheduler") that runs an event loop. And when there is some event ready to process, a manager passes execution to a task waiting for it. That task will also run until it reaches a blocking call, and then it will return execution to a manager again.

>Microthreads are also called lightweight threads or green threads (a term which came from Java world). Tasks which are running concurrently in pseudo-threads are called tasklets, greenlets or coroutines.

One of the first implementations of microthreads in Python was [Stackless Python][8]. It got famous because it is used in a very successful online game [EVE online][9]. This MMO game boasts about a persistent universe, where thousands of players are involved in different activities, all happening in the real time. Stackless is a standalone Python interpreter which replaces standard function calling stack and controls the flow directly to allow minimum possible context-switching expenses. Though very effective, this solution remained less popular than "soft" libraries that work with a standard interpreter. Packages like [eventlet][10] and [gevent][11] come with patching of a standard I/O library in the way that I/O function pass execution to their internal event loop. This allows turning normal blocking code into non-blocking in a very simple way. The downside of this approach is that it is not obvious from the code, which calls are non-blocking. A newer version of Python introduced native coroutines as an advanced form of generators. Later in Python 3.4 they included asyncio library which relies on native coroutines to provide single-thread concurrency. But only in python 3.5 coroutines became an integral part of python language, described with the new keywords async and await. Here is a simple example, which illustrates using asyncio to run concurrent tasks:

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

We launch two tasks, one sleeps for 1 second, the other - for 2 seconds. The output is:

```
start sleeping for 1 seconds
start sleeping for 2 seconds
end sleeping for 1 seconds
end sleeping for 2 seconds
```

As you can see, coroutines do not block each other - the second task starts before the first is finished. This is happening because asyncio.sleep is a coroutine which returns execution to a scheduler until the time will pass. In the next section, we will use coroutine-based tasks to create a game loop.

--------------------------------------------------------------------------------

via: https://7webpages.com/blog/writing-online-multiplayer-game-with-python-asyncio-getting-asynchronous/

作者：[Kyrylo Subbotin][a]
译者：[译者ID](https://github.com/译者ID)
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
