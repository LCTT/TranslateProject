一个使用asyncio协程的网络爬虫
===


## 介绍

经典的计算机科学强调高效的算法，尽可能快地完成计算。但是很多网络程序的时间并不是消耗在计算上，而是在等待许多慢速的连接或者低频事件的发生。这些程序暴露出一个新的挑战：如何高效的等待大量网络事件。一个现代的解决方案是异步I/O。

这一章我们将实现一个简单的网络爬虫。这个爬虫只是一个原型式的异步应用，因为它等待许多响应而只做少量的计算。一次爬的网页越多，它就能越快的完成任务。如果它为每个动态的请求启动一个线程的话，随着并发请求数量的增加，它会在耗尽套接字之前，耗尽内存或者线程相关的资源。使用异步I/O可以避免这个的问题。

我们将分三个阶段展示这个例子。首先，我们会实现一个事件循环并用这个事件循环和回调来勾画出一个网络爬虫。它很有效，但是当把它扩展成更复杂的问题时，就会导致无法管理的混乱代码。然后，由于Python的协程不仅有效而且可扩展，我们将用Python的生成器函数实现一个简单的协程。在最后一个阶段，我们将使用Python标准库"asyncio"中功能完整的协程和异步队列完成这个网络爬虫。

## 任务

网络爬虫寻找并下载一个网站上的所有网页，也许还会把它们存档，为它们建立索引。从根URL开始，它获取每个网页，解析出没有遇到过的链接加到队列中。当网页没有未见到过的链接并且队列为空时，它便停止运行。

我们可以通过同时下载大量的网页来加快这一过程。当爬虫发现新的链接，它使用一个新的套接字并行的处理这个新链接，解析响应，添加新链接到队列。当并发很大时，可能会导致性能下降，所以我们会限制并发的数量，在队列保留那些未处理的链接，直到一些正在执行的任务完成。

## 传统方式

怎么使一个爬虫并发？传统的做法是创建一个线程池，每个线程使用一个套接字在一段时间内负责一个网页的下载。比如，下载xkcd.com网站的一个网页：

```python
def fetch(url):
    sock = socket.socket()
    sock.connect(('xkcd.com', 80))
    request = 'GET {} HTTP/1.0\r\nHost: xkcd.com\r\n\r\n'.format(url)
    sock.send(request.encode('ascii'))
    response = b''
    chunk = sock.recv(4096)
    while chunk:
        response += chunk
        chunk = sock.recv(4096)
    
    # Page is now downloaded.
    links = parse_links(response)
    q.add(links)
```

套接字操作默认是阻塞的：当一个线程调用一个类似`connect`和`recv`方法时，它会阻塞，直到操作完成.[^15]因此，为了同一时间内下载多个网页，我们需要很多线程。一个复杂的应用会通过线程池保持空闲的线程来分摊创建线程的开销。同样的做法也适用于套接字，使用连接池。

到目前为止，线程是昂贵的，操作系统对一个进程，一个用户，一台机器能使用线程做了不同的硬性限制。在Jesse系统中，一个Python线程需要50K的内存，开启上万个线程会失败。每个线程的开销和系统的限制就是这种方式的瓶颈所在。

在Dan Kegel那一篇很有影响力的文章"The C10K problem"[^8]中，它提出多线程方式在I/O并发上的局限性。他在开始写道，

>是时候网络服务器要同时处理成千上万的客户啦，你不这样认为么？毕竟，现在网络是个很大的地方。

Kegel在1999年创造出"C10K"术语。一万个连接在今天看来还是可接受的，但是问题依然存在，只不过大小不同。回到那时候，对于C10K问题，每个连接启一个线程是不切实际的。现在这个限制已经成指数级增长。确实，我们的玩具网络爬虫使用线程也可以工作的很好。但是，对于有着千万级连接的大规模应用来说，限制依然存在：会消耗掉所有线程，即使套接字还够用。那么我们该如何解决这个问题？

## 异步

异步I/O框架在一个线程中完成并发操作。让我们看看这是怎么做到的。

异步框架使用*非阻塞*套接字。异步爬虫中，我们在发起到服务器的连接前把套接字设为非阻塞：

```python
sock = socket.socket()
sock.setblocking(False)
try:
    sock.connect(('xkcd.com', 80))
except BlockingIOError:
    pass
```

对一个非阻塞套接字调用`connect`方法会立即抛出异常，即使它正常工作。这个异常模拟了底层C语言函数的行为，它把`errno`设置为`EINPROGRESS`,告诉你操作已经开始。

现在我们的爬虫需要一种知道连接何时建立的方法，这样它才能发送HTTP请求。我们可以简单地使用循环来重试：

```python
request = 'GET {} HTTP/1.0\r\nHost: xkcd.com\r\n\r\n'.format(url)
encoded = request.encode('ascii')

while True:
    try:
        sock.send(encoded)
        break  # Done.
    except OSError as e:
        pass

print('sent')
```

这种方法不仅消耗CPU，也不能有效的等待*多个*套接字。在远古时代，BSD Unix的解决方法是`select`,一个C函数，它在一个或一组非阻塞套接字上等待事件发生。现在，互联网应用大量连接的需求，导致`select`被`poll`代替，以及BSD的`kqueue`和Linux的`epoll`。它们的API和`select`相似，但在大数量的连接中也能有较好的性能。

Python 3.4的`DefaultSelector`使用你系统上最好的类`select`函数。去注册一个网络I/O事件，我们创建一个非阻塞套接字，并使用默认的selector注册。

```python
from selectors import DefaultSelector, EVENT_WRITE

selector = DefaultSelector()

sock = socket.socket()
sock.setblocking(False)
try:
    sock.connect(('xkcd.com', 80))
except BlockingIOError:
    pass

def connected():
    selector.unregister(sock.fileno())
    print('connected!')

selector.register(sock.fileno(), EVENT_WRITE, connected)
```

我们不理会这个伪造的错误，调用`selector.register`，传递套接字文件描述符，一个表示我们想要监听什么事件的常量。为了当连接建立时收到提醒，我们使用`EVENT_WRITE`:它表示什么时候这个套接字可写。我们还传递了一个Python函数，`connected`,当对应事件发生时被调用。这样的函数被称为*回调*。

我们在一个循环中处理I/O提醒，随着selector接收到它们。

```python
def loop():
    while True:
        events = selector.select()
        for event_key, event_mask in events:
            callback = event_key.data
            callback()
```

`connected`回调函数被保存在`event_key.data`中，一旦这个非阻塞套接字建立连接，它就会被取出来执行。

不像我们前面那个快速重试的循环，这里的`select`调用会阻塞，等待下一个I/O事件，接着执行等待这个事件的回调函数。

到目前为止我们展现了什么？我们展示了如何开始一个I/O操作和当操作准备好时调用回调函数。异步*框架*，它在单线程中执行并发操作，建立在两个功能之上，非阻塞套接字和事件循环。

## 回调

用我们刚刚建立的异步框架，怎么才能完成一个网络爬虫？即使是一个简单的网页下载程序也是很难写的。

首先，我们有一个未获取的URL集合，和一个已经解析过的URL集合。

```python
urls_todo = set(['/'])
seen_urls = set(['/'])
```

这两个集合加在一起就是所有的URL。用"/"初始化它们。

获取一个网页需要一系列的回调。在套接字连接建立时`connected`回调触发，它向服务器发送一个GET请求。但是它要等待响应，所以我们需要注册另一个回调函数，当回调被调用，它也不能一次读取完整的请求，所以，需要再一次注册，如此反复。

让我们把这些回调放在一个`Fetcher`对象中，它需要一个URL，一个套接字，还需要一个地方保存返回的字节：

```python
class Fetcher:
    def __init__(self, url):
        self.response = b''  # Empty array of bytes.
        self.url = url
        self.sock = None
```

我们的入口点在`Fetcher.fetch`:

```python
    # Method on Fetcher class.
    def fetch(self):
        self.sock = socket.socket()
        self.sock.setblocking(False)
        try:
            self.sock.connect(('xkcd.com', 80))
        except BlockingIOError:
            pass
            
        # Register next callback.
        selector.register(self.sock.fileno(),
                          EVENT_WRITE,
                          self.connected)
```

`fetch`方法从连接一个套接字开始。但是要注意这个方法在连接建立前就返回了。它必须返回到事件循环中等待连接建立。为了理解为什么要要这样，假设我们程序的整体结构如下：

```python
# Begin fetching http://xkcd.com/353/
fetcher = Fetcher('/353/')
fetcher.fetch()

while True:
    events = selector.select()
    for event_key, event_mask in events:
        callback = event_key.data
        callback(event_key, event_mask)
```

所有的事件提醒都在事件循环中的`select`函数后处理。所以`fetch`必须把控制权交给事件循环。这样我们的程序才能知道什么时候连接已建立，接着循环调用`connected`回调，它已经在`fetch`方法中注册过。

这里是我们`connected`方法的实现：

```python
    # Method on Fetcher class.
    def connected(self, key, mask):
        print('connected!')
        selector.unregister(key.fd)
        request = 'GET {} HTTP/1.0\r\nHost: xkcd.com\r\n\r\n'.format(self.url)
        self.sock.send(request.encode('ascii'))
        
        # Register the next callback.
        selector.register(key.fd,
                          EVENT_READ,
                          self.read_response)
```

这个方法发送一个GET请求。一个真正的应用会检查`send`的返回值，以防所有的信息没能一次发送出去。但是我们的请求很小，应用也不复杂。它只是简单的调用`send`，然后等待响应。当然，它必须注册另一个回调并把控制权交给事件循环。接下来也是最后一个回调函数`read_response`，它处理服务器的响应：

```python
    # Method on Fetcher class.
    def read_response(self, key, mask):
        global stopped

        chunk = self.sock.recv(4096)  # 4k chunk size.
        if chunk:
            self.response += chunk
        else:
            selector.unregister(key.fd)  # Done reading.
            links = self.parse_links()
            
            # Python set-logic:
            for link in links.difference(seen_urls):
                urls_todo.add(link)
                Fetcher(link).fetch()  # <- New Fetcher.

            seen_urls.update(links)
            urls_todo.remove(self.url)
            if not urls_todo:
                stopped = True
```

这个回调在每次selector发现套接字*可读*时被调用，可读有两种情况：套接字接受到数据或它被关闭。

这个回调函数从套接字读取4K数据。如果没有4k，那么有多少读多少。如果比4K多，`chunk`只包4K数据并且这个套接字保持可读，这样在事件循环的下一个周期，会在次回到这个回调函数。当响应完成时，服务器关闭这个套接字，`chunk`为空。

没有展示的`parse_links`方法，它返回一个URL集合。我们为每个新的URL启动一个fetcher。注意一个使用异步回调方式编程的好处：我们不需要为共享数据加锁，比如我们往`seen_urls`增加新链接时。这是一种非抢占式的多任务，它不会在我们代码中的任意一个地方中断。

我们增加了一个全局变量`stopped`，用它来控制这个循环：

```python
stopped = False

def loop():
    while not stopped:
        events = selector.select()
        for event_key, event_mask in events:
            callback = event_key.data
            callback()
```

一旦所有的网页被下载下来，fetcher停止这个事件循环，程序退出。

这个例子让异步编程的一个问题明显的暴露出来：意大利面代码。

我们需要某种方式来表达一串计算和I/O操作，并且能够调度多个这样的操作让他们并发的执行。但是，没有线程你不能把这一串操作写在一个函数中：当函数开始一个I/O操作，它明确的把未来所需的状态保存下来，然后返回。你需要考虑如何写这个状态保存的代码。

让我们来解释下这到底是什么意思。考虑在线程中使用通常的阻塞套接字来获取一个网页时是多么简单。

```python
# Blocking version.
def fetch(url):
    sock = socket.socket()
    sock.connect(('xkcd.com', 80))
    request = 'GET {} HTTP/1.0\r\nHost: xkcd.com\r\n\r\n'.format(url)
    sock.send(request.encode('ascii'))
    response = b''
    chunk = sock.recv(4096)
    while chunk:
        response += chunk
        chunk = sock.recv(4096)
    
    # Page is now downloaded.
    links = parse_links(response)
    q.add(links)
```

在一个套接字操作和下一个操作之间这个函数到底记住了什么？它有一个套接字，一个URL和一个可增长的`response`。运行在线程中的函数使用编程语言的基本功能，栈中的局部变量来保存临时的状态。这样的函数有一个"continuation"----在I/O结束后它要执行的代码。运行时通过线程的指令指针来记住这个continuation。你不必考虑怎么在I/O操作后恢复局部变量和这个continuation。语言本身的特性帮你解决。

但是用一个基于回调的异步框架，这些语言特性不能提供一点帮助。当等待I/O操作时，一个函数必须明确的保存它的状态，因为它会在I/O操作完成之前返回并清除栈帧。为了在我们基于回调的例子中代替局部变量，我们把`sock`和`response`作为Fetcher实例`self`属性。为了代替指令指针，它通过注册`connnected`和`read_response`回调来保存continuation。随着应用功能的增长，我们手动保存回调的复杂性也会增加。如此繁复的记账式工作会让编码者感到头痛。

更糟糕的是，当我们的回调函数抛出异常会发生什么？假设我们没有写好`parse_links`方法，它在解析HTML时抛出异常：

```
Traceback (most recent call last):
  File "loop-with-callbacks.py", line 111, in <module>
    loop()
  File "loop-with-callbacks.py", line 106, in loop
    callback(event_key, event_mask)
  File "loop-with-callbacks.py", line 51, in read_response
    links = self.parse_links()
  File "loop-with-callbacks.py", line 67, in parse_links
    raise Exception('parse error')
Exception: parse error
```

这个堆栈回溯只能显示出事件循环调用了一个回调。我们不知道是什么导致了这个错误。这条链的两边都被破坏：不知道从哪来也不知到哪去。这种丢失上下文的现象被称为"stack ripping"，它还会阻止我们为回调链设置异常处理。

所以，除了关于多线程和异步那个更高效的争议，还有一个关于这两者之间的争论，谁更容易出错。如果在同步上出现失误，线程更容易出现数据竞争的问题，而回调因为"stack ripping"问题而非常难于调试。

## 协程

还记得我们对你许下的承诺么？我们可以写出这样的异步代码，它既有回调方式的高效，也有多线程代码的简洁。这个结合是同过一种称为协程的模式来实现的。使用Python3.4标准库asyncio和一个叫"aiohttp"的包，在协程中获取一个网页是非常直接的[^10]：

```python
    @asyncio.coroutine
    def fetch(self, url):
        response = yield from self.session.get(url)
        body = yield from response.read()
```

它也是可扩展的。在Jesse系统上，与每个线程50k内存相比，一个Python协程只需要3k内存。Python很容易就可以启动上千个协程。

协程的概念可以追溯到计算机科学的远古时代，它很简单，一个可以暂停和恢复的子过程。线程是被操作系统控制的抢占式多任务，而协程是可合作的，它们自己选择什么时候暂停去执行下一个协程。

有很多协程的实现。甚至在Python中也有几种。Python3.4标准库asyncio中的协程，它是建立在生成器，一个Future类和"yield from"语句之上。从Python3.5开始，协程变成了语言本身的特性。然而，理解Python3.4中这个通过语言原有功能实现的协程，是我们处理Python3.5中原生协程的基础。

## 生成器如何工作

在你理解生成器之前，你需要知道普通的Python函数是怎么工作的。当一个函数调用一个子过程，这个被调用函数获得控制权。直到它返回或者有异常发生，才把控制权交给调用者：

```python
>>> def foo():
...     bar()
...
>>> def bar():
...     pass
```

标准的Python解释器是C语言写的。一个Python函数被调用对应的C函数是`PyEval_EvalFrameEx`。它获得一个Python栈帧结构并在这个栈帧的上下文中执行Python字节码。这里是`foo`的字节码：

```python
>>> import dis
>>> dis.dis(foo)
  2           0 LOAD_GLOBAL              0 (bar)
              3 CALL_FUNCTION            0 (0 positional, 0 keyword pair)
              6 POP_TOP
              7 LOAD_CONST               0 (None)
             10 RETURN_VALUE
```

`foo`函数在它栈中加载`bar`并调用它，然后把`bar`的返回值从栈中弹出，加载`None`值并返回。

当`PyEval_EvalFrameEx`遇到`CALL_FUNCTION`字节码时，它会创建一个新的栈帧，并用这个栈帧递归的调用`PyEval_EvalFrameEx`来执行`bar`函数。

图

非常重要的一点是，Python的栈帧在堆中分配！Python解释器是一个标准的C程序，所以他的栈帧是正常的栈帧。但是Python的栈帧是在堆中处理。这意味着Python栈帧在函数调用结束后依然可以存在。我们在`bar`函数中保存当前的栈帧，交互式的看看这种现象：

```python
>>> import inspect
>>> frame = None
>>> def foo():
...     bar()
...
>>> def bar():
...     global frame
...     frame = inspect.currentframe()
...
>>> foo()
>>> # The frame was executing the code for 'bar'.
>>> frame.f_code.co_name
'bar'
>>> # Its back pointer refers to the frame for 'foo'.
>>> caller_frame = frame.f_back
>>> caller_frame.f_code.co_name
'foo'
```

现在该说Python生成器了，它使用同样构件--code object和栈帧--去完成一个不可思议的任务。

这是一个生成器函数：

```python
>>> def gen_fn():
...     result = yield 1
...     print('result of yield: {}'.format(result))
...     result2 = yield 2
...     print('result of 2nd yield: {}'.format(result2))
...     return 'done'
...     
```

在Python把`gen_fn`编译成字节码的过程中，一旦它看到`yield`语句就知道这是一个生成器函数而不是普通的函数。它就会设置一个标志来记住这个事实：

```python
>>> # The generator flag is bit position 5.
>>> generator_bit = 1 << 5
>>> bool(gen_fn.__code__.co_flags & generator_bit)
True
```

当你调用一个生成器函数，Python看到这个标志，就不会运行它而是创建一个生成器：

```python
>>> gen = gen_fn()
>>> type(gen)
<class 'generator'>
```

Python生成器封装了一个栈帧和函数体代码：

```python
>>> gen.gi_code.co_name
'gen_fn'
```

所有通过调用`gen_fn`的生成器指向同一段代码，但都有各自的栈帧。这些栈帧不再任何一个C函数栈中，而是在堆空间中等待被使用：

图

栈帧中有一个指向最后执行指令的指针。初始化为-1，意味着它没开始运行：

```python
>>> gen.gi_frame.f_lasti
-1
```

当我们调用`send`时，生成器一直运行到第一个`yield`语句处停止。并且`send`返回1，yield语句后的表达式的值。

```python
>>> gen.send(None)
1
```

现在生成器的指令指针是3，字节码一共有56个字节：

```python
>>> gen.gi_frame.f_lasti
3
>>> len(gen.gi_code.co_code)
56
```

这个生成器可以在任何时候，任何函数中恢复运行，因为它的栈帧并不在真正的栈中，而是堆中。在调用链中它的位置也是不确定的，它不必遵循普通函数先进后出的顺序。它像云一样自由。

我们可以传递一个`hello`给生成器，它会成为yield语句的结果，并且生成器运行到第二个yield语句处。

```python
>>> gen.send('hello')
result of yield: hello
2
```

现在栈帧中包含局部变量`result`:

```python
>>> gen.gi_frame.f_locals
{'result': 'hello'}
```

其它从`gen_fn`创建的生成器有着它自己的栈帧和局部变量。

当我们在一次调用`send`，生成器从第二个yield开始运行，以抛出一个特殊的`StopIteration`异常为结束。

```python
>>> gen.send('goodbye')
result of 2nd yield: goodbye
Traceback (most recent call last):
  File "<input>", line 1, in <module>
StopIteration: done
```

这个异常有一个值"done"，它就是生成器的返回值。

## 使用生成器构建协程

所以生成器可以暂停，可以给它一个值让它恢复，并且它还有一个返回值。这些特性看起来很适合去建立一个不使用回调的异步编程模型。我们想创造一个协程：一个在程序中可以和其他过程合作调度的过程。我们的协程将会是标准库`asyncio`中协程的一个简化版本，我们将使用生成器，futures和`yield from`语句。

首先，我们需要一种方法去代表协程需要等待的未来事件。一个简化的版本是：

```python
class Future:
    def __init__(self):
        self.result = None
        self._callbacks = []

    def add_done_callback(self, fn):
        self._callbacks.append(fn)

    def set_result(self, result):
        self.result = result
        for fn in self._callbacks:
            fn(self)
```

一个future初始化为未解决的，它同过调用`set_result`来解决。[^12]

让我们用futures和协程来改写我们的fetcher。我们之前用回调写的fetcher如下：

```python
class Fetcher:
    def fetch(self):
        self.sock = socket.socket()
        self.sock.setblocking(False)
        try:
            self.sock.connect(('xkcd.com', 80))
        except BlockingIOError:
            pass
        selector.register(self.sock.fileno(),
                          EVENT_WRITE,
                          self.connected)

    def connected(self, key, mask):
        print('connected!')
        # And so on....
```

`fetch`方法开始连接一个套接字，然后注册`connected`回调函数，它会在套接字建立连接后调用。现在我们使用协程把这两步合并：

```python
    def fetch(self):
        sock = socket.socket()
        sock.setblocking(False)
        try:
            sock.connect(('xkcd.com', 80))
        except BlockingIOError:
            pass

        f = Future()

        def on_connected():
            f.set_result(None)

        selector.register(sock.fileno(),
                          EVENT_WRITE,
                          on_connected)
        yield f
        selector.unregister(sock.fileno())
        print('connected!')
```

现在，`fetch`是一个生成器，因为他有一个`yield`语句。我们创建一个未决的future，然后yield它，暂停执行直到套接字连接建立。内函数`on_connected`解决这个future。

但是当future被解决，谁来恢复这个生成器？我们需要一个协程驱动器。让我们叫它`task`:

```python
class Task:
    def __init__(self, coro):
        self.coro = coro
        f = Future()
        f.set_result(None)
        self.step(f)

    def step(self, future):
        try:
            next_future = self.coro.send(future.result)
        except StopIteration:
            return

        next_future.add_done_callback(self.step)

# Begin fetching http://xkcd.com/353/
fetcher = Fetcher('/353/')
Task(fetcher.fetch())

loop()
```

task通过传递一个None值给`fetch`来启动它。`fetch`运行到它yeild一个future，这个future被task捕获作为`next_future`。当套接字连接建立，事件循环运行回调函数`on_connected`，这里future被解决，`step`被调用，生成器恢复运行。

## 用`yield from`重构协程

一旦套接字连接建立，我们就可以发送HTTP请求，然后读取服务器响应。不再需要哪些分散在各处的回调函数，我们把它们放在同一个生成器函数中：

```python
    def fetch(self):
        # ... connection logic from above, then:
        sock.send(request.encode('ascii'))

        while True:
            f = Future()

            def on_readable():
                f.set_result(sock.recv(4096))

            selector.register(sock.fileno(),
                              EVENT_READ,
                              on_readable)
            chunk = yield f
            selector.unregister(sock.fileno())
            if chunk:
                self.response += chunk
            else:
                # Done reading.
                break
```

从套接字中读取所有信息的代码看起来很通用。我们能不把它提取成一个子过程？现在该Python3的`yield from`登场了。它能让一个生成器委托另一个生成器。

让我们先回到原来那个简单的生成器：

```python
>>> def gen_fn():
...     result = yield 1
...     print('result of yield: {}'.format(result))
...     result2 = yield 2
...     print('result of 2nd yield: {}'.format(result2))
...     return 'done'
...     
```

为了从其他生成器调用这个生成器，我们使用`yield from`:


```python
>>> # Generator function:
>>> def caller_fn():
...     gen = gen_fn()
...     rv = yield from gen
...     print('return value of yield-from: {}'
...           .format(rv))
...
>>> # Make a generator from the
>>> # generator function.
>>> caller = caller_fn()
```

这个`caller`的行为的和它委派的生成器表现的完全一致：

```python
>>> caller.send(None)
1
>>> caller.gi_frame.f_lasti
15
>>> caller.send('hello')
result of yield: hello
2
>>> caller.gi_frame.f_lasti  # Hasn't advanced.
15
>>> caller.send('goodbye')
result of 2nd yield: goodbye
return value of yield-from: done
Traceback (most recent call last):
  File "<input>", line 1, in <module>
StopIteration
```

注意到`caller`的指令指针保持15不变，就是`yield from`的地方，即使内部的生成器从一个yield语句运行到下一个yield，它始终不变。[^13]从`caller`外部来看，我们无法分辨yield出的值是来自`caller`还是它委派的生成器。而从`gen`内部来看，我们也不能分辨传给它的值是来自`caller`还是`caller`的外面。`yield from`是一个光滑的管道，值通过它进出`gen`，一直到`gen`结束。

协程可以用`yield from`把工作委派给子协程，还可以接受子协程的返回值。注意到上面的`caller`打印出"return value of yield-from: done"。当`gen`完成后，它的返回值成为`caller`中`yield from`语句的值。

```python
    rv = yield from gen
```

我们批评过基于回调的异步编程模式，其中最大的不满是关于`stack ripping`：当一个回调抛出异常，它的堆栈回溯通常是毫无用处的。它只显示出事件循环运行了它，而没有说为什么。那么协程怎么样？

```python
>>> def gen_fn():
...     raise Exception('my error')
>>> caller = caller_fn()
>>> caller.send(None)
Traceback (most recent call last):
  File "<input>", line 1, in <module>
  File "<input>", line 3, in caller_fn
  File "<input>", line 2, in gen_fn
Exception: my error
```

这还是比较有用的，当异常抛出时，堆栈回溯显示出`caller_fn`委派了`gen_fn`。令人更欣慰的是，你可以像正常函数一样使用异常处理：

```python
>>> def gen_fn():
...     yield 1
...     raise Exception('uh oh')
...
>>> def caller_fn():
...     try:
...         yield from gen_fn()
...     except Exception as exc:
...         print('caught {}'.format(exc))
...
>>> caller = caller_fn()
>>> caller.send(None)
1
>>> caller.send('hello')
caught uh oh
```

所以我们可以像提取子过程一样提取子协程。让我们从fetcher中提取一些有用的子协程。我们先写一个可以读一块数据的协程`read`：

```python
def read(sock):
    f = Future()

    def on_readable():
        f.set_result(sock.recv(4096))

    selector.register(sock.fileno(), EVENT_READ, on_readable)
    chunk = yield f  # Read one chunk.
    selector.unregister(sock.fileno())
    return chunk
```

在`read`的基础上，`read_all`协程读取整个信息：

```python
def read_all(sock):
    response = []
    # Read whole response.
    chunk = yield from read(sock)
    while chunk:
        response.append(chunk)
        chunk = yield from read(sock)

    return b''.join(response)
```

如果你换个角度看，它们看起来就像在做阻塞I/O的普通函数一样。但是事实上，`read`和`read_all`都是协程。yield from`read`暂停`read_all`直到I/O操作完成。当`read_all`暂停时，事件循环正在做其它的工作等待其他的I/O操作。`read`在下次循环中完成I/O操作时，`read_all`恢复运行。

现在，`fetch`可以直接调用`read_all`：

```python
class Fetcher:
    def fetch(self):
		 # ... connection logic from above, then:
        sock.send(request.encode('ascii'))
        self.response = yield from read_all(sock)
```

神奇的是，Task类不需要做任何改变，它像以前一样驱动`fetch`协程：

```python
Task(fetcher.fetch())
loop()
```

当`read`yield一个future时，task从`yield from`管道中接受它，就像直接从`fetch`接受一样。当循环解决一个future时，task把它的结果送给`fetch`,通过管道，`read`接受到这个值，这完全就像task直接驱动`read`一样：

图

亲爱的读者，我们已经完成了对asyncio协程探索。我们深入观察了生成器的机制，实现了简单的future和task。我们指出协程是如何利用两个世界的优点：比线程高效，比回调清晰。当然真正的asyncio比我们这个简化版本要复杂的多。真正的框架需要处理zero-copyI/0，公平调度，异常处理和其他大量特性。

使用asyncio编写协程代码比你现在看到的要简单的多。在前面的代码中，我们从基本原理去实现协程，所以你看到了回调，task和future，甚至非阻塞套接字和``select``调用。但是当用asyncio编写应用，这些都不会出现在你的代码中。我们承诺过，你可以像这样下载一个网页：

```python
    @asyncio.coroutine
    def fetch(self, url):
        response = yield from self.session.get(url)
        body = yield from response.read()
```

对我们的探索还满意么？回到我们原始的任务：使用asyncio写一个网络爬虫。

## 使用协程

我们从描述爬虫如何工作开始。现在是时候用asynio去实现它了。

我们爬虫从获取第一个网页开始，解析出链接并把它们加到队列中。此后它开始傲游整个网站，并发的获取网页。倒是由于客户端和服务端的限制，我们希望有一个最大数目的worker。任何时候一个worker完成一个网页的获取，它应该立即从队列中取出下一个链接。我们会遇到没有事干的时候，所以worker必须能够暂停。一旦又有worker获取一个有很多链接的网页，队列会突增，暂停的worker立马被唤醒。最后，当任务完成后我们的程序必须能退出。

假如你的worker是线程，怎样去描述你的算法？我们可以使用Python标准库中的同步队列。每次有新的一项加入，队列增加它的tasks计数器。线程worker完成一个任务后调用`task_done`。主线程阻塞在`Queue.join`，直到tasks计数器与`task_done`调用次数相匹配，然后退出。

通过个一asynio队列，协程使用和线程一样的模式来实现。首先我们导入它[^6]：

```python
try:
    from asyncio import JoinableQueue as Queue
except ImportError:
    # In Python 3.5, asyncio.JoinableQueue is
    # merged into Queue.
    from asyncio import Queue
```

我们把worker的共享状态收集在一个crawler类中,主要的逻辑写在`crawl`方法中。我们在一个协程中启动`crawl`,运行asyncio的事件循环直到`crawl`完成：

```python
loop = asyncio.get_event_loop()

crawler = crawling.Crawler('http://xkcd.com',
                           max_redirect=10)

loop.run_until_complete(crawler.crawl())
```

crawler用一个跟URL和最大重定向数来初始化，它把`(URL, max_redirect`)序对放入队列中。(为什么要这样做，敬请期待)

```python
class Crawler:
    def __init__(self, root_url, max_redirect):
        self.max_tasks = 10
        self.max_redirect = max_redirect
        self.q = Queue()
        self.seen_urls = set()
        
        # aiohttp's ClientSession does connection pooling and
        # HTTP keep-alives for us.
        self.session = aiohttp.ClientSession(loop=loop)
        
        # Put (URL, max_redirect) in the queue.
        self.q.put((root_url, self.max_redirect))
```

现在队列中未完成的任务数是1。回到我们的主程序，启动事件循环和`crawl`方法：

```python
loop.run_until_complete(crawler.crawl())
```
`crawl`协程唤起workers。它像一个主线程：阻塞在`join`上直到所有任务完成，同时workers在后台运行。

```python
    @asyncio.coroutine
    def crawl(self):
        """Run the crawler until all work is done."""
        workers = [asyncio.Task(self.work())
                   for _ in range(self.max_tasks)]

        # When all work is done, exit.
        yield from self.q.join()
        for w in workers:
            w.cancel()
```

如果worker是线程，可能我们不会一次把它们全部创建出来。为了避免创建线程的昂贵代价，通常一个线程池会按需增长。但是协程很便宜，我们简单的把他们全部创建出来。

怎么关闭这个`crawler`很有趣。当`join`完成，worker存活但是被暂停：他们等待更多的URL。所以主协程在退出之前清除它们。否则Python解释器关闭调用所有对象的析构函数，活着的worker叫喊到：

```
ERROR:asyncio:Task was destroyed but it is pending!
```

`cancel`又是如何工作的呢？生成器还有一个我们还没介绍的特点。你可以从外部抛一个异常给它：


```python
>>> gen = gen_fn()
>>> gen.send(None)  # Start the generator as usual.
1
>>> gen.throw(Exception('error'))
Traceback (most recent call last):
  File "<input>", line 3, in <module>
  File "<input>", line 2, in gen_fn
Exception: error
```

生成器被`throw`恢复，但是他现在抛出一个异常。如何生成器没有捕获异常的代码，这个异常被传递到顶层。所以注销一个协程：

```python
    # Method of Task class.
    def cancel(self):
        self.coro.throw(CancelledError)
```

任何时候生成器在`yield from`语句暂停，被恢复并且抛出一个异常。我们在task的`step`方法中处理撤销。

现在worker直到他被注销了，所以当它被销毁时,它不再抱怨。

一旦`crawl`注销了worker，它就退出。同时事件循环看见这个协程结束了，也就退出l。

```python
loop.run_until_complete(crawler.crawl())
```

`crawl`方法包含了所有主协程需要做的事。而worker则完成了从队列中获取URL，获取网页，解析它们得到新的链接。每个worker独立的运行`worker`协程：

```python
    @asyncio.coroutine
    def work(self):
        while True:
            url, max_redirect = yield from self.q.get()

            # Download page and add new links to self.q.
            yield from self.fetch(url, max_redirect)
            self.q.task_done()
```

Python看见这段代码包含`yield from`语句，就把它编译成生成器函数。所以在`crawl`方法中，我们调用了10次`self.work`,但并没有真正执行，它仅仅创建了10个生成器对象并把它们包装成Task对象。task接收生成器yield的future，通过调用send方法，future的结果做为send的参数，来驱动它。由于生成器有自己的栈帧，它们可以独立运行，独立的局部变量和指令指针。

worker使用队列来协调， 等待新的URL：

```python
    url, max_redirect = yield from self.q.get()
```

队列的`get `方法也是一个协程，它一直暂停到有新的URL进入队列。

碰巧，这也是最后crawl停止时，协程暂停的地方。当主协程注销worker时，从协程的角度，`yield from`抛出`CancelledError`结束了它在循环中的最后旅程。

worker获取一个网页，解析链接，把新的链接放入队列中，接着调用`task_done`减小计数器。最终一个worker遇到一个没有新链接的网页，并且队列里也没有任务，这次`task_done`的调用使计数器减为0，而`crawl`正阻塞在`join`方法上，现在它就可以结束了。

我们承诺过要解释为什么队列中要使用序对，像这样：

```python
# URL to fetch, and the number of redirects left.
('http://xkcd.com/353', 10)
```

新的URL的重定向次数是10。获取一个特别的URL会重定向一个新的位置。我们减小重定向次数，并把新的URL放入队列中。

```python
# URL with a trailing slash. Nine redirects left.
('http://xkcd.com/353/', 9)
```

我们使用的`aiohttp`默认的会重定向返回最终的结果。但是，我们告诉它不要这样做，爬虫自己处理重定向。所以它可以合并那些目的相同的重定向路径：如果我们已经看到一个URL，说明它已经从其他的地方走过这条路了。


```python
    @asyncio.coroutine
    def fetch(self, url, max_redirect):
        # Handle redirects ourselves.
        response = yield from self.session.get(
            url, allow_redirects=False)

        try:
            if is_redirect(response):
                if max_redirect > 0:
                    next_url = response.headers['location']
                    if next_url in self.seen_urls:
                        # We have been down this path before.
                        return
    
                    # Remember we have seen this URL.
                    self.seen_urls.add(next_url)
                    
                    # Follow the redirect. One less redirect remains.
                    self.q.put_nowait((next_url, max_redirect - 1))
    	     else:
    	         links = yield from self.parse_links(response)
    	         # Python set-logic:
    	         for link in links.difference(self.seen_urls):
                    self.q.put_nowait((link, self.max_redirect))
                self.seen_urls.update(links)
        finally:
            # Return connection to pool.
            yield from response.release()
```

如果这是多进程代码，就有可能遇到讨厌的竞争条件。比如，一个work检查一个链接是否在`seen_urls`中，如果没有它就把这个链接加到队列中并把它放到`seen_urls`中。如果它在这两步操作之间被中断，而另一个work解析到相同的链接，发现它并没有出现在`seen_urls`中就把它加入队列中。这导致同样的链接在队列中出现两次，做了重复的工作和错误的统计。

然而，一个协程只在`yield from`是才会被中断。这是协程比多线程少遇到竞争条件的关键。多线程必须获得锁来明确的进入一个临界区，否则它就是可中断的。而Python的协程默认是不会被中断的，只有它yield主动放弃控制权。

我们不再需要在用回调方式时的fetcher类了。这个类只是不高效回调的一个变通方法：在等待I/O时，它需要一个存储状态的地方，因为局部变量并不能在函数调用间保留。倒是`fetch`协程可以像普通函数一样用局部变量保存它的状态，所以我们不再需要一个类。

当`fetch`完成对服务器回应的处理，它返回到调用它的work。work调用`task_done`,接着从队列中取出一个URL。

当`fetch`把新的链接放入队列中，它增加未完成的任务计数器。主协程在等待`q.join`。而当没有新的链接并且这是队列中最后一个URL，work调用`task_done`，任务计数器变为0，主协程从`join`中退出。

与work和主协程一起工作的队列代码像这样：

```python
class Queue:
    def __init__(self):
        self._join_future = Future()
        self._unfinished_tasks = 0
        # ... other initialization ...
    
    def put_nowait(self, item):
        self._unfinished_tasks += 1
        # ... store the item ...

    def task_done(self):
        self._unfinished_tasks -= 1
        if self._unfinished_tasks == 0:
            self._join_future.set_result(None)

    @asyncio.coroutine
    def join(self):
        if self._unfinished_tasks > 0:
            yield from self._join_future
```

主协程`crawl`yield from`join`。所以当最后一个workd把计数器减为0，它告诉`crawl`恢复运行。

旅程快要结束了。我们的程序从`crawl`调用开始：

```python
loop.run_until_complete(self.crawler.crawl())
```

程序如何结束？因为`crawl`是一个生成器函数。调用它返回一个生成器。为了驱动它，asyncio把它包装成一个task：


class EventLoop:
    def run_until_complete(self, coro):
        """Run until the coroutine is done."""
        task = Task(coro)
        task.add_done_callback(stop_callback)
        try:
            self.run_forever()
        except StopError:
            pass

class StopError(BaseException):
    """Raised to stop the event loop."""

def stop_callback(future):
    raise StopError
```

当这个任务完成，它抛出`StopError`, 事件循环把这个异常当作正常退出的信号。

但是，task的`add_done_callbock`和`result`方法又是什么呢？你可能认为task就像一个future，不错，你的直觉是对的。我们必须承认一个向你隐藏的细节，task是future。

```python
class Task(Future):
    """A coroutine wrapped in a Future."""
```

通常，一个future被别人调用`set_result`。但是task，当协程结束时，它自己解决自己。记得我们解释过当Python生成器返回时，它抛出一个特殊的`StopIteration`异常：

```python
    # Method of class Task.
    def step(self, future):
        try:
            next_future = self.coro.send(future.result)
        except CancelledError:
            self.cancelled = True
            return
        except StopIteration as exc:

            # Task resolves itself with coro's return
            # value.
            self.set_result(exc.value)
            return

        next_future.add_done_callback(self.step)
```

所以当事件循环调用`task.add_done_callback(stop_callback)`，它就准备被这个task结束。在看一次`run_until_complete`；

```python
    # Method of event loop.
    def run_until_complete(self, coro):
        task = Task(coro)
        task.add_done_callback(stop_callback)
        try:
            self.run_forever()
        except StopError:
            pass
```

当task捕获`StopIteration`并解决自己，这个回调重循环中抛出`StopError`。循环结束调用栈回到`run_until_complete`。我们的程序结束。

## 总结

现代的程序越来越多是I/O密集型而不是CPU密集型。对于这样的程序，Python的线程和不合适：全局锁阻止真正的并行计算，并且抢占切换也导致他们更容易出现竞争。异步通常是正确的选择。但是随着基于回调的异步代码增加，它会变得非常混乱。协程是一个更整洁的替代者。它们自然的重构成子过程，有健全的异常处理和栈追溯。

如果我们换个角度看`yield from`语句，一个协程看起来像一个传统的线程。甚至我们采用金典的多线程模式编程，不需要重新发明。因此，与回调相比，协程更适合有经验的多线程的编码者。

但是当我们打开眼睛关注`yield from`语句，我们能看到协程放弃控制权的标志点。不像多线程，协程展示出我们的代码哪里可以被中断哪里不能。在Glyph Lefkowitz富有启发性的文章"Unyielding"[^4]："线程让局部推理变得困难，然而局部推理可能是软件开发中最重要的事"。然而，明确的yield，让"通过子过程本身而不是整个系统理解它的行为(应此，正确性)"成为可能。

这章写于Python和异步的复兴时期。你刚学到的基于生成器的的协程，在2014年发布在Python 3.4的"asyncio"模块。2015年9月，Python 3.5发布，协程成为语言的一部分。这个原生的协程通过"async def"来声明, 使用"await"而不是"yield from"委托一个协程或者等待Future。


除了这些优点，核心的思想不变。Python新的原生协程与生成器只是在语法上不同，工作原理非常相似。事实上，在Python解释器中它们公用同一个实现方法。Task，Future和事件循环扮演这在asynico中同样的角色。

你已经知道asyncio协程是如何工作的了，现在你可以忘记大部分的细节。这些机制隐藏在一个整洁的接口下。但是你对这基本原理的理解能让你在现代异步环境下正确而高效的编写代码。

[^4]: [https://glyph.twistedmatrix.com/2014/02/unyielding.html](https://glyph.twistedmatrix.com/2014/02/unyielding.html)

[^5]: [https://docs.python.org/3/library/queue.html](https://docs.python.org/3/library/queue.html)

[^6]: [https://docs.python.org/3/library/asyncio-sync.html](https://docs.python.org/3/library/asyncio-sync.html)

[^7]: For a complex solution to this problem, see [http://www.tornadoweb.org/en/stable/stack_context.html](http://www.tornadoweb.org/en/stable/stack_context.html)

[^8]: [http://www.kegel.com/c10k.html](http://www.kegel.com/c10k.html)

[^9]: The actual `asyncio.Queue` implementation uses an `asyncio.Event` in place of the Future shown here. The difference is an Event can be reset, whereas a Future cannot transition from resolved back to pending.

[^10]: The `@asyncio.coroutine` decorator is not magical. In fact, if it decorates a generator function and the `PYTHONASYNCIODEBUG` environment variable is not set, the decorator does practically nothing. It just sets an attribute, `_is_coroutine`, for the convenience of other parts of the framework. It is possible to use asyncio with bare generators not decorated with `@asyncio.coroutine` at all.

<latex>
[^11]: Jesse listed indications and contraindications for using async in "What Is Async, How Does It Work, And When Should I Use It?", available at pyvideo.org. 
[^bayer]: Mike Bayer compared the throughput of asyncio and multithreading for different workloads in his "Asynchronous Python and Databases": http://techspot.zzzeek.org/2015/02/15/asynchronous-python-and-databases/
</latex>
<markdown>
[^11]: Jesse listed indications and contraindications for using async in ["What Is Async, How Does It Work, And When Should I Use It?":](http://pyvideo.org/video/2565/what-is-async-how-does-it-work-and-when-should). Mike Bayer compared the throughput of asyncio and multithreading for different workloads in ["Asynchronous Python and Databases":](http://techspot.zzzeek.org/2015/02/15/asynchronous-python-and-databases/)
</markdown>

[^12]: This future has many deficiencies. For example, once this future is resolved, a coroutine that yields it should resume immediately instead of pausing, but with our code it does not. See asyncio's Future class for a complete implementation.

[^13]: In fact, this is exactly how "yield from" works in CPython. A function increments its instruction pointer before executing each statement. But after the outer generator executes "yield from", it subtracts 1 from its instruction pointer to keep itself pinned at the "yield from" statement. Then it yields to *its* caller. The cycle repeats until the inner generator throws `StopIteration`, at which point the outer generator finally allows itself to advance to the next instruction.

[^14]: Python's global interpreter lock prohibits running Python code in parallel in one process anyway. Parallelizing CPU-bound algorithms in Python requires multiple processes, or writing the parallel portions of the code in C. But that is a topic for another day.

[^15]: Even calls to `send` can block, if the recipient is slow to acknowledge outstanding messages and the system's buffer of outgoing data is full.

<markdown>
[^16]: Guido introduced the standard asyncio library, called "Tulip" then, at [PyCon 2013](http://pyvideo.org/video/1667/keynote).
</markdown>
<latex>
[^16]: Guido introduced the standard asyncio library, called "Tulip" then, at PyCon 2013.
</latex>

[^17]: Python 3.5's built-in coroutines are described in [PEP 492](https://www.python.org/dev/peps/pep-0492/), "Coroutines with async and await syntax."

--------------------------------------
via: http://aosabook.org/en/500L/pages/a-web-crawler-with-asyncio-coroutines.html

作者： A. Jesse Jiryu Davis and Guido van Rossum
译者：[qingyunha](https://github.com/qingyunha)
校对：

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出 
