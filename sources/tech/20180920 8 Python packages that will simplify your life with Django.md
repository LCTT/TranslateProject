belitex 翻译中
8 Python packages that will simplify your life with Django
======

This month's Python column looks at Django packages that will benefit your work, personal, or side projects.

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/water-stone-balance-eight-8.png?itok=1aht_V5V)

Django developers, we're devoting this month's Python column to packages that will help you. These are our favorite [Django][1] libraries for saving time, cutting down on boilerplate code, and generally simplifying our lives. We've got six packages for Django apps and two for Django's REST Framework, and we're not kidding when we say these packages show up in almost every project we work on.

But first, see our tips for making the [Django Admin more secure][2] and an article on 5 favorite [open source Django packages][3].

### A kitchen sink of useful time-savers: django-extensions

[Django-extensions][4] is a favorite Django package chock full of helpful tools like these management commands:

  * **shell_plus** starts the Django shell with all your database models already loaded. No more importing from several different apps to test one complex relationship!
  * **clean_pyc** removes all .pyc projects from everywhere inside your project directory.
  * **create_template_tags** creates a template tag directory structure inside the app you specify.
  * **describe_form** displays a form definition for a model, which you can then copy/paste into forms.py. (Note that this produces a regular Django form, not a ModelForm.)
  * **notes** displays all comments with stuff like TODO, FIXME, etc. throughout your project.


  * **TimeStampedModel** : This base class includes the fields **created** and **modified** and a **save()** method that automatically updates these fields appropriately.
  * **ActivatorModel** : If your model will need fields like **status** , **activate_date** , and **deactivate_date** , use this base class. It comes with a manager that enables **.active()** and **.inactive()** querysets.
  * **TitleDescriptionModel** and **TitleSlugDescriptionModel** : These include the **title** and **description** fields, and the latter also includes a **slug** field. The **slug** field will automatically populate based on the **title** field.



Django-extensions also includes useful abstract base classes to use for common patterns in your own models. Inherit from these base classes when you create your models to get their:

Django-extensions has more features you may find useful in your projects, so take a tour through its [docs][5]!

### 12-factor-app settings: django-environ

[Django-environ][6] allows you to use [12-factor app][7] methodology to manage your settings in your Django project. It collects other libraries, including [envparse][8] and [honcho][9]. Once you install django-environ, create an .env file at your project's root. Define in that module any settings variables that may change between environments or should remain secret (like API keys, debug status, and database URLs).

Then, in your project's settings.py file, import **environ** and set up variables for **environ.PATH()** and **environ.Env()** according to the [example][10]. Access settings variables defined in your .env file with **env('VARIABLE_NAME')**.

### Creating great management commands: django-click

[Django-click][11], based on [Click][12] (which we have recommended [before][13]… [twice][14]), helps you write Django management commands. This library doesn't have extensive documentation, but it does have a directory of [test commands][15] in its repository that are pretty useful. A basic Hello World command would look like this:

```
# app_name.management.commands.hello.py
import djclick as click

@click.command()
@click.argument('name')
def command(name):
    click.secho(f'Hello, {name}')
```

Then in the command line, run:

```
>> ./manage.py hello Lacey
Hello, Lacey
```

### Handling finite state machines: django-fsm

[Django-fsm][16] adds support for finite state machines to your Django models. If you run a news website and need articles to process through states like Writing, Editing, and Published, django-fsm can help you define those states and manage the rules and restrictions around moving from one state to another.

Django-fsm provides an FSMField to use for the model attribute that defines the model instance's state. Then you can use django-fsm's **@transition** decorator to define methods that move the model instance from one state to another and handle any side effects from that transition.

Although django-fsm is light on documentation, [Workflows (States) in Django][17] is a gist that serves as an excellent introduction to both finite state machines and django-fsm.

### Contact forms: #django-contact-form

A contact form is such a standard thing on a website. But don't write all that boilerplate code yourself—set yours up in minutes with [django-contact-form][18]. It comes with an optional spam-filtering contact form class (and a regular, non-filtering class) and a **ContactFormView** base class with methods you can override or customize, and it walks you through the templates you will need to create to make your form work.

### Registering and authenticating users: django-allauth

[Django-allauth][19] is an app that provides views, forms, and URLs for registering users, logging them in and out, resetting their passwords, and authenticating users with outside sites like GitHub or Twitter. It supports email-as-username authentication and is extensively documented. It can be a little confusing to set up the first time you use it; follow the [installation instructions][20] carefully and read closely when you [customize your settings][21] to make sure you're using all the settings you need to enable a specific feature.

### Handling user authentication with Django REST Framework: django-rest-auth

If your Django development includes writing APIs, you're probably using [Django REST Framework][22] (DRF). If you're using DRF, you should check out [django-rest-auth][23], a package that enables endpoints for user registration, login/logout, password reset, and social media authentication (by adding django-allauth, which works well with django-rest-auth).

### Visualizing a Django REST Framework API: django-rest-swagger

[Django REST Swagger][24] provides a feature-rich user interface for interacting with your Django REST Framework API. Once you've installed Django REST Swagger and added it to installed apps, add the Swagger view and URL pattern to your urls.py file; the rest is taken care of in the docstrings of your APIs.

![](https://opensource.com/sites/default/files/uploads/swagger-ui.png)

The UI for your API will include all your endpoints and available methods broken out by app. It will also list available operations for those endpoints and enable you to interact with the API (adding/deleting/fetching records, for example). It uses the docstrings in your API views to generate documentation for each endpoint, creating a set of API documentation for your project that's useful to you, your frontend developers, and your users.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/9/django-packages

作者：[Jeff Triplett][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/laceynwilliams
[1]: https://www.djangoproject.com/
[2]: https://opensource.com/article/18/1/10-tips-making-django-admin-more-secure
[3]: https://opensource.com/business/15/12/5-favorite-open-source-django-packages
[4]: https://django-extensions.readthedocs.io/en/latest/
[5]: https://django-extensions.readthedocs.io/
[6]: https://django-environ.readthedocs.io/en/latest/
[7]: https://www.12factor.net/
[8]: https://github.com/rconradharris/envparse
[9]: https://github.com/nickstenning/honcho
[10]: https://django-environ.readthedocs.io/
[11]: https://github.com/GaretJax/django-click
[12]: http://click.pocoo.org/5/
[13]: https://opensource.com/article/18/9/python-libraries-side-projects
[14]: https://opensource.com/article/18/5/3-python-command-line-tools
[15]: https://github.com/GaretJax/django-click/tree/master/djclick/test/testprj/testapp/management/commands
[16]: https://github.com/viewflow/django-fsm
[17]: https://gist.github.com/Nagyman/9502133
[18]: https://django-contact-form.readthedocs.io/en/1.5/
[19]: https://django-allauth.readthedocs.io/en/latest/
[20]: https://django-allauth.readthedocs.io/en/latest/installation.html
[21]: https://django-allauth.readthedocs.io/en/latest/configuration.html
[22]: http://www.django-rest-framework.org/
[23]: https://django-rest-auth.readthedocs.io/
[24]: https://django-rest-swagger.readthedocs.io/en/latest/
