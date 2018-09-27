Translating by MjSeven


An introduction to the Django Python web app framework
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/web-spider-frame-framework.png?itok=Rl2AG2Dc)

In the first three articles of this four-part series comparing different Python web frameworks, we covered the [Pyramid][1], [Flask][2], and [Tornado][3] web frameworks. We've built the same app three times and have finally made our way to [Django][4]. Django is, by and large, the major web framework for Python developers these days and it's not too hard to see why. It excels in hiding a lot of the configuration logic and letting you focus on being able to build big, quickly.

That said, when it comes to small projects, like our To-Do List app, Django can be a bit like bringing a firehose to a water gun fight. Let's see how it all comes together.

### About Django

Django styles itself as "a high-level Python web framework that encourages rapid development and clean, pragmatic design. Built by experienced developers, it takes care of much of the hassle of web development, so you can focus on writing your app without needing to reinvent the wheel." And they really mean it! This massive web framework comes with so many batteries included that oftentimes during development it can be a mystery as to how everything manages to work together.

In addition to the framework itself being large, the Django community is absolutely massive. In fact, it's so big and active that there's [a whole website][5] devoted to the third-party packages people have designed to plug into Django to do a whole host of things. This includes everything from authentication and authorization, to full-on Django-powered content management systems, to e-commerce add-ons, to integrations with Stripe. Talk about not re-inventing the wheel; chances are if you want something done with Django, someone has already done it and you can just pull it into your project.

For this purpose, we want to build a REST API with Django, so we'll leverage the always popular [Django REST framework][6]. Its job is to turn the Django framework, which was made to serve fully rendered HTML pages built with Django's own templating engine, into a system specifically geared toward effectively handling REST interactions. Let's get going with that.

### Django startup and configuration
```
$ mkdir django_todo

$ cd django_todo

$ pipenv install --python 3.6

$ pipenv shell

(django-someHash) $ pipenv install django djangorestframework

```

For reference, we're working with `django-2.0.7` and `djangorestframework-3.8.2`.

Unlike Flask, Tornado, and Pyramid, we don't need to write our own `setup.py` file. We're not making an installable Python distribution. As with many things, Django takes care of that for us in its own Django way. We'll still need a `requirements.txt` file to track all our necessary installs for deployment elsewhere. However, as far as targeting modules within our Django project goes, Django will let us list the subdirectories we want access to, then allow us to import from those directories as if they're installed packages.

First, we have to create a Django project.

When we installed Django, we also installed the command-line script `django-admin`. Its job is to manage all the various Django-related commands that help put our project together and maintain it as we continue to develop. Instead of having us build up the entire Django ecosystem from scratch, the `django-admin` will allow us to get started with all the absolutely necessary files (and more) we need for a standard Django project.

The syntax for invoking `django-admin`'s start-project command is `django-admin startproject <project name> <directory where we want the files>`. We want the files to exist in our current working directory, so:
```
(django-someHash) $ django-admin startproject django_todo .

```

Typing `ls` will show one new file and one new directory.
```
(django-someHash) $ ls

manage.py   django_todo

```

`manage.py` is a command-line-executable Python file that ends up just being a wrapper around `django-admin`. As such, its job is the same: to help us manage our project. Hence the name `manage.py`.

The directory it created, the `django_todo` inside of `django_todo`, represents the configuration root for our project. Let's dig into that now.

### Configuring Django

By calling the `django_todo` directory the "configuration root," we mean this directory holds the files necessary for generally configuring our Django project. Pretty much everything outside this directory will be focused solely on the "business logic" associated with the project's models, views, routes, etc. All points that connect the project together will lead here.

Calling `ls` within `django_todo` reveals four files:
```
(django-someHash) $ cd django_todo

(django-someHash) $ ls

__init__.py settings.py urls.py     wsgi.py

```

  * `__init__.py` is empty, solely existing to turn this directory into an importable Python package.
  * `settings.py` is where most configuration items will be set, like whether the project's in DEBUG mode, what databases are in use, where Django should look for files, etc. It is the "main configuration" part of the configuration root, and we'll dig into that momentarily.
  * `urls.py` is, as the name implies, where the URLs are set. While we don't have to explicitly write every URL for the project in this file, we **do** need to make this file aware of any other places where URLs have been declared. If this file doesn't point to other URLs, those URLs don't exist. **Period.**
  * `wsgi.py` is for serving the application in production. Just like how Pyramid, Tornado, and Flask exposed some "app" object that was the configured application to be served, Django must also expose one. That's done here. It can then be served with something like [Gunicorn][7], [Waitress][8], or [uWSGI][9].



#### Setting the settings

Taking a look inside `settings.py` will reveal its considerable size—and these are just the defaults! This doesn't even include hooks for the database, static files, media files, any cloud integration, or any of the other dozens of ways that a Django project can be configured. Let's see, top to bottom, what we've been given:

  * `BASE_DIR` sets the absolute path to the base directory, or the directory where `manage.py` is located. This is useful for locating files.
  * `SECRET_KEY` is a key used for cryptographic signing within the Django project. In practice, it's used for things like sessions, cookies, CSRF protection, and auth tokens. As soon as possible, preferably before the first commit, the value for `SECRET_KEY` should be changed and moved into an environment variable.
  * `DEBUG` tells Django whether to run the project in development mode or production mode. This is an extremely critical distinction.
    * In development mode, when an error pops up, Django will show the full stack trace that led to the error, as well as all the settings and configurations involved in running the project. This can be a massive security issue if `DEBUG` was set to `True` in a production environment.
    * In production, Django shows a plain error page when things go wrong. No information is given beyond an error code.
    * A simple way to safeguard our project is to set `DEBUG` to an environment variable, like `bool(os.environ.get('DEBUG', ''))`.
  * `ALLOWED_HOSTS` is the literal list of hostnames from which the application is being served. In development this can be empty, but in production our Django project will not run if the host that serves the project is not among the list of ALLOWED_HOSTS. Another thing for the box of environment variables.
  * `INSTALLED_APPS` is the list of Django "apps" (think of them as subdirectories; more on this later) that our Django project has access to. We're given a few by default to provide…
    * The built-in Django administrative website
    * Django's built-in authentication system
    * Django's one-size-fits-all manager for data models
    * Session management
    * Cookie and session-based messaging
    * Usage of static files inherent to the site, like `css` files, `js` files, any images that are a part of our site's design, etc.
  * `MIDDLEWARE` is as it sounds: the middleware that helps our Django project run. Much of it is for handling various types of security, although we can add others as we need them.
  * `ROOT_URLCONF` sets the import path of our base-level URL configuration file. That `urls.py` that we saw before? By default, Django points to that file to gather all our URLs. If we want Django to look elsewhere, we'll set the import path to that location here.
  * `TEMPLATES` is the list of template engines that Django would use for our site's frontend if we were relying on Django to build our HTML. Since we're not, it's irrelevant.
  * `WSGI_APPLICATION` sets the import path of our WSGI application—the thing that gets served when in production. By default, it points to an `application` object in `wsgi.py`. This rarely, if ever, needs to be modified.
  * `DATABASES` sets which databases our Django project will access. The `default` database must be set. We can set others by name, as long as we provide the `HOST`, `USER`, `PASSWORD`, `PORT`, database `NAME`, and appropriate `ENGINE`. As one might imagine, these are all sensitive pieces of information, so it's best to hide them away in environment variables. [Check the Django docs][10] for more details.
    * Note: If instead of providing individual pieces of a database's location, you'd rather provide the full database URL, check out [dj_database_url][11].
  * `AUTH_PASSWORD_VALIDATORS` is effectively a list of functions that run to check input passwords. We get a few by default, but if we had other, more complex validation needs—more than merely checking if the password matches a user's attribute, if it exceeds the minimum length, if it's one of the 1,000 most common passwords, or if the password is entirely numeric—we could list them here.
  * `LANGUAGE_CODE` will set the language for the site. By default it's US English, but we could switch it up to be other languages.
  * `TIME_ZONE` is the time zone for any autogenerated timestamps in our Django project. I cannot stress enough how important it is that we stick to UTC and perform any time zone-specific processing elsewhere instead of trying to reconfigure this setting. As [this article][12] states, UTC is the common denominator among all time zones because there are no offsets to worry about. If offsets are that important, we could calculate them as needed with an appropriate offset from UTC.
  * `USE_I18N` will let Django use its own translation services to translate strings for the front end. I18N = internationalization (18 characters between "i" and "n")
  * `USE_L10N` (L10N = localization [10 characters between "l" and "n"]) will use the common local formatting of data if set to `True`. A great example is dates: in the US it's MM-DD-YYYY. In Europe, dates tend to be written DD-MM-YYYY
  * `STATIC_URL` is part of a larger body of settings for serving static files. We'll be building a REST API, so we won't need to worry about static files. In general, this sets the root path after the domain name for every static file. So, if we had a logo image to serve, it'd be `http://<domainname>/<STATIC_URL>/logo.gif`



These settings are pretty much ready to go by default. One thing we'll have to change is the `DATABASES` setting. First, we create the database that we'll be using with:
```
(django-someHash) $ createdb django_todo

```

We want to use a PostgreSQL database like we did with Flask, Pyramid, and Tornado. That means we'll have to change the `DATABASES` setting to allow our server to access a PostgreSQL database. First: the engine. By default, the database engine is `django.db.backends.sqlite3`. We'll be changing that to `django.db.backends.postgresql`.

For more information about Django's available engines, [check the docs][13]. Note that while it is technically possible to incorporate a NoSQL solution into a Django project, out of the box, Django is strongly biased toward SQL solutions.

Next, we have to specify the key-value pairs for the different parts of the connection parameters.

  * `NAME` is the name of the database we just created.
  * `USER` is an individual's Postgres database username
  * `PASSWORD` is the password needed to access the database
  * `HOST` is the host for the database. `localhost` or `127.0.0.1` will work, as we're developing locally.
  * `PORT` is whatever PORT we have open for Postgres; it's typically `5432`.



`settings.py` expects us to provide string values for each of these keys. However, this is highly sensitive information. That's not going to work for any responsible developer. There are several ways to address this problem, but we'll just set up environment variables.
```
DATABASES = {

    'default': {

        'ENGINE': 'django.db.backends.postgresql',

        'NAME': os.environ.get('DB_NAME', ''),

        'USER': os.environ.get('DB_USER', ''),

        'PASSWORD': os.environ.get('DB_PASS', ''),

        'HOST': os.environ.get('DB_HOST', ''),

        'PORT': os.environ.get('DB_PORT', ''),

    }

}

```

Before going forward, make sure to set the environment variables or Django will not work. Also, we need to install `psycopg2` into this environment so we can talk to our database.

### Django routes and views

Let's make something function inside this project. We'll be using Django REST Framework to construct our REST API, so we have to make sure we can use it by adding `rest_framework` to the end of `INSTALLED_APPS` in `settings.py`.
```
INSTALLED_APPS = [

    'django.contrib.admin',

    'django.contrib.auth',

    'django.contrib.contenttypes',

    'django.contrib.sessions',

    'django.contrib.messages',

    'django.contrib.staticfiles',

    'rest_framework'

]

```

While Django REST Framework doesn't exclusively require class-based views (like Tornado) to handle incoming requests, it is the preferred method for writing views. Let's define one.

Let's create a file called `views.py` in `django_todo`. Within `views.py`, we'll create our "Hello, world!" view.
```
# in django_todo/views.py

from rest_framework.response import JsonResponse

from rest_framework.views import APIView



class HelloWorld(APIView):

    def get(self, request, format=None):

        """Print 'Hello, world!' as the response body."""

        return JsonResponse("Hello, world!")

```

Every Django REST Framework class-based view inherits either directly or indirectly from `APIView`. `APIView` handles a ton of stuff, but for our purposes it does these specific things:

  * Sets up the methods needed to direct traffic based on the HTTP method (e.g. GET, POST, PUT, DELETE)
  * Populates the `request` object with all the data and attributes we'll need for parsing and processing any incoming request
  * Takes the `Response` or `JsonResponse` that every dispatch method (i.e., methods named `get`, `post`, `put`, `delete`) returns and constructs a properly formatted HTTP response.



Yay, we have a view! On its own it does nothing. We need to connect it to a route.

If we hop into `django_todo/urls.py`, we reach our default URL configuration file. As mentioned earlier: If a route in our Django project is not included here, it doesn't exist.

We add desired URLs by adding them to the given `urlpatterns` list. By default, we get a whole set of URLs for Django's built-in site administration backend. We'll delete that completely.

We also get some very helpful doc strings that tell us exactly how to add routes to our Django project. We'll need to provide a call to `path()` with three parameters:

  * The desired route, as a string (without the leading slash)
  * The view function (only ever a function!) that will handle that route
  * The name of the route in our Django project



Let's import our `HelloWorld` view and attach it to the home route `"/"`. We can also remove the path to the `admin` from `urlpatterns`, as we won't be using it.
```
# django_todo/urls.py, after the big doc string

from django.urls import path

from django_todo.views import HelloWorld



urlpatterns = [

    path('', HelloWorld.as_view(), name="hello"),

]

```

Well, this is different. The route we specified is just a blank string. Why does that work? Django assumes that every path we declare begins with a leading slash. We're just specifying routes to resources after the initial domain name. If a route isn't going to a specific resource and is instead just the home page, the route is just `""`, or effectively "no resource."

The `HelloWorld` view is imported from that `views.py` file we just created. In order to do this import, we need to update `settings.py` to include `django_todo` in the list of `INSTALLED_APPS`. Yeah, it's a bit weird. Here's one way to think about it.

`INSTALLED_APPS` refers to the list of directories or packages that Django sees as importable. It's Django's way of treating individual components of a project like installed packages without going through a `setup.py`. We want the `django_todo` directory to be treated like an importable package, so we include that directory in `INSTALLED_APPS`. Now, any module within that directory is also importable. So we get our view.

The `path` function will ONLY take a view function as that second argument, not just a class-based view on its own. Luckily, all valid Django class-based views include this `.as_view()` method. Its job is to roll up all the goodness of the class-based view into a view function and return that view function. So, we never have to worry about making that translation. Instead, we only have to think about the business logic, letting Django and Django REST Framework handle the rest.

Let's crack this open in the browser!

Django comes packaged with its own local development server, accessible through `manage.py`. Let's navigate to the directory containing `manage.py` and type:
```
(django-someHash) $ ./manage.py runserver

Performing system checks...



System check identified no issues (0 silenced).

August 01, 2018 - 16:47:24

Django version 2.0.7, using settings 'django_todo.settings'

Starting development server at http://127.0.0.1:8000/

Quit the server with CONTROL-C.

```

When `runserver` is executed, Django does a check to make sure the project is (more or less) wired together correctly. It's not fool-proof, but it does catch some glaring issues. It also notifies us if our database is out of sync with our code. Undoubtedly ours is because we haven't committed any of our application's stuff to our database, but that's fine for now. Let's visit `http://127.0.0.1:8000` to see the output of the `HelloWorld` view.

Huh. That's not the plaintext data we saw in Pyramid, Flask, and Tornado. When Django REST Framework is used, the HTTP response (when viewed in the browser) is this sort of rendered HTML, showing our actual JSON response in red.

But don't fret! If we do a quick `curl` looking at `http://127.0.0.1:8000` in the command line, we don't get any of that fancy HTML. Just the content.
```
# Note: try this in a different terminal window, outside of the virtual environment above

$ curl http://127.0.0.1:8000

"Hello, world!"

```

Bueno!

Django REST Framework wants us to have a human-friendly interface when using the browser. This makes sense; if JSON is viewed in the browser, it's typically because a human wants to check that it looks right or get a sense of what the JSON response will look like as they design some consumer of an API. It's a lot like what you'd get from a service like [Postman][14].

Either way, we know our view is working! Woo! Let's recap what we've done:

  1. Started the project with `django-admin startproject <project name>`
  2. Updated the `django_todo/settings.py` to use environment variables for `DEBUG`, `SECRET_KEY`, and values in the `DATABASES` dict
  3. Installed `Django REST Framework` and added it to the list of `INSTALLED_APPS`
  4. Created `django_todo/views.py` to include our first view class to say Hello to the World
  5. Updated `django_todo/urls.py` with a path to our new home route
  6. Updated `INSTALLED_APPS` in `django_todo/settings.py` to include the `django_todo` package



### Creating models

Let's create our data models now.

A Django project's entire infrastructure is built around data models. It's written so each data model can have its own little universe with its own views, its own set of URLs that concern its resources, and even its own tests (if we are so inclined).

If we wanted to build a simple Django project, we could circumvent this by just writing our own `models.py` file in the `django_todo` directory and importing it into our views. However, we're trying to write a Django project the "right" way, so we should divide up our models as best we can into their own little packages The Django Way™.

The Django Way involves creating what are called Django "apps." Django "apps" aren't separate applications per se; they don't have their own settings and whatnot (although they can). They can, however, have just about everything else one might think of being in a standalone application:

  * Set of self-contained URLs
  * Set of self-contained HTML templates (if we want to serve HTML)
  * One or more data models
  * Set of self-contained views
  * Set of self-contained tests



They are made to be independent so they can be easily shared like standalone applications. In fact, Django REST Framework is an example of a Django app. It comes packaged with its own views and HTML templates for serving up our JSON. We just leverage that Django app to turn our project into a full-on RESTful API with less hassle.

To create the Django app for our To-Do List items, we'll want to use the `startapp` command with `manage.py`.
```
(django-someHash) $ ./manage.py startapp todo

```

The `startapp` command will succeed silently. We can check that it did what it should've done by using `ls`.
```
(django-someHash) $ ls

Pipfile      Pipfile.lock django_todo  manage.py    todo

```

Look at that: We've got a brand new `todo` directory. Let's look inside!
```
(django-someHash) $ ls todo

__init__.py admin.py    apps.py     migrations  models.py   tests.py    views.py

```

Here are the files that `manage.py startapp` created:

  * `__init__.py` is empty; it exists so this directory can be seen as a valid import path for models, views, etc.
  * `admin.py` is not quite empty; it's used for formatting this app's models in the Django admin, which we're not getting into in this article.
  * `apps.py` … not much work to do here either; it helps with formatting models for the Django admin.
  * `migrations` is a directory that'll contain snapshots of our data models; it's used for updating our database. This is one of the few frameworks that comes with database management built-in, and part of that is allowing us to update our database instead of having to tear it down and rebuild it to change the schema.
  * `models.py` is where the data models live.
  * `tests.py` is where tests would go—if we wrote any.
  * `views.py` is for the views we write that pertain to the models in this app. They don't have to be written here. We could, for example, write all our views in `django_todo/views.py`. It's here, however, so it's easier to separate our concerns. This becomes far more relevant with sprawling applications that cover many conceptual spaces.



What hasn't been created for us is a `urls.py` file for this app. We can make that ourselves.
```
(django-someHash) $ touch todo/urls.py

```

Before moving forward we should do ourselves a favor and add this new Django app to our list of `INSTALLED_APPS` in `django_todo/settings.py`.
```
# in settings.py

INSTALLED_APPS = [

    'django.contrib.admin',

    'django.contrib.auth',

    'django.contrib.contenttypes',

    'django.contrib.sessions',

    'django.contrib.messages',

    'django.contrib.staticfiles',

    'rest_framework',

    'django_todo',

    'todo' # <--- the line was added

]

```

Inspecting `todo/models.py` shows that `manage.py` already wrote a bit of code for us to get started. Diverging from how models were created in the Flask, Tornado, and Pyramid implementations, Django doesn't leverage a third party to manage database sessions or the construction of its object instances. It's all rolled into Django's `django.db.models` submodule.

The way a model is built, however, is more or less the same. To create a model in Django, we'll need to build a `class` that inherits from `models.Model`. All the fields that will apply to instances of that model should appear as class attributes. Instead of importing columns and field types from SQLAlchemy like we have in the past, all of our fields will come directly from `django.db.models`.
```
# todo/models.py

from django.db import models



class Task(models.Model):

    """Tasks for the To Do list."""

    name = models.CharField(max_length=256)

    note = models.TextField(blank=True, null=True)

    creation_date = models.DateTimeField(auto_now_add=True)

    due_date = models.DateTimeField(blank=True, null=True)

    completed = models.BooleanField(default=False)

```

While there are some definite differences between what Django needs and what SQLAlchemy-based systems need, the overall contents and structure are more or less the same. Let's point out the differences.

We no longer need to declare a separate field for an auto-incremented ID number for our object instances. Django builds one for us unless we specify a different field as the primary key.

Instead of instantiating `Column` objects that are passed datatype objects, we just directly reference the datatypes as the columns themselves.

The `Unicode` field became either `models.CharField` or `models.TextField`. `CharField` is for small text fields of a specific maximum length, whereas `TextField` is for any amount of text.

The `TextField` should be able to be blank, and we specify this in TWO ways. `blank=True` says that when an instance of this model is constructed, and the data attached to this field is being validated, it's OK for that data to be empty. This is different from `null=True`, which says when the table for this model class is constructed, the column corresponding to `note` will allow for blank or `NULL` entries. So, to sum that all up, `blank=True` controls how data gets added to model instances while `null=True` controls how the database table holding that data is constructed in the first place.

The `DateTime` field grew some muscle and became able to do some work for us instead of us having to modify the `__init__` method for the class. For the `creation_date` field, we specify `auto_now_add=True`. What this means in a practical sense is that when a new model instance is created Django will automatically record the date and time of now as that field's value. That's handy!

When neither `auto_now_add` nor its close cousin `auto_now` are set to `True`, `DateTimeField` will expect data like any other field. It'll need to be fed with a proper `datetime` object to be valid. The `due_date` column has `blank` and `null` both set to `True` so that an item on the To-Do List can just be an item to be done at some point in the future, with no defined date or time.

`BooleanField` just ends up being a field that can take one of two values: `True` or `False`. Here, the default value is set to be `False`.

#### Managing the database

As mentioned earlier, Django has its own way of doing database management. Instead of having to write… really any code at all regarding our database, we leverage the `manage.py` script that Django provided on construction. It'll manage not just the construction of the tables for our database, but also any updates we wish to make to those tables without necessarily having to blow the whole thing away!

Because we've constructed a new model, we need to make our database aware of it. First, we need to put into code the schema that corresponds to this model. The `makemigrations` command of `manage.py` will take a snapshot of the model class we built and all its fields. It'll take that information and package it into a Python script that'll live in this particular Django app's `migrations` directory. There will never be a reason to run this migration script directly. It'll exist solely so that Django can use it as a basis to update our database table or to inherit information when we update our model class.
```
(django-someHash) $ ./manage.py makemigrations

Migrations for 'todo':

  todo/migrations/0001_initial.py

    - Create model Task

```

This will look at every app listed in `INSTALLED_APPS` and check for models that exist in those apps. It'll then check the corresponding `migrations` directory for migration files and compare them to the models in each of those `INSTALLED_APPS` apps. If a model has been upgraded beyond what the latest migration says should exist, a new migration file will be created that inherits from the most recent one. It'll be automatically named and also be given a message that says what changed since the last migration.

If it's been a while since you last worked on your Django project and can't remember if your models were in sync with your migrations, you have no need to fear. `makemigrations` is an idempotent operation; your `migrations` directory will have only one copy of the current model configuration whether you run `makemigrations` once or 20 times. Even better than that, when we run `./manage.py runserver`, Django will detect that our models are out of sync with our migrations, and it'll just flat out tell us in colored text so we can make the appropriate choice.

This next point is something that trips everybody up at least once: Creating a migration file does not immediately affect our database. When we ran `makemigrations`, we prepared our Django project to define how a given table should be created and end up looking. It's still on us to apply those changes to our database. That's what the `migrate` command is for.
```
(django-someHash) $ ./manage.py migrate

Operations to perform:

  Apply all migrations: admin, auth, contenttypes, sessions, todo

Running migrations:

  Applying contenttypes.0001_initial... OK

  Applying auth.0001_initial... OK

  Applying admin.0001_initial... OK

  Applying admin.0002_logentry_remove_auto_add... OK

  Applying contenttypes.0002_remove_content_type_name... OK

  Applying auth.0002_alter_permission_name_max_length... OK

  Applying auth.0003_alter_user_email_max_length... OK

  Applying auth.0004_alter_user_username_opts... OK

  Applying auth.0005_alter_user_last_login_null... OK

  Applying auth.0006_require_contenttypes_0002... OK

  Applying auth.0007_alter_validators_add_error_messages... OK

  Applying auth.0008_alter_user_username_max_length... OK

  Applying auth.0009_alter_user_last_name_max_length... OK

  Applying sessions.0001_initial... OK

  Applying todo.0001_initial... OK

```

When we apply our migrations, Django first checks to see if the other `INSTALLED_APPS` have migrations to be applied. It checks them in roughly the order they're listed. We want our app to be listed last, because we want to make sure that, in case our model depends on any of Django's built-in models, the database updates we make don't suffer from dependency problems.

We have another model to build: the User model. However, the game has changed a bit since we're using Django. So many applications require some sort of User model that Django's `django.contrib.auth` package built its own for us to use. If it weren't for the authentication token we require for our users, we could just move on and use it instead of reinventing the wheel.

However, we need that token. There are a couple of ways we can handle this.

  * Inherit from Django's `User` object, making our own object that extends it by adding a `token` field
  * Create a new object that exists in a one-to-one relationship with Django's `User` object, whose only purpose is to hold a token



I'm in the habit of building object relationships, so let's go with the second option. Let's call it an `Owner` as it basically has a similar connotation as a `User`, which is what we want.

Out of sheer laziness, we could just include this new `Owner` object in `todo/models.py`, but let's refrain from that. `Owner` doesn't explicitly have to do with the creation or maintenance of items on the task list. Conceptually, the `Owner` is simply the owner of the task. There may even come a time where we want to expand this `Owner` to include other data that has absolutely nothing to do with tasks.

Just to be safe, let's make an `owner` app whose job is to house and handle this `Owner` object.
```
(django-someHash) $ ./manage.py startapp owner

```

Don't forget to add it to the list of `INSTALLED_APPS` in `settings.py`.
```
INSTALLED_APPS = [

    'django.contrib.admin',

    'django.contrib.auth',

    'django.contrib.contenttypes',

    'django.contrib.sessions',

    'django.contrib.messages',

    'django.contrib.staticfiles',

    'rest_framework',

    'django_todo',

    'todo',

    'owner'

]

```

If we look at the root of our Django project, we now have two Django apps:
```
(django-someHash) $ ls

Pipfile      Pipfile.lock django_todo  manage.py    owner        todo

```

In `owner/models.py`, let's build this `Owner` model. As mentioned earlier, it'll have a one-to-one relationship with Django's built-in `User` object. We can enforce this relationship with Django's `models.OneToOneField`
```
# owner/models.py

from django.db import models

from django.contrib.auth.models import User

import secrets



class Owner(models.Model):

    """The object that owns tasks."""

    user = models.OneToOneField(User, on_delete=models.CASCADE)

    token = models.CharField(max_length=256)



    def __init__(self, *args, **kwargs):

        """On construction, set token."""

        self.token = secrets.token_urlsafe(64)

        super().__init__(*args, **kwargs)

```

This says the `Owner` object is linked to the `User` object, with one `owner` instance per `user` instance. `on_delete=models.CASCADE` dictates that if the corresponding `User` gets deleted, the `Owner` instance it's linked to will also get deleted. Let's run `makemigrations` and `migrate` to bake this new model into our database.
```
(django-someHash) $ ./manage.py makemigrations

Migrations for 'owner':

  owner/migrations/0001_initial.py

    - Create model Owner

(django-someHash) $ ./manage.py migrate

Operations to perform:

  Apply all migrations: admin, auth, contenttypes, owner, sessions, todo

Running migrations:

  Applying owner.0001_initial... OK

```

Now our `Owner` needs to own some `Task` objects. It'll be very similar to the `OneToOneField` seen above, except that we'll stick a `ForeignKey` field on the `Task` object pointing to an `Owner`.
```
# todo/models.py

from django.db import models

from owner.models import Owner



class Task(models.Model):

    """Tasks for the To Do list."""

    name = models.CharField(max_length=256)

    note = models.TextField(blank=True, null=True)

    creation_date = models.DateTimeField(auto_now_add=True)

    due_date = models.DateTimeField(blank=True, null=True)

    completed = models.BooleanField(default=False)

    owner = models.ForeignKey(Owner, on_delete=models.CASCADE)

```

Every To-Do List task has exactly one owner who can own multiple tasks. When that owner is deleted, any task they own goes with them.

Let's now run `makemigrations` to take a new snapshot of our data model setup, then `migrate` to apply those changes to our database.
```
(django-someHash) django $ ./manage.py makemigrations

You are trying to add a non-nullable field 'owner' to task without a default; we can't do that (the database needs something to populate existing rows).

Please select a fix:

 1) Provide a one-off default now (will be set on all existing rows with a null value for this column)

 2) Quit, and let me add a default in models.py

```

Oh no! We have a problem! What happened? Well, when we created the `Owner` object and added it as a `ForeignKey` to `Task`, we basically required that every `Task` requires an `Owner`. However, the first migration we made for the `Task` object didn't include that requirement. So, even though there's no data in our database's table, Django is doing a pre-check on our migrations to make sure they're compatible and this new migration we're proposing is not.

There are a few ways to deal with this sort of problem:

  1. Blow away the current migration and build a new one that includes the current model configuration
  2. Add a default value to the `owner` field on the `Task` object
  3. Allow tasks to have `NULL` values for the `owner` field.



Option 2 wouldn't make much sense here; we'd be proposing that any `Task` that was created would, by default, be linked to some default owner despite none necessarily existing.

Option 1 would require us to destroy and rebuild our migrations. We should leave those alone.

Let's go with option 3. In this circumstance, it won't be the end of the world if we allow the `Task` table to have null values for the owners; any tasks created from this point forward will necessarily have an owner. If you're in a situation where that isn't an acceptable schema for your database table, blow away your migrations, drop the table, and rebuild the migrations.
```
# todo/models.py

from django.db import models

from owner.models import Owner



class Task(models.Model):

    """Tasks for the To Do list."""

    name = models.CharField(max_length=256)

    note = models.TextField(blank=True, null=True)

    creation_date = models.DateTimeField(auto_now_add=True)

    due_date = models.DateTimeField(blank=True, null=True)

    completed = models.BooleanField(default=False)

    owner = models.ForeignKey(Owner, on_delete=models.CASCADE, null=True)

(django-someHash) $ ./manage.py makemigrations

Migrations for 'todo':

  todo/migrations/0002_task_owner.py

    - Add field owner to task

(django-someHash) $ ./manage.py migrate

Operations to perform:

  Apply all migrations: admin, auth, contenttypes, owner, sessions, todo

Running migrations:

  Applying todo.0002_task_owner... OK

```

Woo! We have our models! Welcome to the Django way of declaring objects.

For good measure, let's ensure that whenever a `User` is made, it's automatically linked with a new `Owner` object. We can do this using Django's `signals` system. Basically, we say exactly what we intend: "When we get the signal that a new `User` has been constructed, construct a new `Owner` and set that new `User` as that `Owner`'s `user` field." In practice that looks like:
```
# owner/models.py

from django.contrib.auth.models import User

from django.db import models

from django.db.models.signals import post_save

from django.dispatch import receiver



import secrets





class Owner(models.Model):

    """The object that owns tasks."""

    user = models.OneToOneField(User, on_delete=models.CASCADE)

    token = models.CharField(max_length=256)



    def __init__(self, *args, **kwargs):

        """On construction, set token."""

        self.token = secrets.token_urlsafe(64)

        super().__init__(*args, **kwargs)





@receiver(post_save, sender=User)

def link_user_to_owner(sender, **kwargs):

    """If a new User is saved, create a corresponding Owner."""

    if kwargs['created']:

        owner = Owner(user=kwargs['instance'])

        owner.save()

```

We set up a function that listens for signals to be sent from the `User` object built into Django. It's waiting for just after a `User` object has been saved. This can come from either a new `User` or an update to an existing `User`; we discern between the two scenarios within the listening function.

If the thing sending the signal was a newly created instance, `kwargs['created']` will have the value of `True`. We only want to do something if this is `True`. If it's a new instance, we create a new `Owner`, setting its `user` field to be the new `User` instance that was created. After that, we `save()` the new `Owner`. This will commit our change to the database if all is well. It'll fail if the data doesn't validate against the fields we declared.

Now let's talk about how we're going to access the data.

### Accessing model data

In the Flask, Pyramid, and Tornado frameworks, we accessed model data by running queries against some database session. Maybe it was attached to a `request` object, maybe it was a standalone `session` object. Regardless, we had to establish a live connection to the database and query on that connection.

This isn't the way Django works. Django, by default, doesn't leverage any third-party object-relational mapping (ORM) to converse with the database. Instead, Django allows the model classes to maintain their own conversations with the database.

Every model class that inherits from `django.db.models.Model` will have attached to it an `objects` object. This will take the place of the `session` or `dbsession` we've become so familiar with. Let's open the special shell that Django gives us and investigate how this `objects` object works.
```
(django-someHash) $ ./manage.py shell

Python 3.7.0 (default, Jun 29 2018, 20:13:13)

[Clang 9.1.0 (clang-902.0.39.2)] on darwin

Type "help", "copyright", "credits" or "license" for more information.

(InteractiveConsole)

>>>

```

The Django shell is different from a normal Python shell in that it's aware of the Django project we've been building and can do easy imports of our models, views, settings, etc. without having to worry about installing a package. We can access our models with a simple `import`.
```
>>> from owner.models import Owner

>>> Owner

<class 'owner.models.Owner'>

```

Currently, we have no `Owner` instances. We can tell by querying for them with `Owner.objects.all()`.
```
>>> Owner.objects.all()

<QuerySet []>

```

Anytime we run a query method on the `<Model>.objects` object, we'll get a `QuerySet` back. For our purposes, it's effectively a `list`, and this `list` is showing us that it's empty. Let's make an `Owner` by making a `User`.
```
>>> from django.contrib.auth.models import User

>>> new_user = User(username='kenyattamurphy', email='kenyatta.murphy@gmail.com')

>>> new_user.set_password('wakandaforever')

>>> new_user.save()

```

If we query for all of our `Owner`s now, we should find Kenyatta.
```
>>> Owner.objects.all()

<QuerySet [<Owner: Owner object (1)>]>

```

Yay! We've got data!

### Serializing models

We'll be passing data back and forth beyond just "Hello World." As such, we'll want to see some sort of JSON-ified output that represents that data well. Taking that object's data and transforming it into a JSON object for submission across HTTP is a version of data serialization. In serializing data, we're taking the data we currently have and reformatting it to fit some standard, more-easily-digestible form.

If I were doing this with Flask, Pyramid, and Tornado, I'd create a new method on each model to give the user direct access to call `to_json()`. The only job of `to_json()` would be to return a JSON-serializable (i.e. numbers, strings, lists, dicts) dictionary with whatever fields I want to be displayed for the object in question.

It'd probably look something like this for the `Task` object:
```
class Task(Base):

    ...all the fields...



    def to_json(self):

        """Convert task attributes to a JSON-serializable dict."""

        return {

            'id': self.id,

            'name': self.name,

            'note': self.note,

            'creation_date': self.creation_date.strftime('%m/%d/%Y %H:%M:%S'),

            'due_date': self.due_date.strftime('%m/%d/%Y %H:%M:%S'),

            'completed': self.completed,

            'user': self.user_id

        }

```

It's not fancy, but it does the job.

Django REST Framework, however, provides us with an object that'll not only do that for us but also validate inputs when we want to create new object instances or update existing ones. It's called the [ModelSerializer][15].

Django REST Framework's `ModelSerializer` is effectively documentation for our models. They don't have lives of their own if there are no models attached (for that there's the [Serializer][16] class). Their main job is to accurately represent our model and make the conversion to JSON thoughtless when our model's data needs to be serialized and sent over a wire.

Django REST Framework's `ModelSerializer` works best for simple objects. As an example, imagine that we didn't have that `ForeignKey` on the `Task` object. We could create a serializer for our `Task` that would convert its field values to JSON as necessary with the following declaration:
```
# todo/serializers.py

from rest_framework import serializers

from todo.models import Task



class TaskSerializer(serializers.ModelSerializer):

    """Serializer for the Task model."""



    class Meta:

        model = Task

        fields = ('id', 'name', 'note', 'creation_date', 'due_date', 'completed')

```

Inside our new `TaskSerializer`, we create a `Meta` class. `Meta`'s job here is just to hold information (or metadata) about the thing we're attempting to serialize. Then, we note the specific fields that we want to show. If we wanted to show all the fields, we could just shortcut the process and use `'__all__'`. We could, alternatively, use the `exclude` keyword instead of `fields` to tell Django REST Framework that we want every field except for a select few. We can have as many serializers as we like, so maybe we want one for a small subset of fields and one for all the fields? Go wild here.

In our case, there is a relation between each `Task` and its owner `Owner` that must be reflected here. As such, we need to borrow the `serializers.PrimaryKeyRelatedField` object to specify that each `Task` will have an `Owner` and that relationship is one-to-one. Its owner will be found from the set of all owners that exists. We get that set by doing a query for those owners and returning the results we want to be associated with this serializer: `Owner.objects.all()`. We also need to include `owner` in the list of fields, as we always need an `Owner` associated with a `Task`
```
# todo/serializers.py

from rest_framework import serializers

from todo.models import Task

from owner.models import Owner



class TaskSerializer(serializers.ModelSerializer):

    """Serializer for the Task model."""

    owner = serializers.PrimaryKeyRelatedField(queryset=Owner.objects.all())



    class Meta:

        model = Task

        fields = ('id', 'name', 'note', 'creation_date', 'due_date', 'completed', 'owner')

```

Now that this serializer is built, we can use it for all the CRUD operations we'd like to do for our objects:

  * If we want to `GET` a JSONified version of a specific `Task`, we can do `TaskSerializer(some_task).data`
  * If we want to accept a `POST` with the appropriate data to create a new `Task`, we can use `TaskSerializer(data=new_data).save()`
  * If we want to update some existing data with a `PUT`, we can say `TaskSerializer(existing_task, data=data).save()`



We're not including `delete` because we don't really need to do anything with information for a `delete` operation. If you have access to an object you want to delete, just say `object_instance.delete()`.

Here is an example of what some serialized data might look like:
```
>>> from todo.models import Task

>>> from todo.serializers import TaskSerializer

>>> from owner.models import Owner

>>> from django.contrib.auth.models import User

>>> new_user = User(username='kenyatta', email='kenyatta@gmail.com')

>>> new_user.save_password('wakandaforever')

>>> new_user.save() # creating the User that builds the Owner

>>> kenyatta = Owner.objects.first() # grabbing the Owner that is kenyatta

>>> new_task = Task(name="Buy roast beef for the Sunday potluck", owner=kenyatta)

>>> new_task.save()

>>> TaskSerializer(new_task).data

{'id': 1, 'name': 'Go to the supermarket', 'note': None, 'creation_date': '2018-07-31T06:00:25.165013Z', 'due_date': None, 'completed': False, 'owner': 1}

```

There's a lot more you can do with the `ModelSerializer` objects, and I suggest checking [the docs][17] for those greater capabilities. Otherwise, this is as much as we need. It's time to dig into some views.

### Views for reals

We've built the models and the serializers, and now we need to set up the views and URLs for our application. After all, we can't do anything with an application that has no views. We've already seen an example with the `HelloWorld` view above. However, that's always a contrived, proof-of-concept example and doesn't really show what can be done with Django REST Framework's views. Let's clear out the `HelloWorld` view and URL so we can start fresh with our views.

The first view we'll build is the `InfoView`. As in the previous frameworks, we just want to package and send out a dictionary of our proposed routes. The view itself can live in `django_todo.views` since it doesn't pertain to a specific model (and thus doesn't conceptually belong in a specific app).
```
# django_todo/views.py

from rest_framework.response import JsonResponse

from rest_framework.views import APIView



class InfoView(APIView):

    """List of routes for this API."""

    def get(self, request):

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

        return JsonResponse(output)

```

This is pretty much identical to what we had in Tornado. Let's hook it up to an appropriate route and be on our way. For good measure, we'll also remove the `admin/` route, as we won't be using the Django administrative backend here.
```
# in django_todo/urls.py

from django_todo.views import InfoView

from django.urls import path



urlpatterns = [

    path('api/v1', InfoView.as_view(), name="info"),

]

```

#### Connecting models to views

Let's figure out the next URL, which will be the endpoint for either creating a new `Task` or listing a user's existing tasks. This should exist in a `urls.py` in the `todo` app since this has to deal specifically with `Task` objects instead of being a part of the whole project.
```
# in todo/urls.py

from django.urls import path

from todo.views import TaskListView



urlpatterns = [

    path('', TaskListView.as_view(), name="list_tasks")

]

```

What's the deal with this route? We didn't specify a particular user or much of a path at all. Since there would be a couple of routes requiring the base path `/api/v1/accounts/<username>/tasks`, why write it again and again when we can just write it once?

Django allows us to take a whole suite of URLs and import them into the base `django_todo/urls.py` file. We can then give every one of those imported URLs the same base path, only worrying about the variable parts when, you know, they vary.
```
# in django_todo/urls.py

from django.urls import include, path

from django_todo.views import InfoView



urlpatterns = [

    path('api/v1', InfoView.as_view(), name="info"),

    path('api/v1/accounts/<str:username>/tasks', include('todo.urls'))

]

```

And now every URL coming from `todo/urls.py` will be prefixed with the path `api/v1/accounts/<str:username>/tasks`.

Let's build out the view in `todo/views.py`
```
# todo/views.py

from django.shortcuts import get_object_or_404

from rest_framework.response import JsonResponse

from rest_framework.views import APIView



from owner.models import Owner

from todo.models import Task

from todo.serializers import TaskSerializer





class TaskListView(APIView):

    def get(self, request, username, format=None):

        """Get all of the tasks for a given user."""

        owner = get_object_or_404(Owner, user__username=username)

        tasks = Task.objects.filter(owner=owner).all()

        serialized = TaskSerializer(tasks, many=True)

        return JsonResponse({

            'username': username,

            'tasks': serialized.data

        })

```

There's a lot going on here in a little bit of code, so let's walk through it.

We start out with the same inheritance of the `APIView` that we've been using, laying the groundwork for what will be our view. We override the same `get` method we've overridden before, adding a parameter that allows our view to receive the `username` from the incoming request.

Our `get` method will then use that `username` to grab the `Owner` associated with that user. This `get_object_or_404` function allows us to do just that, with a little something special added for ease of use.

It would make sense that there's no point in looking for tasks if the specified user can't be found. In fact, we'd want to return a 404 error. `get_object_or_404` gets a single object based on whatever criteria we pass in and either returns that object or raises an [Http404 exception][18]. We can set that criteria based on attributes of the object. The `Owner` objects are all attached to a `User` through their `user` attribute. We don't have a `User` object to search with, though. We only have a `username`. So, we say to `get_object_or_404` "when you look for an `Owner`, check to see that the `User` attached to it has the `username` that I want" by specifying `user__username`. That's TWO underscores. When filtering through a QuerySet, the two underscores mean "attribute of this nested object." Those attributes can be as deeply nested as needed.

We now have the `Owner` corresponding to the given username. We use that `Owner` to filter through all the tasks, only retrieving the ones it owns with `Task.objects.filter`. We could've used the same nested-attribute pattern that we did with `get_object_or_404` to drill into the `User` connected to the `Owner` connected to the `Tasks` (`tasks = Task.objects.filter(owner__user__username=username).all()`) but there's no need to get that wild with it.

`Task.objects.filter(owner=owner).all()` will provide us with a `QuerySet` of all the `Task` objects that match our query. Great. The `TaskSerializer` will then take that `QuerySet` and all its data, along with the flag of `many=True` to notify it as being a collection of items instead of just one item, and return a serialized set of results. Effectively a list of dictionaries. Finally, we provide the outgoing response with the JSON-serialized data and the username used for the query.

#### Handling the POST request

The `post` method will look somewhat different from what we've seen before.
```
# still in todo/views.py

# ...other imports...

from rest_framework.parsers import JSONParser

from datetime import datetime



class TaskListView(APIView):

    def get(self, request, username, format=None):

        ...



    def post(self, request, username, format=None):

        """Create a new Task."""

        owner = get_object_or_404(Owner, user__username=username)

        data = JSONParser().parse(request)

        data['owner'] = owner.id

        if data['due_date']:

            data['due_date'] = datetime.strptime(data['due_date'], '%d/%m/%Y %H:%M:%S')



        new_task = TaskSerializer(data=data)

        if new_task.is_valid():

            new_task.save()

            return JsonResponse({'msg': 'posted'}, status=201)



        return JsonResponse(new_task.errors, status=400)

```

When we receive data from the client, we parse it into a dictionary using `JSONParser().parse(request)`. We add the owner to the data and format the `due_date` for the task if one exists.

Our `TaskSerializer` does the heavy lifting. It first takes in the incoming data and translates it into the fields we specified on the model. It then validates that data to make sure it fits the specified fields. If the data being attached to the new `Task` is valid, it constructs a new `Task` object with that data and commits it to the database. We then send back an appropriate "Yay! We made a new thing!" response. If not, we collect the errors that `TaskSerializer` generated and send those back to the client with a `400 Bad Request` status code.

If we were to build out the `put` view for updating a `Task`, it would look very similar to this. The main difference would be that when we instantiate the `TaskSerializer`, instead of just passing in the new data, we'd pass in the old object and the new data for that object like `TaskSerializer(existing_task, data=data)`. We'd still do the validity check and send back the responses we want to send back.

### Wrapping up

Django as a framework is highly customizable, and everyone has their own way of stitching together a Django project. The way I've written it out here isn't necessarily the exact way that a Django project needs to be set up; it's just a) what I'm familiar with, and b) what leverages Django's management system. Django projects grow in complexity as you separate concepts into their own little silos. You do that so it's easier for multiple people to contribute to the overall project without stepping on each other's toes.

The vast map of files that is a Django project, however, doesn't make it more performant or naturally predisposed to a microservice architecture. On the contrary, it can very easily become a confusing monolith. That may still be useful for your project. It may also make it harder for your project to be manageable, especially as it grows.

Consider your options carefully and use the right tool for the right job. For a simple project like this, Django likely isn't the right tool.

Django is meant to handle multiple sets of models that cover a variety of different project areas that may share some common ground. This project is a small, two-model project with a handful of routes. If we were to build this out more, we'd only have seven routes and still the same two models. It's hardly enough to justify a full Django project.

It would be a great option if we expected this project to expand. This is not one of those projects. This is choosing a flamethrower to light a candle. It's absolute overkill.

Still, a web framework is a web framework, regardless of which one you use for your project. It can take in requests and respond as well as any other, so you do as you wish. Just be aware of what overhead comes with your choice of framework.

That's it! We've reached the end of this series! I hope it has been an enlightening adventure and will help you make more than just the most-familiar choice when you're thinking about how to build out your next project. Make sure to read the documentation for each framework to expand on anything covered in this series (as it's not even the least bit comprehensive). There's a wide world of stuff to get into for each. Happy coding!

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/django-framework

作者：[Nicholas Hunt-Walker][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/nhuntwalker
[1]:https://opensource.com/article/18/5/pyramid-framework
[2]:https://opensource.com/article/18/4/flask
[3]:https://opensource.com/article/18/6/tornado-framework
[4]:https://www.djangoproject.com
[5]:https://djangopackages.org/
[6]:http://www.django-rest-framework.org/
[7]:http://gunicorn.org/
[8]:https://docs.pylonsproject.org/projects/waitress/en/latest/
[9]:https://uwsgi-docs.readthedocs.io/en/latest/
[10]:https://docs.djangoproject.com/en/2.0/ref/settings/#databases
[11]:https://pypi.org/project/dj-database-url/
[12]:http://yellerapp.com/posts/2015-01-12-the-worst-server-setup-you-can-make.html
[13]:https://docs.djangoproject.com/en/2.0/ref/settings/#std:setting-DATABASE-ENGINE
[14]:https://www.getpostman.com/
[15]:http://www.django-rest-framework.org/api-guide/serializers/#modelserializer
[16]:http://www.django-rest-framework.org/api-guide/serializers/
[17]:http://www.django-rest-framework.org/api-guide/serializers/#serializers
[18]:https://docs.djangoproject.com/en/2.0/topics/http/views/#the-http404-exception
