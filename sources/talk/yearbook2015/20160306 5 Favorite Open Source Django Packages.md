StdioA Translated

5 favorite open source Django packages
================================================================================
![Yearbook cover 2015](https://opensource.com/sites/default/files/styles/image-full-size/public/u23316/osdc-open-source-yearbook-lead8.png?itok=0_5-hdFE)

Image source: Opensource.com

_Jacob Kaplan-Moss and Frank Wiles also contributed to this article._

Django is built around the concept of [reusable apps][1]: self-contained packages that provide re-usable features. You can build your site by composing these reusable apps, together with your own site-specific code. There's a rich and varied ecosystem of reusable apps available for your use — PyPI lists more than [8,000 Django apps][2] — but how do you know which ones are best?

To help focus your app search, we've put together this list of our five favorites. They are:
* [Cookiecutter][3]: the best way to start a new Django site.
* [Whitenoise][4]: the best static asset server.
* [Django Rest Framework][5]: the best way to write REST APIs with Django.
* [Wagtail][6]: the best Django-based content-management system.
* [django-allauth][7]: the best way to provide "social login" (e.g., Twitter, Facebook, GitHub, etc).

We also recommend you check out [Django Packages][8], a directory of reusable Django apps. Django Packages organizes Django apps into "grids" that allow you to compare similar packages and chose between them. You can see which features are offered by each package, as well as usage statistics. (For example: here's the [grid for REST tools][9], which might help you understand why we recommend Django REST Framework.)

## Why you should trust us?

We've been using Django for longer than almost anyone. Two of us (Frank and Jacob) worked at the [Lawrence Journal-World][10] (birthplace of Django) before Django was released (and in fact helped make the open source release happen). We've all spent the past eight years running a consultancy that advises companies on how best to use Django.

So, we've seen the entire history of the Django project and community, and we've seen popular packages come and go. Between the three of us, we've probably tried at least half of these 8,000 apps personally, or we know someone who has. We have a strong understanding of what makes an app solid and reliable, and we have a good understanding of what gives these things staying power.

## Best way to start a new Django site: [Cookiecutter][3]

Starting off a new project or app is always a bit of a pain. You can use Django's built in `startproject` but if you're like us, you're particular in how you do things. Cookiecutter solves this by giving you a quick and easy way to define project or app templates that can be easily reused. A quick example, just `pip install cookiecutter` and then run this from the command line:

```bash
$ cookiecutter <a href="https://github.com/marcofucci/cookiecutter-simple-django">https://github.com/marcofucci/cookiecutter-simple-django</a>
```

You'll immediately start getting prompted for quick answers, such as the name of your project, repo, author name, email, and a few other bits of configuration. These are used to help fill out the project details. We picked the ever so original '_foo_' to be our repo name. So cookiecutter created a simple Django project in the subdirectory '_foo_'.

If you poke around in the '_foo_' project a bit, you'll see the other bits of configuration you were prompted for have been templated into the files themselves along with sub-directories as necessary. This "template" is all defined at the GitHub repo URL we used as the only argument when we called `cookiecutter`. This example used a remote GitHub repo as the template; however, note that you can use local file system directories as well, which is perfect for non-reusable scenarios.

We mention cookiecutter as a great Django package, but honestly it's useful for plain Python or even non-Python-related purposes. Being able to lay things out exactly as you like in an easily repeatable way makes cookiecutter a great tool for keeping your workflow DRY.

## Best static asset server: [Whitenoise][4]

For many years, serving your site's static assets—images, JavaScript, CSS—was a pain. The built-in [django.views.static.serve][11] view is, as the documentation states, "not hardened for production use and should be used only as a development aid." But serving media from a "real" web server, such as NGINX or out of a CDN, can be difficult to set up.

Whitenoise cleanly solves this problem. It's as easy to set up as the development-only static server, and is hardened and optimized for production. Setup is simple:

1. Make sure you're using Django's [contrib.staticfiles][12] app, and that you've correctly set `STATIC_ROOT` in your settings file.
2. Enable Whitenoise in your `wsgi.py` file:

```python
from django.core.wsgi import get_wsgi_application
from whitenoise.django import DjangoWhiteNoise

application = get_wsgi_application()
application = DjangoWhiteNoise(application)
```

That's really all it takes! For large applications, you'll likely want to use a dedicated media server and/or a CDN, but for most small- or medium-sized Django sites, Whitenoise is more than powerful enough.

For more information on Whitenoise, [check out the documentation][13].

Best Tool for REST APIs: [Django REST Framework][5]

REST APIs are quickly becoming a standard feature of modern web applications. An API is really simply talking in JSON rather than HTML, and of course you can do this with just Django. You can craft your own views that set the proper content types and return data in JSON rather than templated HTML responses. This is exactly what many people did before API frameworks such as [Django Rest Framework][14] (a.k.a., DRF) were released.

Building a REST API with DRF is similar to working with Django's Class Based Views if you're familiar with them, except these are specifically designed and targeted around an API use case. Quite a bit of code is involved in your average API setup, so instead of a code sample to get you excited, we'll highlight some of DRF's features that make your life easier:

* Automatic browseable API which makes development and manual testing a breeze. Click around in the DRF [demo example][15]. You can view API responses and support POST/PUT/DELETE type operations without having to do anything yourself.
* Easy integration of authentication styles, such as OAuth, Basic Auth, or API Tokens.
  Simple permission system for fine-grained control of which users can use which API endpoints and/or actions.
* Built in rate limiting.
* Nearly automatic API documentation when combined with [django-rest-swagger][16].
* Extensive ecosystem of third-party libraries.

Although you could certainly build an API without DRF, we can't fathom a reason why you would start off down that path. Even if you don't use all of DRF's features, building up your own API views from their solid base view classes is a huge win in terms of safety, consistency of your API, and development velocity. If you aren't using DRF already, you should set aside some time to check it out.

## Best Django-based CMS: [Wagtail][6]

Wagtail is the current darling of the Django CMS world and with good reason. Like most CMS systems, it gives you flexibility to define different types of pages and their content via simple Django models. This takes you from zero to a basically working system in hours, not days. To give you a quick example, to define a Staff page type for people at your company can be as simple as:

```python
from wagtail.wagtailcore.models import Page
from wagtail.wagtailcore.fields import RichTextField
from wagtail.wagtailadmin.edit_handlers import FieldPanel, MultiFieldPanel
from wagtail.wagtailimages.edit_handlers import ImageChooserPanel 

class StaffPage(Page):
    name = models.CharField(max_length=100)
    hire_date = models.DateField()
    bio = models.RichTextField()
    email = models.EmailField()
    headshot = models.ForeignKey('wagtailimages.Image', null=True, blank=True) 
    content_panels = Page.content_panels + [
                                FieldPanel('name'),
                                FieldPanel('hire_date'),
                                FieldPanel('email'),
                                FieldPanel('bio', classname="full"),
                                ImageChoosePanel('headshot'),
                                ] 

```

The real appeal of Wagtail, however, is in its easy-to-use modern admin interface and flexibility. You can control which types of pages are allowed in different areas of the site, add additional complex logic to your pages, and get standard moderation/approval workflows right out of the box. With most CMS systems, at some point you run into a wall you can work around. With Wagtail, we have yet to find a wall we couldn't easy find a door through to make it do exactly what we want in an easy and maintainable way. If you're interested, we wrote up a [deeper dive into Wagtail][17].

## Best Social Login Tool: [django-allauth][7]

django-allauth is a reusable Django application that solves your registration and authentication needs. Whether you need a local or social registration system, django-allauth has you covered.

The project supports multiple authentication schemes, such as user name or email address. Once a user has signed up, multiple strategies are supported for account verification ranging from none to email verification. Multiple social and email accounts are also supported. Pluggable signup forms are also supports which allows asking additional questions during registration.

django-allauth supports more than 20 authentication providers, including Facebook, GitHub, Google, and Twitter. If you have an account on a social website that's not supported, then it's most supported through a third-party add-on. The project supports writing custom backends, which allows custom authentication systems to work, too. This is nice for anyone with custom authentication needs.

django-allauth is easy to setup and has [extensive documentation][18]. The project is also well tested so you know that everything actually works.

Do you have a favorite Django package? Let us know about it in the comments.

## About the author

![Photo][]

Jeff Triplett

Lawrence, KS  
<http://www.jefftriplett.com/>

I moved to Lawrence, KS in 2007 to work at the Lawrence Journal-World where Django was invented. I now work at [Revolution Systems (Revsys)][19] in Lawrence, KS as a developer and a consultant.

I am a co-founder of the [Django Events Foundation North America (DEFNA)][20], Conference Chair for [DjangoCon US][21] 2015 and 2016, and I co-organized [Django Birthday][22] to celebrate the 10 year birthday of Django in its birthplace in Lawrence.

I am a member of a local trail running group, I love basketball, and I love dreaming about traveling in an airstream across America.

--------------------------------------------------------------------------------

via: https://opensource.com/business/15/12/5-favorite-open-source-django-packages

作者：[Jeff Triplett][a]
译者：[StdioA](https://github.com/StdioA)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出


[a]:https://opensource.com/users/jefftriplett
[1]:https://docs.djangoproject.com/en/1.8/intro/reusable-apps/
[2]:https://pypi.python.org/pypi?:action=browse&c=523
[3]:https://github.com/audreyr/cookiecutter
[4]:http://whitenoise.evans.io/en/latest/base.html
[5]:http://www.django-rest-framework.org/
[6]:https://wagtail.io/
[7]:http://www.intenct.nl/projects/django-allauth/
[8]:https://www.djangopackages.com/
[9]:https://www.djangopackages.com/grids/g/rest/
[10]:http://www2.ljworld.com/news/2015/jul/09/happy-birthday-django/
[11]:https://docs.djangoproject.com/en/1.8/ref/views/#django.views.static.serve
[12]:https://docs.djangoproject.com/en/1.8/ref/contrib/staticfiles/
[13]:http://whitenoise.evans.io/en/latest/index.html
[14]:http://www.django-rest-framework.org/
[15]:http://restframework.herokuapp.com/
[16]:http://django-rest-swagger.readthedocs.org/en/latest/index.html
[17]:https://opensource.com/business/15/5/wagtail-cms
[18]:http://django-allauth.readthedocs.org/en/latest/
[19]:http://www.revsys.com/
[20]:http://defna.org/
[21]:https://2015.djangocon.us/
[22]:https://djangobirthday.com/
