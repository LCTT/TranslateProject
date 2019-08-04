[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: subject: (An introduction to the Pyramid web framework for Python)
[#]: via: (https://opensource.com/article/18/5/pyramid-framework)
[#]: author: (Nicholas Hunt-Walker https://opensource.com/users/nhuntwalker)
[#]: url: ( )

An introduction to the Pyramid web framework for Python
======
In the second part in a series comparing Python frameworks, learn about Pyramid.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/pyramid.png?itok=hX73LWtl)

In the [first article][1] in this four-part series comparing different Python web frameworks, I explained how to create a To-Do List web application in the [Flask][2] web framework. In this second article, I'll do the same task with the [Pyramid][3] web framework. Future articles will look at [Tornado][4] and [Django][5]; as I go along, I'll explore more of the differences among them.

### Installing, starting up, and doing configuration

Self-described as "the start small, finish big, stay finished framework," Pyramid is much like Flask in that it takes very little effort to get it up and running. In fact, you'll recognize many of the same patterns as you build out this application. The major difference between the two, however, is that Pyramid comes with several useful utilities, which I'll describe shortly.

To get started, create a virtual environment and install the package.

```
$ mkdir pyramid_todo
$ cd pyramid_todo
$ pipenv install --python 3.6
$ pipenv shell
(pyramid-someHash) $ pipenv install pyramid
```

As with Flask, it's smart to create a `setup.py` file to make the app you build an easily installable Python distribution.

```
# setup.py
from setuptools import setup, find_packages

requires = [
    'pyramid',
    'paster_pastedeploy',
    'pyramid-ipython',
    'waitress'
]

setup(
    name='pyramid_todo',
    version='0.0',
    description='A To-Do List build with Pyramid',
    author='<Your name>',
    author_email='<Your email>',
    keywords='web pyramid pylons',
    packages=find_packages(),
    include_package_data=True,
    install_requires=requires,
    entry_points={
        'paste.app_factory': [
            'main = todo:main',
        ]
    }
)
```

`entry_points` section near the end sets up entry points into the application that other services can use. This allows the `plaster_pastedeploy` package to access what will be the `main` function in the application for building an application object and serving it. (I'll circle back to this in a bit.)

Thesection near the end sets up entry points into the application that other services can use. This allows thepackage to access what will be thefunction in the application for building an application object and serving it. (I'll circle back to this in a bit.)

When you installed `pyramid`, you also gained a few Pyramid-specific shell commands; the main ones to pay attention to are `pserve` and `pshell`. `pserve` will take an INI-style configuration file specified as an argument and serve the application locally. `pshell` will also take a configuration file as an argument, but instead of serving the application, it'll open up a Python shell that is aware of the application and its internal configuration.

The configuration file is pretty important, so it's worth a closer look. Pyramid can take its configuration from environment variables or a configuration file. To avoid too much confusion around what is where, in this tutorial you'll write most of your configuration in the configuration file, with only a select few, sensitive configuration parameters set in the virtual environment.

Create a file called `config.ini`

```
[app:main]
use = egg:todo
pyramid.default_locale_name = en

[server:main]
use = egg:waitress#main
listen = localhost:6543
```

This says a couple of things:

  * The actual application will come from the `main` function located in the `todo` package installed in the environment
  * To serve this app, use the `waitress` package installed in the environment and serve on localhost port 6543



When serving an application and working in development, it helps to set up logging so you can see what's going on. The following configuration will handle logging for the application:

```
# continuing on...
[loggers]
keys = root, todo

[handlers]
keys = console

[formatters]
keys = generic

[logger_root]
level = INFO
handlers = console

[logger_todo]
level = DEBUG
handlers =
qualname = todo

[handler_console]
class = StreamHandler
args = (sys.stderr,)
level = NOTSET
formatter = generic

[formatter_generic]
format = %(asctime)s %(levelname)-5.5s [%(name)s:%(lineno)s][%(threadName)s] %(message)s
```

In short, this configuration asks to log everything to do with the application to the console. If you want less output, set the logging level to `WARN` so a message will fire only if there's a problem.

Because Pyramid is meant for an application that grows, plan out a file structure that could support that growth. Web applications can, of course, be built however you want. In general, the conceptual blocks you'll want to cover will contain:

  * **Models** for containing the code and logic for dealing with data representations
  * **Views** for code and logic pertaining to the request-response cycle
  * **Routes** for the paths for access to the functionality of your application
  * **Scripts** for any code that might be used in configuration or management of the application itself



Given the above, the file structure can look like so:

```
setup.py
config.ini
todo/
    __init__.py
    models.py
    routes.py
    views.py
    scripts/
```

Much like Flask's `app` object, Pyramid has its own central configuration. It comes from its `config` module and is known as the `Configurator` object. This object will handle everything from route configuration to pointing to where models and views exist. All this is done in an inner directory called `todo` within an `__init__.py` file.

```
# todo/__init__.py

from pyramid.config import Configurator

def main(global_config, **settings):
    """Returns a Pyramid WSGI application."""
    config = Configurator(settings=settings)
    config.scan()
    return config.make_wsgi_app()
```

The `main` function looks for some global configuration from your environment as well as any settings that came through the particular configuration file you provide when you run the application. It takes those settings and uses them to build an instance of the `Configurator` object, which (for all intents and purposes) is the factory for your application. Finally, `config.scan()` looks for any views you'd like to attach to your application that are marked as Pyramid views.

Wow, that was a lot to configure.

### Using routes and views

Now that a chunk of the configuration is done, you can start adding functionality to the application. Functionality comes in the form of URL routes that external clients can hit, which then map to functions that Python can run.

With Pyramid, all functionality must be added to the `Configurator` in some way, shape, or form. For example, say you want to build the same simple `hello_world` view that you built with Flask, mapping to the route of `/`. With Pyramid, you can register the `/` route with the `Configurator` using the `.add_route()` method. This method takes as arguments the name of the route that you want to add as well as the actual pattern that must be matched to access that route. For this case, add the following to your `Configurator`:

```
config.add_route('home', '/')
```

Until you create a view and attach it to that route, that path into your application sits open and alone. When you add the view, make sure to include the `request` object in the parameter list. Every Pyramid view must have the `request` object as its first parameter, as that's what's being passed as the first argument to the view when it's called by Pyramid.

One similarity that Pyramid views share with Flask is that you can mark a function as a view with a decorator. Specifically, the `@view_config` decorator from `pyramid.view`.

In `views.py`, build the view that you want to see in the world.

```
from pyramid.view import view_config

@view_config(route_name="hello", renderer="string")
def hello_world(request):
    """Print 'Hello, world!' as the response body."""
    return 'Hello, world!'
```

With the `@view_config` decorator, you have to at least specify the name of the route that will map to this particular view. You can stack `view_config` decorators on top of one another to map to multiple routes if you want, but you have to have at least one to connect view the view at all, and each one must include the name of a route. **[NOTE: Is "to connect view the view" phrased correctly?]**

The other argument, `renderer`, is optional but not really. If you don't specify a renderer, you have to deliberately construct the HTTP response you want to send back to the client using the `Response` object from `pyramid.response`. By specifying the `renderer` as a string, Pyramid knows to take whatever is returned by this function and wrap it in that same `Response` object with the MIME type of `text/plain`. By default, Pyramid allows you to use `string` and `json` as renderers. If you've attached a templating engine to your application because you want to have Pyramid generate your HTML as well, you can point directly to your HTML template as your renderer.

The first view is done. Here's what `__init__.py` looks like now with the attached route.

```
# in __init__.py
from pyramid.config import Configurator

def main(global_config, **settings):
    """Returns a Pyramid WSGI application."""
    config = Configurator(settings=settings)
    config.add_route('hello', '/')
    config.scan()
    return config.make_wsgi_app()
```

Spectacular! Getting here was no easy feat, but now that you're set up, you can add functionality with significantly less difficulty.

### Smoothing a rough edge

Right now the application only has one route, but it's easy to see that a large application can have many dozens or even hundreds of routes. Containing them all in the same `main` function with your central configuration isn't really the best idea, because it would become cluttered. Thankfully, it's fairly easy to include routes with a few tweaks to the application.

**One** : In the `routes.py` file, create a function called `includeme` (yes, it must actually be named this) that takes a configurator object as an argument.

```
# in routes.py
def includeme(config):
    """Include these routes within the application."""
```

**Two** : Move the `config.add_route` method call from `__init__.py` into the `includeme` function:

```
def includeme(config):
    """Include these routes within the application."""
    config.add_route('hello', '/')
```

**Three** : Alert the Configurator that you need to include this `routes.py` file as part of its configuration. Because it's in the same directory as `__init__.py`, you can get away with specifying the import path to this file as `.routes`.

```
# in __init__.py
from pyramid.config import Configurator

def main(global_config, **settings):
    """Returns a Pyramid WSGI application."""
    config = Configurator(settings=settings)
    config.include('.routes')
    config.scan()
    return config.make_wsgi_app()
```

### Connecting the database

As with Flask, you'll want to persist data by connecting a database. Pyramid will leverage [SQLAlchemy][6] directly instead of using a specially tailored package.

First get the easy part out of the way. `psycopg2` and `sqlalchemy` are required to talk to the Postgres database and manage the models, so add them to `setup.py`.

```
# in setup.py
requires = [
    'pyramid',
    'pyramid-ipython',
    'waitress',
    'sqlalchemy',
    'psycopg2'
]
# blah blah other code
```

Now, you have a decision to make about how you'll include the database's URL. There's no wrong answer here; what you do will depend on the application you're building and how public your codebase needs to be.

The first option will keep as much configuration in one place as possible by hard-coding the database URL into the `config.ini` file. One drawback is this creates a security risk for applications with a public codebase. Anyone who can view the codebase will be able to see the full database URL, including username, password, database name, and port. Another is maintainability; if you needed to change environments or the application's database location, you'd have to modify the `config.ini` file directly. Either that or you'll have to maintain one configuration file for each new environment, which adds the potential for discontinuity and errors in the application. **If you choose this option** , modify the `config.ini` file under the `[app:main]` heading to include this key-value pair:

```
sqlalchemy.url = postgres://localhost:5432/pyramid_todo
```

The second option specifies the location of the database URL when you create the `Configurator`, pointing to an environment variable whose value can be set depending on the environment where you're working. One drawback is that you're further splintering the configuration, with some in the `config.ini` file and some directly in the Python codebase. Another drawback is that when you need to use the database URL anywhere else in the application (e.g., in a database management script), you have to code in a second reference to that same environment variable (or set up the variable in one place and import from that location). **If you choose this option** , add the following:

```
# in __init__.py
import os
from pyramid.config import Configurator

SQLALCHEMY_URL = os.environ.get('DATABASE_URL', '')

def main(global_config, **settings):
    """Returns a Pyramid WSGI application."""
    settings['sqlalchemy.url'] = SQLALCHEMY_URL # <-- important!
    config = Configurator(settings=settings)
    config.include('.routes')
    config.scan()
    return config.make_wsgi_app()
```

### Defining objects

OK, so now you have a database. Now you need `Task` and `User` objects.

Because it uses SQLAlchemy directly, Pyramid differs somewhat from Flash on how objects are built. First, every object you want to construct must inherit from SQLAlchemy's [declarative base class][7]. It'll keep track of everything that inherits from it, enabling simpler management of the database.

```
# in models.py
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()

class Task(Base):
    pass

class User(Base):
    pass
```

The columns, data types for those columns, and model relationships will be declared in much the same way as with Flask, although they'll be imported directly from SQLAlchemy instead of some pre-constructed `db` object. Everything else is the same.

```
# in models.py
from datetime import datetime
import secrets

from sqlalchemy import (
    Column, Unicode, Integer, DateTime, Boolean, relationship
)
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()

class Task(Base):
    """Tasks for the To Do list."""
    id = Column(Integer, primary_key=True)
    name = Column(Unicode, nullable=False)
    note = Column(Unicode)
    creation_date = Column(DateTime, nullable=False)
    due_date = Column(DateTime)
    completed = Column(Boolean, default=False)
    user_id = Column(Integer, ForeignKey('user.id'), nullable=False)
    user = relationship("user", back_populates="tasks")

    def __init__(self, *args, **kwargs):
        """On construction, set date of creation."""
        super().__init__(*args, **kwargs)
        self.creation_date = datetime.now()

class User(Base):
    """The User object that owns tasks."""
    id = Column(Integer, primary_key=True)
    username = Column(Unicode, nullable=False)
    email = Column(Unicode, nullable=False)
    password = Column(Unicode, nullable=False)
    date_joined = Column(DateTime, nullable=False)
    token = Column(Unicode, nullable=False)
    tasks = relationship("Task", back_populates="user")

    def __init__(self, *args, **kwargs):
        """On construction, set date of creation."""
        super().__init__(*args, **kwargs)
        self.date_joined = datetime.now()
        self.token = secrets.token_urlsafe(64)
```

Note that there's no `config.include` line for `models.py` anywhere because it's not needed. A `config.include` line is needed only if some part of the application's configuration needs to be changed. This has only created two objects, inheriting from some `Base` class that SQLAlchemy gave us.

### Initializing the database

Now that the models are done, you can write a script to talk to and initialize the database. In the `scripts` directory, create two files: `__init__.py` and `initializedb.py`. The first is simply to turn the `scripts` directory into a Python package. The second is the script needed for database management.

`initializedb.py` needs a function to set up the necessary tables in the database. Like with Flask, this script must be aware of the `Base` object, whose metadata keeps track of every class that inherits from it. The database URL is required to point to and modify its tables.

As such, this database initialization script will work:

```
# initializedb.py
from sqlalchemy import engine_from_config
from todo import SQLALCHEMY_URL
from todo.models import Base

def main():
    settings = {'sqlalchemy.url': SQLALCHEMY_URL}
    engine = engine_from_config(settings, prefix='sqlalchemy.')
    if bool(os.environ.get('DEBUG', '')):
        Base.metadata.drop_all(engine)
    Base.metadata.create_all(engine)
```

**Important note:** This will work only if you include the database URL as an environment variable in `todo/__init__.py` (the second option above). If the database URL was stored in the configuration file, you'll have to include a few lines to read that file. It will look something like this:

```
# alternate initializedb.py
from pyramid.paster import get_appsettings
from pyramid.scripts.common import parse_vars
from sqlalchemy import engine_from_config
import sys
from todo.models import Base

def main():
    config_uri = sys.argv[1]
    options = parse_vars(sys.argv[2:])
    settings = get_appsettings(config_uri, options=options)
    engine = engine_from_config(settings, prefix='sqlalchemy.')
    if bool(os.environ.get('DEBUG', '')):
        Base.metadata.drop_all(engine)
    Base.metadata.create_all(engine)
```

Either way, in `setup.py`, add a console script that will access and run this function.

```
# bottom of setup.py
setup(
    # ... other stuff
    entry_points={
        'paste.app_factory': [
            'main = todo:main',
        ],
        'console_scripts': [
            'initdb = todo.scripts.initializedb:main',
        ],
    }
)
```

When this package is installed, you'll have access to a new console script called `initdb`, which will construct the tables in your database. If the database URL is stored in the configuration file, you'll have to include the path to that file when you invoke the command. It'll look like `$ initdb /path/to/config.ini`.

### Handling requests and the database

Ok, here's where it gets a little deep. Let's talk about **transactions**. A  "transaction," in an abstract sense, is any change made to an existing database. As with Flask, transactions are persisted no sooner than when they are committed. If changes have been made that haven't yet been committed, and you don't want those to occur (maybe there's an error thrown in the process), you can **rollback** a transaction and abort those changes.

In Python, the [transaction package][8] allows you to interact with transactions as objects, which can roll together multiple changes into one single commit. `transaction` provides **transaction managers** , which give applications a straightforward, thread-aware way of handling transactions so all you need to think about is what to change. The `pyramid_tm` package will take the transaction manager from `transaction` and wire it up in a way that's appropriate for Pyramid's request-response cycle, attaching a transaction manager to every incoming request.

Normally, with Pyramid the `request` object is populated when the route mapping to a view is accessed and the view function is called. Every view function will have a `request` object to work with**.** However, Pyramid allows you to modify its configuration to add whatever you might need to the `request` object. You can use the transaction manager that you'll be adding to the `request` to create a session with every request and add that session to the request.

Yay, so why is this important?

By attaching a transaction-managed session to the `request` object, when the view finishes processing the request, any changes made to the database session will be committed without you needing to explicitly commit**.** Here's what all these concepts look like in code.

```
# __init__.py
import os
from pyramid.config import Configurator
from sqlalchemy import engine_from_config
from sqlalchemy.orm import sessionmaker
import zope.sqlalchemy

SQLALCHEMY_URL = os.environ.get('DATABASE_URL', '')

def get_session_factory(engine):
    """Return a generator of database session objects."""
    factory = sessionmaker()
    factory.configure(bind=engine)
    return factory

def get_tm_session(session_factory, transaction_manager):
    """Build a session and register it as a transaction-managed session."""
    dbsession = session_factory()
    zope.sqlalchemy.register(dbsession, transaction_manager=transaction_manager)
    return dbsession

def main(global_config, **settings):
    """Returns a Pyramid WSGI application."""
    settings['sqlalchemy.url'] = SQLALCHEMY_URL
    settings['tm.manager_hook'] = 'pyramid_tm.explicit_manager'
    config = Configurator(settings=settings)
    config.include('.routes')
    config.include('pyramid_tm')
    session_factory = get_session_factory(engine_from_config(settings, prefix='sqlalchemy.'))
    config.registry['dbsession_factory'] = session_factory
    config.add_request_method(
        lambda request: get_tm_session(session_factory, request.tm),
        'dbsession',
        reify=True
    )

    config.scan()
    return config.make_wsgi_app()
```

That looks like a lot, but it only did was what was explained above, plus it added an attribute to the `request` object called `request.dbsession`.

A few new packages were included here, so update `setup.py` with those packages.

```
# in setup.py
requires = [
    'pyramid',
    'pyramid-ipython',
    'waitress',
    'sqlalchemy',
    'psycopg2',
    'pyramid_tm',
    'transaction',
    'zope.sqlalchemy'
]
# blah blah other stuff
```

### Revisiting routes and views

You need to make some real views that handle the data within the database and the routes that map to them.

Start with the routes. You created the `routes.py` file to handle your routes but didn't do much beyond the basic `/` route. Let's fix that.

```
# routes.py
def includeme(config):
    config.add_route('info', '/api/v1/')
    config.add_route('register', '/api/v1/accounts')
    config.add_route('profile_detail', '/api/v1/accounts/{username}')
    config.add_route('login', '/api/v1/accounts/login')
    config.add_route('logout', '/api/v1/accounts/logout')
    config.add_route('tasks', '/api/v1/accounts/{username}/tasks')
    config.add_route('task_detail', '/api/v1/accounts/{username}/tasks/{id}')
```

Now, it not only has static URLs like `/api/v1/accounts`, but it can handle some variable URLs like `/api/v1/accounts/{username}/tasks/{id}` where any variable in a URL will be surrounded by curly braces.

To create the view to create an individual task in your application (like in the Flash example), you can use the `@view_config` decorator to ensure that it only takes incoming `POST` requests and check out how Pyramid handles data from the client.

Take a look at the code, then check out how it differs from Flask's version.

```
# in views.py
from datetime import datetime
from pyramid.view import view_config
from todo.models import Task, User

INCOMING_DATE_FMT = '%d/%m/%Y %H:%M:%S'

@view_config(route_name="tasks", request_method="POST", renderer='json')
def create_task(request):
    """Create a task for one user."""
    response = request.response
    response.headers.extend({'Content-Type': 'application/json'})
    user = request.dbsession.query(User).filter_by(username=request.matchdict['username']).first()
    if user:
        due_date = request.json['due_date']
        task = Task(
            name=request.json['name'],
            note=request.json['note'],
            due_date=datetime.strptime(due_date, INCOMING_DATE_FMT) if due_date else None,
            completed=bool(request.json['completed']),
            user_id=user.id
        )
        request.dbsession.add(task)
        response.status_code = 201
        return {'msg': 'posted'}
```

To start, note on the `@view_config` decorator that the only type of request you want this view to handle is a "POST" request. If you want to specify one type of request or one set of requests, provide either the string noting the request or a tuple/list of such strings.

```
response = request.response
response.headers.extend({'Content-Type': 'application/json'})
# ...other code...
response.status_code = 201
```

The HTTP response sent to the client is generated based on `request.response`. Normally, you wouldn't have to worry about that object. It would just produce a properly formatted HTTP response and you'd never know the difference. However, because you want to do something specific, like modify the response's status code and headers, you need to access that response and its methods/attributes.

Unlike with Flask, you don't need to modify the view function parameter list just because you have variables in the route URL. Instead, any time a variable exists in the route URL, it is collected in the `matchdict` attribute of the `request`. It will exist there as a key-value pair, where the key will be the variable (e.g., "username") and the value will be whatever value was specified in the route (e.g., "bobdobson"). Regardless of what value is passed in through the route URL, it'll always show up as a string in the `matchdict`. So, when you want to pull the username from the incoming request URL, access it with `request.matchdict['username']`

```
user = request.dbsession.query(User).filter_by(username=request.matchdict['username']).first()
```

Querying for objects when using `sqlalchemy` directly differs significantly from what the `flask-sqlalchemy` package allows. Recall that when you used `flask-sqlalchemy` to build your models, the models inherited from the `db.Model` object. That `db` object already contained a connection to the database, so that connection could perform a straightforward operation like `User.query.all()`.

That simple interface isn't present here, as the models in the Pyramid app inherit from `Base`, which is generated from `declarative_base()`, coming directly from the `sqlalchemy` package. It has no direct awareness of the database it'll be accessing. That awareness was attached to the `request` object via the app's central configuration as the `dbsession` attribute. Here's the code from above that did that:

```
config.add_request_method(
    lambda request: get_tm_session(session_factory, request.tm),
    'dbsession',
    reify=True
)
```

With all that said, whenever you want to query OR modify the database, you must work through `request.dbsession`. In the case, you want to query your "users" table for a specific user by using their username as their identifier. As such, the `User` object is provided as an argument to the `.query` method, then the normal SQLAlchemy operations are done from there.

An interesting thing about this way of querying the database is that you can query for more than just one object or list of one type of object. You can query for:

  * Object attributes on their own, e.g., `request.dbsession.query(User.username)` would query for usernames
  * Tuples of object attributes, e.g., `request.dbsession.query(User.username, User.date_joined)`
  * Tuples of multiple objects, e.g., `request.dbsession.query(User, Task)`



The data sent along with the incoming request will be found within the `request.json` dictionary.

The last major difference is, because of all the machinations necessary to attach the committing of a session's activity to Pyramid's request-response cycle, you don't have to call `request.dbsession.commit()` at the end of your view. It's convenient, but there is one thing to be aware of moving forward. If instead of a new add to the database, you wanted to edit a pre-existing object in the database, you couldn't use `request.dbsession.commit()`. Pyramid will throw an error, saying something along the lines of "commit behavior is being handled by the transaction manager, so you can't call it on your own." And if you don't do something that resembles committing your changes, your changes won't stick.

The solution here is to use `request.dbsession.flush()`. The job of `.flush()` is to signal to the database that some changes have been made and need to be included with the next commit.

### Planning for the future

At this point, you've set up most of the important parts of Pyramid, analogous to what you constructed with Flask in part one. There's much more that goes into an application, but much of the meat is handled here. Other view functions will follow similar formatting, and of course, there's always the question of security (which Pyramid has built in!).

One of the major differences I see in the setup of a Pyramid application is that it has a much more intense configuration step than there is with Flask. I broke down those configuration steps to explain more about what's going on when a Pyramid application is constructed. However, it'd be disingenuous to act like I've known all of this since I started programming. My first experience with the Pyramid framework was with Pyramid 1.7 and its scaffolding system of `pcreate`, which builds out most of the necessary configuration, so all you need to do is think about the functionality you want to build.

As of Pyramid 1.8, `pcreate` has been deprecated in favor of [cookiecutter][9], which effectively does the same thing. The difference is that it's maintained by someone else, and there are cookiecutter templates for more than just Pyramid projects. Now that we've gone through the components of a Pyramid project, I'd never endorse building a Pyramid project from scratch again when a cookiecutter template is available. Why do the hard work if you don't have to? In fact, the [pyramid-cookiecutter-alchemy][10] template would accomplish much of what I've written here (and a little bit more). It's actually similar to the `pcreate` scaffold I used when I first learned Pyramid.

Learn more Python at [PyCon Cleveland 2018][11].

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/5/pyramid-framework

作者：[Nicholas Hunt-Walker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/nhuntwalker
[b]: https://github.com/lujun9972
[1]: https://opensource.com/article/18/4/flask
[2]: http://flask.pocoo.org/
[3]: https://trypyramid.com/
[4]: http://www.tornadoweb.org/en/stable/
[5]: https://www.djangoproject.com/
[6]: https://www.sqlalchemy.org/
[7]: http://docs.sqlalchemy.org/en/latest/orm/extensions/declarative/api.html#api-reference
[8]: http://zodb.readthedocs.io/en/latest/transactions.html
[9]: https://cookiecutter.readthedocs.io/en/latest/
[10]: https://github.com/Pylons/pyramid-cookiecutter-alchemy
[11]: https://us.pycon.org/2018/
