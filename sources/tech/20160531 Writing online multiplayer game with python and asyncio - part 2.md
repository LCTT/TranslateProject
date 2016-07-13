chunyang-wen translating
Writing online multiplayer game with python and asyncio - Part 2
==================================================================

![](https://7webpages.com/media/cache/fd/d1/fdd1f8f8bbbf4166de5f715e6ed0ac00.gif)

Have you ever made an asynchronous Python app? Here I’ll tell you how to do it and in the next part, show it on a [working example][1] - a popular Snake game, designed for multiple players.

see the intro and theory about how to [Get Asynchronous [part 1]][2]

[Play the game][3]

### 3. Writing game loop

The game loop is a heart of every game. It runs continuously to get player's input, update state of the game and render the result on the screen. In online games the loop is divided into client and server parts, so basically there are two loops which communicate over the network. Usually, client role is to get player's input, such as keypress or mouse movement, pass this data to a server and get back the data to render. The server side is processing all the data coming from players, updating game's state, doing necessary calculations to render next frame and passes back the result, such as new placement of game objects. It is very important not to mix client and server roles without a solid reason. If you start doing game logic calculations on the client side, you can easily go out of sync with other clients, and your game can also be created by simply passing any data from the client side.

A game loop iteration is often called a tick. Tick is an event meaning that current game loop iteration is over and the data for the next frame(s) is ready.
In the next examples we will use the same client, which connects to a server from a web page using WebSocket. It runs a simple loop which passes pressed keys' codes to the server and displays all messages that come from the server. [Client source code is located here][4].

#### Example 3.1: Basic game loop

[Example 3.1 source code][5]

We will use [aiohttp][6] library to create a game server. It allows creating web servers and clients based on asyncio. A good thing about this library is that it supports normal http requests and websockets at the same time. So we don't need other web servers to render game's html page.

Here is how we run the server:

```
app = web.Application()
app["sockets"] = []

asyncio.ensure_future(game_loop(app))

app.router.add_route('GET', '/connect', wshandler)
app.router.add_route('GET', '/', handle)

web.run_app(app)
```

web.run_app is a handy shortcut to create server's main task and to run asyncio event loop with it's run_forever() method. I suggest you check the source code of this method to see how the server is actually created and terminated.

An app is a dict-like object which can be used to share data between connected clients. We will use it to store a list of connected sockets. This list is then used to send notification messages to all connected clients. A call to asyncio.ensure_future() will schedule our main game_loop task which sends 'tick' message to clients every 2 seconds. This task will run concurrently in the same asyncio event loop along with our web server.

There are 2 web request handlers: handle just serves a html page and wshandler is our main websocket server's task which handles interaction with game clients. With every connected client a new wshandler task is launched in the event loop. This task adds client's socket to the list, so that game_loop task may send messages to all the clients. Then it echoes every keypress back to the client with a message.

In the launched tasks we are running worker loops over the main event loop of asyncio. A switch between tasks happens when one of them uses await statement to wait for a coroutine to finish. For instance, asyncio.sleep just passes execution back to a scheduler for a given amount of time, and ws.receive() is waiting for a message from websocket, while the scheduler may switch to some other task.

After you open the main page in a browser and connect to the server, just try to press some keys. Their codes will be echoed back from the server and every 2 seconds this message will be overwritten by game loop's 'tick' message which is sent to all clients.

So we have just created a server which is processing client's keypresses, while the main game loop is doing some work in the background and updates all clients periodically.

#### Example 3.2: Starting game loop by request

[Example 3.2 source code][7]

In the previous example a game loop was running continuously all the time during the life of the server. But in practice, there is usually no sense to run game loop when no one is connected. Also, there may be different game "rooms" running on one server. In this concept one player "creates" a game session (a match in a multiplayer game or a raid in MMO for example) so other players may join it. Then a game loop runs while the game session continues.

In this example we use a global flag to check if a game loop is running, and we start it when the first player connects. In the beginning, a game loop is not running, so the flag is set to False. A game loop is launched from the client's handler:

```
  if app["game_is_running"] == False:
        asyncio.ensure_future(game_loop(app))
```

This flag is then set to True at the start of game loop() and then back to False in the end, when all clients are disconnected.

#### Example 3.3: Managing tasks

[Example 3.3 source code][8]

This example illustrates working with task objects. Instead of storing a flag, we store game loop's task directly in our application's global dict. This may be not an optimal thing to do in a simple case like this, but sometimes you may need to control already launched tasks.
```
    if app["game_loop"] is None or \
       app["game_loop"].cancelled():
        app["game_loop"] = asyncio.ensure_future(game_loop(app))
```

Here ensure_future() returns a task object that we store in a global dict; and when all users disconnect, we cancel it with

```
    app["game_loop"].cancel()
```

This cancel() call tells scheduler not to pass execution to this coroutine anymore and sets its state to cancelled which then can be checked by cancelled() method. And here is one caveat worth to mention: when you have external references to a task object and exception happens in this task, this exception will not be raised. Instead, an exception is set to this task and may be checked by exception() method. Such silent fails are not useful when debugging a code. Thus, you may want to raise all exceptions instead. To do so you need to call result() method of unfinished task explicitly. This can be done in a callback:

```
    app["game_loop"].add_done_callback(lambda t: t.result())
```

Also if we are going to cancel this task in our code and we don't want to have CancelledError exception, it has a point checking its "cancelled" state:
```
    app["game_loop"].add_done_callback(lambda t: t.result()
                                       if not t.cancelled() else None)
```

Note that this is required only if you store a reference to your task objects. In the previous examples all exceptions are raised directly without additional callbacks.

#### Example 3.4: Waiting for multiple events

[Example 3.4 source code][9]

In many cases, you need to wait for multiple events inside client's handler. Beside a message from a client, you may need to wait for different types of things to happen. For instance, if your game's time is limited, you may wait for a signal from timer. Or, you may wait for a message from other process using pipes. Or, for a message from a different server in the network, using a distributed messaging system.

This example is based on example 3.1 for simplicity. But in this case we use Condition object to synchronize game loop with connected clients. We do not keep a global list of sockets here as we are using sockets only within the handler. When game loop iteration ends, we notify all clients using Condition.notify_all() method. This method allows implementing publish/subscribe pattern within asyncio event loop.

To wait for two events in the handler, first, we wrap awaitable objects in a task using ensure_future()

```
    if not recv_task:
        recv_task = asyncio.ensure_future(ws.receive())
    if not tick_task:
        await tick.acquire()
        tick_task = asyncio.ensure_future(tick.wait())
```

Before we can call Condition.wait(), we need to acquire a lock behind it. That is why, we call tick.acquire() first. This lock is then released after calling tick.wait(), so other coroutines may use it too. But when we get a notification, a lock will be acquired again, so we need to release it calling tick.release() after received notification.

We are using asyncio.wait() coroutine to wait for two tasks.

```
    done, pending = await asyncio.wait(
        [recv_task,
         tick_task],
        return_when=asyncio.FIRST_COMPLETED)
```

It blocks until either of tasks from the list is completed. Then it returns 2 lists: tasks which are done and tasks which are still running. If the task is done, we set it to None so it may be created again on the next iteration.

#### Example 3.5: Combining with threads

[Example 3.5 source code][10]

In this example we combine asyncio loop with threads by running the main game loop in a separate thread. As I mentioned before, it's not possible to perform real parallel execution of python code with threads because of GIL. So it is not a good idea to use other thread to do heavy calculations. However, there is one reason to use threads with asyncio: this is the case when you need to use other libraries which do not support asyncio. Using these libraries in the main thread will simply block execution of the loop, so the only way to use them asynchronously is to run in a different thread.

We run game loop using run_in_executor() method of asyncio loop and ThreadPoolExecutor. Note that game_loop() is not a coroutine anymore. It is a function that is executed in another thread. However, we need to interact with the main thread to notify clients on the game events. And while asyncio itself is not threadsafe, it has methods which allow running your code from another thread. These are call_soon_threadsafe() for normal functions and run_coroutine_threadsafe() for coroutines. We will put a code which notifies clients about game's tick to notify() coroutine and runs it in the main event loop from another thread.

```
def game_loop(asyncio_loop):
    print("Game loop thread id {}".format(threading.get_ident()))
    async def notify():
        print("Notify thread id {}".format(threading.get_ident()))
        await tick.acquire()
        tick.notify_all()
        tick.release()

    while 1:
        task = asyncio.run_coroutine_threadsafe(notify(), asyncio_loop)
        # blocking the thread
        sleep(1)
        # make sure the task has finished
        task.result()
```

When you launch this example, you will see that "Notify thread id" is equal to "Main thread id", this is because notify() coroutine is executed in the main thread. While sleep(1) call is executed in another thread, and, as a result, it will not block the main event loop.

#### Example 3.6: Multiple processes and scaling up

[Example 3.6 source code][11]

One threaded server may work well, but it is limited to one CPU core. To scale the server beyond one core, we need to run multiple processes containing their own event loops. So we need a way for processes to interact with each other by exchanging messages or sharing game's data. Also in games, it is often required to perform heavy calculations, such as path finding and alike. These tasks are sometimes not possible to complete quickly within one game tick. It is not recommended to perform time-consuming calculations in coroutines, as it will block event processing, so in this case, it may be reasonable to pass the heavy task to other process running in parallel.

The easiest way to utilize multiple cores is to launch multiple single core servers, like in the previous examples, each on a different port. You can do this with supervisord or similar process-controller system. Then, you may use a load balancer, such as HAProxy, to distribute connecting clients between the processes. There are different ways for processes to interact wich each other. One is to use network-based systems, which allows you to scale to multiple servers as well. There are already existing adapters to use popular messaging and storage systems with asyncio. Here are some examples:

- [aiomcache][12] for memcached client
- [aiozmq][13] for zeroMQ
- [aioredis][14] for Redis storage and pub/sub

You can find many other packages like this on github and pypi, most of them have "aio" prefix.

Using network services may be effective to store persistent data and exchange some kind of messages. But its performance may be not enough if you need to perform real-time data processing that involves inter-process communications. In this case, a more appropriate way may be using standard unix pipes. asyncio has support for pipes and there is a [very low-level example of the server which uses pipes][15] in aiohttp repository.

In the current example, we will use python's high-level [multiprocessing][16] library to instantiate new process to perform heavy calculations on a different core and to exchange messages with this process using multiprocessing.Queue. Unfortunately, the current implementation of multiprocessing is not compatible with asyncio. So every blocking call will block the event loop. But this is exactly the case where threads will be helpful because if we run multiprocessing code in a different thread, it will not block our main thread. All we need is to put all inter-process communications to another thread. This example illustrates this technique. It is very similar to multi-threading example above, but we create a new process from a thread.

```
def game_loop(asyncio_loop):
    # coroutine to run in main thread
    async def notify():
        await tick.acquire()
        tick.notify_all()
        tick.release()

    queue = Queue()

    # function to run in a different process
    def worker():
        while 1:
            print("doing heavy calculation in process {}".format(os.getpid()))
            sleep(1)
            queue.put("calculation result")

    Process(target=worker).start()

    while 1:
        # blocks this thread but not main thread with event loop
        result = queue.get()
        print("getting {} in process {}".format(result, os.getpid()))
        task = asyncio.run_coroutine_threadsafe(notify(), asyncio_loop)
        task.result()
```

Here we run worker() function in another process. It contains a loop doing heavy calculations and putting results to the queue, which is an instance of multiprocessing.Queue. Then we get the results and notify clients in the main event loop from a different thread, exactly as in the example 3.5. This example is very simplified, it doesn't have a proper termination of the process. Also, in a real game, we would probably use the second queue to pass data to the worker.

There is a project called [aioprocessing][17], which is a wrapper around multiprocessing that makes it compatible with asyncio. However, it uses exactly the same approach as described in this example - creating processes from threads. It will not give you any advantage, other than hiding these tricks behind a simple interface. Hopefully, in the next versions of Python, we will get a multiprocessing library based on coroutines and supports asyncio.

>Important! If you are going to run another asyncio event loop in a different thread or sub-process created from main thread/process, you need to create a loop explicitly, using asyncio.new_event_loop(), otherwise, it will not work.

--------------------------------------------------------------------------------

via: https://7webpages.com/blog/writing-online-multiplayer-game-with-python-and-asyncio-writing-game-loop/

作者：[Kyrylo Subbotin][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://7webpages.com/blog/writing-online-multiplayer-game-with-python-and-asyncio-writing-game-loop/
[1]: http://snakepit-game.com/
[2]: https://7webpages.com/blog/writing-online-multiplayer-game-with-python-asyncio-getting-asynchronous/
[3]: http://snakepit-game.com/
[4]: https://github.com/7WebPages/snakepit-game/blob/master/simple/index.html
[5]: https://github.com/7WebPages/snakepit-game/blob/master/simple/game_loop_basic.py
[6]: http://aiohttp.readthedocs.org/
[7]: https://github.com/7WebPages/snakepit-game/blob/master/simple/game_loop_handler.py
[8]: https://github.com/7WebPages/snakepit-game/blob/master/simple/game_loop_global.py
[9]: https://github.com/7WebPages/snakepit-game/blob/master/simple/game_loop_wait.py
[10]: https://github.com/7WebPages/snakepit-game/blob/master/simple/game_loop_thread.py
[11]: https://github.com/7WebPages/snakepit-game/blob/master/simple/game_loop_process.py
[12]: https://github.com/aio-libs/aiomcache
[13]: https://github.com/aio-libs/aiozmq
[14]: https://github.com/aio-libs/aioredis
[15]: https://github.com/KeepSafe/aiohttp/blob/master/examples/mpsrv.py
[16]: https://docs.python.org/3.5/library/multiprocessing.html
[17]: https://github.com/dano/aioprocessing
