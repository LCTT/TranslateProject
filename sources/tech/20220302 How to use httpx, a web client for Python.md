[#]: subject: "How to use httpx, a web client for Python"
[#]: via: "https://opensource.com/article/22/3/python-httpx"
[#]: author: "Moshe Zadka https://opensource.com/users/moshez"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to use httpx, a web client for Python
======
The httpx package for Python is an excellent and flexible module for
interacting with HTTP.
![Digital creative of a browser on the internet][1]

The `httpx` package for Python is a sophisticated web client. Once you install it, you can use it to get data from websites. As usual, the easiest way to install it is with the `pip` utility:


```
`$ python -m pip install httpx --user`
```

To use it, import it into a Python script, and then use the `.get` function to fetch data from a web address:


```


import httpx
result = httpx.get("<https://httpbin.org/get?hello=world>")
result.json()["args"]

```

Here's the output from that simple script:


```
`    {'hello': 'world'}`
```

### HTTP response

By default, `httpx` will not raise errors on a non-200 status. 

Try this code:


```


result = httpx.get("<https://httpbin.org/status/404>")
result

```

The result:


```
`    <Response [404 NOT FOUND]>`
```

It's possible to raise a response explicitly. Add this exception handler:


```


try:
    result.raise_for_status()
except Exception as exc:
    print("woops", exc)

```

Here's the result:


```


    woops Client error '404 NOT FOUND' for url '<https://httpbin.org/status/404>'
    For more information check: <https://httpstatuses.com/404>

```

### Custom client

It is worthwhile to use a custom client for anything but the simplest script. Aside from nice performance improvements, such as connection pooling, this is a good place to configure the client.

For example, you can set a custom base URL:


```


client = httpx.Client(base_url="<https://httpbin.org>")
result = client.get("/get?source=custom-client")
result.json()["args"]

```

Sample output:


```
`    {'source': 'custom-client'}`
```

This is useful for a typical scenario where you use the client to talk to a specific server. For example, using both `base_url` and `auth`, you can build a nice abstraction for an authenticated client:


```


client = httpx.Client(
    base_url="<https://httpbin.org>",
    auth=("good_person", "secret_password"),
)
result = client.get("/basic-auth/good_person/secret_password")
result.json()

```

Output:


```
`    {'authenticated': True, 'user': 'good_person'}`
```

One of the nicer things you can use this for is constructing the client at a top-level "main" function and then passing it around. This lets other functions use the client and lets them get unit-tested with a client connected to a local WSGI app.


```


def get_user_name(client):
    result = client.get("/basic-auth/good_person/secret_password")
    return result.json()["user"]

get_user_name(client)
    'good_person'

def application(environ, start_response):
    start_response('200 OK', [('Content-Type', 'application/json')])
    return [b'{"user": "pretty_good_person"}']
fake_client = httpx.Client(app=application, base_url="<https://fake-server>")
get_user_name(fake_client)

```

Output:


```
`    'pretty_good_person'`
```

### Try httpx

Visit [python-httpx.org][2] for more information, documentation, and tutorials. I've found it to be an excellent and flexible module for interacting with HTTP. Give it a try and see what it can do for you.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/3/python-httpx

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_web_internet_website.png?itok=g5B_Bw62 (Digital creative of a browser on the internet)
[2]: https://www.python-httpx.org/
