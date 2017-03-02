从零构建一个简单的 Python 框架
===================================

为什么你想要自己构建一个 web 框架呢？我想，原因有以下几点：

- 你有一个新奇的想法，觉得将会取代其他的框架
- 你想要获得一些名气
- 你遇到的问题很独特，以至于现有的框架不太合适
- 你对 web 框架是如何工作的很感兴趣，因为你想要成为一位更好的 web 开发者。

接下来的笔墨将着重于最后一点。这篇文章旨在通过对设计和实现过程一步一步的阐述告诉读者，我在完成一个小型的服务器和框架之后学到了什么。你可以在这个[代码仓库][1]中找到这个项目的完整代码。

我希望这篇文章可以鼓励更多的人来尝试，因为这确实很有趣。它让我知道了 web 应用是如何工作的，而且这比我想的要容易的多！

### 范围

框架可以处理请求-响应周期、身份认证、数据库访问、模板生成等部分工作。Web 开发者使用框架是因为，大多数的 web 应用拥有大量相同的功能，而对每个项目都重新实现同样的功能意义不大。

比较大的的框架如 Rails 和 Django 实现了高层次的抽象，或者说“自备电池”（“batteries-included”，这是 Python 的口号之一，意即所有功能都自足。）。而实现所有的这些功能可能要花费数千小时，因此在这个项目上，我们重点完成其中的一小部分。在开始写代码前，我先列举一下所需的功能以及限制。

功能：

- 处理 HTTP 的 GET 和 POST 请求。你可以在[这篇 wiki][2] 中对 HTTP 有个大致的了解。
- 实现异步操作（我*喜欢* Python 3 的 asyncio 模块）。
- 简单的路由逻辑以及参数撷取。
- 像其他微型框架一样，提供一个简单的用户级 API 。
- 支持身份认证，因为学会这个很酷啊（微笑）。

限制：

- 将只支持 HTTP 1.1 的一个小子集，不支持传输编码（transfer-encoding）、HTTP 认证（http-auth）、内容编码（content-encoding，如 gzip）以及[持久化连接][3]等功能。
- 不支持对响应内容的 MIME 判断 - 用户需要手动指定。
- 不支持 WSGI - 仅能处理简单的 TCP 连接。
- 不支持数据库。

我觉得一个小的用例可以让上述内容更加具体，也可以用来演示这个框架的 API：

```
from diy_framework import App, Router
from diy_framework.http_utils import Response


# GET simple route
async def home(r):
    rsp = Response()
    rsp.set_header('Content-Type', 'text/html')
    rsp.body = '<html><body><b>test</b></body></html>'
    return rsp


# GET route + params
async def welcome(r, name):
    return "Welcome {}".format(name)

# POST route + body param
async def parse_form(r):
    if r.method == 'GET':
        return 'form'
    else:
        name = r.body.get('name', '')[0]
        password = r.body.get('password', '')[0]

       return "{0}:{1}".format(name, password)

# application = router + http server
router = Router()
router.add_routes({
    r'/welcome/{name}': welcome,
    r'/': home,
    r'/login': parse_form,})

app = App(router)
app.start_server()
```
'
用户需要定义一些能够返回字符串或 `Response` 对象的异步函数，然后将这些函数与表示路由的字符串配对，最后通过一个函数调用（`start_server`）开始处理请求。

完成设计之后，我将它抽象为几个我需要编码的部分：

- 接受 TCP 连接以及调度一个异步函数来处理这些连接的部分
- 将原始文本解析成某种抽象容器的部分
- 对于每个请求，用来决定调用哪个函数的部分
- 将上述部分集中到一起，并为开发者提供一个简单接口的部分

我先编写一些测试，这些测试被用来描述每个部分的功能。几次重构后，整个设计被分成若干部分，每个部分之间是相对解耦的。这样就非常好，因为每个部分可以被独立地研究学习。以下是我上文列出的抽象的具体体现：

- 一个 HTTPServer 对象，需要一个 Router 对象和一个 http_parser 模块，并使用它们来初始化。
- HTTPConnection 对象，每一个对象表示一个单独的客户端 HTTP 连接，并且处理其请求-响应周期：使用 http_parser 模块将收到的字节流解析为一个 Request 对象；使用一个 Router 实例寻找并调用正确的函数来生成一个响应；最后将这个响应发送回客户端。
- 一对 Request 和 Response 对象为用户提供了一种友好的方式，来处理实质上是字节流的字符串。用户不需要知道正确的消息格式和分隔符是怎样的。
- 一个包含“路由:函数”对应关系的 Router 对象。它提供一个添加配对的方法，可以根据 URL 路径查找到相应的函数。
- 最后，一个 App 对象。它包含配置信息，并使用它们实例化一个 HTTPServer 实例。

让我们从 `HTTPConnection` 开始来讲解各个部分。

### 模拟异步连接

为了满足上述约束条件，每一个 HTTP 请求都是一个单独的 TCP 连接。这使得处理请求的速度变慢了，因为建立多个 TCP 连接需要相对高的花销（DNS 查询，TCP 三次握手，[慢启动][4]等等的花销），不过这样更加容易模拟。对于这一任务，我选择相对高级的 [asyncio-stream][5] 模块，它建立在 [asyncio 的传输和协议][6]的基础之上。我强烈推荐你读一读标准库中的相应代码，很有意思！

一个 `HTTPConnection` 的实例能够处理多个任务。首先，它使用 `asyncio.StreamReader` 对象以增量的方式从 TCP 连接中读取数据，并存储在缓存中。每一个读取操作完成后，它会尝试解析缓存中的数据，并生成一个 `Request` 对象。一旦收到了这个完整的请求，它就生成一个回复，并通过 `asyncio.StreamWriter` 对象发送回客户端。当然，它还有两个任务：超时连接以及错误处理。

你可以在[这里][7]浏览这个类的完整代码。我将分别介绍代码的每一部分。为了简单起见，我移除了代码文档。

```
class HTTPConnection(object):
    def init(self, http_server, reader, writer):
        self.router = http_server.router
        self.http_parser = http_server.http_parser
        self.loop = http_server.loop

        self._reader = reader
        self._writer = writer
        self._buffer = bytearray()
        self._conn_timeout = None
        self.request = Request()
```

这个 `init` 方法没啥意思，它仅仅是收集了一些对象以供后面使用。它存储了一个 `router` 对象、一个 `http_parser` 对象以及 `loop` 对象，分别用来生成响应、解析请求以及在事件循环中调度任务。

然后，它存储了代表一个 TCP 连接的读写对，和一个充当原始字节缓冲区的空[字节数组][8]。`_conn_timeout` 存储了一个 [asyncio.Handle][9] 的实例，用来管理超时逻辑。最后，它还存储了 `Request` 对象的一个单一实例。

下面的代码是用来接受和发送数据的核心功能：

```
async def handle_request(self):
    try:
        while not self.request.finished and not self._reader.at_eof():
            data = await self._reader.read(1024)
            if data:
                self._reset_conn_timeout()
                await self.process_data(data)
        if self.request.finished:
            await self.reply()
        elif self._reader.at_eof():
            raise BadRequestException()
    except (NotFoundException,
            BadRequestException) as e:
        self.error_reply(e.code, body=Response.reason_phrases[e.code])
    except Exception as e:
        self.error_reply(500, body=Response.reason_phrases[500])

    self.close_connection()
```

所有内容被包含在 `try-except` 代码块中，这样在解析请求或响应期间抛出的异常可以被捕获到，然后一个错误响应会发送回客户端。

在 `while` 循环中不断读取请求，直到解析器将 `self.request.finished` 设置为 True ，或者客户端关闭连接所触发的信号使得 `self._reader_at_eof()` 函数返回值为 True 为止。这段代码尝试在每次循环迭代中从 `StreamReader` 中读取数据，并通过调用 `self.process_data(data)` 函数以增量方式生成 `self.request`。每次循环读取数据时，连接超时计数器被重置。

这儿有个错误，你发现了吗？稍后我们会再讨论这个。需要注意的是，这个循环可能会耗尽 CPU 资源，因为如果没有读取到东西 `self._reader.read()` 函数将会返回一个空的字节对象 `b''`。这就意味着循环将会不断运行，却什么也不做。一个可能的解决方法是，用非阻塞的方式等待一小段时间：`await asyncio.sleep(0.1)`。我们暂且不对它做优化。

还记得上一段我提到的那个错误吗？只有从 `StreamReader` 读取数据时，`self._reset_conn_timeout()` 函数才会被调用。这就意味着，**直到第一个字节到达时**，`timeout` 才被初始化。如果有一个客户端建立了与服务器的连接却不发送任何数据，那就永远不会超时。这可能被用来消耗系统资源，从而导致拒绝服务式攻击（DoS）。修复方法就是在 `init` 函数中调用 `self._reset_conn_timeout()` 函数。

当请求接受完成或连接中断时，程序将运行到 `if-else` 代码块。这部分代码会判断解析器收到完整的数据后是否完成了解析。如果是，好，生成一个回复并发送回客户端。如果不是，那么请求信息可能有错误，抛出一个异常！最后，我们调用 `self.close_connection` 执行清理工作。

解析请求的部分在 `self.process_data` 方法中。这个方法非常简短，也易于测试：

```
async def process_data(self, data):
    self._buffer.extend(data)

    self._buffer = self.http_parser.parse_into(
        self.request, self._buffer)
```

每一次调用都将数据累积到 `self._buffer` 中，然后试着用 `self.http_parser` 来解析已经收集的数据。这里需要指出的是，这段代码展示了一种称为[依赖注入（Dependency Injection）][10]的模式。如果你还记得 `init` 函数的话，应该知道我们传入了一个包含 `http_parser` 对象的 `http_server` 对象。在这个例子里，`http_parser` 对象是 `diy_framework` 包中的一个模块。不过它也可以是任何含有 `parse_into` 函数的类，这个 `parse_into` 函数接受一个 `Request` 对象以及字节数组作为参数。这很有用，原因有二：一是，这意味着这段代码更易扩展。如果有人想通过一个不同的解析器来使用 `HTTPConnection`，没问题，只需将它作为参数传入即可。二是，这使得测试更加容易，因为 `http_parser` 不是硬编码的，所以使用虚假数据或者 [mock][11] 对象来替代是很容易的。

下一段有趣的部分就是 `reply` 方法了：

```
async def reply(self):
    request = self.request
    handler = self.router.get_handler(request.path)

    response = await handler.handle(request)

    if not isinstance(response, Response):
        response = Response(code=200, body=response)

    self._writer.write(response.to_bytes())
    await self._writer.drain()
```

这里，一个 `HTTPConnection` 的实例使用了 `HTTPServer` 中的 `router` 对象来得到一个生成响应的对象。一个路由可以是任何一个拥有 `get_handler` 方法的对象，这个方法接收一个字符串作为参数，返回一个可调用的对象或者抛出 `NotFoundException` 异常。而这个可调用的对象被用来处理请求以及生成响应。处理程序由框架的使用者编写，如上文所说的那样，应该返回字符串或者 `Response` 对象。`Response` 对象提供了一个友好的接口，因此这个简单的 if 语句保证了无论处理程序返回什么，代码最终都得到一个统一的 `Response` 对象。

接下来，被赋值给 `self._writer` 的 `StreamWriter` 实例被调用，将字节字符串发送回客户端。函数返回前，程序在 `await self._writer.drain()` 处等待，以确保所有的数据被发送给客户端。只要缓存中还有未发送的数据，`self._writer.close()` 方法就不会执行。

`HTTPConnection` 类还有两个更加有趣的部分：一个用于关闭连接的方法，以及一组用来处理超时机制的方法。首先，关闭一条连接由下面这个小函数完成：

```
def close_connection(self):
    self._cancel_conn_timeout()
    self._writer.close()
```

每当一条连接将被关闭时，这段代码首先取消超时，然后把连接从事件循环中清除。

超时机制由三个相关的函数组成：第一个函数在超时后给客户端发送错误消息并关闭连接；第二个函数用于取消当前的超时；第三个函数调度超时功能。前两个函数比较简单，我将详细解释第三个函数 `_reset_cpmm_timeout()` 。

```
def _conn_timeout_close(self):
    self.error_reply(500, 'timeout')
    self.close_connection()

def _cancel_conn_timeout(self):
    if self._conn_timeout:
        self._conn_timeout.cancel()

def _reset_conn_timeout(self, timeout=TIMEOUT):
    self._cancel_conn_timeout()
    self._conn_timeout = self.loop.call_later(
        timeout, self._conn_timeout_close)
```

每当 `_reset_conn_timeout` 函数被调用时，它会先取消之前所有赋值给 `self._conn_timeout` 的 `asyncio.Handle` 对象。然后，使用 [BaseEventLoop.call_later][12] 函数让 `_conn_timeout_close` 函数在超时数秒（`timeout`）后执行。如果你还记得 `handle_request` 函数的内容，就知道每当接收到数据时，这个函数就会被调用。这就取消了当前的超时并且重新安排 `_conn_timeout_close` 函数在超时数秒（`timeout`）后执行。只要接收到数据，这个循环就会不断地重置超时回调。如果在超时时间内没有接收到数据，最后函数 `_conn_timeout_close` 就会被调用。

### 创建连接

我们需要创建 `HTTPConnection` 对象，并且正确地使用它们。这一任务由 `HTTPServer` 类完成。`HTTPServer` 类是一个简单的容器，可以存储着一些配置信息（解析器，路由和事件循环实例），并使用这些配置来创建 `HTTPConnection` 实例：

```
class HTTPServer(object):
    def init(self, router, http_parser, loop):
        self.router = router
        self.http_parser = http_parser
        self.loop = loop

    async def handle_connection(self, reader, writer):
        connection = HTTPConnection(self, reader, writer)
        asyncio.ensure_future(connection.handle_request(), loop=self.loop)
```

`HTTPServer` 的每一个实例能够监听一个端口。它有一个 `handle_connection` 的异步方法来创建 `HTTPConnection` 的实例，并安排它们在事件循环中运行。这个方法被传递给 [asyncio.start_server][13] 作为一个回调函数。也就是说，每当一个 TCP 连接初始化时（以 `StreamReader` 和 `StreamWriter` 为参数），它就会被调用。

```
   self._server = HTTPServer(self.router, self.http_parser, self.loop)
   self._connection_handler = asyncio.start_server(
        self._server.handle_connection,
        host=self.host,
        port=self.port,
        reuse_address=True,
        reuse_port=True,
        loop=self.loop)
```

这就是构成整个应用程序工作原理的核心：`asyncio.start_server` 接受 TCP 连接，然后在一个预配置的 `HTTPServer` 对象上调用一个方法。这个方法将处理一条 TCP 连接的所有逻辑：读取、解析、生成响应并发送回客户端、以及关闭连接。它的重点是 IO 逻辑、解析和生成响应。

讲解了核心的 IO 部分，让我们继续。

### 解析请求

这个微型框架的使用者被宠坏了，不愿意和字节打交道。它们想要一个更高层次的抽象 —— 一种更加简单的方法来处理请求。这个微型框架就包含了一个简单的 HTTP 解析器，能够将字节流转化为 Request 对象。

这些 Request 对象是像这样的容器：

```
class Request(object):
    def init(self):
        self.method = None
        self.path = None
        self.query_params = {}
        self.path_params = {}
        self.headers = {}
        self.body = None
        self.body_raw = None
        self.finished = False
```

它包含了所有需要的数据，可以用一种容易理解的方法从客户端接受数据。哦，不包括 cookie ，它对身份认证是非常重要的，我会将它留在第二部分。

每一个 HTTP 请求都包含了一些必需的内容，如请求路径和请求方法。它们也包含了一些可选的内容，如请求体、请求头，或是 URL 参数。随着 REST 的流行，除了 URL 参数，URL 本身会包含一些信息。比如，"/user/1/edit" 包含了用户的 id 。

一个请求的每个部分都必须被识别、解析，并正确地赋值给 Request 对象的对应属性。HTTP/1.1 是一个文本协议，事实上这简化了很多东西。（HTTP/2 是一个二进制协议，这又是另一种乐趣了）

解析器不需要跟踪状态，因此 `http_parser` 模块其实就是一组函数。调用函数需要用到 `Request` 对象，并将它连同一个包含原始请求信息的字节数组传递给 `parse_into` 函数。然后解析器会修改 `Request` 对象以及充当缓存的字节数组。字节数组的信息被逐渐地解析到 request 对象中。

`http_parser` 模块的核心功能就是下面这个 `parse_into` 函数：

```
def parse_into(request, buffer):
    _buffer = buffer[:]
    if not request.method and can_parse_request_line(_buffer):
        (request.method, request.path,
         request.query_params) = parse_request_line(_buffer)
        remove_request_line(_buffer)

    if not request.headers and can_parse_headers(_buffer):
        request.headers = parse_headers(_buffer)
        if not has_body(request.headers):
            request.finished = True

        remove_intro(_buffer)

    if not request.finished and can_parse_body(request.headers, _buffer):
        request.body_raw, request.body = parse_body(request.headers, _buffer)
        clear_buffer(_buffer)
        request.finished = True
    return _buffer
```

从上面的代码中可以看到，我把解析的过程分为三个部分：解析请求行（这行像这样：GET /resource HTTP/1.1），解析请求头以及解析请求体。

请求行包含了 HTTP 请求方法以及 URL 地址。而 URL 地址则包含了更多的信息：路径、url 参数和开发者自定义的 url 参数。解析请求方法和 URL 还是很容易的 - 合适地分割字符串就好了。函数 `urlparse.parse` 可以用来解析 URL 参数。开发者自定义的 URL 参数可以通过正则表达式来解析。

接下来是 HTTP 头部。它们是一行行由键值对组成的简单文本。问题在于，可能有多个 HTTP 头有相同的名字，却有不同的值。一个值得关注的 HTTP 头部是 `Content-Length`，它描述了请求体的字节长度（不是整个请求，仅仅是请求体）。这对于决定是否解析请求体有很重要的作用。

最后，解析器根据 HTTP 方法和头部来决定是否解析请求体。

### 路由！

在某种意义上，路由就像是连接框架和用户的桥梁，用户用合适的方法创建 `Router` 对象并为其设置路径/函数对，然后将它赋值给 App 对象。而 App 对象依次调用 `get_handler` 函数生成相应的回调函数。简单来说，路由就负责两件事，一是存储路径/函数对，二是返回需要的路径/函数对

`Router` 类中有两个允许最终开发者添加路由的方法，分别是 `add_routes` 和 `add_route`。因为 `add_routes` 就是 `add_route` 函数的一层封装，我们将主要讲解 `add_route` 函数：

```
def add_route(self, path, handler):
    compiled_route = self.class.build_route_regexp(path)
    if compiled_route not in self.routes:
        self.routes[compiled_route] = handler
    else:
        raise DuplicateRoute
```

首先，这个函数使用 `Router.build_router_regexp` 的类方法，将一条路由规则（如 '/cars/{id}' 这样的字符串），“编译”到一个已编译的正则表达式对象。这些已编译的正则表达式用来匹配请求路径，以及解析开发者自定义的 URL 参数。如果已经存在一个相同的路由，程序就会抛出一个异常。最后，这个路由/处理程序对被添加到一个简单的字典`self.routes`中。

下面展示 Router 是如何“编译”路由的：

```
@classmethod
def build_route_regexp(cls, regexp_str):
    """
    Turns a string into a compiled regular expression. Parses '{}' into
    named groups ie. '/path/{variable}' is turned into
    '/path/(?P<variable>[a-zA-Z0-9_-]+)'.

    :param regexp_str: a string representing a URL path.
    :return: a compiled regular expression.
    """
    def named_groups(matchobj):
        return '(?P<{0}>[a-zA-Z0-9_-]+)'.format(matchobj.group(1))

    re_str = re.sub(r'{([a-zA-Z0-9_-]+)}', named_groups, regexp_str)
    re_str = ''.join(('^', re_str, '$',))
    return re.compile(re_str)
```

这个方法使用正则表达式将所有出现的 `{variable}` 替换为 `(?P<variable>)`。然后在字符串头尾分别添加 `^` 和 `$` 标记，最后编译正则表达式对象。

完成了路由存储仅成功了一半，下面是如何得到路由对应的函数：

```
def get_handler(self, path):
    logger.debug('Getting handler for: {0}'.format(path))
    for route, handler in self.routes.items():
        path_params = self.class.match_path(route, path)
        if path_params is not None:
            logger.debug('Got handler for: {0}'.format(path))
            wrapped_handler = HandlerWrapper(handler, path_params)
            return wrapped_handler

    raise NotFoundException()
```

一旦 `App` 对象获得一个 `Request` 对象，也就获得了 URL 的路径部分（如 /users/15/edit）。然后，我们需要匹配函数来生成一个响应或者 404 错误。`get_handler` 函数将路径作为参数，循环遍历路由，对每条路由调用 `Router.match_path` 类方法检查是否有已编译的正则对象与这个请求路径匹配。如果存在，我们就调用 `HandleWrapper` 来包装路由对应的函数。`path_params` 字典包含了路径变量（如 '/users/15/edit' 中的 '15'），若路由没有指定变量，字典就为空。最后，我们将包装好的函数返回给 `App` 对象。

如果遍历了所有的路由都找不到与路径匹配的，函数就会抛出 `NotFoundException` 异常。

这个 `Route.match` 类方法挺简单：

```
def match_path(cls, route, path):
    match = route.match(path)
    try:
        return match.groupdict()
    except AttributeError:
        return None
```

它使用正则对象的 [match 方法][14]来检查路由是否与路径匹配。若果不匹配，则返回 None 。

最后，我们有 `HandleWraapper` 类。它的唯一任务就是封装一个异步函数，存储 `path_params` 字典，并通过 `handle` 方法对外提供一个统一的接口。

```
class HandlerWrapper(object):
    def init(self, handler, path_params):
        self.handler = handler
        self.path_params = path_params
        self.request = None

    async def handle(self, request):
        return await self.handler(request, **self.path_params)
```

### 组合到一起

框架的最后部分就是用 `App` 类把所有的部分联系起来。

`App` 类用于集中所有的配置细节。一个 `App` 对象通过其 `start_server` 方法，使用一些配置数据创建一个 `HTTPServer` 的实例，然后将它传递给 [asyncio.start_server 函数][15]。`asyncio.start_server` 函数会对每一个 TCP 连接调用 `HTTPServer` 对象的 `handle_connection` 方法。

```
def start_server(self):
    if not self._server:
        self.loop = asyncio.get_event_loop()
        self._server = HTTPServer(self.router, self.http_parser, self.loop)
        self._connection_handler = asyncio.start_server(
            self._server.handle_connection,
            host=self.host,
            port=self.port,
            reuse_address=True,
            reuse_port=True,
            loop=self.loop)

        logger.info('Starting server on {0}:{1}'.format(
            self.host, self.port))
        self.loop.run_until_complete(self._connection_handler)

        try:
            self.loop.run_forever()
        except KeyboardInterrupt:
            logger.info('Got signal, killing server')
        except DiyFrameworkException as e:
            logger.error('Critical framework failure:')
            logger.error(e.traceback)
        finally:
            self.loop.close()
    else:
        logger.info('Server already started - {0}'.format(self))
```

### 总结

如果你查看源码，就会发现所有的代码仅 320 余行（包括测试代码的话共 540 余行）。这么少的代码实现了这么多的功能，让我有点惊讶。这个框架没有提供模板、身份认证以及数据库访问等功能（这些内容也很有趣哦）。这也让我知道，像 Django 和 Tornado 这样的框架是如何工作的，而且我能够快速地调试它们了。

这也是我按照测试驱动开发完成的第一个项目，整个过程有趣而有意义。先编写测试用例迫使我思考设计和架构，而不仅仅是把代码放到一起，让它们可以运行。不要误解我的意思，有很多时候，后者的方式更好。不过如果你想给确保这些不怎么维护的代码在之后的几周甚至几个月依然工作，那么测试驱动开发正是你需要的。

我研究了下[整洁架构][16]以及依赖注入模式，这些充分体现在 `Router` 类是如何作为一个更高层次的抽象的（实体？）。`Router` 类是比较接近核心的，像 `http_parser` 和 `App` 的内容比较边缘化，因为它们只是完成了极小的字符串和字节流、或是中层 IO 的工作。测试驱动开发（TDD）迫使我独立思考每个小部分，这使我问自己这样的问题：方法调用的组合是否易于理解？类名是否准确地反映了我正在解决的问题？我的代码中是否很容易区分出不同的抽象层？

来吧，写个小框架，真的很有趣：）

--------------------------------------------------------------------------------

via: http://mattscodecave.com/posts/simple-python-framework-from-scratch.html

作者：[Matt][a]
译者：[Cathon](https://github.com/Cathon)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://mattscodecave.com/hire-me.html
[1]: https://github.com/sirMackk/diy_framework
[2]:https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol
[3]: https://en.wikipedia.org/wiki/HTTP_persistent_connection
[4]: https://en.wikipedia.org/wiki/TCP_congestion-avoidance_algorithm#Slow_start
[5]: https://docs.python.org/3/library/asyncio-stream.html
[6]: https://docs.python.org/3/library/asyncio-protocol.html
[7]: https://github.com/sirMackk/diy_framework/blob/88968e6b30e59504251c0c7cd80abe88f51adb79/diy_framework/http_server.py#L46
[8]: https://docs.python.org/3/library/functions.html#bytearray
[9]: https://docs.python.org/3/library/asyncio-eventloop.html#asyncio.Handle
[10]: https://en.wikipedia.org/wiki/Dependency_injection
[11]: https://docs.python.org/3/library/unittest.mock.html
[12]: https://docs.python.org/3/library/asyncio-eventloop.html#asyncio.BaseEventLoop.call_later
[13]: https://docs.python.org/3/library/asyncio-stream.html#asyncio.start_server
[14]: https://docs.python.org/3/library/re.html#re.match
[15]: https://docs.python.org/3/library/asyncio-stream.html?highlight=start_server#asyncio.start_server
[16]: https://blog.8thlight.com/uncle-bob/2012/08/13/the-clean-architecture.html
