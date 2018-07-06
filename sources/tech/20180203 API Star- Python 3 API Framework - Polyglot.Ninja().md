API Star: Python 3 API Framework – Polyglot.Ninja()
======
For building quick APIs in Python, I have mostly depended on [Flask][1]. Recently I came across a new API framework for Python 3 named “API Star” which seemed really interesting to me for several reasons. Firstly the framework embraces modern Python features like type hints and asyncio. And then it goes ahead and uses these features to provide awesome development experience for us, the developers. We will get into those features soon but before we begin, I would like to thank Tom Christie for all the work he has put into Django REST Framework and now API Star.

Now back to API Star – I feel very productive in the framework. I can choose to write async codes based on asyncio or I can choose a traditional backend like WSGI. It comes with a command line tool – `apistar` to help us get things done faster. There’s (optional) support for both Django ORM and SQLAlchemy. There’s a brilliant type system that enables us to define constraints on our input and output and from these, API Star can auto generate api schemas (and docs), provide validation and serialization feature and a lot more. Although API Star is heavily focused on building APIs, you can also build web applications on top of it fairly easily. All these might not make proper sense until we build something all by ourselves.

### Getting Started

We will start by installing API Star. It would be a good idea to create a virtual environment for this exercise. If you don’t know how to create a virtualenv, don’t worry and go ahead.
```
pip install apistar

```

If you’re not using a virtual environment or the `pip` command for your Python 3 is called `pip3`, then please use `pip3 install apistar` instead.

Once we have the package installed, we should have access to the `apistar` command line tool. We can create a new project with it. Let’s create a new project in our current directory.
```
apistar new .

```

Now we should have two files created – `app.py` – which contains the main application and then `test.py` for our tests. Let’s examine our `app.py` file:
```
from apistar import Include, Route
from apistar.frameworks.wsgi import WSGIApp as App
from apistar.handlers import docs_urls, static_urls


def welcome(name=None):
 if name is None:
  return {'message': 'Welcome to API Star!'}
 return {'message': 'Welcome to API Star, %s!' % name}


routes = [
 Route('/', 'GET', welcome),
 Include('/docs', docs_urls),
 Include('/static', static_urls)
]

app = App(routes=routes)


if __name__ == '__main__':
 app.main()

```

Before we dive into the code, let’s run the app and see if it works. If we navigate to `http://127.0.0.1:8080/` we will get this following response:
```
{"message": "Welcome to API Star!"}

```

And if we navigate to: `http://127.0.0.1:8080/?name=masnun`
```
{"message": "Welcome to API Star, masnun!"}

```

Similarly if we navigate to: `http://127.0.0.1:8080/docs/`, we will see auto generated docs for our API.

Now let’s look at the code. We have a `welcome` function that takes a parameter named `name` which has a default value of `None`. API Star is a smart api framework. It will try to find the `name` key in the url path or query string and pass it to our function. It also generates the API docs based on it. Pretty nice, no?

We then create a list of `Route` and `Include` instances and pass the list to the `App` instance. `Route` objects are used to define custom user routing. `Include` , as the name suggests, includes/embeds other routes under the path provided to it.

### Routing

Routing is simple. When constructing the `App` instance, we need to pass a list as the `routes` argument. This list should comprise of `Route` or `Include` objects as we just saw above. For `Route`s, we pass a url path, http method name and the request handler callable (function or otherwise). For the `Include` instances, we pass a url path and a list of `Routes` instance.

##### Path Parameters

We can put a name inside curly braces to declare a url path parameter. For example `/user/{user_id}` defines a path where the `user_id` is a path parameter or a variable which will be injected into the handler function (actually callable). Here’s a quick example:
```
from apistar import Route
from apistar.frameworks.wsgi import WSGIApp as App


def user_profile(user_id: int):
 return {'message': 'Your profile id is: {}'.format(user_id)}


routes = [
 Route('/user/{user_id}', 'GET', user_profile),
]

app = App(routes=routes)

if __name__ == '__main__':
 app.main()

```

If we visit `http://127.0.0.1:8080/user/23` we will get a response like this:
```
{"message": "Your profile id is: 23"}

```

But if we try to visit `http://127.0.0.1:8080/user/some_string` – it will not match. Because the `user_profile` function we defined, we added a type hint for the `user_id` parameter. If it’s not integer, the path doesn’t match. But if we go ahead and delete the type hint and just use `user_profile(user_id)`, it will match this url. This is again API Star is being smart and taking advantages of typing.

#### Including / Grouping Routes

Sometimes it might make sense to group certain urls together. Say we have a `user` module that deals with user related functionality. It might be better to group all the user related endpoints under the `/user` path. For example – `/user/new`, `/user/1`, `/user/1/update` and what not. We can easily create our handlers and routes in a separate module or package even and then include them in our own routes.

Let’s create a new module named `user`, the file name would be `user.py`. Let’s put these codes in this file:
```
from apistar import Route


def user_new():
 return {"message": "Create a new user"}


def user_update(user_id: int):
 return {"message": "Update user #{}".format(user_id)}


def user_profile(user_id: int):
 return {"message": "User Profile for: {}".format(user_id)}


user_routes = [
 Route("/new", "GET", user_new),
 Route("/{user_id}/update", "GET", user_update),
 Route("/{user_id}/profile", "GET", user_profile),
]

```

Now we can import our `user_routes` from within our main app file and use it like this:
```
from apistar import Include
from apistar.frameworks.wsgi import WSGIApp as App

from user import user_routes

routes = [
 Include("/user", user_routes)
]

app = App(routes=routes)

if __name__ == '__main__':
 app.main()

```

Now `/user/new` will delegate to `user_new` function.

### Accessing Query String / Query Parameters

Any parameters passed in the query parameters can be injected directly into handler function. Say for the url `/call?phone=1234`, the handler function can define a `phone` parameter and it will receive the value from the query string / query parameters. If the url query string doesn’t include a value for `phone`, it will get `None` instead. We can also set a default value to the parameter like this:
```
def welcome(name=None):
 if name is None:
 return {'message': 'Welcome to API Star!'}
 return {'message': 'Welcome to API Star, %s!' % name}

```

In the above example, we set a default value to `name` which is `None` anyway.

### Injecting Objects

By type hinting a request handler, we can have different objects injected into our views. Injecting request related objects can be helpful for accessing them directly from inside the handler. There are several built in objects in the `http` package from API Star itself. We can also use it’s type system to create our own custom objects and have them injected into our functions. API Star also does data validation based on the constraints specified.

Let’s define our own `User` type and have it injected in our request handler:
```
from apistar import Include, Route
from apistar.frameworks.wsgi import WSGIApp as App
from apistar import typesystem


class User(typesystem.Object):
 properties = {
  'name': typesystem.string(max_length=100),
  'email': typesystem.string(max_length=100),
  'age': typesystem.integer(maximum=100, minimum=18)
 }

 required = ["name", "age", "email"]


def new_user(user: User):
 return user


routes = [
 Route('/', 'POST', new_user),
]

app = App(routes=routes)

if __name__ == '__main__':
 app.main()

```

Now if we send this request:

```
curl -X POST \
  http://127.0.0.1:8080/ \
  -H 'Cache-Control: no-cache' \
  -H 'Content-Type: application/json' \
  -d '{"name": "masnun", "email": "masnun@gmail.com", "age": 12}'
```

Guess what happens? We get an error saying age must be equal to or greater than 18. The type system is allowing us intelligent data validation as well. If we enable the `docs` url, we will also get these parameters automatically documented there.

### Sending a Response

If you have noticed so far, we can just pass a dictionary and it will be JSON encoded and returned by default. However, we can set the status code and any additional headers by using the `Response` class from `apistar`. Here’s a quick example:
```
from apistar import Route, Response
from apistar.frameworks.wsgi import WSGIApp as App


def hello():
 return Response(
   content="Hello".encode("utf-8"),
   status=200,
   headers={"X-API-Framework": "API Star"},
   content_type="text/plain"
 )


routes = [
 Route('/', 'GET', hello),
]

app = App(routes=routes)

if __name__ == '__main__':
 app.main()

```

It should send a plain text response along with a custom header. Please note that the `content` should be bytes, not string. That’s why I encoded it.

### Moving On

I just walked through some of the features of API Star. There’s a lot more of cool stuff in API Star. I do recommend going through the [Github Readme][2] for learning more about different features offered by this excellent framework. I shall also try to cover short, focused tutorials on API Star in the coming days.

--------------------------------------------------------------------------------

via: http://polyglot.ninja/api-star-python-3-api-framework/

作者：[MASNUN][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://polyglot.ninja/author/masnun/
[1]:http://polyglot.ninja/rest-api-best-practices-python-flask-tutorial/
[2]:https://github.com/encode/apistar
