[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to write a Python web API with Pyramid and Cornice)
[#]: via: (https://opensource.com/article/20/1/python-web-api-pyramid-cornice)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

How to write a Python web API with Pyramid and Cornice
======
Use Pyramid and Cornice to build and document scalable RESTful web
services.
![Searching for code][1]

[Python][2] is a high-level, object-oriented programming language known for its simple syntax. It is consistently among the top-rated programming languages for building RESTful APIs.

[Pyramid][3] is a Python web framework designed to scale up with an application: it's simple for simple applications but can grow for big, complex applications. Among other things, Pyramid powers PyPI, the Python package index. [Cornice][4] provides helpers to build and document REST-ish web services with Pyramid.

This article will use the example of a web service to get famous quotes to show how to use these tools.

### Set up a Pyramid application

Start by creating a virtual environment for your application and a file to hold the code:


```
$ mkdir tutorial
$ cd tutorial
$ touch main.py
$ python3 -m venv env
$ source env/bin/activate
(env) $ pip3 install cornice twisted
```

### Import the Cornice and Pyramid modules

Import these modules with:


```
from pyramid.config import Configurator
from cornice import Service
```

### Define the service

Define the quotes service as a **Service** object:


```
QUOTES = Service(name='quotes',
                 path='/',
                 description='Get quotes')
```

### Write the quotes logic

So far, this only supports **GET**ing quotes. Decorate the function with **QUOTES.get**; this is how you can tie in the logic to the REST service:


```
@QUOTES.get()
def get_quote(request):
    return {
        'William Shakespeare': {
            'quote': ['Love all, trust a few, do wrong to none',
            'Some are born great, some achieve greatness, and some have greatness thrust upon them.']
    },
    'Linus': {
        'quote': ['Talk is cheap. Show me the code.']
        }
    }
```

Note that unlike in other frameworks, the **get_quote** function is _not_ changed by the decorator. If you import this module, you can still call the function regularly and inspect the result.

This is useful when writing unit tests for Pyramid RESTful services.

### Define the application object

Finally, use **scan** to find all decorated functions and add them to the configuration: 


```
with Configurator() as config:
    config.include("cornice")
    config.scan()
    application = config.make_wsgi_app()
```

The default for scan is to scan the current module. You can also give the name of a package if you want to scan all modules in a package.

### Run the service

I use Twisted's WSGI server to run the application, but you can use any other [WSGI][5] server, like Gunicorn or uWSGI, if you want:


```
`(env)$ python -m twisted web --wsgi=main.application`
```

By default, Twisted's WSGI server runs on port 8080. You can test the service with [HTTPie][6]:


```
(env) $ pip install httpie
...
(env) $ http GET <http://localhost:8080/>
HTTP/1.1 200 OK
Content-Length: 220
Content-Type: application/json
Date: Mon, 02 Dec 2019 16:49:27 GMT
Server: TwistedWeb/19.10.0
X-Content-Type-Options: nosniff

{
    "Linus": {
        "quote": [
            "Talk is cheap. Show me the code."
        ]
    },
    "William Shakespeare": {
        "quote": [
            "Love all,trust a few,do wrong to none",
            "Some are born great, some achieve greatness, and some greatness thrust upon them."
        ]
    }
}
```

### Why use Pyramid?

Pyramid is not the most popular framework, but it is used in some high-profile projects like [PyPI][7]. I like Pyramid because it is one of the frameworks that took unit testing seriously: because the decorators do not modify the function and there are no thread-local variables, functions are callable directly from unit tests. For example, functions that need access to the database will get it from the **request** object passed in via **request.config**. This allows a unit tester to put a mock (or real) database object in the request, instead of carefully setting globals, thread-local variables, or other framework-specific things.

If you're looking for a well-tested library to build your next API, give Pyramid a try. You won't be disappointed.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/python-web-api-pyramid-cornice

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/search_find_code_python_programming.png?itok=ynSL8XRV (Searching for code)
[2]: https://opensource.com/resources/python
[3]: https://opensource.com/article/18/5/pyramid-framework
[4]: https://cornice.readthedocs.io/en/latest/
[5]: https://en.wikipedia.org/wiki/Web_Server_Gateway_Interface
[6]: https://opensource.com/article/19/8/getting-started-httpie
[7]: https://pypi.org/
