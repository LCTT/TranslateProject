ucasFL translating

8 great Python libraries for side projects
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/python-programming-code-keyboard.png?itok=fxiSpmnd)

We have a saying in the Python/Django world: We came for the language and stayed for the community. That is true for most of us, but something else that has kept us in the Python world is how easy it is to have an idea and quickly work through it over lunch or in a few hours at night.

This month we're diving into Python libraries we love to use to quickly scratch those side-project or lunchtime itches.

### To save data in a database on the fly: Dataset

[Dataset][1] is our go-to library when we quickly want to collect data and save it into a database before we know what our final database tables will look like. Dataset has a simple, yet powerful API that makes it easy to put data in and sort it out later.

Dataset is built on top of SQLAlchemy, so extending it will feel familiar. The underlying database models are a breeze to import into Django using Django's built-in [inspectdb][2] management command. This makes working with existing databases pretty painless.

### To scrape data from web pages: Beautiful Soup

[Beautiful Soup][3] (BS4 as of this writing) makes extracting information out of HTML pages easy. It's our go-to anytime we need to turn unstructured or loosely structured HTML into structured data. It's also great for working with XML data that might otherwise not be readable.

### To work with HTTP content: Requests

[Requests][4] is arguably one of the gold standard libraries for working with HTTP content. Anytime we need to consume an HTML page or even an API, Requests has us covered. It's also very well documented.

### To write command-line utilities: Click

When we need to write a native Python script, [Click][5] is our favorite library for writing command-line utilities. The API is straightforward, well thought out, and there are only a few patterns to remember. The docs are great, which makes looking up advanced features easy.

### To name things: Python Slugify

As we all know, naming things is hard. [Python Slugify][6] is a useful library for turning a title or description into a unique(ish) identifier. If you are working on a web project and you want to use SEO-friendly URLs, Python Slugify makes this easier.

### To work with plugins: Pluggy

[Pluggy][7] is relatively new, but it's also one of the best and easiest ways to add a plugin system to your existing application. If you have ever worked with pytest, you have used pluggy without knowing it.

### To convert CSV files into APIs: Datasette

[Datasette][8], not to be confused with Dataset, is an amazing tool for easily turning CSV files into full-featured read-only REST JSON APIs. Datasette has tons of features, including charting and geo (for creating interactive maps), and it's easy to deploy via a container or third-party web host.

### To handle environment variables and more: Envparse

If you need to parse environment variables because you don't want to save API keys, database credentials, or other sensitive information in your source code, then [envparse][9] is one of your best bets. Envparse handles environment variables, ENV files, variable types, and even pre- and post-processors (in case you want to ensure that a variable is always upper or lower case, for instance).

Do you have a favorite Python library for side projects that's not on this list? Please share it in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/9/python-libraries-side-projects

作者：[Jeff Triplett][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/laceynwilliams
[1]: https://dataset.readthedocs.io/en/latest/
[2]: https://docs.djangoproject.com/en/2.1/ref/django-admin/#django-admin-inspectdb
[3]: https://www.crummy.com/software/BeautifulSoup/
[4]: http://docs.python-requests.org/
[5]: http://click.pocoo.org/5/
[6]: https://github.com/un33k/python-slugify
[7]: https://pluggy.readthedocs.io/en/latest/
[8]: https://github.com/simonw/datasette
[9]: https://github.com/rconradharris/envparse
