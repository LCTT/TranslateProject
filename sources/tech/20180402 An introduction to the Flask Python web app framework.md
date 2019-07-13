[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: subject: (An introduction to the Flask Python web app framework)
[#]: via: (https://opensource.com/article/18/4/flask)
[#]: author: (Nicholas Hunt-Walker https://opensource.com/users/nhuntwalker)
[#]: url: ( )

An introduction to the Flask Python web app framework
======
In the first part in a series comparing Python frameworks, learn about Flask.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/python-programming-code-keyboard.png?itok=fxiSpmnd)

If you're developing a web app in Python, chances are you're leveraging a framework. A [framework][1] "is a code library that makes a developer's life easier when building reliable, scalable, and maintainable web applications" by providing reusable code or extensions for common operations. There are a number of frameworks for Python, including [Flask][2], [Tornado][3], [Pyramid][4], and [Django][5]. New Python developers often ask: Which framework should I use?

  * New visitors to the site should be able to register new accounts.
  * Registered users can log in, log out, see information for their profiles, and edit their information.
  * Registered users can create new task items, see their existing tasks, and edit existing tasks.



This series is designed to help developers answer that question by comparing those four frameworks. To compare their features and operations, I'll take each one through the process of constructing an API for a simple To-Do List web application. The API is itself fairly straightforward:

All this rounds out to a compact set of API endpoints that each backend must implement, along with the allowed HTTP methods:

  * `GET /`
  * `POST /accounts`
  * `POST /accounts/login`
  * `GET /accounts/logout`
  * `GET, PUT, DELETE /accounts/<str : username>`
  * `GET, POST /accounts/<str : username>/tasks`
  * `GET, PUT, DELETE /accounts/<str : username>/tasks/<int : id>`



Each framework has a different way to put together its routes, models, views, database interaction, and overall application configuration. I'll describe those aspects of each framework in this series, which will begin with Flask.

### Flask startup and configuration

Like most widely used Python libraries, the Flask package is installable from the [Python Package Index][6] (PPI). First create a directory to work in (something like `flask_todo` is a fine directory name) then install the `flask` package. You'll also want to install `flask-sqlalchemy` so your Flask application has a simple way to talk to a SQL database.

I like to do this type of work within a Python 3 virtual environment. To get there, enter the following on the command line:

```
$ mkdir flask_todo
$ cd flask_todo
$ pipenv install --python 3.6
$ pipenv shell
(flask-someHash) $ pipenv install flask flask-sqlalchemy
```

If you want to turn this into a Git repository, this is a good place to run `git init`. It'll be the root of the project, and if you want to export the codebase to a different machine, it will help to have all the necessary setup files here.

A good way to get moving is to turn the codebase into an installable Python distribution. At the project's root, create `setup.py` and a directory called `todo` to hold the source code.

The `setup.py` should look something like this:

```
from setuptools import setup, find_packages

requires = [
    'flask',
    'flask-sqlalchemy',
    'psycopg2',
]

setup(
    name='flask_todo',
    version='0.0',
    description='A To-Do List built with Flask',
    author='<Your actual name here>',
    author_email='<Your actual e-mail address here>',
    keywords='web flask',
    packages=find_packages(),
    include_package_data=True,
    install_requires=requires
)
```

This way, whenever you want to install or deploy your project, you'll have all the necessary packages in the `requires` list. You'll also have everything you need to set up and install the package in `site-packages`. For more information on how to write an installable Python distribution, check out [the docs on setup.py][7].

Within the `todo` directory containing your source code, create an `app.py` file and a blank `__init__.py` file. The `__init__.py` file allows you to import from `todo` as if it were an installed package. The `app.py` file will be the application's root. This is where all the `Flask` application goodness will go, and you'll create an environment variable that points to that file. If you're using `pipenv` (like I am), you can locate your virtual environment with `pipenv --venv` and set up that environment variable in your environment's `activate` script.

```
# in your activate script, probably at the bottom (but anywhere will do)

export FLASK_APP=$VIRTUAL_ENV/../todo/app.py
export DEBUG='True'
```

When you installed `Flask`, you also installed the `flask` command-line script. Typing `flask run` will prompt the virtual environment's Flask package to run an HTTP server using the `app` object in whatever script the `FLASK_APP` environment variable points to. The script above also includes an environment variable named `DEBUG` that will be used a bit later.

Let's talk about this `app` object.

In `todo/app.py`, you'll create an `app` object, which is an instance of the `Flask` object. It'll act as the central configuration object for the entire application. It's used to set up pieces of the application required for extended functionality, e.g., a database connection and help with authentication.

It's regularly used to set up the routes that will become the application's points of interaction. To explain what this means, let's look at the code it corresponds to.

```
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    """Print 'Hello, world!' as the response body."""
    return 'Hello, world!'
```

This is the most basic complete Flask application. `app` is an instance of `Flask`, taking in the `__name__` of the script file. This lets Python know how to import from files relative to this one. The `app.route` decorator decorates the first **view** function; it can specify one of the routes used to access the application. (We'll look at this later.)

Any view you specify must be decorated by `app.route` to be a functional part of the application. You can have as many functions as you want scattered across the application, but in order for that functionality to be accessible from anything external to the application, you must decorate that function and specify a route to make it into a view.

In the example above, when the app is running and accessed at `http://domainname/`, a user will receive `"Hello, World!"` as a response.

### Connecting the database in Flask

While the code example above represents a complete Flask application, it doesn't do anything interesting. One interesting thing a web application can do is persist user data, but it needs the help of and connection to a database.

Flask is very much a "do it yourself" web framework. This means there's no built-in database interaction, but the `flask-sqlalchemy` package will connect a SQL database to a Flask application. The `flask-sqlalchemy` package needs just one thing to connect to a SQL database: The database URL.

Note that a wide variety of SQL database management systems can be used with `flask-sqlalchemy`, as long as the DBMS has an intermediary that follows the [DBAPI-2 standard][8]. In this example, I'll use PostgreSQL (mainly because I've used it a lot), so the intermediary to talk to the Postgres database is the `psycopg2` package. Make sure `psycopg2` is installed in your environment and include it in the list of required packages in `setup.py`. You don't have to do anything else with it; `flask-sqlalchemy` will recognize Postgres from the database URL.

Flask needs the database URL to be part of its central configuration through the `SQLALCHEMY_DATABASE_URI` attribute. A quick and dirty solution is to hardcode a database URL into the application.

```
# top of app.py
from flask import Flask
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgres://localhost:5432/flask_todo'
db = SQLAlchemy(app)
```

However, this is not a sustainable solution. If you change databases or don't want your database URL visible in source control, you'll have to take extra steps to ensure your information is appropriate for the environment.

You can make things simpler by using environment variables. They will ensure that, no matter what machine the code runs on, it always points at the right stuff if that stuff is configured in the running environment. It also ensures that, even though you need that information to run the application, it never shows up as a hardcoded value in source control.

In the same place you declared `FLASK_APP`, declare a `DATABASE_URL` pointing to the location of your Postgres database. Development tends to work locally, so just point to your local database.

```
# also in your activate script

export DATABASE_URL='postgres://localhost:5432/flask_todo'
```

Now in `app.py`, include the database URL in your app configuration.

```
app.config['SQLALCHEMY_DATABASE_URI'] = os.environ.get('DATABASE_URL', '')
db = SQLAlchemy(app)
```

And just like that, your application has a database connection!

### Defining objects in Flask

Having a database to talk to is a good first step. Now it's time to define some objects to fill that database.

In application development, a "model" refers to the data representation of some real or conceptual object. For example, if you're building an application for a car dealership, you may define a `Car` model that encapsulates all of a car's attributes and behavior.

In this case, you're building a To-Do List with Tasks, and each Task belongs to a User. Before you think too deeply about how they're related to each other, start by defining objects for Tasks and Users.

The `flask-sqlalchemy` package leverages [SQLAlchemy][9] to set up and inform the database structure. You'll define a model that will live in the database by inheriting from the `db.Model` object and define the attributes of those models as `db.Column` instances. For each column, you must specify a data type, so you'll pass that data type into the call to `db.Column` as the first argument.

Because the model definition occupies a different conceptual space than the application configuration, make `models.py` to hold model definitions separate from `app.py`. The Task model should be constructed to have the following attributes:

  * `id`: a value that's a unique identifier to pull from the database
  * `name`: the name or title of the task that the user will see when the task is listed
  * `note`: any extra comments that a person might want to leave with their task
  * `creation_date`: the date and time the task was created
  * `due_date`: the date and time the task is due to be completed (if at all)
  * `completed`: a way to indicate whether or not the task has been completed



Given this attribute list for Task objects, the application's `Task` object can be defined like so:

```
from .app import db
from datetime import datetime

class Task(db.Model):
    """Tasks for the To Do list."""
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.Unicode, nullable=False)
    note = db.Column(db.Unicode)
    creation_date = db.Column(db.DateTime, nullable=False)
    due_date = db.Column(db.DateTime)
    completed = db.Column(db.Boolean, default=False)

    def __init__(self, *args, **kwargs):
        """On construction, set date of creation."""
        super().__init__(*args, **kwargs)
        self.creation_date = datetime.now()
```

Note the extension of the class constructor method. At the end of the day, any model you construct is still a Python object and therefore must go through construction in order to be instantiated. It's important to ensure that the creation date of the model instance reflects its actual date of creation. You can explicitly set that relationship by effectively saying, "when an instance of this model is constructed, record the date and time and set it as the creation date."

### Model relationships

In a given web application, you may want to be able to express relationships between objects. In the To-Do List example, users own multiple tasks, and each task is owned by only one user. This is an example of a "many-to-one" relationship, also known as a foreign key relationship, where the tasks are the "many" and the user owning those tasks is the "one."

In Flask, a many-to-one relationship can be specified using the `db.relationship` function. First, build the User object.

```
class User(db.Model):
    """The User object that owns tasks."""
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.Unicode, nullable=False)
    email = db.Column(db.Unicode, nullable=False)
    password = db.Column(db.Unicode, nullable=False)
    date_joined = db.Column(db.DateTime, nullable=False)
    token = db.Column(db.Unicode, nullable=False)

    def __init__(self, *args, **kwargs):
        """On construction, set date of creation."""
        super().__init__(*args, **kwargs)
        self.date_joined = datetime.now()
        self.token = secrets.token_urlsafe(64)
```

It looks very similar to the Task object; you'll find that most objects have the same basic format of class attributes as table columns. Every once in a while, you'll run into something a little different, including some multiple-inheritance magic, but this is the norm.

Now that the `User` model is created, you can set up the foreign key relationship. For the "many," set fields for the `user_id` of the `User` that owns this task, as well as the `user` object with that ID. Also make sure to include a keyword argument (`back_populates`) that updates the User model when the task gets a user as an owner.

For the "one," set a field for the `tasks` the specific user owns. Similar to maintaining the two-way relationship on the Task object, set a keyword argument on the User's relationship field to update the Task when it is assigned to a user.

```
# on the Task object
user_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)
user = db.relationship("user", back_populates="tasks")

# on the User object
tasks = db.relationship("Task", back_populates="user")
```

### Initializing the database

Now that the models and model relationships are set, start setting up your database. Flask doesn't come with its own database-management utility, so you'll have to write your own (to some degree). You don't have to get fancy with it; you just need something to recognize what tables are to be created and some code to create them (or drop them should the need arise). If you need something more complex, like handling updates to database tables (i.e., database migrations), you'll want to look into a tool like [Flask-Migrate][10] or [Flask-Alembic][11].

Create a script called `initializedb.py` next to `setup.py` for managing the database. (Of course, it doesn't need to be called this, but why not give names that are appropriate to a file's function?) Within `initializedb.py`, import the `db` object from `app.py` and use it to create or drop tables. `initializedb.py` should end up looking something like this:

```
from todo.app import db
import os

if bool(os.environ.get('DEBUG', '')):
    db.drop_all()
db.create_all()
```

If a `DEBUG` environment variable is set, drop tables and rebuild. Otherwise, just create the tables once and you're good to go.

### Views and URL config

The last bits needed to connect the entire application are the views and routes. In web development, a "view" (in concept) is functionality that runs when a specific access point (a "route") in your application is hit. These access points appear as URLs: paths to functionality in an application that return some data or handle some data that has been provided. The views will be logical structures that handle specific HTTP requests from a given client and return some HTTP response to that client.

In Flask, views appear as functions; for example, see the `hello_world` view above. For simplicity, here it is again:

```
@app.route('/')
def hello_world():
    """Print 'Hello, world!' as the response body."""
    return 'Hello, world!'
```

When the route of `http://domainname/` is accessed, the client receives the response, "Hello, world!"

With Flask, a function is marked as a view when it is decorated by `app.route`. In turn, `app.route` adds to the application's central configuration a map from the specified route to the function that runs when that route is accessed. You can use this to start building out the rest of the API.

Start with a view that handles only `GET` requests, and respond with the JSON representing all the routes that will be accessible and the methods that can be used to access them.

```
from flask import jsonify

@app.route('/api/v1', methods=["GET"])
def info_view():
    """List of routes for this API."""
    output = {
        'info': 'GET /api/v1',
        'register': 'POST /api/v1/accounts',
        'single profile detail': 'GET /api/v1/accounts/<username>',
        'edit profile': 'PUT /api/v1/accounts/<username>',
        'delete profile': 'DELETE /api/v1/accounts/<username>',
        'login': 'POST /api/v1/accounts/login',
        'logout': 'GET /api/v1/accounts/logout',
        "user's tasks": 'GET /api/v1/accounts/<username>/tasks',
        "create task": 'POST /api/v1/accounts/<username>/tasks',
        "task detail": 'GET /api/v1/accounts/<username>/tasks/<id>',
        "task update": 'PUT /api/v1/accounts/<username>/tasks/<id>',
        "delete task": 'DELETE /api/v1/accounts/<username>/tasks/<id>'
    }
    return jsonify(output)
```

Since you want your view to handle one specific type of HTTP request, use `app.route` to add that restriction. The `methods` keyword argument will take a list of strings as a value, with each string a type of possible HTTP method. In practice, you can use `app.route` to restrict to one or more types of HTTP request or accept any by leaving the `methods` keyword argument alone.

Whatever you intend to return from your view function **must** be a string or an object that Flask turns into a string when constructing a properly formatted HTTP response. The exceptions to this rule are when you're trying to handle redirects and exceptions thrown by your application. What this means for you, the developer, is that you need to be able to encapsulate whatever response you're trying to send back to the client into something that can be interpreted as a string.

A good structure that contains complexity but can still be stringified is a Python dictionary. Therefore, I recommend that, whenever you want to send some data to the client, you choose a Python `dict` with whatever key-value pairs you need to convey information. To turn that dictionary into a properly formatted JSON response, headers and all, pass it as an argument to Flask's `jsonify` function (`from flask import jsonify`).

The view function above takes what is effectively a listing of every route that this API intends to handle and sends it to the client whenever the `http://domainname/api/v1` route is accessed. Note that, on its own, Flask supports routing to exactly matching URIs, so accessing that same route with a trailing `/` would create a 404 error. If you wanted to handle both with the same view function, you'd need stack decorators like so:

```
@app.route('/api/v1', methods=["GET"])
@app.route('/api/v1/', methods=["GET"])
def info_view():
    # blah blah blah more code
```

An interesting case is that if the defined route had a trailing slash and the client asked for the route without the slash, you wouldn't need to double up on decorators. Flask would redirect the client's request appropriately. It's odd that it doesn't work both ways.

### Flask requests and the DB

At its base, a web framework's job is to handle incoming HTTP requests and return HTTP responses. The previously written view doesn't really have much to do with HTTP requests aside from the URI that was accessed. It doesn't process any data. Let's look at how Flask behaves when data needs handling.

The first thing to know is that Flask doesn't provide a separate `request` object to each view function. It has **one** global request object that every view function can use, and that object is conveniently named `request` and is importable from the Flask package.

The next thing is that Flask's route patterns can have a bit more nuance. One scenario is a hardcoded route that must be matched perfectly to activate a view function. Another scenario is a route pattern that can handle a range of routes, all mapping to one view by allowing a part of that route to be variable. If the route in question has a variable, the corresponding value can be accessed from the same-named variable in the view's parameter list.

```
@app.route('/a/sample/<variable>/route)
def some_view(variable):
    # some code blah blah blah
```

To communicate with the database within a view, you must use the `db` object that was populated toward the top of the script. Its `session` attribute is your connection to the database when you want to make changes. If you just want to query for objects, the objects built from `db.Model` have their own database interaction layer through the `query` attribute.

Finally, any response you want from a view that's more complex than a string must be built deliberately. Previously you built a response using a "jsonified" dictionary, but certain assumptions were made (e.g., 200 status code, status message "OK," Content-Type of "text/plain"). Any special sauce you want in your HTTP response must be added deliberately.

Knowing these facts about working with Flask views allows you to construct a view whose job is to create new `Task` objects. Let's look at the code (below) and address it piece by piece.

```
from datetime import datetime
from flask import request, Response
from flask_sqlalchemy import SQLAlchemy
import json

from .models import Task, User

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = os.environ.get('DATABASE_URL', '')
db = SQLAlchemy(app)

INCOMING_DATE_FMT = '%d/%m/%Y %H:%M:%S'

@app.route('/api/v1/accounts/<username>/tasks', methods=['POST'])
def create_task(username):
    """Create a task for one user."""
    user = User.query.filter_by(username=username).first()
    if user:
        task = Task(
            name=request.form['name'],
            note=request.form['note'],
            creation_date=datetime.now(),
            due_date=datetime.strptime(due_date, INCOMING_DATE_FMT) if due_date else None,
            completed=bool(request.form['completed']),
            user_id=user.id,
        )
        db.session.add(task)
        db.session.commit()
        output = {'msg': 'posted'}
        response = Response(
            mimetype="application/json",
            response=json.dumps(output),
            status=201
        )
        return response
```

Let's start with the `@app.route` decorator. The route is `'/api/v1/accounts/<username>/tasks'`, where `<username>` is a route variable. Put angle brackets around any part of the route you want to be variable, then include that part of the route on the next line in the parameter list **with the same name**. The only parameters that should be in the parameter list should be the variables in your route.

Next comes the query:

```
user = User.query.filter_by(username=username).first()
```

To look for one user by username, conceptually you need to look at all the User objects stored in the database and find the users with the username matching the one that was requested. With Flask, you can ask the `User` object directly through the `query` attribute for the instance matching your criteria. This type of query would provide a list of objects (even if it's only one object or none at all), so to get the object you want, just call `first()`.

```
task = Task(
    name=request.form['name'],
    note=request.form['note'],
    creation_date=datetime.now(),
    due_date=datetime.strptime(due_date, INCOMING_DATE_FMT) if due_date else None,
    completed=bool(request.form['completed']),
    user_id=user.id,
)
```

Whenever data is sent to the application, regardless of the HTTP method used, that data is stored on the `form` attribute of the `request` object. The name of the field on the frontend will be the name of the key mapped to that data in the `form` dictionary. It'll always come in the form of a string, so if you want your data to be a specific data type, you'll have to make it explicit by casting it as the appropriate type.

The other thing to note is the assignment of the current user's user ID to the newly instantiated `Task`. This is how that foreign key relationship is maintained.

```
db.session.add(task)
db.session.commit()
```

Creating a new `Task` instance is great, but its construction has no inherent connection to tables in the database. In order to insert a new row into the corresponding SQL table, you must use the `session` attached to the `db` object. The `db.session.add(task)` stages the new `Task` instance to be added to the table, but doesn't add it yet. While it's done only once here, you can add as many things as you want before committing. The `db.session.commit()` takes all the staged changes, or "commits," and applies them to the corresponding tables in the database.

```
output = {'msg': 'posted'}
response = Response(
    mimetype="application/json",
    response=json.dumps(output),
    status=201
)
```

The response is an actual instance of a `Response` object with its `mimetype`, body, and `status` set deliberately. The goal for this view is to alert the user they created something new. Seeing how this view is supposed to be part of a backend API that sends and receives JSON, the response body must be JSON serializable. A dictionary with a simple string message should suffice. Ensure that it's ready for transmission by calling `json.dumps` on your dictionary, which will turn your Python object into valid JSON. This is used instead of `jsonify`, as `jsonify` constructs an actual response object using its input as the response body. In contrast, `json.dumps` just takes a given Python object and converts it into a valid JSON string if possible.

By default, the status code of any response sent with Flask will be `200`. That will work for most circumstances, where you're not trying to send back a specific redirection-level or error-level message. Since this case explicitly lets the frontend know when a new item has been created, set the status code to be `201`, which corresponds to creating a new thing.

And that's it! That's a basic view for creating a new `Task` object in Flask given the current setup of your To-Do List application. Similar views could be constructed for listing, editing, and deleting tasks, but this example offers an idea of how it could be done.

### The bigger picture

There is much more that goes into an application than one view for creating new things. While I haven't discussed anything about authorization/authentication systems, testing, database migration management, cross-origin resource sharing, etc., the details above should give you more than enough to start digging into building your own Flask applications.

Learn more Python at [PyCon Cleveland 2018][12].

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/4/flask

作者：[Nicholas Hunt-Walker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/nhuntwalker
[b]: https://github.com/lujun9972
[1]: https://www.fullstackpython.com/web-frameworks.html
[2]: http://flask.pocoo.org/
[3]: http://www.tornadoweb.org/en/stable/
[4]: https://trypyramid.com/
[5]: https://www.djangoproject.com/
[6]: https://pypi.python.org
[7]: https://docs.python.org/3/distutils/setupscript.html
[8]: https://www.python.org/dev/peps/pep-0249/
[9]: https://www.sqlalchemy.org/
[10]: https://flask-migrate.readthedocs.io/en/latest/
[11]: https://flask-alembic.readthedocs.io/en/stable/
[12]: https://us.pycon.org/2018/
