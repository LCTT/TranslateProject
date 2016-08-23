[Cathon is translating...]
Simple Python Framework from Scratch
===================================

Why would you want to build a web framework? I can think of a few reasons:

- Novel idea that will displace other frameworks.
- Get some mad street cred.
- Your problem domain is so unique that other frameworks don't fit.
- You're curious how web frameworks work because you want to become a better web developer.

I'll focus on the last point. This post aims to describe what I learned by writing a small server and framework by explaining the design and implementation process step by step, function by function. The complete code for this project can be found in this [repository][1].

I hope this encourages other people to try because the it was fun, taught me a lot about how web applications work, and it was a lot easier than I thought!

### Scope

Frameworks handle things like the request-response cycle, authentication, database access, generating templates, and lots more. Web developers use frameworks because most web applications share a lot of functionality and it doesn't make sense to re-implement all of that for every project.

Bigger frameworks like Rails or Django operate on a high level of abstraction and are said to be "batteries-included". It would take thousands of man-hours to implement all of those features so it's important to focus on tiny subset for this project. Before setting down a single line of code I created a list of features and constraints.

Features:

- Must handle GET and POST HTTP requests. You can get a brief overview of HTTP in [this wiki article][2]).
- Must be asynchronous (I'm loving the Python 3 asyncio module).
- Must include simple routing logic along with capturing parameters.
- Must provide a simple user-facing API like other cool microframeworks.
- Must handle authentication, because it's cool to learn that too (saved for Part 2).

Constraints:

- Will only handle a small subset of HTTP/1.1: no transfer-encoding, no http-auth, no content-encoding (gzip), no [persistant connections][3].
- No MIME-guessing for responses - users will have to set this manually.
- No WSGI - just simple TCP connection handling.
- No database support.

I decided a small use case would make the above more concrete. It would also demonstrate the framework's API:

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

The user is supposed to be able to define a few asynchronous functions that either return strings or Response objects, then pair those functions up with strings that represent routes, and finally start handling requests with a single function call (start_server).

Having created the designs, I condensed it into abstract things I needed to code up:

- Something that should accept TCP connections and schedule an asynchronous function to handle them.
- Something to parse raw text into some kind of abstracted container.
- Something to decide which function should be called for each request.
- Something that bundles all of the above together and presents a simple interface to a developer.

I started by writing tests that were essentially contracts describing each piece of functionality. After a few refactorings, the layout settled into a handful of composable pieces. Each piece is relatively decoupled from the other components, which is especially beneficial in this case because each piece can be studied on its own. The pieces are concrete reflections of the abstractions that I listed above:

- A HTTPServer object that holds onto a Router object and a http_parser module and uses them to initialize...
- HTTPConnection objects, where each one represents a single client HTTP connection and takes care of the request-response cycle: parses incoming bytes into a Request object using the http_parser module; uses an instance of Router to find the correct function to call to generate a response; finally send the response back to the client.
- A pair of Request and Response objects that give a user a comfortable way to work with what are in essence specially formatted strings of bytes. The user shouldn't be aware of the correct message format or delimiters.
- A Router object that contains route:function pairs. It exposes a way to add these pairs and a way, given a URL path, to find a function.
- Finally, an App object that contains configuration and uses it to instantiate a HTTPServer instance.

Let's go over each of these pieces, starting from HTTPConnection.

### Modelling Asynchronous Connections

To satisfy the contraints, each HTTP request is a separate TCP connection. This makes request handling slower because of the relatively high cost of establishing multiple TCP connections (cost of DNS lookup, hand-shake, [Slow Start][4], etc.) but it's much easier to model. For this task, I chose the fairly high-level [asyncio-stream][5] module that rests on top of [asyncio's transports and protocols][6]. I recommend checking out the code for it in the stdlib because it's a joy to read!

An instance of HTTPConnection handles multiple tasks. First, it reads data incrementally from a TCP connection using an asyncio.StreamReader object and stores it in a buffer. After each read operation, it tries to parse whatever is in the buffer and build out a Request object. Once it receives the whole request, it generates a reply and sends it back to the client through an asyncio.StreamWriter object. It also handles two more tasks: timing out a connection and handling errors.

You can view the complete code for the class [here][7]. I'll introduce each part of the code separately, with the docstrings removed for brevity:

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

The init method is boring: it just collects objects to work with later. It stores a router, an http_parser, and loop objects, which are used to generate responses, parse requests, and schedule things in the event loop.

Next, it stores the reader-writer pair, which together represent a TCP connection, and an empty [bytearray][8] that serves as buffer for raw bytes. _conn_timeout stores an instance of [asyncio.Handle][9] that is used to manage the timeout logic. Finally, it also stores a single instance of Request.

The following code handles the core functionality of receiving and sending data:

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

Everything here is closed in a try-except block so that any exceptions thrown during parsing a request or replying to one are caught and an error response is sent back to the client.

The request is read inside of a while loop until the parser sets self.request.finished = True or until the client closed the connection, signalled by self._reader.at_eof() method returning True. The code tries to read data from a StreamReader on every iteration of the loop and incrementally build out self.request through the call to self.process_data(data). The connection timeout timer is reset everytime the loop reads any data.

There's an error in there - can you spot it? I'll get back to it shortly. I also have to note that this loop can potentially eat up all of the CPU because self._reader.read() returns b'' objects if there is nothing to read - meaning the loop will cycle millions of times, doing nothing. A possible solution here would be to wait a bit of time in a non-blocking fashion: await asyncio.sleep(0.1). I'll hold off on optimizing this until it's needed.

Remember the error that I mentioned at the start of the previous paragraph? The self._reset_conn_timeout() method is called only when data is read from the StreamReader. The way it's set up now means that the timeout is not initiated until the first byte arrives. If a client opens a connection to the server and doesn't send any data - it never times out. This could be used to exhaust system resources and cause a denial of service. The fix is to simply call self._reset_conn_timeout() in the init method.

When the request is received or when the connection drops, the code hits an if-else block. This block determines if the parser, having received all the data, finished parsing the request? Yes? Great - generate a reply and send it back! No? Uh-oh - something's wrong with the request - raise an exception! Finally, self.close_connection is called to perform cleanup.

Parsing the parts of a request is done inside the self.process_data method. It's a very short and simple method that's easy to test:

```
async def process_data(self, data):
    self._buffer.extend(data)

    self._buffer = self.http_parser.parse_into(
        self.request, self._buffer)
```

Each call accumulates data into self._buffer and then tries to parse whatever has gathered inside of the buffer using self.http_parser. It's worth pointing out here that this code exhibits a pattern called [Dependency Injection][10]. If you remember the init function, you know that I pass in a http_server object, which contains a http_parser object. In this case, the http_parser object is a module that is part of the diy_framework package, but it could potentially be anything else that has a parse_into function that accepts a Request object and a bytearray. This is useful for two reasons. First, it means that this code is easier to extend. Someone could come along and want to use HTTPConnection with a different parser - no problem - just pass it in as an argument! Second, it makes testing much easier because the http_parser is not hard coded anywhere so replacing it with a dummy or [mock][11] object is super easy.

The next interesting piece is the reply method:

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

Here, an instance of HTTPConnection uses a router object it got from the HTTPServer (another example of Dependency Injection) to obtain an object that will generate a response. A router can be anything that has a get_handler method that accepts a string and returns a callable or raises a NotFoundException. The callable object is then used to process the request and generate a response. Handlers are written by the users of the framework, as outlined in use case above, and should return either strings or Response objects. Response objects give us a nice interface so the simple if block ensures that whatever a handler returns, the code further along ends up with a uniform Response object.

Next, the StreamWriter instance assigned to self._writer is called to send back a string of bytes to the client. Before the function returns, it awaits at await self._writer.drain(), which ensures that all the data has been sent to the client. This ensures that a call to self._writer.close won't happen when there is still unsent data in the buffer.

There are two more interesting parts of the HTTPConnection class: a method that closes the connection and a group of methods that handle the timeout mechanism. First, closing a connection is accomplished by this little function:

```
def close_connection(self):
    self._cancel_conn_timeout()
    self._writer.close()
```

Any time a connection is to be closed, the code has to first cancel the timeout to clean it out of the event loop.

The timeout mechanism is a set of three related functions: a function that acts on the timeout by sending an error message to the client and closing the connection; a function that cancels the current timeout; and a function that schedules the timeout. The first two are simple and I add them for completeness, but I'll explain the third one — _reset_conn_timeout — in more detail.

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

Everytime _reset_conn_timeout is called, it first cancels any previously set asyncio.Handle object assigned to self._conn_timeout. Then, using the BaseEventLoop.call_later function, it schedules the _conn_timeout_close function to run after timeout seconds. If you remember the contents of the handle_request function, you'll know that this function gets called every time any data is received. This cancels any existing timeout and re-schedules the _conn_timeout_close function timeout seconds in the future. As long as there is data coming, this cycle will keep resetting the timeout callback. If no data is received inside of timeout seconds, the _conn_timeout_close finally gets called.

### Creating the Connections

Something has to create HTTPConnection objects and it has to do it correctly. This task is delegated to the HTTPServer class, which is a very simple container that helps to store some configuration (the parser, router, and event loop instances) and then use that configuration to create instances of HTTPConnection:

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

Each instance of HTTPServer can listen on one port. It has an asynchronous handle_connection method that creates instances of HTTPConnection and schedules them for execution in the event loop. This method is passed to [asyncio.start_server][12] and serves as a callbacks: it's called every time a TCP connection is initiated with a StreamReader and StreamWriter as the arguments.

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

This forms the core of how the application works: asyncio.start_server accepts TCP connections and calls a method on a preconfigured HTTPServer object. This method handles all the logic for a single connection: reading, parsing, generating and sending a reply back to the client, and closing the connection. It focuses on IO logic and coordinates parsing and generating a reply.

With the core IO stuff out of the way lets move on over to...

### Parsing Requests

The users of this tiny framework are spoiled and don't want to work with bytes. They want a higher level of abstraction - a more convenientt way of working with requests. The tiny framework includes a simple HTTP parser that transforms bytes into Request objects.

These Request objects are containers that looks like:

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

It has everything that a developer needs in order to accept data coming from a client in an easily understandable package. Well, everything except cookies, which are crucial in order to do things like authentication. I'll leave that for part 2.

Each HTTP request contains certain required pieces - like the path or the method. It also contains certain optional pieces like the body, headers, or URL parameters. Furthermore, owing to the popularity of REST, the URL, minus the URL parameters, may also contain pieces of information eg. "/users/1/edit" contains a user's id.

Each part of a request has to be identified, parsed, and assigned to the correct part of a Request object. The fact that HTTP/1.1 is text protocol simplifies things (HTTP/2 is binary protocol - whole 'nother level of fun).

The http_parser module is a group of functions inside because the parser does not need to keep track of state. Instead, the calling code has to manage a Request object and pass it into the parse_into function along with a bytearray containing the raw bytes of a request. To this end, the parser modifies both the request object as well as the bytearray buffer passed to it. The request object gets fuller and fuller while the bytearray buffer gets emptier and emptier.

The core functionality of the http_parser module is inside the parse_into function:

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

As you can see in the code above, I divided the parsing process into three parts: parsing the request line (the line that goes GET /resource HTTP/1.1), parsing the headers, and parsing the body.

The request line contains the HTTP method and the URL. The URL in turn contains yet more information: the path, url parameters, and developer defined url parameters. Parsing out the method and URL is easy - it's a matter of splitting the string appropriately. The urlparse.parse function is used to parse out the URL parameters, if any, from the URL. The developer defined url parameters are extracted using regular expressions.

Next up are the HTTP headers. These are simply lines of text that are key-value pairs. The catch is that a there may be multiple headers of the same name but with different values. An important header to watch out for is the Content-Length header that specifies the length of the body (not the whole request, just the body!), which is important in determining whether to parse the body at all.

Finally, the parser looks at the HTTP method and headers and decides whether to parse the request's body.

### Routing!

The router is a bridge between the framework and the user in the sense that the user creates a Router object and fills it with path/function pairs using the appropriate methods and then gives the Router object to the App. The App object in turn uses the get_handler function to get a hold of a callable that generates a response. In short, the router is responsible for two things - storing pairs of paths/functions and handing back a pair to whatever asks for one.

There are two methods in the Router class that allow an end-developer to add routes: add_routes and add_route. Since add_routes is a convenient wrapper around add_route, I'll skip describing it and focus on add_route:

```
def add_route(self, path, handler):
    compiled_route = self.class.build_route_regexp(path)
    if compiled_route not in self.routes:
        self.routes[compiled_route] = handler
    else:
        raise DuplicateRoute
```

This method first "compiles" a route — a string like '/cars/{id}' — into a compiled regexp object using the Router.build_route_regexp class method. These compiled regexp objects serve both to match a request's path and to extract developer defined URL parameters specified by that route. Next there's a check that raises an exception if the same route already exists, and finally the route/handler pair is added to a simple dictionary — self.routes.

Here's how the Router "compiles" routes:

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

The method uses regular expressions to substitute all occurrences of "{variable}" with named regexp groups: "(?P<variable>...)". Then it adds the ^ and $ regexp signifiers at the beginning and end of the resulting string, and finally compiles regexp object out of it.

Storing a route is just half the battle, here's how to get one back:

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

Once the App has a Request object, it also has the path part of the URL (ie. /users/15/edit). Having that, it needs a matching function to generate the response or a 404 error. get_handler takes a path as an argument, loops over routes and calls the Router.match_path class method on each one to check if any compiled regexp matches the request's path. If it does, it wraps the route's function in a HandleWrapper. The path_params dictionary contains path variables (ie. the '15' from /users/15/edit) or is left empty if the route doesn't specify any variables. Finally it returns the wrapped route's function to the App.

If the code iterates through all the routes and none of them matches the path, the function raises a NotFoundException.

The Route.match class method is simple:

```
def match_path(cls, route, path):
    match = route.match(path)
    try:
        return match.groupdict()
    except AttributeError:
        return None
```

It uses the regexp object's match method to check if the route and path matches. It returns None on no matches.

Finally, we have the HandleWrapper class. Its only job is to wrap an asynchronous function, store the path_params dictionary, and expose a uniform interface through the handle method:

```
class HandlerWrapper(object):
    def init(self, handler, path_params):
        self.handler = handler
        self.path_params = path_params
        self.request = None

    async def handle(self, request):
        return await self.handler(request, **self.path_params)
```

### Bringing it All Together

The last piece of the framework is the one that ties everything together — the App class.

The App class serves to gather all the configuration details. An App object uses its single method — start_server — to create an instance of HTTPServer using some of the configuration data, and then feed it to the function asyncio.start_server more info here. The asyncio.start_server function will call the HTTPServer object's handle_connection method for every incoming TCP connection:

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

### Lessons learned

If you look at the repo, you'll notice that the whole thing is roughly 320 lines of code if you don't count the tests (it's ~540 if you do). It really surprised me that it's possible to fit so much functionality in so little code. Granted, this framework does not offer useful pieces like templates, authentication, or database access, but hey, it's something fun to work on :). This also gave me an idea how other framework like Django or Tornado work at a general level and it's already paying off in how quickly I'm able to debug things.

This is also the first project that I did in true TDD fashion and it's just amazing how pleasant and productive the process was. Writing tests first forced me to think about design and architecture and not just on gluing bits of code together to "make it work". Don't get me wrong, there are many scenarios when the latter approach is preferred, but if you're placing a premium on low-maintenance code that you and others will be able to work in weeks or months in the future then TDD is exactly what you need.

I explored things like [the Clean Architecture][13] and dependency injection, which is most evident in how the Router class is a higher-level abstraction (Entity?) that's close to the "core" whereas pieces like the http_parser or App are somewhere on the outer edges because they do either itty-bitty string or bytes work or interface with mid-level IO stuff. Whereas TDD forced me to think about each small part separately, this made me ask myself questions like: Does this combination of method calls compose into an understandable action? Do the class names accurately reflect the problem that I'm solving? Is it easy to distinguish different levels of abstraction in my code?

Go ahead, write a small framework, it's a ton of fun!

--------------------------------------------------------------------------------

via: http://mattscodecave.com/posts/simple-python-framework-from-scratch.html

作者：[Matt][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
[12]: https://docs.python.org/3/library/asyncio-stream.html#asyncio.start_server
[13]: https://blog.8thlight.com/uncle-bob/2012/08/13/the-clean-architecture.html
